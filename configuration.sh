#!/bin/bash
set -e

#Install ruby and bundler
apt-get update
apt-get install -y ruby-full build-essential git wget
gem install --no-rdoc --no-ri bundler

#Install MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" > /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
apt-get install -y mongodb-org

#Start MongoDB
systemctl start mongod
systemctl enable mongod

#Get reddit sevice
wget https://raw.githubusercontent.com/upsysops/stuff/master/raddit.service
mv raddit.service /etc/systemd/system/raddit.service
