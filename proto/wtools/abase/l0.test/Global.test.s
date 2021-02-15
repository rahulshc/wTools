( function _Global_test_s_()
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

function checks( test ) /* qqq for Yevhen : enable and extend ( file Global.test.s ) */
{

  /* */

  test.case = 'current global';
  test.true( true );
  test.true( _.global.is( _global_ ) );
  test.true( _.global.isReal( _global_ ) );
  test.true( !_.global.isDerivative( _global_ ) );

  /* */

  console.log( _globals_ )

}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Global',
  silencing : 1,

  tests :
  {

    checks,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
