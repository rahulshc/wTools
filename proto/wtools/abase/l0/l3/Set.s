( function _l3_Set_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.set = _.set || Object.create( null );
_.set.s = _.set.s || Object.create( null );

// --
// implementation
// --

function is( src )
{
  if( !src )
  return false;
  return src instanceof Set || src instanceof WeakSet;
}

//

function like( src )
{
  return _.set.is( src );
}

//

function adapterLike( src )
{
  if( !src )
  return false;
  if( _.set.like( src ) )
  return true;
  if( !_.containerAdapter || _.containerAdapter.Set )
  return false;
  if( src instanceof _.containerAdapter.Set )
  return true;
  return false;
}

//

function isEmpty()
{
  return !src.size;
}

//

function isPopulated()
{
  return !!src.size;
}

// --
// set
// --

function from( src )
{
  _.assert( arguments.length === 1 );
  if( _.set.adapterLike( src ) )
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
  result[ s ] = _.set.from( srcs[ s ] );
  return result;
}

//

function toArray( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.set.like( src ) );
  return [ ... src ];
}

//

function setsToArrays( srcs )
{
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( srcs ) );
  let result = [];
  for( let s = 0, l = srcs.length ; s < l ; s++ )
  result[ s ] = _.set.toArray( srcs[ s ] );
  return result;
}

//

function setsAreIdenticalShallow( src1, src2 )
{
  _.assert( arguments.length === 2 );
  // _.assert( _.setIs( src1 ) );
  // _.assert( _.setIs( src2 ) );

  if( !_.set.is( src1 ) )
  return false;
  if( !_.set.is( src2 ) )
  return false;

  return _.set._setsAreIdenticalShallow( src1, src2 );
}

//

function _setsAreIdenticalShallow( src1, src2 )
{
  if( src1.size !== src2.size)
  return false;

  for( let el of src1 )
  if( !src2.has( el ) )
  return false;

  return true;
}

//

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.set.is( src ) );

  return `{- ${_.entity.strType( src )} with ${_.entity.lengthOf( src )} elements -}`;
}

// --
// extension
// --

let ToolsExtension =
{

  // checker

  setIs : is,
  setLike : like,
  setAdapterLike : adapterLike,
  setIsEmpty : isEmpty,
  setIsPopulated : isPopulated,
  _setsAreIdenticalShallow,
  setsAreIdenticalShallow,

  // set

  setFrom : from,
  setsFrom,
  setToArray : toArray,
  setsToArrays,

}

//

let Extension =
{

  // checker

  is,
  like,
  adapterLike,
  isEmpty,
  isPopulated,
  _setsAreIdenticalShallow,
  identicalShallow : setsAreIdenticalShallow,
  equivalentShallow : setsAreIdenticalShallow,
  /* qqq : for Yevhen : bad */

  // set

  from,
  toArray,

  // export string

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic

}

//

let ExtensionS =
{

  // set

  from : setsFrom,
  toArrays : setsToArrays,
}

//

Object.assign( _, ToolsExtension );
Object.assign( Self, Extension );
Object.assign( _.set.s, ExtensionS );

})();
