
CUSTOM_MYSQL=/Users/clr/ndb/install-5.1-telco-7.1.23-m64
VERSION=7.2.6

## RPM 
if test -f /usr/share/mysql/java/clusterj-api-$VERSION.jar
 then 
   export MYSQL_INSTALL_DIR=/usr

## /usr/local/mysql (Mac, Generic Linux Tarfiles)
elif test -f /usr/local/mysql/share/java/clusterj-api-$VERSION.jar
  then
    export MYSQL_INSTALL_DIR=/usr/local/mysql

## Debian
elif test -f /opt/mysql/server-5.5/share/java/clusterj-api-$VERSION.jar
  then
    export MYSQL_INSTALL_DIR=/opt/mysql/server-5.5 

## Custom
elif test -f "$CUSTOM_MYSQL"
  then
    export MYSQL_INSTALL_DIR=$CUSTOM_MYSQL
else echo "Could net set MYSQL_INSTALL_DIR"
fi


## Set MYSQL_JAVA_SHARE
if test -d $MYSQL_INSTALL_DIR/share/mysql/java
  then
    export MYSQL_JAVA_SHARE=$MYSQL_INSTALL_DIR/share/mysql/java
elif test -d $MYSQL_INSTALL_DIR/share/java
  then
    export MYSQL_JAVA_SHARE=$MYSQL_INSTALL_DIR/share/java 
else echo "Could net set MYSQL_JAVA_SHARE"
fi


# Set MYSQL_LIB_DIR
## Mac
if test -f $MYSQL_INSTALL_DIR/lib/libndbclient.dylib
  then
    export MYSQL_LIB_DIR=$MYSQL_INSTALL_DIR/lib

## 64-bit RPM
elif test -f /usr/lib64/ndb_engine.so 
  then
    export MYSQL_LIB_DIR=/usr/lib64

# Others
elif test -f $MYSQL_INSTALL_DIR/lib/libndbclient.so
  then
    export MYSQL_LIB_DIR=$MYSQL_INSTALL_DIR/dir
elif test -f  $MYSQL_INSTALL_DIR/lib/mysql/libndbclient.so 
  then
    export MYSQL_LIB_DIR=$MYSQL_INSTALL_DIR/lib/mysql
else echo "Could not set MYSQL_LIB_DIR"
fi