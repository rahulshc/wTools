( function _l3_Map_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// map checker
// --

// /**
//  * Function objectIs checks incoming param whether it is object.
//  * Returns "true" if incoming param is object. Othervise "false" returned.
//  *
//  * @example
//  * let obj = { x : 100 };
//  * _.objectIs(obj);
//  * // returns true
//  *
//  * @example
//  * _.objectIs( 10 );
//  * // returns false
//  *
//  * @param { * } src.
//  * @return { Boolean }.
//  * @function objectIs
//  * @namespace Tools
//  */
//
// function objectIs( src )
// {
//   return Object.prototype.toString.call( src ) === '[object Object]';
// }
//
// //
//
// function objectLike( src ) /* xxx qqq : optimize */
// {
//
//   if( _.objectIs( src ) )
//   return true;
//
//   if( _.primitiveIs( src ) )
//   return false;
//
//   // if( _.longIs( src ) ) /* yyy */
//   // return false;
//   if( _.vectorIs( src ) )
//   return false;
//
//   if( _.routineIsTrivial( src ) )
//   return false;
//
//   // yyy
//   // for( let k in src )
//   // return true;
//
//   return false;
// }
//
// //
//
// function constructibleIs( src ) /* xxx qqq : optimize */
// {
//   if( _.primitiveIs( src ) )
//   return false;
//
//   let proto = Object.getPrototypeOf( src );
//   if( proto === null )
//   return false;
//
//   if( !Reflect.has( proto, 'constructor' ) )
//   return false;
//   if( proto.constructor === Object )
//   return false;
//
//   if( _.mapLike( src ) ) /* xxx : remove? */
//   return false;
//   if( _.vectorIs( src ) )
//   return false;
//   if( _.setIs( src ) )
//   return false;
//   if( _.hashMapIs( src ) )
//   return false;
//
//   return true;
// }
//
// //
//
// function constructibleLike( src )
// {
//   return _.constructibleIs( src );
// }

//

/**
 * The mapIs() routine determines whether the passed value is an Object,
 * and not inherits through the prototype chain.
 *
 * If the {-srcMap-} is an Object, true is returned,
 * otherwise false is.
 *
 * @param { * } src - Entity to check.
 *
 * @example
 * _.mapIs( { a : 7, b : 13 } );
 * // returns true
 *
 * @example
 * _.mapIs( 13 );
 * // returns false
 *
 * @example
 * _.mapIs( [ 3, 7, 13 ] );
 * // returns false
 *
 * @returns { Boolean } Returns true if {-srcMap-} is an Object, and not inherits through the prototype chain.
 * @function mapIs
 * @namespace Tools
 */

function mapIs( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto === Object.prototype )
  return true;

  return false;
}

// function mapIs( src )
// {
//
//   if( !_.objectIs( src ) )
//   return false;
//
//   let proto = Object.getPrototypeOf( src );
//
//   if( proto === null )
//   return true;
//
//   if( !proto.constructor )
//   return false;
//
//   if( proto.constructor.name !== 'Object' )
//   return false;
//
//   if( Object.getPrototypeOf( proto ) === null )
//   return true;
//
//   _.assert( proto === null || !!proto, 'unexpected' );
//
//   return false;
// }

//

// function mapLike( src )
// {
//   if( mapIs( src ) )
//   return true;
//   return false;
// }

function mapLike( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto === Object.prototype )
  return true;

  if( !_.primitiveIs( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function mapIsPure( src )
{
  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  if( Object.getPrototypeOf( src ) === null )
  return true;

  return false;
}

//

function mapIsPolluted( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto === Object.prototype )
  return true;

  return false;
}

//

function mapLikePrototyped( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto === Object.prototype )
  return false;

  if( !_.primitiveIs( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function mapLikePure( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto.constructor === Object )
  return false;

  if( !_.primitiveIs( proto ) )
  if( !Reflect.has( proto, 'constructor' ) )
  return true;

  return false;
}

//

function mapLikePolluted( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto.constructor === Object )
  return true;

  return false;
}

//

function mapIsEmpty( src )
{
  if( !_.mapIs( src ) )
  return false;
  return Object.keys( src ).length === 0;
}

//

function mapLikeEmpty( src )
{
  if( !_.mapLike( src ) )
  return false;
  return Object.keys( src ).length === 0;
}

//

function mapIsPopulated( src )
{
  if( !_.mapIs( src ) )
  return false;
  return Object.keys( src ).length > 0;
}

//

function mapLikePopulated( src )
{
  if( !_.mapLike( src ) )
  return false;
  return Object.keys( src ).length > 0;
}

// //
//
// function mapIsHeritated( src ) /* xxx */
// {
//
//   if( !_.objectIs( src ) )
//   return false;
//
//   let proto = src;
//
//   do
//   {
//
//     proto = Object.getPrototypeOf( proto );
//
//     if( proto === null )
//     return true;
//
//     if( proto.constructor && proto.constructor.name !== 'Object' )
//     return false;
//
//     src = proto;
//   }
//   while( proto );
//
//   if( proto === null )
//   return true;
//
//   return false;
// }

// //
//
// function mapLike( src )
// {
//
//   if( mapIs( src ) )
//   return true;
//
//   if( !src )
//   return false;
//
//   if( !_.objectLike( src ) )
//   return false;
//
//   if( _.instanceIs( src ) )
//   return false;
//
//   return true;
// }

//

function hashMapIs( src )
{
  if( !src )
  return false;
  return src instanceof HashMap || src instanceof HashMapWeak;
}

//

function hashMapLike( src )
{
  return _.hashMapIs( src );
}

//

function hashMapIsEmpty()
{
  return !src.size;
}

//

function hashMapIsPopulated()
{
  return !!src.size;
}

// --
// map selector
// --

function _mapKeys( o )
{
  let result = [];

  _.routineOptions( _mapKeys, o );

  let srcMap = o.srcMap;
  let selectFilter = o.selectFilter;

  _.assert( this === _ );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectLike( o ) );
  _.assert( !( srcMap instanceof Map ), 'not implemented' );
  _.assert( selectFilter === null || _.routineIs( selectFilter ) );

  /* */

  if( o.onlyEnumerable )
  {
    let result1 = [];

    _.assert( !_.primitiveIs( srcMap ) );

    if( o.onlyOwn )
    {
      for( let k in srcMap )
      if( Object.hasOwnProperty.call( srcMap, k ) )
      result1.push( k );
    }
    else
    {
      for( let k in srcMap )
      result1.push( k );
    }

    filter( srcMap, result1 );

  }
  else
  {
    _.assert( !( srcMap instanceof Map ), 'not implemented' );

    if( o.onlyOwn  )
    {
      filter( srcMap, Object.getOwnPropertyNames( srcMap ) );
    }
    else
    {
      let proto = srcMap;
      result = [];
      do
      {
        filter( proto, Object.getOwnPropertyNames( proto ) );
        proto = Object.getPrototypeOf( proto );
      }
      while( proto );
    }

  }

  return result;

  /* */

  function filter( srcMap, keys )
  {

    if( !selectFilter )
    {
      _.arrayAppendArrayOnce( result, keys );
    }
    else for( let k = 0 ; k < keys.length ; k++ )
    {
      let e = selectFilter( srcMap, keys[ k ] );
      if( e !== undefined )
      _.arrayAppendOnce( result, e );
    }

  }

}

_mapKeys.defaults =
{
  srcMap : null,
  onlyOwn : 0,
  onlyEnumerable : 1,
  selectFilter : null,
}

//

/**
 * This routine returns an array of a given objects onlyEnumerable properties,
 * in the same order as that provided by a for...in loop.
 * Accept single object. Each element of result array is unique.
 * Unlike standard [Object.keys]{@https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/keys}
 * which accept object only mapKeys accept any object-like entity.
 *
 * @see {@link wTools.mapOnlyOwnKeys} - Similar routine taking into account own elements only.
 * @see {@link wTools.mapVals} - Similar routine returning values.
 *
 * @example
 * _.mapKeys({ a : 7, b : 13 });
 * // returns [ "a", "b" ]
 *
 * @example
 * let o = { onlyOwn : 1, onlyEnumerable : 0 };
 * _.mapKeys.call( o, { a : 1 } );
 * // returns [ "a" ]
 *
 * @param { objectLike } srcMap - object of interest to extract keys.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyOwn = false ] - count only object`s own properties.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 * @return { array } Returns an array with unique string elements.
 * corresponding to the onlyEnumerable properties found directly upon object or empty array
 * if nothing found.
 * @function mapKeys
 * @throws { Exception } Throw an exception if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function mapKeys( srcMap, o )
{
  let result;

  _.assert( this === _ );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapKeys, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;

  result = _._mapKeys( o );

  return result;
}

mapKeys.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 1,
}

//

/**
 * The mapOnlyOwnKeys() returns an array of a given object`s own enumerable properties,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.mapOnlyOwnKeys({ a : 7, b : 13 });
 * // returns [ "a", "b" ]
 *
 * @example
 * let o = { onlyEnumerable : 0 };
 * _.mapOnlyOwnKeys.call( o, { a : 1 } );
 * // returns [ "a" ]

 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the own onlyEnumerable properties found directly upon object or empty
 * array if nothing found.
 * @function mapOnlyOwnKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
*/

function mapOnlyOwnKeys( srcMap, o )
{
  let result;

  _.assert( this === _ );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapOnlyOwnKeys, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.onlyOwn = 1;

  result = _._mapKeys( o );

  if( !o.onlyEnumerable )
  debugger;

  return result;
}

mapOnlyOwnKeys.defaults =
{
  onlyEnumerable : 1,
}

//

/**
 * The mapAllKeys() returns all properties of provided object as array,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 *
 * @example
 * let x = { a : 1 };
 * let y = { b : 2 };
 * Object.setPrototypeOf( x, y );
 * _.mapAllKeys( x );
 * // returns [ "a", "b", "__defineGetter__", ... "isPrototypeOf" ]
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the all properties found on the object.
 * @function mapAllKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @namespace Tools
*/

function mapAllKeys( srcMap, o )
{

  _.assert( this === _ );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapAllKeys, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  // o.onlyOwn = 0;
  // o.onlyEnumerable = 0;

  let result = _._mapKeys( o );

  return result;
}

/* qqq : write test routine for each option */
/* qqq : do the same for similar routines */
/* qqq : adjust similar routine if they handle options no like routine mapAllKeys */
mapAllKeys.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 0,
}

//

function _mapVals( o )
{

  _.routineOptions( _mapVals, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );
  _.assert( o.selectFilter === null );
  _.assert( this === _ );

  let result = _._mapKeys( o );

  for( let k = 0 ; k < result.length ; k++ )
  {
    result[ k ] = o.srcMap[ result[ k ] ];
  }

  return result;
}

_mapVals.defaults =
{
  srcMap : null,
  onlyOwn : 0,
  onlyEnumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapVals() routine returns an array of a given object's
 * onlyEnumerable property values, in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyOwn = false ] - count only object`s own properties.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.mapVals( { a : 7, b : 13 } );
 * // returns [ "7", "13" ]
 *
 * @example
 * let o = { onlyOwn : 1 };
 * let a = { a : 7 };
 * let b = { b : 13 };
 * Object.setPrototypeOf( a, b );
 * _.mapVals.call( o, a )
 * // returns [ 7 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the onlyEnumerable property values found directly upon object.
 * @function mapVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function mapVals( srcMap, o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapVals, o );
  _.assert( !_.primitiveIs( srcMap ) );
  _.assert( this === _ );

  o.srcMap = srcMap;

  let result = _._mapVals( o );

  return result;
}

mapVals.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 1,
}

//

/**
 * The mapOnlyOwnVals() routine returns an array of a given object's
 * own onlyEnumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.mapOnlyOwnVals( { a : 7, b : 13 } );
 * // returns [ "7", "13" ]
 *
 * @example
 * let o = { onlyEnumerable : 0 };
 * let a = { a : 7 };
 * Object.defineProperty( a, 'x', { onlyEnumerable : 0, value : 1 } )
 * _.mapOnlyOwnVals.call( o, a )
 * // returns [ 7, 1 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the onlyEnumerable property values found directly upon object.
 * @function mapOnlyOwnVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function mapOnlyOwnVals( srcMap, o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapOnlyOwnVals, o );
  _.assert( !_.primitiveIs( srcMap ) );
  _.assert( this === _ );

  o.srcMap = srcMap;
  o.onlyOwn = 1;

  let result = _._mapVals( o );

  debugger;
  return result;
}

mapOnlyOwnVals.defaults =
{
  onlyEnumerable : 1,
}

//

/**
 * The mapAllVals() returns values of all properties of provided object as array,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 *
 * @example
 * _.mapAllVals( { a : 7, b : 13 } );
 * // returns [ "7", "13", function __defineGetter__(), ... function prototypeIsPrototypeOf() ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the onlyEnumerable property values found directly upon object.
 * @function mapAllVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @namespace Tools
 */

function mapAllVals( srcMap, o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapAllVals, o );
  _.assert( !_.primitiveIs( srcMap ) );
  _.assert( this === _ );

  o.srcMap = srcMap;
  o.onlyOwn = 0;
  o.onlyEnumerable = 0;

  let result = _._mapVals( o );

  debugger;
  return result;
}

mapAllVals.defaults =
{
}

//

function _mapPairs( o )
{

  _.routineOptions( _mapPairs, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );
  _.assert( !_.primitiveIs( o.srcMap ) );
  _.assert( this === _ );

  let selectFilter = o.selectFilter;

  if( o.selectFilter )
  debugger;

  if( !o.selectFilter )
  o.selectFilter = function selectFilter( srcMap, k )
  {
    return [ k, srcMap[ k ] ];
  }

  let result = _._mapKeys( o );

  return result;
}

_mapPairs.defaults =
{
  srcMap : null,
  onlyOwn : 0,
  onlyEnumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapPairs() converts an object into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyOwn = false ] - count only object`s own properties.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.mapPairs( { a : 7, b : 13 } );
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapPairs.call( { onlyOwn : 1 }, a );
 * // returns [ [ "a", 1 ] ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function mapPairs( srcMap, o )
{

  _.assert( this === _ );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapPairs, o );

  o.srcMap = srcMap;

  let result = _._mapPairs( o );

  return result;
}

mapPairs.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 1,
}

//

/**
 * The mapOnlyOwnPairs() converts an object's own properties into a list of [ key, value ] pairs.
 *
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs of object`s own properties if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.mapOnlyOwnPairs( { a : 7, b : 13 } );
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOnlyOwnPairs( a );
 * // returns [ [ "a", 1 ] ]
 *
 * @example
 * let a = { a : 1 };
 * _.mapOnlyOwnPairs.call( { onlyEnumerable : 0 }, a );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapOnlyOwnPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function mapOnlyOwnPairs( srcMap, o )
{

  _.assert( this === _ );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapOnlyOwnPairs, o );

  o.srcMap = srcMap;
  o.onlyOwn = 1;

  let result = _._mapPairs( o );

  debugger;
  return result;
}

mapOnlyOwnPairs.defaults =
{
  onlyEnumerable : 1,
}

//

/**
 * The mapAllPairs() converts all properties of the object {-srcMap-} into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs that repesents all properties of provided object{-srcMap-},
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 *
 * @example
 * _.mapAllPairs( { a : 7, b : 13 } );
 * // returns [ [ "a", 7 ], [ "b", 13 ], ... [ "isPrototypeOf", function prototypeIsPrototypeOf() ] ]
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllPairs( a );
 * // returns [ [ "a", 1 ], [ "b", 2 ], ... [ "isPrototypeOf", function prototypeIsPrototypeOf() ]  ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapAllPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @namespace Tools
 */

function mapAllPairs( srcMap, o )
{

  _.assert( this === _ );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( mapAllPairs, o );

  o.srcMap = srcMap;
  o.onlyOwn = 0;
  o.onlyEnumerable = 0;

  let result = _._mapPairs( o );

  debugger;
  return result;
}

mapAllPairs.defaults =
{
}

//

/**
 * The mapFirstPair() routine returns first pair [ key, value ] as array.
 *
 * @param { objectLike } srcMap - An object like entity of get first pair.
 *
 * @example
 * _.mapFirstPair( { a : 3, b : 13 } );
 * // returns [ 'a', 3 ]
 *
 * @example
 * _.mapFirstPair( {  } );
 * // returns 'undefined'
 *
 * @example
 * _.mapFirstPair( [ [ 'a', 7 ] ] );
 * // returns [ '0', [ 'a', 7 ] ]
 *
 * @returns { Array } Returns pair [ key, value ] as array if {-srcMap-} has fields, otherwise, undefined.
 * @function mapFirstPair
 * @throws { Error } Will throw an Error if (arguments.length) less than one, if {-srcMap-} is not an object-like.
 * @namespace Tools
 */

function mapFirstPair( srcMap )
{

  _.assert( this === _ );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectLike( srcMap ) );

  for( let s in srcMap )
  {
    return [ s, srcMap[ s ] ];
  }

  return [];
}

//

function mapValsSet( dstMap, val )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  for( let k in dstMap )
  {
    dstMap[ k ] = val;
  }

  return dstMap;
}

//

function mapSelect( srcMap, keys )
{
  let result = Object.create( null );

  _.assert( _.arrayLike( keys ) );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let k = 0 ; k < keys.length ; k++ )
  {
    let key = keys[ k ];
    _.assert( _.strIs( key ) || _.numberIs( key ) );
    result[ key ] = srcMap[ key ];
  }

  return result;
}

//

/**
 * The mapValWithIndex() returns value of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * _.mapValWithIndex( [ 3, 13, 'c', 7 ], 3 );
 * // returns 7
 *
 * @returns { * } Returns value of {-srcMap-} by corresponding (index).
 * @function mapValWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @namespace Tools
 */

function mapValWithIndex( srcMap, index )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  if( index < 0 )
  return;

  let i = 0;
  for( let s in srcMap )
  {
    if( i === index )
    return srcMap[ s ];
    i++;
  }
}

//

/**
 * The mapKeyWithIndex() returns key of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * _.mapKeyWithIndex( [ 'a', 'b', 'c', 'd' ], 1 );
 * // returns '1'
 *
 * @returns { string } Returns key of {-srcMap-} by corresponding (index).
 * @function mapKeyWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @namespace Tools
 */

function mapKeyWithIndex( srcMap, index )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  if( index < 0 )
  return;

  let i = 0;
  for( let s in srcMap )
  {
    if( i === index )
    return s;
    i++;
  }

}

//

function mapKeyWithValue( srcMap, value )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  // Dmytro : maybe it is missed code

}

//

function mapIndexWithKey( srcMap, key )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( s === key )
    return s;
  }

  return;
}

//

function mapIndexWithValue( srcMap, value )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( srcMap[ s ] === value )
    return s;
  }

  return;
}

//

function mapOnlyNulls( srcMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( srcMap[ s ] === null )
    result[ s ] = null;
  }

  return result;
}

//

function mapButNulls( srcMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( srcMap[ s ] !== null )
    result[ s ] = srcMap[ s ];
  }

  return result;
}

// --
// amender
// --

/**
 * The mapExtend() is used to copy the values of all properties
 * from one or more source objects to a target object.
 *
 * It takes first object (dstMap)
 * creates variable (result) and assign first object.
 * Checks if arguments equal two or more and if (result) is an object.
 * If true,
 * it extends (result) from the next objects.
 *
 * @param{ objectLike } dstMap - The target object.
 * @param{ ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * _.mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 *
 * @returns { objectLike } It will return the target object.
 * @function mapExtend
 * @throws { Error } Will throw an error if ( arguments.length < 2 ),
 * if the (dstMap) is not an Object.
 * @namespace Tools
 */

function mapExtend( dstMap, srcMap )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  if( arguments.length === 2 )
  {
    let srcProto = Object.getPrototypeOf( srcMap );
    if( srcProto === null || srcProto === Object.prototype )
    return Object.assign( dstMap, srcMap );
  }

  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as the first argument' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let srcMap = arguments[ a ];

    _.assert( !_.primitiveIs( srcMap ), 'Expects non primitive' );

    let srcProto = Object.getPrototypeOf( srcMap );
    if( srcProto === null || srcProto === Object.prototype )
    Object.assign( dstMap, srcMap );
    else
    for( let k in srcMap )
    {
      dstMap[ k ] = srcMap[ k ];
    }

  }

  return dstMap;
}

//

/**
 * The mapSupplement() supplement destination map by source maps.
 * Pairs of destination map are not overwritten by pairs of source maps if any overlap.
 * Routine rewrite pairs of destination map which has key === undefined.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * _.mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @returns { objectLike } Returns an object with unique [ key, value ].
 * @function mapSupplement
 * @namespace Tools
 */

function mapSupplement( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( !_.primitiveIs( dstMap ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    for( let s in srcMap )
    {
      if( s in dstMap )
      continue;
      dstMap[ s ] = srcMap[ s ];
    }
  }

  return dstMap
}

//

function mapSupplementStructureless( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );

  if( dstMap === null )
  dstMap = Object.create( null );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    for( let s in srcMap )
    {
      if( dstMap[ s ] !== undefined )
      continue;

      if( Config.debug )
      if( _.objectLike( srcMap[ s ] ) || _.arrayLike( srcMap[ s ] ) )
      if( !_.regexpIs( srcMap[ s ] ) && !_.dateIs( srcMap[ s ] ) )
      throw Error( `Source map should have only primitive elements, but ${ s } is ${ srcMap[ s ] }` );

      dstMap[ s ] = srcMap[ s ];
    }
  }

  return dstMap;
}

//

function mapOptionsApplyDefaults( options, defaults )
{

  _.assert( arguments.length === 2 );
  _.assertMapHasOnly( options, defaults, `Does not expect options:` );
  _.mapSupplementStructureless( options, defaults );
  _.assertMapHasNoUndefine( options, `Options map should have no undefined fileds, but it does have` );

  return options;
}

// --
// extension
// --

let Extension =
{

  // map checker

  // objectIs, /* qqq : optimize */
  // objectLike, /* qqq : optimize */
  //
  // constructibleIs, /* qqq : cover and move */
  // constructibleLike, /* qqq : cover and move */

  mapIs,
  mapLike,
  mapIsPure,
  mapIsPolluted,
  mapLikePrototyped,
  mapLikePure, /* xxx : cover */
  mapLikePolluted,

  mapIsEmpty,
  mapLikeEmpty,
  mapIsPopulated,
  mapLikePopulated,

  hashMapIs,
  hashMapLike,
  hashMapIsEmpty,
  hashMapIsPopulated,

  // map selector

  _mapKeys,
  mapKeys,
  mapOnlyOwnKeys,
  mapAllKeys,

  _mapVals,
  mapVals,
  mapOnlyOwnVals,
  mapAllVals,

  _mapPairs,
  mapPairs,
  mapOnlyOwnPairs,
  mapAllPairs,

  mapFirstPair,
  mapValsSet,
  mapSelect,

  mapValWithIndex,
  mapKeyWithIndex,
  mapKeyWithValue,
  mapIndexWithKey,
  mapIndexWithValue,

  mapOnlyNulls,
  mapButNulls,

  // amender

  mapExtend,
  mapSupplement,
  mapSupplementStructureless,
  mapOptionsApplyDefaults,

  /* xxx : review and maybe move out routines */

}

//

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
