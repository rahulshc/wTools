( function _Range_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _ = wTools;

//--
// range l0/l3/iRange.s
//--

function is( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.case = 'undefined';
    var got = _[ namespace ].is( undefined );
    var expected = false;
    test.identical( got, expected );

    test.case = 'null';
    var got = _[ namespace ].is( null );
    var expected = false;
    test.identical( got, expected );

    test.case = 'false';
    var got = _[ namespace ].is( false );
    var expected = false;
    test.identical( got, expected );

    test.case = 'empty string';
    var got = _[ namespace ].is( '' );
    var expected = false;
    test.identical( got, expected );

    test.case = 'zero';
    var got = _[ namespace ].is( 0 );
    var expected = false;
    test.identical( got, expected );

    test.case = 'NaN';
    var got = _[ namespace ].is( NaN );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a boolean';
    var got = _[ namespace ].is( true );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a number';
    var got = _[ namespace ].is( 13 );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a function';
    var got = _[ namespace ].is( function() {} );
    var expected = false;
    test.identical( got, expected );

    test.case = 'constructor';
    function Constr( x )
    {
      this.x = x;
      return this;
    }
    var got = _[ namespace ].is( new Constr( 0 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a string';
    var got = _[ namespace ].is( 'str' );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferRaw';
    var got = _[ namespace ].is( new BufferRaw( 5 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferView';
    var got = _[ namespace ].is( new BufferView( new BufferRaw( 5 ) ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'Set';
    var got = _[ namespace ].is( new Set( [ 5 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'Map';
    var got = _[ namespace ].is( new Map( [ [ 1, 2 ] ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'pure empty map';
    var got = _[ namespace ].is( Object.create( null ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'pure map';
    var src = Object.create( null );
    src.x = 1;
    var got = _[ namespace ].is( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'map from pure map';
    var src = Object.create( Object.create( null ) );
    var got = _[ namespace ].is( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'an empty object';
    var got = _[ namespace ].is( {} );
    var expected = false;
    test.identical( got, expected );

    test.case = 'an object';
    var got = _[ namespace ].is( { a : 7, b : 13 } );
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = 'array.length = 0';
    var got = _[ namespace ].is( [] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'array.length = 1';
    var got = _[ namespace ].is( [ 1 ] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'array.length = 2, numbers';
    var got = _[ namespace ].is( [ 1, 2 ] );
    var expected = true;
    test.identical( got, expected );

    test.case = 'array.length = 2, number and undefined';
    var got = _[ namespace ].is( [ 1, undefined ] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'array.length > 2';
    var got = _[ namespace ].is( [ 1, 2, 3 ] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length = 0';
    var got = _[ namespace ].is( _.unrollMake( [] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length = 1';
    var got = _[ namespace ].is( _.unrollMake( [ 1 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length = 2, numbers';
    var got = _[ namespace ].is( _.unrollMake( [ 1, 2 ] ) );
    var expected = true;
    test.identical( got, expected );

    test.case = 'unroll.length = 2, number and undefined';
    var got = _[ namespace ].is( _.unrollMake( [ 1, undefined ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length > 2';
    var got = _[ namespace ].is( _.unrollMake( [ 1, 2, 3 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 0';
    var got = _[ namespace ].is( _.argumentsArrayMake( [] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 1';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 2, numbers';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1, 2 ] ) );
    var expected = true;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 2, number and undefined';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1, undefined ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length > 2';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferTyped.length = 0';
    var got = _[ namespace ].is( new U8x() );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferTyped.length = 1';
    var got = _[ namespace ].is( new I16x( 1 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferTyped.length = 2';
    var got = _[ namespace ].is( new F32x( 2 ) );
    var expected = true;
    test.identical( got, expected );

    test.case = 'BufferTyped.length > 2';
    var got = _[ namespace ].is( new F32x( 4 ) );
    var expected = false;
    test.identical( got, expected );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].is() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].is( [ 1, 2 ], 'extra' ) );
  }
}

//

function isEmpty( test )
{
  test.case = 'undefined';
  var got = _.range.isEmpty( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.range.isEmpty( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.range.isEmpty( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.range.isEmpty( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.range.isEmpty( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.range.isEmpty( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.range.isEmpty( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.range.isEmpty( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.range.isEmpty( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.range.isEmpty( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.range.isEmpty( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.range.isEmpty( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.range.isEmpty( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.range.isEmpty( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.range.isEmpty( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.range.isEmpty( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.range.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.range.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.range.isEmpty( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.range.isEmpty( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.range.isEmpty( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.range.isEmpty( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.range.isEmpty( [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.range.isEmpty( [ 1, 1 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.range.isEmpty( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.range.isEmpty( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.range.isEmpty( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.range.isEmpty( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.range.isEmpty( _.unrollMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.range.isEmpty( _.unrollMake( [ 10, 10 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.range.isEmpty( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.range.isEmpty( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.range.isEmpty( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.range.isEmpty( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.range.isEmpty( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.range.isEmpty( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.range.isEmpty( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.range.isEmpty( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.range.isEmpty( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.range.isEmpty( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.range.isEmpty( new F32x( [ 1, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.range.isEmpty( new F32x( [ 1, 1 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.range.isEmpty( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.isEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.isEmpty( [ 1, 2 ], 'extra' ) );
}

//

function isPopulated( test )
{
  test.case = 'undefined';
  var got = _.range.isPopulated( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.range.isPopulated( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.range.isPopulated( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.range.isPopulated( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.range.isPopulated( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.range.isPopulated( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.range.isPopulated( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.range.isPopulated( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.range.isPopulated( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.range.isPopulated( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.range.isPopulated( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.range.isPopulated( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.range.isPopulated( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.range.isPopulated( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.range.isPopulated( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.range.isPopulated( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.range.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.range.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.range.isPopulated( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.range.isPopulated( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.range.isPopulated( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.range.isPopulated( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.range.isPopulated( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.range.isPopulated( [ 1, 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.range.isPopulated( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.range.isPopulated( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.range.isPopulated( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.range.isPopulated( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.range.isPopulated( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.range.isPopulated( _.unrollMake( [ 10, 10 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.range.isPopulated( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.range.isPopulated( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.range.isPopulated( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.range.isPopulated( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.range.isPopulated( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.range.isPopulated( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.range.isPopulated( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.range.isPopulated( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.range.isPopulated( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.range.isPopulated( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.range.isPopulated( new F32x( [ 1, 3 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.range.isPopulated( new F32x( [ 1, 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.range.isPopulated( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.isPopulated() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.isPopulated( [ 1, 2 ], 'extra' ) );
}

//

function inInclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.range.inInclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.range.inInclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.range.inInclusive( [ 1, 2 ], 'wrong' ) );
}

//

function inExclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], 2 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], 5 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.range.inExclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inExclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.inExclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.inExclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.inExclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.range.inExclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.range.inExclusive( [ 1, 2 ], 'wrong' ) );
}

//

function inInclusiveLeft( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveLeft( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusiveLeft() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusiveLeft( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusiveLeft( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.range.inInclusiveLeft( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.range.inInclusiveLeft( [ 1, 2 ], 'wrong' ) );
}

//

function inInclusiveRight( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.range.inInclusiveRight( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusiveRight() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusiveRight( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.inInclusiveRight( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.range.inInclusiveRight( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.range.inInclusiveRight( [ 1, 2 ], 'wrong' ) );
}

//

function sureInRange( test )
{
  test.case = 'two arguments, src - number, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'two arguments, src - array, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - number, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - array, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.sureInRange() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.sureInRange( 2 ) );

  test.case = 'src out of range';
  test.shouldThrowErrorSync( () => _.range.sureInRange( 1, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 5, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 7, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 1, [ 2, 5 ], [] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 5, [ 2, 5 ], {} ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 7, [ 2, 5 ], undefined ) );
}

//

function assertInRange( test )
{
  test.case = 'two arguments, src - number, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'two arguments, src - array, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - number, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - array, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.assertInRange() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.assertInRange( 2 ) );

  test.case = 'src out of range';
  test.shouldThrowErrorSync( () => _.range.assertInRange( 1, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 5, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 7, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 1, [ 2, 5 ], [] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 5, [ 2, 5 ], {} ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 7, [ 2, 5 ], undefined ) );
}

//

function fromLeft( test )
{
  test.case = 'range - number';
  var got = _.range.fromLeft( 1 );
  test.identical( got, [ 1, Infinity ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 1 ];
  var got = _.range.fromLeft( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got === src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.range.fromLeft( src );
  test.identical( got, [ 0, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 1 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got === src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.range.fromLeft( src );
  test.identical( got, [ 0, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 1 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, _.argumentsArrayMake([ 0, 1 ]) );
  test.is( got === src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.range.fromLeft( src );
  test.identical( got, _.argumentsArrayMake([ 1, Infinity ]) );
  test.is( got === src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.range.fromLeft( src );
  test.identical( got, _.argumentsArrayMake([ 0, Infinity ]) );
  test.is( got === src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.range.fromLeft( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.fromLeft() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.fromLeft( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.fromLeft( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.range.fromLeft( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.range.fromLeft( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.range.fromLeft( [ 2, 'abc' ] ) );
}

//

function fromRight( test )
{
  test.case = 'range - number';
  var got = _.range.fromRight( 1 );
  test.identical( got, [ 0, 1 ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 1 ];
  var got = _.range.fromRight( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got === src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.range.fromRight( src );
  test.identical( got, [ 0, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 1 ] );
  var got = _.range.fromRight( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got === src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.range.fromRight( src );
  test.identical( got, [ 0, Infinity ] );
  test.is( got === src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.range.fromRight( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 1 ] );
  var got = _.range.fromRight( src );
  test.identical( got, _.argumentsArrayMake([ 0, 1 ]) );
  test.is( got === src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.range.fromRight( src );
  test.identical( got, _.argumentsArrayMake([ 1, Infinity ]) );
  test.is( got === src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.range.fromRight( src );
  test.identical( got, _.argumentsArrayMake([ 0, Infinity ]) );
  test.is( got === src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.range.fromRight( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.range.fromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.range.fromRight( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.fromRight() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.fromRight( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.fromRight( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.range.fromRight( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.range.fromRight( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.range.fromRight( [ 2, 'abc' ] ) );
}

//

function fromSingle( test )
{
  test.case = 'range - number';
  var got = _.range.fromSingle( 1 );
  test.identical( got, [ 1, 2 ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 2 ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 2 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 2 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.fromSingle() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.fromSingle( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ 2, 'abc' ] ) );
}

//

function clamp( test )
{
  test.open( 'array' );

  test.case = 'identical ranges';
  var dst = [ 2, 2 ];
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 2, 2 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = [ 2, 2 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 3, 3 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 2, 4 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 3, 4 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = [ 4, 2 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 4, 3 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 4, 5 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 4, 5 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 7, 5 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 6, 5 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 4, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 4, 6 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 8, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 6, 6 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 2, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 3, 6 ] );
  test.is( got === dst );

  test.close( 'array' );

  /* - */

  test.open( 'unroll' );

  test.case = 'identical ranges';
  var dst = _.unrollMake( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.unrollMake( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.unrollMake( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'unroll' );

  /* - */

  test.open( 'argumentsArray' );

  test.case = 'identical ranges';
  var dst = _.argumentsArrayMake( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'argumentsArray' );

  /* - */

  test.open( 'bufferTyped' );

  test.case = 'identical ranges';
  var dst = new U8x( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U8x( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = new I8x( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new I8x( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new U16x( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U16x( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = new I16x( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new I16x( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new U32x( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U32x( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new I32x( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new I32x( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new F32x( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new F32x( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new F64x( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new F64x( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new U8x( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U8x( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'bufferTyped' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.clamp() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ) );

  test.case = 'dstRange is not a range';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 2, 3 ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 'wrong' ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ undefined, 1 ], [ 3, 4 ] ) );

  test.case = 'clampRange is not a range';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 3, 4 ], [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ 3, 4 ], [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ 3, 4 ], [ undefined, 1 ] ) );
}

//

function countElements( test )
{
  test.case = 'increment - zero, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], 0 );
  test.identical( got, 0 );

  test.case = 'increment - zero, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], 0 );
  test.identical( got, 0 );

  test.case = 'increment - zero, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], 0 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - 1, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], 1 );
  test.identical( got, 5 );

  test.case = 'increment - 1, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], 1 );
  test.identical( got, -5 );

  test.case = 'increment - 1, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], 1 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - undefined, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], undefined );
  test.identical( got, 5 );

  test.case = 'increment - undefined, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], undefined );
  test.identical( got, -5 );

  test.case = 'increment - undefined, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], undefined );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - not passed, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ] );
  test.identical( got, 5 );

  test.case = 'increment - not passed, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ] );
  test.identical( got, -5 );

  test.case = 'increment - not passed, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ] );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - -1, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], -1 );
  test.identical( got, -5 );

  test.case = 'increment - -1, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], -1 );
  test.identical( got, 5 );

  test.case = 'increment - -1, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], -1 );
  test.identical( got, -0 );

  /* */

  test.case = 'increment - 5, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], 5 );
  test.identical( got, 1 );

  test.case = 'increment - 5, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], 5 );
  test.identical( got, -1 );

  test.case = 'increment - 5, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], 5 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - -5, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], -5 );
  test.identical( got, -1 );

  test.case = 'increment - -5, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], -5 );
  test.identical( got, 1 );

  test.case = 'increment - 5, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], -5 );
  test.identical( got, -0 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.countElements() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 2 ], 1, 'extra' ) );

  test.case = 'range is not a range';
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 2, 3 ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 'wrong' ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.countElements( [ undefined, 1 ], [ 3, 4 ] ) );

  test.case = 'increment is not a number and not undefined';
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 2 ], 'wrong' ) );
}

//

function firstGet( test )
{
  test.open( 'range - array' );

  test.case = 'without options';
  var got = _.range.firstGet( [ 1, 2 ] );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.firstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.firstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.firstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.firstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - array' );

  /* - */

  test.open( 'range - unroll' );

  test.case = 'without options';
  var got = _.range.firstGet( _.unrollMake( [ 1, 2 ] ) );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.firstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.firstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.firstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.firstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - unroll' );

  /* - */

  test.open( 'range - argumentsArray' );

  test.case = 'without options';
  var got = _.range.firstGet( _.argumentsArrayMake( [ 1, 2 ] ) );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - argumentsArray' );

  /* - */

  test.open( 'range - BufferTyped' );

  test.case = 'without options';
  var got = _.range.firstGet( new U8x( [ 1, 2 ] ) );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.firstGet( new I16x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.firstGet( new F32x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.firstGet( new F64x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.firstGet( new I8x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - BufferTyped' );

  /* - */

  test.open( 'range - map' );

  test.case = 'without options, first - undefined';
  var got = _.range.firstGet( { first : undefined, last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, first - not exists';
  var got = _.range.firstGet( { last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, first - number';
  var got = _.range.firstGet( { first : 1, last : undefined } );
  test.identical( got, 1 );

  /* */

  test.case = 'options - undefined, first - undefined';
  var options = undefined;
  var got = _.range.firstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, first - not exists';
  var options = undefined;
  var got = _.range.firstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, first - number';
  var options = undefined;
  var got = _.range.firstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  /* */

  test.case = 'options - empty map, first - undefined';
  var options = {};
  var got = _.range.firstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, first - not exists';
  var options = {};
  var got = _.range.firstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, first - number';
  var options = {};
  var got = _.range.firstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  /* */

  test.case = 'options - map with own field increment, first - undefined';
  var options = { increment : 2 };
  var got = _.range.firstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, first - not exists';
  var options = { increment : 2 };
  var got = _.range.firstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, first - number';
  var options = { increment : 2 };
  var got = _.range.firstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  /* */

  test.case = 'options - map with own field increment - undefined, first - undefined';
  var options = { increment : undefined };
  var got = _.range.firstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, first - not exists';
  var options = { increment : undefined };
  var got = _.range.firstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, first - number';
  var options = { increment : undefined };
  var got = _.range.firstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - map' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.firstGet() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.firstGet( [ 1, 2 ], {}, 'extra' ) );

  test.case = 'range is a long, but is not a range';
  test.shouldThrowErrorSync( () => _.range.firstGet( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.range.firstGet( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.range.firstGet( [ undefined, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.firstGet( new Set( [ 1, 2 ] ) ) );
  test.shouldThrowErrorSync( () => _.range.firstGet( new Map( [ [ 1, 2 ] ] ) ) );
}

//

function lastGet( test )
{
  test.open( 'range - array' );

  test.case = 'without options';
  var got = _.range.lastGet( [ 1, 2 ] );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - array' );

  /* - */

  test.open( 'range - unroll' );

  test.case = 'without options';
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - unroll' );

  /* - */

  test.open( 'range - argumentsArray' );

  test.case = 'without options';
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - argumentsArray' );

  /* - */

  test.open( 'range - BufferTyped' );

  test.case = 'without options';
  var got = _.range.lastGet( new U8x( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( new I16x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( new F32x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( new F64x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( new I8x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - BufferTyped' );

  /* - */

  test.open( 'range - map' );

  test.case = 'without options, last - undefined';
  var got = _.range.lastGet( { first : undefined, last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, last - not exists';
  var got = _.range.lastGet( { first : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, last - number';
  var got = _.range.lastGet( { first : 1, last : 2 } );
  test.identical( got, 2 );

  /* */

  test.case = 'options - undefined, last - undefined';
  var options = undefined;
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, last - not exists';
  var options = undefined;
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, last - number';
  var options = undefined;
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  /* */

  test.case = 'options - empty map, last - undefined';
  var options = {};
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, last - not exists';
  var options = {};
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, last - number';
  var options = {};
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  /* */

  test.case = 'options - map with own field increment, last - undefined';
  var options = { increment : 2 };
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, last - not exists';
  var options = { increment : 2 };
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, last - number';
  var options = { increment : 2 };
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  /* */

  test.case = 'options - map with own field increment - undefined, last - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, last - not exists';
  var options = { increment : undefined };
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, last - number';
  var options = { increment : undefined };
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - map' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.lastGet() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.lastGet( [ 1, 2 ], {}, 'extra' ) );

  test.case = 'range is a long, but is not a range';
  test.shouldThrowErrorSync( () => _.range.lastGet( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.range.lastGet( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.range.lastGet( [ undefined, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.lastGet( new Set( [ 1, 2 ] ) ) );
  test.shouldThrowErrorSync( () => _.range.lastGet( new Map( [ [ 1, 2 ] ] ) ) );
}

//

function toStr( test )
{
  test.case = 'range';
  var got = _.range.toStr( [ 1, 2 ] );
  test.identical( got, '1..2' );

  test.case = 'range with negative numbers';
  var got = _.range.toStr( [ -1, -2 ] );
  test.identical( got, '-1..-2' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.toStr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.toStr( [ 1, 2 ], [ 1, 2 ] ) );

  test.case = 'range is not a range';
  test.shouldThrowErrorSync( () => _.range.toStr( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.range.toStr( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.range.toStr( [ undefined, 1 ] ) );
}

// --
// declaration
// --

let Self =
{

  name : 'Tools.Range',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // common

    is,


    isEmpty,
    isPopulated,

    inInclusive,
    inExclusive,
    inInclusiveLeft,
    inInclusiveRight,

    sureInRange,
    assertInRange,

    // range, l0/l5/fRange.s

    fromLeft,
    fromRight, /* qqq : fix */
    fromSingle,

    clamp,
    countElements,
    firstGet,
    lastGet,

    toStr,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
