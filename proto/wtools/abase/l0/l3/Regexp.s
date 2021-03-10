( function _l3_Regexp_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// regexp
// --

function regexpIs( src )
{
  return Object.prototype.toString.call( src ) === '[object RegExp]';
}

//

function regexpObjectIs( src )
{
  if( !_.RegexpObject )
  return false;
  return src instanceof _.RegexpObject;
}

//

function regexpLike( src )
{
  if( _.regexpIs( src ) || _.strIs( src ) )
  return true;
  return false;
}

// //
//
// function regexpsLike( srcs )
// {
//   if( !_.arrayIs( srcs ) )
//   return false;
//   for( let s = 0 ; s < srcs.length ; s++ )
//   if( !_.regexpLike( srcs[ s ] ) )
//   return false;
//   return true;
// }

//

function regexpsLikeAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.regexpLike( src[ s ] ) )
    return false;
    return true;
  }

  return _.regexpLike( src );
}

//

function identicalShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  return false;

  return _.regexp._identicalShallow( src1, src2 );
}

//

function _identicalShallow( src1, src2 )
{
  return src1.source === src2.source && src1.flags === src2.flags;
}

//

function equivalentShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  return false;
  return src1.source === src2.source;
}

//

/**
 * Escapes special characters with a slash ( \ ). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * _.regexpEscape( 'Hello. How are you?' );
 * // returns "Hello\. How are you\?"
 *
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @function regexpEscape
 * @namespace Tools
 */

function regexpEscape( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  return src.replace( /([.*+?^=!:${}()|\[\]\/\\])/g, '\\$1' );
}

// --
// extension
// --

let ExtensionTools =
{

  regexpIs,
  regexpObjectIs,
  regexpLike,
  regexpsLikeAll,
  regexpIdentical : identicalShallow, /* qqq : cover please */
  regexpEquivalent : equivalentShallow, /* qqq : cover please | Done. Yevhen S. */

  regexpEscape,

}

//

let Extension =
{

  // regexp

  is : regexpIs,
  objectIs : regexpObjectIs,
  like : regexpLike,
  identical : identicalShallow,
  equivalent : equivalentShallow,
  equivalentShallow,
  identicalShallow,
  _identicalShallow,

  escape : regexpEscape,
}

//

let ExtensionS =
{

  // regexps

  likeAll : regexpsLikeAll,

}


_.assert( _.regexp === undefined );
_.regexp = Object.create( null );
_.assert( _.regexp.s === undefined );
_.regexp.s = Object.create( null );

Object.assign( _.regexp, Extension )
Object.assign( _.regexp.s, ExtensionS )
Object.assign( Self, ExtensionTools )
// Object.assign( Self, Routines );
// Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
