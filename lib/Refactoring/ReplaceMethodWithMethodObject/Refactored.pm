package Refactoring::ReplaceMethodWithMethodObject::Refactored;

use strict;
use warnings;

sub validate{
    my $self = shift;

    return Validator->new( $self->get_input )->validate();
}

package Validator;

sub validate{
    my $validator = shift;
    my $result = $validator->process_input_against_profile();
    if ( $result->success() ) {
        return { success => 1 };
    }
    else {
        return {
            success => 0,
            errors => $result->errors(),
        };
    }
}

1;
