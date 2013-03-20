package Reflection;

use Dancer2;
my @dsl;
foreach my $key ( sort (keys %Reflection::)) {
      no strict 'refs';
      push @dsl, $key . "\n" if defined &$key;
}

get '/dsl' => sub {
    return to_dumper(\@dsl);
};


true;
