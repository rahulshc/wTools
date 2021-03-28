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

function exportStringShallowCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.symbol.is( src ) );

  let text = src.toString().slice( 7, -1 );
  let result = `Symbol.for(${text ? ' \'' + text + '\' )' : ')'}`;
  return result;
}

//

function exportStringShallowDiagnostic( src )
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

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowCode,
  exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowCode
}

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

})();
