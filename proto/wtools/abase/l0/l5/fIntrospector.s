( function _Introspector_s_()
{

'use strict';

let _global = _global_;
let _ = _global.wTools;
let Self = _.introspector = _.introspector || Object.create( null );

// --
// implementation
// --

// --
// extension
// --

let Extension =
{
}

_.mapSupplement( _.introspector, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
