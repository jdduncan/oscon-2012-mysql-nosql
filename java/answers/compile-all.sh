
. ../../pathnames.sh

CLASSPATH=$MYSQL_JAVA_SHARE/clusterj-api-7.2.6.jar
export CLASSPATH

javac model/Hashtags.java model/Tweets.java test/Delete.java test/Insert.java test/Find.java
