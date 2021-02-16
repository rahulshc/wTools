( function _l8_Entity_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// entity getter
// --

/**
 * Returns "size" of entity( src ). Representation of "size" depends on type of( src ):
 *  - For string returns value of it own length property;
 *  - For array-like entity returns value of it own byteLength property for( BufferRaw, TypedArray, etc )
 *    or length property for other;
 *  - In other cases returns null.
 *
 * @param {*} src - Source entity.
 * @returns {number} Returns "size" of entity.
 *
 * @example
 * _.uncountableSize( 'string' );
 * // returns 6
 *
 * @example
 * _.uncountableSize( new BufferRaw( 8 ) );
 * // returns 8
 *
 * @example
 * _.uncountableSize( 123 );
 * // returns null
 *
 * @function uncountableSize
 * @namespace Tools
*/

function uncountableSize( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.strIs( src ) )
  {
    if( src.length )
    return _.bufferBytesFrom( src ).byteLength;
    return src.length;
  }

  if( _.primitiveIs( src ) )
  return 8;

  if( _.numberIs( src.byteLength ) )
  return src.byteLength;

  if( _.regexpIs( src ) )
  return _.uncountableSize( src.source ) + src.flags.length;

  // if( !_.iterableIs( src ) ) /* yyy */ /* Dmytro : simulate behavior of routine iterableIs, routine partibleIs has different behavior */
  // return 8;
  if( !_.mapLike( src ) )
  if( !_.entity.methodIteratorOf( src ) )
  return 8;

  return NaN;
}

//

/**
 * Returns "size" of entity( src ). Representation of "size" depends on type of( src ):
 *  - For string returns value of it own length property;
 *  - For array-like entity returns value of it own byteLength property for( BufferRaw, TypedArray, etc )
 *    or length property for other;
 *  - In other cases returns null.
 *
 * @param {*} src - Source entity.
 * @returns {number} Returns "size" of entity.
 *
 * @example
 * _.entitySize( 'string' );
 * // returns 6
 *
 * @example
 * _.entitySize( [ 1, 2, 3 ] );
 * // returns 3
 *
 * @example
 * _.entitySize( new BufferRaw( 8 ) );
 * // returns 8
 *
 * @example
 * _.entitySize( 123 );
 * // returns null
 *
 * @function entitySize
 * @namespace Tools
*/

/* qqq : review */

function entitySize( src )
{
  let result = 0;

  _.assert( arguments.length === 1, 'Expects single argument' );

  // if( _.primitiveIs( src ) || !_.iterableIs( src ) || _.bufferAnyIs( src ) ) /* yyy */
  // if( _.primitiveIs( src ) || _.bufferAnyIs( src ) ) /* Dmytro : added branch for routine iterableIs, routine partibleIs has different behavior */
  if( _.primitiveIs( src ) || _.bufferAnyIs( src ) || !( _.mapIs( src ) || _.entity.methodIteratorOf( src ) ) )
  return _.uncountableSize( src );

  if( _.look )
  // if( _.containerIs( src ) || _.iterableIs( src ) ) /* yyy */
  if( _.containerIs( src ) )
  {
    _.look({ src, onUp : onEach, withPartible : 1 });
  }

  if( _.look )
  return result;

  return NaN;

  function onEach( e, k, it )
  {

    if( !_.numberDefined( result ) )
    {
      it.iterator.continue = false;
      return;
    }

    if( !it.down )
    return;

    /* qqq : does not work anymore! */
    if( it.down.iterable === 'map-like' || it.down.iterable === 'hash-map-like' )
    {
      result += _.uncountableSize( k );
    }

    // if( _.primitiveIs( e ) || !_.iterableIs( e ) || _.bufferAnyIs( e ) ) /* yyy */
    if( _.primitiveIs( e ) || _.bufferAnyIs( e ) ) /* yyy */
    result += _.uncountableSize( e );

  }

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

  uncountableSize,
  entitySize,
  sizeOf : entitySize,

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
