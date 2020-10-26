( function _iNumbers_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// number
// --

/**
 * @summary Checks if argument( src ) is a Number.
 * @returns Returns true if ( src ) is a Number, otherwise returns false.
 *
 * @example
 * numberIs( 5 );
 * // returns true
 *
 * @example
 * numberIs( 'song' );
 * // returns false
 *
 * @param { * } src.
 * @return {Boolean}.
 * @function numberIs
 * @namespace Tools
 */

function numberIs( src )
{
  return typeof src === 'number';
  return Object.prototype.toString.call( src ) === '[object Number]';
}

//

function numberIsNotNan( src )
{
  return _.numberIs( src ) && !isNaN( src );
}

//

function numberIsFinite( src )
{
  if( !_.numberIs( src ) )
  return false;
  return isFinite( src );
}

//

function numberIsInfinite( src )
{

  if( !_.numberIs( src ) )
  return false;

  return src === +Infinity || src === -Infinity;
}

//

function intIs( src )
{

  if( !_.numberIs( src ) || !_.numberIsFinite( src ) )
  return false;

  return Math.floor( src ) === src;
}

//

function numbersAreAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.bufferTypedIs( src ) )
  return true;

  if( _.arrayLike( src ) && !_.arrayIsEmpty( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.numberIs( src[ s ] ) )
    return false;

    return true;
  }

  return false;
}

// //
//
// function numbersAreIdentical( src1, src2 )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   return Object.is( src1, src2 );
// }
//
// //
//
// function numbersAreEquivalent( src1, src2, accuracy )
// {
//   _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
//   if( accuracy === undefined )
//   accuracy = _.accuracy;
//   return Math.abs( src1-src2 ) <= accuracy;
// }

//

function numbersAreIdentical( a, b )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.numbersAreAll( [ a, b ] ) )
  return Object.is( a, b );

  return false;
}

//

function numbersAreIdenticalNotStrictly( a, b )
{
  /*
  it takes into account -0 === +0 case
  */

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.numbersAreAll( [ a, b ] ) )
  return Object.is( a, b ) || a === b;

  return false;
}

//

function numbersAreEquivalent( a, b, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( accuracy !== undefined )
  _.assert( ( _.numberIs( accuracy ) || _.bigIntIs( accuracy ) ) && accuracy >= 0, 'Accuracy has to be a number >= 0' );

  let bigIntIsA = _.bigIntIs( a );
  let bigIntIsB = _.bigIntIs( b );

  /* qqq for Yevhen : bad! */

  if( _.numberIs( a ) && _.numberIs( b ) )
  {
    if( Object.is( a, b ) )
    return true;
  }

  if( !_.numberIs( a ) && !bigIntIsA )
  return false;

  if( !_.numberIs( b ) && !bigIntIsB )
  return false;

  /* qqq for Yevhen : cache results of *Is calls at the beginning of the routine | aaa : Done */

  /*
  Cases :
  a : int, float, bigint,
  b : int, float, bigint,
  accuracy : int, float, bigint

  a       b       accuracy              covered
  int     int      int                     +
  int     int      float                   +
  int     int      bigint                  +
  int     float    int                     +
  int     float    float                   +
  int     float    bigint                  +
  float   float    int                     +
  float   float    float                   +
  float   float    bigint                  +
  bigint  int      int                     +
  bigint  int      float                   +
  bigint  int      bigint                  +
  bigint  float    int                     +
  bigint  float    float                   +
  bigint  float    bigint                  +
  bigint  bigint   int                     +
  bigint  bigint   float                   +
  bigint  bigint   bigint                  +

  Overall : 19
  */

  if( accuracy === undefined )
  accuracy = this.accuracy;

  if( bigIntIsA && bigIntIsB )
  {
    /*
    BigIntMath doesn't exist;
    `Math` methods are not available for bigint
    diff = Number( diff ); diff can be bigger than Number can represent ( > 2 ^ 53 -1 )
    */
    // if( _.intIs( accuracy ) )
    // {
    //   return BigIntMath.abs( a - b ) <= BigInt( accuracy );
    // }
    // else
    // {
    //   let diff = BigIntMath.abs( a - b );
    //   if( diff <= BigInt( Math.floor( accuracy ) ) )
    //   return true;
    //   if( diff > BigInt( Math.ceil( accuracy ) ) )
    //   return false;
    //   diff = Number( diff );
    //   if( diff === Infinity || diff === -Infinity )
    //   return false;
    //   return Math.abs( diff ) <= accuracy;
    // }
    if( _.bigIntIs( accuracy ) )
    {
      let diff = abs( a - b );
      return diff <= accuracy;
    }
    else
    {
      return abs( a - b ) <= accuracy;
    }
  }

  if( bigIntIsA )
  {
    if( _.intIs( b ) )
    {
      b = BigInt( b );
    }
    else
    {
      /* round, ceil, floor ? */
      b = BigInt( Math.round( b ) );
    }
  }

  if( bigIntIsB )
  {
    if( _.intIs( a ) )
    {
      a = BigInt( a );
    }
    else
    {
      /* round, ceil, floor ? */
      a = BigInt( Math.round( a ) );
    }
  }

  if( Object.is( a, b ) )
  return true;

  if( _.numberIs( a ) && _.numberIs( b ) )
  return Math.abs( a - b ) <= accuracy;
  else
  return abs( a - b ) <= accuracy;

  /* - */

  function sign( value )
  {
    if( value > 0n )
    return 1n;
    if( value < 0n )
    return -1n;

    return 0n;
  }

  function abs( value )
  {
    if( sign( value ) === -1n )
    return -value;

    return value;
  }
}

//

function numbersAreFinite( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( !_.numbersAreAll( src ) )
  return false;

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.numberIsFinite( src[ s ] ) )
    return false;
  }

  return true;
}

//

function numbersArePositive( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( !_.numbersAreAll( src ) )
  return false;

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( src[ s ] < 0 || !_.numberIsNotNan( src[ s ] ) )
    return false;
  }

  return true;
}

//

function numbersAreInt( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( !_.numbersAreAll( src ) )
  return false;

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.intIs( src[ s ] ) )
    return false;
  }

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

  numberIs,
  numberIsNotNan,
  numberIsFinite,
  numberDefined : numberIsFinite,
  numberIsInfinite,
  intIs,

  numbersAreAll,
  numbersAreIdentical, /* qqq2 : implement good coverage | aaa : Done. Yevhen S. */
  numbersAreIdenticalNotStrictly,
  numbersAreEquivalent, /* qqq2 : implement good coverage | aaa : Done. Yevhen S. */

  numbersAreFinite,
  numbersArePositive,
  numbersAreInt,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
