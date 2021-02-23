( function _l3_HashMap_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.hashMap = _global_.wTools.hashMap || Object.create( null );

// --
// implementation
// --

function is( src )
{
  if( !src )
  return false;
  return src instanceof HashMap || src instanceof HashMapWeak;
}

//

function like( src )
{
  return _.hashMap.is( src );
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
// extension
// --

let ToolsExtension =
{
  hashMapIs : is,
  hashMapLike : like,
  hashMapIsEmpty : isEmpty,
  hashMapIsPopulated : isPopulated,
}

//

let Extension =
{
  is,
  like,
  isEmpty,
  isPopulated,
}

Object.assign( _, ToolsExtension );
Object.assign( _.hashMap, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
