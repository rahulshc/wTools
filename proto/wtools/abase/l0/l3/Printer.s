( function _l3_Printer_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.printer = _.printer || Object.create( null );

// --
// printer
// --


function is( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !src )
  return false;

  if( _.routineIs( src ) )
  return false;

  let prototype = Object.getPrototypeOf( src );
  if( !prototype )
  return false;

  if( src.MetaType === 'Printer' )
  return true;

  return false;
}

//

function like( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.printer.is( src ) )
  return true;

  if( _.consoleIs( src ) )
  return true;

  if( src === _global_.logger )
  return true;

  return false;
}


// --
// extension
// --

let ExtensionTools =
{
  printerIs : is,
  printerLike : like,
}

//

let Extension =
{
  is,
  like,
}

Object.assign( Self, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
