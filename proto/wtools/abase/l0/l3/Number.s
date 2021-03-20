( function _l3_Numbers_s_()
{

'use strict';

let _global = _global_;
const _ = _global_.wTools;
let Self = _.number = _.number || Object.create( null );
_.number.s = _.number.s || Object.create( null );

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

function is( src )
{
  return typeof src === 'number';
  return Object.prototype.toString.call( src ) === '[object Number]';
}

//

function isNotNan( src )
{
  return _.number.is( src ) && !isNaN( src );
}

//

function numberIsFinite( src )
{
  if( !_.number.is( src ) )
  return false;
  return isFinite( src );
}

//

function isInfinite( src )
{

  if( !_.number.is( src ) )
  return false;

  return src === +Infinity || src === -Infinity;
}

//

function intIs( src )
{

  if( !_.number.is( src ) || !_.number.isFinite( src ) )
  return false;

  return Math.floor( src ) === src;
}

//

function areAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.bufferTypedIs( src ) )
  return true;

  if( _.arrayLike( src ) && !_.arrayIsEmpty( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.number.is( src[ s ] ) )
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

function areIdentical( a, b )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.number.s.areAll( [ a, b ] ) )
  return Object.is( a, b );

  return false;
}

//

function areIdenticalNotStrictly( a, b )
{
  /*
  it takes into account -0 === +0 case
  */

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.number.s.areAll( [ a, b ] ) )
  return Object.is( a, b ) || a === b;

  return false;
}

//

function areEquivalent( a, b, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( accuracy !== undefined )
  _.assert( _.number.is( accuracy ) && accuracy >= 0, 'Accuracy has to be a number >= 0' );

  /* qqq for Yevhen : bad! */

  if( _.number.is( a ) && _.number.is( b ) )
  {
    if( Object.is( a, b ) )
    return true;
  }

  if( !_.number.is( a ) && !_.bigInt.is( a ) )
  return false;

  if( !_.number.is( b ) && !_.bigInt.is( b ) )
  return false;

  /* qqq for Yevhen : cache results of *Is calls at the beginning of the routine */

  // else
  // {
  //   return false;
  // }

  if( accuracy === undefined )
  accuracy = _.accuracy;

  if( _.bigInt.is( a ) )
  {
    if( _.intIs( b ) )
    {
      b = BigInt( b );
    }
    // else
    // {
    //   a = Number( a );
    //   if( a === +Infinity || a === -Infinity )
    //   return false;
    // }
  }

  if( _.bigInt.is( b ) )
  {
    if( _.intIs( a ) )
    {
      a = BigInt( a );
    }
    // else
    // {
    //   b = Number( b );
    //   if( b === +Infinity || b === -Infinity )
    //   return false;
    // }
  }

  if( Object.is( a, b ) )
  return true;

  if( _.bigInt.is( a ) && _.bigInt.is( b ) )
  {
    if( _.intIs( accuracy ) )
    {
      return BigIntMath.abs( a - b ) <= BigInt( accuracy );
    }
    else
    {
      let diff = BigIntMath.abs( a - b );
      if( diff <= BigInt( Math.floor( accuracy ) ) )
      return true;
      if( diff > BigInt( Math.ceil( accuracy ) ) )
      return false;
      diff = Number( diff );
      if( diff === Infinity || diff === -Infinity )
      return false;
      return Math.abs( diff ) <= accuracy;
    }
  }

  // if( !_.number.is( a ) )
  // return false;
  //
  // if( !_.number.is( b ) )
  // return false;

  return Math.abs( a - b ) <= accuracy;
  // return +( Math.abs( a - b ) ).toFixed( 10 ) <= +( accuracy ).toFixed( 10 );
}

//

function areFinite( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( !_.number.s.areAll( src ) )
  return false;

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.number.isFinite( src[ s ] ) )
    return false;
  }

  return true;
}

//

function arePositive( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( !_.number.s.areAll( src ) )
  return false;

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( src[ s ] < 0 || !_.number.isNotNan( src[ s ] ) )
    return false;
  }

  return true;
}

//

function areInt( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( !_.number.s.areAll( src ) )
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
// extension
// --

let ExtensionTools =
{

  numberIs : is,
  numberIsNotNan : isNotNan,
  numberIsFinite,
  numberDefined : numberIsFinite,
  numberIsInfinite : isInfinite,

  intIs,

  numbersAreAll : areAll,
  numbersAreIdentical : areIdentical, /* qqq2 : implement good coverage | aaa : Done. Yevhen S. */
  numbersAreIdenticalNotStrictly : areIdenticalNotStrictly,
  numbersAreEquivalent : areEquivalent, /* qqq2 : implement good coverage | aaa : Done. Yevhen S. */

  numbersAreFinite : areFinite,
  numbersArePositive : arePositive,
  numbersAreInt : areInt,

}

//

let Extension =
{

  is,
  isNotNan,
  isFinite : numberIsFinite,
  defined : numberIsFinite,
  isInfinite,
  areEquivalentShallow : areEquivalent,

  intIs,

}

//

let ExtensionS =
{

  areAll,
  areIdentical,
  areIdenticalNotStrictly,
  areEquivalent,

  areFinite,
  arePositive,
  areInt,

}

Object.assign( Self, Extension );
Object.assign( _.number.s, ExtensionS );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
