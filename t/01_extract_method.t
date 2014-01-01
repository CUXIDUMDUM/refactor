use strict;
use warnings;

use lib '../lib';

my @classes_to_test;

BEGIN{
    # we have to run one test per class, so run this so we can define
    # our test plan when using Test::More
    @classes_to_test = qw(
                          Refactoring::ExtractMethod::Original
                          Refactoring::ExtractMethod::NoLocalVariables
                          Refactoring::ExtractMethod::UsingLocalVariables
                          Refactoring::ExtractMethod::ReassigningALocalVariable
                      );
}

use Test::More tests => scalar @classes_to_test;
use Test::MockObject;
use Test::MockModule;
use Test::Output;

for my $class ( @classes_to_test ) {
    # mock up an element object
    my $mock_element = Test::MockObject->new();
    $mock_element->mock( get_amount => sub { return shift->{_val} } );
    $mock_element->mock( set_amount => sub {
                             my $self = shift;
                             my $val = shift;
                             $self->{_val} = $val; } );

    # mock up an elements enumerator
    my $mock_elements = Test::MockObject->new();
    my @elements = qw( 1 2 3 4 5 );
    $mock_elements->mock( has_more_elements =>
                              sub { return 1 if scalar @elements } );
    $mock_elements->mock( next_element => sub {
                              $mock_element->set_amount(
                                  pop @elements );
                              return $mock_element;
                          } );

    # mock up an elements accessor
    my $mock_accessor = Test::MockObject->new();
    $mock_accessor->mock( elements =>
                              sub{ return $mock_elements } );

    # mock up a new method and add object data to the ExtractMethod class
    my $mock_module = Test::MockModule->new( $class );
    $mock_module->mock( new => sub{
                            my $class = shift;
                            bless { _name   => 'Henry',
                                    _orders => $mock_accessor },
                                        $class;
                        } );

    my $obj = $class->new();
    stdout_like( sub{ $obj->print_owing },
                 qr/^\*\*\*\*\*\sCustomer\sOwes\s\*\*\*\*\*\*.*
                    ^name:\sHenry\n
                    ^amount:\s15/xms, "good output for $class" );
}
