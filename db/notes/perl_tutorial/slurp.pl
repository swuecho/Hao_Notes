use strict;
use warnings;

use Path::Tiny; 

my $filename = 'report.txt';
my $path = path($filename);
my $content = $path->slurp;
print $content;
print "done";
