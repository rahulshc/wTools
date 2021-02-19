( function _l3_Countable_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.countable = _global_.wTools.countable || Object.create( null );

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
  return _.countable.is( src );
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
  countableIs : is, /* qqq : cover here and in the module::MathVector */
  countableLike : like /* qqq : cover here and in the module::MathVector */
}

//

Object.assign( _.countable, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
