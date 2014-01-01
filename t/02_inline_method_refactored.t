use strict;
use warnings;

use lib '../lib';

my $class = 'Refactoring::InlineMethod::Inlined';

Test::Class->runtests();

package Refactoring::InlineMethod::Test;
use base qw( Test::Class );

use Test::More;
use Test::MockModule;
use Refactoring::InlineMethod::Inlined;

sub get_rating : Test(2){
    my $rimo = bless { _number_of_late_deliveries => '6' }, $class;
    is( $rimo->get_rating(), '2', 'got rating of 2' );

    $rimo = bless { _number_of_late_deliveries => '5' }, $class;
    is( $rimo->get_rating(), '1' , 'got rating of 1' );
}
