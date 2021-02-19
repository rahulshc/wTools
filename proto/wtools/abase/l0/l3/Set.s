( function _l3_Set_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _;

// --
// checker
// --

function setIs( src )
{
  if( !src )
  return false;
  return src instanceof Set || src instanceof WeakSet;
}

//

function setLike( src )
{
  return _.setIs( src );
}

//

function setAdapterLike( src )
{
  if( !src )
  return false;
  if( _.setLike( src ) )
  return true;
  if( src instanceof _.containerAdapter.Set )
  return true;
  return false;
}

//

function setIsEmpty()
{
  return !src.size;
}

//

function setIsPopulated()
{
  return !!src.size;
}

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


function setsAreIdenticalShallow( src1, src2 )
{
  _.assert( arguments.length === 2 );
  _.assert( _.setIs( src1 ) );
  _.assert( _.setIs( src2 ) );

  let [ arr1, arr2 ] = _.setsToArrays( src1, src2 );

  return _.longAreIdenticalShallow( arr1, arr2 );
}

// --
// routines
// --

let ToolsExtension =
{

  // checker

  setIs,
  setLike,
  setAdapterLike,
  setIsEmpty,
  setIsPopulated,
  setsAreIdenticalShallow,

  // set

  setFrom,
  setsFrom,
  setToArray,
  setsToArrays,

}

//

Object.assign( Self, ToolsExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
