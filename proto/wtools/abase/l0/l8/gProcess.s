( function _gProcess_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.process = _.process || Object.create( null );

// --
// implementation
// --

function eventGive()
{
  return _.event.eventGive( _.process._ehandler, ... arguments );
}

eventGive.defaults =
{
  ... _.event.eventGive.defaults,
}

// --
// declaration
// --

let Extension =
{
  eventGive,
}

_.mapExtend( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
