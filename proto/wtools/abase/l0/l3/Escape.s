( function _l3_Escape_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;

// --
// range
// --

function is( src )
{
  if( !src )
  return false;
  return src instanceof _.Escape;
}

//

function make( src )
{
  if( arguments.length !== 1 )
  throw new Error( 'Expects exactly one argument' );
  return new Escape( src );
}

//

function from( src )
{
  if( arguments.length !== 1 )
  throw new Error( 'Expects exactly one argument' );
  if( _.escape.is( src ) )
  return src;
  return _.escape.make( src );
}

// --
// define
// --

class Escape
{
  constructor( val )
  {
    if( arguments.length !== 1 )
    throw new Error( 'Expects exactly 1 argument' );
    this.val = val;
  }
}

//

var Extension =
{
  is,
  make,
  from,
}

//

_.assert( _.escape === undefined );
_.escape = Object.create( null );
_.assert( _.Escape === undefined );
_.Escape = Escape;
Object.assign( _.escape, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
