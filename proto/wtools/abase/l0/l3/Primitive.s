( function _l3_Primitive_s_()
{

'use strict';

let _global = _global_;
const _ = _global_.wTools;
let Self = _.primitive = _.primitive || Object.create( null );

// --
// primitive
// --

function primitiveIs( src )
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

let _primitiveIs = _primitiveIs_functor();
_primitiveIs.functor = _primitiveIs_functor;

//

function exportStringShortCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.primitive.is( src ) );

  if( _.symbol.is( src ) )
  return _.symbol.exportStringShortCode( src );

  if( _.bigInt.is( src ) )
  return _.bigInt.exportStringShortCode( src );

  if( _.strIs( src ) )
  return `'${src}'`;

  return String( src );
}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.primitive.is( src ) );

  if( _.symbol.is( src ) )
  return _.symbol.exportStringShortDiagnostic( src );

  if( _.bigInt.is( src ) )
  return _.bigInt.exportStringShortDiagnostic( src );

  return String( src );
}

// --
// extension
// --

let ExtensionTools =
{
  primitiveIs,
  _primitiveIs,
}

//

let Extension =
{
  is : primitiveIs,
  _is : _primitiveIs,

  // export string

  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortCode,
  exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortCode,
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
