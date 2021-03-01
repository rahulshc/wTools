( function _l5_Bool_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.bool = _.bool || Object.create( null );
_.bool.s = _.bool.s || Object.create( null );

// --
// bool
// --

/**
 * @summary Returns copy of array( src ) with only boolean elements.
 * @description
 * Returns false if ( src ) is not ArrayLike object.
 * @function boolsAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @namespace Tools
 */

function are( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayLike( src ) )
  return false;
  return src.filter( ( e ) => _.bool.is( e ) );
}

//

/**
 * @summary Checks if all elements of array( src ) are booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAllAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @namespace Tools
 */

function allAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.bool.is( src );
  return _.all( src.filter( ( e ) => _.bool.is( e ) ) );
}

//

/**
 * @summary Checks if at least one element from array( src ) is a boolean.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @namespace Tools
 */

function anyAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.bool.is( src );
  return _.any( src.filter( ( e ) => _.bool.is( e ) ) );
}

//

/**
 * @summary Checks if array( src ) doesn't have booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is not a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @namespace Tools
 */

function noneAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.bool.is( src );
  return _.none( src.filter( ( e ) => _.bool.is( e ) ) );
}

//

function areEquivalentShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.bool.like( src1 ) );
  _.assert( _.bool.like( src2 ) );

  if
  (
    ( _.bool.likeTrue( src1 ) && _.bool.likeTrue( src2 ) )
    || ( ( _.bool.likeFalse( src1 ) && _.bool.likeFalse( src2 ) ) )
  )
  return true;

  return false;
}

// --
// extension
// --

let ExtensionTools =
{

  boolsAre : are,
  boolsAllAre : allAre,
  boolsAnyAre : anyAre,
  boolsNoneAre : noneAre,

}

//

let ExtensionS =
{

  are,
  allAre,
  anyAre,
  noneAre,

  areEquivalentShallow,

}

Object.assign( _, ExtensionTools );
Object.assign( _.bool.s, ExtensionS );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
