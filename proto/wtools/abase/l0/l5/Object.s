( function _l5_Object_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.object = _global_.wTools.object || Object.create( null );

// --
// typing
// --

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.object.like( src ) );

  let result = '';

  if( _.routineIs( src.exportString ) )
  {
    result = src.exportString({ verbosity : 1, /*, ... o */ });
    result = _.strShort( result );
  }
  else
  {
    if( _.countable.is( src ) )
    result = _.countable.exportStringShortDiagnostic( src );
    else
    result = `{- ${_.entity.strType( src )} -}`;
  }

  return result;
}

// --
// extension
// --

let ToolsExtension =
{

}

let Extension =
{
  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic,
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
