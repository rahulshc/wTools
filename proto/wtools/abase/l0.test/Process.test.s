( function _Process_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _ = _global_.wTools;

// --
// test
// --

function ready( test )
{
  let t1 = 100;
  let ready =  new _testerGlobal_.wTools.Consequence().take( null );

  /* */

  ready.then( () =>
  {
    test.case = 'without arguments, must not throw error, no side effects only minimal delay';
    _.process.ready();
    return null;
  });

  /* */

  ready.then( () =>
  {
    test.case = 'only onReady, no timeOut';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready( onReady );

    return _testerGlobal_.wTools.time.out( t1, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'timeOut and onReady, onReady - null';
    var arr = [];
    _.process.ready( t1, null );
    test.identical( arr, [] );

    return _testerGlobal_.wTools.time.out( t1 * 2, () =>
    {
      test.identical( arr, [] );
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'timeOut and onReady';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready( t1, onReady );
    test.identical( arr, [] );

    return _testerGlobal_.wTools.time.out( t1 * 2, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  /* */

  ready.then( () =>
  {
    test.case = 'only onReady, no timeOut';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready({ onReady });

    return _testerGlobal_.wTools.time.out( t1, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'timeOut and onReady';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready({ timeOut : t1, onReady });
    test.identical( arr, [] );

    return _testerGlobal_.wTools.time.out( t1 * 2, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  /* - */

  if( !Config.debug )
  return;

  test.case = 'single arg is not a routine';
  test.shouldThrowErrorSync( () => _.process.ready( 1 ) );

  test.case = 'wrong type of timeOut';
  test.shouldThrowErrorSync( () => _.process.ready( 'wrong', () => 'ready' ) );
  test.shouldThrowErrorSync( () => _.process.ready( 10.5, () => 'ready' ) );
  test.shouldThrowErrorSync( () => _.process.ready( Infinity, () => 'ready' ) );

  test.case = 'wrong type of onReady';
  test.shouldThrowErrorSync( () => _.process.ready( 10, 'wrong' ) );

  test.case = 'not allowed options procedure';
  test.shouldThrowErrorSync( () => _.process.ready({ timeOut : 10, procedure : 'procedure', onReady : () => 'ready' }) );

  return ready;
}

// --
// declare
// --

var Self =
{

  name : 'Tools.Process',
  silencing : 1,
  enabled : 1,

  tests :
  {

    ready,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
