#!/usr/bin/env bash
# Build all AsciiDoc blog posts to HTML.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# Look in both the p620 gem dir and whatever this machine's user gem dir is.
export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$(ruby -e 'print Gem.user_dir' 2>/dev/null)/bin:$PATH"

cd "$REPO_ROOT"
make all
echo "Build complete."
