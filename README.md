# Dev Container Features Collection

A collection of custom [Dev Container Features](https://containers.dev/implementors/features/) for enhancing development containers with additional tools and utilities.

## Available Features

| Feature | Description | Repository |
|---------|-------------|------------|
| [adr-tools](https://github.com/iot-rocket/devcontainer-features/tree/main/src/adr-tools) | Architecture Decision Records management tools | `ghcr.io/iot-rocket/devcontainer-features/adr-tools` |
| [chrome](https://github.com/iot-rocket/devcontainer-features/tree/main/src/chrome) | Google Chrome with container-optimized wrapper script | `ghcr.io/iot-rocket/devcontainer-features/chrome` |
| [claude-code](https://github.com/iot-rocket/devcontainer-features/tree/main/src/claude-code) | Claude Code CLI for AI-powered development assistance | `ghcr.io/iot-rocket/devcontainer-features/claude-code` |
| [codex](https://github.com/iot-rocket/devcontainer-features/tree/main/src/codex) | OpenAI Codex CLI for local AI-powered coding assistance | `ghcr.io/iot-rocket/devcontainer-features/codex` |
| [gemini-cli](https://github.com/iot-rocket/devcontainer-features/tree/main/src/gemini-cli) | Google Gemini CLI for AI-powered development assistance | `ghcr.io/iot-rocket/devcontainer-features/gemini-cli` |
| [imagemagick](https://github.com/iot-rocket/devcontainer-features/tree/main/src/imagemagick) | ImageMagick image processing library with PDF support | `ghcr.io/iot-rocket/devcontainer-features/imagemagick` |
| [mc](https://github.com/iot-rocket/devcontainer-features/tree/main/src/mc) | MinIO Client for object storage operations | `ghcr.io/iot-rocket/devcontainer-features/mc` |
| [mcp-language-server](https://github.com/iot-rocket/devcontainer-features/tree/main/src/mcp-language-server) | MCP Language Server for semantic code navigation | `ghcr.io/iot-rocket/devcontainer-features/mcp-language-server` |
| [typst](https://github.com/iot-rocket/devcontainer-features/tree/main/src/typst) | Typst markup-based typesetting system | `ghcr.io/iot-rocket/devcontainer-features/typst` |
| [yek](https://github.com/iot-rocket/devcontainer-features/tree/main/src/yek) | Repository file serialization tool for LLM consumption | `ghcr.io/iot-rocket/devcontainer-features/yek` |
| [yq](https://github.com/iot-rocket/devcontainer-features/tree/main/src/yq) | YAML, JSON, XML, and CSV processor | `ghcr.io/iot-rocket/devcontainer-features/yq` |

## Usage

Add features to your `devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/iot-rocket/devcontainer-features/chrome:1": {},
        "ghcr.io/iot-rocket/devcontainer-features/yq:1": {},
        "ghcr.io/iot-rocket/devcontainer-features/imagemagick:1": {}
    }
}
```

## Links

- [Latest releases of the features on GitHub](https://github.com/iot-rocket?tab=packages&repo_name=devcontainer-features)
- [Dev Container Features specification](https://containers.dev/implementors/features/)
