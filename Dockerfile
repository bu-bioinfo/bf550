# syntax=docker/dockerfile:1
# Local replica of the GitHub Actions job in .github/workflows/jekyll.yml, so the site you see
# at http://localhost:4000 is built by the same tools, at the same versions, as the one that
# deploys. Used through `make dev` / `make site` (see Makefile and compose.yaml).
#
# Version pins mirror the workflow: Ruby 3.3 (setup-ruby), Python 3.12 (setup-python), Quarto
# 1.10.18 (quarto-actions). The runner is Ubuntu; this is Debian bookworm because the Ruby
# image is Debian and because Debian's `chromium` package works inside a container on both
# amd64 and arm64 -- Ubuntu's is a snap stub and Google Chrome has no arm64 Linux build.
ARG RUBY_VERSION=3.3
FROM ruby:${RUBY_VERSION}-bookworm

ARG QUARTO_VERSION=1.10.18
ARG PYTHON_VERSION=3.12
ENV DEBIAN_FRONTEND=noninteractive

# Chromium (PDF export), Node (decktape), fonts so PDFs match the browser.
RUN apt-get update && apt-get install -y --no-install-recommends \
        chromium fonts-liberation fonts-dejavu-core nodejs npm curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Quarto, the same release CI pins, for whichever CPU this image is built on.
RUN arch="$(dpkg --print-architecture)" \
    && curl -fsSL -o /tmp/quarto.deb \
       "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${arch}.deb" \
    && dpkg -i /tmp/quarto.deb && rm /tmp/quarto.deb \
    && quarto --version

# Python 3.12 (uv manages the interpreter; Debian ships 3.11) with the decks' requirements.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
ENV UV_PYTHON_INSTALL_DIR=/opt/uv/python
COPY slides/requirements.txt /tmp/requirements.txt
RUN uv venv /opt/venv --python "${PYTHON_VERSION}" \
    && uv pip install --python /opt/venv/bin/python -r /tmp/requirements.txt \
    && chmod -R a+rX /opt/uv /opt/venv
ENV PATH=/opt/venv/bin:$PATH \
    QUARTO_PYTHON=/opt/venv/bin/python

# decktape, preinstalled so no network is needed at PDF time; it drives the system Chromium.
ENV PUPPETEER_SKIP_DOWNLOAD=true \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    CHROME_PATH=/usr/bin/chromium
RUN npm install -g decktape@3 && decktape version

# Gems, installed into the image (GEM_HOME=/usr/local/bundle, the Ruby image default) so the
# bind-mounted repository never needs a vendor/ directory. Same two commands as CI.
WORKDIR /site
COPY Gemfile ./
RUN bundle lock --add-platform x86_64-linux aarch64-linux && bundle install \
    && chmod -R a+rX /usr/local/bundle

# The repository is bind-mounted at /site (compose.yaml); nothing else is copied in.
COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tools/build_site.sh"]
