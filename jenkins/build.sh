#!/bin/sh
cp  ../keys/*  ./

docker build  -t  trumanz/jenkins  ./
