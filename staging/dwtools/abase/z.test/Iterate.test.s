( function _Iterate_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  try
  {
    require( '../../Base.s' );
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;

  _.include( 'wTesting' );

}

var _ = wTools;
var Self = {};

//

function eachSample( test )
{

  test.description = 'simplest leftToRight:1'; /* */

  var expected =
  [
    [ 0,2,5 ],[ 1,2,5 ],
    [ 0,3,5 ],[ 1,3,5 ],
    [ 0,4,5 ],[ 1,4,5 ],
  ];

  var got = _.eachSample
  ({
    sets : [ [ 0,1 ],[ 2,3,4 ],[ 5 ] ],
    leftToRight : 1,
  });

  test.identical( got, expected );

  test.description = 'simplest leftToRight:0'; /* */

  var expected =
  [
    [ 0,2,5 ],[ 0,3,5 ],[ 0,4,5 ],
    [ 1,2,5 ],[ 1,3,5 ],[ 1,4,5 ],
  ];

  var got = _.eachSample
  ({
    sets : [ [ 0,1 ],[ 2,3,4 ],[ 5 ] ],
    leftToRight : 0,
  });

  test.identical( got, expected );

  test.description = 'simplest leftToRight:1'; /* */

  var expected =
  [
    { a:0,b:2,c:5 },{ a:1,b:2,c:5 },
    { a:0,b:3,c:5 },{ a:1,b:3,c:5 },
    { a:0,b:4,c:5 },{ a:1,b:4,c:5 },
  ];

  var got = _.eachSample
  ({
    sets : { a : [ 0,1 ],b : [ 2,3,4 ], c : [ 5 ] },
    leftToRight : 1,
  });

  test.identical( got, expected );

  test.description = 'simplest leftToRight:0'; /* */

  var expected =
  [
    { a:0,b:2,c:5 },{ a:0,b:3,c:5 },{ a:0,b:4,c:5 },
    { a:1,b:2,c:5 },{ a:1,b:3,c:5 },{ a:1,b:4,c:5 },
  ];

  var got = _.eachSample
  ({
    sets : { a : [ 0,1 ],b : [ 2,3,4 ], c : [ 5 ] },
    leftToRight : 0,
  });

  test.identical( got, expected );

  logger.log( 'expected',_.toStr( expected,{ levels : 5 } ) );
  logger.log( 'got',_.toStr( got,{ levels : 5 } ) );

}

//

var Self =
{

  name : 'iterate',
  silencing : 1,

  tests :
  {

    eachSample : eachSample,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
