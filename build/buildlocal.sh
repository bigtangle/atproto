#!/bin/bash
# to top path
cd ..
# Copy Dockerfiles
cp services/pds/Dockerfile ./Dockerfile.pds
cp services/bsky/Dockerfile ./Dockerfile.bsky
cp services/ozone/Dockerfile ./Dockerfile.ozone

# Build Docker images
docker build -f Dockerfile.pds -t bluesky_pds:latest .
docker build -f Dockerfile.bsky -t bluesky_appview:latest .
docker build -f Dockerfile.ozone -t bluesky_ozone:latest .

rm -f bluesky_pds:latest  Dockerfile.bsky Dockerfile.ozone

# build plc
git clone https://github.com/bluesky-social/indigo.git
cd indigo
docker build -t bluepages  -f cmd/bluepages/Dockerfile .

# build feed generator
 git clone https://github.com/bluesky-social/feed-generator.git
 cd feed-generator
 docker build -t bluesky-feed-generator .
