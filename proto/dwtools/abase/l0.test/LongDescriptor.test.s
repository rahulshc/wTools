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

//

function isBufferTypedInstance( test )
{
  var descriptorsList = [ 'U8x', 'U16x', 'U32x', 'Ux', 'I8x', 'I16x', 'I32x', 'Ix', 'F32x', 'F64x', 'Fx', ];

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

    test.case = 'an array';
    var got = descriptor.is( [ 1, 2, 3 ] );
    var expected  = false;
    test.identical( got, expected );

    test.case = 'ArgumentsArray';
    var got = descriptor.is( _.argumentsArrayMake( [ true ] ) );
    var expected =  false;
    test.identical( got, expected );

    test.case = 'unroll';
    var got = descriptor.is( _.unrollMake( [ true ] ) );
    var expected = false;
    test.identical( got, expected );

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

    test.case = 'function';
    var got = descriptor.is( function(){} );
    var expected  = false;
    test.identical( got, expected );

    /* */

    test.case = 'U8x';
    var got = descriptor.is( new U8x( 5 ) );
    var expected  = descriptor.name === 'U8x' ? true : false;
    test.identical( got, expected );

    test.case = 'U16x';
    var got = descriptor.is( new U16x( 5 ) );
    var expected  = descriptor.name === 'U16x' ? true : false;
    test.identical( got, expected );

    test.case = 'U32x';
    var got = descriptor.is( new U32x( 5 ) );
    var expected  = descriptor.name === 'U32x' || descriptor.name === 'Ux' ? true : false;
    test.identical( got, expected );

    test.case = 'Ux';
    var got = descriptor.is( new Ux( 5 ) );
    var expected  = descriptor.name === 'U32x' || descriptor.name === 'Ux' ? true : false;
    test.identical( got, expected );

    test.case = 'I8x';
    var got = descriptor.is( new I8x( 5 ) );
    var expected  = descriptor.name === 'I8x' ? true : false;
    test.identical( got, expected );

    test.case = 'I16x';
    var got = descriptor.is( new I16x( 5 ) );
    var expected  = descriptor.name === 'I16x' ? true : false;
    test.identical( got, expected );

    test.case = 'I32x';
    var got = descriptor.is( new I32x( 5 ) );
    var expected  = descriptor.name === 'I32x' || descriptor.name === 'Ix' ? true : false;
    test.identical( got, expected );

    test.case = 'Ix';
    var got = descriptor.is( new Ix( 5 ) );
    var expected  = descriptor.name === 'I32x' || descriptor.name === 'Ix' ? true : false;
    test.identical( got, expected );

    test.case = 'F32x';
    var got = descriptor.is( new F32x( 5 ) );
    var expected  = descriptor.name === 'F32x' || descriptor.name === 'Fx' ? true : false;
    test.identical( got, expected );

    test.case = 'F64x';
    var got = descriptor.is( new F64x( 5 ) );
    var expected  = descriptor.name === 'F64x' ? true : false;
    test.identical( got, expected );

    test.case = 'Fx';
    var got = descriptor.is( new Fx( 5 ) );
    var expected  = descriptor.name === 'F32x' || descriptor.name === 'Fx' ? true : false;
    test.identical( got, expected );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.is() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.is( [], 'extra' ) );
    }   
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
    isBufferTypedInstance,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
