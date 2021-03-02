( function _l5_Vector_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.vector = _global_.wTools.vector || Object.create( null );

// --
// implementation
// --

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
  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic,
}

//

Object.assign( _.vector, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
