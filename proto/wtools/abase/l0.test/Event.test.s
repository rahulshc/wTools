( function _Event_test_s_( )
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _ = _global_.wTools;

// --
// event
// --

function once( test )
{
  var self = this;

  /* - */

  test.open( 'option first - 0' );

  test.case = 'no callback for events';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'single callback for single event, single event is given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'single callback for single event, a few events are given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'single callback for each events in event handler, a few events are given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  debugger;
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1 ] );

  /* */

  test.case = 'several events handler with similar events, events are given in second handler';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var ehandler2 =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } } );
  _.event.eventGive( ehandler2, 'event' );
  _.event.eventGive( ehandler2, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler2, 'event2' );
  _.event.eventGive( ehandler2, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'event handler has a few handlers for different events - once and regular';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event2' : onEvent2 } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1, -2 ] );

  test.case = 'event handler has a few handlers for single event - once and regular';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, -2 ] );

  test.close( 'option first - 0' );

  /* - */

  test.open( 'option first - 1' );

  test.case = 'callback for once added before other callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent }, 'first' : 1 } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, -2 ] );

  /* */

  test.case = 'callback for once added after other callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent }, 'first' : 1 } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, -2 ] );

  test.close( 'option first - 1' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.event.once() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.event.once( { events : { begin : [] } } ) );

  test.case = 'wrong type of ehandler';
  test.shouldThrowErrorSync( () => _.event.once( 'wrong', { callbackMap : { begin : () => true } } ) );

  test.case = 'wrong type of ehandler.events';
  test.shouldThrowErrorSync( () => _.event.once( { events : null }, { callbackMap : { begin : () => true } } ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.event.once( { events : { begin : [] } }, 'wrong' ) );

  test.case = 'extra options in options map o';
  test.shouldThrowErrorSync( () => _.event.once( { events : { begin : [] } }, { wrong : {} } ) );

  test.case = 'not known event in callbackMap';
  test.shouldThrowErrorSync( () =>
  {
    _.event.once( { events : { begin : [] } }, { callbackMap : { unknown : () => 'unknown' } } );
  });
}

//

function onceWithChain( test )
{
  test.open( 'method on' );

  test.case = 'chain with single step';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ onEvent ] } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );

  /* */

  test.case = 'chain with two steps';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );

  /* */

  test.case = 'chain with three steps';
  var ehandler = { events : { 'event' : [], 'event2' : [], 'event3' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ 'event3', 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );

  test.close( 'method on' );

  /* - */

  test.open( 'method once' );

  test.case = 'chain with single step';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  debugger;
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ onEvent ] } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'chain with few steps';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  debugger;
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  debugger;
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'chain with three steps';
  var ehandler = { events : { 'event' : [], 'event2' : [], 'event3' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ 'event3', 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );

  test.close( 'method once' );
}

// --
// declare
// --

var Self =
{

  name : 'Tools.Event',
  silencing : 1,
  enabled : 1,

  tests :
  {

    once,
    onceWithChain,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
