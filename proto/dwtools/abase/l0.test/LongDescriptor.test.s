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
  var descriptorsList = [ 'U8x', 'U16x', 'U32x', 'Ux', 'I8x', 'I16x', 'I32x', 'Ix', 'F32x', 'F64x', 'Fx' ];

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

//

function makeArrayUnrollArgumentsArray( test )
{
  var descriptorsList = [ 'Array', 'Unroll', 'ArgumentsArray' ];
  var getExpectedLongList = [ _.arrayMake, _.unrollMake, _.argumentsArrayMake ];

  for( let i = 0; i < descriptorsList.length; i++ ) 
  {
    let descriptor = _.withDefaultLong[ descriptorsList[ i ] ].longDescriptor;
    let getExpectedLong = getExpectedLongList[ i ];
    test.open( descriptorsList[ i ] );
    testRun( descriptor, getExpectedLong );
    test.close( descriptorsList[ i ] )
  }

  /* */

  function testRun( descriptor, getExpectedLong )
  {
    test.case = 'without arguments';
    var got = descriptor.make();
    var expected = getExpectedLong( [] );
    test.identical( got, expected );
    test.is( descriptor.is( got ) );

    test.case = 'src = undefined';
    var src = undefined;
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = null';
    var src = null;
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = empty array';
    var src = [];
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = array, src.length = 1';
    var src = [ 0 ];
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = array, src.length > 1';
    var src = [ 1, 2, 3 ];
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = number, src = 0';
    var got = descriptor.make( 0 );
    var expected = getExpectedLong( new Array( 0 ) );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = number, src > 0';
    var got = descriptor.make( 3 );
    var expected = getExpectedLong( new Array( 3 ) );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty U8x';
    var src = new U8x();
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = U8x, src.length = 1';
    var src = new U8x( 1 );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = U8x, src.length > 1';
    var src = new U8x( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty I16x';
    var src = new I16x();
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = I16x, src.length = 1';
    var src = new I16x( 1 );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = I16x, src.length > 1';
    var src = new I16x( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty F32x';
    var src = new F32x();
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = F32x, src.length = 1';
    var src = new F32x( 1 );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = F32x, src.length > 1';
    var src = new F32x( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty arguments array';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = arguments array, src.length = 1';
    var src = _.argumentsArrayMake( [ {} ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ {} ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = arguments array, src.length > 1';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty unroll';
    var src = _.unrollMake( [] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = unroll, src.length = 1';
    var src = _.unrollMake( [ 'str' ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 'str' ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = unroll, src.length > 1';
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* - */

    if( Config.debug )
    {
      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.make( 1, 3 ) );
      test.shouldThrowErrorSync( () => descriptor.make( [], 3 ) );

      test.case = 'wrong type of src';
      test.shouldThrowErrorSync( () => descriptor.make( {} ) );
      test.shouldThrowErrorSync( () => descriptor.make( 'wrong' ) );
    }
  }
}

//

function makeBufferTypedInstance( test )
{
  var descriptorsList = [ 'U8x', 'U16x', 'U32x', 'Ux', 'I8x', 'I16x', 'I32x', 'Ix', 'F32x', 'F64x', 'Fx' ]; 
  var getExpectedLongList = [ U8x, U16x, U32x, Ux, I8x, I16x, I32x, Ix, F32x, F64x, Fx ];

  for( let i = 0; i < descriptorsList.length; i++ ) 
  {
    let descriptor = _.withDefaultLong[ descriptorsList[ i ] ].longDescriptor;
    let getExpectedLong = getExpectedLongList[ i ];
    test.open( descriptorsList[ i ] );
    testRun( descriptor, getExpectedLong );
    test.close( descriptorsList[ i ] )
  }

  /* */

  function testRun( descriptor, getExpectedLong )
  {
    test.case = 'without arguments';
    var got = descriptor.make();
    var expected = new getExpectedLong( [] );
    test.identical( got, expected );
    test.is( descriptor.is( got ) );

    test.case = 'src = undefined';
    var src = undefined;
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = null';
    var src = null;
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = empty array';
    var src = [];
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = array, src.length = 1';
    var src = [ 0 ];
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = array, src.length > 1';
    var src = [ 1, 2, 3 ];
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = number, src = 0';
    var got = descriptor.make( 0 );
    var expected = new getExpectedLong( new Array( 0 ) );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = number, src > 0';
    var got = descriptor.make( 3 );
    var expected = new getExpectedLong( new Array( 3 ) );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty U8x';
    var src = new U8x();
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = U8x, src.length = 1';
    var src = new U8x( 1 );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = U8x, src.length > 1';
    var src = new U8x( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty I16x';
    var src = new I16x();
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = I16x, src.length = 1';
    var src = new I16x( 1 );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = I16x, src.length > 1';
    var src = new I16x( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty F32x';
    var src = new F32x();
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = F32x, src.length = 1';
    var src = new F32x( 1 );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 0 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = F32x, src.length > 1';
    var src = new F32x( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty arguments array';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = arguments array, src.length = 1';
    var src = _.argumentsArrayMake( [ {} ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ {} ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = arguments array, src.length > 1';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* */

    test.case = 'src = empty unroll';
    var src = _.unrollMake( [] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = unroll, src.length = 1';
    var src = _.unrollMake( [ 'str' ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 'str' ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    test.case = 'src = unroll, src.length > 1';
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = descriptor.make( src );
    var expected = new getExpectedLong( [ 1, 2, 3 ] );
    test.equivalent( got, expected );
    test.is( descriptor.is( got ) );
    test.is( src !== got );

    /* - */

    // if( Config.debug )
    // {
    //   test.case = 'extra arguments';
    //   test.shouldThrowErrorSync( () => descriptor.make( 1, 3 ) );
    //   test.shouldThrowErrorSync( () => descriptor.make( [], 3 ) );
    //
    //   test.case = 'wrong type of src';
    //   test.shouldThrowErrorSync( () => descriptor.make( {} ) );
    //   test.shouldThrowErrorSync( () => descriptor.make( 'wrong' ) );
    // }
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

    makeArrayUnrollArgumentsArray,
    makeBufferTypedInstance,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
