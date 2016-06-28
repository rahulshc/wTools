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

  };


  var arrayIs = function( test ) 
  {

    test.description = 'an empty array';
    var got = _.arrayIs( [  ] );
    var expected = true;
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.arrayIs( [ 1, 2, 3 ] );
    var expected  = true;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.arrayIs();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayIs('wrong argument');
      });

      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arrayIs( 1, 2, 3 );
      });
      
    }
    
  };
  
  
  var arrayLike = function( test ) 
  {
    
    test.description = 'an empty array';
    var got = _.arrayLike( [  ] );
    var expected = true;
    test.identical( got, expected );
    
    test.description = 'an array';
    var got = _.arrayLike( [ 1, 2, 3 ] );
    var expected  = true;
    test.identical( got, expected );
    
    test.description = 'a pseudo array';
    var got = ( function() {
      return _.arrayLike( arguments );
    } )('Hello there!');
    var expected = true;
    test.identical( got, expected );

    /**/
    
    if( Config.debug ) 
    {
      
      test.description = 'no argument';
      test.shouldThrowError( function() 
      {
        _.arrayLike();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayLike('wrong argument');
      });
      
      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function() 
      {
        _.arrayLike( 1, 2, 3 );
      });
      
    }
    
  };
  
  
  var hasLength = function( test ) 
  {

    test.description = 'an empty array';
    var got = _.hasLength( [  ] );
    var expected = true;
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.hasLength( [ 1, 2, 3 ] );
    var expected  = true;
    test.identical( got, expected );

    test.description = 'a pseudo array';
    var got = ( function() {
      return _.hasLength( arguments );
    } )('Hello there!');
    var expected = true;
    test.identical( got, expected );

    test.description = 'an array-like';
    var got = _.hasLength( { '0' : 1, '1' : 2, '2' : 3, 'length' : 3 } );
    var expected = true;
    test.identical( got, expected );

    test.description = 'a Function.length';
    var fn = function( a, b, c ) { };
    var got = _.hasLength( fn );
    var expected = true;
    test.identical( got, expected );
    
    test.description = 'a "string".length';
    var got = _.hasLength( 'Hello there!' );
    var expected = true;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.hasLength();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.hasLength('wrong argument');
      });

      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function()
      {
        _.hasLength( 1, 2, 3 );
      });
      
    }
    
  };


  var arraySub = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arraySub( [  ], 0, 0 );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'two arguments';
    var got = _.arraySub( [  ], 0 );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'full copy of an array';
    var got = _.arraySub( [ 1, 2, 3, 4, 5 ] );
    var expected = [ 1, 2, 3, 4, 5 ];
    test.identical( got, expected );
    
    test.description = 'an array of two elements';
    var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
    var expected = [ 3, 4 ];
    test.identical( got, expected );

    test.description = 'from second index to the (arr.length - 1)';
    var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 2 );
    var expected = [ 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'an offset from the end of the sequence';
    var got = _.arraySub( [ 1, 2, 3, 4, 5 ], -4 );
    var expected = [ 2, 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'the two negative index';
    var got = _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
    var expected = [ 2, 3 ];
    test.identical( got, expected );

    test.description = 'the third index is negative';
    var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 1, -1 );
    var expected = [ 2, 3, 4 ];
    test.identical( got, expected );

    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySub();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySub( 'wrong argument', 1, -1 );
      });

      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arraySub( 1, 2, 3, 4, 5, 2, 4 );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4, 'redundant argument' );
      });
      
    }
    
  };


  var arrayNew = function( test ) 
  {
    
    test.description = 'nothing';
    var got = _.arrayNew( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an empty array';
    var got = _.arrayNew( [  ], 0 );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'length = 1';
    var got = _.arrayNew( [  ], 1 );
    var expected = [ ,  ];
    test.identical( got, expected );

    test.description = 'length = 2';
    var got = _.arrayNew( [ 1, 2, 3 ], 2 );
    var expected = [ , , ];
    test.identical( got, expected );

    test.description = 'length = 3';
    var got = _.arrayNew( [ 1, 2, 3 ] );
    var expected = [ , , , ];
    test.identical( got, expected );

    test.description = 'length = 4';
    var got = _.arrayNew( [ 1, 2, 3 ], 4 );
    var expected = [ , , , , ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayNew();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayNew('wrong argument');
      });

      test.description = 'arguments[1] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayNew( [ 1, 2, 3 ], 'wrong type of argument' );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayNew( [ 1, 2, 3 ], 4, 'redundant argument' );
      });

      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arrayNew( 1, 2, 3, 4 );
      });
      
    }
    
  };


  var arrayNewOfSameLength = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayNewOfSameLength( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'length = 3';
    var got = _.arrayNewOfSameLength( [ 1, 2, 3 ] );
    var expected = [ , , , ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayNewOfSameLength();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayNewOfSameLength('wrong argument');
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayNewOfSameLength( [ 1, 2, 3 ], 'redundant argument' );
      });

      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arrayNewOfSameLength( 1, 2, 3 );
      });

    }

  };
  
  
  var arrayOrNumber = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayOrNumber( [  ], 0 );
    var expected = [  ];
    test.identical( got, expected );
    
    test.description = 'static array';
    var got = _.arrayOrNumber( 3, 7 );
    var expected = [ 3, 3, 3, 3, 3, 3, 3 ];
    test.identical( got, expected );

    test.description = 'original array';
    var got = _.arrayOrNumber( [ 3, 7, 13 ], 3 );
    var expected = [ 3, 7, 13 ];
    test.identical( got, expected );

    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayOrNumber();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayOrNumber( [ 1, 2, 3 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayOrNumber( [ 1, 2, 3 ], 3, 'redundant argument' );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arrayOrNumber('wrong argument', 'wrong argument');
      });

      test.description = 'second argument too much';
      test.shouldThrowError( function()
      {
        _.arrayOrNumber( [ 1, 2, 3 ], 4 );
      });

      test.description = 'argument is not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arrayOrNumber( 1, 2, 3, 3 );
      });

    }
    
  };


  var arraySelect = function( test )
  {

    test.description = 'nothing';
    var got = _.arraySelect( [  ], [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'certain elements';
    var got = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
    var expected = [ 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'array of undefined';
    var got = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
    var expected = [ undefined, undefined ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySelect();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySelect( [ 1, 2, 3 ] );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arraySelect('wrong argument', 'wrong argument');
      });

      test.description = 'arguments are not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arraySelect( 1, 2, 3, 4, 5 );
      });

    }

  };
  
  
  var arrayIron = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayIron();
    var expected = [  ];
    test.identical( got, expected );
    
    test.description = 'array of the passed arguments';
    var got = _.arrayIron( 'str', {}, [ 1, 2 ], 5, true );
    var expected = [ 'str', {}, 1, 2, 5, true ];
    test.identical( got, expected );

    test.description = 'without undefined';
    var got = _.arrayIron( [ 1, 2, 3 ], 13, 'abc', undefined, null );
    var expected = [ 1, 2, 3, 13, 'abc', null ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'arguments[0] contains undefined';
      test.shouldThrowError( function()
      {
        _.arrayIron( [ 1, 2, undefined ], 13, 'abc', {} );
      });
      
    }
    
  };
  
  
  //node ./staging/z.tests/Array.test.s

//

  var Proto =
  {

    name : 'simple1',
    
    tests:
    {

      //arrayPrependOnceMerging : arrayPrependOnceMerging,
      //arrayIs : arrayIs,
      //arrayLike : arrayLike,
      //hasLength : hasLength,
      //arraySub : arraySub,
      //arrayNew : arrayNew,
      //arrayNewOfSameLength : arrayNewOfSameLength,
      //arrayOrNumber : arrayOrNumber,
      //arraySelect : arraySelect,
      
      //arrayIron : arrayIron,
    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
