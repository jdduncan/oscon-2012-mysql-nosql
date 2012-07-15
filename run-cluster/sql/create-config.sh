#!/bin/sh

 ( 
   echo "[mysqld]"
   echo "ndbcluster"
   echo "user=`whoami`"
   echo "datadir=`pwd`"
 ) > my.cnf
