( function _fProcess_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.process = _.process || Object.create( null );

_.assert( !!_realGlobal_ );

// --
// implementation
// --

function on( o )
{

  o = _.event.on.pre( _.event.on, arguments );
  o.registeredCallbackMap = _.process._eventCallbackMap;
  _.event.on( o );

  return o;
}

on.defaults =
{
  callbackMap : null,
}

//

function off( o )
{

  o = _.event.off.pre( _.event.off, arguments );
  o.registeredCallbackMap = _.process._eventCallbackMap;
  _.event.off( o );

  return o;
}

off.defaults =
{
  callbackMap : null,
}

// --
// declaration
// --

let _eventCallbackMap =
{
  available : [],
}

let Extension =
{

  _eventCallbackMap,

  on,
  off,

}

_.mapExtend( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = _;

})();
