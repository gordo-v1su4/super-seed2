#!/usr/bin/env bash
# Expands ${XSKILL_API_KEY} in mcp-config.json using values from .env
# Usage: ./generate-mcp-config.sh
# Output: prints the expanded JSON (pipe to ~/.cursor/mcp.json to install)

set -e
cd "$(dirname "$0")"

if [[ ! -f .env ]]; then
  echo "Missing .env — copy .env.example to .env and add your XSKILL_API_KEY"
  exit 1
fi

export $(grep -v '^#' .env | xargs)
envsubst < mcp-config.json
