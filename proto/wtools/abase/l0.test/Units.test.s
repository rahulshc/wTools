( function _Units_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --

function placeholder( test )
{
  test.case = 'true';
  test.true( true )

  /* */

}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Units',
  silencing : 1,

  tests :
  {
    placeholder
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
