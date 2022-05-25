#!/bin/bash
sudo apt update
sudo apt install -y openjdk-8-jdk
echo 'Acquire::https::pkg.jenkins.io::Verify-Peer "false";' > /etc/apt/apt.conf.d/99jenkins-cert #Cert problem ignore
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9B7D32F2D50582E6
wget --no-check-certificate -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

