use Test::More tests => 1;
use strict;
use warnings;

# the order is important
use Hao;

#use Notes;
use Dancer2::Test;

#route_exists [GET => '/'], 'a route handler is defined for /';
response_status_is [ 'GET' => '/' ], 200, 'response status is 200 for /';
