package answers.model;

import com.mysql.clusterj.annotation.PersistenceCapable;

@PersistenceCapable(table="tweets")
public interface Tweets {
    String getId();
    void setId(String value);
    String getTweet();
    void setTweet(String value);
    java.util.Date getTime_stamp();
    void setTime_stamp(java.util.Date value);
    String getAuthor();
    void setAuthor(String value);
}
