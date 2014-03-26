# CONST
DB_ROOT="root"
SITE_TITLE="SoC WP Instance"
SITE_ADMIN="soc_admin"
SITE_PASS=`tr -cd '[:alpha:]' </dev/urandom | base64 | head -c 8`
SITE_EMAIL="socwebmaster@northwestern.edu"
DB_PASS=`tr -cd '[:alpha:]' </dev/urandom | base64 | head -c 8`



# Get information from user
echo "Enter information as prompted. Avoid spaces in name fields:"
echo -n "New site/database name: "
read DB_NAME
echo -n "New database user: "
read DB_USER
echo -n "New database password: "
stty -echo 
read 
stty echo 
echo   

#DB ADMIN
DB_ADMIN=$DB_NAME-admin

echo "Be ready to enter admin password for database"

# Create the database, user, and grant privileges
mysql -u $DB_ROOT -p  -e "CREATE DATABASE $DB_NAME; CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"


# Install to current folder
mkdir -p /var/www/$DB_NAME
cd /var/www/$DB_NAME

# WP DOWNLOAD and prep
wp download
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=localhost

# Get other needed information
echo -n "Site URL: "
read SITE_URL

# WP CORE INSTALL
wp core install -url=$SITE_URL --title="$SITE_TITLE" ----admin_name=$SITE_ADMIN admin_email=$SITE_EMAIL --admin_password=$SITE_PASS

echo SAVE THIS INFO
echo $SITE_URL/wp-admin
echo $SITE_ADMIN
echo $SITE_PASS
echo $SITE_EMAIL
echo $DB_PASS

