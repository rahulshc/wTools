( function _iBool_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// bool
// --

/**
 * Returns true if entity ( src ) is a Boolean.
 * @function boolIs
 * @param {*} src - entity to check
 * @namespace Tools
 */

function boolIs( src )
{
  return src === true || src === false;
}

//

/**
 * Returns true if entity ( src ) is a Boolean or Number 1 or 0.
 * @function boolLike
 * @param {*} src - entity to check
 * @namespace Tools
 */

function boolLike( src )
{
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || src === 0 || src === 1;
}

//

/**
 * Returns true if entity ( src ) is false or 0.
 * @function boolLikeFalse
 * @param {*} src - entity to check
 * @namespace Tools
 */

function boolLikeFalse( src )
{
  if( !_.boolLike( src ) )
  return false;
  return !src;
}

//

/**
 * Returns true if entity ( src ) is true or 1.
 * @function boolLikeTrue
 * @param {*} src - entity to check
 * @namespace Tools
 */

function boolLikeTrue( src )
{
  if( !_.boolLike( src ) )
  return false;
  return !!src;
}

//

/**
 * Returns true if entity ( src ) is a Boolean or Symbol(maybe).
 * @function fuzzyIs
 * @param {*} src - entity to check
 * @namespace Tools
 */

function fuzzyIs( src )
{
  return src === true || src === false || src === _.maybe;
}

//

/**
 * Returns true if entity ( src ) is a Boolean or a Number or Symbol(maybe).
 * @function fuzzyLike
 * @param {*} src - entity to check
 * @namespace Tools
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
 * @param {*} src - entity to check
 * @namespace Tools
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
 * @function fuzzyLikeFalse
 * @param {*} src - entity to check
 * @namespace Tools
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

  /* qqq : cover and document all that ( not Dmytro ) | Working on it. Yevhen S.  */

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
