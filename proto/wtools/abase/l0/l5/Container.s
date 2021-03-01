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

// //
//
// function typeOf( src )
// {
//   _.assert( arguments.length === 1 );
//   for( let t in this.types )
//   {
//     let type = this.types[ t ];
//     if( type._is( src ) )
//     {
//       return type;
//     }
//   }
// }
//
// //
//
// function typeDeclare( type )
// {
//
//   _.map.assertHasOnly( type, this.knownTypeFields );
//   _.assert( arguments.length === 1 );
//   _.assert( _.strDefined( type.name ) );
//   _.assert( _.routine.is( type._is ) );
//   _.assert( this.types[ type.name ] === undefined || this.types[ type.name ] === type );
//
//   this.types[ type.name ] = type;
//
//   return type;
// }
//
// //
//
// function typeUndeclare( type )
// {
//
//   if( !_.strIs( type ) )
//   {
//     _.assert( _.longHas( _.mapVals( this.types ), type ), () => `Container type::${type.name} is not registered` );
//     type = type.name;
//   }
//
//   let result = this.types[ type ];
//
//   _.assert( arguments.length === 1 );
//   _.assert( result !== undefined );
//
//   delete this.types[ type ];
//
//   return result;
// }

//

function elementGet( container, key, type ) /* qqq for Yevhen : cover please */
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  _.assert( !type );
  // if( type !== false ) /* yyy */
  // {
  //   type = _.container.typeOf( container );
  //   if( type && type._elementGet )
  //   return type._elementGet( container, key );
  // }

  if( container )
  {
    if( _.hashMap.like( container ) )
    {
      return container.get( key );
    }
    else if( _.set.like( container ) )
    {
      return [ ... container ][ key ];
    }
    else if( _.number.is( key ) && _.entity.methodIteratorOf( container ) )
    {
      return [ ... container ][ key ];
    }
    else
    {
      if( _.escape.is( key ) )
      {
        debugger;
        if( key.val === prototypeSymbol )
        return _.prototype.of( container );
        else _.assert( 0 );
      }
      return container[ key ];
    }
  }
  else
  {
    return undefined;
  }

}

//

function elementSet( container, key, value )
{

  _.assert( arguments.length === 3 ); debugger;

  // let type = _.container.typeOf( container );
  // if( type && type._elementSet )
  // return type._elementSet( container, key, value );

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

let knownTypeFields =
{
  name : null,
  _elementSet : null,
  _elementGet : null,
  _lengthGet : null,
  _is : null,
  _identicalTypes : null, /* qqq : cover please. ask how */
  _while : null,
  _coerce : null, /* qqq : cover this callback */
}

// --
// extension
// --

// const types = _realGlobal_.wTools.container.types;
const prototypeSymbol = Symbol.for( 'prototype' );

let Extension =
{

  extendReplacing,
  extendAppending,

  // extendAppendingRecursive,

  empty,

  // typeOf, /* yyy */
  // typeDeclare, /* yyy */
  // typeUndeclare, /* yyy */
  elementGet, /* qqq : cover please */
  elementSet,

  // fields

  knownTypeFields,

}

_.mapSupplement( Self, Extension );
// _.container.types = types;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
