( function _l3_Entity_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.entity = _.entity || Object.create( null );
// const Self = _global_.wTools;

// --
// container
// --

// /**
//  * Routine iterableIs() checks provided argument {-src-} whether it is countable ( iteratable ).
//  * Returns "true" if provided argument is countable. Othervise "false" returned.
//  *
//  * @param { * } src - Argument of any type.
//  *
//  * @example
//  * _.iterableIs( 10 );
//  * // returns false
//  *
//  * @example
//  * _.iterableIs( [ 1, 2, 3 ] );
//  * // returns true
//  *
//  * @example
//  * _.iterableIs( { a : 2, b : 'str' } );
//  * // returns true
//  *
//  * @example
//  * _.iterableIs( new Set( [ 1, 2, 3 ] ) );
//  * // returns true
//  *
//  * @return { Boolean } - Returns the boolean value of whether the argument is countable.
//  * @function iterableIs
//  * @namespace Tools
//  */
//
// function iterableIs( src )
// {
//   if( !src )
//   return false;
//   if( _.aux.is( src ) )
//   return true;
//   if( _.routine.is( src[ Symbol.iterator ] ) )
//   return true;
//   return false;
// }

//

// function methodIteratorOf( src )
// {
//   if( !src )
//   return false;
//   if( _.routine.is( src[ iteratorSymbol ] ) )
//   return src[ iteratorSymbol ];
//   return false;
// }
//
// //
//
// function methodEqualOf( src )
// {
//   if( !src )
//   return false;
//   if( _.routine.is( src[ equalAreSymbol ] ) )
//   return src[ equalAreSymbol ];
//   return false;
// }

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
  if( src === null )
  return 1;

  // if( _.routine.is( src[ Symbol.iterator ] ) )
  // return [ ... src ].length;

  if( _.vectorLike( src ) )
  return src.length;
  if( _.set.like( src ) )
  return src.size;
  if( _.hashMap.like( src ) )
  return src.size;
  if( _.countableIs( src ) )
  return [ ... src ].length;
  if( _.aux.is( src ) )
  return _.mapKeys( src ).length;

  return 1;
}

// --
// tools extension
// --

let ToolsExtension =
{

  // container

  // iterableIs,
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

// const iteratorSymbol = Symbol.iterator;
// const exportTypeNameGetterSymbol = Symbol.toStringTag;
// const exportPrimitiveSymbol = Symbol.toPrimitive;
// const exportStringNjsSymbol = Symbol.for( 'nodejs.util.inspect.custom' );
// const exportStringSymbol = Symbol.for( 'exportString' );
// const equalAreSymbol = Symbol.for( 'equalAre' );
// const cloneShallowSymbol = Symbol.for( 'cloneShallow' );
// const cloneDeepSymbol = Symbol.for( 'cloneDeep' );

// _metaDefine( 'get', Symbol.toStringTag, _toStringTag );
// _metaDefine( 'field', Symbol.for( 'nodejs.util.inspect.custom' ), _inspectCustom );
// _metaDefine( 'field', Symbol.toPrimitive, _toPrimitive );
// _metaDefine( 'field', Symbol.toPrimitive, _toPrimitive );

let EntityExtension =
{

  tools : _,

  // container

  // methodIteratorOf,
  // methodEqualOf, /* xxx : add other similar routines */
  lengthOf,

  // iteratorSymbol,
  // exportTypeNameGetterSymbol,
  // exportPrimitiveSymbol,
  // exportStringNjsSymbol,
  // exportStringSymbol,
  // equalAreSymbol,
  // cloneShallowSymbol,
  // cloneDeepSymbol,

}

//

Object.assign( _.entity, EntityExtension );

})();
