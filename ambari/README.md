# ambari  image


##1. start repository server
./repo/start_repo_server.sh

##2. start cluster
./sample/start_cluster.sh
**unknown issue:**
The ambari-server start failed, workaroud:
1. enter container "docker exec -ti as  bash"
2. start server "root@as:/# ambari-server start", ignore output
3. check  the java porcess started "root@as:/# ps auxf | grep  AmbariServer"


##3. install components


## reference
[HDPDocuments](http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.0.0/bk_Installing_HDP_AMB/content/_download_the_ambari_repo_ubuntu14.html)

README.md


