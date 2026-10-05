#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Use a host SDK. Worktree setup never installs or updates one.
dart_bin=${DART_BIN:-}
if [[ -z "$dart_bin" ]]; then
  dart_bin=$(command -v dart || true)
fi
if [[ -z "$dart_bin" ]]; then
  candidate="$HOME/.local/share/flutter/3.41.6/bin/cache/dart-sdk/bin/dart"
  if [[ -x "$candidate" ]]; then dart_bin=$candidate; fi
fi
if [[ -z "$dart_bin" ]]; then
  echo "Dart is missing. Install an SDK matching pubspec.yaml, then set DART_BIN=/absolute/path/to/dart. See README.md." >&2
  exit 1
fi
exec "$dart_bin" "$@"
