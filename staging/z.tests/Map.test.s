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

  var mapKeys = function(test)
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
    var got = _.mapKeys( { '7' : 'a', '3' : 'b', '13' : 'c' } );
    var expected = [ "3", "7", "13" ];
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

      test.description = 'wrong type of number';
      test.shouldThrowError( function()
      {
        _.mapKeys(13);
      });

      test.description = 'wrong type of boolean';
      test.shouldThrowError( function() 
      {
        _.mapKeys(true);
      });
      
      test.description = 'wrong type of string';
      test.shouldThrowError( function() 
      {
        _.mapKeys('');
      });

    }

  }

//

  var Proto =
  {

    name : 'mapKeys',

    tests:
    {

      mapKeys : mapKeys

    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
