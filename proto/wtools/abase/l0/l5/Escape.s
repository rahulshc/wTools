( function _l5_Escape_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.escape = _global_.wTools.escape || Object.create( null );

// --
// implementation
// --

function isEscapable( src )
{
  if( _.escape._EscapeMap.has( src ) )
  return true;
  if( _.escape.is( src ) )
  return true;
  return false;
}

//

function left( src )
{
  _.assert( arguments.length === 1 );
  if( _.escape._EscapeMap.has( src ) )
  return _.escape._EscapeMap.get( src );
  if( _.escape.is( src ) )
  return new _.Escape( src );
  return src;
  // if( src === null )
  // return _.null;
  // if( src === undefined )
  // return _.undefined;
  // if( src === _.null )
  // return new _.escape.null;
  // if( src === _.undefined )
  // return new _.escape.undefined;
  // if( src === _.nothing )
  // return new _.escape.nothing;
  // return src;
}

//

function rightWithNothing( src )
{
  _.assert( arguments.length === 1 );
  if( _.escape.is( src ) )
  return src.val;

  if( src === _.undefined )
  return undefined;
  if( src === _.null )
  return null;

  if( src === _.nothing )
  return undefined;

  return src;
}

//

function rightWithoutNothing( src )
{
  _.assert( arguments.length === 1 );
  if( _.escape.is( src ) )
  return src.val;

  if( src === _.undefined )
  return undefined;
  if( src === _.null )
  return null;

  return src;
}

//

function wrap( src )
{
  _.assert( arguments.length === 1 );
  _.assert( !_.escape.is( src ) );
  return new _.Escape( src );
}

//

function unwrap( src )
{
  _.assert( arguments.length === 1 );
  if( _.escape.is( src ) )
  return src.val;
  return src;
}

// --
// extension
// --

var Extension =
{
  isEscapable,
  left,
  rightWithNothing,
  rightWithoutNothing,
  right : rightWithNothing,
  wrap,
  unwrap,
}

//

_.mapSupplement( _.escape, Extension );
_.escape.nothing = _.escape.wrap( _.nothing );
_.escape.null = _.escape.wrap( _.null );
_.escape.undefined = _.escape.wrap( _.undefined );
_.escape.prototype = _.escape.wrap( Symbol.for( 'prototype' ) );

_.escape._EscapeMap = new HashMap();
_.escape._EscapeMap.set( _.nothing, _.escape.nothing );
_.escape._EscapeMap.set( _.null, _.escape.null );
_.escape._EscapeMap.set( _.undefined, _.escape.undefined );
_.escape._EscapeMap.set( undefined, _.undefined );
_.escape._EscapeMap.set( null, _.null );

})();
