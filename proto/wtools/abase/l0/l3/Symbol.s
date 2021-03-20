( function _l3_Symbol_s_()
{

'use strict';

let _global = _global_;
const _ = _global_.wTools;
let Self = _.symbol = _.symbol || Object.create( null );

// --
// symbol
// --

function symbolIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object Symbol]';
  return result;
}

function exportStringShortCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.symbol.is( src ) );

  let text = src.toString().slice( 7, -1 );
  let result = `Symbol.for(${text ? ' \'' + text + '\' )' : ')'}`;
  return result;
}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.symbol.is( src ) );

  let text = src.toString().slice( 7, -1 );
  let result = `{- Symbol${text ? ' ' + text + ' ' : ' '}-}`;
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
  is : symbolIs,

  // export string

  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortCode,
  exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortCode
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
