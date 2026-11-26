# Derived from the upstream image running in prod (k8s_apps/nextcloud/values.yaml).
# The packages the current deployment installs at pod start via the helm postStart
# hook (apt update + apt install at every pod start, on a Pi) are baked in here.
# Bump the version here and in .github/workflows/build.yml together.
ARG NEXTCLOUD_VERSION=35.0.3
FROM docker.io/nextcloud:${NEXTCLOUD_VERSION}-apache

# recommends kept: same set as the prod postStart apt install (ghostscript fonts,
# imagemagick delegates)
RUN apt-get update \
 && apt-get install -y vim imagemagick ffmpeg ghostscript \
 && rm -rf /var/lib/apt/lists/*
