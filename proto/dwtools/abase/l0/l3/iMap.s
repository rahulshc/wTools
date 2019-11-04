( function _iMap_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// map checker
// --

/**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * let obj = { x : 100 };
 * _.objectIs(obj);
 * // returns true
 *
 * @example
 * _.objectIs( 10 );
 * // returns false
 *
 * @param { * } src.
 * @return { Boolean }.
 * @function objectIs
 * @memberof wTools
 */

function objectIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Object]';
}

//

function objectLike( src )
{

  if( _.objectIs( src ) )
  return true;
  if( _.primitiveIs( src ) )
  return false;
  if( _.longIs( src ) )
  return false;
  if( _.routineIsPure( src ) )
  return false;

  for( let k in src )
  return true;

  return false;
}

//

/**
 * Routine countableIs() checks provided argument {-src-} whether it is countable ( iteratable ).
 * Returns "true" if provided argument is countable. Othervise "false" returned.
 *
 * @param { * } src - Argument of any type.
 *
 * @example
 * _.countableIs( 10 );
 * // returns false
 *
 * @example
 * _.countableIs( [ 1, 2, 3 ] );
 * // returns true
 *
 * @example
 * _.countableIs( { a : 2, b : 'str' } );
 * // returns true
 *
 * @example
 * _.countableIs( new Set( [ 1, 2, 3 ] ) );
 * // returns true
 *
 * @return { Boolean } - Returns the boolean value of whether the argument is countable.
 * @function countableIs
 * @memberof wTools
 */

function countableIs( src )
{
  if( !src )
  return false;
  if( _.mapLike( src ) )
  return true;
  if( src[ Symbol.iterator ] )
  return true;
  return false;
}

//

function objectLikeOrRoutine( src )
{
  if( _.routineIs( src ) )
  return true;
  return _.objectLike( src );
}

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
 * @memberof wTools
 */

function mapIs( src )
{

  if( !_.objectIs( src ) )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( !proto.constructor )
  return false;

  if( proto.constructor.name !== 'Object' )
  return false;

  // if( proto.constructor && proto.constructor.name !== 'Object' )
  // return false;

  if( Object.getPrototypeOf( proto ) === null )
  return true;

  _.assert( proto === null || !!proto, 'unexpected' );

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

function mapIsPure( src )
{
  if( !src )
  return;

  if( Object.getPrototypeOf( src ) === null )
  return true;

  return false;
}

//

function mapIsPopulated( src )
{
  if( !_.mapIs( src ) )
  return false;
  return Object.keys( src ).length > 0;
}

//

function mapIsHeritated( src )
{

  if( !_.objectIs( src ) )
  return false;

  let proto = src;

  do
  {

    proto = Object.getPrototypeOf( proto );

    if( proto === null )
    return true;

    if( proto.constructor && proto.constructor.name !== 'Object' )
    return false;

    src = proto;
  }
  while( proto );

  if( proto === null )
  return true;

  return false;
}

//

function mapLike( src )
{

  // if( _.complex )
  // if( _.complex.is( src ) )
  // return false;

  if( mapIs( src ) )
  return true;

  if( !src )
  return false;

  // if( src.constructor === Object || src.constructor === null )
  // return true;

  if( !_.objectLike( src ) )
  return false;

  if( _.instanceIs( src ) )
  return false;

  return true;
}

// --
// map selector
// --

function _mapEnumerableKeys( srcMap, own )
{
  let result = [];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  if( own )
  {
    for( let k in srcMap )
    if( _ObjectHasOwnProperty.call( srcMap, k ) )
    result.push( k );
  }
  else
  {
    for( let k in srcMap )
    result.push( k );
  }

  return result;
}


//

function _mapKeys( o )
{
  let result = [];

  _.routineOptions( _mapKeys, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectLike( o ) );
  _.assert( !( o.srcMap instanceof Map ), 'not implemented' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );

  /* */

  function filter( srcMap, keys )
  {

    if( !o.selectFilter )
    {
      _.arrayAppendArrayOnce( result, keys );
    }
    else for( let k = 0 ; k < keys.length ; k++ )
    {
      let e = o.selectFilter( srcMap, keys[ k ] );
      if( e !== undefined )
      _.arrayAppendOnce( result, e );
    }
  }

  /* */

  if( o.enumerable )
  {

    filter( o.srcMap, _._mapEnumerableKeys( o.srcMap, o.own ) );

  }
  else
  {

    if( o.own  )
    {
      filter( o.srcMap, Object.getOwnPropertyNames( o.srcMap ) );
    }
    else
    {
      let proto = o.srcMap;
      result = [];
      do
      {
        filter( proto, Object.getOwnPropertyNames( proto ) );
        proto = Object.getPrototypeOf( proto );
      }
      while( proto );
    }

  }

  /* */

  return result;
}

_mapKeys.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * This routine returns an array of a given objects enumerable properties,
 * in the same order as that provided by a for...in loop.
 * Accept single object. Each element of result array is unique.
 * Unlike standard [Object.keys]{@https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/keys}
 * which accept object only mapKeys accept any object-like entity.
 *
 * @see {@link wTools.mapOwnKeys} - Similar routine taking into account own elements only.
 * @see {@link wTools.mapVals} - Similar routine returning values.
 *
 * @example
 * _.mapKeys({ a : 7, b : 13 });
 * // returns [ "a", "b" ]
 *
 * @example
 * let o = { own : 1, enumerable : 0 };
 * _.mapKeys.call( o, { a : 1 } );
 * // returns [ "a" ]
 *
 * @param { objectLike } srcMap - object of interest to extract keys.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 * @return { array } Returns an array with unique string elements.
 * corresponding to the enumerable properties found directly upon object or empty array
 * if nothing found.
 * @function mapKeys
 * @throws { Exception } Throw an exception if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapKeys( srcMap )
{
  let result;
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapKeys, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;

  if( o.enumerable )
  result = _._mapEnumerableKeys( o.srcMap, o.own );
  else
  result = _._mapKeys( o );

  return result;
}

mapKeys.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnKeys() returns an array of a given object`s own enumerable properties,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapOwnKeys({ a : 7, b : 13 });
 * // returns [ "a", "b" ]
 *
 * @example
 * let o = { enumerable : 0 };
 * _.mapOwnKeys.call( o, { a : 1 } );
 * // returns [ "a" ]

 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the own enumerable properties found directly upon object or empty
 * array if nothing found.
 * @function mapOwnKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
*/

function mapOwnKeys( srcMap )
{
  let result;
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapOwnKeys.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 1;

  if( o.enumerable )
  result = _._mapEnumerableKeys( o.srcMap, o.own );
  else
  result = _._mapKeys( o );

  if( !o.enumerable )
  debugger;

  return result;
}

mapOwnKeys.defaults =
{
  enumerable : 1,
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
 * @memberof wTools
*/

function mapAllKeys( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapAllKeys.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapKeys( o );

  debugger;
  return result;
}

mapAllKeys.defaults =
{
}

//

function _mapVals( o )
{

  _.routineOptions( _mapVals, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );
  _.assert( o.selectFilter === null );

  // let selectFilter = o.selectFilter;
  //
  // if( o.selectFilter )
  // debugger;
  //
  // if( !o.selectFilter )
  // o.selectFilter = function getVal( srcMap, k )
  // {
  //   return srcMap[ k ]
  // }

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
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapVals() routine returns an array of a given object's
 * enumerable property values, in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapVals( { a : 7, b : 13 } );
 * // returns [ "7", "13" ]
 *
 * @example
 * let o = { own : 1 };
 * let a = { a : 7 };
 * let b = { b : 13 };
 * Object.setPrototypeOf( a, b );
 * _.mapVals.call( o, a )
 * // returns [ 7 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapVals( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapVals, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;

  let result = _._mapVals( o );

  return result;
}

mapVals.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnVals() routine returns an array of a given object's
 * own enumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapOwnVals( { a : 7, b : 13 } );
 * // returns [ "7", "13" ]
 *
 * @example
 * let o = { enumerable : 0 };
 * let a = { a : 7 };
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 1 } )
 * _.mapOwnVals.call( o, a )
 * // returns [ 7, 1 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapOwnVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnVals( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapVals.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 1;

  let result = _._mapVals( o );

  debugger;
  return result;
}

mapOwnVals.defaults =
{
  enumerable : 1,
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
 * // returns [ "7", "13", function __defineGetter__(), ... function isPrototypeOf() ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapAllVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */

function mapAllVals( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapAllVals.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

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

  let selectFilter = o.selectFilter;

  if( o.selectFilter )
  debugger;

  if( !o.selectFilter )
  o.selectFilter = function getVal( srcMap, k )
  {
    return [ k, srcMap[ k ] ];
  }

  let result = _._mapKeys( o );

  return result;
}

_mapPairs.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
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
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapPairs( { a : 7, b : 13 } );
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapPairs.call( { own : 1 }, a );
 * // returns [ [ "a", 1 ] ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapPairs( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapPairs.defaults );

  o.srcMap = srcMap;

  let result = _._mapPairs( o );

  return result;
}

mapPairs.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnPairs() converts an object's own properties into a list of [ key, value ] pairs.
 *
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs of object`s own properties if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapOwnPairs( { a : 7, b : 13 } );
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnPairs( a );
 * // returns [ [ "a", 1 ] ]
 *
 * @example
 * let a = { a : 1 };
 * _.mapOwnPairs.call( { enumerable : 0 }, a );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapOwnPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnPairs( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapPairs.defaults );

  o.srcMap = srcMap;
  o.own = 1;

  let result = _._mapPairs( o );

  debugger;
  return result;
}

mapOwnPairs.defaults =
{
  enumerable : 1,
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
 * // returns [ [ "a", 7 ], [ "b", 13 ], ... [ "isPrototypeOf", function isPrototypeOf() ] ]
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllPairs( a );
 * // returns [ [ "a", 1 ], [ "b", 2 ], ... [ "isPrototypeOf", function isPrototypeOf() ]  ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapAllPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */

function mapAllPairs( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapAllPairs.defaults );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapPairs( o );

  debugger;
  return result;
}

mapAllPairs.defaults =
{
}

//

function _mapProperties( o )
{
  let result = Object.create( null );

  _.routineOptions( _mapProperties, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( o.srcMap ) );

  let keys = _._mapKeys( o );

  for( let k = 0 ; k < keys.length ; k++ )
  {
    result[ keys[ k ] ] = o.srcMap[ keys[ k ] ];
  }

  return result;
}

_mapProperties.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapProperties() gets enumerable properties of the object{-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapProperties( { a : 7, b : 13 } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties( a );
 * // returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties.call( { own : 1 }, a )
 * // returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable properties from source{-srcMap-}.
 * @function mapProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapProperties( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapProperties, o );

  o.srcMap = srcMap;

  let result = _._mapProperties( o );
  return result;
}

mapProperties.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnProperties() gets the object's {-srcMap-} own enumerable properties and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object's own enumerable properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s own enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapOwnProperties( { a : 7, b : 13 } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnProperties( a );
 * // returns { a : 1 }
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } );
 * _.mapOwnProperties.call( { enumerable : 0 }, a )
 * // returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with source {-srcMap-} own enumerable properties.
 * @function mapOwnProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnProperties( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapOwnProperties, o );

  o.srcMap = srcMap;
  o.own = 1;

  let result = _._mapProperties( o );
  return result;
}

mapOwnProperties.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllProperties() gets all properties from provided object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique object's properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of all object`s properties.
 *
 * @example
 * _.mapAllProperties( { a : 7, b : 13 } );
 * // returns { a : 7, b : 13, __defineGetter__ : function...}
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllProperties( a );
 * // returns { a : 1, b : 2, __defineGetter__ : function...}
 *
 * @returns { object } A new map with all unique properties from source {-srcMap-}.
 * @function mapAllProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapAllProperties( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapAllProperties, o );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapProperties( o );
  return result;
}

mapAllProperties.defaults =
{
}

//

/**
 * The mapRoutines() gets enumerable properties that contains routines as value from the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties that holds routines from source {-srcMap-} to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapRoutines( { a : 7, b : 13, f : function(){} } );
 * // returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines( a )
 * // returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines.call( { own : 1 }, a )
 * // returns {}
 *
 * @returns { object } A new map with unique enumerable routine properties from source {-srcMap-}.
 * @function mapRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */


function mapRoutines( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapRoutines, o );

  o.srcMap = srcMap;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
    debugger;
  }

  debugger;
  let result = _._mapProperties( o );
  return result;
}

mapRoutines.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnRoutines() gets object`s {-srcMap-} own enumerable properties that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} own unique enumerable properties that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapOwnRoutines( { a : 7, b : 13, f : function(){} } );
 * // returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnRoutines( a )
 * // returns {}
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : function(){} } );
 * _.mapOwnRoutines.call( { enumerable : 0 }, a )
 * // returns { b : function(){} }
 *
 * @returns { object } A new map with unique object`s own enumerable routine properties from source {-srcMap-}.
 * @function mapOwnRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnRoutines( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapOwnRoutines, o );

  o.srcMap = srcMap;
  o.own = 1;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
    debugger;
  }

  debugger;
  let result = _._mapProperties( o );
  return result;
}

mapOwnRoutines.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllRoutines() gets all properties of object {-srcMap-} that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique properties of source {-srcMap-} that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 *
 * @example
 * _.mapAllRoutines( { a : 7, b : 13, f : function(){} } );
 * // returns { f : function, __defineGetter__ : function...}
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllRoutines( a )
 * // returns { f : function, __defineGetter__ : function...}
 *
 * @returns { object } A new map with all unique object`s {-srcMap-} properties that are routines.
 * @function mapAllRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapAllRoutines( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapAllRoutines, o );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
  }

  debugger;
  let result = _._mapProperties( o );
  return result;
}

mapAllRoutines.defaults =
{
}

//

/**
 * The mapFields() gets enumerable fields( all properties except routines ) of the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object {-srcMap-} that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapFields( { a : 7, b : 13, c : function(){} } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapFields( a );
 * // returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapFields.call( { own : 1 }, a )
 * // returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable fields( all properties except routines ) from source {-srcMap-}.
 * @function mapFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapFields( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapFields, o );

  o.srcMap = srcMap;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _._mapProperties( o );
  return result;
}

mapFields.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnFields() gets object`s {-srcMap-} own enumerable fields( all properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s own enumerable properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * _.mapOwnFields( { a : 7, b : 13, c : function(){} } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnFields( a );
 * // returns { a : 1 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapFields.call( { enumerable : 0 }, a )
 * // returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with object`s {-srcMap-} own enumerable fields( all properties except routines ).
 * @function mapOwnFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnFields( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapOwnFields, o );

  o.srcMap = srcMap;
  o.own = 1;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _._mapProperties( o );
  return result;
}

mapOwnFields.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllFields() gets all object`s {-srcMap-} fields( properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all object`s properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of all properties.
 *
 * @example
 * _.mapAllFields( { a : 7, b : 13, c : function(){} } );
 * // returns { a : 7, b : 13, __proto__ : Object }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllFields( a );
 * // returns { a : 1, b : 2, __proto__ : Object }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapAllFields( a );
 * // returns { a : 1, b : 2, __proto__ : Object }
 *
 * @returns { object } A new map with all fields( properties except routines ) from source {-srcMap-}.
 * @function mapAllFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapAllFields( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapAllFields, o );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  if( _.routineIs( srcMap ) )
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( _.longHas( [ 'arguments', 'caller' ], k ) )
    return;
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _._mapProperties( o );
  return result;
}

mapAllFields.defaults =
{
}

//

/**
 * The mapOnlyPrimitives() gets all object`s {-srcMap-} enumerable atomic fields( null, undef, number, string, symbol ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} enumerable atomic properties to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of atomic properties.
 *
 * @example
 * let a = {};
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 3 } )
 * _.mapOnlyPrimitives( a );
 * // returns {}
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOnlyPrimitives( a );
 * // returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with all atomic fields from source {-srcMap-}.
 * @function mapOnlyPrimitives
 * @throws { Error } Will throw an Error if {-srcMap-} is not an Object.
 * @memberof wTools
 */

function mapOnlyPrimitives( srcMap )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( srcMap ) );

  let result = _.mapExtendConditional( _.field.mapper.primitive, Object.create( null ), srcMap );
  return result;
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
 * @memberof wTools
 */

function mapFirstPair( srcMap )
{

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
 * @memberof wTools
 */

function mapValWithIndex( srcMap, index )
{

 _.assert( arguments.length === 2, 'Expects exactly two arguments' );
 _.assert( !_.primitiveIs( srcMap ) );

  if( index < 0 ) return;

  let i = 0;
  for( let s in srcMap )
  {
    if( i == index ) return srcMap[s];
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
 * @memberof wTools
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
    if( i == index ) return s;
    i++;
  }

}

//

function mapKeyWithValue( srcMap, value )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );



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

function mapNulls( srcMap )
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
      if( _.objectLike( srcMap[ s ] ) || _.arrayLike( srcMap[ s ] ) )
      {
        debugger;
        throw Error( 'Source map should have only primitive elements, but ' + s + ' is ' + srcMap[ s ] );
      }
      dstMap[ s ] = srcMap[ s ];
    }
  }

  return dstMap
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

  // map checker

  objectIs,
  objectLike,
  objectLikeOrRoutine,
  countableIs, /* qqq : cover and document please | Dmytro : covered and documented */

  mapIs,
  mapIsEmpty,
  mapIsPure,
  mapIsPopulated,
  mapIsHeritated,

  mapLike,

  // map selector

  _mapEnumerableKeys,

  _mapKeys,
  mapKeys,
  mapOwnKeys,
  mapAllKeys,

  _mapVals,
  mapVals,
  mapOwnVals,
  mapAllVals,

  _mapPairs,
  mapPairs,
  mapOwnPairs,
  mapAllPairs,

  _mapProperties,

  mapProperties,
  mapProperties,
  mapOwnProperties,
  mapAllProperties,

  mapRoutines,
  mapRoutines,
  mapOwnRoutines,
  mapAllRoutines,

  mapFields,
  mapFields,
  mapOwnFields,
  mapAllFields,

  mapOnlyPrimitives,
  mapFirstPair,
  mapValsSet,
  mapSelect,

  mapValWithIndex,
  mapKeyWithIndex,
  mapKeyWithValue,
  mapIndexWithKey,
  mapIndexWithValue,

  mapNulls,
  mapButNulls,

  // amender

  mapSupplementStructureless,

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
