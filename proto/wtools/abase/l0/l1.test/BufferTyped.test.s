( function _l0_l1_BufferTyped_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// declaration
// --

function is( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.is( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.is( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.is( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.is( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.is( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.is( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.is( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.is( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.is( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.is( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.is( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.is( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.is( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.is( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.is( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.is( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.is( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.is( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.is();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.is( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.is( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.is( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.is( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate1( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate1( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate1( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate1( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate1( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate1( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate1( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate1( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate1( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate1( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate1( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate1( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate1( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate1( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate1( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate1( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate1( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate1( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate1( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate1();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate1( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate1( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate1( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate1( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate2( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate2( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate2( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate2( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate2( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate2( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate2( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate2( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate2( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate2( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate2( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate2( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate2( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate2( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate2( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate2( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate2( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate2( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate2( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate2();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate2( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate2( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate2( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate2( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate3( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate3( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate3( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate3( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate3( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate3( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate3( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate3( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate3( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate3( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate3( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate3( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate3( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate3( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate3( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate3( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate3( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate3( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate3( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate3();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate3( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate3( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate3( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate3( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate4( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate4( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate4( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate4( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate4( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate4( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate4( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate4( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate4( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate4( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate4( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate4( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate4( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate4( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate4( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate4( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate4( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate4( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate4( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate4();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate4( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate4( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate4( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate4( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate5( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate5( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate5( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate5( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate5( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate5( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate5( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate5( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate5( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate5( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate5( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate5( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate5( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate5( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate5( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate5( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate5( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate5( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate5( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate5();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate5( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate5( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate5( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate5( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate6( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate6( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate6( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate6( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate6( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate6( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate6( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate6( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate6( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate6( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate6( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate6( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate6( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate6( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate6( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate6( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate6( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate6( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate6( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate6();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate6( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate6( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate6( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate6( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isAlternate7( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isAlternate7( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isAlternate7( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isAlternate7( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isAlternate7( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isAlternate7( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isAlternate7( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isAlternate7( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isAlternate7( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isAlternate7( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isAlternate7( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isAlternate7( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isAlternate7( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isAlternate7( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isAlternate7( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isAlternate7( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isAlternate7( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isAlternate7( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isAlternate7( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isAlternate7();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isAlternate7( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isAlternate7( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isAlternate7( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isAlternate7( false );
  var expected  = false;
  test.identical( got, expected );
}

function isPerformance( test )
{
  /*
    Average of 10 runs of 1 million iteration of 23 _.bufferTyped.is variations
    Values below are in seconds
    |-------------------|-----------|-----------|-------------|-------------|-------------|-------------- |-------------- |-------------- |
    |                   |  Original | Alternate1|  Alternate2 |  Alternate3 |  Alternate4 |   Alternate5  | Alternate6    | Alternate7    |
    | :---------------: |:----------|-----------|-------------|-------------|-------------|-------------- |-------------- |-------------- |
    | **Njs : v10.24.1**|   5.400   |           |             |             |             |               |               |               |
    |-------------------|-----------|-----------|-------------|-------------|-------------|-------------- |-------------- |-------------- |
    | **Njs : v14.17.0**|   4.439   |           |             |             |             |               |               |               |
    |-------------------|-----------|-----------|-------------|-------------|-------------|-------------- |-------------- |-------------- |
    | **Njs : v15.14.0**|   6.288   |           |             |             |             |               |               |               |
    |-------------------|-----------|-----------|-------------|-------------|-------------|-------------- |-------------- |-------------- |
    |Kos : Njs : v12.9.1|   5.664   |           |             |             |             |               |               |               |
    |-------------------|-----------|-----------|-------------|-------------|-------------|-------------- |-------------- |-------------- |
  */

  debugger;
  var debugFlag = Config.debug;
  Config.debug = false;

  test.case = 'Typed Buffer Performance Test Original Version';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForIs( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 1';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate1( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 2';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate2( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 3';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate3( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 4';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate4( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 5';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate5( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 6';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate6( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Alternate 7';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForAlternate7( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  Config.debug = debugFlag;
  debugger;

  /* - */

  function initializeVariables()
  {
    var env = {};
    env.times = 1000000;
    env.bigUint64Array = new U64x( 10 );
    env.uint32Array = new U32x( 10 );
    env.uint16Array = new U16x( 10 );
    env.uint8Array = new U8x( 10 );
    env.uint8ClampedArray = new U8xClamped( 10 );
    env.bigInt64Array = new I64x( 10 );
    env.int32Array = new I32x( 10 );
    env.int16Array = new I16x( 10 );
    env.int8Array = new I8x( 10 );
    env.float64Array = new F64x( 10 );
    env.float32Array = new F32x( 10 );
    env.bufferNode = BufferNode.alloc( 5 );
    env.rawArrayBuffer = new BufferRaw( 10 );
    env.sharedArrayBuffer = new BufferRawShared( 1024 );
    env.nonEmptyArray = [ 1, 2, 3 ];
    env.anEmptyRoutine = new function() {};
    env.aString = 'x';
    env.aNumber = 1;
    env.aBoolean = false;
    env.anEmptyObject = {};

    return env;
  }

  function runVariationsForIs( env )
  {
    _.bufferTyped.is( env.bigUint64Array );
    _.bufferTyped.is( env.uint32Array );
    _.bufferTyped.is( env.uint16Array );
    _.bufferTyped.is( env.uint8Array );
    _.bufferTyped.is( env.uint8ClampedArray );
    _.bufferTyped.is( env.bigInt64Array );
    _.bufferTyped.is( env.int32Array );
    _.bufferTyped.is( env.int16Array );
    _.bufferTyped.is( env.int8Array );
    _.bufferTyped.is( env.float64Array );
    _.bufferTyped.is( env.float32Array );
    _.bufferTyped.is( env.bufferNode );
    _.bufferTyped.is( env.rawArrayBuffer );
    _.bufferTyped.is( env.sharedArrayBuffer );
    _.bufferTyped.is( env.nonEmptyArray );
    _.bufferTyped.is( arguments );
    _.bufferTyped.is( env.aNumber );
    _.bufferTyped.is( env.anEmptyObject );
    _.bufferTyped.is();
    _.bufferTyped.is( null );
    _.bufferTyped.is( env.anEmptyRoutine );
    _.bufferTyped.is( env.aString );
    _.bufferTyped.is( env.aBoolean );
  }

  function runVariationsForAlternate1( env )
  {
    _.bufferTyped.isAlternate1( env.bigUint64Array );
    _.bufferTyped.isAlternate1( env.uint32Array );
    _.bufferTyped.isAlternate1( env.uint16Array );
    _.bufferTyped.isAlternate1( env.uint8Array );
    _.bufferTyped.isAlternate1( env.uint8ClampedArray );
    _.bufferTyped.isAlternate1( env.bigInt64Array );
    _.bufferTyped.isAlternate1( env.int32Array );
    _.bufferTyped.isAlternate1( env.int16Array );
    _.bufferTyped.isAlternate1( env.int8Array );
    _.bufferTyped.isAlternate1( env.float64Array );
    _.bufferTyped.isAlternate1( env.float32Array );
    _.bufferTyped.isAlternate1( env.bufferNode );
    _.bufferTyped.isAlternate1( env.rawArrayBuffer );
    _.bufferTyped.isAlternate1( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate1( env.nonEmptyArray );
    _.bufferTyped.isAlternate1( arguments );
    _.bufferTyped.isAlternate1( env.aNumber );
    _.bufferTyped.isAlternate1( env.anEmptyObject );
    _.bufferTyped.isAlternate1();
    _.bufferTyped.isAlternate1( null );
    _.bufferTyped.isAlternate1( env.anEmptyRoutine );
    _.bufferTyped.isAlternate1( env.aString );
    _.bufferTyped.isAlternate1( env.aBoolean );
  }

  function runVariationsForAlternate2( env )
  {
    _.bufferTyped.isAlternate2( env.bigUint64Array );
    _.bufferTyped.isAlternate2( env.uint32Array );
    _.bufferTyped.isAlternate2( env.uint16Array );
    _.bufferTyped.isAlternate2( env.uint8Array );
    _.bufferTyped.isAlternate2( env.uint8ClampedArray );
    _.bufferTyped.isAlternate2( env.bigInt64Array );
    _.bufferTyped.isAlternate2( env.int32Array );
    _.bufferTyped.isAlternate2( env.int16Array );
    _.bufferTyped.isAlternate2( env.int8Array );
    _.bufferTyped.isAlternate2( env.float64Array );
    _.bufferTyped.isAlternate2( env.float32Array );
    _.bufferTyped.isAlternate2( env.bufferNode );
    _.bufferTyped.isAlternate2( env.rawArrayBuffer );
    _.bufferTyped.isAlternate2( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate2( env.nonEmptyArray );
    _.bufferTyped.isAlternate2( arguments );
    _.bufferTyped.isAlternate2( env.aNumber );
    _.bufferTyped.isAlternate2( env.anEmptyObject );
    _.bufferTyped.isAlternate2();
    _.bufferTyped.isAlternate2( null );
    _.bufferTyped.isAlternate2( env.anEmptyRoutine );
    _.bufferTyped.isAlternate2( env.aString );
    _.bufferTyped.isAlternate2( env.aBoolean );
  }

  function runVariationsForAlternate3( env )
  {
    _.bufferTyped.isAlternate3( env.bigUint64Array );
    _.bufferTyped.isAlternate3( env.uint32Array );
    _.bufferTyped.isAlternate3( env.uint16Array );
    _.bufferTyped.isAlternate3( env.uint8Array );
    _.bufferTyped.isAlternate3( env.uint8ClampedArray );
    _.bufferTyped.isAlternate3( env.bigInt64Array );
    _.bufferTyped.isAlternate3( env.int32Array );
    _.bufferTyped.isAlternate3( env.int16Array );
    _.bufferTyped.isAlternate3( env.int8Array );
    _.bufferTyped.isAlternate3( env.float64Array );
    _.bufferTyped.isAlternate3( env.float32Array );
    _.bufferTyped.isAlternate3( env.bufferNode );
    _.bufferTyped.isAlternate3( env.rawArrayBuffer );
    _.bufferTyped.isAlternate3( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate3( env.nonEmptyArray );
    _.bufferTyped.isAlternate3( arguments );
    _.bufferTyped.isAlternate3( env.aNumber );
    _.bufferTyped.isAlternate3( env.anEmptyObject );
    _.bufferTyped.isAlternate3();
    _.bufferTyped.isAlternate3( null );
    _.bufferTyped.isAlternate3( env.anEmptyRoutine );
    _.bufferTyped.isAlternate3( env.aString );
    _.bufferTyped.isAlternate3( env.aBoolean );
  }

  function runVariationsForAlternate4( env )
  {
    _.bufferTyped.isAlternate4( env.bigUint64Array );
    _.bufferTyped.isAlternate4( env.uint32Array );
    _.bufferTyped.isAlternate4( env.uint16Array );
    _.bufferTyped.isAlternate4( env.uint8Array );
    _.bufferTyped.isAlternate4( env.uint8ClampedArray );
    _.bufferTyped.isAlternate4( env.bigInt64Array );
    _.bufferTyped.isAlternate4( env.int32Array );
    _.bufferTyped.isAlternate4( env.int16Array );
    _.bufferTyped.isAlternate4( env.int8Array );
    _.bufferTyped.isAlternate4( env.float64Array );
    _.bufferTyped.isAlternate4( env.float32Array );
    _.bufferTyped.isAlternate4( env.bufferNode );
    _.bufferTyped.isAlternate4( env.rawArrayBuffer );
    _.bufferTyped.isAlternate4( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate4( env.nonEmptyArray );
    _.bufferTyped.isAlternate4( arguments );
    _.bufferTyped.isAlternate4( env.aNumber );
    _.bufferTyped.isAlternate4( env.anEmptyObject );
    _.bufferTyped.isAlternate4();
    _.bufferTyped.isAlternate4( null );
    _.bufferTyped.isAlternate4( env.anEmptyRoutine );
    _.bufferTyped.isAlternate4( env.aString );
    _.bufferTyped.isAlternate4( env.aBoolean );
  }

  function runVariationsForAlternate5( env )
  {
    _.bufferTyped.isAlternate5( env.bigUint64Array );
    _.bufferTyped.isAlternate5( env.uint32Array );
    _.bufferTyped.isAlternate5( env.uint16Array );
    _.bufferTyped.isAlternate5( env.uint8Array );
    _.bufferTyped.isAlternate5( env.uint8ClampedArray );
    _.bufferTyped.isAlternate5( env.bigInt64Array );
    _.bufferTyped.isAlternate5( env.int32Array );
    _.bufferTyped.isAlternate5( env.int16Array );
    _.bufferTyped.isAlternate5( env.int8Array );
    _.bufferTyped.isAlternate5( env.float64Array );
    _.bufferTyped.isAlternate5( env.float32Array );
    _.bufferTyped.isAlternate5( env.bufferNode );
    _.bufferTyped.isAlternate5( env.rawArrayBuffer );
    _.bufferTyped.isAlternate5( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate5( env.nonEmptyArray );
    _.bufferTyped.isAlternate5( arguments );
    _.bufferTyped.isAlternate5( env.aNumber );
    _.bufferTyped.isAlternate5( env.anEmptyObject );
    _.bufferTyped.isAlternate5();
    _.bufferTyped.isAlternate5( null );
    _.bufferTyped.isAlternate5( env.anEmptyRoutine );
    _.bufferTyped.isAlternate5( env.aString );
    _.bufferTyped.isAlternate5( env.aBoolean );
  }

  function runVariationsForAlternate6( env )
  {
    _.bufferTyped.isAlternate6( env.bigUint64Array );
    _.bufferTyped.isAlternate6( env.uint32Array );
    _.bufferTyped.isAlternate6( env.uint16Array );
    _.bufferTyped.isAlternate6( env.uint8Array );
    _.bufferTyped.isAlternate6( env.uint8ClampedArray );
    _.bufferTyped.isAlternate6( env.bigInt64Array );
    _.bufferTyped.isAlternate6( env.int32Array );
    _.bufferTyped.isAlternate6( env.int16Array );
    _.bufferTyped.isAlternate6( env.int8Array );
    _.bufferTyped.isAlternate6( env.float64Array );
    _.bufferTyped.isAlternate6( env.float32Array );
    _.bufferTyped.isAlternate6( env.bufferNode );
    _.bufferTyped.isAlternate6( env.rawArrayBuffer );
    _.bufferTyped.isAlternate6( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate6( env.nonEmptyArray );
    _.bufferTyped.isAlternate6( arguments );
    _.bufferTyped.isAlternate6( env.aNumber );
    _.bufferTyped.isAlternate6( env.anEmptyObject );
    _.bufferTyped.isAlternate6();
    _.bufferTyped.isAlternate6( null );
    _.bufferTyped.isAlternate6( env.anEmptyRoutine );
    _.bufferTyped.isAlternate6( env.aString );
    _.bufferTyped.isAlternate6( env.aBoolean );
  }

  function runVariationsForAlternate7( env )
  {
    _.bufferTyped.isAlternate7( env.bigUint64Array );
    _.bufferTyped.isAlternate7( env.uint32Array );
    _.bufferTyped.isAlternate7( env.uint16Array );
    _.bufferTyped.isAlternate7( env.uint8Array );
    _.bufferTyped.isAlternate7( env.uint8ClampedArray );
    _.bufferTyped.isAlternate7( env.bigInt64Array );
    _.bufferTyped.isAlternate7( env.int32Array );
    _.bufferTyped.isAlternate7( env.int16Array );
    _.bufferTyped.isAlternate7( env.int8Array );
    _.bufferTyped.isAlternate7( env.float64Array );
    _.bufferTyped.isAlternate7( env.float32Array );
    _.bufferTyped.isAlternate7( env.bufferNode );
    _.bufferTyped.isAlternate7( env.rawArrayBuffer );
    _.bufferTyped.isAlternate7( env.sharedArrayBuffer );
    _.bufferTyped.isAlternate7( env.nonEmptyArray );
    _.bufferTyped.isAlternate7( arguments );
    _.bufferTyped.isAlternate7( env.aNumber );
    _.bufferTyped.isAlternate7( env.anEmptyObject );
    _.bufferTyped.isAlternate7();
    _.bufferTyped.isAlternate7( null );
    _.bufferTyped.isAlternate7( env.anEmptyRoutine );
    _.bufferTyped.isAlternate7( env.aString );
    _.bufferTyped.isAlternate7( env.aBoolean );
  }
}

isPerformance.timeOut = 1e7;
isPerformance.experimental = true;

// --
//
// --

const Proto =
{

  name : 'Tools.BufferTyped.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // bufferTyped, l0/l1
    is,
    isAlternate1,
    isAlternate2,
    isAlternate3,
    isAlternate4,
    isAlternate5,
    isAlternate6,
    isAlternate7,
    isPerformance,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
