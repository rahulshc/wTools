( function _LongDescriptor_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = _global_.wTools;

//--
// tests
//--

function isArrayUnrollArgumentsArray( test )
{
  var descriptorsList = [ 'Array', 'Unroll', 'ArgumentsArray' ];

  for( let i = 0; i < descriptorsList.length; i++ ) 
  {
    let descriptor = _.withDefaultLong[ descriptorsList[ i ] ].longDescriptor;
    test.open( descriptorsList[ i ] );
    testRun( descriptor );
    test.close( descriptorsList[ i ] )
  }

  /* */

  function testRun( descriptor )
  {
    test.case = 'without argument';
    var got = descriptor.is();
    var expected  = false;
    test.identical( got, expected );

    test.case = 'null';
    var got = descriptor.is( null );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'undefined';
    var got = descriptor.is( undefined );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'number';
    var got = descriptor.is( 6 );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'string';
    var got = descriptor.is( 'abc' );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'boolean';
    var got = descriptor.is( true );
    var expected  = false;
    test.identical( got, expected );

    /* */

    test.case = 'map';
    var got = descriptor.is( {} );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'HashMap';
    var got = descriptor.is( new Map() );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'Set';
    var got = descriptor.is( new Set() );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'BufferTyped';
    var got = descriptor.is( new U8x( 5 ) );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'function';
    var got = descriptor.is( function(){} );
    var expected  = false;
    test.identical( got, expected );

    /* */

    test.case = 'an empty array';
    var got = descriptor.is( [] );
    var expected = descriptor.name === 'Array' ? true : false;
    test.identical( got, expected );

    test.case = 'an array';
    var got = descriptor.is( [ 1, 2, 3 ] );
    var expected  = descriptor.name === 'Array' ? true : false;
    test.identical( got, expected );

    test.case = 'empty ArgumentsArray';
    var got = descriptor.is( _.argumentsArrayMake( [] ) );
    var expected = descriptor.name === 'ArgumentsArray' ? true : false;
    test.identical( got, expected );

    test.case = 'ArgumentsArray';
    var got = descriptor.is( _.argumentsArrayMake( [ true ] ) );
    var expected = descriptor.name === 'ArgumentsArray' ? true : false;
    test.identical( got, expected );

    test.case = 'empty unroll';
    var got = descriptor.is( _.unrollMake( [] ) );
    var expected = descriptor.name === 'ArgumentsArray' ? false : true;
    test.identical( got, expected );

    test.case = 'unroll';
    var got = descriptor.is( _.unrollMake( [ true ] ) );
    var expected = descriptor.name === 'ArgumentsArray' ? false : true;
    test.identical( got, expected );
  }
}

// --
//
// --

var Self =
{

  name : 'Tools.base.LongDescriptor',
  silencing : 1,

  tests :
  {

    isArrayUnrollArgumentsArray,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
