package Refactoring::IntroduceExplainingVariable::Original;

use List::Util qw( max min );

sub price{
    my $self = shift;

    # price is base price - quantity discount + shipping
    return $self->{_quantity} * $self->{_item_price}
        - max( 0, $self->{_quantity} - 500) * $self->{_item_price} * 0.05
        + min( $self->{_quantity} * $self->{_item_price} * 0.1, 100.0);
}

1;
