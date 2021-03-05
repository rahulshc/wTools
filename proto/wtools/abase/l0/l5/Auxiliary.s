( function _l5_Auxiliary_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.aux = _global_.wTools.aux || Object.create( null );

// --
// typing
// --

function identicalShallow( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.aux.is( src1 ) );
  _.assert( _.aux.is( src2 ) );

  if( Object.keys( src1 ).length !== Object.keys( src2 ).length )
  return false;

  for( let s in src1 )
  {
    if( src1[ s ] !== src2[ s ] )
    return false;
  }

  return true;
}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.aux.is( src ) );

  return `{- ${_.entity.strType( src )} with ${_.entity.lengthOf( src )} elements -}`;
}

// --
// extension
// --

var AuxiliaryExtension =
{
  identicalShallow,
  equivalentShallow : identicalShallow,
  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic
}

Object.assign( _.aux, AuxiliaryExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
