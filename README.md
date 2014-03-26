vagrant_wp_provision
====================

A set of files to provision Wordpress on Vagrant. It uses a combination of tools such as Vagrant, VirtualBox, and WP_CLI to get a test environment for WordPress up and going quickly.

How to use
==========
Clone this repo. Execute a "vagrant up" and/or "vagrant reload --provision" as typical. Log in using "vagrant ssh", navigate to the folder /vagrant, and execute service-setup.sh followed by setup_wp_site.sh. 

Requirements
============
* virtualbox -- sudo apt-get install virtualbox
* vagrant -- http://vagrantup.com
* precise32 box -- one of the more standard boxes floating around

