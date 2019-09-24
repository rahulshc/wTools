( function _iRegexp_s_() {

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

//

function regexpsLike( srcs )
{
  if( !_.arrayIs( srcs ) )
  return false;
  for( let s = 0 ; s < srcs.length ; s++ )
  if( !_.regexpLike( srcs[ s ] ) )
  return false;
  return true;
}

//

function regexpIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  return false;

  return src1.source === src2.source && src1.flags === src2.flags;
}

//

function regexpEquivalent( src1, src2 )
{
  return _.strEquivalent( src1, src2 );
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

  // regexp

  regexpIs,
  regexpObjectIs,
  regexpLike,
  regexpsLike,
  regexpIdentical,
  regexpEquivalent,

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
