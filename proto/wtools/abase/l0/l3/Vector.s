( function _l3_Vector_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.vector = _global_.wTools.vector || Object.create( null );

// --
// implementation
// --

function is( src )
{

  if( _.arrayIs( src ) )
  return true;
  if( _.primitiveIs( src ) )
  return false;

  if( _.entity.methodIteratorOf( src ) )
  if( _.numberIs( src.length ) ) /* yyy */
  if( !_.mapIs( src ) )
  return true;

  return false;
  // return _.longIs( src );
  // if( _.vectorAdapterIs( src ) )
  // return true;
  // if( _.longIs( src ) )
  // return true;
  // return false;
}

//

function like( src )
{
  return _.vector.is( src );
  // // return _.vectorIs( src );
  // if( _.arrayIs( src ) )
  // return true;
  // if( _.primitiveIs( src ) )
  // return false;
  //
  // if( _.entity.methodIteratorOf( src ) )
  // if( !_.mapIs( src ) )
  // return true;
  //
  // return false;
}

function adapterIs( src )
{
  return Object.prototype.toString.call( src ) === '[object VectorAdapter]';
}


// --
// extension
// --

var Extension =
{
  is,
  like,
  adapterIs
}

//

Object.assign( _.vector, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
