package Refactoring::ReplaceTempWithQuery::Original;

sub get_price{
    my $self = shift;

    my $base_price = $self->{_quantity} * $self->{_item_price};
    my $discount_factor = $base_price > 1000 ? 0.95 : 0.98;

    return $base_price * $discount_factor;
}

1;
