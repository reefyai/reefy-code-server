# reefy-code-server

Dockerfile + GitHub Actions for the **VS Code** app in the Reefy catalog
(slug: `code-server`).

The image is [code-server](https://github.com/coder/code-server) - VS Code
in the browser - with the Anthropic [Claude Code](https://github.com/anthropics/claude-code)
and OpenAI [Codex](https://github.com/openai/codex) CLIs preinstalled, so
the bundled terminal can drive either agent against the workspace.

## Runtime

| Field | Value |
|---|---|
| `default_port` | `8080` (code-server's built-in) |
| User | `coder` (uid 1000) |
| Volumes | `/home/coder/workspace`, `/home/coder/.local/share/code-server` (extensions), `/home/coder/.config/code-server` (auth + settings) |
| `PASSWORD` env | Set in the Reefy app env field. Empty/unset = code-server auto-generates one to `~/.config/code-server/config.yaml`. |
