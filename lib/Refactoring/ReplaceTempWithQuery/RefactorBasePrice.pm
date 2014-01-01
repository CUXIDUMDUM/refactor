package Refactoring::ReplaceTempWithQuery::RefactorBasePrice;

sub get_price{
    my $self = shift;

    my $discount_factor = $self->base_price() > 1000 ? 0.95 : 0.98;

    return $self->base_price() * $discount_factor;
}

sub base_price{
    my $self = shift;

    return $self->{_quantity} * $self->{_item_price};
}

1;
