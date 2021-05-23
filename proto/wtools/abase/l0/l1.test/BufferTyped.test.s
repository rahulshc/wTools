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

function isUsingGetPrototype( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingGetPrototype( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingGetPrototype( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingGetPrototype( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingGetPrototype( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingGetPrototype( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingGetPrototype( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingGetPrototype( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingGetPrototype( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingGetPrototype( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingGetPrototype( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingGetPrototype( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingGetPrototype( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingGetPrototype( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingGetPrototype( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingGetPrototype( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingGetPrototype( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingGetPrototype( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingGetPrototype( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingGetPrototype();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingGetPrototype( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingGetPrototype( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingGetPrototype( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingGetPrototype( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isUsingGetPrototypeAndFunctor( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingGetPrototypeAndFunctor( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isUsingGetPrototypeSimplified( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingGetPrototypeSimplified( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isUsingGetPrototypeAndEquality( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingGetPrototypeAndEquality( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isUsingSet( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingSet( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingSet( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingSet( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingSet( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingSet( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingSet( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingSet( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingSet( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingSet( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingSet( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingSet( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingSet( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingSet( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingSet( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingSet( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingSet( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingSet( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingSet( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingSet();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingSet( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingSet( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingSet( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingSet( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isUsingHashMap( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingHashMap( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingHashMap( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingHashMap( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingHashMap( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingHashMap( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingHashMap( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingHashMap( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingHashMap( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingHashMap( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingHashMap( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingHashMap( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingHashMap( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingHashMap( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingHashMap( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingHashMap( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingHashMap( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingHashMap( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingHashMap( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingHashMap();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingHashMap( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingHashMap( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingHashMap( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingHashMap( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isUsingExistenceOfField( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingExistenceOfField( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingExistenceOfField( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingExistenceOfField( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingExistenceOfField( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingExistenceOfField( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingExistenceOfField( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingExistenceOfField( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingExistenceOfField( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingExistenceOfField( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingExistenceOfField( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingExistenceOfField();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingExistenceOfField( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingExistenceOfField( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingExistenceOfField( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingExistenceOfField( false );
  var expected  = false;
  test.identical( got, expected );
}

//

function isPerformance( test )
{
  /*
    Average of 10 runs of 1 million iteration of 23 _.bufferTyped.is variations
    Values below are in seconds
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    |                   |  Original |    Get    |Get Prototype| Map         |   Type    |   Set    | HashMap    | Existence  |
    |                   |           |  Prototype|   & Functor |             |  Equality |          |            |  of Field  |
    | :---------------: |:----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    | **Njs : v10.24.1**|
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    | **Njs : v14.17.0**|
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    | **Njs : v15.14.0**|
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    |Kos : Njs : v12.9.1|
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |

    = qqq : for Rahul : bad table. use name of routines in header. update.

    = qqq : for Rahul : implement generating of the table using __.strTable()
    use example https://github.com/Wandalen/wStringsExtra/blob/master/proto/wtools/abase/l5.test/StringTools.test.s#L9830
  test.case = 'topHead';
  var exp =
`╔═══════════╗
║head12  3  ║
╟───────────╢
║ a13 b  c  ║
║  d  ef1313║
║  g  h  i  ║
║  k        ║
╚═══════════╝`;
  var dim = [ 4, 3 ];
  var data = [ 'a13', 'b', 'c', 'd', 'e', 'f1313', 'g', 'h', 'i', 'k', '', '' ];
  var style = 'doubleBorder';
  var topHead = [ 'head1', '2', '3' ];
  var got = _.strTable({ data, dim, style, topHead });
  test.identical( got.result, exp );

  */

  debugger;
  var debugFlag = Config.debug;
  Config.debug = false;

  /* */

  test.case = 'is';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'is';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isSlow';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isSlow';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isUsingGetPrototype';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingGetPrototype';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isUsingGetPrototypeWithFunctor';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingGetPrototypeWithFunctor';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isUsingExistenceOfField';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingExistenceOfField';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  // test.case = 'usingGetPrototype and Functor';
  // var took, time;
  // var env = initializeVariables();
  //
  // time = _.time.now();
  // for( let i = env.times; i > 0; i-- )
  // {
  //   env.name = 'isUsingGetPrototypeAndFunctor';
  //   run( env );
  // }
  // took = __.time.spent( time );
  //
  // console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  // test.identical( true, true );

  /* */

  // test.case = 'usingGetPrototype Simplified';
  // var took, time;
  // var env = initializeVariables();
  //
  // time = _.time.now();
  // for( let i = env.times; i > 0; i-- )
  // {
  //   env.name = 'isUsingGetPrototypeSimplified';
  //   run( env );
  // }
  // took = __.time.spent( time );
  //
  // console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  // test.identical( true, true );

  /* */

  // test.case = 'isUsingGetPrototypeAndEquality';
  // var took, time;
  // var env = initializeVariables();
  //
  // time = _.time.now();
  // for( let i = env.times; i > 0; i-- )
  // {
  //   env.name = 'isUsingGetPrototypeAndEquality';
  //   run( env );
  // }
  // took = __.time.spent( time );
  //
  // console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  // test.identical( true, true );

  /* */

  test.case = 'isUsingSet';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingSet';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isUsingHashMap';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingHashMap';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isUsingMap';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingMap';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

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
    env.anEmptyMap = {};
    env.aMapWithFieldBuffer = { buffer : [] };
    return env;
  }

  /**/

  function run( env )
  {
    _.bufferTyped[ env.name ]( env.bigUint64Array );
    _.bufferTyped[ env.name ]( env.uint32Array );
    _.bufferTyped[ env.name ]( env.uint16Array );
    _.bufferTyped[ env.name ]( env.uint8Array );
    _.bufferTyped[ env.name ]( env.uint8ClampedArray );
    _.bufferTyped[ env.name ]( env.bigInt64Array );
    _.bufferTyped[ env.name ]( env.int32Array );
    _.bufferTyped[ env.name ]( env.int16Array );
    _.bufferTyped[ env.name ]( env.int8Array );
    _.bufferTyped[ env.name ]( env.float64Array );
    _.bufferTyped[ env.name ]( env.float32Array );
    _.bufferTyped[ env.name ]( env.bufferNode );
    _.bufferTyped[ env.name ]( env.rawArrayBuffer );
    _.bufferTyped[ env.name ]( env.sharedArrayBuffer );
    _.bufferTyped[ env.name ]( env.nonEmptyArray );
    _.bufferTyped[ env.name ]( arguments );
    _.bufferTyped[ env.name ]( env.aNumber );
    _.bufferTyped[ env.name ]( env.anEmptyMap );
    _.bufferTyped[ env.name ]( env.aMapWithFieldBuffer );
    _.bufferTyped[ env.name ]();
    _.bufferTyped[ env.name ]( null );
    _.bufferTyped[ env.name ]( env.anEmptyRoutine );
    _.bufferTyped[ env.name ]( env.aString );
    _.bufferTyped[ env.name ]( env.aBoolean );
  }

  // function runForIs( env )
  // {
  //   _.bufferTyped.is( env.bigUint64Array );
  //   _.bufferTyped.is( env.uint32Array );
  //   _.bufferTyped.is( env.uint16Array );
  //   _.bufferTyped.is( env.uint8Array );
  //   _.bufferTyped.is( env.uint8ClampedArray );
  //   _.bufferTyped.is( env.bigInt64Array );
  //   _.bufferTyped.is( env.int32Array );
  //   _.bufferTyped.is( env.int16Array );
  //   _.bufferTyped.is( env.int8Array );
  //   _.bufferTyped.is( env.float64Array );
  //   _.bufferTyped.is( env.float32Array );
  //   _.bufferTyped.is( env.bufferNode );
  //   _.bufferTyped.is( env.rawArrayBuffer );
  //   _.bufferTyped.is( env.sharedArrayBuffer );
  //   _.bufferTyped.is( env.nonEmptyArray );
  //   _.bufferTyped.is( arguments );
  //   _.bufferTyped.is( env.aNumber );
  //   _.bufferTyped.is( env.anEmptyMap );
  //   _.bufferTyped.is();
  //   _.bufferTyped.is( null );
  //   _.bufferTyped.is( env.anEmptyRoutine );
  //   _.bufferTyped.is( env.aString );
  //   _.bufferTyped.is( env.aBoolean );
  // }
  //
  // function runForGetPrototype( env )
  // {
  //   _.bufferTyped.isUsingGetPrototype( env.bigUint64Array );
  //   _.bufferTyped.isUsingGetPrototype( env.uint32Array );
  //   _.bufferTyped.isUsingGetPrototype( env.uint16Array );
  //   _.bufferTyped.isUsingGetPrototype( env.uint8Array );
  //   _.bufferTyped.isUsingGetPrototype( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingGetPrototype( env.bigInt64Array );
  //   _.bufferTyped.isUsingGetPrototype( env.int32Array );
  //   _.bufferTyped.isUsingGetPrototype( env.int16Array );
  //   _.bufferTyped.isUsingGetPrototype( env.int8Array );
  //   _.bufferTyped.isUsingGetPrototype( env.float64Array );
  //   _.bufferTyped.isUsingGetPrototype( env.float32Array );
  //   _.bufferTyped.isUsingGetPrototype( env.bufferNode );
  //   _.bufferTyped.isUsingGetPrototype( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototype( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototype( env.nonEmptyArray );
  //   _.bufferTyped.isUsingGetPrototype( arguments );
  //   _.bufferTyped.isUsingGetPrototype( env.aNumber );
  //   _.bufferTyped.isUsingGetPrototype( env.anEmptyMap );
  //   _.bufferTyped.isUsingGetPrototype();
  //   _.bufferTyped.isUsingGetPrototype( null );
  //   _.bufferTyped.isUsingGetPrototype( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingGetPrototype( env.aString );
  //   _.bufferTyped.isUsingGetPrototype( env.aBoolean );
  // }
  //
  // function runForGetProtoTypeAndFunctor( env )
  // {
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.bigUint64Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint32Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint16Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint8Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.bigInt64Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.int32Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.int16Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.int8Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.float64Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.float32Array );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.bufferNode );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.nonEmptyArray );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( arguments );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.aNumber );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.anEmptyMap );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor();
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( null );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.aString );
  //   _.bufferTyped.isUsingGetPrototypeAndFunctor( env.aBoolean );
  // }
  //
  // function runForGetPrototypeSimplified( env )
  // {
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.bigUint64Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.uint32Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.uint16Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.uint8Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.bigInt64Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.int32Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.int16Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.int8Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.float64Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.float32Array );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.bufferNode );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.nonEmptyArray );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( arguments );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.aNumber );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.anEmptyMap );
  //   _.bufferTyped.isUsingGetPrototypeSimplified();
  //   _.bufferTyped.isUsingGetPrototypeSimplified( null );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.aString );
  //   _.bufferTyped.isUsingGetPrototypeSimplified( env.aBoolean );
  // }
  //
  // function runForUsingTypeEquality( env )
  // {
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.bigUint64Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint32Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint16Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint8Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.bigInt64Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.int32Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.int16Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.int8Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.float64Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.float32Array );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.bufferNode );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.nonEmptyArray );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( arguments );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.aNumber );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.anEmptyMap );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality();
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( null );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.aString );
  //   _.bufferTyped.isUsingGetPrototypeAndEquality( env.aBoolean );
  // }
  //
  // function runForSet( env )
  // {
  //   _.bufferTyped.isUsingSet( env.bigUint64Array );
  //   _.bufferTyped.isUsingSet( env.uint32Array );
  //   _.bufferTyped.isUsingSet( env.uint16Array );
  //   _.bufferTyped.isUsingSet( env.uint8Array );
  //   _.bufferTyped.isUsingSet( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingSet( env.bigInt64Array );
  //   _.bufferTyped.isUsingSet( env.int32Array );
  //   _.bufferTyped.isUsingSet( env.int16Array );
  //   _.bufferTyped.isUsingSet( env.int8Array );
  //   _.bufferTyped.isUsingSet( env.float64Array );
  //   _.bufferTyped.isUsingSet( env.float32Array );
  //   _.bufferTyped.isUsingSet( env.bufferNode );
  //   _.bufferTyped.isUsingSet( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingSet( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingSet( env.nonEmptyArray );
  //   _.bufferTyped.isUsingSet( arguments );
  //   _.bufferTyped.isUsingSet( env.aNumber );
  //   _.bufferTyped.isUsingSet( env.anEmptyMap );
  //   _.bufferTyped.isUsingSet();
  //   _.bufferTyped.isUsingSet( null );
  //   _.bufferTyped.isUsingSet( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingSet( env.aString );
  //   _.bufferTyped.isUsingSet( env.aBoolean );
  // }
  //
  // function runForMap( env )
  // {
  //   _.bufferTyped.isUsingHashMap( env.bigUint64Array );
  //   _.bufferTyped.isUsingHashMap( env.uint32Array );
  //   _.bufferTyped.isUsingHashMap( env.uint16Array );
  //   _.bufferTyped.isUsingHashMap( env.uint8Array );
  //   _.bufferTyped.isUsingHashMap( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingHashMap( env.bigInt64Array );
  //   _.bufferTyped.isUsingHashMap( env.int32Array );
  //   _.bufferTyped.isUsingHashMap( env.int16Array );
  //   _.bufferTyped.isUsingHashMap( env.int8Array );
  //   _.bufferTyped.isUsingHashMap( env.float64Array );
  //   _.bufferTyped.isUsingHashMap( env.float32Array );
  //   _.bufferTyped.isUsingHashMap( env.bufferNode );
  //   _.bufferTyped.isUsingHashMap( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingHashMap( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingHashMap( env.nonEmptyArray );
  //   _.bufferTyped.isUsingHashMap( arguments );
  //   _.bufferTyped.isUsingHashMap( env.aNumber );
  //   _.bufferTyped.isUsingHashMap( env.anEmptyMap );
  //   _.bufferTyped.isUsingHashMap();
  //   _.bufferTyped.isUsingHashMap( null );
  //   _.bufferTyped.isUsingHashMap( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingHashMap( env.aString );
  //   _.bufferTyped.isUsingHashMap( env.aBoolean );
  // }
  //
  // function runForExistenceOfField( env )
  // {
  //   _.bufferTyped.isUsingExistenceOfField( env.bigUint64Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.uint32Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.uint16Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.uint8Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.uint8ClampedArray );
  //   _.bufferTyped.isUsingExistenceOfField( env.bigInt64Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.int32Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.int16Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.int8Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.float64Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.float32Array );
  //   _.bufferTyped.isUsingExistenceOfField( env.bufferNode );
  //   _.bufferTyped.isUsingExistenceOfField( env.rawArrayBuffer );
  //   _.bufferTyped.isUsingExistenceOfField( env.sharedArrayBuffer );
  //   _.bufferTyped.isUsingExistenceOfField( env.nonEmptyArray );
  //   _.bufferTyped.isUsingExistenceOfField( arguments );
  //   _.bufferTyped.isUsingExistenceOfField( env.aNumber );
  //   _.bufferTyped.isUsingExistenceOfField( env.anEmptyMap );
  //   _.bufferTyped.isUsingExistenceOfField();
  //   _.bufferTyped.isUsingExistenceOfField( null );
  //   _.bufferTyped.isUsingExistenceOfField( env.anEmptyRoutine );
  //   _.bufferTyped.isUsingExistenceOfField( env.aString );
  //   _.bufferTyped.isUsingExistenceOfField( env.aBoolean );
  // }

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
    isUsingGetPrototype,
    isUsingGetPrototypeAndFunctor,
    isUsingGetPrototypeSimplified,
    isUsingGetPrototypeAndEquality,
    isUsingSet,
    isUsingHashMap,
    isUsingExistenceOfField,
    isPerformance,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
