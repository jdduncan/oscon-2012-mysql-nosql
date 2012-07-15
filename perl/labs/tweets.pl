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

  ########### WORK HERE:
  # Insert the tweet
  # The key will consist of the key prefix for tweets plus the id
  # The parts of the value will be tab separated, and in the order defined
  # in the containers record.

 
  ############ 
  # Next, split the tweet into words, and identify which words are hashtags.
  # We would be able to insert hashtag records as well, but we'll skip that part
  # today due to a bug in 7.2.6
}

