#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "Installing Codex CLI..."

# Install Node.js if not available
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing Node.js 20.x via NodeSource..."
    apt-get update -y
    apt-get install -y --no-install-recommends curl ca-certificates
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
    apt-get install -y --no-install-recommends nodejs
    rm -rf /var/lib/apt/lists/*
fi

# Check Node.js version (requires 18+)
NODE_VERSION=$(node --version | sed 's/v//')
MAJOR_VERSION=$(echo $NODE_VERSION | cut -d. -f1)

if [ "$MAJOR_VERSION" -lt 18 ]; then
    echo "Error: Node.js 18+ is required, but found version $NODE_VERSION"
    exit 1
fi

# Check if npm is available
if ! command -v npm &> /dev/null; then
    echo "Error: npm is required but not found."
    exit 1
fi

# Install Codex CLI - prefer remote user installation if available
if [ -n "$_REMOTE_USER" ] && [ "$_REMOTE_USER" != "root" ]; then
    echo "Installing Codex CLI as user: $_REMOTE_USER"
    NPM_PATH=$(which npm)
    BIN_DIR=$(dirname "$NPM_PATH")
    su "$_REMOTE_USER" -c "PATH=$BIN_DIR:\$PATH $NPM_PATH install -g @openai/codex"
else
    echo "Installing Codex CLI globally as root"
    npm install -g @openai/codex
fi

# Verify installation
if ! command -v codex &> /dev/null; then
    echo "Error: Codex CLI installation failed"
    exit 1
fi

echo "Codex CLI installed successfully!"