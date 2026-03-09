#!/bin/bash
# mirror-site.sh
# Downloads a full website for offline browsing using wget.
# Usage: ./mirror-site.sh https://example.com

URL=$1

if [ -z "$URL" ]; then
  echo "Usage: ./mirror-site.sh <URL>"
  echo "Example: ./mirror-site.sh https://example.com"
  exit 1
fi

wget \
  --mirror \
  --convert-links \
  --adjust-extension \
  --page-requisites \
  --no-parent \
  --wait=2 \
  --random-wait \
  --limit-rate=200k \
  -c \
  "$URL"
