package Hao;
use Dancer2 ':syntax';
use Notes;
our $VERSION = '0.1';

my $home = config->{appdir};

# get app name

get '/' => sub {
        return $home ."/db";
#TODO: display more env variables
};

# me
prefix '/me' => sub {
        get '/cv' => sub {
        redirect 'http://www.auburn.edu/~hzw0019';
        };

        get '/twitter'=> sub {
               redirect 'http://twitter.com/me';
        };
};




true;
