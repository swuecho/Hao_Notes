package Users;
use Fun;
use MongoDB;
use Exporter::Auto;
my $db = "blog";
my $collection = "users";
my $client = MongoDB::MongoClient->new( host => 'localhost', port => 27017 );
my $database = $client->get_database($db);
my $users_collection = $database->get_collection($collection);


fun add_user($username, $password, $email) {
    my %user=(_id => $username, "password" => $password_hash);
    $user{email} = $email if $email ;
    my $id =  $users_collection->insert(\%user);
    return $id;    
}

fun validate_login($username, $password) {
    my $user = users_collection->find_one({_id => $username});
    if ($user) {
        my $password_hashed = $user->{$password};
        if ($password_hashed = $password) {
            return $user;
        }
        
    }
}

1;
