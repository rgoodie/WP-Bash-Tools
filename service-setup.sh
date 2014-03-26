
# mysql server install
sudo apt-get install mysql-server-5.5 -y

# mysql 
sudo mysql_secure_installation 

# turn on services
sudo service mysql restart
sudo service apache2 restart

# get wp_cli
curl -L https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /vagrant/wp-cli.phar
sudo chmod +x /vagrant/wp-cli.phar
sudo mv wp-cli.phar /usr/bin/wp

