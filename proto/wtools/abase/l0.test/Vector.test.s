( function _Vector_test_s_()
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

function checks( test ) /* qqq for Yevhen : extend */
{

  /* */

  test.case = 'array';
  test.true( _.vector.is( [] ) );
  test.true( _.vector.like( [] ) );
  test.true( _.vectorIs( [] ) );
  test.true( _.vectorLike( [] ) );

  /* */

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

    checks,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
