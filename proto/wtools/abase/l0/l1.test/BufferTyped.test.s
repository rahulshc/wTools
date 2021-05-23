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

function isUsingMap( test )
{
  test.case = 'BigUint64Array';
  var got = _.bufferTyped.isUsingMap( new U64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint32Array';
  var got = _.bufferTyped.isUsingMap( new U32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint16Array';
  var got = _.bufferTyped.isUsingMap( new U16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8Array';
  var got = _.bufferTyped.isUsingMap( new U8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.isUsingMap( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.isUsingMap( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int32Array';
  var got = _.bufferTyped.isUsingMap( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int16Array';
  var got = _.bufferTyped.isUsingMap( new I16x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Int8Array';
  var got = _.bufferTyped.isUsingMap( new I8x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float64Array';
  var got = _.bufferTyped.isUsingMap( new F64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.isUsingMap( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.isUsingMap( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.isUsingMap( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.isUsingMap( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.isUsingMap( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.isUsingMap( arguments );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.isUsingMap( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.isUsingMap( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.bufferTyped.isUsingMap();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.bufferTyped.isUsingMap( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.bufferTyped.isUsingMap( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.bufferTyped.isUsingMap( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.bufferTyped.isUsingMap( false );
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

function isPerformance( test )
{
  /*
    Average of 10 runs of 1 million iteration of 23 _.bufferTyped.is variations
    Values below are in seconds
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    |                   |  Original |    Get    |Get Prototype|Get Prototype|   Type    |   Set    | Map        | Existence  |
    |                   |           |  Prototype|   & Functor | Simplified  |  Equality |          |            |  of Field  |
    | :---------------: |:----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    | **Njs : v10.24.1**|   5.400   |  0.459    |   0.457     |   0.444     |  2.023    |   4.166  |  4.193     |  1.209     |
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    | **Njs : v14.17.0**|   4.439   |  0.532    |   0.529     |    0.547    |  2.008    |  5.390   |  5.336     |  1.161     |
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    | **Njs : v15.14.0**|   6.288   |  0.464    |   0.465     |    0.466    |  1.995    |  5.434   |  5.325     |  1.046     |
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
    |Kos : Njs : v12.9.1|   5.664   |           |             |             |           |          |            |            |
    |-------------------|-----------|-----------|-------------|-------------|-----------|----------|----------- |----------- |
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

  test.case = 'Typed Buffer Performance Test using GetPrototype';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForGetPrototype( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test using using GetPrototype and Functor';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForGetProtoTypeAndFunctor( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test using using GetPrototype Simplified';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForGetPrototypeSimplified( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test Using GetPrototype And Equality';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForUsingTypeEquality( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance using Set';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForSet( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test using Map';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForMap( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  //

  test.case = 'Typed Buffer Performance Test using existence of field';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariationsForExistenceOfField( env );
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

  function runVariationsForGetPrototype( env )
  {
    _.bufferTyped.isUsingGetPrototype( env.bigUint64Array );
    _.bufferTyped.isUsingGetPrototype( env.uint32Array );
    _.bufferTyped.isUsingGetPrototype( env.uint16Array );
    _.bufferTyped.isUsingGetPrototype( env.uint8Array );
    _.bufferTyped.isUsingGetPrototype( env.uint8ClampedArray );
    _.bufferTyped.isUsingGetPrototype( env.bigInt64Array );
    _.bufferTyped.isUsingGetPrototype( env.int32Array );
    _.bufferTyped.isUsingGetPrototype( env.int16Array );
    _.bufferTyped.isUsingGetPrototype( env.int8Array );
    _.bufferTyped.isUsingGetPrototype( env.float64Array );
    _.bufferTyped.isUsingGetPrototype( env.float32Array );
    _.bufferTyped.isUsingGetPrototype( env.bufferNode );
    _.bufferTyped.isUsingGetPrototype( env.rawArrayBuffer );
    _.bufferTyped.isUsingGetPrototype( env.sharedArrayBuffer );
    _.bufferTyped.isUsingGetPrototype( env.nonEmptyArray );
    _.bufferTyped.isUsingGetPrototype( arguments );
    _.bufferTyped.isUsingGetPrototype( env.aNumber );
    _.bufferTyped.isUsingGetPrototype( env.anEmptyObject );
    _.bufferTyped.isUsingGetPrototype();
    _.bufferTyped.isUsingGetPrototype( null );
    _.bufferTyped.isUsingGetPrototype( env.anEmptyRoutine );
    _.bufferTyped.isUsingGetPrototype( env.aString );
    _.bufferTyped.isUsingGetPrototype( env.aBoolean );
  }

  function runVariationsForGetProtoTypeAndFunctor( env )
  {
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.bigUint64Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint32Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint16Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint8Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.uint8ClampedArray );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.bigInt64Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.int32Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.int16Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.int8Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.float64Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.float32Array );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.bufferNode );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.rawArrayBuffer );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.sharedArrayBuffer );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.nonEmptyArray );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( arguments );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.aNumber );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.anEmptyObject );
    _.bufferTyped.isUsingGetPrototypeAndFunctor();
    _.bufferTyped.isUsingGetPrototypeAndFunctor( null );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.anEmptyRoutine );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.aString );
    _.bufferTyped.isUsingGetPrototypeAndFunctor( env.aBoolean );
  }

  function runVariationsForGetPrototypeSimplified( env )
  {
    _.bufferTyped.isUsingGetPrototypeSimplified( env.bigUint64Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.uint32Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.uint16Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.uint8Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.uint8ClampedArray );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.bigInt64Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.int32Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.int16Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.int8Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.float64Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.float32Array );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.bufferNode );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.rawArrayBuffer );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.sharedArrayBuffer );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.nonEmptyArray );
    _.bufferTyped.isUsingGetPrototypeSimplified( arguments );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.aNumber );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.anEmptyObject );
    _.bufferTyped.isUsingGetPrototypeSimplified();
    _.bufferTyped.isUsingGetPrototypeSimplified( null );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.anEmptyRoutine );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.aString );
    _.bufferTyped.isUsingGetPrototypeSimplified( env.aBoolean );
  }

  function runVariationsForUsingTypeEquality( env )
  {
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.bigUint64Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint32Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint16Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint8Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.uint8ClampedArray );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.bigInt64Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.int32Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.int16Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.int8Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.float64Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.float32Array );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.bufferNode );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.rawArrayBuffer );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.sharedArrayBuffer );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.nonEmptyArray );
    _.bufferTyped.isUsingGetPrototypeAndEquality( arguments );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.aNumber );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.anEmptyObject );
    _.bufferTyped.isUsingGetPrototypeAndEquality();
    _.bufferTyped.isUsingGetPrototypeAndEquality( null );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.anEmptyRoutine );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.aString );
    _.bufferTyped.isUsingGetPrototypeAndEquality( env.aBoolean );
  }

  function runVariationsForSet( env )
  {
    _.bufferTyped.isUsingSet( env.bigUint64Array );
    _.bufferTyped.isUsingSet( env.uint32Array );
    _.bufferTyped.isUsingSet( env.uint16Array );
    _.bufferTyped.isUsingSet( env.uint8Array );
    _.bufferTyped.isUsingSet( env.uint8ClampedArray );
    _.bufferTyped.isUsingSet( env.bigInt64Array );
    _.bufferTyped.isUsingSet( env.int32Array );
    _.bufferTyped.isUsingSet( env.int16Array );
    _.bufferTyped.isUsingSet( env.int8Array );
    _.bufferTyped.isUsingSet( env.float64Array );
    _.bufferTyped.isUsingSet( env.float32Array );
    _.bufferTyped.isUsingSet( env.bufferNode );
    _.bufferTyped.isUsingSet( env.rawArrayBuffer );
    _.bufferTyped.isUsingSet( env.sharedArrayBuffer );
    _.bufferTyped.isUsingSet( env.nonEmptyArray );
    _.bufferTyped.isUsingSet( arguments );
    _.bufferTyped.isUsingSet( env.aNumber );
    _.bufferTyped.isUsingSet( env.anEmptyObject );
    _.bufferTyped.isUsingSet();
    _.bufferTyped.isUsingSet( null );
    _.bufferTyped.isUsingSet( env.anEmptyRoutine );
    _.bufferTyped.isUsingSet( env.aString );
    _.bufferTyped.isUsingSet( env.aBoolean );
  }

  function runVariationsForMap( env )
  {
    _.bufferTyped.isUsingMap( env.bigUint64Array );
    _.bufferTyped.isUsingMap( env.uint32Array );
    _.bufferTyped.isUsingMap( env.uint16Array );
    _.bufferTyped.isUsingMap( env.uint8Array );
    _.bufferTyped.isUsingMap( env.uint8ClampedArray );
    _.bufferTyped.isUsingMap( env.bigInt64Array );
    _.bufferTyped.isUsingMap( env.int32Array );
    _.bufferTyped.isUsingMap( env.int16Array );
    _.bufferTyped.isUsingMap( env.int8Array );
    _.bufferTyped.isUsingMap( env.float64Array );
    _.bufferTyped.isUsingMap( env.float32Array );
    _.bufferTyped.isUsingMap( env.bufferNode );
    _.bufferTyped.isUsingMap( env.rawArrayBuffer );
    _.bufferTyped.isUsingMap( env.sharedArrayBuffer );
    _.bufferTyped.isUsingMap( env.nonEmptyArray );
    _.bufferTyped.isUsingMap( arguments );
    _.bufferTyped.isUsingMap( env.aNumber );
    _.bufferTyped.isUsingMap( env.anEmptyObject );
    _.bufferTyped.isUsingMap();
    _.bufferTyped.isUsingMap( null );
    _.bufferTyped.isUsingMap( env.anEmptyRoutine );
    _.bufferTyped.isUsingMap( env.aString );
    _.bufferTyped.isUsingMap( env.aBoolean );
  }

  function runVariationsForExistenceOfField( env )
  {
    _.bufferTyped.isUsingExistenceOfField( env.bigUint64Array );
    _.bufferTyped.isUsingExistenceOfField( env.uint32Array );
    _.bufferTyped.isUsingExistenceOfField( env.uint16Array );
    _.bufferTyped.isUsingExistenceOfField( env.uint8Array );
    _.bufferTyped.isUsingExistenceOfField( env.uint8ClampedArray );
    _.bufferTyped.isUsingExistenceOfField( env.bigInt64Array );
    _.bufferTyped.isUsingExistenceOfField( env.int32Array );
    _.bufferTyped.isUsingExistenceOfField( env.int16Array );
    _.bufferTyped.isUsingExistenceOfField( env.int8Array );
    _.bufferTyped.isUsingExistenceOfField( env.float64Array );
    _.bufferTyped.isUsingExistenceOfField( env.float32Array );
    _.bufferTyped.isUsingExistenceOfField( env.bufferNode );
    _.bufferTyped.isUsingExistenceOfField( env.rawArrayBuffer );
    _.bufferTyped.isUsingExistenceOfField( env.sharedArrayBuffer );
    _.bufferTyped.isUsingExistenceOfField( env.nonEmptyArray );
    _.bufferTyped.isUsingExistenceOfField( arguments );
    _.bufferTyped.isUsingExistenceOfField( env.aNumber );
    _.bufferTyped.isUsingExistenceOfField( env.anEmptyObject );
    _.bufferTyped.isUsingExistenceOfField();
    _.bufferTyped.isUsingExistenceOfField( null );
    _.bufferTyped.isUsingExistenceOfField( env.anEmptyRoutine );
    _.bufferTyped.isUsingExistenceOfField( env.aString );
    _.bufferTyped.isUsingExistenceOfField( env.aBoolean );
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
    isUsingGetPrototype,
    isUsingGetPrototypeAndFunctor,
    isUsingGetPrototypeSimplified,
    isUsingGetPrototypeAndEquality,
    isUsingSet,
    isUsingMap,
    isUsingExistenceOfField,
    isPerformance,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
