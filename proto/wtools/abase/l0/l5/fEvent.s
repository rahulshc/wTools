( function _fEvent_s_() {

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

  for( let a = 0 ; a < args.length-2 ; a++ ) (function( a )
  {
    let e1 = _.event.nameValueFrom( args[ a ] );
    let e2 = _.event.nameValueFrom( args[ a+1 ] );
    chain.push([ e1, on ]);
    function on()
    {
      let next = chain[ a+1 ];
      this.on( next[ 0 ], next[ 1 ] );
      if( this.hasEventHandler( e1, on ) )
      {
        this.off( e1, on );
      }
    }
  })( a );

  chain.push([ _.event.nameValueFrom( args[ args.length-2 ] ), args[ args.length-1 ] ]);

  _.assert( _.routineIs( args[ args.length-1 ] ) );

  return chain
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
}

//

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
    _.arrayRemoveOnceStrictly( ehandler.events[ c ], o.callbackMap[ c ] );
  }

  return o;
}

off.head = off_head;
off.defaults =
{
  callbackMap : null,
}

//

function hasEventHandler_head( routine, args )
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
function hasEventHandler( ehandler, o )
{

  _.routineOptions( hasEventHandler, o );
  _.assert( _.strIs( o.eventName ) );
  _.assert( _.routineIs( o.eventHandler ) );
  _.assert( _.mapIs( ehandler ) );
  _.assert( _.mapIs( ehandler.events ) );
  _.assert( arguments.length === 2 );

  return _.longHas( ehandler.events[ o.eventName ], o.eventHandler );
}

hasEventHandler.head = hasEventHandler_head;
hasEventHandler.defaults =
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
        callback.apply( _.process, o.args );
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
  off, /* qqq : cover please */
  hasEventHandler, /* qqq : cover please */
  eventGive, /* qqq : cover please */

}

_.mapSupplement( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
