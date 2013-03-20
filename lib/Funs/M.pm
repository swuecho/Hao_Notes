package Funs::M;

use MongoDB;
use MongoDB::Cursor;
use Exporter::Auto;
my $db = "pod";
my $collection = "package";
my $client = MongoDB::MongoClient->new( host => 'localhost', port => 27017 );
my $database = $client->get_database($db);
my $func_collection = $database->get_collection($collection);

#debug

sub search {
# something wrong here
    my ($package,$func) = @_;
    if ($func and $package) {    
        my $cursor = $func_collection->find({ _id => $package , "subs.$func" => { '$exists' => 1 } });
    }
    elsif ($fun) {
        my $cursor = $func_collection->find({"subs.$func" => { '$exists' => 1 } });
    } else {
        my $cursor = $func_collection->find({ _id => $package });
    }
    my @arr = $cursor->all if $cursor;
    #$func_collection->find_one();

}

1;
