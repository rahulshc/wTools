( function _Container_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );

}

var _global = _global_;
var _ = _global_.wTools;
var Self = {};

// --
// tests
// --

// --
// define test suite
// --

var Self =
{

  name : 'Tools.base.Container',
  silencing : 1,

  tests :
  {

    // enityExtend, xxx

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
