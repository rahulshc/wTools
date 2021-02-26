( function _l5_Symbol_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.symbol = _.symbol || Object.create( null );

// --
// symbol
// --

function exportStringShortCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.primitive.is( src ) );

  let text = src.toString().slice( 7, -1 );
  let result = `Symbol.for( ${text ? '\'' + text + '\'' : ' )'}`;
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

}

//

let Extension =
{
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
