use strict;
use warnings;

use lib '../lib';

my $class = 'Refactoring::InlineMethod::Original';

Test::Class->runtests();

package Refactoring::InlineMethod::Test;
use base qw( Test::Class );

use Test::More;
use Test::MockModule;

sub get_rating : Test(2){
    my $rimo_mock = Test::MockModule->new( $class );
    $rimo_mock->mock('more_than_five_late_deliveries' => '1');
    my $rimo = bless {}, $class;
    is( $rimo->get_rating(), '2', 'Got rating of 2' );

    $rimo_mock->mock('more_than_five_late_deliveries' => '0');
    $rimo = bless {}, $class;
    is( $rimo->get_rating(), '1', 'Got rating of 1' );
}

sub more_than_five_late_deliveries : Test(2){
    my $rimo = bless { _number_of_late_deliveries => '6' }, $class;
    ok( $rimo->more_than_five_late_deliveries(), 'returns success' );

    $rimo = bless { _number_of_late_deliveries => '5' }, $class;
    ok( ( not $rimo->more_than_five_late_deliveries() ), 'returns failure' );
}
