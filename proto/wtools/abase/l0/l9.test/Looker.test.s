( function _l0_l9_Looker_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --

function bulky( test )
{
  test.true( _.aux.is( _.looker ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Looker.l0.l9',
  silencing : 1,

  tests :
  {
    bulky,
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
