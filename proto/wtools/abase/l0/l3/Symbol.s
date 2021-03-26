( function _l3_Symbol_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.symbol = _.symbol || Object.create( null );

// --
// symbol
// --

function is( src )
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
  symbolIs : is
}

//

let Extension =
{
  is,

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

})();
