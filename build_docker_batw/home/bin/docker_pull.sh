#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "pull docker image from BMW image repository and re-tag it (remove BMW prefix)"
    echo "usage: $0 <image_name>"
    exit 1
fi

set -o errexit

echo "pulling from $DOCKERREPO/$1"
docker pull $DOCKERREPO/$1

echo ""
echo "re-tag the image $DOCKERREPO/$1 => $1"
echo "TODO: if provided image is does not contain a suffix, add default 'latest'"
docker tag $DOCKERREPO/$1 $1

