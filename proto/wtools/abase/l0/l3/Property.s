( function _l3_Property_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.property = _global_.wTools.property || Object.create( null );

// --
// map checker
// --

function _ofAct( o )
{
  let result = Object.create( null );

  _.routineOptions( _ofAct, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( o.srcMap ) );
  _.assert( this === _.property );

  let keys = _._mapKeys( o );

  for( let k = 0 ; k < keys.length ; k++ )
  {
    result[ keys[ k ] ] = o.srcMap[ keys[ k ] ];
  }

  return result;
}

_ofAct.defaults =
{
  srcMap : null,
  onlyOwn : 0,
  onlyEnumerable : 1,
  selectFilter : null,
}

//

/**
 * Routine property.of() gets onlyEnumerable properties of the object{-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique onlyEnumerable properties of the provided object to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of onlyEnumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyOwn = false ] - count only object`s onlyOwn properties.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.property.of( { a : 7, b : 13 } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.property.of( a );
 * // returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.property.of.cvisibleOnly( { onlyOwn : 1 }, a )
 * // returns { a : 1 }
 *
 * @returns { object } A new map with unique onlyEnumerable properties from source{-srcMap-}.
 * @function of
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function _of( srcMap, o )
{
  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( _of, o );

  o.srcMap = srcMap;

  let result = _.property._ofAct( o );
  return result;
}

_of.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 1,
}

//

/**
 * The onlyOwn() gets the object's {-srcMap-} onlyOwn onlyEnumerable properties and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object's onlyOwn onlyEnumerable properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s onlyOwn onlyEnumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.property.onlyOwn( { a : 7, b : 13 } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.property.onlyOwn( a );
 * // returns { a : 1 }
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { onlyEnumerable : 0, value : 2 } );
 * _.property.onlyOwn.cvisibleOnly( { onlyEnumerable : 0 }, a )
 * // returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with source {-srcMap-} onlyOwn onlyEnumerable properties.
 * @function onlyOwn
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function onlyOwn( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( onlyOwn, o );

  o.srcMap = srcMap;
  o.onlyOwn = 1;

  let result = _.property._ofAct( o );
  return result;
}

onlyOwn.defaults =
{
  onlyEnumerable : 1,
}

//

/**
 * The visibleOnly() gets visibleOnly properties from provided object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies visibleOnly unique object's properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of visibleOnly object`s properties.
 *
 * @example
 * _.property.visibleOnly( { a : 7, b : 13 } );
 * // returns { a : 7, b : 13, __defineGetter__ : function...}
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.property.visibleOnly( a );
 * // returns { a : 1, b : 2, __defineGetter__ : function...}
 *
 * @returns { object } A new map with visibleOnly unique properties from source {-srcMap-}.
 * @function visibleOnly
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function visibleOnly( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( visibleOnly, o );

  o.srcMap = srcMap;
  let result = _.property._ofAct( o );

  return result;
}

visibleOnly.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 0,
}

//

/**
 * The routines() gets onlyEnumerable properties that contains routines as value from the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique onlyEnumerable properties that holds routines from source {-srcMap-} to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.onlyOwn = false ] - count only object`s onlyOwn properties.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.property.routines( { a : 7, b : 13, f : function(){} } );
 * // returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.routines( a )
 * // returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.routines.cvisibleOnly( { onlyOwn : 1 }, a )
 * // returns {}
 *
 * @returns { object } A new map with unique onlyEnumerable routine properties from source {-srcMap-}.
 * @function routines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */


function routines( srcMap, o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this === _.property );
  o = _.routineOptions( routines, o );

  o.srcMap = srcMap;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
    debugger;
  }

  debugger;
  let result = _.property._ofAct( o );
  return result;
}

routines.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 1,
}

//

/**
 * The onlyOwnRoutines() gets object`s {-srcMap-} onlyOwn onlyEnumerable properties that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} onlyOwn unique onlyEnumerable properties that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.property.onlyOwnRoutines( { a : 7, b : 13, f : function(){} } );
 * // returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.onlyOwnRoutines( a )
 * // returns {}
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { onlyEnumerable : 0, value : function(){} } );
 * _.property.onlyOwnRoutines.cvisibleOnly( { onlyEnumerable : 0 }, a )
 * // returns { b : function(){} }
 *
 * @returns { object } A new map with unique object`s onlyOwn onlyEnumerable routine properties from source {-srcMap-}.
 * @function onlyOwnRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function onlyOwnRoutines( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( onlyOwnRoutines, o );

  o.srcMap = srcMap;
  o.onlyOwn = 1;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
    debugger;
  }

  debugger;
  let result = _.property._ofAct( o );
  return result;
}

onlyOwnRoutines.defaults =
{
  onlyEnumerable : 1,
}

//

/**
 * The visibleOnlyRoutines() gets visibleOnly properties of object {-srcMap-} that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies visibleOnly unique properties of source {-srcMap-} that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 *
 * @example
 * _.property.visibleOnlyRoutines( { a : 7, b : 13, f : function(){} } );
 * // returns { f : function, __defineGetter__ : function...}
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.visibleOnlyRoutines( a )
 * // returns { f : function, __defineGetter__ : function...}
 *
 * @returns { object } A new map with visibleOnly unique object`s {-srcMap-} properties that are routines.
 * @function visibleOnlyRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function visibleOnlyRoutines( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( visibleOnlyRoutines, o );

  o.srcMap = srcMap;
  o.onlyOwn = 0;
  o.onlyEnumerable = 0;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
  }

  debugger;
  let result = _.property._ofAct( o );
  return result;
}

visibleOnlyRoutines.defaults =
{
}

//

/**
 * The fields() gets onlyEnumerable fields( visibleOnly properties except routines ) of the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique onlyEnumerable properties of the provided object {-srcMap-} that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of onlyEnumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyOwn = false ] - count only object`s onlyOwn properties.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.property.fields( { a : 7, b : 13, c : function(){} } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.fields( a );
 * // returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.property.fields.cvisibleOnly( { onlyOwn : 1 }, a )
 * // returns { a : 1 }
 *
 * @returns { object } A new map with unique onlyEnumerable fields( visibleOnly properties except routines ) from source {-srcMap-}.
 * @function fields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function fields( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( fields, o );

  o.srcMap = srcMap;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _.property._ofAct( o );
  return result;
}

fields.defaults =
{
  onlyOwn : 0,
  onlyEnumerable : 1,
}

//

/**
 * The onlyOwnFields() gets object`s {-srcMap-} onlyOwn onlyEnumerable fields( visibleOnly properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s onlyOwn onlyEnumerable properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of onlyEnumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.onlyEnumerable = true ] - count only object`s onlyEnumerable properties.
 *
 * @example
 * _.property.onlyOwnFields( { a : 7, b : 13, c : function(){} } );
 * // returns { a : 7, b : 13 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.onlyOwnFields( a );
 * // returns { a : 1 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { onlyEnumerable : 0, value : 2 } )
 * _.property.fields.cvisibleOnly( { onlyEnumerable : 0 }, a )
 * // returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with object`s {-srcMap-} onlyOwn onlyEnumerable fields( visibleOnly properties except routines ).
 * @function onlyOwnFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function onlyOwnFields( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( onlyOwnFields, o );

  o.srcMap = srcMap;
  o.onlyOwn = 1;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _.property._ofAct( o );
  return result;
}

onlyOwnFields.defaults =
{
  onlyEnumerable : 1,
}

//

/**
 * The visibleOnlyFields() gets visibleOnly object`s {-srcMap-} fields( properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies visibleOnly object`s properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of visibleOnly properties.
 *
 * @example
 * _.property.visibleOnlyFields( { a : 7, b : 13, c : function(){} } );
 * // returns { a : 7, b : 13, __proto__ : Object }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.property.visibleOnlyFields( a );
 * // returns { a : 1, b : 2, __proto__ : Object }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { onlyEnumerable : 0, value : 2 } )
 * _.property.visibleOnlyFields( a );
 * // returns { a : 1, b : 2, __proto__ : Object }
 *
 * @returns { object } A new map with visibleOnly fields( properties except routines ) from source {-srcMap-}.
 * @function visibleOnlyFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @namespace Tools
 */

function visibleOnlyFields( srcMap, o )
{

  _.assert( this === _.property );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  o = _.routineOptions( visibleOnlyFields, o );

  o.srcMap = srcMap;
  o.onlyOwn = 0;
  o.onlyEnumerable = 0;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  if( _.routineIs( srcMap ) )
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( _.longHas( [ 'arguments', 'cvisibleOnlyer' ], k ) )
    return;
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _.property._ofAct( o );
  return result;
}

visibleOnlyFields.defaults =
{
}

//

function invisibleOnly( src, o )
{
  let result = new HashMap();

  _.assert( this === _.property );
  _.assert( arguments.length === 1 );

  if( src === undefined || src === null )
  return result;

  var prototype = Object.getPrototypeOf( src )
  if( prototype )
  result.set( _.escape.prototype, prototype );

  return result;
}

// --
// extension
// --

let Extension =
{

  _ofAct,
  of : _of,
  onlyOwn,
  visibleOnly,

  routines,
  onlyOwnRoutines,
  visibleOnlyRoutines,

  fields,
  onlyOwnFields,
  visibleOnlyFields,

  invisibleOnly,

}

//

Object.assign( _.property, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
