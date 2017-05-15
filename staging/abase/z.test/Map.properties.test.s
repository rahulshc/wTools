( function _Map_properties_test_s_( ) {

'use strict';

var isBrowser = true;

if( typeof module !== 'undefined' )
{
  isBrowser = false;

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

}

var _ = wTools;

//

// debugger;

//

var Self =
{

  name : 'wTools.map.properties',
  // verbosity : 9,
  // barringConsole : 0,

  tests :
  {

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
