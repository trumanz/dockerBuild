#!/usr/bin/env bash

docker run --rm -ti   -v  $(pwd):/data  trumanz/kubectrl   /data/import.vmdk.imp.sh


