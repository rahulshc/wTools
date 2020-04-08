( function _fContainer_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.container;

// --
//
// --

function make()
{
  return _.entityMakeConstructing( ... arguments );
}

//

function extendReplacing( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( dst === null || dst === undefined )
  {

    if( _.mapLike( src ) )
    dst = _.mapExtend( null, src );
    else if( _.longLike( src ) )
    dst = _.arrayExtendAppending( null, src );
    else if( _.hashMapLike( src ) )
    dst = _.hashMapExtend( null, src );
    else if( _.setLike( src ) )
    dst = _.arraySetUnion_( null, src );
    else
    dst = src;

  }
  else if( _.mapLike( src ) )
  {

    if( _.mapLike( dst ) )
    dst = _.mapExtend( dst, src );
    else if( _.hashMapLike( dst ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = _.container.extendReplacing( null, src );

  }
  else if( _.longLike( src ) )
  {

    if( _.longIs( dst ) )
    for( let i = src.length - 1 ; i >= 0 ; i-- )
    dst[ i ] = src[ i ];
    else
    dst = _.container.extendReplacing( null, src );

  }
  else if( _.hashMapLike( src ) )
  {

    // _.assert( 0, 'not tested' );
    if( _.hashMapLike( dst ) || _.mapLike( dst ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = _.container.extendReplacing( null, src );

  }
  else if( _.setLike( src ) )
  {

    // _.assert( 0, 'not tested' );
    if( _.setLike( dst ) || _.longLike( dst ) )
    dst = _.arraySetUnion_( dst, src );
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

    if( _.mapLike( src ) )
    dst = _.mapExtend( null, src );
    else if( _.longLike( src ) )
    dst = _.arrayExtendAppending( null, src );
    else if( _.hashMapLike( src ) )
    dst = _.hashMapExtend( null, src );
    else if( _.setLike( src ) )
    dst = _.arraySetUnion_( null, src );
    else
    dst = src;

  }
  else if( _.mapLike( dst ) )
  {

    if( _.mapLike( src ) )
    dst = _.mapExtend( dst, src );
    else if( _.hashMapLike( src ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.longLike( dst ) )
  {

    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.hashMapLike( dst ) )
  {

    if( _.hashMapLike( src ) || _.mapLike( src ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.setLike( dst ) )
  {

    if( _.setLike( src ) || _.longLike( src ) )
    dst = _.arraySetUnion_( dst, src );
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
 * @param { Long|Set|HashMap|MapLike } dstContainer - Container to be cleared. {-dstContainer-} should be resizable.
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
 * @returns { Long|Set|HashMap|MapLike } - Returns a empty {-dstContainer-}.
 * @function empty
 * @throws { Error } If arguments.length is less than one.
 * @throws { Error } If {-dstContainer-} is not a Long, not a Set, not a HashMap, not a MapLike.
 * @throws { Error } If {-dstContainer-} is not a resizable Long, or if it is a WeakSet or WeakMap.
 * @namespace Tools
 */

function empty( dstContainer )
{
  if( _.longLike( dstContainer ) )
  _.longEmpty( dstContainer );
  else if( _.setLike( dstContainer ) )
  dstContainer.clear();
  else if( _.hashMapLike( dstContainer ) )
  dstContainer.clear();
  else if( _.mapLike( dstContainer ) )
  _.mapEmpty( dstContainer );
  else
  _.assert( 0, `Not clear how to empty non-container ${_.strType( dstContainer )}` );
  return dstContainer;
}

//

function typeOf( src )
{
  _.assert( arguments.length === 1 );
  for( let t in this.types )
  {
    let type = this.types[ t ];
    if( type._is( src ) )
    {
      return type;
    }
  }
}

//

function typeDeclare( type )
{

  _.assertMapHasOnly( type, this.knownTypeFields );
  _.assert( arguments.length === 1 );
  _.assert( _.strDefined( type.name ) );
  _.assert( _.routineIs( type._is ) );
  _.assert( this.types[ type.name ] === undefined || this.types[ type.name ] === type );

  this.types[ type.name ] = type;

  return type;
}

//

function typeUndeclare( type )
{

  if( !_.strIs( type ) )
  {
    _.assert( _.longHas( _.mapVals( this.types ), type ), () => `Container type::${type.name} is not registered` );
    type = type.name;
  }

  let result = this.types[ type ];

  _.assert( arguments.length === 1 );
  _.assert( result !== undefined );

  delete this.types[ type ];

  return result;
}

//

function elementGet( container, key, type )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( type !== false )
  {
    type = _.container.typeOf( container );
    if( type && type._elementGet )
    return type._elementGet( container, key );
  }

  if( container )
  {
    if( _.hashMapLike( container ) )
    {
      debugger;
      return container.get( key );
    }
    else if( _.setLike( container ) )
    {
      return [ ... container ][ key ];
    }
    else
    {
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

  let type = _.container.typeOf( container );
  if( type && type._elementSet )
  return type._elementSet( container, key, value );

  if( container )
  {
    if( _.hashMapLike( container ) )
    {
      container.set( key, value );
      return value;
    }
    else
    {
      _.assert( !_.setLike( container ), 'not implemented' );
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
  _is : null,
  _identicalTypes : null, /* qqq : cover please. ask how */
  _while : null,
}

// --
// extension
// --

let types = _realGlobal_.wTools.container.types;

let Extension =
{

  extendReplacing,
  extendAppending,

  // extendAppendingRecursive,

  empty,

  typeOf,
  typeDeclare, /* qqq : cover please. ask how */
  typeUndeclare,
  elementGet,
  elementSet,

  // fields

  knownTypeFields,

}

_.mapSupplement( Self, Extension );
_.container.types = types;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
