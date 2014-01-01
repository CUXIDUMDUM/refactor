package Refactoring::SplitTemporaryVariable::Original;

use strict;
use warnings;

sub print_perimeter_and_area{
    my $self = shift;

    my $temp = 2 * ( $self->{_height} + $self->{_width} );
    print "$temp\n";
    $temp = $self->{_height} * $self->{_width};
    print "$temp\n";
}

1
