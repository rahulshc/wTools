( function _Range_test_s( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

//--
// range l0/l3/iRange.s
//--

function rangeIs( test )
{
  test.case = 'undefined';
  var got = _.rangeIs( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.rangeIs( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.rangeIs( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.rangeIs( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.rangeIs( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.rangeIs( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.rangeIs( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.rangeIs( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.rangeIs( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = function( x )
  {
    this.x = x;
    return this;
  }
  var got = _.rangeIs( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.rangeIs( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.rangeIs( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.rangeIs( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter = 'njs' )
  {
    test.case = 'BufferNode';
    var got = _.rangeIs( BufferNode.alloc( 5 ) );
    var expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.rangeIs( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.rangeIs( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.rangeIs( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.rangeIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.rangeIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.rangeIs( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.rangeIs( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.rangeIs( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.rangeIs( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, numbers';
  var got = _.rangeIs( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.rangeIs( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.rangeIs( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.rangeIs( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.rangeIs( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, numbers';
  var got = _.rangeIs( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.rangeIs( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.rangeIs( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.rangeIs( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, numbers';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.rangeIs( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.rangeIs( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2';
  var got = _.rangeIs( new F32x( 2 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.rangeIs( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeIs( [ 1, 2 ], 'extra' ) );
}

//

function rangeIsEmpty( test )
{
  test.case = 'undefined';
  var got = _.rangeIsEmpty( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.rangeIsEmpty( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.rangeIsEmpty( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.rangeIsEmpty( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.rangeIsEmpty( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.rangeIsEmpty( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.rangeIsEmpty( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.rangeIsEmpty( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.rangeIsEmpty( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = function( x )
  {
    this.x = x;
    return this;
  }
  var got = _.rangeIsEmpty( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.rangeIsEmpty( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.rangeIsEmpty( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.rangeIsEmpty( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter = 'njs' )
  {
    test.case = 'BufferNode';
    var got = _.rangeIsEmpty( BufferNode.alloc( 5 ) );
    var expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.rangeIsEmpty( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.rangeIsEmpty( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.rangeIsEmpty( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.rangeIsEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.rangeIsEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.rangeIsEmpty( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.rangeIsEmpty( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.rangeIsEmpty( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.rangeIsEmpty( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.rangeIsEmpty( [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.rangeIsEmpty( [ 1, 1 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.rangeIsEmpty( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.rangeIsEmpty( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.rangeIsEmpty( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.rangeIsEmpty( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.rangeIsEmpty( _.unrollMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.rangeIsEmpty( _.unrollMake( [ 10, 10 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.rangeIsEmpty( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.rangeIsEmpty( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.rangeIsEmpty( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.rangeIsEmpty( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.rangeIsEmpty( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.rangeIsEmpty( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.rangeIsEmpty( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.rangeIsEmpty( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.rangeIsEmpty( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.rangeIsEmpty( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.rangeIsEmpty( new F32x( [ 1, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.rangeIsEmpty( new F32x( [ 1, 1 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.rangeIsEmpty( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeIsEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeIsEmpty( [ 1, 2 ], 'extra' ) );
}

//

function rangeIsPopulated( test )
{
  test.case = 'undefined';
  var got = _.rangeIsPopulated( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.rangeIsPopulated( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.rangeIsPopulated( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.rangeIsPopulated( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.rangeIsPopulated( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.rangeIsPopulated( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.rangeIsPopulated( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.rangeIsPopulated( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.rangeIsPopulated( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = function( x )
  {
    this.x = x;
    return this;
  }
  var got = _.rangeIsPopulated( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.rangeIsPopulated( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.rangeIsPopulated( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.rangeIsPopulated( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter = 'njs' )
  {
    test.case = 'BufferNode';
    var got = _.rangeIsPopulated( BufferNode.alloc( 5 ) );
    var expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.rangeIsPopulated( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.rangeIsPopulated( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.rangeIsPopulated( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.rangeIsPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.rangeIsPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.rangeIsPopulated( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.rangeIsPopulated( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.rangeIsPopulated( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.rangeIsPopulated( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.rangeIsPopulated( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.rangeIsPopulated( [ 1, 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.rangeIsPopulated( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.rangeIsPopulated( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.rangeIsPopulated( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.rangeIsPopulated( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.rangeIsPopulated( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.rangeIsPopulated( _.unrollMake( [ 10, 10 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.rangeIsPopulated( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.rangeIsPopulated( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.rangeIsPopulated( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.rangeIsPopulated( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.rangeIsPopulated( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.rangeIsPopulated( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.rangeIsPopulated( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.rangeIsPopulated( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.rangeIsPopulated( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.rangeIsPopulated( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.rangeIsPopulated( new F32x( [ 1, 3 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.rangeIsPopulated( new F32x( [ 1, 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.rangeIsPopulated( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeIsPopulated() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeIsPopulated( [ 1, 2 ], 'extra' ) );
}

//

function rangeInInclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.rangeInInclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.rangeInInclusive( [ 1, 2 ], 'wrong' ) );
}

//

function rangeInExclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], 2 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], 5 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInExclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeInExclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.rangeInExclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeInExclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.rangeInExclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.rangeInExclusive( [ 1, 2 ], 'wrong' ) );
}

//

function rangeInInclusiveLeft( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveLeft( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveLeft() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveLeft( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveLeft( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveLeft( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveLeft( [ 1, 2 ], 'wrong' ) );
}

//

function rangeInInclusiveRight( test )
{
  test.case = 'srcNumber - number, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 0 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, range[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.rangeInInclusiveRight( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveRight() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveRight( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveRight( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'range is not Range';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveRight( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.rangeInInclusiveRight( [ 1, 2 ], 'wrong' ) );
}

//

function sureInRange( test )
{
  test.case = 'two arguments, src - number, in range';
  var got = _.sureInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'two arguments, src - array, in range';
  var got = _.sureInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - number, in range';
  var got = _.sureInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - array, in range';
  var got = _.sureInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.sureInRange() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.sureInRange( 2 ) );

  test.case = 'src out of range';
  test.shouldThrowErrorSync( () => _.sureInRange( 1, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.sureInRange( 5, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.sureInRange( 7, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.sureInRange( 1, [ 2, 5 ], [] ) );
  test.shouldThrowErrorSync( () => _.sureInRange( 5, [ 2, 5 ], {} ) );
  test.shouldThrowErrorSync( () => _.sureInRange( 7, [ 2, 5 ], undefined ) );
}

//

function assertInRange( test )
{
  test.case = 'two arguments, src - number, in range';
  var got = _.assertInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'two arguments, src - array, in range';
  var got = _.assertInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - number, in range';
  var got = _.assertInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - array, in range';
  var got = _.assertInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.assertInRange() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.assertInRange( 2 ) );

  test.case = 'src out of range';
  test.shouldThrowErrorSync( () => _.assertInRange( 1, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.assertInRange( 5, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.assertInRange( 7, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.assertInRange( 1, [ 2, 5 ], [] ) );
  test.shouldThrowErrorSync( () => _.assertInRange( 5, [ 2, 5 ], {} ) );
  test.shouldThrowErrorSync( () => _.assertInRange( 7, [ 2, 5 ], undefined ) );
}

//

function rangeFromLeft( test )
{
  test.case = 'range - number';
  var got = _.rangeFromLeft( 1 );
  test.identical( got, [ 1, Infinity ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 1 ];
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 0, undefined ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 1 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 0, undefined ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 1 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 0, undefined ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.rangeFromLeft( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeFromLeft() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeFromLeft( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.rangeFromLeft( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.rangeFromLeft( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.rangeFromLeft( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.rangeFromLeft( [ 2, 'abc' ] ) );
}

//

function rangeFromRight( test )
{
  test.case = 'range - number';
  var got = _.rangeFromRight( 1 );
  test.identical( got, [ 1, Infinity ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 1 ];
  var got = _.rangeFromRight( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.rangeFromRight( src );
  test.identical( got, [ 0, undefined ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 1 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 0, undefined ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 1 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 0, undefined ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, [ 1, Infinity ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.rangeFromRight( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeFromRight() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeFromRight( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.rangeFromRight( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.rangeFromRight( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.rangeFromRight( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.rangeFromRight( [ 2, 'abc' ] ) );
}

//

function rangeFromSingle( test )
{
  test.case = 'range - number';
  var got = _.rangeFromSingle( 1 );
  test.identical( got, [ 1, 2 ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 2 ];
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 2 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 2 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.rangeFromSingle( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeFromSingle() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeFromSingle( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.rangeFromSingle( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.rangeFromSingle( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.rangeFromSingle( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.rangeFromSingle( [ 2, 'abc' ] ) );
}

//

function rangeClamp( test )
{
  test.open( 'array' );

  test.case = 'identical ranges';
  var dst = [ 2, 2 ];
  var clamp = [ 2, 2 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 2, 2 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = [ 2, 2 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 3, 3 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 2, 4 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 3, 4 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = [ 4, 2 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 4, 3 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 4, 5 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 4, 5 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 7, 5 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 6, 5 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 4, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 4, 6 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 8, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 6, 6 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 2, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, [ 3, 6 ] );
  test.is( got === dst );

  test.close( 'array' );

  /* - */

  test.open( 'unroll' );

  test.case = 'identical ranges';
  var dst = _.unrollMake( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.unrollMake( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.unrollMake( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'unroll' );

  /* - */

  test.open( 'argumentsArray' );

  test.case = 'identical ranges';
  var dst = _.argumentsArrayMake( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'argumentsArray' );

  /* - */

  test.open( 'bufferTyped' );

  test.case = 'identical ranges';
  var dst = new U8x( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new U8x( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = new I8x( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new I8x( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new U16x( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new U16x( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = new I16x( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new I16x( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new U32x( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new U32x( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new I32x( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new I32x( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new F32x( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new F32x( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new F64x( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new F64x( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new U8x( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.rangeClamp( dst, clamp );
  test.identical( got, new U8x( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'bufferTyped' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeClamp() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ) );

  test.case = 'dstRange is not a range';
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 1, 2, 3 ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 1, 'wrong' ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.rangeClamp( [ undefined, 1 ], [ 3, 4 ] ) );

  test.case = 'clampRange is not a range';
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 3, 4 ], [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 3, 4 ], [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.rangeClamp( [ 3, 4 ], [ undefined, 1 ] ) );
}

//

function rangeCountElements( test )
{
  test.case = 'increment - zero, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ], 0 );
  test.identical( got, 0 );

  test.case = 'increment - zero, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ], 0 );
  test.identical( got, 0 );

  test.case = 'increment - zero, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ], 0 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - 1, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ], 1 );
  test.identical( got, 5 );

  test.case = 'increment - 1, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ], 1 );
  test.identical( got, -5 );

  test.case = 'increment - 1, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ], 1 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - undefined, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ], undefined );
  test.identical( got, 5 );

  test.case = 'increment - undefined, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ], undefined );
  test.identical( got, -5 );

  test.case = 'increment - undefined, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ], undefined );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - not passed, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ] );
  test.identical( got, 5 );

  test.case = 'increment - not passed, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ] );
  test.identical( got, -5 );

  test.case = 'increment - not passed, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ] );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - -1, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ], -1 );
  test.identical( got, -5 );

  test.case = 'increment - -1, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ], -1 );
  test.identical( got, 5 );

  test.case = 'increment - -1, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ], -1 );
  test.identical( got, -0 );

  /* */

  test.case = 'increment - 5, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ], 5 );
  test.identical( got, 1 );

  test.case = 'increment - 5, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ], 5 );
  test.identical( got, -1 );

  test.case = 'increment - 5, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ], 5 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - -5, positive substruction result';
  var got = _.rangeCountElements( [ 1, 6 ], -5 );
  test.identical( got, -1 );

  test.case = 'increment - -5, negative substruction result';
  var got = _.rangeCountElements( [ 6, 1 ], -5 );
  test.identical( got, 1 );

  test.case = 'increment - 5, zero substruction result';
  var got = _.rangeCountElements( [ 5, 5 ], -5 );
  test.identical( got, -0 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeCountElements() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeCountElements( [ 1, 2 ], 1, 'extra' ) );

  test.case = 'range is not a range';
  test.shouldThrowErrorSync( () => _.rangeCountElements( [ 1, 2, 3 ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.rangeCountElements( [ 1, 'wrong' ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.rangeCountElements( [ undefined, 1 ], [ 3, 4 ] ) );

  test.case = 'increment is not a number and not undefined';
  test.shouldThrowErrorSync( () => _.rangeCountElements( [ 1, 2 ], 'wrong' ) );
}

//

function rangeFirstGet( test )
{
  test.open( 'range - array' );

  test.case = 'without options';
  var got = _.rangeFirstGet( [ 1, 2 ] );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeFirstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeFirstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( [ 1, 2 ], options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - array' );

  /* - */

  test.open( 'range - unroll' );

  test.case = 'without options';
  var got = _.rangeFirstGet( _.unrollMake( [ 1, 2 ] ) );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeFirstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeFirstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - unroll' );

  /* - */

  test.open( 'range - argumentsArray' );

  test.case = 'without options';
  var got = _.rangeFirstGet( _.argumentsArrayMake( [ 1, 2 ] ) );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeFirstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeFirstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - argumentsArray' );

  /* - */

  test.open( 'range - BufferTyped' );

  test.case = 'without options';
  var got = _.rangeFirstGet( new U8x( [ 1, 2 ] ) );
  test.identical( got, 1 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeFirstGet( new I16x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeFirstGet( new F32x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( new F64x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( new I8x( [ 1, 2 ] ), options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - BufferTyped' );

  /* - */

  test.open( 'range - map' );

  test.case = 'without options, first - undefined';
  var got = _.rangeFirstGet( { first : undefined, last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, first - not exists';
  var got = _.rangeFirstGet( { last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, first - number';
  var got = _.rangeFirstGet( { first : 1, last : undefined } );
  test.identical( got, 1 );

  /* */

  test.case = 'options - undefined, first - undefined';
  var options = undefined;
  var got = _.rangeFirstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, first - not exists';
  var options = undefined;
  var got = _.rangeFirstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, first - number';
  var options = undefined;
  var got = _.rangeFirstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, undefined );

  /* */

  test.case = 'options - empty map, first - undefined';
  var options = {};
  var got = _.rangeFirstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, first - not exists';
  var options = {};
  var got = _.rangeFirstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, first - number';
  var options = {};
  var got = _.rangeFirstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  /* */

  test.case = 'options - map with own field increment, first - undefined';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, first - not exists';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, first - number';
  var options = { increment : 2 };
  var got = _.rangeFirstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, { increment : 2 } );

  /* */

  test.case = 'options - map with own field increment - undefined, first - undefined';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, first - not exists';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( { last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, first - number';
  var options = { increment : undefined };
  var got = _.rangeFirstGet( { first : 1, last : undefined }, options );
  test.identical( got, 1 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - map' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeFirstGet() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeFirstGet( [ 1, 2 ], {}, 'extra' ) );

  test.case = 'range is a long, but is not a range';
  test.shouldThrowErrorSync( () => _.rangeFirstGet( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.rangeFirstGet( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.rangeFirstGet( [ undefined, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.rangeFirstGet( new Set( [ 1, 2 ] ) ) );
  test.shouldThrowErrorSync( () => _.rangeFirstGet( new Map( [ [ 1, 2 ] ] ) ) );
}

//

function rangeLastGet( test )
{
  test.open( 'range - array' );

  test.case = 'without options';
  var got = _.rangeLastGet( [ 1, 2 ] );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeLastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeLastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeLastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeLastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - array' );

  /* - */

  test.open( 'range - unroll' );

  test.case = 'without options';
  var got = _.rangeLastGet( _.unrollMake( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeLastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeLastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeLastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeLastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - unroll' );

  /* - */

  test.open( 'range - argumentsArray' );

  test.case = 'without options';
  var got = _.rangeLastGet( _.argumentsArrayMake( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeLastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeLastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeLastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeLastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - argumentsArray' );

  /* - */

  test.open( 'range - BufferTyped' );

  test.case = 'without options';
  var got = _.rangeLastGet( new U8x( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.rangeLastGet( new I16x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.rangeLastGet( new F32x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.rangeLastGet( new F64x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.rangeLastGet( new I8x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - BufferTyped' );

  /* - */

  test.open( 'range - map' );

  test.case = 'without options, last - undefined';
  var got = _.rangeLastGet( { first : undefined, last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, last - not exists';
  var got = _.rangeLastGet( { first : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, last - number';
  var got = _.rangeLastGet( { first : 1, last : 2 } );
  test.identical( got, 2 );

  /* */

  test.case = 'options - undefined, last - undefined';
  var options = undefined;
  var got = _.rangeLastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, last - not exists';
  var options = undefined;
  var got = _.rangeLastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, last - number';
  var options = undefined;
  var got = _.rangeLastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  /* */

  test.case = 'options - empty map, last - undefined';
  var options = {};
  var got = _.rangeLastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, last - not exists';
  var options = {};
  var got = _.rangeLastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, last - number';
  var options = {};
  var got = _.rangeLastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  /* */

  test.case = 'options - map with own field increment, last - undefined';
  var options = { increment : 2 };
  var got = _.rangeLastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, last - not exists';
  var options = { increment : 2 };
  var got = _.rangeLastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, last - number';
  var options = { increment : 2 };
  var got = _.rangeLastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  /* */

  test.case = 'options - map with own field increment - undefined, last - undefined';
  var options = { increment : undefined };
  var got = _.rangeLastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, last - not exists';
  var options = { increment : undefined };
  var got = _.rangeLastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, last - number';
  var options = { increment : undefined };
  var got = _.rangeLastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - map' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeLastGet() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeLastGet( [ 1, 2 ], {}, 'extra' ) );

  test.case = 'range is a long, but is not a range';
  test.shouldThrowErrorSync( () => _.rangeLastGet( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.rangeLastGet( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.rangeLastGet( [ undefined, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.rangeLastGet( new Set( [ 1, 2 ] ) ) );
  test.shouldThrowErrorSync( () => _.rangeLastGet( new Map( [ [ 1, 2 ] ] ) ) );
}

//

function rangeToStr( test )
{
  test.case = 'range';
  var got = _.rangeToStr( [ 1, 2 ] );
  test.identical( got, '1..2' );

  test.case = 'range with negative numbers';
  var got = _.rangeToStr( [ -1, -2 ] );
  test.identical( got, '-1..-2' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeToStr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeToStr( [ 1, 2 ], [ 1, 2 ] ) );

  test.case = 'range is not a range';
  test.shouldThrowErrorSync( () => _.rangeToStr( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.rangeToStr( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.rangeToStr( [ undefined, 1 ] ) );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.Range',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // range l0/l3/iRange.s

    rangeIs,
    rangeIsEmpty,
    rangeIsPopulated,

    rangeInInclusive,
    rangeInExclusive,
    rangeInInclusiveLeft,
    rangeInInclusiveRight,

    sureInRange,
    assertInRange,

    // range, l0/l5/fRange.s

    rangeFromLeft,
    rangeFromRight, /* qqq : fix */
    rangeFromSingle,

    rangeClamp,
    rangeCountElements,
    rangeFirstGet,
    rangeLastGet,

    rangeToStr,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
