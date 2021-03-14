#! /bin/sh

set -e

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)"

if [ "$INTERACTIVE" = "true" ]; then
  MODE="-it"
else
  MODE="-d"
fi

IMG=$(docker build -q $DIR/worker)

docker run --rm \
  --tmpfs /etc/rancher \
  --tmpfs /var/lib \
  --tmpfs /var/run \
  --tmpfs /var/log \
  --tmpfs /tmp \
  --tmpfs /run \
  --privileged \
  --net host \
  --read-only \
  --env-file .env \
  $MODE $IMG
