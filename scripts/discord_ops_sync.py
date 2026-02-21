#!/usr/bin/env python3
"""Optional Discord -> markdown/json memory sync for OpenClaw workspaces."""

from __future__ import annotations

import argparse
import json
import os
import re
from datetime import datetime, timezone, timedelta
from pathlib import Path
from urllib import parse, request

KST = timezone(timedelta(hours=9))

DECISION_KW = ["결정", "확정", "채택", "정하자", "decision", "approved"]
TASK_KW = ["작업", "TODO", "todo", "해줘", "요청", "implement", "fix"]
RISK_KW = ["이슈", "문제", "리스크", "막힘", "장애", "incident", "blocked"]


def load_json(path: Path, default):
    if not path.exists():
        return default
    return json.loads(path.read_text(encoding="utf-8"))


def save_json(path: Path, obj):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, ensure_ascii=False, indent=2), encoding="utf-8")


def discord_get(token: str, endpoint: str):
    req = request.Request(
        f"https://discord.com/api/v10{endpoint}",
        headers={
            "Authorization": f"Bot {token}",
            "User-Agent": "awesome-dotfiles-discord-ops/1.0",
        },
    )
    with request.urlopen(req, timeout=20) as resp:
        return json.loads(resp.read().decode("utf-8"))


def fmt_kst(iso_ts: str):
    dt = datetime.fromisoformat(iso_ts.replace("Z", "+00:00")).astimezone(KST)
    return dt.strftime("%Y-%m-%d %H:%M:%S KST"), dt.strftime("%Y-%m-%d")


def append_line(path: Path, line: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a", encoding="utf-8") as f:
        f.write(line + "\n")


def append_conversation(workspace: Path, day: str, lines: list[str]):
    p = workspace / "team" / "CONVERSATIONS" / "discord" / f"{day}.md"
    if not p.exists():
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(f"# Discord Conversations — {day}\n\n", encoding="utf-8")
    with p.open("a", encoding="utf-8") as f:
        for line in lines:
            f.write(line + "\n")
        f.write("\n")


def has_kw(text: str, kws: list[str]) -> bool:
    low = text.lower()
    return any(k.lower() in low for k in kws)


def triage(workspace: Path, speaker: str, content: str, ts: str, channel_name: str):
    team = workspace / "team"
    if has_kw(content, DECISION_KW):
        append_line(team / "DECISIONS.md", f"- Date: {ts} | Owner: {speaker} | Decision: {content} | Source: discord/#{channel_name}")
    if has_kw(content, TASK_KW):
        append_line(team / "TASKS.md", f"- [ ] {content} (Owner: {speaker}, Source: discord/#{channel_name}, Time: {ts})")
    if has_kw(content, DECISION_KW) or has_kw(content, TASK_KW) or has_kw(content, RISK_KW):
        append_line(team / "MEETINGS.md", f"- {ts} | {speaker} | {content}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--workspace", default=os.path.expanduser("~/.openclaw/workspace"))
    ap.add_argument("--channel-map", required=True, help="JSON file with channels to sync")
    args = ap.parse_args()

    workspace = Path(args.workspace).expanduser().resolve()
    channel_map = Path(args.channel_map).expanduser().resolve()

    token = os.getenv("DISCORD_BOT_TOKEN", "").strip()
    if not token:
        raise SystemExit("DISCORD_BOT_TOKEN is missing")

    conf = load_json(channel_map, {})
    channels = conf.get("channels", [])
    if not channels:
        raise SystemExit("channel map has no channels")

    state_path = workspace / "team" / "automation" / "discord-ops-state.json"
    state = load_json(state_path, {"last_message_id_by_channel": {}})
    last_by = state.setdefault("last_message_id_by_channel", {})

    events = 0
    for ch in channels:
        cid = str(ch.get("id", "")).strip()
        cname = ch.get("name", cid)
        if not cid:
            continue

        q = {"limit": "50"}
        if last_by.get(cid):
            q["after"] = str(last_by[cid])
        endpoint = f"/channels/{cid}/messages?{parse.urlencode(q)}"

        try:
            messages = discord_get(token, endpoint)
        except Exception:
            continue

        if not isinstance(messages, list):
            continue

        for m in reversed(messages):
            mid = m.get("id")
            if mid:
                last_by[cid] = mid

            content = (m.get("content") or "").strip()
            if not content:
                continue

            author = m.get("author") or {}
            speaker = author.get("global_name") or author.get("username") or "unknown"
            ts, day = fmt_kst(m.get("timestamp", datetime.now(timezone.utc).isoformat()))

            append_conversation(
                workspace,
                day,
                [
                    f"- Time (KST): {ts}",
                    f"- Channel: discord/#{cname}",
                    f"- Speaker: {speaker}",
                    f"- Raw: {content}",
                    "- Tags: #discord #ops",
                ],
            )

            mem_jsonl = workspace / "team" / "memory" / "events.jsonl"
            mem_jsonl.parent.mkdir(parents=True, exist_ok=True)
            with mem_jsonl.open("a", encoding="utf-8") as f:
                f.write(json.dumps({
                    "time": ts,
                    "channel": f"discord/{cname}",
                    "speaker": speaker,
                    "content": content,
                }, ensure_ascii=False) + "\n")

            triage(workspace, speaker, content, ts, cname)
            events += 1

    save_json(state_path, state)
    print(f"synced_events: {events}")


if __name__ == "__main__":
    main()
