( function _l5_Countable_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.countable = _global_.wTools.countable || Object.create( null );

// --
// implementation
// --

/* qqq2 : for Yevhen : bad! */
function identicalShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.countable.is( src1 ) );
  _.assert( _.countable.is( src2 ) );

  let length1 = src1.length || 0;
  let length2 = src2.length || 0;

  if( length1 !== length2 )
  return false;

  if( _.longLike( src1 ) && _.longLike( src2 ) )
  {
    return _.longIdenticalShallow( src1, src2 );
  }

  /*
    object with method iterator,
    vector
  */
  return _.mapsAreIdentical( src1, src2 )
}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.countable.is( src ) );

  if( _.vector.is( src ) )
  return _.vector.exportStringShortDiagnostic( src );

  return `{- ${_.entity.strType( src )} with ${_.entity.lengthOf( src )} elements -}`;
}

// --
// extension
// --

var Extension =
{
  identicalShallow,
  equivalentShallow : identicalShallow,
  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic,
}

//

Object.assign( _.countable, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
