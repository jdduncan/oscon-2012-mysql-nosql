package labs.model;

import com.mysql.clusterj.annotation.PersistenceCapable;

/** Schema
drop table if exists hashtags;
create table hashtags (
hashtag varchar(20),
tweet_id varchar(36),
time_stamp timestamp,
author varchar(15),
primary key(hashtag, tweet_id))
ENGINE=ndb;
 */

@PersistenceCapable(table="hashtags")
public interface Hashtags {
    
}
