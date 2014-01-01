package Refactoring::InlineMethod::Inlined;

sub get_rating{
    my $self = shift;
    return ( $self->{_number_of_late_deliveries} > 5 ) ? 2 : 1;
}

1;
