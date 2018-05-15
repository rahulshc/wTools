//#! /usr/bin/env node
(function _wToolsLayer1_s_(){

'use strict';/*jjj*/

if( typeof module !== 'undefined' && module !== null )
{

  require( './layer1/aFundamental.s' );
  require( './layer1/cDiagnostics.s' );
  require( './layer1/cFieldMapper.s' );
  require( './layer1/cxArrayDescriptor.s' );
  require( './layer1/dSetup.s' );

  var _ = _global_.wTools;
  var Self = _global_.wTools;

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
