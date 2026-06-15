#!/usr/bin/env bash
# Expands ${XSKILL_API_KEY} in mcp-config.json using values from .env
# Usage: ./generate-mcp-config.sh
# Output: prints the expanded JSON (pipe to ~/.cursor/mcp.json to install)
# Uses Python so gettext/envsubst is not required.

set -e
cd "$(dirname "$0")"

if [[ ! -f .env ]]; then
  echo "Missing .env — copy .env.example to .env and add your XSKILL_API_KEY"
  exit 1
fi

exec python3 - << 'PY'
import json
from pathlib import Path

def load_dotenv(p: Path) -> dict:
    out = {}
    for line in p.read_text().splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        if "=" in line:
            k, _, v = line.partition("=")
            out[k.strip()] = v.strip().strip('"').strip("'")
    return out

root = Path.cwd()
env = load_dotenv(root / ".env")
key = env.get("XSKILL_API_KEY", "").strip()
if not key:
    raise SystemExit("XSKILL_API_KEY missing in .env")

raw = (root / "mcp-config.json").read_text()
if "${XSKILL_API_KEY}" not in raw:
    raise SystemExit("mcp-config.json missing ${XSKILL_API_KEY} placeholder")
raw = raw.replace("${XSKILL_API_KEY}", key)
data = json.loads(raw)
print(json.dumps(data, indent=2, ensure_ascii=False))
PY
