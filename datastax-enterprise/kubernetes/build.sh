#!/bin/sh


cd SeedProvider/ && \
mvn package  && \
cd - && \
docker build  -t  trumanz/dse4kube ./
