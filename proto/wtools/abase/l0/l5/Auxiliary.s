( function _l5_Auxiliary_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.aux = _global_.wTools.aux || Object.create( null );

// --
// typing
// --

function identicalShallow( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  // _.assert( _.aux.is( src1 ) );
  // _.assert( _.aux.is( src2 ) );

  if( !_.aux.is( src1 ) )
  return false;
  if( !_.aux.is( src2 ) )
  return false;

  return _.aux._identicalShallow( src1, src2 );
}

//

function _identicalShallow( src1, src2 )
{
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
  identical : identicalShallow,
  identicalShallow,
  _identicalShallow,
  equivalentShallow : identicalShallow,
}

Object.assign( _.aux, AuxiliaryExtension );

})();
