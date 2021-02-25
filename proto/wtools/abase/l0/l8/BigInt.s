( function _l8_BigInt_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.bigInt = _.bigInt || Object.create( null );

// --
// implementation
// --

function exportString( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.bigInt.is( src ) );

  return `${String( src )}n`;
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
  exportString
}

Object.assign( Self, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
