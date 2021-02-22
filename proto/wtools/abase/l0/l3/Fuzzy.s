( function _l3_Fuzzy_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.fuzzy = _.fuzzy || Object.create( null );

// --
// fuzzy
// --

/**
 * Returns true if entity ( src ) is a Boolean values - true and false or Symbol(maybe).
 * @function fuzzyIs
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.fuzzyIs( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyIs( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyIs( _.maybe );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyIs( '1' );
 * console.log( got )
 * // log false
 *
 */

function fuzzyIs( src )
{
  return src === true || src === false || src === _.maybe;
}

//

/**
 * Returns true if entity ( src ) is a Boolean or a Number or Symbol(maybe).
 * @function fuzzyLike
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.fuzzyLike( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLike( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLike( _.maybe );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLike( 1 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLike( '1' );
 * console.log( got )
 * // log false
 */

function fuzzyLike( src )
{
  if( src === _.maybe )
  return true;
  return src === true || src === false || src === 0 || src === 1;
  // let type = Object.prototype.toString.call( src );
  // return type === '[object Boolean]' || type === '[object Number]';
}

//

/**
 * Returns true if entity ( src ) is false or 0.
 * @function fuzzyLikeFalse
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 * @example
 * var got = _.fuzzyLikeFalse( true );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.fuzzyLikeFalse( false );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLikeFalse( _.maybe );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.fuzzyLikeFalse( 0 );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLikeFalse( '1' );
 * console.log( got )
 * // log false
 *
 */

function fuzzyLikeFalse( src )
{
  if( !_.fuzzyLike( src ) )
  return false;
  return !src;
}

//

/**
 * Returns true if entity ( src ) is true or a Number which is not 0.
 * @function fuzzyLikeTrue
 * @param { * } src - An entity to check.
 * @namespace Tools
 *
 *  @example
 * var got = _.fuzzyLikeTrue( true );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLikeTrue( false );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.fuzzyLikeTrue( _.maybe );
 * console.log( got )
 * // log true
 *
 * @example
 * var got = _.fuzzyLikeTrue( 0 );
 * console.log( got )
 * // log false
 *
 * @example
 * var got = _.fuzzyLikeTrue( 10 );
 * console.log( got )
 * // log true
 *
 */

function fuzzyLikeTrue( src )
{
  if( !_.fuzzyLike( src ) )
  return false;
  if( src === _.maybe )
  return false;
  return !!src;
}

// --
// extension
// --

let ExtensionTools =
{

  /* qqq : cover and document all that ( not Dmytro ) | Done. Yevhen S.  */

  fuzzyIs,
  fuzzyLike,
  fuzzyLikeFalse,
  fuzzyLikeTrue,

}

//

let Extension =
{

  is : fuzzyIs,
  like : fuzzyLike,
  likeFalse : fuzzyLikeFalse,
  likeTrue : fuzzyLikeTrue,

}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
