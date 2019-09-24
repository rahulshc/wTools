( function _fBool_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

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
 * @memberof wTools
 */

function boolsAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayLike( src ) )
  return false;
  return src.filter( ( e ) => _.boolIs( e ) );
}

//

/**
 * @summary Checks if all elements of array( src ) are booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAllAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsAllAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.boolIs( src );
  return _.all( src.filter( ( e ) => _.boolIs( e ) ) );
}

//

/**
 * @summary Checks if at least one element from array( src ) is a boolean.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsAnyAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.boolIs( src );
  return _.any( src.filter( ( e ) => _.boolIs( e ) ) );
}

//

/**
 * @summary Checks if array( src ) doesn't have booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is not a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsNoneAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.boolIs( src );
  return _.none( src.filter( ( e ) => _.boolIs( e ) ) );
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

  boolsAre,
  boolsAllAre,
  boolsAnyAre,
  boolsNoneAre,

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
