use test;
drop table if exists tweets;
create table if not exists tweets (
id varchar(36) primary key, 
tweet varchar(140), 
time_stamp timestamp, 
author varchar(15), 
index(time_stamp), 
index(author))
ENGINE=ndb;

drop table if exists hashtags;
create table hashtags (
hashtag varchar(20),
tweet_id varchar(36),
time_stamp timestamp,
author varchar(15),
primary key(hashtag, tweet_id))
ENGINE=ndb;
