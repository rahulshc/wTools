( function _l5_Date_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.date = _global_.wTools.date || Object.create( null );

// --
// typing
// --

/**
 * The routine dateToStr() converts Date object {-date-} to formatted string.
 * The format is : YYYY.MM.DD
 *
 * @example
 * let date = new Date();
 * console.log( _.time.dateToStr( date ) );
 * // log : '2020.10.20'
 *
 * @param { Date } date - The date to convert.
 * @returns { String } - Returns date in string format.
 * @function dateToStr
 * @namespace wTools.time
 * @extends Tools
 */

function toStr( date )
{
  debugger;
  let y = date.getFullYear();
  let m = date.getMonth() + 1;
  let d = date.getDate();
  if( m < 10 ) m = '0' + m;
  if( d < 10 ) d = '0' + d;
  let result = [ y, m, d ].join( '.' );
  return result;
}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.date.is( src ) );

  return src.toISOString();
}

//

function exportStringShortCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.date.is( src ) );

  return `new Date( '${src.toISOString()}' )`;
}


// --
// extension
// --

let ToolsExtension =
{
  dateToStr : toStr
}

//

let Extension =
{
  toStr,
  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortCode,
  exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortCode
}

//

Object.assign( _, ToolsExtension );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
