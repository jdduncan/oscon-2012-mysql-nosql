package labs.model;

import com.mysql.clusterj.annotation.PersistenceCapable;

/* Schema
drop table if exists tweets;
create table if not exists tweets (
id varchar(36) primary key, 
tweet varchar(140), 
time_stamp timestamp, 
author varchar(15), 
index(time_stamp), 
index(author))
ENGINE=ndb;
 */

@PersistenceCapable(table="tweets")
public interface Tweets {

}
