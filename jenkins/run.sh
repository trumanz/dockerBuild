#!/bin/sh
docker run -d -ti  --name="jenkins-server" -p 8080:8080 trumanz/jenkins  /bin/bash
docker exec  -ti  jenkins-server  /etc/init.d/jenkins start
sleep 2
docker exec -ti   jenkins-server bash -c  'cat /var/lib/jenkins/secrets/initialAdminPassword'


