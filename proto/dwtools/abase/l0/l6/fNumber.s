( function _fNumbers_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// number
// --

function numberInRange( n, range )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( range.length === 2 );
  _.assert( _.numberIs( range[ 0 ] ) );
  _.assert( _.numberIs( range[ 1 ] ) );
  if( !_.numberIs( n ) )
  return false;
  return range[ 0 ] <= n && n <= range[ 1 ]; // xxx : review
}

//

function numberClamp( src, low, high )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( arguments.length === 2 )
  {
    _.assert( arguments[ 1 ].length === 2 );
    low = arguments[ 1 ][ 0 ];
    high = arguments[ 1 ][ 1 ];
  }

  if( src > high )
  return high;

  if( src < low )
  return low;

  return src;
}

//

function numberMix( ins1, ins2, progress )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  return ins1*( 1-progress ) + ins2*( progress );
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

  numberInRange,
  numberClamp,
  numberMix,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
