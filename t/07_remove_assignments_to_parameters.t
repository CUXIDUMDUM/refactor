use Test::More qw( no_plan );

use lib '../lib';

use Refactoring::RemoveAssignmentsToParameters::Original;
use Refactoring::RemoveAssignmentsToParameters::Refactored;

for my $package (
    qw( Refactoring::RemoveAssignmentsToParameters::Original
     Refactoring::RemoveAssignmentsToParameters::Refactored ) ) {

    my $code = \&{"${package}::discount"};
    is( $code->( { input_val => '50',
                   quantity => '100',
                   year_to_date => '10000', } ), 50,
        'received correct discount' );
    is( $code->( { input_val => '51',
                   quantity => '100',
                   year_to_date => '10000', } ), 49,
        'received correct discount' );
    is( $code->( { input_val => '50',
                   quantity => '101',
                   year_to_date => '10000', } ), 49,
        'received correct discount' );
    is( $code->( { input_val => '50',
                   quantity => '100',
                   year_to_date => '10001', } ), 46,
        'received correct discount' );                             
}
