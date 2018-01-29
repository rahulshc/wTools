(function _wToolsLayer2_s_(){

'use strict';

if( typeof module !== 'undefined' && module !== null )
{

  require( './Layer1.s' );

  var _ = _global_.wTools;
  var Self = _global_.wTools;

  require( './layer2/fExecTools.s' );
  require( './layer2/fIncludeTools.s' );
  require( './layer2/fNameTools.s' );
  require( './layer2/fStringTools.s' );
  require( './layer2/gStringer.s' );
  require( './layer2/hStringExtra.s' );

}

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_._UsingWtoolsPrivately_ )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
