(function _wToolsLayer3_s_(){

'use strict';

if( typeof module !== 'undefined' && module !== null )
{

  require( './Layer2.s' );
  // require( './layer3/Cloner.s' );

  var _ = wTools;

  try
  {
    if( typeof module !== 'undefined' && module !== null )
    require( './Back.ss' );
  }
  catch( err )
  {
  }

  _.include( 'wCloner' );
  _.include( 'wPath' );
  _.include( 'wProto' );
  _.include( 'wCopyable' );
  _.include( 'wEventHandler' );
  _.include( 'wInstancing' );
  _.include( 'wConsequence' );

  module[ 'exports' ] = wTools;

}

})();
