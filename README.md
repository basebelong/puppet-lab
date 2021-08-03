# puppet-lab

<img style="margin: auto" src="./icon.svg" width="4rem">

## Environment for puppet practice

**This project is to be regarded as alpha quality. DO NOT run anything from this
repo without carefully reading the scripts first!**

To avoid using heavy vm's or (for labbing) expensive cloud-instances - LXD is 
the obvious solution!
The setup script will create a separate networkbridge for this lab named
'puppetbr0' to avoid polluting your LXD environment.
Several containers are created. One 'puppetmaster' and by default 8 'server-n'
containers as preconfigured agents.

LXD needs to be installed and configured first. See [Linux Containers](https://linuxcontainers.org/lxd/getting-started-cli/)

## Setup

  1. Edit puppet-profile-{agent,master}.yaml in the lab_setup direcrtory.
  2. Set the variable 'n_pups' in 'lab_setup/setup' (number of agent-containers).
     Defaults to 'n_pups=8'.
  3. Run 'lab_setup/setup' and grab a Pripps Blå 3,5
  4. Edit the variable 'lab_directory' in 'push_code' to reflect the root of
     this repo on your filesystem.
  5. ...
  6. Profit. 

## Usage

  1. Edit your puppet code in the 'code' directory.
     This directory corresponds to '/etc/puppetlabs/code' inside the container.
  2. Run 'push_code' to crudely overwrite the code directory in the puppetmaster
     container.

The puppetmaster and agents are preconfigured to run every minute.
All containers are reachable by ssh from the host.
Run 'lxc list' to see the IP's.

Having eight agents and one master running will kill your battery. Make sure to
stop lxd or your containers when not using them. I.e. 'sudo snap stop lxd'.

## TODO:
- [ ] Cleanup script (removing containers and bridge).
- [ ] Scripts for adding and removing agents.

## Docs used for reference:

  * https://phoenixnap.com/kb/install-puppet-ubuntu
  * https://www.linode.com/docs/guides/getting-started-with-puppet-6-1-basic-installation-and-setup/
  * https://puppet.com/docs/puppet/7/puppet_overview.html


