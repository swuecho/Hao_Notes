package User;
use Fun;
use MongoDB;
use Crypt::SaltedHash;
use Exporter::Auto;
use Data::Printer;
my $db = "blog";
my $collection = "users";
my $client = MongoDB::MongoClient->new( host => 'localhost', port => 27017 );
my $database = $client->get_database($db);
my $users_collection = $database->get_collection($collection);

#debug


fun add_user($username, $password, $email) {
   
    my $csh = Crypt::SaltedHash->new(algorithm => 'SHA-1');
    $csh->add($password);
    my $salted = $csh->generate;
    my %user=(_id => $username, "password" => $salted);
    $user{email} = $email if $email ;
    my $id =  $users_collection->insert(\%user);
    return $id;    
}

fun validate_login($username, $password) {
    my $user = $users_collection->find_one({_id => $username});
    return unless $user;
    my $password_salted = $user->{$password};
    my $valid = Crypt::SaltedHash->validate($password_salted, '$password');
    if ($valid) {
            return $user;
     }

}


1;
