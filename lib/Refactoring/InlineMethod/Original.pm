package Refactoring::InlineMethod::Original;

sub get_rating{
    my $self = shift;
    return $self->more_than_five_late_deliveries() ? 2 : 1;
}

sub more_than_five_late_deliveries{
    my $self = shift;
    return $self->{_number_of_late_deliveries} > 5;
}

1;
