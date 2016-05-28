( function Map_test_s( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/z.tests/Map.test.s

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

  var mapKeys = function( test )
  {

    test.description = 'an empty object';
    var got = _.mapKeys( { } );
    var expected = [ ];
    test.identical( got, expected );

    test.description = 'two keys';
    var got = _.mapKeys( { a : 7, b : 13 } );
    var expected = [ 'a', 'b' ];
    test.identical( got, expected );

    test.description = 'object like array';
    var got = _.mapKeys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
    var expected = [ '3', '7', '13' ];
    test.identical( got, expected );

    test.description = 'array';
    var got = _.mapKeys( [ 'a', 'b', 'c' ]);
    var expected = [ '0' , '1', '2' ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapKeys();
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapKeys( {},{} );
      });

      test.description = 'wrong type of number';
      test.shouldThrowError( function()
      {
        _.mapKeys( 13 );
      });

      test.description = 'wrong type of boolean';
      test.shouldThrowError( function()
      {
        _.mapKeys( true );
      });

      test.description = 'wrong type of string';
      test.shouldThrowError( function()
      {
        _.mapKeys( '' );
      });

    }

  };


  var mapValues = function( test )
  {

    test.description = 'an empty array';
    var got = _.mapValues( { } );
    var expected = [ ];
    test.identical( got, expected );

    test.description = 'two values';
    var got = _.mapValues( { a : 7, b : 13 } );
    var expected = [ 7, 13 ];
    test.identical( got, expected );

    test.description = 'object like array';
    var got = _.mapValues( { 7 : 'a', 3 : 'b', 13 : 'c' } );
    var expected = [ 'b', 'a', 'c' ];
    test.identical( got, expected );

    test.description = 'array';
    var got = _.mapValues( [ 'a', 'b', 'c' ] );
    var expected = [ 'a', 'b', 'c' ];


    /**/

    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapValues();
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapValues( {},{} );
      });

      test.description = 'wrong type of number';
      test.shouldThrowError( function()
      {
        _.mapValues( 7 );
      });

      test.description = 'wrong type of boolean';
      test.shouldThrowError( function()
      {
        _.mapValues( true );
      });

      test.description = 'wrong type of string';
      test.shouldThrowError( function()
      {
        _.mapValues( '' );
      });

    }

  };


  var mapExtend = function( test )
  {

    test.description = 'multiple object properties';
    var got = _.mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
    var expected = { a : 7, b : 13, c : 3, d : 33, e : 77 };
    test.identical( got, expected );







    /**/

    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapExtend();
      });

      test.description = 'few arguments';
      test.shouldThrowError( function()
      {
        _.mapExtend( {} );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapExtend( [ ] );
      });

      test.description = 'wrong type of number';
      test.shouldThrowError( function()
      {
        _.mapExtend( 13 );
      });

      test.description = 'wrong type of string';
      test.shouldThrowError( function()
      {
        _.mapExtend( '' );
      });

      test.description = 'wrong type of boolean';
      test.shouldThrowError( function()
      {
        _.mapExtend( true );
      });

    }

  };


  var mapPairs = function( test )
  {

    test.description = 'a list of [ key, value ] pairs';
    var got = mapPairs( { a : 7, b : 13 } );
    var expected = [ [ "a", 7 ], [ "b", 13 ] ];
    test.identical( got, expected );

    test.description = 'nothing';
    var got = mapPairs( { } );
    var expected = [];
    test.identical( got, expected );






    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapPairs();
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapPairs( {},{} );
      });

      test.description = 'wrong type of number';
      test.shouldThrowError( function()
      {
        _.mapPairs( 7 );
      });

      test.description = 'wrong type of boolean';
      test.shouldThrowError( function()
      {
        _.mapPairs( true );
      });

      test.description = 'wrong type of string';
      test.shouldThrowError( function()
      {
        _.mapPairs( '' );
      });

    }

  };




//

  var Proto =
  {

    name : 'mapKeys',

    tests:
    {

      mapKeys : mapKeys,
      mapValues : mapValues,
      mapExtend : mapExtend,
      mapPairs : mapPairs

    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
