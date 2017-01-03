#!/usr/bin/env bash
cd $(dirname $0)

if [ ! -f ./govc.env ]; then
   echo "Pleas create a govc.env  on current path,  refer govc.env.example"
fi

source  ./govc.env

cd /
govc import.vmdk kube.vmdk ./kube/




