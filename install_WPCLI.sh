# get wp_cli


curl -L https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar > $HOME/wp-cli.phar
sudo chmod a+x $HOME/wp-cli.phar
sudo mv $HOME/wp-cli.phar /usr/bin/wp
