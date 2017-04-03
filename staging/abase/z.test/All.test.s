( function _file_All_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  //if( typeof wBase === 'undefined' )
  try
  {
    require( '../../abase/wTools.s' );
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;

  _.include( 'wTesting' );

  require( './ArraySorted.test.s' );
  require( './Consequence.test.s' );
  require( './EventHandler.test.s' );
  require( './String.test.s' );

}

if( typeof module !== 'undefined' && !module.parent )
wTools.Testing.testAll();

} )( );
