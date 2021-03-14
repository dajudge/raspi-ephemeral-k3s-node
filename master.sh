#! /bin/sh

set -e

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)"

if [ "$INTERACTIVE" = "true" ]; then
  MODE="-it"
else
  MODE="-d"
fi

IMG=$(docker build -q $DIR/master)

. $DIR/.env

if [ -z "$DATADIR" ]; then
  DATA_DIR=$DIR/.data/data
fi

docker run --rm \
  -v $DIR/.data/output:/output \
  --tmpfs /run \
  --tmpfs /var \
  --tmpfs /tmp \
  -v $DIR/.data/etc_rancher:/etc/rancher \
  -v $DIR/.data/var_lib:/var/lib \
  -v $DIR/.data/output:/output \
  -v $DATA_DIR:/data \
  --read-only \
  -e K3S_KUBECONFIG_OUTPUT=/output/kubeconfig.yaml \
  --privileged \
  --net host \
  $MODE $IMG k3s server --token $K3S_TOKEN --node-external-ip=$K3S_NODE_EXTERNAL_IP
