#!/bin/bash
set -e

#Get stable vercion of raddit
git clone https://github.com/upsysops/raddit.git

#Instal gems
cd raddit
bundle install

#Start reddit service
sudo systemctl start raddit
sudo systemctl enable raddit
