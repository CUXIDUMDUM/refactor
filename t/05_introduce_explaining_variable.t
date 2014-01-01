use strict;
use warnings;

use Test::More qw( no_plan );
use Test::MockModule;

use lib '../lib';

use Refactoring::IntroduceExplainingVariable::Original;
use Refactoring::IntroduceExplainingVariable::Refactored;

for my $class ( qw ( Refactoring::IntroduceExplainingVariable::Original
                     Refactoring::IntroduceExplainingVariable::Refactored ) ) {
    my $riv_mock = Test::MockModule->new( $class );
    $riv_mock->mock( new => sub{ my $class = shift; bless shift, $class; } );

    my $riv = $class->new(
        { _quantity => 10,
          _item_price => 9.99 } );
    is( $riv->price(), 109.89, 'correct total for no discount, minimal shipping' );
    
    $riv = $class->new(
        { _quantity => 10,
          _item_price => 200 } );
    is( $riv->price(), 2100, 'correct total for no discount, min shipping' );
    
    $riv = $class->new(
        { _quantity => 600,
          _item_price => 10 } );
    is( $riv->price(), 6050, 'correct total for discount, max shipping' );
    
    $riv = $class->new(
        { _quantity => 600,
          _item_price => .1 } );
    is( $riv->price(), 65.50, 'correct total for discount, min shipping' );
}
