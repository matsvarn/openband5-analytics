#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Libraries resolve once; subsequent worktree setup preserves that resolution.
if [[ -f pubspec.lock ]]; then
  bash scripts/dart.sh pub get --enforce-lockfile
else
  bash scripts/dart.sh pub get
fi
