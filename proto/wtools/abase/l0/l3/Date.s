( function _l3_Date_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.date = _global_.wTools.date || Object.create( null );
_global_.wTools.date.s = _global_.wTools.date.s || Object.create( null );

// --
// typing
// --

function is( src )
{
  return Object.prototype.toString.call( src ) === '[object Date]';
}

//

function areIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.date.is( src1 ) )
  return false;
  if( !_.date.is( src2 ) )
  return false;

  src1 = src1.getTime();
  src2 = src2.getTime();

  return src1 === src2;
}

// --
// extension
// --

let ToolsExtension =
{
  dateIs : is,
  datesAreIdentical : areIdentical,
}

//

let Extension =
{
  is,
  areIdentical,
  areIdenticalShallow : areIdentical
}

//


let ExtensionS =
{
  areIdentical,
  areIdenticalShallow : areIdentical
}

//

Object.assign( _, ToolsExtension );
Object.assign( Self, Extension );
Object.assign( _global_.wTools.date.s, ExtensionS );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
