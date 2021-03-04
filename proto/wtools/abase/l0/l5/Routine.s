( function _l5_Routine_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;
let Routine = _global_.wTools.routine = _global_.wTools.routine || Object.create( null );

// --
// implementation
// --

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.routine.is( src ) );

  if( src.name )
  return `{- routine ${src.name} -}`;
  else
  return `{- routine.anonymous -}`;
}


// --
// extension
// --

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

Object.assign( Routine, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
