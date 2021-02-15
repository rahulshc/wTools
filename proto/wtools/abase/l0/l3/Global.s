( function _l3_Global_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
_global_.wTools.global = _global_.wTools.global || Object.create( null );

// --
// implementation
// --

function is( src )
{
  if( src.__GLOBAL_NAME__ === 'real' )
  return true;
}

//

function isReal( src )
{
  return true;
}

//

function isDerivative( src )
{
  return true;
}

// --
// extension
// --

var Extension =
{
  is,
  isReal,
  isDerivative
}

//

Object.assign( _.global, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
