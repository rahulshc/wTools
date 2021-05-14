( function _l0_l1_Buffer_test_s_()
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

function isPerformance( test )
{
  /*
    Average of 10 runs of 5 million iteration of 13 _.long.is variations
    Values below are in seconds
    |-------------------|-------------------|-------------------|
    |                   |   debug: false    |   debug: true     |
    | :---------------: |:---------------:  |:---------------:  |
    | **Njs : v10.24.1**|                   |                   |
    |-------------------|-------------------|-------------------|
    | **Njs : v12.22.1**|                   |                   |
    |-------------------|-------------------|-------------------|
    | **Njs : v14.17.0**|                   |                   |
    |-------------------|-------------------|-------------------|
    | **Njs : v15.14.0**|                   |                   |
    |-------------------|-------------------|-------------------|
  */
  var debugFlag = Config.debug;
  Config.debug = false;

  test.case = 'Typed Buffer Performance Test';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    runVariations( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  Config.debug = debugFlag;

  /* - */

  function initializeVariables()
  {
    var env = {};
    env.times = 5000000;
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

  function runVariations( env )
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
    isPerformance
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
