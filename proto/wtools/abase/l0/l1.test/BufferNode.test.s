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
// buffer
// --

function bufferNodeIs( test )
{
  if( !Config.interpreter === 'njs' )
  return;

  isTemplate( { method : 'nodeIs' } );
  isTemplate( { method : 'nodeIsOLd' } )

  function isTemplate ( env )
  {
    test.case = 'node buffer';
    var src = BufferNode.alloc( 10 );
    var got =  _.bufferNode[ env.method ]( src );
    test.identical( got, true );

    test.case = 'buffer node from array';
    var src = BufferNode.from( [ 2, 4 ] );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, true );

    test.case = 'extra arguments';
    var src = BufferNode.from( [ 1, 2 ] );
    var got = _.bufferNode[ env.method ]( src, new SharedArrayBuffer( 1 ) );
    test.identical( got, true );

    test.case = 'node buffer with chracter encoding';
    var src = BufferNode.from( 'tést', 'latin1' );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, true );

    test.case = 'Uninitialized node buffer'
    var src = BufferNode.allocUnsafe( 10 );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, true );

    test.case = 'Node Buffer using truncated bytes'
    var src = BufferNode.from( [ 257, 257.5, -255, '1' ] );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, true );

    test.case = 'typed array';
    var src = new F32x( [ 1, 2 ] );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, false );

    test.case = 'U8xClamped Array';
    var src = new U8xClamped( 10*10*4 );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, false );

    test.case = 'array buffer';
    var src = new BufferRaw( [ 1, 2 ] );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, false );

    test.case = 'shared array buffer';
    var src = new SharedArrayBuffer( [ 1, 2 ] );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, false );

    test.case = 'view buffer, BufferRaw';
    var src = new BufferView( new BufferRaw( [ 10 ] ) );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, false );

    test.case = 'view buffer, SharedArrayBuffer';
    var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
    var got = _.bufferNode[ env.method ]( src );
    test.identical( got, false );

    test.case = 'no arguments';
    var got = _.bufferNode[ env.method ]();
    test.identical( got, false );
  }
}

//

function isPerformance( test )
{
  /* Average of 10 runs of 5 million iterations of 14 input variants
     Values below are in seconds
  ╔═══════════════════╤══════╤═════════╗
  ║                   │nodeIs│nodeIsOld║
  ╟───────────────────┼──────┼─────────╢
  ║ **Njs : v10.24.1**│0.883 │  0.839  ║
  ╟───────────────────┼──────┼─────────╢
  ║ **Njs : v14.17.0**│1.057 │  0.989  ║
  ╟───────────────────┼──────┼─────────╢
  ║Kos : Njs : v12.9.1│      │         ║
  ╚═══════════════════╧══════╧═════════╝
  */

  if( !Config.interpreter === 'njs' )
  return;

  debugger; /* eslint-disable-line no-debugger */
  var debugFlag = Config.debug;
  Config.debug = false;

  /* */

  isPerformanceTemplate( { method : 'nodeIs' } );
  isPerformanceTemplate( { method : 'nodeIsOLd' } );

  /* */

  Config.debug = debugFlag;
  debugger; /* eslint-disable-line no-debugger */

  /* */

  function isPerformanceTemplate( data )
  {
    test.case = `${data.method}`;
    var took, time;
    var env = initializeVariables();

    time = _.time.now();
    for( let i = env.times; i > 0; i-- )
    {
      env.name = data.method;
      run( env );
    }
    took = __.time.spent( time );

    console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
    test.identical( true, true );
  }

  /* */

  function initializeVariables()
  {
    var env = {};
    env.times = 5000000;
    env.aNodeBuffer = BufferNode.alloc( 10 );
    env.bufferNodeFromArray = BufferNode.from( [ 2, 4 ] );
    env.nodeBufferWithCharacterEncoding = BufferNode.from( 'tést', 'latin1' );
    env.uninitalizedNodeBuffer = BufferNode.allocUnsafe( 10 );
    env.truncatedNodeBuffer = BufferNode.from( [ 257, 257.5, -255, '1' ] );

    env.aTypedArray = new F32x( [ 1, 2 ] );
    env.U8xClampedArray = new U8xClamped( 10*10*4 );
    env.bufferRaw = new BufferRaw( [ 1, 2 ] );
    env.sharedArrayBuffer = new SharedArrayBuffer( [ 1, 2 ] );
    env.bufferViewFromBufferRaw = new BufferView( new BufferRaw( [ 10 ] ) );
    env.BufferViewFromSharedArrayBuffer = new BufferView( new SharedArrayBuffer( [ 10 ] ) );

    return env;
  }

  /* */

  function run( env )
  {
    _.bufferNode[ env.name ]( env.aNodeBuffer );
    _.bufferNode[ env.name ]( env.bufferNodeFromArray );
    _.bufferNode[ env.name ]( env.nodeBufferWithCharacterEncoding );
    _.bufferNode[ env.name ]( env.uninitalizedNodeBuffer );
    _.bufferNode[ env.name ]( env.truncatedNodeBuffer );
    _.bufferNode[ env.name ]( env.aNodeBuffer, env.bufferNodeFromArray );

    _.bufferNode[ env.name ]( env.aTypedArray );
    _.bufferNode[ env.name ]( env.U8xClampedArray );
    _.bufferNode[ env.name ]( env.bufferRaw );
    _.bufferNode[ env.name ]( env.sharedArrayBuffer );
    _.bufferNode[ env.name ]( env.bufferViewFromBufferRaw );
    _.bufferNode[ env.name ]( env.BufferViewFromSharedArrayBuffer );
    _.bufferNode[ env.name ]();
    _.bufferNode[ env.name ]( 123 );
  }
}

isPerformance.timeOut = 1e7;
isPerformance.experimental = true;

// --
// declaration
// --

const Proto =
{

  name : 'Tools.BufferNode.l0.l1',
  silencing : 1,
  enabled : 1,
  routineTimeOut : 10000,

  tests :
  {

    bufferNodeIs,
    isPerformance

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
