#!/bin/sh
docker run -d -ti  --name="jenkins-server" -p 8080:8080 trumanz/jenkins  /bin/bash

