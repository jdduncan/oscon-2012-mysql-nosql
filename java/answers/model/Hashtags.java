package answers.model;

import com.mysql.clusterj.annotation.PersistenceCapable;

@PersistenceCapable(table="hashtags")
public interface Hashtags {
    String getHashtag();
    void setHashtag(String value);
    String getTweet_id();
    void setTweet_id(String value);
    java.util.Date getTime_stamp();
    void setTime_stamp(java.util.Date value);
    String getAuthor();
    void setAuthor(String value);
}
