Vagrant and Wordpress
====================

A set of files to provision Wordpress on Vagrant. It uses a combination of tools such as Vagrant, VirtualBox, and WP_CLI to get a test environment for WordPress up and going quickly.

Gotchas to provisioning
=======================
Well I've had to move the mysql-server install to the second script that is run after you `vagrant ssh` in. This is due to mysql-server install scripts asking for user input during the install. This didn't work too well with provisioning. So I've moved it. Is there a better way. Oh I'm sure. But this is a learning exercise for me. 

How to use (from host machine)
==============================
1. Clone this repo to a new folder. 
2. Execute a `vagrant up` and/or "vagrant reload --provision" as typical. 
3. Log in to the box  using `vagrant ssh`

Once in the VM (through vagrant ssh)
====================================
- Navigate to the vagrant folder $`cd /vagrant`
- $`./bootstrap.sh` (if it didn't run under provision)
- $`./service-setup.sh`
- $`./install_WPCLI.sh`
- $`./setup_wp_site.sh` 

When all is said and done, you should see something like this in the terminal window

```
      To edit the site visit: http://192.168.33.10/wp/wp-admin
      Admin User : soc_admin
      Admin Pass : amPqSErC
      Admin Email : email@example.com
      Database User : wp-user
      Database Pass : dXFEUHdJ
```


Requirements
============
* virtualbox -- sudo apt-get install virtualbox
* vagrant -- http://vagrantup.com
* precise32 box -- one of the more standard boxes floating around


Other
=====
Database and site passwords are gereated automatically for you using `tr -cd '[:alpha:]' </dev/urandom | base64 | head -c 8`. If this does make it to a production server (which it shouldn't), please use longer, better passwords. But for a temporary, disposable VM these should be good enough. 


Disclaimer of Warranty
======================
Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.
