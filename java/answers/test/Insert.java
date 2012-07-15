package answers.test;

import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import answers.model.Hashtags;
import answers.model.Tweets;

import com.mysql.clusterj.ClusterJHelper;
import com.mysql.clusterj.Constants;
import com.mysql.clusterj.Session;
import com.mysql.clusterj.SessionFactory;

public class Insert {
    static String usageMessage = "Usage: Insert <author> <tweet>";
    static SessionFactory sessionFactory;
    public static void main(String[] args) {
        String authorValue = null;
        String tweetValue = null;
        if (args.length < 2) {
            System.out.println(usageMessage);
            System.exit(1);
        } else if (args.length == 2) {
            authorValue = args[0];
            tweetValue = args[1];
        } else {
            authorValue = args[0];
            StringBuilder builder = new StringBuilder();
            for (int i = 1; i < args.length; ++i) {
                builder.append(args[i]);
                builder.append(' ');
            }
            tweetValue = builder.toString();
        }
        Date dateValue = new Date();
        String idValue = getId();
        Session session = getSession();
        session.currentTransaction().begin();
        Tweets tweet = session.newInstance((Tweets.class));
        tweet.setId(idValue);
        tweet.setTime_stamp(dateValue);
        tweet.setAuthor(authorValue);
        tweet.setTweet(tweetValue);
        session.persist(tweet);
        String[] words = tweetValue.split(" ");
        for (String word: words) {
            if (word.startsWith("#")) {
                String hashtagValue = word.substring(1);
                Hashtags hashtag = session.newInstance(Hashtags.class);
                hashtag.setAuthor(authorValue);
                hashtag.setHashtag(hashtagValue);
                hashtag.setTime_stamp(dateValue);
                hashtag.setTweet_id(idValue);
                session.persist(hashtag);
            }
        }
        session.currentTransaction().commit();
        session.close();
    }
    private static Session getSession() {
        Properties props = new Properties();
        props.put(Constants.PROPERTY_CLUSTER_CONNECTSTRING, "localhost:1186");
        sessionFactory = ClusterJHelper.getSessionFactory(props);
        return sessionFactory.getSession();
    }
    private static String getId() {
        return UUID.randomUUID().toString();
    }
}
