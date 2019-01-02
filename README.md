# penguin-lamp
## A Puppet manifest for provisioning a LAMP stack on Chome OS Crostini

Existing guides on how to do this are little out of date and thin on the ground. I'm coming at this from Chrome OS Version 71, 
which (counter to most guides out there) has the beta Penguin Linux container ready to use on the stable Chrome OS channel. 

My ideal preference was to build a stable development environment without jumping on to the dev or beta channels. 
I'm not entirely sure of the downsides of that route - but anecdotally it seems you may loose out on some built in security.
This write up is from a box-fresh Pixelbook (8GB ram model) on Chrome OS version 71.

## Update your box-fresh Linux container

```
sudo apt-get update
sudo apt-get upgrade
```

## Installing Puppet

First off - wget is missing, so we'll need to manually grab that.

`sudo apt-get install wget`

Get Puppet, and install

```
wget https://apt.puppetlabs.com/puppet6-release-stretch.deb
sudo dpkg -i puppet6-release-stretch.deb
sudo apt-get update
sudo apt-get install -y puppet-agent
```
  
## Add puppet to your PATH

`sudo visudo`

Append this to your secure path; `:/opt/puppetlabs/puppet/bin`

## Clone this repo

```
rm -Rf /etc/puppetlabs/code/environments/production/*
cd /etc/puppetlabs/code/environments/production
git clone https://github.com/moth/penguin-lamp .
```

## Apply Puppet

`sudo puppet apply manifests`
