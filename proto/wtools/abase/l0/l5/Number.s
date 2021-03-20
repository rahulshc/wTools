( function _l5_Numbers_s_()
{

'use strict';

let _global = _global_;
const _ = _global_.wTools;
let Self = _.number = _.number || Object.create( null );

// --
// number
// --

function numberClamp( src, low, high )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.number.is( src ) );

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
// extension
// --

/*
zzz : review and merge with similar routines _.range.*
*/

let ExtensionTools =
{
  numberClamp, /* teach it to accept cintervals */
  numberMix,

}

//

let Extension =
{
  clamp : numberClamp,
  mix : numberMix,

}

Object.assign( Self, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
