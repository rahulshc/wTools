( function _LongLike_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
  _.include( 'wSelector' );
}

var _ = _global_.wTools;

// --
// tests
// --

function longMakeEmpty( test )
{
  test.case = 'src - containerAdapter, empty array';
  var got = _.longMakeEmpty( _.containerAdapter.make( [] ) );
  var expected = _.containerAdapter.make( [] );
  test.identical( got, expected );

  test.case = 'src - containerAdapter, filled array';
  var got = _.longMakeEmpty( _.containerAdapter.make([ 1, 2, 3 ]) );
  var expected = _.containerAdapter.make( [] );
  test.identical( got, expected );

  test.case = 'src - containerAdapter, empty array';
  var got = _.longMakeEmpty( _.containerAdapter.make( new Set( [] ) ) );
  var expected = _.containerAdapter.make( new Set( [] ) );
  test.identical( got, expected );

  test.case = 'src - containerAdapter, filled array';
  var got = _.longMakeEmpty( _.containerAdapter.make( new Set([ 1, 2, 3 ]) ) );
  var expected = _.containerAdapter.make( new Set( [] ) );
  test.identical( got, expected );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.LongLike',
  silencing : 1,

  tests :
  {

    longMakeEmpty,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
