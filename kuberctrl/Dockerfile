FROM  trumanz/ubuntu14.04-dev

#reference
#http://kubernetes.io/docs/getting-started-guides/vsphere/

RUN wget --no-check-certificate  https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
RUN wget --no-check-certificate  https://github.com/vmware/govmomi/releases/download/v0.8.0/govc_linux_amd64.gz
RUN curl --insecure  --remote-name-all https://storage.googleapis.com/govmomi/vmdk/2016-01-08/kube.vmdk.gz{,.md5}
RUN wget --no-check-certificate https://github.com/kubernetes/kubernetes/releases/download/v1.5.1/kubernetes.tar.gz

RUN  tar -C /usr/local -xzf   go1.7.4.linux-amd64.tar.gz

RUN gzip -d govc_linux_amd64.gz
RUN chmod +x govc_linux_amd64
RUN mv govc_linux_amd64 /usr/local/bin/govc

RUN md5sum -c kube.vmdk.gz.md5
RUN gzip -d kube.vmdk.gz

RUN tar xf kubernetes.tar.gz
#disalbe cert checking while curl download package
RUN sed -i 's/-fL/-fL -k/'  /kubernetes/cluster/get-kube-binaries.sh
RUN env  KUBERNETES_PROVIDER=vsphere  KUBERNETES_SKIP_CONFIRM='xx'   /kubernetes/cluster/get-kube-binaries.sh

RUN ssh-keygen  -f  /root/.ssh/id_rsa  -N ""
env PATH  /usr/local/go/bin:$PATH
