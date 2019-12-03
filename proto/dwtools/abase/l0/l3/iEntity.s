( function _iEntity_s_() {

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
 * @memberof wTools
 */

function iterableIs( src )
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

function setIs( src )
{
  if( !src )
  return false;
  return src instanceof Set || src instanceof WeakSet;
}

//

function setLike( src )
{
  return _.setIs( src );
}

//

function setAdapterLike( src )
{
  if( !src )
  return false;
  if( _.setLike( src ) )
  return true;
  if( src instanceof _.containerAdapter.Set )
  return true;
  return false;
}

//

function setIsEmpty()
{
  return !src.size;
}

//

function setIsPopulated()
{
  return !!src.size;
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

  setIs,
  setLike,
  setAdapterLike,
  setIsEmpty,
  setIsPopulated,

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
