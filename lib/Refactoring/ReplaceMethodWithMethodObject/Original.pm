package Refactoring::ReplaceMethodWithMethodObject::Original;

use strict;
use warnings;

sub validate{
    my $self = shift;
    my $errors_ref;

    my $validation_profile = $self->get_validation_profile();
    my $input = $self->get_input();
    my $result = $self->process_input_against_profile(
        $input => $validation_profile );
    if ( $result->{success} ) {
        return { success => 1 };
    }
    else {
        $errors_ref = $self->process_errors( $result );
        return {
            success => 0,
            errors => $errors_ref,
        };
    }
}

1;
