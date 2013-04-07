use ExtUtils::Installed;

my $inst    = ExtUtils::Installed->new();
open(my $out, ">", "cpan.list")  or die "cannot open > output.txt: $!";
select $out;
my @modules = $inst->modules();
foreach $module (@modules) {
    print $module . "|" . $inst->version($module) . "\n";
}
close $out;

=head1 ABOUT

This scripts lists installed cpan modules using the ExtUtils modules

=head1 FORMAT

Prints each module in the following format
<name> - <version>

=Author

from StackOverflow
=cut
