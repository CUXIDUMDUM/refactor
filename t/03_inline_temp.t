use strict;
use warnings;

use lib '../lib';

use Test::More qw( no_plan );
use Test::MockObject;
use Test::MockModule;
use Refactoring::InlineTemp::Original;
use Refactoring::InlineTemp::Refactored;

for my $class ( qw( Refactoring::InlineTemp::Original
		    Refactoring::InlineTemp::Refactored ) ){
  # dynamically create an accessor
  my $mock_mod = Test::MockModule->new( $class );
  $mock_mod->mock( an_order => sub{ return shift->{_an_order} } );

  my $order = Test::MockObject->new();
  $order->mock( base_price => sub{ return 1000 } );
  my $obj = bless { _an_order => $order }, $class;
  ok( ( not $obj->base_price_over_one_thousand ), 'returns untrue if base price less than 1000' );

  $order->mock( base_price => sub{ return 1001 } );
  $obj = bless { _an_order => $order }, $class;
  ok( $obj->base_price_over_one_thousand, 'returns true if base price overasy 1000' );
}
