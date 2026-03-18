#!/usr/bin/env bash
# Build all AsciiDoc blog posts to HTML.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$PATH"

cd "$REPO_ROOT"
make all
echo "Build complete."
