#!/bin/bash
set -e
echo "Installing Claude Code..."

# Ensure curl is available
if ! command -v curl &> /dev/null; then
    echo "curl not found, installing..."
    apt-get update -y
    apt-get install -y --no-install-recommends curl ca-certificates
    rm -rf /var/lib/apt/lists/*
fi

# Determine version argument for the installer
INSTALL_ARGS=""
if [ -n "$VERSION" ] && [ "$VERSION" != "latest" ]; then
    INSTALL_ARGS="$VERSION"
fi

if [ -n "$_REMOTE_USER" ] && [ "$_REMOTE_USER" != "root" ]; then
    echo "Installing Claude Code as user: $_REMOTE_USER"

    # Run the native installer as the remote user
    su "$_REMOTE_USER" -c "curl -fsSL https://claude.ai/install.sh | bash -s $INSTALL_ARGS"

    # Add to PATH in common shell configs if not already there
    REMOTE_USER_HOME=$(eval echo ~$_REMOTE_USER)
    for rc_file in ".bashrc" ".zshrc" ".profile"; do
        rc_path="$REMOTE_USER_HOME/$rc_file"
        if [ -f "$rc_path" ]; then
            if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$rc_path"; then
                su "$_REMOTE_USER" -c "echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> $rc_path"
            fi
        fi
    done

    # Verify installation
    if [ ! -f "$REMOTE_USER_HOME/.local/bin/claude" ]; then
        echo "Error: Claude Code installation failed - executable not found"
        exit 1
    fi

    echo "Claude Code installed successfully at ~/.local/bin/claude"
else
    echo "Installing Claude Code globally as root"

    # Run the native installer as root
    curl -fsSL https://claude.ai/install.sh | bash -s $INSTALL_ARGS

    # Symlink to /usr/local/bin for system-wide access
    if [ -f "$HOME/.local/bin/claude" ]; then
        ln -sf "$HOME/.local/bin/claude" /usr/local/bin/claude
    fi

    # Verify installation
    if ! command -v claude &> /dev/null; then
        echo "Error: Claude Code installation failed"
        exit 1
    fi

    echo "Claude Code installed successfully!"
fi
