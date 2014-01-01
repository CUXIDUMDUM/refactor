use lib '../lib';

use strict;
use warnings;

use Test::More qw( no_plan );
use Test::Output;
use Test::MockModule;

use Refactoring::SplitTemporaryVariable::Original;
use Refactoring::SplitTemporaryVariable::Refactored;

for my $class ( qw( Refactoring::SplitTemporaryVariable::Original
                    Refactoring::SplitTemporaryVariable::Refactored ) ){
    
    can_ok( $class, 'print_perimeter_and_area' );

    my $geom_mock = Test::MockModule->new($class);
    $geom_mock->mock( new => sub{ my $class = shift; bless shift, $class } );

    my $geom = $class->new( { _height => 15, _width => 18 } );
    stdout_is( sub { \$geom->print_perimeter_and_area}, "66\n270\n",
               'correctly printed perimeter and area' );
}
