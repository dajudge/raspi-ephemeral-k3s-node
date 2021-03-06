#! /bin/sh

set -e

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)"

. $DIR/.env

IP=$(ip addr show dev $PUBLIC_INTERFACE | grep '^\s*inet\s' | awk '{print $2}' | sed 's/\/.*//')
NODE_NAME="raspi-$(echo $IP)"

k3s agent --token $K3S_TOKEN \
  --server $K3S_URL \
  --node-ip $IP --node-external-ip $IP \
  --node-name $NODE_NAME \
  --docker
