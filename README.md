Vagrant and Wordpress
====================

A set of files to provision Wordpress on Vagrant. It uses a combination of tools such as Vagrant, VirtualBox, and WP_CLI to get a test environment for WordPress up and going quickly.

How to use
==========
1. Clone this repo to a new folder. 
2. Execute a "vagrant up" and/or "vagrant reload --provision" as typical. 
3. Log in to the box  using "vagrant ssh"
4. Navigate to the folder /vagrant
5. Execute service-setup.sh
6. Execute setup_wp_site.sh 

Requirements
============
* virtualbox -- sudo apt-get install virtualbox
* vagrant -- http://vagrantup.com
* precise32 box -- one of the more standard boxes floating around


Other
=====
Database and site passwords are gereated automatically for you using `tr -cd '[:alpha:]' </dev/urandom | base64 | head -c 8`

