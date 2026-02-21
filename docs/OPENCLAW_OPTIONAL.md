# OpenClaw Optional Integration

If OpenClaw is installed:
- Enable scheduler hooks
- Enable channel relay/Discord logging
- Enable memory sync jobs

If OpenClaw is not installed:
- Skip these integrations
- Keep local dotfiles + Claude/Codex workflow operational

Detection command:
```bash
command -v openclaw >/dev/null && echo yes || echo no
```
