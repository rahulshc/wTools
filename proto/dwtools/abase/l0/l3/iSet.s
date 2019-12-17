( function _iSet_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
// let Self = _.set = _.set || Object.create( null );
let Self = _;

// --
// set
// --

function setFrom( src )
{
  _.assert( arguments.length === 1 );
  if( _.setAdapterLike( src ) )
  return src;
  if( src === null )
  return new Set();
  if( _.containerAdapter.is( src ) )
  src = src.toArray().original;
  _.assert( _.longIs( src ) );
  return new Set([ ... src ]);
}

//

function setsFrom( srcs )
{
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( srcs ) );
  let result = [];
  for( let s = 0, l = srcs.length ; s < l ; s++ )
  result[ s ] = _.setFrom( srcs[ s ] );
  return result;
}

//

function setToArray( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.setLike( src ) );
  return [ ... src ];
}

//

function setsToArrays( srcs )
{
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( srcs ) );
  let result = [];
  for( let s = 0, l = srcs.length ; s < l ; s++ )
  result[ s ] = _.setToArray( srcs[ s ] );
  return result;
}

// --
// routines
// --

let NamespaceExtension =
{

  // set

  setFrom,
  setsFrom,
  setToArray,
  setsToArrays,

}

//

Object.assign( Self, NamespaceExtension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
