( function _l3_Vector_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
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

  if( _.class.methodIteratorOf( src ) )
  if( _.number.is( src.length ) ) /* yyy */
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
  // if( _.class.methodIteratorOf( src ) )
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

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.vector.is( src ) );

  if( _.unrollIs( src ) )
  return `{- ${_.entity.strType( src )}.unroll with ${src.length} elements -}`;
  else
  return `{- ${_.entity.strType( src )} with ${src.length} elements -}`;

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

  // export string

  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic,
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

})();
