package Notes;
use Dancer2 ':syntax';
use Text::Markdown 'markdown';
use Path::Tiny (); # this stop import anythings
our $VERSION = '0.1';

my $home = config->{appdir};
my $dir_notes =  Path::Tiny::path($home)->child("db")->child("notes");



sub get_content {
        my $dir = shift;
        my $filename = shift;
        return $dir->child($filename)->slurp_utf8;
}

prefix '/notes' => sub {

        get '/' => sub {               
                my @dirs = map { $_->basename } $dir_notes->children;
                return template 'dir.tt', {dir => '.', dirs => \@dirs }

        };
        get '/:name' => sub {
            my $filename = params->{name};
            pass if ($dir_notes->child($filename)->is_dir);
            my $content  = get_content($dir_notes,$filename);
            if ($filename =~/md/) {
                 $content = markdown($content);
            }
            return template 'content.tt', { content => $content};
        };
        get '/*' => sub { 
            my ($dir) = splat;
            my @dirs = map { $_->basename }
                             $dir_notes->child($dir)->children;
            return template 'dir.tt', { dir => $dir , dirs => \@dirs }

        };
        get '/*/*' => sub {
            my ($dir, $filename) = splat;
            my $content  = get_content($dir_notes->child($dir),$filename);
            if ($filename =~/md/) {
                 $content = markdown($content);
            }
            return template 'content.tt', {  content => $content};
        };
};

true;
