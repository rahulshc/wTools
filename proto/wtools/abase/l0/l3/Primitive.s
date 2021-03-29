( function _l3_Primitive_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.primitive = _.primitive || Object.create( null );

// --
// primitive
// --

function is( src )
{
  if( !src )
  return true;
  let t = Object.prototype.toString.call( src );
  return _._primitiveIs( src, t );
}

//

function _primitiveIs_functor()
{
  const is = new Set();
  is.add( '[object Symbol]' );
  is.add( '[object Number]' );
  is.add( '[object BigInt]' );
  is.add( '[object Boolean]' );
  is.add( '[object String]' );
  return _primitiveIs;

  function _primitiveIs( src, typeStr )
  {
    return is.has( typeStr );
  }

}

let _is = _primitiveIs_functor();
_is.functor = _primitiveIs_functor;

//

function exportStringShallowCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.primitive.is( src ) );

  if( _.symbol.is( src ) )
  return _.symbol.exportStringShallowCode( src );

  if( _.bigInt.is( src ) )
  return _.bigInt.exportStringShallowCode( src );

  if( _.strIs( src ) )
  return `'${src}'`;

  return String( src );
}

//

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.primitive.is( src ) );

  if( _.symbol.is( src ) )
  return _.symbol.exportStringShallowDiagnostic( src );

  if( _.bigInt.is( src ) )
  return _.bigInt.exportStringShallowDiagnostic( src );

  return String( src );
}

// --
// extension
// --

let ExtensionTools =
{
  primitiveIs : is,
  _primitiveIs : _is,
}

//

let Extension =
{
  is,
  _is,

  // export string

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowCode,
  exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowCode,
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

})();
