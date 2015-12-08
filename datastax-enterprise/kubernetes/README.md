reference 
  https://github.com/kubernetes/kubernetes/tree/master/examples/cassandra


sed -i --  "s/- class_name:.*/- class_name: io.k8s.cassandra.KubernetesSeedProvider/g"    $CASS_YAML

