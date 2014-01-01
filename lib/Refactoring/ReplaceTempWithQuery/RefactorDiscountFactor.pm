package Refactoring::ReplaceTempWithQuery::RefactorDiscountFactor;

sub get_price{
    my $self = shift;
    return $self->base_price() * $self->discount_factor();
}

sub base_price{
    my $self = shift;
    return $self->{_quantity} * $self->{_item_price};
}

sub discount_factor{
    my $self = shift;
    return $self->base_price > 1000 ? 0.95 : 0.98;
}

1;
