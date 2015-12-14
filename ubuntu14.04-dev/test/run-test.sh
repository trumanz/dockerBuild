#!/bin/sh

#total 20M, 10M memory + 10M swap-memory
docker run --rm -i -t  -m 10M  --memory-swap=20M  -v `pwd`:/data trumanz/ubuntu14.04-dev  /bin/bash -c  "cd /data/ && g++ memtest.cpp -o /tmp/a.out && /tmp/a.out"

