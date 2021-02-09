( function _l3_Entity_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.entity = _.entity || Object.create( null );
// let Self = _global_.wTools;

// --
// container
// --

/**
 * Routine iterableIs() checks provided argument {-src-} whether it is countable ( iteratable ).
 * Returns "true" if provided argument is countable. Othervise "false" returned.
 *
 * @param { * } src - Argument of any type.
 *
 * @example
 * _.iterableIs( 10 );
 * // returns false
 *
 * @example
 * _.iterableIs( [ 1, 2, 3 ] );
 * // returns true
 *
 * @example
 * _.iterableIs( { a : 2, b : 'str' } );
 * // returns true
 *
 * @example
 * _.iterableIs( new Set( [ 1, 2, 3 ] ) );
 * // returns true
 *
 * @return { Boolean } - Returns the boolean value of whether the argument is countable.
 * @function iterableIs
 * @namespace Tools
 */

function iterableIs( src ) /* qqq xxx : check. good coverage is required */
{
  if( !src )
  return false;
  if( _.mapLike_( src ) )
  return true;
  if( _.routineIs( src[ Symbol.iterator ] ) )
  return true;
  return false;
}

//

function methodIteratorOf( src ) /* qqq xxx : check. good coverage is required | aaa : Done. Yevhen S. */
{
  if( !src )
  return false;
  if( _.routineIs( src[ iteratorSymbol ] ) )
  return src[ iteratorSymbol ];
  return false;
}

//

function methodEqualOf( src ) /* qqq xxx : check. good coverage is required | aaa : Done. Yevhen S. */
{
  if( !src )
  return false;
  if( _.routineIs( src[ equalAreSymbol ] ) )
  return src[ equalAreSymbol ];
  return false;
}

//

/**
 * Returns "length" of entity( src ). Representation of "length" depends on type of( src ):
 *  - For object returns number of it own enumerable properties;
 *  - For array or array-like object returns value of length property;
 *  - For undefined returns 0;
 *  - In other cases returns 1.
 *
 * @param { * } src - Source entity.
 *
 * @example
 * _.lengthOf( [ 1, 2, 3 ] );
 * // returns 3
 *
 * @example
 * _.lengthOf( 'string' );
 * // returns 1
 *
 * @example
 * _.lengthOf( { a : 1, b : 2 } );
 * // returns 2
 *
 * @example
 * let src = undefined;
 * _.lengthOf( src );
 * // returns 0
 *
 * @returns {number} Returns "length" of entity.
 * @function lengthOf
 * @namespace Tools
*/

function lengthOf( src )
{
  if( src === undefined )
  return 0;
  if( _.mapLike_( src ) )
  return _.mapOnlyOwnKeys( src ).length;
  if( _.objectIs( src ) && _.routineIs( src[ Symbol.iterator ] ) )
  return [ ... src ].length;
  if( _.longLike( src ) )
  return src.length;
  if( _.setLike( src ) )
  return src.size;
  if( _.hashMapLike( src ) )
  return src.size;
  return 1;
}

// --
// tools extension
// --

let ToolsExtension =
{

  // container

  iterableIs,
  // methodIteratorOf,
  // methodEqualOf, /* xxx : add other similar routines */
  lengthOf,
  entityLengthOf : lengthOf,

}

//

Object.assign( _, ToolsExtension );

// --
// entity extension
// --

const iteratorSymbol = Symbol.iterator;
const typeNameGetterSymbol = Symbol.toStringTag;
const toPrimitiveSymbol = Symbol.toPrimitive;
const toStrNjsSymbol = Symbol.for( 'nodejs.util.inspect.custom' );
const equalAreSymbol = Symbol.for( 'equalAre' );
const shallowCloneSymbol = Symbol.for( 'cloneShallow' );
const deepCloneSymbol = Symbol.for( 'cloneDeep' );

// _metaDefine( 'get', Symbol.toStringTag, _toStringTag );
// _metaDefine( 'field', Symbol.for( 'nodejs.util.inspect.custom' ), _inspectCustom );
// _metaDefine( 'field', Symbol.toPrimitive, _toPrimitive );
// _metaDefine( 'field', Symbol.toPrimitive, _toPrimitive );

let EntityExtension =
{

  tools : _,

  // container

  iterableIs,
  methodIteratorOf,
  methodEqualOf, /* xxx : add other similar routines */
  lengthOf,

  iteratorSymbol,
  typeNameGetterSymbol,
  toPrimitiveSymbol,
  toStrNjsSymbol,
  equalAreSymbol,
  shallowCloneSymbol,
  deepCloneSymbol,

}

//

Object.assign( _.entity, EntityExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
