
# Exercise 1. Configuring NDB Memcache to use the tweets and hashtags tables.
# Here is the data structure:

# Tweets:
#    id          VARCHAR(36)   PRIMARY KEY
#    tweet       VARCHAR(140)
#    time_stamp  timestamp     [with ordered index]
#    author      VARCHAR(15)   [with ordered index]

# Hashtags:
#    hashtag     VARCHAR(20)
#    tweet_id    VARCHAR(36)   [ PRIMARY KEY is on (hashtag, tweet_id) ]
#    time_stamp  timestamp  
#    author      VARCHAR(15) 

use ndbmemcache;

# Create a containers record referencing the tweets table.  It should have
# just one key column (the tweet_id) and three value columns
# (tweet, timestamp, and author).

INSERT INTO containers(name, db_schema, db_table, key_columns, value_columns)
 VALUES("tweets_table","test","tweets","id","time_stamp,author,tweet") ;

# Then create a key_prefixes record using that container.
INSERT INTO key_prefixes(key_prefix, policy, container) 
 VALUES("tweet:","ndb-only", "tweets_table");


# Insert a containers record referencing the hashtags table.
INSERT INTO containers(name, db_schema, db_table, key_columns, value_columns)
 VALUES("tags_table","test","hashtags","hashtag,tweet_id","time_stamp,author") ;
 
# And create a key_prefixes record
INSERT INTO key_prefixes(key_prefix, policy, container) 
  VALUES("tag:","ndb-only","tags_table");
