use Org::To::HTML;
# OO interface
my $oeh = Org::To::HTML->new();
my $html = $oeh->export("a.org");
