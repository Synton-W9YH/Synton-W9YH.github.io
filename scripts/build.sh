#!/usr/bin/env bash
# Builds this Obsidian vault into a static site with Quartz 5.
# Used by CI (.github/workflows/deploy.yml) and for local previews:
#   scripts/build.sh            -> builds into ./public
#   scripts/build.sh --serve    -> builds and serves at http://localhost:8080
set -euo pipefail

QUARTZ_VERSION="${QUARTZ_VERSION:-v5.1.0}"
VAULT="$(cd "$(dirname "$0")/.." && pwd)"
QUARTZ_DIR="$VAULT/.quartz-build"

if [ ! -d "$QUARTZ_DIR/.git" ] || [ "$(git -C "$QUARTZ_DIR" describe --tags 2>/dev/null)" != "$QUARTZ_VERSION" ]; then
  rm -rf "$QUARTZ_DIR"
  git -c advice.detachedHead=false clone --quiet --depth 1 --branch "$QUARTZ_VERSION" \
    https://github.com/jackyzha0/quartz.git "$QUARTZ_DIR"
fi

cp "$VAULT/quartz.config.yaml" "$QUARTZ_DIR/quartz.config.yaml"
[ -f "$VAULT/quartz.lock.json" ] && cp "$VAULT/quartz.lock.json" "$QUARTZ_DIR/quartz.lock.json"

cd "$QUARTZ_DIR"
npm ci --no-audit --no-fund
npx quartz plugin install --from-config
npx quartz build -d "$VAULT" -o "$VAULT/public" "$@"
