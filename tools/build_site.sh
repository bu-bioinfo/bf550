#!/usr/bin/env bash
# The production build, start to finish: what CI runs before it uploads _site/, and what
# `make site` runs locally. One script so the two cannot drift.
#
#   tools/build_site.sh                # build into _site/ with the site's configured baseurl
#   BASEURL=/preview tools/build_site.sh   # override the baseurl (CI passes the Pages base path)
set -euo pipefail
cd "$(dirname "$0")/.."

echo "==> Jekyll"
JEKYLL_ENV=production bundle exec jekyll build ${BASEURL+--baseurl "$BASEURL"}

echo "==> Slide decks and PDFs"
tools/build_slides.sh --pdf

# Gate on the built output, not the sources: a file publishes unless something excludes it.
echo "==> Content gate"
python3 tools/lint_no_instructor_content.py _site
