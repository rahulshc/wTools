( function _l3_BigInt_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.bigInt = _.bigInt || Object.create( null );

// --
// implementation
// --

function is( src )
{
  let result = Object.prototype.toString.call( src ) === '[object BigInt]';
  return result;
}

// --
// extension
// --

let ExtensionTools =
{
  bigIntIs : is
}

//

let Extension =
{
  is,
}

Object.assign( Self, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
