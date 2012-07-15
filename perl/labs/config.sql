
# Configure NDB Memcache to use the tweets and hashtags tables.
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


# Then create a key_prefixes record using that container.


# Insert a containers record referencing the hashtags table.

 
# And create a key_prefixes record

