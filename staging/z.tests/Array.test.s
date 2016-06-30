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

  /*var arrayPrependOnceMerging = function( test )
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

  }*/


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

      test.description = 'first three arguments are not wrapped into array';
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
  

  var arrayAppendMerging = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayAppendMerging( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an argument';
    var got = _.arrayAppendMerging( [ 1, 2, undefined ] );
    var expected = [ 1, 2, undefined ];
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.arrayAppendMerging( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
    var expected = [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
    test.identical( got, expected );
    
    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayAppendMerging();
      });

      test.description = 'arguments[0] is wrong, has to be an array';
      test.shouldThrowError( function()
      {
        _.arrayAppendMerging( 'wrong argument', 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
      });

      test.description = 'arguments[1] is undefined';
      test.shouldThrowError( function()
      {
        _.arrayAppendMerging( [ 1, 2 ], undefined, false, { a : 1 }, 42, [ 3, 7, 13 ] );
      });

    }

  };


  var arrayPrependMerging = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayPrependMerging( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an argument';
    var got = _.arrayPrependMerging( [ 1, 2, undefined ], 2, 1, [ 6, 7 ] );
    var expected = [ 2, 1, 6, 7, 1, 2, undefined ];
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.arrayPrependMerging( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
    var expected = [ 'str', false, { a : 1 }, 42, 3, 7, 13, 1, 2 ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayPrependMerging();
      });

      test.description = 'arguments[0] is wrong, has to be an array';
      test.shouldThrowError( function()
      {
        _.arrayPrependMerging( 'wrong argument', 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
      });

      test.description = 'arguments[1] is undefined';
      test.shouldThrowError( function()
      {
        _.arrayPrependMerging( [ 1, 2 ], undefined, false, { a : 1 }, 42, [ 3, 7, 13 ] );
      });

    }

  };


  var arrayAppendOnceMerging = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayAppendOnceMerging( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an argument';
    var got = _.arrayAppendOnceMerging( [ 1, 2, undefined ] );
    var expected = [ 1, 2, undefined ];
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.arrayAppendOnceMerging( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
    var expected = [ 1, 2, 'str', {}, 5 ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnceMerging();
      });

      test.description = 'arguments[0] is wrong, has to be an array';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnceMerging('wrong argument', 'str', 2, {}, [ 'str', 5 ] );
      });

      test.description = 'arguments[3] is undefined';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnceMerging( [ 1, 2 ], 'str', 2, undefined, [ 'str', 5 ] );
      });

    }

  };


  var arrayPrependOnceMerging = function( test ) // it doesn't work???
  {

    test.description = 'nothing';
    var got = _.arrayPrependOnceMerging( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an argument';
    var got = _.arrayPrependOnceMerging( [ undefined, 2, 1 ], 2, 1, [ 6, 7 ] );
    var expected = [ 6, 7, undefined, 2, 1 ];
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.arrayPrependOnceMerging( [ 2, 4 ], [ 5, 3 ], 2, 4, 'str', {} );
    var expected = [ 5, 3, 'str', {}, 2, 4 ];
    test.identical( got, expected );

    /**/
    //node ./staging/z.tests/Array.test.s
    
    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnceMerging();
      });

      test.description = 'arguments[0] is wrong, has to be an array';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnceMerging('wrong argument', 5, 4, 'str', {} );
      });

      test.description = 'arguments[3] is undefined';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnceMerging( [ 1, 2 ], 5, 4, undefined, {} );
      });

    }

  };

  
  var arrayElementsSwap = function( test )
  {

    test.description = 'an element';
    var got = _.arrayElementsSwap( [ 7 ], 0, 0 );
    var expected = [ 7 ];
    test.identical( got, expected );

    test.description = 'reverses first index and last index';
    var got = _.arrayElementsSwap( [ 1, 2, 3, 4, 5 ], 0, 4  );
    var expected = [ 5, 2, 3, 4, 1 ];
    test.identical( got, expected );
    
    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayElementsSwap();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayElementsSwap( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arrayElementsSwap('wrong argument', 'wrong argument', 'wrong argument');
      });

      test.description = 'arguments[1] and arguments[2] are out of bound';
      test.shouldThrowError( function()
      {
        _.arrayElementsSwap( [ 1, 2, 3, 4, 5 ], -1, -4 );
      });

      test.description = 'first five arguments are not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arrayElementsSwap( 1, 2, 3, 4, 5, 0, 4 );
      });

    }

  };
  
  
  var arrayFrom = function( test ) 
  {

    test.description = 'an array';
    var got = _.arrayFrom( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
    var expected = [ 3, 7, 13, 'abc', false, undefined, null, {} ];
    test.identical( got, expected );
    
    test.description = 'an object';
    var got = _.arrayFrom( { a : 3, b : 7, c : 13 } );
    var expected = [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ];
    test.identical( got, expected );

    test.description = 'a string';
    var got = _.arrayFrom( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
    var expected = [ 3, 7, 13, 3.5, 5, 7.5, 13 ];
    test.identical( got, expected );

    test.description = 'arguments[...]';
    var args = ( function() {
      return arguments;
    } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
    var got = _.arrayFrom( args );
    var expected = [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.arrayFrom();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayFrom( 'wrong argument' );
      });
      
    }
    
  };


  var arrayToMap = function( test )
  {

    test.description = 'an empty object';
    var got = _.arrayToMap( [  ] );
    var expected = {  };
    test.identical( got, expected );

    test.description = 'an object';
    var got = _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
    var expected = { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} };
    test.identical( got, expected );

    test.description = 'arguments[...]';
    var args = ( function() {
      return arguments;
    } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
    var got = _.arrayToMap( args );
    var expected = { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } };
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no argument';
      test.shouldThrowError( function()
      {
        _.arrayToMap();
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayToMap( 'wrong argument' );
      });

    }

  };
  
  
  var arrayRemoveArrayOnce = function( test ) // it doesn't work???
  {

    test.description = 'nothing';
    var got = _.arrayRemoveArrayOnce( [  ], [  ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'three elements left';
    var got = _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
    var expected = 2;
    test.identical( got, expected );

    test.description = 'one elements left';
    var got = _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
      return a < b;
    } );
    var expected = 4;
    test.identical( got, expected );

    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveArrayOnce();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveArrayOnce('wrong argument', 'wrong argument', 'wrong argument');
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) { return a < b }, 'redundant argument' );
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

      //arrayAppendMerging : arrayAppendMerging,
      //arrayPrependMerging : arrayPrependMerging,
      //arrayAppendOnceMerging : arrayAppendOnceMerging,

      //arrayPrependOnceMerging : arrayPrependOnceMerging,

      //arrayElementsSwap : arrayElementsSwap,
      //arrayFrom : arrayFrom,
      //arrayToMap : arrayToMap,
      arrayRemoveArrayOnce : arrayRemoveArrayOnce,
      
    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
