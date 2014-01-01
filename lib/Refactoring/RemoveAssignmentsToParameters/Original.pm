package Refactoring::RemoveAssignmentsToParameters::Original;

sub discount{
    my $arg_ref = shift;
    $arg_ref->{input_val} -= $arg_ref->{input_val} > 50 ? 2 : 0;
    $arg_ref->{input_val} -= $arg_ref->{quantity} > 100 ? 1 : 0;
    $arg_ref->{input_val} -= $arg_ref->{year_to_date} > 10000 ? 4 : 0;
    return $arg_ref->{input_val};
}

1;
