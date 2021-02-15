( function _l3_Partible_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.partible = _global_.wTools.partible || Object.create( null );

// --
// implementation
// --

function is( src )
{
  // return _.vectorIs( src );
  if( _.arrayIs( src ) )
  return true;

  if( _.primitiveIs( src ) )
  return false;

  if( _.entity.methodIteratorOf( src ) )
  if( !_.mapIs( src ) )
  return true;

  return false;
}

//

function like( src )
{
  return _.partible.is( src );
}

// --
// extension
// --

var Extension =
{
  is,
  like
}

//

var ExtensionTools =
{
  partibleIs : is,
  partibleLike : like
}

//

Object.assign( _.partible, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
