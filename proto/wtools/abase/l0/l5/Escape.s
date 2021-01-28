( function _l5_Escape_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.escape = _global_.wTools.escape || Object.create( null );

// --
// implementation
// --

function dir( src )
{
  _.assert( arguments.length === 1 );
  // debugger;
  if( _.escape._EscapeMap.has( src ) )
  return _.escape._EscapeMap.get( src );
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

function revWithNothing( src )
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

function revWithoutNothing( src )
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
  dir, /* qqq : cover please */
  revWithNothing, /* qqq : cover please */
  revWithoutNothing, /* qqq : cover please */
  rev : revWithNothing,
  wrap, /* qqq : cover please */
  unwrap, /* qqq : cover please */
}

//

_.mapSupplement( _.escape, Extension );
_.escape.nothing = _.escape.wrap( _.nothing );
_.escape.null = _.escape.wrap( _.null );
_.escape.undefined = _.escape.wrap( _.undefined );

_.escape._EscapeMap = new HashMap();
_.escape._EscapeMap.set( _.nothing, _.escape.nothing );
_.escape._EscapeMap.set( _.null, _.escape.null );
_.escape._EscapeMap.set( _.undefined, _.escape.undefined );
_.escape._EscapeMap.set( undefined, _.undefined );
_.escape._EscapeMap.set( null, _.null );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
