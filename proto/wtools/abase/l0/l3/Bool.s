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
 * var got = _.bool.is( '' );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.bool.is( 1 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.bool.is( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.is( false );
 * console.log( got )
 * // log true
 *
 */

function is( src )
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
 * var got = _.bool.like( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.like( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.like( 1 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.like( 0 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.like( '0' );
 * console.log( got )
 * // log false
 *
 */

function like( src )
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
 * var got = _.bool.likeFalse( 0 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.likeFalse( 1 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.bool.likeFalse( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.likeFalse( true );
 * console.log( got )
 * // log false
 *
 */

function likeFalse( src )
{
  if( !_.bool.like( src ) )
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
 * var got = _.bool.likeTrue( 0 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.bool.likeTrue( 1 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.bool.likeTrue( false );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.bool.likeTrue( true );
 * console.log( got )
 * // log true
 *
 */

function likeTrue( src )
{
  if( !_.bool.like( src ) )
  return false;
  return !!src;
}

// --
// extension
// --

let ExtensionTools =
{

  /* qqq : cover and document all that ( not Dmytro ) | Done. Yevhen S.  */

  boolIs : is,
  boolLike : like,
  boolLikeFalse : likeFalse,
  boolLikeTrue : likeTrue,

}

//

let Extension =
{

  is,
  like,
  likeFalse,
  likeTrue,

}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
