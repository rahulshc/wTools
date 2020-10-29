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
  _.assert( _.numberIs( accuracy ) && accuracy >= 0, 'Accuracy has to be a number >= 0' );

  /* qqq for Yevhen : bad! */

  if( _.numberIs( a ) && _.numberIs( b ) )
  {
    if( Object.is( a, b ) )
    return true;
  }

  if( !_.numberIs( a ) && !_.bigIntIs( a ) )
  return false;

  if( !_.numberIs( b ) && !_.bigIntIs( b ) )
  return false;

  /* qqq for Yevhen : cache results of *Is calls at the beginning of the routine */

  // else
  // {
  //   return false;
  // }

  if( accuracy === undefined )
  accuracy = this.accuracy;

  if( _.bigIntIs( a ) )
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

  if( _.bigIntIs( b ) )
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

  if( _.bigIntIs( a ) && _.bigIntIs( b ) )
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

  // if( !_.numberIs( a ) )
  // return false;
  //
  // if( !_.numberIs( b ) )
  // return false;

  return Math.abs( a - b ) <= accuracy;
  // return +( Math.abs( a - b ) ).toFixed( 10 ) <= +( accuracy ).toFixed( 10 );
}


//

function numbersAreEquivalent2( a, b, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( accuracy !== undefined )
  _.assert
  (
    ( _.numberIs( accuracy ) || _.bigIntIs( accuracy ) ) && accuracy >= 0 && accuracy !== Infinity,
    'Accuracy has to be a finite Number >= 0'
  );

  let bigIntIsA = _.bigIntIs( a );
  let bigIntIsB = _.bigIntIs( b );

  /* qqq for Yevhen : bad! */

  if( !_.numberIs( a ) && !bigIntIsA )
  return false;

  if( !_.numberIs( b ) && !bigIntIsB )
  return false;

  if( _.numberIs( a ) && _.numberIs( b ) )
  {
    if( Object.is( a, b ) )
    return true;
  }

  /* qqq for Yevhen : cache results of *Is calls at the beginning of the routine | aaa : Done */

  /*
  Cases :
  a : BIF/BOF/FIB/FOB;
  b : BIF/BOF/FIB/FOB;
  accuracy : BIF/BOF/FIB/FOB;

  a       b            accuracy           implemented                covered

  BIF     BIF       BIF/BOF/FIB/FOB            +                       ++++
  BIF     BOF       BIF/BOF/FIB/FOB            +                       ++++
  BIF     FIB       BIF/BOF/FIB/FOB            +                       ++++
  BIF     FOB       BIF/BOF/FIB/FOB            +                       ++++

  BOF     BOF       BIF/BOF/FIB/FOB            +                       ++++
  BOF     FIB       BIF/BOF/FIB/FOB            +                       ++++
  BOF     FOB       BIF/BOF/FIB/FOB            +                       ++++

  FIB     FIB       BIF/BOF/FIB/FOB            +                       ++++
  FIB     FOB       BIF/BOF/FIB/FOB            +                       ++++

  FOB     FOB       BIF/BOF/FIB/FOB            +                       ++++

  Definitions :
  BIF = bigint inside range of float ( 0n, 3n, BigInt( Math.pow( 2, 52 ) ) )
  BOF = bigint outside range of float ( BigInt( Math.pow( 2, 54 ) ) )
  FIB = float inside range of bigint ( 5, 30 )
  FOB = float outside range of bigint ( 5.5, 30.1 )

  */

  if( accuracy === undefined )
  accuracy = this.accuracy;

  if( bigIntIsA && bigIntIsB ) /* a : BIF/BOF, b : BIF/BOF , accuracy : BIF/BOF/FIB/FOB  3 */
  {
    return abs( a - b ) <= accuracy;
  }

  if( bigIntIsA ) /* a : BIF/BOF, b : FIB/FOB , accuracy : BIF/BOF/FIB/FOB 4 */
  {
    if( _.intIs( b ) )
    {
      b = BigInt( b );
    }
    else
    {
      if( a >= Number.MIN_SAFE_INTEGER && a <= Number.MAX_SAFE_INTEGER ) /* a : BIF, b : FOB, accuracy : BIF/BOF/FIB/FOB */
      {
        a = Number( a );
      }
      else /* a : BOF, b : FOB, accuracy : BIF/BOF/FIB/FOB */
      {
        if( accuracy >= Number.MIN_SAFE_INTEGER && accuracy <= Number.MAX_SAFE_INTEGER ) /* a : BOF, b : FOB, accuracy : FIB/FOB */
        {
          let decimal = b % 1;
          b = BigInt( Math.floor( b ) )
          return abs( a - b ) <= accuracy + decimal;
        }
        else /* a : BOF, b : FOB, accuracy : BIF/BOF */
        {
          /*
          `a` ( bigint outside float ) : -2^53-1 > a > 2^53-1
          `b` ( float outside bigint ) : 2^53-0.(9) <= b >= -2^53-0.(9)

          Example :
          a : BigInt( 2^53-1 ) + 1n  |
          b : 2^53-1.5               | => true
          accuarcy : 1.5             |

          */

          /* EASY WAY : max loss of precision 0.5(1) */
          b = BigInt( Math.round( b ) );

          /* HARD WAY ( NOT IMPLEMENTED ) : without loss of precision
          Posibilities:
          1.BOF -> BIF. In loop reduce `a` until it's within the range of BIF, then a = Number( a )
            problems :
            - reducing by dividing - loss of precision at each division : 5n / 2n = 2n
            - reducing by substracting - no way to choose an optimal value,
              either substractions could possibly go on unreasonably long or BIF range is skipped at some point.
          */
        }
      }
    }
  }

  if( bigIntIsB ) /* a : FIB/FOB, b : BIF/BOF , accuracy : BIF/BOF/FIB/FOB */
  {
    if( _.intIs( a ) ) /* a : FIB, b : BIF/BOF, accuracy : BIF/BOF/FIB/FOB */
    {
      a = BigInt( a );
    }
    else
    {
      if( b >= Number.MIN_SAFE_INTEGER && b <= Number.MAX_SAFE_INTEGER ) /* a : FOB, b : BIF, accuracy : BIF/BOF/FIB/FOB */
      {
        b = Number( b );
      }
      else /* a : FOB, b : BOF , accuracy : BIF/BOF/FIB/FOB */
      {
        if( accuracy >= Number.MIN_SAFE_INTEGER && accuracy <= Number.MAX_SAFE_INTEGER ) /* a : FOB, b : BOF, accuracy : FIB/FOB */
        {
          let decimal = a % 1;
          a = BigInt( Math.floor( a ) )
          return abs( a - b ) <= accuracy + decimal;
        }
        else /* a : FOB, b : BOF, accuracy : BIF/BOF */
        {
          /* EASY WAY : max loss of precision 0.5(1) */
          a = BigInt( Math.round( a ) );
        }
        /* HARD WAY ( NOT IMPLEMENTED ) : without loss of precision */
      }
    }
  }

  if( _.numberIs( a ) && _.numberIs( b ) ) /* a : FIB/FOB, b : FIB/FOB, accuracy : BIF/BOF/FIB/FOB 3 */
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
  numbersAreEquivalent2,

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
