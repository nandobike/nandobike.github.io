#!/usr/bin/env bash
# Copy the Live HRTEM page from its source repo (fresnel-vis) into assets/livetem/.
# fresnel-vis/livetem is the only place to edit it; this folder is a published copy.
#
#   bin/sync-livetem.sh [path/to/fresnel-vis]     (default: ../fresnel-vis)
#
# Refuses to copy uncommitted changes, so every published copy maps to a commit,
# recorded in assets/livetem/SOURCE.
set -euo pipefail

SITE="$(cd "$(dirname "$0")/.." && pwd)"
SRC_REPO="$(cd "${1:-$SITE/../fresnel-vis}" && pwd)"
SRC="$SRC_REPO/livetem"
DST="$SITE/assets/livetem"

[ -f "$SRC/index.html" ] || { echo "No livetem/index.html in $SRC_REPO" >&2; exit 1; }
if [ -n "$(git -C "$SRC_REPO" status --porcelain -- livetem)" ]; then
  echo "fresnel-vis/livetem has uncommitted changes; commit them first." >&2
  exit 1
fi

rm -rf "$DST"
mkdir -p "$DST"
cp -r "$SRC/index.html" "$SRC/structures.json" "$SRC/LICENSE.txt" "$SRC/atoms" "$DST/"

commit="$(git -C "$SRC_REPO" rev-parse --short HEAD)"
version="$(grep -oE 'const VERSION = "[^"]+"' "$SRC/index.html" | cut -d'"' -f2)"
printf 'Copied from fresnel-vis/livetem, v%s, commit %s. Edit it there, then run bin/sync-livetem.sh.\n' \
  "$version" "$commit" > "$DST/SOURCE"
echo "assets/livetem <- fresnel-vis@$commit (v$version)"
