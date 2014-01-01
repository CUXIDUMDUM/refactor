use strict;
use warnings;

use lib '../lib';

use Test::More qw( no_plan );
use Test::MockModule;

use Refactoring::ReplaceTempWithQuery::Original;
use Refactoring::ReplaceTempWithQuery::RefactorBasePrice;
use Refactoring::ReplaceTempWithQuery::RefactorDiscountFactor;

for my $class ( qw( Refactoring::ReplaceTempWithQuery::Original
                    Refactoring::ReplaceTempWithQuery::RefactorBasePrice
                    Refactoring::ReplaceTempWithQuery::RefactorDiscountFactor
               ) ) {
    my $class_mock = Test::MockModule->new( $class );
    $class_mock->mock( new => sub{ my $class = shift;
                                   my $args = shift;
                                   bless $args, $class; } );

    my $obj = $class->new( { _quantity => 10, _item_price => 100 } );
    is( $obj->get_price(), 980, "got correct price (980) with $class" );

    $obj = $class->new( { _quantity => 10, _item_price => 101 } );
    is( $obj->get_price(), 959.5, "got correct price (959.5) with $class" );
}
