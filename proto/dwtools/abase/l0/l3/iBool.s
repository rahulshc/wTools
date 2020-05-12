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
 * Returns true if entity ( src ) is a Boolean or Number.
 * @function boolLike
 * @param {*} src - entity to check
 * @namespace Tools
 */

function boolLike( src )
{
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || type === '[object Number]';
}

//

function boolLikeFalse( src )
{
  if( !_.boolLike( src ) )
  return false;
  return !src;
}

//

function boolLikeTrue( src )
{
  if( !_.boolLike( src ) )
  return false;
  return !!src;
}

//

function fuzzyIs( src )
{
  return src === true || src === false || src === _.maybe;
}

//

function fuzzyLike( src )
{
  if( src === _.maybe )
  return true;
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || type === '[object Number]';
}

//

function fuzzyLikeFalse( src )
{
  if( !_.fuzzyLike( src ) )
  return false;
  return !src;
}

//

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

  /* qqq : cover and document all that ( not Dmytro ) */

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

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
