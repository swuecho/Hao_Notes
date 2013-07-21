package Mitbbs;
use v5.14;
use Dancer2 ':syntax';
#use Mitbbs::Article;
use Mojo::UserAgent;
use Encode;
package Article {
use Moo;
	has 'link' => ( is => 'ro');
	has 'title'=> ( is => 'ro');
}

my $ua = Mojo::UserAgent->new;

my $body = $ua->get('http://www.mitbbs.com/bbsdoc/RuralChina.html')->res->dom;

my $collection = $body->find('a[href^="/article"]');

my @articles = $collection->map(sub { Article->new(link => $_->{href}, title => decode('gb2312',$_->text)) } )->each;

prefix '/mitbbs' => sub {

    get '/' => sub {
        
	return template 'mitbbs/index.tt', { articles => \@articles };
    };
};



true;
