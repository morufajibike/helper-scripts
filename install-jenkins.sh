#!/bin/bash

sudo apt install -y openjdk-8-jre default-jre openjdk-11-jre-headless openjdk-8-jre-headless

wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war

java -jar jenkins.war --httpPort=80 --prefix=/dashboard

# To display the password, enter
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# sudo cat /var/log/jenkins/jenkins.log

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update
sudo apt-get install -y openjdk-8-jre jenkins

sudo systemctl status jenkins

sudo systemctl enable jenkins
