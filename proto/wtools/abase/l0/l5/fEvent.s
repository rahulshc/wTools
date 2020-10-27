( function _fEvent_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.event = _.event || Object.create( null );

// --
// implementation
// --

function _chainGenerate( args )
{
  let chain = [];

  _.assert( arguments.length === 1 );
  _.assert( _.longIs( args ) );

  for( let a = 0 ; a < args.length-2 ; a++ )
  chainMake( a );

  chain.push([ _.event.nameValueFrom( args[ args.length-2 ] ), args[ args.length-1 ] ]);

  _.assert( _.routineIs( args[ args.length-1 ] ) );

  return chain;

  /* */

  function chainMake( a )
  {
    let e1 = _.event.nameValueFrom( args[ a ] );
    // let e2 = _.event.nameValueFrom( args[ a+1 ] ); /* Dmytro : the variable is not used in scope */
    chain.push([ e1, on ]);
    function on()
    {
      let ehandler = this;
      let next = chain[ a + 1 ];

      let o = _.event.on.head( _.event.on, next );
      _.event.on( ehandler, o );

      if( _.event.eventHasHandler( ehandler, { eventName : e1, eventHandler : on } ) )
      _.event.off( ehandler, { callbackMap : { [ e1 ] : on } } );

      // this.on( next[ 0 ], next[ 1 ] ); /* Dmytro : previous implementation, use routines of _.process */
      // if( this.eventHasHandler( e1, on ) )
      // {
      //   this.off( e1, on );
      // }
    }
  }
}

//

function _chainToCallback( args )
{
  let chain = _.event._chainGenerate( args );
  let firstPair = chain[ 0 ];
  return firstPair[ 1 ];
}

//

function _chainValidate( chain )
{

  for( let i = 0 ; i < chain.length-1 ; i++ )
  {
    _.assert( _.event.nameIs( chain[ i ] ) );
  }
  _.assert( _.routineIs( chain[ chain.length-1 ] ) );

  return true;
}

//

function _callbackMapValidate( callbackMap )
{

  _.assert( _.mapIs( callbackMap ) );
  for( let k in callbackMap )
  {
    let callback = callbackMap[ k ];
    _.assert( _.routineIs( callback ) || _.longIs( callback ) );
    if( _.routineIs( callback ) )
    continue;
    _.event._chainValidate( callback );
  }

}

//

function nameValueFrom( name )
{
  if( _.strIs( name ) )
  return name;
  _.assert( _.event.nameIs( name ) );
  return name.value;
}

//

function nameIs( name )
{
  return name instanceof Name;
}

//

/* xxx qqq for Dmytro : introduce mini-class _.event.Chain()
_.process.on( 'available', _.event.Name( 'exit' ), _.event.Name( 'exit' ), _.procedure._eventProcessExitHandle )
->
_.process.on( _.event.Chain( 'available', 'exit', 'exit' ), _.procedure._eventProcessExitHandle )
qqq for Dmytro : restrict routines _.*.on() to accept 2 arguments
*/

function Name( name )
{
  if( !( this instanceof Name ) )
  {
    if( _.event.nameIs( name ) )
    return name;
    return new Name( ... arguments );
  }
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( name ) );
  this.value = name;
  return this;
}

Name.prototype = Object.create( null );

//

function on_head( routine, args )
{
  let o;

  _.assert( _.longIs( args ) );
  _.assert( arguments.length === 2 );
  _.assert( args.length >= 1 );

  if( args.length > 1 )
  {
    _.assert( _.strIs( args[ 0 ] ) );
    o = Object.create( null );
    o.callbackMap = Object.create( null );
    o.callbackMap[ args[ 0 ] ] = _.longShrink( args, 1 );
  }
  else if( args.length === 1 )
  {
    o = args[ 0 ];
  }
  else _.assert( 0 );

  if( Config.debug )
  {
    _.assert( _.mapIs( o ) );
    _.event._callbackMapValidate( o.callbackMap );
  }

  // _.event._callbackMapNormalize( o.callbackMap );

  return o;
}

//

function on( ehandler, o )
{

  // if( _.longIs( o.callbackMap ) )
  // o.callbackMap = callbackMapFromChain( o.callbackMap );

  _.routineOptions( on, o );
  _.assert( _.mapIs( o.callbackMap ) );
  _.assert( _.objectIs( ehandler ) );
  _.assert( _.objectIs( ehandler.events ) );
  _.assertMapHasOnly( o.callbackMap, ehandler.events, 'Unknown kind of event' );
  _.assert( arguments.length === 2 );

  for( let c in o.callbackMap )
  {
    let callback = o.callbackMap[ c ];

    if( _.longIs( callback ) )
    callback = _.event._chainToCallback( [ c, ... callback ] );

    _.assert( _.routineIs( callback ) );

    if( o.first )
    _.arrayPrepend( ehandler.events[ c ], callback );
    else
    _.arrayAppend( ehandler.events[ c ], callback );

  }

  return o;
}

on.head = on_head;
on.defaults =
{
  callbackMap : null,
  first : 0,
};

//

/**
 * The routine once() registers callback of some kind in event handler {-ehandler-}.
 * Registered callback executes once and deleted from queue.
 *
 * @example
 * let ehandler = { events : { begin : [] } };
 * let result = [];
 * let onBegin = () => result.push( result.length );
 * console.log( ehandler.events.begin.length );
 * // log : 0
 * _.event.once( ehandler, { callbackMap : { begin : onBegin } } );
 * console.log( ehandler.events.begin.length );
 * // log : 1
 * console.log( result );
 * // log : []
 *
 * @example
 * let ehandler = { events : { begin : [] } };
 * let result = [];
 * let onBegin = () => result.push( result.length );
 * _.event.once( ehandler, { callbackMap : { begin : onBegin } } );
 * _.event.eventGive( ehandler, 'begin' );
 * console.log( ehandler.events.begin.length );
 * // log : 0
 * console.log( result );
 * // log : [ 0 ]
 *
 * @example
 * let ehandler = { events : { begin : [], end : [] } };
 * let result = [];
 * let onBegin = () => result.push( result.length );
 * let onBegin2 = () => result.push( result.length + 1 );
 * let onEnd = result.splice();
 * _.event.once( ehandler, { callbackMap : { begin : onBegin } } );
 * _.event.once( ehandler, { callbackMap : { begin : onBegin2 } } );
 * _.event.once( ehandler, { callbackMap : { end : onEnd } } );
 * _.event.eventGive( ehandler, 'begin' );
 * console.log( ehandler.events.begin.length );
 * // log : 0
 * console.log( result );
 * // log : [ 0, 2 ]
 * _.event.eventGive( ehandler, 'end' );
 * console.log( result );
 * // log : []
 *
 * @param { Object } ehandler - The events handler with map of available events.
 * @param { Map|MapLike } o - Options map.
 * @param { Map } o.callbackMap - Map with pairs: [ eventName ] : [ callback ]. The value
 * [ callback ] can be a Function or Array with callbacks.
 * @param { Boolean|BoolLike } o.first - If it has value `true`, then callback prepends to callback queue.
 * Otherwise, callback appends to callback queue.
 * @returns { Map|MapLike } - Returns options map {-o-}.
 * @function once
 * @throws { Error } If arguments.length is not equal to 2.
 * @throws { Error } If {-ehandler-} is not an Object.
 * @throws { Error } If {-ehandler.events-} is not an Object.
 * @throws { Error } If {-o-} has incompatible type.
 * @throws { Error } If {-o-} has extra options.
 * @throws { Error } If {-o.callbackMap-} is not a Map.
 * @throws { Error } If {-o.callbackMap-} has events than does not exist in map {-ehandler.events-}.
 * @namespace wTools.event
 * @extends Tools
 */

function once( ehandler, o )
{

  _.routineOptions( once, o );
  _.assert( _.mapIs( o.callbackMap ) );
  _.assert( _.objectIs( ehandler ) );
  _.assert( _.objectIs( ehandler.events ) );
  _.assertMapHasOnly( o.callbackMap, ehandler.events, 'Unknown kind of event' );
  _.assert( arguments.length === 2 );

  for( let c in o.callbackMap )
  {
    let callback = o.callbackMap[ c ];

    if( _.longIs( callback ) )
    {
      let length = callback.length;
      _.assert( _.routineIs( callback[ length - 1 ] ), 'Expects routine to execute.' );

      let name = callback[ length - 2 ] || c;
      callback[ length - 1 ] = callbackOnceMake( name, callback[ length - 1 ] );
      callback = _.event._chainToCallback( [ c, ... callback ] );
    }
    else
    {
      callback = callbackOnceMake( c, callback );
    }

    _.assert( _.routineIs( callback ) );

    callbackAdd( ehandler, c, callback );
  }

  return o;

  /* */

  function callbackOnceMake( name, callback )
  {
    function callbackOnce()
    {
      let result = callback.apply( this, arguments );
      _.event.off( ehandler, { callbackMap : { [ name ] : callbackOnce } } );
      return result;
    }
    callbackOnce.native = callback; /* Dmytro : this solution does not affects original callback and interfaces of calls. And simultaneously it slow down searching in routine `off` */

    return callbackOnce;
  }

  function callbackAdd( handler, name, callback )
  {
    if( o.first )
    _.arrayPrepend( handler.events[ name ], callback );
    else
    _.arrayAppend( handler.events[ name ], callback );
  }
}

once.head = on_head;
once.defaults =
{
  callbackMap : null,
  first : 0,
};

//

/**
 * The routine off() removes callback of some kind in event handler {-ehandler-}.
 *
 * @example
 * let onBegin = () => result.push( result.length );
 * let onBegin2 = () => result.push( result.length );
 * let ehandler = { events : { begin : [ onBegin, onBegin2 ] } };
 * _.event.off( ehandler, { callbackMap : { begin : onBegin } } );
 * console.log( ehandler.events.begin.length );
 * // log : 1
 * console.log( ehandler.events.begin[ 0 ] === onBegin2 );
 * // log : true
 *
 * @example
 * let onBegin = () => result.push( result.length );
 * let onBegin2 = () => result.push( result.length );
 * let ehandler = { events : { begin : [ onBegin, onBegin2 ] } };
 * _.event.off( ehandler, { callbackMap : { begin : null } } );
 * console.log( ehandler.events.begin.length );
 * // log : 0
 *
 * @param { Object } ehandler - The events handler with map of available events.
 * @param { Map|MapLike } o - Options map.
 * @param { Map } o.callbackMap - Map with pairs: [ eventName ] : [ callback ]. The value
 * [ callback ] can be a Function or Null. If null is provided, routine removes all callbacks.
 * @returns { Map|MapLike } - Returns options map {-o-}.
 * @function off
 * @throws { Error } If arguments.length is not equal to 2.
 * @throws { Error } If {-ehandler-} is not an Object.
 * @throws { Error } If {-ehandler.events-} is not an Object.
 * @throws { Error } If {-o-} has incompatible type.
 * @throws { Error } If {-o-} has extra options.
 * @throws { Error } If {-o.callbackMap-} is not a Map.
 * @throws { Error } If {-o.callbackMap-} has events than does not exist in map {-ehandler.events-}.
 * @throws { Error } If {-ehandler.events-} callback queue has a few callbacks
 * which should be removed separately.
 * @namespace wTools.event
 * @extends Tools
 */

function off_head( routine, args )
{

  _.assert( _.longIs( args ) );
  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2 );

  let o = args[ 0 ];
  if( args.length === 2 )
  o = { callbackMap : { [ args[ 0 ] ] : args[ 1 ] } }
  else if( _.strIs( args[ 0 ] ) )
  o = { callbackMap : { [ args[ 0 ] ] : null } }

  _.assert( _.mapIs( o ) );

  return o;
}

//

function off( ehandler, o )
{

  _.routineOptions( off, o );
  _.assert( _.mapIs( o.callbackMap ) );
  _.assert( _.objectIs( ehandler ) );
  _.assert( _.objectIs( ehandler.events ) );
  _.assertMapHasOnly( o.callbackMap, ehandler.events, 'Unknown kind of event' );
  _.assert( arguments.length === 2 );

  for( let c in o.callbackMap )
  {
    if( o.callbackMap[ c ] === null )
    _.arrayEmpty( ehandler.events[ c ] );
    else
    _.arrayRemoveOnceStrictly( ehandler.events[ c ], o.callbackMap[ c ], callbackEqualize );
  }

  return o;

  /* */

  function callbackEqualize( callback, handler )
  {
    return handler === callback || handler === callback.native;
  }
}

off.head = off_head;
off.defaults =
{
  callbackMap : null,
}

//

function eventHasHandler_head( routine, args )
{
  let o;

  _.assert( _.longIs( args ) );
  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2 );

  if( args.length > 1 )
  {
    o = Object.create( null );
    o.eventName = args[ 0 ];
    o.eventHandler = args[ 1 ];
  }
  else
  {
    o = args[ 0 ]
  }

  _.assert( _.mapIs( o ) );

  return o;
}

//

/* xxx */
function eventHasHandler( ehandler, o )
{

  _.routineOptions( eventHasHandler, o );
  _.assert( _.strIs( o.eventName ) );
  _.assert( _.routineIs( o.eventHandler ) );
  _.assert( _.mapIs( ehandler ) );
  _.assert( _.mapIs( ehandler.events ) );
  _.assert( arguments.length === 2 );

  return _.longHas( ehandler.events[ o.eventName ], o.eventHandler );
}

eventHasHandler.head = eventHasHandler_head;
eventHasHandler.defaults =
{
  eventName : null,
  eventHandler : null,
}

//

function eventGive( ehandler, o )
{
  if( _.strIs( o ) )
  o = { event : o }

  _.routineOptions( eventGive, o );

  if( o.onError === null )
  o.onError = onError;
  if( o.args === null )
  {
    o.args = [ Object.create( null ) ];
    o.args[ 0 ].event = o.event;
  }

  _.assert( !!ehandler.events[ o.event ], `Unknown evnet ${o.event}` );
  _.assert( _.longIs( o.args ) );
  _.assert( arguments.length === 2 );

  let was;
  let visited = [];
  do
  {
    was = visited.length;
    let events = ehandler.events[ o.event ].slice();
    _.each( events, ( callback ) =>
    {
      if( _.longHas( visited, callback ) )
      return;
      visited.push( callback );
      try
      {
        // callback.apply( _.process, o.args ); /* Dmytro : it allows use different handlers instead of _.process._ehandler */
        callback.apply( ehandler, o.args );
      }
      catch( err )
      {
        o.onError( err, o );
      }
    });
  }
  while( was !== visited.length );

  function onError( err, o )
  {
    throw _.err( `Error on handing event ${o.event}\n`, err );
  }

}

eventGive.defaults =
{
  event : null,
  args : null,
  onError : null,
}

// --
// extension
// --

let Extension =
{

  _chainGenerate,
  _chainToCallback,
  _chainValidate,
  _callbackMapValidate,

  nameValueFrom,
  nameIs,
  Name,

  on, /* qqq : cover please, take into accout chain case */
  once,
  off, /* qqq : cover please */
  eventHasHandler, /* qqq : cover please */
  eventGive, /* qqq : cover please */

}

_.mapSupplement( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
