SERVER_ROOT="/var/www"

SOURCE_NAME=$1
TARGET_NAME=$2
TARGET_DB_USER=$TARGET_NAME-user
DB_TEMP_FILENAME=$TARGET_NAME-tmp.sql

$

SQL_ROOT="root"

# dump and tarball
mysqldump -u $SQL_ROOT -p $SOURCE_NAME > $DB_TEMP_FILENAME
tar czvf $SERVER_ROOT/$TARGET_NAME.tgz $SERVER_ROOT/$SOURCE_NAME

#make new folder 
mkdir -p $SERVER_ROOT/$TARGET_NAME

#make new database 
DB_NAME=$TARGET_NAME
DB_USER=$TARGET_NAME-user
DB_PASs=`tr -cd '[:alpha:]' </dev/urandom | base64 | tr -cd '[:alpha:]' | head -c 10`
echo "Enter mysql root admin password:"
mysql -u $DB_ROOT -p -e "CREATE DATABASE $TARGET_NAME;  GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS'; "

