//#! /usr/bin/env NODE
( function _aKernelWithComponents_s_() {

'use strict';

if( typeof module !== 'undefined' && module !== null )
require( './aKernel.s' );

var Self = wTools;
var _ = wTools;

//

if( typeof module !== 'undefined' && module !== null )
{

  module[ 'exports' ] = Self;

  // require( './eInclude.s' );
  // require( './eNameTools.s' );
  // require( './eExecTools.s' );
  // require( './eStringTools.s' );
  // require( './eArrayDescriptor.s' );

  try
  {
    require( '../BackTools.ss' );
  }
  catch( err )
  {
  }

}

})();
