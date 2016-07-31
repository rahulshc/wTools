( function Sample_test_s( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/abase/z.tests/Array.test.s

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

    test.description = 'object';
    var got = _.arrayIs( {  } );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'number';
    var got = _.arrayIs( 6 );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'string';
    var got = _.arrayIs( 'abc' );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'boolean';
    var got = _.arrayIs( true );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'function';
    var got = _.arrayIs( function() {  } );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'a pseudo array';
    var got = ( function() {
      return _.arrayIs( arguments );
    } )('Hello there!');
    var expected = false;
    test.identical( got, expected );

    test.description = 'no argument';
    var got = _.arrayIs();
    var expected  = false;
    test.identical( got, expected );

    test.description = 'null';
    var got = _.arrayIs();
    var expected  = false;
    test.identical( got, expected );
    
    
    /**/
    
    if( Config.debug ) 
    {

      
      
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

    test.description = 'no argument';
    var got = _.arrayLike();
    var expected  = false;
    test.identical( got, expected );

    test.description = 'null';
    var got = _.arrayLike();
    var expected  = false;
    test.identical( got, expected );

    test.description = 'function';
    var got = _.arrayLike( function() {  } );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'string';
    var got = _.arrayLike();
    var expected  = false;
    test.identical( got, expected );

    test.description = 'number';
    var got = _.arrayLike();
    var expected  = false;
    test.identical( got, expected );

    test.description = 'boolean';
    var got = _.arrayLike( true );
    var expected  = false;
    test.identical( got, expected );

    test.description = 'object';
    var got = _.arrayLike();
    var expected  = false;
    test.identical( got, expected );

    /**/
    
    if( Config.debug ) 
    {
      
      
      
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

    test.description = 'no arguments';
    var got = _.hasLength();
    var expected = false;
    test.identical( got, expected );

    test.description = 'null';
    var got = _.hasLength();
    var expected = false;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {
      
      
      
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


  var arrayPrependOnceMerging = function( test )
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
        _.arrayFrom( 6 );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayFrom( true );
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
  
  
  var arrayRemoveArrayOnce = function( test )
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
  
  
  var arrayRemovedOnce = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayRemovedOnce( [  ], 2 );
    var expected = -1;
    test.identical( got, expected );

    test.description = 'second element removed';
    var got = _.arrayRemovedOnce( [ 2, 4, 6 ], 4 );
    var expected = 1;
    test.identical( got, expected );

    test.description = 'first element removed';
    var got = _.arrayRemovedOnce( [ true, false, 6 ], true );
    var expected = 0;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemovedOnce();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemovedOnce( [ 2, 4, 6 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayRemovedOnce( [ 2, 4, 6 ], 2, function( el ) { return el; }, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemovedOnce( 'wrong argument', 2 );
      });

      test.description = 'arguments[2] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemovedOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
      });
      
    }
    
  };
  
  
  var arrayRemoveOnce = function( test ) {

    test.description = 'nothing';
    var got = _.arrayRemoveOnce( [  ], 2 );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'one element left';
    var got = _.arrayRemoveOnce( [ 2, 4 ], 4 );
    var expected = [ 2 ];
    test.identical( got, expected );

    test.description = 'two elements left';
    var got = _.arrayRemoveOnce( [ true, false, 6 ], true );
    var expected = [ false, 6 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveOnce();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveOnce( [ 2, 4, 6 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayRemoveOnce( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemoveOnce( 'wrong argument', 2 );
      });

      test.description = 'arguments[2] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemoveOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
      });
      
    }
    
  };
  
  
  var arrayRemovedAll = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayRemovedAll( [  ], 2 );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'one element removed';
    var got = _.arrayRemovedAll( [ 2, 4, 6 ], 4 );
    var expected = 1;
    test.identical( got, expected );

    test.description = 'two elements removed';
    var got = _.arrayRemovedAll( [ true, false, 6, true ], true );
    var expected = 2;
    test.identical( got, expected );

    test.description = 'three elements removed';
    var got = _.arrayRemovedAll( [ 2, 4, 6, 7 ], 2, function ( el, ins ) {
      return el > ins;
    });
    var expected = 3;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemovedAll();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemovedAll( [ 2, 4, 6 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayRemovedAll( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemovedAll( 'wrong argument', 2 );
      });

      test.description = 'arguments[2] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemovedAll( [ 2, 4, 6 ], 2, 'wrong argument' );
      });
      
    }
    
  };


  var arrayRemoveAll = function( test ) {

    test.description = 'nothing';
    var got = _.arrayRemoveAll( [  ], 2 );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'one element left';
    var got = _.arrayRemoveAll( [ 2, 4 ], 4 );
    var expected = [ 2 ];
    test.identical( got, expected );

    test.description = 'two elements left';
    var got = _.arrayRemoveAll( [ true, false, 6 ], true );
    var expected = [ false, 6 ];
    test.identical( got, expected );

    test.description = 'two elements left';
    var got = _.arrayRemoveAll( [ 2, 1, 4, 6 ], 2, function ( el, ins ) {
      return el > ins;
    });
    var expected = [ 2, 1 ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveAll();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayRemoveAll( [ 2, 4, 6 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayRemoveAll( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemoveAll( 'wrong argument', 2 );
      });

      test.description = 'arguments[2] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayRemoveAll( [ 2, 4, 6 ], 2, 'wrong argument' );
      });

    }

  };

  var arrayReplaceOnce = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayReplaceOnce( [  ], 0, 0 );
    var expected = -1;
    test.identical( got, expected );

    test.description = 'second element';
    var got = _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
    var expected = 1;
    test.identical( got, expected );

    test.description = 'third element';
    var got = _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'fourth element';
    var got = _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
    var expected = 4;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayReplaceOnce();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayReplaceOnce( 'wrong argument', undefined, 3 );
      });
      
    }
    
  };


  var arrayUpdate = function( test )
  {

    test.description = 'add a new element';
    var got = _.arrayUpdate( [  ], 1, 1 );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
    var expected = 5;
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'change the fourth element';
    var got = _.arrayUpdate( [ true, true, true, true, false ], false, true );
    var expected = 4;
    test.identical( got, expected );

    /**/

    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayUpdate();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayUpdate( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayUpdate( 'wrong argument', 6, 6 );
      });
      
    }
    
  };


  var arrayAppendOnce = function( test )
  {

    test.description = 'add a new element';
    var got = _.arrayAppendOnce( [  ], 1 );
    var expected = [ 1 ];
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
    var expected = [ 1, 2, 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'nothing add';
    var got = _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
    var expected = [ 1, 2, 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
    var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
    test.identical( got, expected );

    test.description = 'nothing add';
    var got = _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
    var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnce();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayAppendOnce( 'wrong argument', 5 );
      });

    }

  };


  var arrayPrependOnce = function( test )
  {

    test.description = 'add a new element';
    var got = _.arrayPrependOnce( [  ], 1 );
    var expected = [ 1 ];
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
    var expected = [ 5, 1, 2, 3, 4 ];
    test.identical( got, expected );

    test.description = 'nothing add';
    var got = _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
    var expected = [ 1, 2, 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
    var expected = [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ];
    test.identical( got, expected );

    test.description = 'nothing add';
    var got = _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
    var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnce();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
      });

      test.description = 'arguments[0] is wrong';
      test.shouldThrowError( function()
      {
        _.arrayPrependOnce( 'wrong argument', 5 );
      });

    }

  };


  var arraySpliceArray = function( test )
  {

    test.description = 'remove two elements';
    var got = _.arraySpliceArray( [ 1, 2, 3, 4, 5 ], [  ], 1, 2 );
    var expected = [ 1, 4, 5 ];
    test.identical( got, expected );

    test.description = 'replace three elements from first index';
    var got = _.arraySpliceArray( [ 1, 'a', 'b', 'c', 5 ], [ 2, 3, 4 ], 1, 3 );
    var expected = [ 1, 2, 3, 4, 5 ];
    test.identical( got, expected );

    test.description = 'replace two elements and add a new one';
    var got = _.arraySpliceArray( [ 1, 'a', 'b', 'c', 'd' ], [ 2, 3, 4 ], -3, 2  );
    var expected = [ 1, 'a', 2, 3, 4, 'd' ];
    test.identical( got, expected );

    test.description = 'replace two and add three elements';
    var got = _.arraySpliceArray( [ 1, 2, 3, 4, 5 ], [ 1, 2, 3, 'a', 'b' ], 1, 2 );
    var expected = [ 1, 1, 2, 3, 'a', 'b', 4, 5 ];
    test.identical( got, expected );

    test.description = 'add the new elements from arguments[0].length';
    var got = _.arraySpliceArray( [ 1, 2, 3, 4, 5 ], [ 'a', 'b', 'c' ], 7, 2 );
    var expected = [ 1, 2, 3, 4, 5, 'a', 'b', 'c' ];
    test.identical( got, expected );

    test.description = 'remove from first index to the end and add the new elements';
    var got = _.arraySpliceArray( [ 1, 2, 3, 4, 5 ], [ 'a', 'b', 'c' ], 1, 7 );
    var expected = [ 1, 'a', 'b', 'c' ];
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySpliceArray();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySpliceArray( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySpliceArray( [ 1, 'a', 'b', 'c', 5 ], [ 2, 3, 4 ], 1, 3, 'redundant argument' );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arraySpliceArray( 'wrong argument', 'wrong argument', 'wrong argument', 'wrong argument' );
      });

    }

  };


  var arraySlice = function( test )
  {

    test.description = 'nothing';
    var got = _.arraySlice( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'third argument is not provided';
    var got = _.arraySlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2 );
    var expected = [ 3, 4, 5, 6, 7 ];
    test.identical( got, expected );

    test.description = 'second argument is undefined';
    var got = _.arraySlice( [ 1, 2, 3, 4, 5, 6, 7 ], undefined, 4  );
    var expected = [ 1, 2, 3, 4 ];
    test.identical( got, expected );

    test.description = 'from two to six';
    var got = _.arraySlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
    var expected = [ 3, 4, 5, 6 ];
    test.identical( got, expected );

    test.description = 'indexes are out of bound';
    var got = _.arraySlice( [ 3, 4, 5, 6 ], 5, 8 );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    
    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySlice();
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arraySlice( 'wrong argument', 'wrong argument', 'wrong argument' );
      });

    }

  };


  var arrayAs = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayAs();
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an empty array';
    var got = _.arrayAs( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'undefined';
    var got = _.arrayAs( undefined );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'null';
    var got = _.arrayAs( null );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'array contains an object';
    var got = _.arrayAs( { a : 1, b : 2 } );
    var expected = [ { a : 1, b : 2 } ];
    test.identical( got, expected );

    test.description = 'array contains boolean';
    var got = _.arrayAs( true );
    var expected = [ true ];
    test.identical( got, expected );

    /**/

    if( Config.debug ) 
    {
      
      
      
    }
    
  };

  var arrayToStr = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayToStr( [  ] );
    var expected = "";
    test.identical( got, expected );

    test.description = 'returns the string';
    var got = _.arrayToStr( 'abcdefghijklmnopqrstuvwxyz', { type : 'int' } );
    var expected = "a b c d e f g h i j k l m n o p q r s t u v w x y z ";
    test.identical( got, expected );
    
    test.description = 'returns a single string representing the integer values';
    var got = _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
    var expected = "1 2 3 ";
    test.identical( got, expected );

    test.description = 'returns a single string representing the float values';
    var got = _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
    var expected = "3.500 13.77 7.330";
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayToStr();
      });

      test.description = 'in second argument property (type) is wrong';
      test.shouldThrowError( function()
      {
        _.arrayToStr( [ 1, 2, 3 ], { type : 'wrong type' } );
      });

      test.description = 'in second argument property (type) is not provided';
      test.shouldThrowError( function()
      {
        _.arrayToStr( [ 1, 2, 3 ], { precission : 4 } );
      });

      test.description = 'first argument is string';
      test.shouldThrowError( function()
      {
        _.arrayToStr( 'wrong argument', {  type : 'float' } );
      });
      
    }
    
  };


  var arrayPut = function( test ) 
  {

    test.description = 'adds after second element';
    var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
    var expected = [ 1, 2, 'str', true, 7, 8, 9 ];
    test.identical( got, expected );

    test.description = 'adds at the beginning';
    var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
    var expected = [ 'str', true, 7, 8, 5, 6, 9 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayPut();
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arrayPut( 'wrong argument', 'wrong argument', 'str', true, [ 7, 8 ] );
      });
      
    }
    
  };
  
  
  var arrayMask = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'adds last three values';
    var got = _.arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
    var expected = [ "c", 4, 5 ];
    test.identical( got, expected );

    test.description = 'adds the certain values';
    var got = _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
    var expected = [ "a", 'b', 5, 'd' ];
    test.identical( got, expected );
    
    /**/
    
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayMask();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayMask( [ 1, 2, 3, 4 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ], 'redundant argument' );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arrayMask( 'wrong argument', 'wrong argument' );
      });

      test.description = 'both arrays are empty';
      test.shouldThrowError( function()
      {
        _.arrayMask( [  ], [  ] );
      });

      test.description = 'length of the first array is not equal to the second array';
      test.shouldThrowError( function()
      {
        _.arrayMask( [ 1, 2, 3 ], [ undefined, null, 0, '' ] );
      });

      test.description = 'length of the second array is not equal to the first array';
      test.shouldThrowError( function()
      {
        _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0 ] );
      });
      
    }
    
  };
  
  
  var arrayDuplicate = function( test ) 
  {

    test.description = 'couple of repeats';
    var got = _.arrayDuplicate( [ 'a', 'b', 'c' ] );
    var expected = [ 'a', 'a', 'b', 'b', 'c', 'c' ];
    test.identical( got, expected );

    test.description = 'different options';
    var options = {
      src : [ 'abc', 'def' ],
      result : [  ],
      numberOfAtomsPerElement : 2,
      numberOfDuplicatesPerElement : 3
    };
    var got = _.arrayDuplicate( options, {  } );
    var expected = [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ];
    test.identical( got, expected );

    test.description = 'second argument is replaced and non-existent elements from options.src is replaced undefined';
    var options = {
      src : [ 'abc', 'def' ],
      result : [  ],
      numberOfAtomsPerElement : 3,
      numberOfDuplicatesPerElement : 3
    };
    var got = _.arrayDuplicate( options, { a : 7, b : 13 } );
    var expected = [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayDuplicate();
      });

      test.description = 'second argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayDuplicate( [ 'a', 'b', 'c' ], 'wrong argument' );
      });

      test.description = 'options.src is not provided or "undefined"';
      var options = {
        src : undefined,
        result : [  ],
        numberOfAtomsPerElement : 3,
        numberOfDuplicatesPerElement : 3
      };
      test.shouldThrowError( function()
      {
        _.arrayDuplicate( options, { a : 13 } );
      });

    }
    
  };


  var arrayFill = function( test ) 
  {

    test.description = 'an element';
    var got = _.arrayFill( [ 7 ] );
    var expected = [ 0 ];
    test.identical( got, expected );

    test.description = 'an object';
    var got = _.arrayFill( { times : 5, value : 3 } );
    var expected = [ 3, 3, 3, 3, 3 ];
    test.identical( got, expected );

    test.description = 'an array';
    var got = _.arrayFill( [ 1, 2, 3 ] );
    var expected = [ 0, 0, 0 ];
    test.identical( got, expected );

    test.description = 'a number';
    var got = _.arrayFill( 3 );
    var expected = [ 0, 0, 0 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayFill();
      });

      test.description = 'array is empty';
      test.shouldThrowError( function()
      {
        _.arrayFill( [  ] );
      });

      test.description = 'wrong argument';
      test.shouldThrowError( function()
      {
        _.arrayFill( 'wrong argument' );
      });
      
    }
    
  };
  
  
  var arrayCompare = function( test ) 
  {

    test.description = 'empty arrays';
    var got = _.arrayCompare( [  ], [  ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'first array is empty';
    var got = _.arrayCompare( [  ], [ 1, 2 ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'length of the first array is less than second';
    var got = _.arrayCompare( [ 4 ], [ 1, 2 ] );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'arrays are equal';
    var got = _.arrayCompare( [ 1, 5 ], [ 1, 5 ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'a difference';
    var got = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'a negative difference';
    var got = _.arrayCompare( [ 1, 5 ], [ 1, 6 ] );
    var expected = -1;
    test.identical( got, expected );

    test.description = 'array-like arguments';
    var src1 = function() {
      return arguments;
    }( 1, 5 );
    var src2 = function() {
      return arguments;
    }( 1, 2 );
    var got = _.arrayCompare( src1, src2 );
    var expected = 3;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayCompare();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayCompare( [ 1, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayCompare( [ 1, 5 ], [ 1, 2 ], 'redundant argument' );
      });

      test.description = 'wrong type of arguments';
      test.shouldThrowError( function()
      {
        _.arrayCompare( 'wrong argument', 'wrong argument' );
      });

      test.description = 'second array is empty';
      test.shouldThrowError( function()
      {
        _.arrayCompare( [ 1, 5 ], [  ] );
      });

      test.description = 'length of the second array is less than first';
      test.shouldThrowError( function()
      {
        _.arrayCompare( [ 1, 5 ], [ 1 ] );
      });
      
    }
    
  };


  var arraySame = function( test ) 
  {

    test.description = 'empty arrays';
    var got = _.arraySame( [  ], [  ] );
    var expected = true;
    test.identical( got, expected );

    test.description = 'arrays are equal';
    var got = _.arraySame( [ 1, 2, 3 ], [ 1, 2, 3 ] );
    var expected = true;
    test.identical( got, expected );

    test.description = 'array-like arguments';
    var src1 = function() {
      return arguments;
    }( 3, 7, 13 );
    var src2 = function() {
      return arguments;
    }( 3, 7, 33 );
    var got = _.arraySame( src1, src2 );
    var expected = false;
    test.identical( got, expected );

    test.description = 'arrays are not equal';
    var got = _.arraySame( [ 1, 2, 3, 'Hi!' ], [ 1, 2, 3, 'Hello there!' ] );
    var expected = false;
    test.identical( got, expected );

    test.description = 'arrays length are not equal';
    var got = _.arraySame( [ 1, 2, 3 ], [ 1, 2 ] );
    var expected = false;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySame();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySame( [ 1, 2, 3 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySame( [ 1, 2, 3 ], [ 1, 2 ], 'redundant argument' );
      });
      
    }
    
  };


  var arrayLeftIndexOf = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayLeftIndexOf( [  ], 3 );
    var expected = -1;
    test.identical( got, expected );

    test.description = 'second index';
    var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3 );
    var expected = 2;
    test.identical( got, expected );

    test.description = 'zero index';
    var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3, function( el, ins ) { return el < ins } );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'nothing';
    var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 4 );
    var expected = -1;
    test.identical( got, expected );

    test.description = 'nothing';
    var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3, function( el, ins ) { return el > ins } );
    var expected = -1;
    test.identical( got, expected );

    test.description = 'array-like arguments';
    var arr = function() {
      return arguments;
    }( 3, 7, 13 );
    var got = _.arrayLeftIndexOf( arr, 13 );
    var expected = 2;
    test.identical( got, expected );

    test.description = 'fifth index';
    var got = _.arrayLeftIndexOf( 'abcdef', 'e', function( el, ins ) { return el > ins } );
    var expected = 5;
    test.identical( got, expected );

    test.description = 'third index';
    var got = _.arrayLeftIndexOf( 'abcdef', 'd' );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'second index';
    var got = _.arrayLeftIndexOf( 'abcdef', 'c', function( el ) { return el; } );
    var expected = 2;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayLeftIndexOf();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayLeftIndexOf( [ 1, 2, 3 ] );
      });

      test.description = 'third argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayLeftIndexOf( [ 1, 2, 3 ], 2, 'wrong argument' );
      });
      
    }
    
  };
  
  
  var arrayLeft = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayLeft( [  ] );
    var expected = {  };
    test.identical( got, expected );

    test.description = 'returns an object';
    var got = _.arrayLeft( [ 1, 2, 3, 4, 5 ], 3 );
    var expected = { index : 2, element : 3 };
    test.identical( got, expected );
    
    test.description = 'returns an object';
    var got = _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
    var expected = { index : 3, element : 'str' };
    test.identical( got, expected );

    test.description = 'returns an object';
    var got = _.arrayLeft( [ 1, 2, false, 'str', 5 ], 5, function( a ) { return a; } );
    var expected = { index : 4, element : 5 };
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayLeft();
      });

      test.description = 'third argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayLeft( [ 1, 2, 3 ], 2, 'wrong argument' );
      });
      
    }
    
  };
  
  
  var arrayHasAny = function( test ) 
  {

    test.description = 'false';
    var got = _.arrayHasAny( [  ] );
    var expected = false;
    test.identical( got, expected );

    test.description = 'false';
    var got = _.arrayHasAny( [  ], false, 7 );
    var expected = false;
    test.identical( got, expected );

    test.description = 'true';
    var got = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
    var expected = true;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayHasAny();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayHasAny( 'wrong argument', false, 7 );
      });
      
    }
    
  };
  
  
  var arrayCount = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arrayCount( [  ], 3 );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'two matching';
    var got = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
    var expected = 2;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {
      
      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayCount();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayCount( [ 1, 2, 3, 'abc', 13 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayCount( [ 1, 2, 3, true ], true, 'redundant argument' );
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayCount( 'wrong argument', true );
      });
      
    }
    
  };


  var arrayCountSame = function( test )
  {

    test.description = 'nothing';
    var got = _.arrayCountSame( [  ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'nothing';
    var got = _.arrayCountSame( [ 1, 2, 3, 4, 5 ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'three pairs';
    var got = _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
    var expected = 3;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayCountSame();
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], function( e ) { return e }, 'redundant argument' );
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayCountSame( 'wrong argument', function( e ) { return e } );
      });

      test.description = 'second argument is wrong';
      test.shouldThrowError( function()
      {
        _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], 'wrong argument' );
      });

    }

  };
  

  var arraySum = function( test )
  {

    test.description = 'nothing';
    var got = _.arraySum( [  ] );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'returns sum';
    var got = _.arraySum( [ 1, 2, 3, 4, 5 ] );
    var expected = 15;
    test.identical( got, expected );

    test.description = 'returns sum';
    var got = _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
    var expected = 94;
    test.identical( got, expected );

    test.description = 'converts and returns sum';
    var got = _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
    var expected = 30;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySum();
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 }, 'redundant argument' );
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySum( 'wrong argument', function( e ) { return e / 2 } );
      });

      test.description = 'second argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySum( [ 1, 2, 3, 4, 5 ], 'wrong argument' );
      });

    }

  };


  var arrayExtendScreening = function( test )
  {

    test.description = 'returns an empty array';
    var got = _.arrayExtendScreening( [  ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'returns the corresponding values by indexes of the first argument';
    var got = _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
    var expected = [ 5, 6, 2 ];
    test.identical( got, expected );

    test.description = 'creates a new array and returns the corresponding values by indexes of the first argument';
    var got = _.arrayExtendScreening( [ 1, 2, 3 ], null, [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
    var expected = [ 5, 6, 2 ];
    test.identical( got, expected );

    test.description = 'returns the corresponding values by indexes of the first argument';
    var got = _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
    var expected = [ 'a', 6, 2, 13 ];
    test.identical( got, expected );

    test.description = 'returns the second argument';
    var got = _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
    var expected = [ 3, 'abc', 7, 13 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayExtendScreening();
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arrayExtendScreening( [ 1, 2, 3, 'abc', 13 ] );
      });

      test.description = 'next arguments are wrong';
      test.shouldThrowError( function()
      {
        _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 3, 7 ], 'wrong arguments' );
      });

      test.description = 'arguments are wrong';
      test.shouldThrowError( function()
      {
        _.arrayExtendScreening( 'wrong argument', 'wrong argument', 'wrong arguments' );
      });
      
    }
    
  };


  var arrayRandom = function( test ) 
  {

    test.description = 'an array';
    var got = _.arrayRandom( [  ] );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'an empty object';
    var got = _.arrayRandom( {  } );
    var expected = [  ];
    test.identical( got, expected );

    test.description = 'a function';
    var got = _.arrayRandom( function() {  } );
    var expected = [  ];
    test.identical( got, expected );
    
    test.description = 'a number';
    var got = _.arrayRandom( 5 );
    var expected = got;
    test.identical( got, expected );

    test.description = 'an object';
    var got = _.arrayRandom( {
      length : 5,
      range : [ 1, 9 ],
      int : true
    } );
    var expected = got;
    test.identical( got, expected );
    
    /**/

    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arrayRandom();
      });

      test.description = 'wrong argument';
      test.shouldThrowError( function()
      {
        _.arrayRandom( 'wrong argument' );
      });
      
    }
    
  };
  
  
  var arraySetContainAll = function( test ) 
  {
    
    test.description = 'returns true';
    var got = _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
    var expected = true;
    test.identical( got, expected );

    test.description = 'length of the first argument is more than second argument';
    var got = _.arraySetContainAll( [ 1, 2, 3, 4, 5 ], [ 1, 2, 3, 4 ] );
    var expected = false;
    test.identical( got, expected );

    test.description = 'length of the first argument is more than second argument';
    var got = _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
    var expected = false;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySetContainAll();
      });

      test.description = 'wrong arguments';
      test.shouldThrowError( function()
      {
        _.arraySetContainAll( [ 1, 2, 3, 4 ], 'wrong arguments' );
      });
      
    }
    
  };


  var arraySetContainSomething = function( test )
  {

    test.description = 'returns false';
    var got = _.arraySetContainSomething( [  ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
    var expected = false;
    test.identical( got, expected );

    test.description = 'returns false';
    var got = _.arraySetContainSomething( [  ] );
    var expected = false;
    test.identical( got, expected );

    test.description = 'returns false';
    var got = _.arraySetContainSomething( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
    var expected = false;
    test.identical( got, expected );

    test.description = 'matching from arguments[1]';
    var got = _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
    var expected = true;
    test.identical( got, expected );

    test.description = 'matching from arguments[2]';
    var got = _.arraySetContainSomething( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
    var expected = true;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySetContainSomething();
      });

      test.description = 'wrong arguments';
      test.shouldThrowError( function()
      {
        _.arraySetContainSomething( [ 1, 2, 3, 4 ], 'wrong arguments' );
      });

    }

  };


  var _arraySortedLookUpAct = function( test )
  {

    test.description = 'first argument is empty, so it returns the index from which it ended search at';
    var got = _._arraySortedLookUpAct( [  ], 55, function( a, b ){ return a - b }, 0, 5 );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'returns the last index of the first argument';
    var got = _._arraySortedLookUpAct( [ 1, 2, 3, 4, 5 ], 5, function( a, b ){ return a - b }, 0, 5 );
    var expected = 4;
    test.identical( got, expected );

    test.description = 'second argument was not found, so it returns the length of the first argument';
    var got = _._arraySortedLookUpAct( [ 1, 2, 3, 4, 5 ], 55, function( a, b ){ return a - b }, 0, 5 );
    var expected = 5;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _._arraySortedLookUpAct();
      });

    }

  };


  var arraySortedLookUp = function( test ) 
  {

    test.description = 'returns an object that containing the found value';
    var got = _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b } );
    var expected = { value : 5, index : 4 };
    test.identical( got, expected );

    test.description = 'returns undefined';
    var got = _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
    var expected = undefined;
    test.identical( got, expected );

    test.description = 'call without a callback function';
    var got = _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 3 );
    var expected = { value : 3, index : 2 };
    test.identical( got, expected );
    
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedLookUp();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySortedLookUp( 'wrong argument', 5, function( a, b ) { return a - b } );
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
      });
      
    }
    
  };


  var arraySortedRemove = function( test )
  {

    test.description = 'nothing to remove';
    var got = _.arraySortedRemove( [  ], 55 );
    var expected = false;
    test.identical( got, expected );

    test.description = 'nothing to remove';
    var got = _.arraySortedRemove( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
    var expected = false;
    test.identical( got, expected );

    test.description = 'remove last index from first argument';
    var got = _.arraySortedRemove( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b } );
    var expected = true;
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedRemove();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySortedRemove( 'wrong argument', 5, function( a, b ) { return a - b } );
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedRemove( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySortedRemove( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
      });
      
    }
    
  };


  var arraySortedAddOnce = function( test )
  {

    test.description = 'add an element';
    var got = _.arraySortedAddOnce( [  ], 55 );
    var expected = true;
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
    var expected = true;
    test.identical( got, expected );

    test.description = 'do not add, because the second element already has in the first argument';
    var got = _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b } );
    var expected = false;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedAddOnce();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySortedAddOnce( 'wrong argument', 5, function( a, b ) { return a - b } );
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
      });

    }

  };


  var arraySortedAdd = function( test )
  {

    test.description = 'add an element';
    var got = _.arraySortedAdd( [  ], 55 );
    var expected = 0;
    test.identical( got, expected );

    test.description = 'add a new element';
    var got = _.arraySortedAdd( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
    var expected = 5;
    test.identical( got, expected );

    test.description = 'offsets arguments[0][1]';
    var got = _.arraySortedAdd( [ 1, 2, 3, 4 ], 2, function( a, b ) { return a - b } );
    var expected = 1;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedAdd();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySortedAdd( 'wrong argument', 5, function( a, b ) { return a - b } );
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedAdd( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySortedAdd( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
      });

    }

  };


  var arraySortedAddArray = function( test )
  {

    test.description = 'returns sum equal to the 3';
    var got = _.arraySortedAddArray( [  ], [ 1, 2, 3 ], function( a, b ) { return a - b } );
    var expected = 3;
    test.identical( got, expected );

    test.description = 'returns sum equal to the 19';
    var got = _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ], [ 6, 7, 8, 2 ], function( a, b ) { return a - b } );
    var expected = 19;
    test.identical( got, expected );

    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedAddArray();
      });

      test.description = 'first argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySortedAddArray( 'wrong argument', [ 6, 7, 8, 2 ], function( a, b ) { return a - b } );
      });

      test.description = 'second argument is wrong';
      test.shouldThrowError( function()
      {
        _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ], 'wrong argument', function( a, b ) { return a - b } );
      });

      test.description = 'not enough arguments';
      test.shouldThrowError( function()
      {
        _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ] );
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ], [ 6, 7, 8, 2 ], function( a, b ) { return a - b }, 'extra argument' );
      });

    }

  };


  var arrayRange = function( test )
  {

    test.description = 'single zero';
    var got = _.arrayRange( [ 0, 1 ] );
    var expected = [ 0 ];
    test.identical( got,expected );

    test.description = 'nothing';
    var got = _.arrayRange( [ 1, 1 ] );
    var expected = [  ];
    test.identical( got,expected );

    test.description = 'single not zero';
    var got = _.arrayRange( [ 1, 2 ] );
    var expected = [ 1 ];
    test.identical( got,expected );

    test.description = 'couple of elements';
    var got = _.arrayRange( [ 1, 3 ] );
    var expected = [ 1, 2 ];
    test.identical( got,expected );

    test.description = 'single number as argument';
    var got = _.arrayRange( 3 );
    var expected = [ 0, 1, 2 ];
    test.identical( got,expected );

    test.description = 'complex case';
    var got = _.arrayRange( [ 3, 9 ] );
    var expected = [ 3, 4, 5, 6, 7, 8 ];
    test.identical( got,expected );

    /**/

    if( Config.debug )
    {

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.arrayRange( [ 1, 3 ],'wrong arguments' );
      });

      test.description = 'argument not wrapped into array';
      test.shouldThrowError( function()
      {
        _.arrayRange( 1, 3 );
      });

      test.description = 'wrong type of argument';
      test.shouldThrowError( function()
      {
        _.arrayRange( 'wrong arguments' );
      });

      test.description = 'no arguments'
      test.shouldThrowError( function()
      {
        _.arrayRange();
      });

    }

  };


  var arraySupplement = function( test ) 
  {

    test.description = 'nothing';
    var got = _.arraySupplement( [  ] );
    var expected = [  ];
    test.identical( got, expected );
    
    test.description = 'only numbers';
    var got = _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
    var expected = [ 4, 5, 33, 13, 9, 7 ];
    test.identical( got, expected );

    test.description = 'only numbers and undefined';
    var got = _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
    var expected = [ 4, 5, 33, 13, undefined, 7 ];
    test.identical( got, expected );

    test.description = 'only numbers';
    var got = _.arraySupplement( [ 'a', 'b' ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
    var expected = [ 6, 7, 33, 13, 9, 7 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.arraySupplement();
      });

      test.description = 'arguments are wrong';
      test.shouldThrowError( function()
      {
        _.arraySupplement( 'wrong argument', 'wrong arguments' );
      });
      
    }
    
  };




  var bufferRelen = function( test ) 
  {
    
    test.description = 'second argument is more than ints.length';
    var ints = new Int8Array( [ 3, 7, 13 ] );
    var got = _.bufferRelen( ints, 4 );
    var expected = got; // [ 3, 7, 13, 0 ];
    test.identical( got, expected );
    
    test.description = 'second argument is less than ints2.length';
    var ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
    var got = _.bufferRelen( ints2, 3 );
    var expected = got; // [ 3, 7, 13 ];
    test.identical( got, expected );

    test.description = 'invalid values are replaced by zero';
    var ints3 = new Int32Array( [ 3, 'a', 13, 'b', 77 ] );
    var got = _.bufferRelen( ints3, 6 );
    var expected = got; // [ 3, 0, 13, 0, 77, 0 ];
    test.identical( got, expected );

    test.description = 'returns the initial typed array';
    var floats = new Float32Array( [ 3.35, 7.5, 13.35, 33.75, 77.25 ] );
    var got = _.bufferRelen( floats, 5 );
    var expected = got; // [ 3.3499999046325684, 7.5, 13.350000381469727, 33.75, 77.25 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.bufferRelen();
      });
      
    }
    
  };


  var bufferRetype = function( test ) 
  {
    
    test.desscription = 'converts and returns the new type of Int16Array';
    var view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
    var got = _.bufferRetype(view1, Int16Array);
    var expected = got; // [ 513, 1027, 1541 ];
    test.identical( got, expected );

    test.desscription = 'converts and returns the new type of Int8Array';
    var view1 = new Int16Array( [ 513, 1027, 1541 ] );
    var got = _.bufferRetype(view1, Int8Array);
    var expected = got; // [ 1, 2, 3, 4, 5, 6 ];
    test.identical( got, expected );
    
    /**/
    
    if( Config.debug ) 
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.bufferRetype();
      });

      test.description = 'arguments are wrong';
      test.shouldThrowError( function()
      {
        _.bufferRetype( 'wrong argument', 'wrong argument' );
      });
      
    }
    
  };


  var bufferRawFromBuffer = function( test )
  {

    var buffer1 = new ArrayBuffer(10);
    var view1 = new Int8Array( buffer1 );
    test.description = 'returns the same length of typed array';
    var got = _.bufferRawFromBuffer( view1 );
    var expected = got; // [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    test.identical( got, expected );
    
    var buffer2 = new ArrayBuffer(10);
    var view2 = new Int8Array( buffer2, 2 );
    test.description = 'returns the new sub typed array';
    var got = _.bufferRawFromBuffer( view2 );
    var expected = got; // [ 0, 0, 0, 0, 0, 0 ]
    test.identical( got, expected );
    
    /**/

    if( Config.debug )
    {

      test.description = 'no arguments';
      test.shouldThrowError( function()
      {
        _.bufferRawFromBuffer();
      });

      test.description = 'arguments are wrong';
      test.shouldThrowError( function()
      {
        _.bufferRawFromBuffer( 'wrong argument' );
      });
      
    }

  };
  
  
  
  // node ./staging/abase/z.tests/Array.test.s

//

  var Proto =
  {

    name : 'simple1',
    
    tests:
    {
      
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
      //arrayRemoveArrayOnce : arrayRemoveArrayOnce,
      
      //arrayRemovedOnce : arrayRemovedOnce,
      //arrayRemoveOnce : arrayRemoveOnce,
      //arrayRemovedAll : arrayRemovedAll,
      //arrayRemoveAll : arrayRemoveAll,
      //arrayReplaceOnce : arrayReplaceOnce,

      //arrayUpdate : arrayUpdate,
      //arrayAppendOnce : arrayAppendOnce,
      //arrayPrependOnce : arrayPrependOnce,
      //arraySpliceArray : arraySpliceArray,
      //arraySlice : arraySlice,
      
      //arrayAs : arrayAs,
      //arrayToStr : arrayToStr,
      //arrayPut : arrayPut,
      //arrayMask : arrayMask,
      //arrayDuplicate : arrayDuplicate,

      //arrayFill : arrayFill,
      //arrayCompare : arrayCompare,
      //arraySame : arraySame,

      //arrayLeftIndexOf : arrayLeftIndexOf,
      //arrayLeft : arrayLeft,
      //arrayHasAny : arrayHasAny,
      //arrayCount : arrayCount,
      //arrayCountSame : arrayCountSame,
      //arraySum : arraySum,
      //arrayExtendScreening : arrayExtendScreening,
      //arrayRandom : arrayRandom,

      //arraySetContainAll: arraySetContainAll,
      //arraySetContainSomething : arraySetContainSomething,
      //_arraySortedLookUpAct : _arraySortedLookUpAct,
      //arraySortedLookUp : arraySortedLookUp,
      //arraySortedRemove : arraySortedRemove,
      //arraySortedAddOnce : arraySortedAddOnce,
      //arraySortedAdd : arraySortedAdd,

      //arraySortedAddArray : arraySortedAddArray,
      //arrayRange : arrayRange,
      //arraySupplement : arraySupplement,


      //bufferRelen : bufferRelen, 
      //bufferRetype : bufferRetype,
      //bufferRawFromBuffer : bufferRawFromBuffer,
      
    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
