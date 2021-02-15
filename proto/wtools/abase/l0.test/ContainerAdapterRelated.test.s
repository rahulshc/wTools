( function _LongLike_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
  _.include( 'wSelector' );
}

let _ = _global_.wTools;

// --
// tests
// --

function longMakeEmpty( test )
{
  test.case = 'src - containerAdapter, empty array';
  var got = _.longMakeEmpty( _.containerAdapter.make( [] ) );
  var expected = _.containerAdapter.make( [] );
  test.identical( got, expected ); debugger;

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

//

function vectorizeVectorizeArray( test )
{
  var srcRoutine = function()
  {
    if( arguments.length === 0 )
    return null;
    return _.longSlice( arguments );
  };

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
  };
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  /* - */

  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = routine( src, [ 3, 4 ] )
  test.identical( [ ... got[ 0 ].original ], [ 1, 2 ] );
  test.identical( got[ 1 ], [ 3, 4 ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( src, 2 );
  test.identical( [ ... got[ 0 ].original ], [ 1, 2, 3 ] );
  test.identical( got[ 1 ], 2 );
  test.true( got !== src );

  /* - */

  test.open( 'containerAdapter, no unwraping' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
    vectorizingContainerAdapter : 1,
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'single argument';

  var src = _.containerAdapter.make([ 1 ]);
  var got = routine( src );
  test.identical( got.original, [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( src );
  test.identical( got.original, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( src, 2 );
  test.identical( got.original, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 2 ]);
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got.original, [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2 ]);
  var got = routine( src, [ 3, 4 ] )
  test.identical( got.original, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  /* */

  test.case = 'single argument';

  var src = _.containerAdapter.make( new Set([ 1 ]) );
  var got = routine( src );
  test.identical( [ ... got.original ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( src );
  test.identical( [ ... got.original ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( src, 2 );
  test.identical( [ ... got.original ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 2 ]) );
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( [ ... got.original ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2 ]) );
  var got = routine( src, [ 3, 4 ] )
  test.identical( [ ... got.original ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'containerAdapter, no unwraping' );

  /* - */

  test.open( 'containerAdapter, unwraping' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
    vectorizingContainerAdapter : 1,
    unwrapingContainerAdapter : 1,
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'single argument';

  var src = _.containerAdapter.make([ 1 ]);
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ) );
  test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ), 2 );
  test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 2 ]);
  var got = routine( _.containerAdapter.make( [ 2 ] ), [ 1, 2, 3 ] );
  test.identical( got, [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2 ]);
  var got = routine( _.containerAdapter.make( [ 1, 2 ] ), [ 3, 4 ] )
  test.identical( got, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  /* */

  test.case = 'single argument';

  var src = _.containerAdapter.make( new Set([ 1 ]) );
  var got = routine( src );
  test.identical( [ ... got ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ) );
  test.identical( [ ... got ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ), 2 );
  test.identical( [ ... got ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 2 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 2 ] ) ), [ 1, 2, 3 ] );
  test.identical( [ ... got ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2 ] ) ), [ 3, 4 ] )
  test.identical( [ ... got ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'containerAdapter, unwraping' );
}

// --
// declaration
// --

let Self =
{

  name : 'Tools.LongLike',
  silencing : 1,

  tests :
  {

    longMakeEmpty,
    vectorizeVectorizeArray,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
