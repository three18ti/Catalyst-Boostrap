use strict;
use warnings;

use Bootstrap;

my $app = Bootstrap->apply_default_middlewares(Bootstrap->psgi_app);
$app;

