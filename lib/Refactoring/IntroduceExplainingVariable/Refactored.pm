package Refactoring::IntroduceExplainingVariable::Refactored;

use List::Util qw( max min );

sub price{
    my $self = shift;

    my $base_price = $self->{_quantity} * $self->{_item_price};
    my $quantity_discount
        = max( 0, $self->{_quantity} - 500) * $self->{_item_price} * 0.05;
    my $shipping
        = min( $self->{_quantity} * $self->{_item_price} * 0.1, 100.0);

    return $base_price - $quantity_discount + $shipping;
}

1;
