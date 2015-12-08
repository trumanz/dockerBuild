#!/bin/sh


kubectl create -f yaml/cassandra-service.yaml

kubectl create -f yaml/cassandra.yaml
