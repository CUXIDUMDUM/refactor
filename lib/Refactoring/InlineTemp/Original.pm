package Refactoring::InlineTemp::Original;

sub base_price_over_one_thousand{
  my $self = shift;
  my $base_price = $self->an_order->base_price();
  return ( $base_price > 1000 );
}

1;
