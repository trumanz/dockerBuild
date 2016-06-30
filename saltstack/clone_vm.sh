#!/bin/sh
#docker run -ti  --rm --name=clone_vm  --volume=$(pwd)/etc.salt:/etc/salt/  trumanz/saltstack  salt-cloud -p  pxe_server  pxe5

PXE_SERVER_VM=pxe12

#copy configuraiton
CMD="cp /exdata/*.profile.conf /etc/salt/cloud.profiles.d/"
CMD="$CMD &&  cp  /exdata/*.provider.conf   /etc/salt/cloud.providers.d/"
CMD="$CMD &&  mkdir -p   /etc/salt/cloud.deploy.d/"
CMD="$CMD &&  cp  /exdata/*.deploy.*   /etc/salt/cloud.deploy.d/"

#clone server
CMD="$CMD &&  salt-cloud -p  pxe_server  ${PXE_SERVER_VM} -l debug"
#power it
#https://docs.saltstack.com/en/latest/ref/clouds/all/salt.cloud.clouds.vmware.html
CMD="$CMD &&  salt-cloud -a start ${PXE_SERVER_VM} "

CMD="$CMD &&  bash"

echo $CMD

docker run -ti  --rm  --volume=$(pwd)/data:/exdata  trumanz/saltstack   \
   bash -c "${CMD}"

