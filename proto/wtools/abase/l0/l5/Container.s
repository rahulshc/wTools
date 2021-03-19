( function _l5_Container_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.container;

// --
//
// --

function make()
{
  return _.entity.cloneShallow( ... arguments );
}

//

function extendReplacing( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( dst === null || dst === undefined )
  {

    if( _.aux.is( src ) )
    dst = _.mapExtend( null, src );
    else if( _.longLike( src ) )
    dst = _.arrayExtendAppending( null, src );
    else if( _.hashMap.like( src ) )
    dst = _.hashMap.extend( null, src );
    else if( _.set.like( src ) )
    dst = _.arraySet.union_( null, src );
    else
    dst = src;

  }
  else if( _.aux.is( src ) )
  {

    if( _.aux.is( dst ) )
    dst = _.mapExtend( dst, src );
    else if( _.hashMap.like( dst ) )
    dst = _.hashMap.extend( dst, src );
    else
    dst = _.container.extendReplacing( null, src );

  }
  else if( _.longLike( src ) )
  {

    if( _.longIs( dst ) )
    {
      for( let i = src.length - 1 ; i >= 0 ; i-- )
      dst[ i ] = src[ i ];
    }
    else
    {
      dst = _.container.extendReplacing( null, src );
    }

  }
  else if( _.hashMap.like( src ) )
  {

    if( _.hashMap.like( dst ) || _.aux.is( dst ) )
    dst = _.hashMap.extend( dst, src );
    else
    dst = _.container.extendReplacing( null, src );

  }
  else if( _.set.like( src ) )
  {

    if( _.set.like( dst ) || _.longLike( dst ) )
    dst = _.arraySet.union_( dst, src );
    else
    dst = _.container.extendReplacing( null, src );

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

function extendAppending( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( dst === null || dst === undefined )
  {

    if( _.aux.is( src ) )
    dst = _.mapExtend( null, src );
    else if( _.longLike( src ) )
    dst = _.arrayExtendAppending( null, src );
    else if( _.hashMap.like( src ) )
    dst = _.hashMap.extend( null, src );
    else if( _.set.like( src ) )
    dst = _.arraySet.union_( null, src );
    else
    dst = src;

  }
  else if( _.aux.is( dst ) )
  {

    if( _.aux.is( src ) )
    dst = _.mapExtend( dst, src );
    else if( _.hashMap.like( src ) )
    dst = _.hashMap.extend( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.longLike( dst ) )
  {

    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.hashMap.like( dst ) )
  {

    if( _.hashMap.like( src ) || _.aux.is( src ) )
    dst = _.hashMap.extend( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.set.like( dst ) )
  {

    if( _.set.like( src ) || _.longLike( src ) )
    dst = _.arraySet.union_( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

/**
 * The routine empty() clears provided container {-dstContainer-}.
 *
 * @param { Long|Set|HashMap|Aux } dstContainer - Container to be cleared. {-dstContainer-} should be resizable.
 *
 * @example
 * let dst = [];
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log []
 * console.log( got === dst );
 * log true
 *
 * @example
 * let dst = [ 1, 'str', { a : 2 } ];
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log []
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let dst = _.unrollMake( [ 1, 'str', { a : 2 } ] );
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log []
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let dst = new Set( [ 1, 'str', { a : 2 } ] );
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log Set {}
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let dst = new Map( [ [ 1, 'str' ], [ 'a', null ] ] );
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log Map {}
 * console.log( got === dst );
 * // log true
 *
 * @returns { Long|Set|HashMap|Aux } - Returns a empty {-dstContainer-}.
 * @function empty
 * @throws { Error } If arguments.length is less than one.
 * @throws { Error } If {-dstContainer-} is not a Long, not a Set, not a HashMap, not a Aux.
 * @throws { Error } If {-dstContainer-} is not a resizable Long, or if it is a WeakSet or WeakMap.
 * @namespace Tools
 */

function empty( dstContainer )
{
  if( _.longLike( dstContainer ) )
  _.longEmpty( dstContainer );
  else if( _.set.like( dstContainer ) )
  dstContainer.clear();
  else if( _.hashMap.like( dstContainer ) )
  dstContainer.clear();
  else if( _.aux.is( dstContainer ) )
  _.mapEmpty( dstContainer );
  else
  _.assert( 0, `Not clear how to empty non-container ${_.entity.strType( dstContainer )}` );
  return dstContainer;
}

//

/**
 * The routine elementThGet() searches for value under a certain index {-key-} in a container {-container-}
 * and returns array with value, key, booLike.
 *
 * @param { Long|Set|HashMap|Aux } container - input container.
 * @param { Number } key - index to be looked in a container.
 *
 * @example
 * var src = { a : 1, b : 2 };
 * var got = _.container.elementThGet( src, 0 );
 * console.log( got );
 * // log : [ 1, 'a', true ]
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementThGet( src, 2 );
 * console.log( got );
 * // log : [ 3, 2, true ]
 *
 * @example
 * var src = new HashMap([ [ 'a', 1 ], [ true, false ], [ objRef, { a : 2 } ] ]);
 * var got = _.container.elementThGet( src, 1 );
 * console.log( got )
 * // log : [ false, true, true ] );
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementThGet( src, 5 );
 * console.log( got );
 * // log : [ undefined, 5, false ]
 *
 * @returns { Long } - with 3 elements : value ( undefined if index {-key-} is more or less than container's length ), key, boolLike ( true if index {-key-} is within container's length, false otherwise ).
 * @function elementThGet
 * @throws { Error } If arguments.length is not equal to 2.
 * @throws { Error } If {-key-} is not Number.
 * @namespace Tools
 */

/* qqq : for Yevhen : bad : jsdoc? | added . */
function elementThGet( container, key ) /* qqq for Yevhen : cover please | aaa : Done. */
{

  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( key ) );
  if( key < 0 )
  return [ undefined, key, false ];

  if( _.mapIs( container ) )
  {
    let keys = Object.keys( container );
    let key2 = keys[ key ];
    if( keys.length <= key )
    return [ undefined, undefined, false ];
    return [ container[ key2 ], key2, true ];
  }
  else if( _.hashMap.is( container ) )
  {
    if( container.size <= key )
    return [ undefined, undefined, false ];
    let entry = [ ... container ][ key ];
    return [ entry[ 1 ], entry[ 0 ], true ];
  }
  else if( _.set.like( container ) )
  {
    if( container.size <= key )
    return [ undefined, key, false ];
    return [ [ ... container ][ key ], key, true ];
  }
  else if( _.entity.methodIteratorOf( container ) && !_.primitive.is( container ) )
  {
    let elements = [ ... container ];
    if( key < elements.length )
    return [ elements[ key ], key, true ];
    return [ undefined, key, false ];
  }
  else _.assert( 0, 'Not container' );

}

//

/**
 * The routine elementGet() searches for value under a certain {-key-} in a container {-container-}
 * and returns array with value, key, booLike.
 *
 * @param { Long|Set|HashMap|Aux } container - input container.
 * @param { * } key - key to be looked in a container.
 *
 * @example
 * var src = { a : 1, b : 2 };
 * var got = _.container.elementGet( src, 'a' );
 * console.log( got );
 * // log : [ 1, 'a', true ]
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementGet( src, 2 );
 * console.log( got );
 * // log : [ 3, 2, true ]
 *
 * @example
 * var src = new HashMap([ [ 'a', 1 ], [ true, false ], [ objRef, { a : 2 } ] ]);
 * var got = _.container.elementGet( src, true );
 * console.log( got )
 * // log : [ false, true, true ] );
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementGet( src, 5 );
 * console.log( got );
 * // log : [ undefined, 5, false ]
 *
 * @returns { Long } - with 3 elements : value ( undefined if key is absent ), key, boolLike ( true if key exists, false otherwise ).
 * @function elementGet
 * @throws { Error } If arguments.length is not equal to 2.
 * @namespace Tools
 */

/* qqq : for Yevhen : bad : jsdoc? | aaa : Added */
function elementGet( container, key ) /* qqq for Yevhen : cover please | aaa : Done. */
{

  _.assert( arguments.length === 2 );

  if( !container )
  {
    return [ undefined, key, false ];
  }
  else if( _.hashMap.like( container ) )
  {
    if( container.has( key ) )
    return [ container.get( key ), key, true ];
    else
    return [ undefined, key, false ];
  }
  else if( _.set.like( container ) ) /* xxx : change */
  {
    if( container.size <= key || !_.number.is( key ) )
    return [ undefined, key, false ];
    return [ [ ... container ][ key ], key, true ];
  }
  else if( _.number.is( key ) && _.entity.methodIteratorOf( container ) )
  {
    const container2 = [ ... container ];
    if( container2.length > key )
    return [ container2[ key ], key, true ];
    else
    return [ undefined, key, false ];
  }
  else if( _.escape.is( key ) )
  {
    if( key.val === prototypeSymbol )
    {
      let r = _.prototype.of( container );
      return [ r, prototypeSymbol, !!r ];
    }
    else _.assert( 0, 'Unknown implicit field' );
  }
  else
  {
    if( _.arrayLike( container ) && !_.number.is( key ) )
    return [ undefined, key, false ];

    if( _.property.has( container, key ) )
    return [ container[ key ], key, true ];
    else
    return [ undefined, key, false ];
  }

}

//

/* qqq : for Yevhen : cover, please. dont forget jsdoc. */
function elementSet( container, key, value )
{

  _.assert( arguments.length === 3 ); debugger;

  if( container )
  {
    if( _.hashMap.like( container ) )
    {
      container.set( key, value );
      return value;
    }
    else
    {
      _.assert( !_.set.like( container ), 'not implemented' );
      container[ key ] = value;
      return container[ key ];
    }
  }
  else
  {
    return undefined;
  }

}

// --
// structure
// --

// let knownTypeFields =
// {
//   name : null,
//   _elementSet : null,
//   _elementGet : null,
//   _lengthGet : null,
//   _is : null,
//   _identicalTypes : null, /* qqq : cover please. ask how */
//   _while : null,
//   _coerce : null, /* qqq : cover this callback */
// }

// --
// extension
// --

const prototypeSymbol = Symbol.for( 'prototype' );

let Extension =
{

  extendReplacing,
  extendAppending,

  empty,

  elementThGet,
  elementGet, /* qqq : cover please */
  elementSet,

  // fields

  // knownTypeFields,

}

_.mapSupplement( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
