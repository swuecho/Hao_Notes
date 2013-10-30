package Mitbbs;
use v5.14;
use Dancer2 ':syntax';
use Mitbbs::Article;
use Mojo::UserAgent;
use Encode;

my $ua = Mojo::UserAgent->new;

sub pull_articles {
    my $mitbbs_root = 'http://www.mitbbs.com/bbsdoc/';
    my $full_href   = $mitbbs_root . shift . '.html';
    debug "the full href is $full_href";

    my $collection =
      $ua->get($full_href)->res->dom->find('a[href^="/article_t/"]');

    #TODO: get sub out
    my @articles = $collection->map(
        sub {
            Mitbbs::Article->new(
                link  => $_->{href},
                title => decode( 'gb2312', $_->text )
            );
        }
    )->each;

    return @articles[ 0 .. 20 ];
}

prefix '/mitbbs' => sub {

    get '/:bankuai' => sub {
        my $bankuai  = params->{bankuai};
        my @articles = pull_articles($bankuai);

        #	return params->{bankuai};
        return "the params is $bankuai no article found" unless @articles;
        return template 'mitbbs/index.tt', { articles => \@articles };
    };

};

true;
