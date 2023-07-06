#!/bin/bash


sudo apt-get update -y 
sudo apt install apache2 -y 
sudo service apache2 status >> status.txt
date >> date.txt

