#!/usr/bin/env bash
# Runs inside the container (see Dockerfile). The repository is bind-mounted at /site, so
# Gemfile.lock may be missing, from another machine, or older than the image: make sure the
# gems installed in the image satisfy it before handing over to the requested command.
#
# When it does not match, the lock is what gives way, not the image. The image resolves the
# Gemfile at build time into GEM_HOME=/usr/local/bundle, which is root-owned and read-only to
# the uid we run as, so `bundle install` against a stale lock cannot fetch the versions it
# names -- it fails with Bundler::PermissionError, naming a directory rather than the version
# drift that is the actual cause. Gemfile.lock is gitignored: it is a local artifact of
# whichever image last ran, never an input to the build, so discarding it costs nothing and
# lets bundler re-resolve against the gems that are actually here. Rebuild the image
# (`make image`) to change which versions those are.
set -euo pipefail
cd /site
if ! bundle check >/dev/null 2>&1; then
  echo "entrypoint: Gemfile.lock does not match the image's gems; re-resolving" >&2
  rm -f Gemfile.lock
  bundle install
fi
exec "$@"
