#!/bin/sh
rm sources -rf
mkdir sources
cd sources

echo === Cloning backend webservices  ===

if [[ $# == 1 ]];then
    git clone --single-branch -b $1 git@github.com:trekkshop/backend-operations.git
else
    git clone --single-branch -b master ggit@github.com:trekkshop/backend-operations.git
fi

echo === Creating deploy scripts ===
cd ..
rm start.sh remove.sh stop.sh docker-compose.yml
cp ./sources/backend-operations/doc/deploy/scripts/{start.sh,remove.sh,stop.sh,docker-compose.yml} ./

chmod 755 remove.sh start.sh stop.sh remove-start.sh