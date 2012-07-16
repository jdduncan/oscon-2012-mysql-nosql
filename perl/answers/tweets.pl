use Cache::Memcached;
use UUID::Tiny;

sub usage {
  die "tweets.pl insert {author} {tweet}\n";
}

our $mc = new Cache::Memcached( {
  'servers' => [ "localhost:11211" ]
});

my $command = shift;

if($command eq "insert") {
   my $author = shift;
   my $tweet = join(" ", @ARGV);
   usage() unless ($author && $tweet);
   insert_tweet($author, $tweet);
} else {
  usage();
}
  

## Take two parameters: author and tweet
sub insert_tweet {
  my $author = shift;
  my $tweet  = shift;
  my $id = create_UUID_as_string(UUID_V4);
  my $time = time();

  # Insert the tweet 
  my $key = "tweet:$id";
  my $value = "$time" . "\t" . $author . "\t" . $tweet;
  $mc->add($key, $value);

  # Insert the author record if there is none.
  $mc->add("newauthor:".$author, 0);
  
  # Then increment the author's tweet count.
  $mc->incr("tweetcount:".$author, 1);
  
  # Split the tweet based on words.
  # Then, for each word that begins with "#", create a hashtag record.
  foreach $word (split(' ', $tweet)) {
    if(substr($word, 0, 1) eq "#") {
      my $tag = substr($word, 1);
      # insert_tag($tag, $id, $time, $author);
    }
  }
}