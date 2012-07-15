#!/bin/sh

 ( 
   echo "[mysqld]"
   echo "ndbcluster"
   echo "user=`whoami`"
   echo "datadir=`pwd`"
   echo "ndb-connectstring=localhost:1186"
 ) > my.cnf
