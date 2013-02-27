use Pod::Simple::XHTML;
use Path::Tiny;
my $psx = Pod::Simple::XHTML->new;
$psx->output_string(\my $html);
$psx->html_charset('UTF-8');
$psx->parse_string_document(path('Ubuntu.pod')->slurp);
open my $out, '>', 'out.html' or die "Cannot open 'out.html': $!\n";
print  $html;
