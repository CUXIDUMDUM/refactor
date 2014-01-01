package Refactoring::ExtractMethod::UsingLocalVariables;

use strict;
use warnings;

sub print_owing{
    my $self = shift;

    my $e = $self->{_orders}->elements();
    my $outstanding = 0.0;

    $self->print_banner();

    # calculate outstanding
    while ( $e->has_more_elements() ){
        my $each = $e->next_element();
        $outstanding += $each->get_amount();
    }

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
1;
