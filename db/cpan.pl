use Path::Tiny;
use v5.14;
my @lines = path("cpan.list")->lines;
my @modules;
for my $line (@lines) {
	my @fields = split /\|/, $line;
	my $mod = $fields[0];
	$mod =~ s!::!/!g;
	push @modules, $mod ;# if @fields = 1;
}

