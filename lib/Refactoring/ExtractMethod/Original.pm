package Refactoring::ExtractMethod::Original;

use strict;
use warnings;

sub print_owing{
    my $self = shift;
    my $e = $self->{_orders}->elements();
    my $outstanding = 0.0;

    # print banner
    print "**************************\n";
    print "***** Customer Owes ******\n";
    print "**************************\n";

    # calculate outstanding
    while ( $e->has_more_elements() ){
        my $each = $e->next_element();
        $outstanding += $each->get_amount();
    }

    # print details
    print 'name: ', $self->{_name}, "\n";
    print "amount: $outstanding\n";
}

1;
