# Enable the Puppet repositories
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb

sudo dpkg -i puppetlabs-release-pc1-trusty.deb

sudo apt-get update

# Install the Puppet server and start it with
sudo apt-get install -y puppetserver

sudo service puppetserver start