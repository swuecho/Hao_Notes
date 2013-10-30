package Mitbbs::Article;
use v5.14;
use Encode;
use Moo;
use Mojo::UserAgent;
my $ua = Mojo::UserAgent->new();

has 'link'  => ( is => 'ro' );
has 'title' => ( is => 'ro' );

sub content {
    my $self      = shift;
    my $full_href = 'http://www.mitbbs.com' . $self->link;
    my $text = $ua->get($full_href)->res->dom->at('td[class^="jiawenzhang"]');
    my $dom  = Mojo::DOM->new($text);

    return substr decode( 'gb2312', $dom->at('p')->text ), 0, 500;
}

#header (author time),
#content
#footer( not necessary)
#my $art = Mitbbs::Article->new( link => '/article_t/RuralChina/31303515.html');
#say $art->content;
1;

