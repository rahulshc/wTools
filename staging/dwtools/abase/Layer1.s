//#! /usr/bin/env node
(function _wTools_s_(){

'use strict';

if( typeof module !== 'undefined' && module !== null )
{

  // require( './layer1/zKernelWithComponents.s' );

  if( typeof module !== 'undefined' && module !== null )
  {
    require( './layer1/aFundamental.s' );
    require( './layer1/cDiagnostics.s' );
    require( './layer1/cFieldMapper.s' );
    require( './layer1/cxArrayDescriptor.s' );
    require( './layer1/dSetup.s' );
  }

  module[ 'exports' ] = wTools;

}

})();
