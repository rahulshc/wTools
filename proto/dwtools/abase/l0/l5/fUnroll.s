( function _fUnroll_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// implementation
// --

/**
 * The routine unrollMake() returns a new unroll-array maked from {-src-}.
 *
 * Unroll constructed by attaching symbol _.unroll Symbol to ordinary array.
 * Making an unroll normalizes its content.
 *
 * @param { * } src - The number or array-like object to make unroll-array. Passing null returns an empty Unroll.
 *
 * @example
 * let src = _.unrollMake( null );
 * _.unrollIs( src );
 * // returns true
 *
 * @example
 * let src = _.unrollMake( [ 1, 2, 'str' ] );
 * _.unrollIs( src );
 * // returns true
 *
 * @example
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * console.log( arr === unroll );
 * // log false
 *
 * @returns { Unroll } Returns a new Unroll maked from {-src-}.
 * Otherwise, it returns the empty Unroll.
 * @function unrollMake
 * @throws { Error } If ( arguments.length ) is less or more then one.
 * @throws { Error } If argument ( src ) is not number, not array, not null.
 * @memberof wTools
 */

function unrollMake( src )
{
  let result = _.arrayMake( src );
  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( result ) );
  result[ _.unroll ] = true;
  if( !_.unrollIs( src ) )
  result = _.unrollNormalize( result );
  return result;
}

//

/**
 * The routine unrollMakeUndefined() returns a new Unroll with length equal to {-length-}.
 * If the argument {-length-} is not provided, routine returns new Unroll with the length defined from {-src-}.
 *
 * @param { Long|Null } src - Any Long or null. If {-length-} is not provided, defines length of new Unroll.
 * @param { Number|Long } length - Defines length of new Unroll.
 *
 * @example
 * _.unrollMakeUndefined( null );
 * // returns []
 *
 * @example
 * _.unrollMakeUndefined( 3 );
 * // returns [ undefined, undefined, undefined]
 *
 * @example
 * _.unrollMakeUndefined( [ 1, 2, 3, 4 ], 2 );
 * // returns [ undefined, undefined ]
 *
 * @example
 * let src = [ 1, 2, 3, 4, '5' ]
 * let got = _.unrollMakeUndefined( src );
 * console.log( got );
 * // log [ undefined, undefined, undefined, undefined, undefined ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * let src = [ 1, 2, 3, 4, '5' ]
 * let got = _.unrollMakeUndefined( src, [ 1, 2 ] );
 * console.log( got );
 * // log [ undefined, undefined ]
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.unrollMakeUndefined( src, 3 );
 * console.log( got );
 * // log [ undefined, undefined, undefined ]
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @returns { Unroll } Returns a new Unroll with length equal to {-length-} or defined from {-src-}.
 * If null passed, routine returns the empty Unroll.
 * @function unrollMakeUndefined
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If argument {-src-} is not a Long, not null.
 * @throws { Error } If argument {-length-} is not a number, not a Long.
 * @memberof wTools
 */

/*
qqq : implement unrollMakeUndefined similar to longMakeUndefined, cover and document
Dmytro : implemented similar to longMakeUndefined, covered, documented.
*/

function unrollMakeUndefined( src, length )
{
  if( src === null )
  src = [];

  if( length === undefined )
  length = src.length;
  else if ( _.longIs( length ) )
  length = length.length;
  else if( _.numberIs( length ) )
  {
  }
  else _.assert( 0 );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.longIs( src ) );

  return _.unrollMake( length );
}

// function unrollMakeUndefined( src, length )
// {
//   let result = _.arrayMakeUndefined( src, length );
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.arrayIs( result ) );
//   result[ _.unroll ] = true;
//   return result;
// }

//

/**
 * The routine unrollFrom() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFrom() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 *
 * @param { * } src - The number, array-like object or Unroll. Passing null returns an empty Unroll.
 *
 * @example
 * let unroll = _.unrollFrom( null );
 * _.unrollIs( unroll );
 * // returns true
 *
 * @example
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFrom( unroll );
 * console.log ( unroll === result );
 * // log true
 *
 * @example
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * // log true
 * console.log( arr === unroll );
 * // log false
 *
 * @returns { Unroll } Returns Unroll converted from {-src-}.
 * If {-src-} is Unroll, then routine returns {-src-}.
 * @function unrollFrom
 * @throws { Error } If (arguments.length) is less or more then one.
 * @throws { Error } If argument {-src-} is not number, not Long, not null.
 * @memberof wTools
 */

function unrollFrom( src )
{
  _.assert( arguments.length === 1 );
  if( _.unrollIs( src ) )
  return src;
  return _.unrollMake( src );
}

//

/**
 * The routine unrollsFrom() performs conversion of each argument to unroll-array.
 * The routine returns unroll-array contained unroll-arrays converted from arguments.
 *
 * @param { * } srcs - The objects to be converted into Unrolls.
 *
 * @example
 * let unroll = _.unrollsFrom( null );
 * console.log( unroll );
 * // log [ [] ]
 * console.log( _.unrollIs( unroll ) );
 * // log true
 *
 * @example
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log ( unroll );
 * // log [ [ 1, 2, 'str' ] ]
 * console.log( _.unrollIs( unroll ) );
 * // log true
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 * // log true
 *
 * @example
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * // log true
 * console.log( arr === unroll );
 * // log false
 *
 * @example
 * let unroll = _.unrollsFrom( [], 1, null, [ 1, [] ] );
 * console.log( unroll );
 * // log [ [], [ undefined ], [], [ 1, [] ] ]
 * console.log( _.unrollIs( unroll ) );
 * // log true
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 * // log true
 * console.log( _.unrollIs( unroll[ 1 ] ) );
 * // log true
 * console.log( _.unrollIs( unroll[ 2 ] ) );
 * // log true
 * console.log( _.unrollIs( unroll[ 3 ] ) );
 * // log true
 *
 * @returns { Unroll } Returns Unroll contained Unrolls converted from arguments.
 * @function unrollsFrom
 * @throws { Error } If (arguments.length) is less then one.
 * @throws { Error } If any of the arguments is not number, not Long, not null.
 * @memberof wTools
 */

function unrollsFrom( srcs )
{
  _.assert( arguments.length >= 1 );

  let dst = _.unrollMake( null );

  for( let i = 0; i < arguments.length; i ++ )
  {
    if( _.unrollIs( arguments[ i ] ) )
    dst.push( arguments[ i ] );
    else
    dst.push( _.unrollMake( arguments[ i ] ) );
  }

  return dst;
}

/*
qqq : in separate line after each console.log such comment should follow
      1. its lazy
      2. not returns, but output or log
      3. should be for each console.log
Dmytro : implemented in all module
*/

/**
 * The routine unrollFromMaybe() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFromMaybe() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * If {-src-} has incompatible type, then routine returns {-src-}.
 *
 * @param { * } src - The object to make Unroll.
 *
 * @example
 * var src = 'str';
 * let got = _.unrollFromMaybe( src );
 * console.log( _.unrollIs( got ) );
 * // log false
 * console.log( got === src );
 * // log true
 *
 * @example
 * let unroll = _.unrollFromMaybe( null );
 * console.log( _.unrollIs( unroll ) );
 * // log false
 *
 * @example
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFromMaybe( unroll );
 * console.log ( unroll === result );
 * // log true
 *
 * @example
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFromMaybe( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * // log true
 * console.log( arr === unroll );
 * // log false
 *
 * @returns { Unroll } Returns Unroll converted from {-src-}.
 * If {-src-} is Unroll or incompatible type, then routine returns {-src-}.
 * @function unrollFromMaybe
 * @throws { Error } If (arguments.length) is less or more then one.
 * @memberof wTools
 */

function unrollFromMaybe( src )
{
  _.assert( arguments.length === 1 );
  if( _.unrollIs( src ) || _.strIs( src ) || _.boolIs( src ) || _.mapIs( src ) || src === undefined )
  return src;
  return _.unrollMake( src );
}

//

/**
 * The routine unrollNormalize() performs normalization of {-dstArray-}.
 * Normalization is unrolling of Unrolls, which is elements of {-dstArray-}.
 *
 * If {-dstArray-} is unroll-array, routine unrollNormalize() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollNormalize() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The Unroll to be unrolled (normalized).
 *
 * @example
 * let unroll = _.unrollFrom( [ 1, 2, _.unrollMake( [ 3, 'str' ] ) ] );
 * let result = _.unrollNormalize( unroll )
 * console.log( result );
 * // log [ 1, 2, 3, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @example
 * let unroll = _.unrollFrom( [ 1,'str' ] );
 * let result = _.unrollNormalize( [ 1, unroll, [ unroll ] ] );
 * console.log( result );
 * // log [ 1, 1, 'str', [ 1, 'str' ] ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @returns { Array } If {-dstArray-} is array, routine returns an array with normalized elements.
 * @returns { Unroll } If {-dstArray-} is Unroll, routine returns an Unroll with normalized elements.
 * @function unrollNormalize
 * @throws { Error } If ( arguments.length ) is not equal to one.
 * @throws { Error } If argument ( dstArray ) is not arrayLike.
 * @memberof wTools
 */

function unrollNormalize( dstArray )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got ${ _.strQuote( dstArray ) }` );

  for( let a = 0 ; a < dstArray.length ; a++ )
  {
    if( _.unrollIs( dstArray[ a ] ) )
    {
      let args = [ a, 1 ];
      args.push.apply( args, dstArray[ a ] );
      dstArray.splice.apply( dstArray, args );
      a += args.length - 3;
      /* no normalization of ready unrolls, them should be normal */
    }
    else if( _.arrayIs( dstArray[ a ] ) )
    {
      _.unrollNormalize( dstArray[ a ] );
    }
  }

  return dstArray;
}

//

/**
 * The routine unrollSelect() returns a copy of a portion of {-array-} into a new Unroll. The portion of {-array-} selected by {-range-}. If end index of new Unroll is more then array.length, then routine appends elements with {-val-} value.
 * The original {-array-} will not be modified.
 *
 * @param { Long } array - The Long from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to array.length.
 * If {-range-} is undefined, routine returns Unroll with copy of {-array-}.
 * If range[ 0 ] < 0, then start index sets to 0, the end index increments by absolute value of range[ 0 ].
 * If range[ 1 ] <= range[ 0 ], then routine returns empty Unroll.
 * @param { * } val - The object of any type for insertion.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.unrollSelect( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.unrollSelect( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.unrollSelect( src, [ 1, 4 ], [ 'str' ] );
 * console.log( got );
 * // log [ 2, 3, 4 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.unrollSelect( src, [ -2, 6 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str', 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.unrollSelect( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Unroll } Returns a copy of portion of source Long with appended elements that is defined by range.
 * @function unrollSelect
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an Array or Unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not a number / undefined.
 * @memberof wTools
 */

/*
  qqq : extend documentation and test coverage of unrollSelect
  Dmytro : documented and covered. The behavior of routine is like *Relength.
*/

function unrollSelect( array, range, val )
{
  let result;

  if( range === undefined )
  return _.unrollMake( array );

  if( _.numberIs( range ) )
  range = [ range, array.length ];

  let f = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let l = range[ 1 ] !== undefined ? range[ 1 ] : array.length;

  // let f = range ? range[ 0 ] : undefined;
  // let l = range ? range[ 1 ] : undefined;
  //
  // f = f !== undefined ? f : 0;
  // l = l !== undefined ? l : array.length;

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) )
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( l < f )
  l = f;

  if( f < 0 )
  {
    l -= f;
    f -= f;
  }

  if( f === 0 && l === array.length )
  return _.unrollMake( array );

  result = _.unrollMakeUndefined( array, l-f );

  /* */

  let f2 = Math.max( f, 0 );
  let l2 = Math.min( array.length, l );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f ] = array[ r ];

  /* */

  if( val !== undefined )
  {
    for( let r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    for( let r = l2 - f; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  /* */

  return result;
}

//

/*
qqq : в unrollPrepend, unrollAppend бракує прикладів
коли src unroll і dst не null
із виводом результату
і більше ніж одним елементом

Dmytro: correct JSdoc in unrollFrom, unrollNormalize.
Improve examples in unrollPrepend, unrollAppend.
*/

/**
 * The routine unrollPrepend() returns an array with elements added to the begin of destination array {-dstArray-}.
 * During the operation unrolling of Unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollPrepend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollPrepend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * let result = _.unrollPrepend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * // log [ [ 1, 2, 'str' ] ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollPrepend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * // log [ 1, 2, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollPrepend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * // log [ [ 1, 2 ], 1, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @example
 * let result = _.unrollPrepend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * // log [ 2, 3, 1, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollPrepend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * // log [ 2, 3, 1, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @returns { Unroll } If {-dstArray-} is Unroll, routine returns updated Unroll
 * with normalized elements that are added to the begin of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollPrepend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */

function unrollPrepend( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.longIs( dstArray ) || dstArray === null, 'Expects long or unroll' );

  dstArray = dstArray || [];

  _unrollPrepend( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;

  function _unrollPrepend( dstArray, srcArray )
  {

    for( let a = srcArray.length - 1 ; a >= 0 ; a-- )
    {
      if( _.unrollIs( srcArray[ a ] ) )
      {
        _unrollPrepend( dstArray, srcArray[ a ] );
      }
      else
      {
        if( _.arrayIs( srcArray[ a ] ) )
        _.unrollNormalize( srcArray[ a ] )
        dstArray.unshift( srcArray[ a ] );
      }
    }

    return dstArray;
  }

}

//

/**
 * The routine unrollAppend() returns an array with elements added to the end of destination array {-dstArray-}.
 * During the operation unrolling of Unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollAppend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollAppend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * let result = _.unrollAppend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * // log [ [ 1, 2, 'str' ] ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollAppend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * // log [ 1, 2, str ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollAppend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * // log [ 1, 'str', [ 1, 2 ] ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @example
 * let result = _.unrollAppend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * // log [ 1, 'str', 2, 3 ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollAppend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * // log [ 1, 'str', 2, 3 ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @returns { Unroll } If {-dstArray-} is Unroll, routine returns updated Unroll
 * with normalized elements that are added to the end of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the end of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */

function unrollAppend( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.longIs( dstArray ) || dstArray === null, 'Expects long or unroll' );

  dstArray = dstArray || [];

  _unrollAppend( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;

  function _unrollAppend( dstArray, srcArray )
  {
    _.assert( arguments.length === 2 );

    for( let a = 0, len = srcArray.length ; a < len; a++ )
    {
      if( _.unrollIs( srcArray[ a ] ) )
      {
        _unrollAppend( dstArray, srcArray[ a ] );
      }
      else
      {
        if( _.arrayIs( srcArray[ a ] ) )
        _.unrollNormalize( srcArray[ a ] )
        dstArray.push( srcArray[ a ] );
      }
    }

    return dstArray;
  }

}

/*

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

*/

// //
//
// function unrollPrepend( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.unshift.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.unshift( arguments[ a ] );
//     }
//   }
//
//   dstArray[ _.unroll ] = true;
//
//   return dstArray;
// }
//
// //
//
// function unrollAppend( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = 1, len = arguments.length ; a < len; a++ )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.push.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.push( arguments[ a ] );
//     }
//   }
//
//   dstArray[ _.unroll ] = true;
//
//   return dstArray;
// }

//

/**
 * The routine unrollRemove() removes all matching elements in destination array {-dstArray-}
 * and returns a modified {-dstArray-}. During the operation unrolling of Unrolls happens.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be removed.
 *
 * @example
 * let result = _.unrollRemove( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * // log []
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollRemove( _.unrollMake( null ), [ 1, 2, 'str' ] );
 * console.log( result );
 * // log []
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @example
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * // log [ 1, 2, 1, 3, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], _.unrollFrom( [ 1, 'str', 0, 5 ] ) );
 * console.log( result );
 * // log [ 2, 3 ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let result = _.unrollRemove( _.unrollFrom( [ 1, 2, 1, 3, 'str' ] ), [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * // log [ 1, 2, 1, 3, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @example
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, 'str', 0, 5 ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * // log [ 2, 3 ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @example
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, _.unrollMake( [ 'str', 0, 5 ] ) ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * // log [ 2, 3 ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @returns { Unroll } If {-dstArray-} is Unroll, routine removes all matching elements
 * and returns updated Unroll.
 * @returns { Array } If {-dstArray-} is array, routine removes all matching elements
 * and returns updated array. If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */

function unrollRemove( dstArray )
{
  _.assert( arguments.length >= 2 );
  _.assert( _.longIs( dstArray ) || dstArray === null, 'Expects long or unroll' );

  dstArray = dstArray || [];

  _unrollRemove( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;

  function _unrollRemove( dstArray, srcArray )
  {
    _.assert( arguments.length === 2 );

    for( let a = 0, len = srcArray.length ; a < len; a++ )
    {
      if( _.unrollIs( srcArray[ a ] ) )
      {
        _unrollRemove( dstArray, srcArray[ a ] );
      }
      else
      {
        if( _.arrayIs( srcArray[ a ] ) )
        _.unrollNormalize( srcArray[ a ] );
        while( dstArray.indexOf( srcArray[ a ] ) >= 0 )
        dstArray.splice( dstArray.indexOf( srcArray[ a ] ), 1 );
      }
    }

    return dstArray;
  }

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

  unrollMake,
  unrollMakeUndefined,
  unrollFrom,
  unrollsFrom,
  unrollFromMaybe,
  unrollNormalize,

  unrollSelect,

  unrollPrepend,
  unrollAppend,
  unrollRemove,

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
