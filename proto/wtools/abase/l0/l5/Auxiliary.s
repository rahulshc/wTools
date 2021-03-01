( function _l5_Auxiliary_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.aux = _global_.wTools.aux || Object.create( null );

// --
// typing
// --

function areIdenticalShallow( src1, src2 )
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

// --
// extension
// --

var AuxiliaryExtension =
{
  areIdenticalShallow,
  areEquivalentShallow : areIdenticalShallow
}

Object.assign( _.aux, AuxiliaryExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
