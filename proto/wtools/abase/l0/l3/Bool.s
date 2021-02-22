( function _l3_Bool_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.bool = _.bool || Object.create( null );

// --
// bool
// --

/**
 * Returns true if entity ( src ) is a Boolean values - true and false.
 * @function boolIs
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.boolIs( '' );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.boolIs( 1 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.boolIs( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolIs( false );
 * console.log( got )
 * // log true
 *
 */

function boolIs( src )
{
  return src === true || src === false;
}

//

/**
 * Routine boolLike() returns true if entity ( src ) is a Boolean values - true and false or Numbers 1 and 0.
 * @function boolLike
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.boolLike( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLike( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLike( 1 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLike( 0 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLike( '0' );
 * console.log( got )
 * // log false
 *
 */

function boolLike( src )
{
  return src === true || src === false || src === 0 || src === 1;
  // let type = Object.prototype.toString.call( src );
  // return type === '[object Boolean]' || src === 0 || src === 1;
}

//

/**
 * Returns true if entity ( src ) is Boolean value - false or Number - 0.
 * @function boolLikeFalse
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.boolLikeFalse( 0 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLikeFalse( 1 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.boolLikeFalse( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLikeFalse( true );
 * console.log( got )
 * // log false
 *
 */

function boolLikeFalse( src )
{
  if( !_.boolLike( src ) )
  return false;
  return !src;
}

//

/**
 * Returns true if entity ( src ) is Boolean value - true or Number - 1.
 * @function boolLikeTrue
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.boolLikeTrue( 0 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.boolLikeTrue( 1 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.boolLikeTrue( false );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.boolLikeTrue( true );
 * console.log( got )
 * // log true
 *
 */

function boolLikeTrue( src )
{
  if( !_.boolLike( src ) )
  return false;
  return !!src;
}

// --
// extension
// --

let ExtensionTools =
{

  /* qqq : cover and document all that ( not Dmytro ) | Done. Yevhen S.  */

  boolIs,
  boolLike,
  boolLikeFalse,
  boolLikeTrue,

}

//

let Extension =
{

  is : boolIs,
  like : boolLike,
  likeFalse : boolLikeFalse,
  likeTrue : boolLikeTrue,

}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
