FROM codercom/code-server:latest

USER root

# git/curl/python toolchain for the IDE itself; nodejs for the Anthropic
# Claude Code + OpenAI Codex CLIs we install via npm. Clean apt cache in
# the same layer so the final image stays under the upstream base size.
RUN apt-get update && apt-get install -y --no-install-recommends \
        git curl ca-certificates build-essential python3 python3-pip \
 && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
 && apt-get install -y --no-install-recommends nodejs \
 && npm install -g @anthropic-ai/claude-code @openai/codex \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER coder
WORKDIR /home/coder/workspace
