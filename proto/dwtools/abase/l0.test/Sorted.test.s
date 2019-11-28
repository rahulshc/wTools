( function _Sorted_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = _global_.wTools;

// --
// tests
// --

function searchFirstIndex( test )
{

  /* */

  test.open( 'no duplicates' );

  test.case = 'beyond left';
  var exp = 0;
  var got = _.sorted.searchFirstIndex( [ 0, 1, 2 ], -1 );
  test.identical( got, exp );

  test.case = 'left';
  var exp = 0;
  var got = _.sorted.searchFirstIndex( [ 0, 1, 2 ], 0 );
  test.identical( got, exp );

  test.case = 'mid';
  var exp = 1;
  var got = _.sorted.searchFirstIndex( [ 0, 1, 2 ], 1 );
  test.identical( got, exp );

  test.case = 'right';
  var exp = 2;
  var got = _.sorted.searchFirstIndex( [ 0, 1, 2 ], 2 );
  test.identical( got, exp );

  test.case = 'beyond right';
  var exp = 3;
  var got = _.sorted.searchFirstIndex( [ 0, 1, 2 ], 3 );
  test.identical( got, exp );

  test.close( 'no duplicates' );

  /* */

  test.open( 'no duplicates 1' );

  test.case = 'beyond left';
  var exp = 0;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 2, 2 ], -1 );
  test.identical( got, exp );

  test.case = 'left';
  var exp = 1;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 2, 2 ], 0 );
  test.identical( got, exp );

  test.case = 'mid';
  var exp = 2;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 2, 2 ], 1 );
  test.identical( got, exp );

  test.case = 'right';
  var exp = 4;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 2, 2 ], 2 );
  test.identical( got, exp );

  test.case = 'beyond right';
  var exp = 5;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 2, 2 ], 3 );
  test.identical( got, exp );

  test.close( 'no duplicates 1' );

  /* */

  test.open( 'no duplicates 2' );

  test.case = 'beyond left';
  var exp = 0;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 1, 1, 1, 2, 2 ], -1 );
  test.identical( got, exp );

  test.case = 'left';
  var exp = 1;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 1, 1, 1, 2, 2 ], 0 );
  test.identical( got, exp );

  test.case = 'mid';
  var exp = 4;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 1, 1, 1, 2, 2 ], 1 );
  test.identical( got, exp );

  test.case = 'right';
  var exp = 6;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 1, 1, 1, 2, 2 ], 2 );
  test.identical( got, exp );

  test.case = 'beyond right';
  var exp = 8;
  var got = _.sorted.searchFirstIndex( [ 0, 0, 1, 1, 1, 1, 2, 2 ], 3 );
  test.identical( got, exp );

  test.close( 'no duplicates 2' );

  /* */

}

// --
// declare
// --

var Self =
{

  name : 'Tools.base.Sorted',
  silencing : 1,

  tests :
  {

    searchFirstIndex,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
