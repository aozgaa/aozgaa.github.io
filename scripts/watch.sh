#!/usr/bin/env bash
# Watch blog/*.adoc and blog/docinfo.html for changes and rebuild on save.
# Requires either 'entr' (preferred) or 'inotifywait' (from inotify-tools).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$PATH"

cd "$REPO_ROOT"

# Do an initial build.
make all

if command -v entr &>/dev/null; then
  echo "Watching with entr. Press Ctrl-C to stop."
  find blog -name "*.adoc" -o -name "docinfo.html" | entr -s 'make all && echo "[$(date +%T)] rebuilt"'
elif command -v inotifywait &>/dev/null; then
  echo "Watching with inotifywait. Press Ctrl-C to stop."
  while inotifywait -q -e close_write,moved_to,create blog/*.adoc blog/docinfo.html 2>/dev/null; do
    make all && echo "[$(date +%T)] rebuilt"
  done
else
  echo "ERROR: neither 'entr' nor 'inotifywait' found."
  echo "Install one of:"
  echo "  sudo apt install entr"
  echo "  sudo apt install inotify-tools"
  exit 1
fi
