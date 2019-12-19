( function _Time_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --

function _begin( test ) 
{
  test.open( 'delay - undefined, execute callbacks' );

  test.case = 'delay - undefined';
  var got = _.time._begin( undefined );
  got.time();
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, 2 );
  test.identical( got.result, undefined );

  test.case = 'delay - undefined, onTime';
  var onTime = () => 0;  
  var got = _.time._begin( undefined, onTime );
  got.time();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, 2 );
  test.identical( got.result, 0 );

  test.case = 'delay - undefined, onCancel';
  var onCancel = () => -1;  
  var got = _.time._begin( undefined, undefined, onCancel );
  got.time();
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 2 );
  test.identical( got.result, undefined );

  test.case = 'delay - undefined, onCancel';
  var onCancel = () => -1;  
  var got = _.time._begin( undefined, undefined, onCancel );
  got.cancel();
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.case = 'delay - undefined, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;  
  var got = _.time._begin( undefined, onTime, onCancel );
  got.time();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 2 );
  test.identical( got.result, 0 );

  test.case = 'delay - undefined, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;  
  var got = _.time._begin( undefined, onTime, onCancel );
  got.time();
  got.cancel();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.close( 'delay - undefined, execute callbacks' );

  /* - */

  test.open( 'delay - 0, execute callbacks' );

  test.case = 'delay - 0';
  var got = _.time._begin( 0 );
  got.time();
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, 2 );
  test.identical( got.result, undefined );

  test.case = 'delay - 0, onTime';
  var onTime = () => 0;  
  var got = _.time._begin( 0, onTime );
  got.time();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, 2 );
  test.identical( got.result, 0 );

  test.case = 'delay - 0, onCancel';
  var onCancel = () => -1;  
  var got = _.time._begin( 0, undefined, onCancel );
  got.time();
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 2 );
  test.identical( got.result, undefined );

  test.case = 'delay - 0, onCancel';
  var onCancel = () => -1;  
  var got = _.time._begin( 0, undefined, onCancel );
  got.cancel();
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.case = 'delay - 0, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;  
  var got = _.time._begin( 0, onTime, onCancel );
  got.time();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 2 );
  test.identical( got.result, 0 );

  test.case = 'delay - 0, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;  
  var got = _.time._begin( 0, onTime, onCancel );
  got.time();
  got.cancel();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.close( 'delay - 0, execute callbacks' );

  /* - */
  
  test.open( 'delay - 1, not execute callbacks' );

  test.case = 'delay - 1';
  var got = _.time._begin( 1 );
  got.original;
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, 0 );
  test.identical( got.result, undefined );

  test.case = 'delay - 1, onTime';
  var onTime = () => 0;  
  var got = _.time._begin( 0, onTime );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, 0 );
  test.identical( got.result, undefined );

  test.case = 'delay - 1, onCancel';
  var onCancel = () => -1;  
  var got = _.time._begin( 1, undefined, onCancel );
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 0 );
  test.identical( got.result, undefined );

  test.case = 'delay - 1, onCancel';
  var onCancel = () => -1;  
  var got = _.time._begin( 1, undefined, onCancel );
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 0 );
  test.identical( got.result, undefined );

  test.case = 'delay - 1, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;  
  var got = _.time._begin( 1, onTime, onCancel );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, 0 );
  test.identical( got.result, undefined );

  test.case = 'delay - 1, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;  
  var got = _.time._begin( 1, onTime, onCancel );
  got.cancel();
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.close( 'delay - 1, not execute callbacks' );
}

//

function timeOutCancelInsideOfCallback( test )
{
  let context = this;
  let visited = [];

  var timer = _.time.begin( 1, () =>
  {
    visited.push( 'v1' );
    _.time.cancel( timer );
    visited.push( 'v2' );
  });

  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
  {
    test.identical( visited, [ 'v0', 'v1', 'v2' ] );
    return null;
  });
}

//

function timeOutCancelOutsideOfCallback( test )
{
  let context = this;
  let visited = [];

  var timer = _.time.begin( context.dt*1, () =>
  {
    visited.push( 'v1' );
  });

  _.time.cancel( timer );
  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
  {
    test.identical( visited, [ 'v0' ] );
    return null;
  });
}

//

function timeOutCancelZeroDelayInsideOfCallback( test )
{
  let context = this;
  let visited = [];

  var timer = _.time.begin( 0, () =>
  {
    visited.push( 'v1' );
    _.time.cancel( timer );
    visited.push( 'v2' );
  });

  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
  {
    test.identical( visited, [ 'v0', 'v1', 'v2' ] );
    return null;
  });
}

//

function timeOutCancelZeroDelayOutsideOfCallback( test )
{
  let context = this;
  let visited = [];

  debugger;
  var timer = _.time.begin( 0, () =>
  {
    visited.push( 'v1' );
  });

  _.time.cancel( timer );
  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
  {
    test.identical( visited, [ 'v0' ] );
    return null;
  });
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.Time',
  silencing : 1,

  context :
  {
    dt : 25,
  },

  tests :
  {
    _begin,

    timeOutCancelInsideOfCallback,
    timeOutCancelOutsideOfCallback,

    timeOutCancelZeroDelayInsideOfCallback,
    timeOutCancelZeroDelayOutsideOfCallback,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
