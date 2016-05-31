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

    test.description = 'two keys';
    var got = _.mapKeys( { a : 7, b : 13 } );
    var expected = [ 'a', 'b' ];
    test.identical( got, expected );

    test.description = 'object like array';
    var got = _.mapKeys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
    var expected = [ '3', '7', '13' ];
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

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapKeys( [] );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.mapKeys( 'wrong arguments' );
      });

    }

  };


  var mapValues = function( test )
  {

    test.description = 'two values';
    var got = _.mapValues( { a : 7, b : 13 } );
    var expected = [ 7, 13 ];
    test.identical( got, expected );

    test.description = 'object like array';
    var got = _.mapValues( { 7 : 'a', 3 : 'b', 13 : 'c' } );
    var expected = [ 'b', 'a', 'c' ];
    test.identical( got, expected );

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

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapValues( [] );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.mapValues( 'wrong arguments' );
      });

    }

  };


  var mapExtend = function( test )
  {

    test.description = 'multiple object properties';
    var got = _.mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
    var expected = { a : 7, b : 13, c : 3, d : 33, e : 77 };
    test.identical( got, expected );

    test.description = 'object like array';
    var got = _.mapExtend( {}, [ 3, 7, 13, 73 ] );
    var expected = { 0 : 3, 1 : 7, 2 : 13, 3 : 73 };
    test.identical( got, expected );

    test.description = 'object like array2';
    var got = _.mapExtend( { a : 7, b : 13 }, [ 33, 3, 7, 13 ] );
    var expected = { 0 : 33, 1 : 3, 2 : 7, 3 : 13, a : 7, b : 13 };
    test.identical(got, expected);

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

      test.description = 'next arguments are wrong';
      test.shouldThrowError( function()
      {
        _.mapExtend( {}, 'wrong arguments' );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapExtend( [] );
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
    var got = _.mapPairs( { a : 7, b : 13 } );
    var expected = [ [ "a", 7 ], [ "b", 13 ] ];
    test.identical( got, expected );

    /**/

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
        _.mapPairs( {}, 'wrong arguments' );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapPairs( [] );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.mapPairs( 'wrong arguments' );
      });

    }

  };


  var mapOwn = function( test )
  {

    test.description = 'true';
    var got = _.mapOwn( { a : 7, b : 13 }, 'a' );
    var expected = true;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {
      
      test.description = 'no argument';
      test.shouldThrowError( function() 
      {
        _.mapOwn();
      });

      test.description = 'few arguments';
      test.shouldThrowError( function()
      {
        _.mapOwn( {} );
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapOwn( {}, '', 'wrong arguments' );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapOwn( [] );
      });

      test.description = 'wrong type of second argument';
      test.shouldThrowError( function()
      {
        _.mapOwn( {}, 13 );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.mapOwn( '', 7 );
      });

    }

  };


  var mapSame = function( test )
  {

    test.description = 'same [ key, value ]';
    var got = _.mapSame( { a : 7, b : 13 }, { a : 7, b : 13 } );
    var expected = true;
    test.identical( got, expected );

    test.description = 'same [ key, value ] in the arrays';
    var got = _.mapSame( [ 'a', 7, 'b', 13 ], [ 'a', 7, 'b', 13 ] );
    var expected = true;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.mapSame();
      });

      test.description = 'few arguments';
      test.shouldThrowError( function()
      {
        _.mapSame( {} );
      });

      test.description = 'number of keys not equal';
      test.shouldThrowError( function()
      {
        _.mapSame( { a : 1, b : 2 }, { a : 1 } );
      });

      test.description = 'wrong sequence one';
      test.shouldThrowError( function()
      {
        _.mapSame( {}, [] );
      });

      test.description = 'wrong sequence two';
      test.shouldThrowError( function()
      {
        _.mapSame( [], {} );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.mapSame( 'wrong arguments' );
      });

    }

  };


  var mapContain = function( test )
  {

    test.description = 'first has same keys like second';
    var got = _.mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
    var expected = true;
    test.identical( got, expected );

    test.description = 'in the array';
    var got = _.mapContain( [ 'a', 7, 'b', 13, 'c', 15 ], [ 'a', 7, 'b', 13 ] );
    var expected = true;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.mapContain();
      });

      test.description = 'few arguments';
      test.shouldThrowError( function()
      {
        _.mapContain( {} );
      });

      test.description = 'number of keys in first not equal';
      test.shouldThrowError( function()
      {
        _.mapContain( { a : 1 }, { a : 1, b : 2 } );
      });

      test.description = 'wrong sequence one';
      test.shouldThrowError( function()
      {
        _.mapContain( {}, [] );
      });

      test.description = 'wrong sequence two';
      test.shouldThrowError( function()
      {
        _.mapContain( [], {} );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.mapContain( 'wrong arguments' );
      });

    }

  };


  var mapBut = function( test )
  {

    test.description = 'a unique object';
    var got = _.mapBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
    var expected = { c : 3 };
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.mapBut();
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapBut( [] );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.mapBut( 'wrong arguments' );
      });

    }

  };


  var mapToArray = function( test )
  {

    test.description = 'a list of [ key, value ] pairs'
    var got = _.mapToArray( { a : 3, b : 13, c : 7 } );
    var expected = [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapToArray();
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapToArray( {}, 'wrong arguments' );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapToArray( [] );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.mapToArray( 'wrong argumetns' );
      });

    }

  };


  var mapValWithIndex = function( test )
  {

    test.description = 'second index';
    var got = _.mapValWithIndex( [ 3, 13, 'c', 7 ], 2 );
    var expected = 'c';
    test.identical( got, expected );

    test.description = 'an element';
    var got = _.mapValWithIndex( [ [ 'a', 3 ] ], 0 );
    var expected = [ 'a', 3 ];
    test.identical( got, expected );

    test.description = 'a list of arrays';
    var got = _.mapValWithIndex( [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ], 2 );
    var expected = ["c", 7];
    test.identical( got, expected );

    test.description = 'a list of objects';
    var got = _.mapValWithIndex( [ { a : 3 }, { b : 13 }, { c : 7 } ], 2 );
    var expected = {c: 7};
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapValWithIndex();
      });

      test.description = 'few arguments';
      test.shouldThrowError( function()
      {
        _.mapValWithIndex( [ [] ] );
      });

      test.description = 'first the four argument not wrapped into array';
      test.shouldThrowError( function()
      {
        _.mapValWithIndex( 3, 13, 'c', 7 , 2 );
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapValWithIndex( [ [] ], 2, 'wrong arguments' );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.mapValWithIndex( 'wrong argumetns' );
      });

    }

  };
  
  
  var mapKeyWithIndex = function( test ) 
  {
    
    test.description = 'last key';
    var got = _.mapKeyWithIndex( { 'a': 3, 'b': 13, 'c': 7 }, 2 );
    var expected = 'c';
    test.identical( got, expected );
    
    test.description = 'first key';
    var got = _.mapKeyWithIndex( [ { a : 3 }, 13, 'c', 7 ], 0 );
    var expected = '0';
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.mapKeyWithIndex();
      });

      test.description = 'few arguments';
      test.shouldThrowError( function()
      {
        _.mapKeyWithIndex( [] );
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapKeyWithIndex( [  ], 2, 'wrong arguments' );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.mapKeyWithIndex( 'wrong argumetns' );
      });

    }
    
  };
  
  
  var mapIs = function( test )
  {

    test.description = 'an empty object';
    var got = _.mapIs( {} );
    var expected = true;
    test.identical( got, expected );

    test.description = 'an object';
    var got = _.mapIs( { a : 7, b : 13 } );
    var expected = true;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no argument'
      test.shouldThrowError( function()
      {
        _.mapIs();
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapIs( [] );
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function() 
      {
        _.mapIs( {}, {} );
      });
      
      test.description = 'wrong type of argument';
      test.shouldThrowError( function() 
      {
        _.mapIs( 'wrong arguments' );
      });
      
    }

  };


  var mapClone = function( test )
  {

    test.description = 'an Example';
    var Example = function() {
      this.name = 'Peter';
      this.age = 27;
    };
    var got = _.mapClone( new Example(), { dst : { sex : 'Male' } } );
    var expected = { sex : 'Male', name : 'Peter', age : 27 };
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.mapClone();
      });

      test.description = 'redundant argument';
      test.shouldThrowError( function()
      {
        _.mapClone( {}, {}, 'wrong arguments' );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapClone( [] );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.mapClone( 'wrong arguments' );
      });

    }

  };


  var mapExtendFiltering = function( test )
  {

    test.description = 'an unique object';
    var got = _.mapExtendFiltering( _.filter.supplementary(), { a : 1, b : 2 }, { a : 1 , c : 3 } );
    var expected = { a : 1, b : 2, c : 3 };
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.mapExtendFiltering();
      });

      test.description = 'few argument';
      test.shouldThrowError( function()
      {
        _.mapExtendFiltering( filter );
      });

      test.description = 'wrong type of array';
      test.shouldThrowError( function()
      {
        _.mapExtendFiltering( [] );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.mapExtendFiltering( 'wrong arguments' );
      });

    }
    
  };

  
//

  var Proto =
  {

    //name : 'mapKeys',
    //name : 'mapValues',
    //name : 'mapExtend',
    //name : 'mapPairs',
    //name : 'mapOwn',
    //name : 'mapSame',
    //name : 'mapContain',
    //name : 'mapBut',
    //name : 'mapToArray',
    //name : 'mapValWithIndex',
    //name : 'mapKeyWithIndex',
    //name : 'mapIs',
    //name : 'mapClone',
    name : 'mapExtendFiltering',

    tests:
    {

      //mapKeys : mapKeys,
      //mapValues : mapValues
      //mapExtend : mapExtend,
      //mapPairs : mapPairs,
      //mapOwn : mapOwn,
      //mapSame : mapSame,
      //mapContain : mapContain,
      //mapBut : mapBut,
      //mapToArray : mapToArray,
      //mapValWithIndex : mapValWithIndex,
      //mapKeyWithIndex : mapKeyWithIndex,
      //mapIs : mapIs,
      //mapClone : mapClone,
      mapExtendFiltering : mapExtendFiltering,

    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
