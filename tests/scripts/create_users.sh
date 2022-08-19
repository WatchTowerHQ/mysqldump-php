#!/bin/bash

MYSQL_ROOT_PASSWORD=${1:-drupal}
MYSQL_CMD="mysql -h db -u root -p$MYSQL_ROOT_PASSWORD"
USER=tester

$MYSQL_CMD -e "CREATE USER IF NOT EXISTS '$USER'@'%';"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test001;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test002;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test005;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test006a;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test006b;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test008;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test009;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test010;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test011;"
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS test012;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test001.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test002.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test005.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test006a.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test006b.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test008.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test009.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test010.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test011.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON test012.* TO '$USER'@'%' WITH GRANT OPTION;"
$MYSQL_CMD -e "GRANT SUPER,LOCK TABLES ON *.* TO '$USER'@'%';"
$MYSQL_CMD -e "GRANT SELECT ON mysql.proc to '$USER'@'%';"
$MYSQL_CMD -e "FLUSH PRIVILEGES;"
$MYSQL_CMD -e "use mysql; update user set authentication_string=PASSWORD('') where User='$USER'; update user set plugin='mysql_native_password';FLUSH PRIVILEGES;"

echo "Listing created databases with user '$USER'"
mysql -h db -u $USER -e "SHOW databases;"
