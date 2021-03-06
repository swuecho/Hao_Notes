package Funs::M;
use MongoDB;
use Exporter::Auto;
use boolean;
my $db         = "pod";
my $collection = "package";
my $client   = MongoDB::MongoClient->new( host => 'localhost', port => 27017 );
my $database = $client->get_database($db);
my $func_collection = $database->get_collection($collection);

#debug

sub search_package_func {

    # something wrong here
    my ( $package, $func ) = @_;
    my $cursor = $func_collection->find(
        { _id => $package, "subs.$func" => { '$exists' => true } } );
    my @arr = $cursor->all;
    return \@arr;
}

sub search_func {
    my $func = shift;
    my $cursor =
      $func_collection->find( { "subs.$func" => { '$exists' => true } } );
    my @arr = $cursor->all;
    return \@arr;
}

sub search_package {
    my $package = shift;
    $cursor = $func_collection->find( { _id => $package } );
    my @arr = $cursor->all;
    return \@arr;

}

1;
