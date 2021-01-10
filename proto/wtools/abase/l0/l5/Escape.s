( function _l5_Escape_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.escape = _global_.wTools.escape || Object.create( null );

// --
// implementation
// --

function _do( src )
{
  _.assert( arguments.length === 1 );
  if( src === null )
  return _.null;
  if( src === undefined )
  return _.undefined;
  if( src === _.null || src === _.undefined )
  return new _.Escape( src );
  return src;
}

//

function undo( src )
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
  do : _do, /* qqq : cover please */
  undo, /* qqq : cover please */
  unwrap, /* qqq : cover please */
}

//

_.mapSupplement( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
