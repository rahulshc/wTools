( function _gPair_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;

// --
// range
// --

function is( src )
{
  if( !_.longIs( src ) )
  return false;
  if( src.length !== 2 )
  return false;
  return true;
}

//

function isOf( src, Element )
{
  if( !Element )
  return false;
  if( !this.is( src ) )
  return false;
  return src[ 0 ] instanceof Element && src[ 1 ] instanceof Element;
}

//

function make( src )
{
  let result;
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  {
    result = new Array( ... arguments );
  }
  else if( arguments.length === 1 )
  {
    if( _.routineIs( src ) )
    {
      if( src === Array )
      result = new src( undefined, undefined );
      else
      result = new src( 2 );
    }
    else if( arguments[ 0 ].length === 2 )
    result = _.make( arguments[ 0 ] );
    else if( arguments[ 0 ].length === 0 )
    result = _.makeUndefined( arguments[ 0 ], 2 );
    else
    throw _.err( 'Length of pair should be 2' );
  }
  else if( arguments.length === 0 )
  {
    result = new Array( undefined, undefined );
  }
  else
  {
    _.assert( 0, `Expects 0..2 arguments, but got ${arguments.length}` );
  }
  _.assert( this.is( result ), 'Faild to make a new Pair' );
  return result;
}

// --
// declare
// --

class Pair
{
  static experiment(){};
  static [ Symbol.hasInstance ]( instance )
  {
    return is( instance );
  }
}

let Handler =
{
  construct( original, args )
  {
    return Pair.make( ... args );
  }
};

let Self = new Proxy( Pair, Handler );
Self.original = Pair;

//

var Fields =
{
}

//

var Routines =
{
  is,
  isOf,
  make,
}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );
_.assert( _.pair === undefined );
_.pair = Self;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
