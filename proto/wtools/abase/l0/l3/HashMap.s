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

//

function areIdenticalShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.hashMap.like( src1 ) );
  _.assert( _.hashMap.like( src2 ) );

  let testVal;

  if( src1.size !== src2.size )
  return false;

  for( let [ key, val ] of src1 )
  {
    testVal = src2.get( key );
    /*
      in cases of an undefined value, make sure the key
      exists on the object so there are no false positives
    */
    if( testVal !== val || ( testVal === undefined && !src2.has( key ) ) )
    return false;
  }
  return true;
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
  areIdenticalShallow,
  areEquivalentShallow : areIdenticalShallow
}

Object.assign( _, ToolsExtension );
Object.assign( _.hashMap, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
