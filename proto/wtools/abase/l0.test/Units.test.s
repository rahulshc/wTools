( function _Units_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../../Tools.s' );
  _.include( 'wTesting' );
}

const _global = _global_;
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

const Proto =
{

  name : 'Tools.Units',
  silencing : 1,

  tests :
  {
    placeholder
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
