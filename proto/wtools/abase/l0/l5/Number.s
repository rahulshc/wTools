( function _l5_Numbers_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// number
// --

function bigIntFrom( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  if( _.strIs( src ) )
  return BigInt( src );
  if( _.numberIs( src ) )
  return BigInt( src );
  _.assert( _.bigIntIs( src ), 'Cant convert' )
  return src;
}

//

function bigIntsFrom( src )
{
  if( _.numberIs( src ) )
  {
    return BigInt( src );
  }
  else if( _.bigIntIs( src ) )
  {
    return src;
  }
  else if( _.longIs( src ) )
  {
    let result = [];
    for( let i = 0 ; i < src.length ; i++ )
    result[ i ] = _.bigIntFrom( src[ i ] );
    return result
  }
  else _.assert( 0, 'Cant convert' );
}

//

function numberClamp( src, low, high )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.numberIs( src ) );

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

let Extension =
{

  bigIntFrom,
  bigIntsFrom,

  numberClamp, /* teach it to accept cintervals */
  numberMix,

}

//

_.mapSupplement( _, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
