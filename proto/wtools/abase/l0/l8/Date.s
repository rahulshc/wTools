( function _l8_Date_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.date = _global_.wTools.date || Object.create( null );

// --
// typing
// --

function exportString( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.date.is( src ) );

  return src.toISOString();
}

// --
// extension
// --

let ToolsExtension =
{

}

//

let Extension =
{
  exportString
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
