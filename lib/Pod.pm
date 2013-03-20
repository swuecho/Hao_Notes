package Pod;
use Dancer2 ':syntax';
use Path::Tiny ();    # this stop import anythings
use Pod::Simple::XHTML;
use Pod::Simple::Search;
use Mojo::DOM;
our $VERSION = '0.1';

my $home  = config->{appdir};
my @lines = Path::Tiny::path($home)->child("db")->child("cpan.list")->lines;

# the possible path of pod file;

# get all the modules

my @modules;

for my $line (@lines) {
    my @fields = split /\|/, $line;
    push @modules, $fields[0];
}

my @PATHS = map { $_, "$_/pods" } @INC;

sub rewrite_cpan_link {
    my $html = shift;

    # Rewrite links
    my $dom     = Mojo::DOM->new("$html");
    my $perldoc = uri_for('/pod/');
    $dom->find('a[href]')->each(
        sub {
            my $attrs = shift->attrs;
            $attrs->{href} =~ s!%3A%3A!/!gi
              if $attrs->{href} =~
              s!^http://search\.cpan\.org/perldoc\?!$perldoc!;
        }
    );
    return "$dom";
}

sub path2content {
    my $pod_string = Path::Tiny::path(shift)->slurp;
    my $psx        = Pod::Simple::XHTML->new;
    $psx->output_string( \my $html );
    $psx->parse_string_document($pod_string);

    return $html;
}

prefix '/pod' => sub {

    get '/' => sub {
        return template 'Pod/pod_dir.tt', { modules => \@modules };

    };

    get '/:module' => sub {
        my $module = param('module');
        $module =~ s!/!::!g;
        my $path = Pod::Simple::Search->new->find( $module, @PATHS );
        my $content = path2content($path);
        $content = rewrite_cpan_link($content);
        return template 'Pod/content.tt', { content => $content };

    };

};

true;
