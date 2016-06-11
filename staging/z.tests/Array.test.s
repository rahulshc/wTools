( function Sample_test_s( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/z.tests/Array.test.s

   */

  if( typeof module !== 'undefined' )
  {

    if( require( 'fs' ).existsSync( __dirname + '/../object/Testing.debug.s' ) )
      require( '../object/Testing.debug.s' );
    else
      require( 'wTesting' );

  }

  var _ = wTools;
  var Self = {};

//

  var arrayPrependOnceMerging = function( test )
  {

    test.description = 'array';
    var got = _.arrayPrependOnceMerging([ 0,1 ], [ 2,3 ]);
    var expected = [ 2,3,0,1 ];
    test.identical( got,expected );

    test.description = 'nothing';
    var got = _.arrayPrependOnceMerging([ 1,1 ]);
    var expected = [ 1,1 ];
    test.identical( got,expected );

    test.description = 'number';
    var got = _.arrayPrependOnceMerging([ 1,2 ], 3, 5);
    var expected = [ 3,5,1,2 ];
    test.identical( got,expected );

    test.description = 'string';
    var got = _.arrayPrependOnceMerging([ 1,2 ], 'str1', 'str2');
    var expected = [ 'str1','str2',1,2 ];
    test.identical( got,expected );

    test.description = 'object';
    var got = _.arrayPrependOnceMerging( [ 1,2 ], { a: 1 }, { b: 2 } );
    var expected = [ { a: 1 },{ b: 2 },1,2 ];
    test.identical( got,expected );

    test.description = 'null';
    var got = _.arrayPrependOnceMerging([ 3,9 ], null);
    var expected = [ null,3,9 ];
    test.identical( got,expected );

    /**/

    if( Config.debug )
    {

      test.description = 'first argument is not array';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnceMerging( 4,5 );
      });

      test.description = 'type of the argument is equal undefined';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnceMerging( [ 1,3 ], undefined );
      });


      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnceMerging();
      });

    }

  }
  

//

  var Proto =
  {

    name : 'simple1',
    
    tests:
    {

      arrayPrependOnceMerging : arrayPrependOnceMerging,
    
    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
