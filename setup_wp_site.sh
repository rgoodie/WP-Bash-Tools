# CONST
SERVER_ROOT="192.168.33.10"
DB_ROOT="root"
SITE_TITLE="WP_Instance"
SITE_ADMIN="soc_admin"
SITE_PASS=`tr -cd '[:alpha:]' </dev/urandom | base64 | head -c 8 | tr -cd '[:alpha:]'`
DB_PASS=`tr -cd '[:alpha:]' </dev/urandom | base64 | head -c 8 | tr -cd '[:alpha:]' `
SITE_EMAIL=email@example.com


# Get information from user
echo "Enter information as prompted. Avoid spaces in name fields: \n"
echo -n "New site/database name: "
read DB_NAME


# Construct other values based on DB_NAME
DB_USER=$DB_NAME-user

# Create the database, user, and grant privileges
echo "Enter mysql root admin password:"
mysql -u $DB_ROOT -p -e "DROP DATABASE IF EXISTS $DB_NAME; CREATE DATABASE $DB_NAME;  GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS'; "


# Download WP's latest
WWW_PATH="/var/www"
mkdir -p $WWW_PATH
cd $WWW_PATH
wget  -O $WWW_PATH/tmp.tgz http://wordpress.org/latest.tar.gz 
tar xf $WWW_PATH/tmp.tgz
mv $WWW_PATH/wordpress $WWW_PATH/$DB_NAME
rm $WWW_PATH/tmp.tgz

# Prep Install 
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=localhost --path=$WWW_PATH/$DB_NAME

# Get other needed information
SITE_URL="http://$SERVER_ROOT/$DB_NAME"

# WP CORE INSTALL
echo =====================
wp core install --url=$SITE_URL --title=\"$SITE_TITLE\" --admin_name=$SITE_ADMIN --admin_email=$SITE_EMAIL --admin_password=$SITE_PASS --path=$WWW_PATH/$DB_NAME
echo =====================

echo SAVE THIS INFO
echo To edit the site visit: $SITE_URL/wp-admin
echo Admin User  	: $SITE_ADMIN
echo Admin Pass  	: $SITE_PASS
echo Admin Email 	: $SITE_EMAIL
echo Database User 	: $DB_USER
echo Database Pass	: $DB_PASS

