package Extjs;
use Dancer2;

get '/count' => sub {
    my ($min,$max) = (150,180); 
    my $current_count = param "counts";
    my $data = { 'seconds_elapsed' => $current_count,
                 'beats_per_minute' => int(rand(0.3) * 100 + 150)
                };
    return  { success => \1,
              data => $data,
              results => 2    
            };

};

true;
