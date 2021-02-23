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
  if( _.primitive.is( src ) )
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
  // if( _.primitive.is( src ) )
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

function constructorIsVectorAdapter( src )
{
  if( !src )
  return false;
  return '_vectorBuffer' in src.prototype;
}


// --
// extension
// --

var Extension =
{
  is,
  like,
  adapterIs,
  constructorIsVectorAdapter,
}

//

var ExtensionTools =
{
  vectorAdapterIs : adapterIs,
  vadIs : adapterIs,
  vectorIs : is, /* qqq : cover here and in the module::MathVector */
  vectorLike : like, /* qqq : cover here and in the module::MathVector */
  constructorIsVectorAdapter,
  constructorIsVad : constructorIsVectorAdapter,
}

//

Object.assign( _.vector, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
