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
  // test.true( _.vector.is( [] ) ); /* qqq : enable */
  // test.true( _.vector.like( [] ) );

  /* */

}

function exportStringShortDiagnostic( test )
{
  test.case = 'array empty';
  var src = [];
  var expected = '{- Array with 0 elements -}';
  var got = _.vector.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'array non-empty';
  var src = [ 1, 2, 3 ];
  var expected = '{- Array with 3 elements -}';
  var got = _.vector.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'unroll empty';
  var src = _.unrollMake([]);
  var expected = '{- Array.unroll with 0 elements -}';
  var got = _.vector.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'unroll non-empty';
  var src = _.unrollMake([ 1, 2, 3 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  var got = _.vector.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.vector.exportStringShortDiagnostic() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.vector.exportStringShortDiagnostic( [], [] ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.vector.exportStringShortDiagnostic( {} ) );
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
    exportStringShortDiagnostic
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
