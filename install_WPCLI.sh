# get wp_cli
curl -L https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /vagrant/wp-cli.phar
sudo chmod +x /vagrant/wp-cli.phar
sudo mv wp-cli.phar /usr/bin/wp
