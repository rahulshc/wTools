( function _l3_Interval_s_()
{

'use strict';

let _global = _global_;
const _ = _global_.wTools;
let Self = _global_.wTools;

// --
// range
// --

function intervalIs( range )
{
  _.assert( arguments.length === 1 );
  if( !_.number.s.areAll( range ) )
  return false;
  if( range.length !== 2 )
  return false;
  return true;
}

//

function intervalIsValid( range )
{
  _.assert( arguments.length === 1 );
  if( !_.intervalIs( range ) )
  return false;
  if( !_.intIs( range[ 0 ] ) )
  return false;
  if( !_.intIs( range[ 1 ] ) )
  return false;
  return true;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  /* zzz : review and rearrange */

  // range

  intervalIs,
  intervalIsValid, /* xxx : remove later */
  intervalDefined : intervalIsValid, /* xxx : remove later */

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
