package Blog::Posts;
use Fun;
use MongoDB;
use Dancer2::Core::Time;
my $db = "blog";
my $collection = "posts";
my $client = MongoDB::MongoClient->new( host => 'localhost', port => 27017 );
my $database = $client->get_database($db);
my $posts_collection = $database->get_collection($collection);

fun find_by_date_descending($limit) {
        my @posts = $posts_collection.find()->sort({"time" => -1})->limit(limit)->all();
        return \@posts;
}

fun add_post($title, $body, $tags, $username) {
    $title =~ s/\s/_/g; # TODO:
    $title =~ s/\W//g;
    my $permalink = lc $title;
    my $date = localtime;
    my @comments;
    my %post = (
        title => $title,
        author => $username,
        body => $body,
        permalink => $permalink,
        tags => $tags,
        comments => \@comments,
        date => $date);
    $posts_collection->insert(\%post);
    return $permalink;
}


fun add_post_comment($name, $email, $body, $permalink) {
    my %comment = (author => $name, body =>  $body);
    $comment{email} = $email if $email;
    $posts_collection->update({ permalink =>  $permalink},
               {"$push",{ comments => \%comments }});

}

1;

