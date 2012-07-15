                      OSCON 2012 MySQL NoSQL Tutorial lab exercises

                         Craig L Russell craig.russell@oracle.com
                              J. D. Duncan john.duncan@oracle.com

As a result of completing the lab exercises, students should be able to:

* configure a cluster consisting of a management node and data nodes
* use the clusterj api to insert, find, and query data in a MySQL Cluster
* use Perl and memcached to insert and read data in a MySQL Cluster

The labs are organized into two main directories, labs and answers:

* root: this README.txt file, logging.properties, and sample scripts
* schema: a create.sql script usable with the mysql command line program
* model: the clusterj Java domain object model definition of the database
* test: the clusterj Java test programs
* perl: the Perl memcached code

The skeleton programs in the labs directory are missing major pieces of
code, which the student is expected to complete. Completed programs
can be found in the answers directory.

The exercises will use a schema definition with two related tables:

* tweets: contains short messages that are indexed on author and timestamp
* hashtags: contains secondary indexes for the tweets based on their contents

Exercise 1: Using the mysql command tool, create the database and schema
The schema/create.sql contains sample table definitions that can be used
as-is or modified to suit the student's preferences.

The following exercise can use the skeleton program labs/test/Insert.java

Exercise 2: Using clusterj, insert data into the tweets and hashtags tables.

The following exercises can use the skeleton program labs/test/Find.java

Exercise 3: Using clusterj, query for tweets by author.

Exercise 4: Using clusterj, query for tweets by hashtag.

Exercise 5: Using clusterj, query for tweets by date range.

Exercise 6: Using clusterj, query for tweets using a combination of criteria

The following exercises can use the skeleton program labs/test/Delete.java

Exercise 7: Using clusterj, delete tweets by author, hashtag, or date range