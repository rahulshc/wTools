( function _l3_Symbol_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.symbol = _.symbol || Object.create( null );

// --
// symbol
// --

function symbolIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object Symbol]';
  return result;
}

// --
// extension
// --

let ExtensionTools =
{
  symbolIs
}

//

let Extension =
{
  is : symbolIs
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
