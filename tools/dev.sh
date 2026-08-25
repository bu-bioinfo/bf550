#!/usr/bin/env bash
# The two live-reload watchers `make dev` runs (one per compose service; see compose.yaml).
#
#   tools/dev.sh jekyll   serve the site at :4000, rebuilding on every edit, browser auto-refresh
#   tools/dev.sh slides   render slides/ on every edit and serve the decks at :4200 with reload
#
# Both write into _site/. Jekyll keeps _site/slides across its rebuilds (`keep_files`) and never
# reads slides/ (`exclude`), so the watchers do not trip over each other. Runs on the host too,
# if you have the tools installed.
set -euo pipefail
cd "$(dirname "$0")/.."

case "${1:-}" in
  jekyll)
    args=(--host 0.0.0.0 --port 4000 --livereload --livereload-port 35729 --watch --incremental)
    [[ "${JEKYLL_FORCE_POLLING:-0}" == "1" ]] && args+=(--force_polling)
    exec bundle exec jekyll serve "${args[@]}" ;;
  slides)
    # `quarto preview` on the project renders every deck once, then re-renders a deck when its
    # source changes and reloads any browser tab showing it.
    exec quarto preview slides --no-browser --host 0.0.0.0 --port 4200 ;;
  *)
    echo "usage: tools/dev.sh jekyll|slides" >&2; exit 2 ;;
esac
