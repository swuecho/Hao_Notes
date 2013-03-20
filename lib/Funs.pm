use Dancer2;
use Funs::M;
    

    get '/fun' => sub {
        return template 'Funs/funs.tt';

    };

    post '/fun' => sub {
        my $package = param "package";
        my $func    = param "function";
        my @result = search($package,$func);
        return to_dumper(@result);
#        return $package . $func;
#        return template 'Funs/funs.tt', { result => \@result };
       # redirect "/fun/$package/$func";
        # forward '/pod' if $package;
    };





true;
