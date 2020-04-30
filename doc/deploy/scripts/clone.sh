#!/bin/sh
rm sources -rf
mkdir sources
cd sources

echo === Cloning backend webservices  ===

git clone --single-branch -b master git@github.com:trekkshop/backend-operations.git

echo === Creating deploy scripts ===
cd ..
rm start.sh remove.sh stop.sh docker-compose.yml
cp ./sources/backend-operations/doc/deploy/scripts/start.sh ./
cp ./sources/backend-operations/doc/deploy/scripts/remove.sh ./
cp ./sources/backend-operations/doc/deploy/scripts/reboot.sh ./
cp ./sources/backend-operations/doc/deploy/scripts/stop.sh ./
cp ./sources/backend-operations/doc/deploy/scripts/docker-compose.yml ./

chmod 755 remove.sh start.sh stop.sh reboot.sh