( function _l3_Entity_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// container
// --

function containerIs( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.mapLike( src ) )
  return true;
  if( _.hashMapLike( src ) )
  return true;
  if( _.setLike( src ) )
  return true;
  return false;
}

//

function containerLike( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.objectLike( src ) )
  return true;
  if( _.hashMapLike( src ) )
  return true;
  if( _.setLike( src ) )
  return true;
  return false;
}

//

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
  if( _.mapLike( src ) )
  return true;
  if( _.routineIs( src[ Symbol.iterator ] ) )
  return true;
  return false;
}

//

function hasMethodIterator( src ) /* qqq xxx : check. good coverage is required | aaa : Done. Yevhen S. */
{
  if( !src )
  return false;
  if( _.routineIs( src[ Symbol.iterator ] ) )
  return true;
  return false;
}

//

function hasMethodEqualer( src ) /* qqq xxx : check. good coverage is required | aaa : Done. Yevhen S. */
{
  if( !src )
  return false;
  if( _.routineIs( src[ Symbol.for( 'equalAre' ) ] ) )
  return true;
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
 * _.entityLength( [ 1, 2, 3 ] );
 * // returns 3
 *
 * @example
 * _.entityLength( 'string' );
 * // returns 1
 *
 * @example
 * _.entityLength( { a : 1, b : 2 } );
 * // returns 2
 *
 * @example
 * let src = undefined;
 * _.entityLength( src );
 * // returns 0
 *
 * @returns {number} Returns "length" of entity.
 * @function entityLength
 * @namespace Tools
*/

function entityLength( src )
{
  if( src === undefined )
  return 0;
  if( _.mapLike( src ) )
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

  // container

  containerIs,
  containerLike,
  iterableIs,
  hasMethodIterator,
  hasMethodEqualer, /* xxx : add other similar routines */

  entityLength,
  lengthOf : entityLength,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
