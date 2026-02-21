# OpenClaw Optional Integration

If OpenClaw is installed:
- Enable scheduler hooks
- Enable channel relay/Discord logging
- Enable memory sync jobs
- Optionally install Discord ops sync cron (`scripts/install_discord_ops_cron.sh`)

If OpenClaw is not installed:
- Skip these integrations
- Keep local dotfiles + Claude/Codex workflow operational

Detection command:
```bash
command -v openclaw >/dev/null && echo yes || echo no
```
