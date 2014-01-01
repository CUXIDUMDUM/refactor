package Refactoring::InlineTemp::Refactored;

sub base_price_over_one_thousand{
  my $self = shift;
  return ( $self->an_order->base_price() > 1000 );
}

1;
