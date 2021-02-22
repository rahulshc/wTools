( function _l5_HashMap_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.hashMap = _global_.wTools.hashMap || Object.create( null );

// --
// implementation
// --


function extend( dst, src )
{
  _.assert( arguments.length === 2 );
  _.assert( dst === null || _.hashMap.like( dst ) || _.auxiliary.is( dst ) );
  _.assert( _.hashMap.like( src ) || _.auxiliary.is( src ) );

  if( dst === null )
  dst = new HashMap;

  if( dst === src  )
  return dst;

  if( _.hashMap.like( dst ) )
  {
    if( _.hashMap.like( src ) )
    {
      for( let [ k, e ] of src )
      dst.set( k, e );
    }
    else
    {
      for( let k in src )
      {
        dst.set( k, src[ k ] );
      }
    }
  }
  else
  {
    if( _.hashMap.like( src ) )
    {
      for( let [ k, e ] of src )
      {
        _.assert( _.strIs( k ) );
        dst[ k ] = e;
      }
    }
    else
    {
      for( let k in src )
      {
        dst[ k ] = src[ k ];
      }
    }
  }

  return dst;
}

// --
// extension
// --

let ToolsExtension =
{
  hashMapExtend : extend,
}

//

let Extension =
{
  extend,
}

Object.assign( _, ToolsExtension );
Object.assign( _.hashMap, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
