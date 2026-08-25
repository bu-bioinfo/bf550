#!/usr/bin/env bash
# Runs inside the container (see Dockerfile). The repository is bind-mounted at /site, so
# Gemfile.lock may be missing or from another machine: make sure the gems installed in the
# image satisfy it before handing over to the requested command.
set -euo pipefail
cd /site
if ! bundle check >/dev/null 2>&1; then
  echo "entrypoint: Gemfile.lock does not match the image's gems; installing" >&2
  bundle install
fi
exec "$@"
