use strict;
use warnings;

OhEightTest->runtests();

######################################################################

package OhEightTest;

use base qw( Test::Class );

use Test::More;
use Test::MockModule;
use Test::MockObject;

use lib '../lib';

sub original : Test( 3 ){
    use Refactoring::ReplaceMethodWithMethodObject::Original;

    my $mocked = Test::MockModule->new(
        'Refactoring::ReplaceMethodWithMethodObject::Original');
    
    my $result_object = Test::MockObject->new();
    
    $mocked->mock( get_validation_profile => 1 );
    $mocked->mock( get_input => 1 );
    $mocked->mock( process_input_against_profile => { success => 1 } );
    $mocked->mock( process_errors => [ qw( error1 error2 ) ] );
    
    my $class = 'Refactoring::ReplaceMethodWithMethodObject::Original';
    my $return = $class->validate;
    is( $return->{success}, 1, 'successful' );
    
    $mocked->mock( 'process_input_against_profile' => { success => 0 } );
    
    $return = $class->validate;
    is( $return->{success}, 0, 'fails' );
    is_deeply( $return->{errors}, [ qw( error1 error2 ) ], 'got correct errors' );
}

sub refactored : Test( no_plan ){
    use Refactoring::ReplaceMethodWithMethodObject::Refactored;

    my $class = q{Refactoring::ReplaceMethodWithMethodObject::Refactored};
    my $my_mocked = Test::MockModule->new( $class );

    $my_mocked->mock( get_input => 1 );

    my $validate_mocked = Test::MockModule->new( 'Validator', no_auto => 1 );
    $validate_mocked->mock( new => sub{ return bless {}, shift } );

    my $mock_obj = Test::MockObject->new();
    $mock_obj->mock( success => sub{1} );
    $validate_mocked->mock( process_input_against_profile => $mock_obj );

    my $return = $class->validate();
    is( $return->{success}, 1, 'successful' );

    $mock_obj->mock( success => sub{0}, );
    $mock_obj->mock( errors => sub{[ qw( error1 error2 ) ]} );
    $validate_mocked->mock( process_input_against_profile => $mock_obj );

    $return = $class->validate();
    is( $return->{success}, 0, 'fails' );
    is_deeply( $return->{errors}, [ qw( error1 error2 ) ],
               'got correct errors' );    
}
