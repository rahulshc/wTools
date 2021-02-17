( function _Auxiliary_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --

function is( test )
{

}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Vector',
  silencing : 1,

  tests :
  {
    is,
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
