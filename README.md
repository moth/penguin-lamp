# penguin-lamp
## A Puppet manifest for provisioning a LAMP stack on Chome OS Crostini

Existing guides on how to do this are little out of date and thin on the ground. I'm coming at this from Chrome OS Version 71, 
which (counter to most guides out there) has the beta Penguin Linux container ready to use on the stable Chrome OS channel. 

My ideal preference was to build a stable development environment without jumping on to the dev or beta channels. 
I'm not entirely sure of the downsides of that route - but anecdotally it seems you may loose out on some built in security.
This write up is from a box-fresh Pixelbook (8GB ram model) on Chrome OS version 71.

The main goal is to set up a bare-bones LAMP stack consisting of *mysql*, *apache*, *php* for *development use only*. I've opted to use standard Puppet Forge modules, available via r10k.

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

## Install r10k (Puppet Module manager)

`sudo gem install r10k` 

## Clone this repo

```
rm -Rf /etc/puppetlabs/code/environments/production/*
cd /etc/puppetlabs/code/environments/production
git clone https://github.com/moth/penguin-lamp .
```

## Apply Puppet

`sudo puppet apply manifests`

## Virtualhosts

This mainfest will add two 

## A few useful notes

`manifests/links.pp` installs a couple of handy symlinks which enables you edit your Puppet and www files locally on Chome OS by linking then to your home directory.

## A few useful extra tools

### DNS/Hosts

You can not edit your hosts file on Chrome OS. I've used a free account from https://www.noip.com to get around this limitation for now. Use `hostname -I` to get your IP and map a free subdomain to it.

### Chrome OS text editors

I like caret > http://thomaswilburn.net/caret

## Credits

This borrows heavily from everything I've gleaned from github.com/bitfield and his excellent Puppet Beginner's Guide books. He's a great mentor and consultant.
