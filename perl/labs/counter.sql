#
# Twitter.com keeps 3 counters for each user, like this:
# 
# Tweets:  9,219
# Following: 17,563
# Followers: 21,955
#
#

# The next task is to add a feature to tweets.pl so that whenever you insert 
# a tweet, you also increment the "tweets" counter for its author.  


# To start, create an authors table.
# The primary key will have the same data type as "author" in the tweets table.
# The tweets counter will be a BIGINT UNSIGNED. 

# Then you need to create two separate containers records referencing the 
# tweets table.  
# In one, you treat the tweets counter as the value column.  You will use this
# one for creating a new authors record.
# In the other container, you have no value column, but treat the tweets counter
# as the increment column.  You will use this container to increment the tweets
# counter.
# Both records treat author as the key column.

# Then create key_prefixes for each of the new containers.

# Finally, you can add two lines of code to tweets.pl to add the author record
# (if needed) and increment its counter by 1. 



