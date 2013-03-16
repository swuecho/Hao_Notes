package Session;
use Exporter::Auto;
use MIME::Base64 'encode_base64url';
use Crypt::URandom;
use Math::Random::ISAAC::XS;
use MongoDB;

my $db ="blog";
my $collection = "sessions";
my $client = MongoDB::MongoClient->new( host => 'localhost', port => 27017 );
my $database = $client->get_database($db);
my $sessions_collection = $database->get_collection($collection);

my $CPRNG;

sub generate_id {
    $CPRNG = Math::Random::ISAAC::XS->new(
        map { unpack("N", Crypt::URandom::urandom(4)) } 1 .. 256
    );
    
    # include $$ to ensure $CPRNG wasn't forked by accident
    return encode_base64url(
        pack("N6", time, $$, $CPRNG->irand, $CPRNG->irand, $CPRNG->irand, $CPRNG->irand));

}


sub start_session {
    my $username = shift;
    my %session;
    $session{username} = $username;
    my $id = generate_id();
    $session{_id} = $id;
    $sessions_collection->insert(\%session);
    return $id;
}

sub end_session {
    my $session_id = shift;
    $sessions_collection->remove({_id => $session_id});
}

sub get_session {
    my $session_id = shift;
    return $sessions_collection->find_one({ _id => $session_id});
}

sub find_user_by_session_id {
    my $session_id = shift;        
    my $session = get_session($session_id);
    return $session->{username} if $session;
}


    


1;
