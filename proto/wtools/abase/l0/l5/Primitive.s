( function _l5_Primitive_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.primitive = _.primitive || Object.create( null );

// --
// primitive
// --

function identicalShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  // _.assert( _.primitive.is( src1 ) );
  // _.assert( _.primitive.is( src2 ) );

  if( !_.primitive.is( src1 ) )
  return false;
  if( !_.primitive.is( src2 ) )
  return false;

  return Object.is( src1, src2 );
}

//

function equivalentShallow( src1, src2, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.primitive.is( src1 ) );
  _.assert( _.primitive.is( src2 ) );

  if( _.strsAreAll([ src1, src2 ]) )
  return _.areEquivalentShallow( src1, src2 );

  if( _.bool.like( src1 ) && _.bool.like( src2 ) )
  return _.bool.areEquivalentShallow( src1, src2 );

  if
  (
    ( _.number.is( src1 ) || _.bigInt.is( src1 ) )
    && ( _.number.is( src2 ) || _.bigInt.is( src2 ) )
  )
  return _.number.areEquivalentShallow( src1, src2, accuracy );

  return Object.is( src1, src2 );
}

//

// --
// extension
// --

let ExtensionTools =
{

}

//

let Extension =
{
  identicalShallow,
  equivalentShallow,
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
