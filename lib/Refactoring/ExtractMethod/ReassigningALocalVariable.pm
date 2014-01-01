package Refactoring::ExtractMethod::ReassigningALocalVariable;

use strict;
use warnings;

sub print_owing{
    my $self = shift;

    $self->print_banner();
    my $outstanding = $self->get_outstanding();
    $self->print_details( $outstanding );
}

sub print_banner{
    my $self = shift;

    # print banner
    print "**************************\n";
    print "***** Customer Owes ******\n";
    print "**************************\n";
}

sub print_details{
    my $self = shift;
    my $outstanding = shift;

    print 'name: ', $self->{_name}, "\n";
    print "amount: $outstanding\n";
}

sub get_outstanding{
    my $self = shift;

    my $e = $self->{_orders}->elements();
    my $result = 0.0;

    # calculate outstanding
    while ( $e->has_more_elements() ){
        my $each = $e->next_element();
        $result += $each->get_amount();
    }
    return $result;
}

1;
