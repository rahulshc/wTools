( function _ContainerAdapter_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

// --
//
// --

// --
//
// --

var Self =
{

  name : 'Tools.base.ContainerAdapter',
  silencing : 1,

  tests :
  {

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
