use Dancer2 ':syntax';
use Funs::M;

get '/fun' => sub {
    return template 'Funs/funs.tt';

};

post '/fun' => sub {
    my $package = param "package";
    my $func    = param "function";
    return to_dumper( search_package_func( $package, $func ) )
      if ( $package and $func );
    return to_dumper( search_package($package) )
      if ( $package and ( not $func ) );
    return to_dumper( search_func($func) ) if ( $func and ( not $package ) );
    return "no query content";
};

true;
