( function _l5_Primitive_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.primitive = _.primitive || Object.create( null );
_.primitive.s = _.primitive.s || Object.create( null );

// --
// primitive
// --

function areIdenticalShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.primitive.is( src1 ) );
  _.assert( _.primitive.is( src2 ) );

  return Object.is( src1, src2 );
}

// --
// extension
// --

let ExtensionTools =
{

}

//

let Extension =
{

}

let ExtensionS =
{
  areIdenticalShallow
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );
Object.assign( _.primitive.s, ExtensionS );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
