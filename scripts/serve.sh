#!/usr/bin/env bash
# Start a local HTTP server for previewing the site.
# Default port 8080; override with PORT=NNNN ./serve.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PORT="${PORT:-8080}"

echo "Serving at http://localhost:${PORT}/"
echo "Blog posts: http://localhost:${PORT}/blog/"
echo "Press Ctrl-C to stop."

cd "$REPO_ROOT"
python3 -m http.server "$PORT"
