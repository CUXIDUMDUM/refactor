package Refactoring::RemoveAssignmentsToParameters::Refactored;

sub discount{
    my $arg_ref = shift;
    my $input_val = $arg_ref->{input_val};
    $input_val -= $arg_ref->{input_val} > 50 ? 2 : 0;
    $input_val -= $arg_ref->{quantity} > 100 ? 1 : 0;
    $input_val -= $arg_ref->{year_to_date} > 10000 ? 4 : 0;
    return $input_val;
}

1;
