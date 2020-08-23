( function _iBool_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

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
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || src === 0 || src === 1;
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

//

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
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || type === '[object Number]';
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

  /* qqq : cover and document all that ( not Dmytro ) | Done. Yevhen S.  */

  boolIs,
  boolLike,
  boolLikeFalse,
  boolLikeTrue,

  fuzzyIs,
  fuzzyLike,
  fuzzyLikeFalse,
  fuzzyLikeTrue,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
