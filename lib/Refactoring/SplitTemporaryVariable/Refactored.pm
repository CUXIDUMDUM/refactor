package Refactoring::SplitTemporaryVariable::Refactored;

use strict;
use warnings;

sub print_perimeter_and_area{
    my $self = shift;

    my $perimeter = 2 * ( $self->{_height} + $self->{_width} );
    print "$perimeter\n";
    my $area = $self->{_height} * $self->{_width};
    print "$area\n";
}

1
