( function _Array_test_s_( ) {

'use strict';

var isBrowser = true;

if( typeof module !== 'undefined' )
{
  isBrowser = false;

  try
  {
    require( '../../abase/wTools.s' );
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;
  _.include( 'wTesting' );

}

var _ = wTools;

// --
// buffer
// --

function bufferRelen( test )
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

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.bufferRelen();
  });

};

//

function bufferRetype( test )
{

  test.description = 'converts and returns the new type of Int16Array';
  var view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
  var got = _.bufferRetype(view1, Int16Array);
  var expected = got; // [ 513, 1027, 1541 ];
  test.identical( got, expected );

  test.description = 'converts and returns the new type of Int8Array';
  var view1 = new Int16Array( [ 513, 1027, 1541 ] );
  var got = _.bufferRetype(view1, Int8Array);
  var expected = got; // [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function bufferRawFromBuffer( test )
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

  if( !Config.debug )
  return;

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

//

function arrayIs( test )
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

  if( !Config.debug )
  return;

};

//

function arrayLike( test )
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

  if( !Config.debug )
  return;


};


function hasLength( test )
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
  function fn( a, b, c ) { };
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

  if( !Config.debug )
  return;

};

//

function arrayMakeSimilar( test )
{

  test.description = 'an empty array';
  var got = _.arrayMakeSimilar( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'length = 1';
  var got = _.arrayMakeSimilar( [  ], 1 );
  var expected = [ ,  ];
  test.identical( got, expected );

  test.description = 'length = 2';
  var got = _.arrayMakeSimilar( [ 1, 2, 3 ], 2 );
  var expected = [ , , ];
  test.identical( got, expected );

  test.description = 'length = 4';
  var got = _.arrayMakeSimilar( [ 1, 2, 3 ], 4 );
  var expected = [ , , , , ];
  test.identical( got, expected );

  test.description = 'same length';

  var ins = [ 1, 2, 3 ];
  var got = _.arrayMakeSimilar( ins );
  test.identical( got.length, 3 );
  test.shouldBe( got !== ins );

  var ins = [];
  var src = _.arrayFill({ result : new Buffer( 5 ), value : 1, times : 5 });
  var got = _.arrayMakeSimilar( ins, src );
  test.identical( got.length, 5 );
  test.shouldBe( _.arrayIs( got ) );
  test.identical( got, [ 1,1,1,1,1 ] );

  var ins = new Uint8Array( 5 );
  ins[ 0 ] = 1;
  var got = _.arrayMakeSimilar( ins );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 5 );
  test.shouldBe( got !== ins );

  var ins = new Uint8Array( 5 );
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.arrayMakeSimilar( ins,src );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got instanceof Uint8Array );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'typedArray';
  var ins = new Uint8Array( 5 );
  ins[ 0 ] = 1;
  var got = _.arrayMakeSimilar( ins, 4 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 4 );
  test.shouldBe( got !== ins );

  test.description = 'ArrayBuffer';
  var ins = new ArrayBuffer( 5 );
  var got = _.arrayMakeSimilar( ins, 4 );
  test.shouldBe( _.bufferRawIs( got ) );
  test.identical( got.byteLength, 4 );

  test.description = 'NodeBuffer'
  var got = _.arrayMakeSimilar( new Buffer( 5 ) );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 5 );

  test.description = 'NodeBuffer and src'
  var src = new Int8Array(5);
  for( var i = 0; i < src.length; i++ )
  src[ i ] = i;
  var got = _.arrayMakeSimilar( new Buffer( 5 ), src );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar('wrong argument');
  });

  test.description = 'arguments[1] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar( [ 1, 2, 3 ], 'wrong type of argument' );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar( [ 1, 2, 3 ], 4, 'redundant argument' );
  });

  test.description = 'argument is not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar( 1, 2, 3, 4 );
  });
};

//

function arrayMakeRandom( test )
{

  test.description = 'an empty object';
  var got = _.arrayMakeRandom( {  } );
  test.identical( got.length, 1 );
  test.shouldBe( got[ 0 ] >= 0 && got[ 0 ]<= 1 );

  test.description = 'a number';
  var got = _.arrayMakeRandom( 5 );
  var expected = got;
  test.identical( got.length, 5 );

  var got = _.arrayMakeRandom( -1 );
  var expected = [];
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayMakeRandom( {
    length : 5,
    range : [ 1, 9 ],
    int : true
  } );
  var expected = got;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayMakeRandom();
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeRandom( 'wrong argument' );
  });

};

//

function arrayFromRange( test )
{

  test.description = 'single zero';
  var got = _.arrayFromRange( [ 0, 1 ] );
  var expected = [ 0 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _.arrayFromRange( [ 1, 1 ] );
  var expected = [  ];
  test.identical( got,expected );

  test.description = 'single not zero';
  var got = _.arrayFromRange( [ 1, 2 ] );
  var expected = [ 1 ];
  test.identical( got,expected );

  test.description = 'couple of elements';
  var got = _.arrayFromRange( [ 1, 3 ] );
  var expected = [ 1, 2 ];
  test.identical( got,expected );

  test.description = 'single number as argument';
  var got = _.arrayFromRange( 3 );
  var expected = [ 0, 1, 2 ];
  test.identical( got,expected );

  test.description = 'complex case';
  var got = _.arrayFromRange( [ 3, 9 ] );
  var expected = [ 3, 4, 5, 6, 7, 8 ];
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayFromRange( [ 1, 3 ],'wrong arguments' );
  });

  test.description = 'argument not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arrayFromRange( 1, 3 );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayFromRange( 'wrong arguments' );
  });

  test.description = 'no arguments'
  test.shouldThrowError( function()
  {
    _.arrayFromRange();
  });

};

//

function arrayFrom( test )
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

  if( !Config.debug )
  return;

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

};

//

function arrayAs( test )
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

  if( !Config.debug )
  return;

};

//

function arrayToMap( test )
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

  test.description = 'arrayLike';
  var arr = [];
  arr[ 'a' ] = 1;
  var got = _.arrayToMap( arr );
  var expected = {};
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function arrayToStr( test )
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

  if( !Config.debug )
  return;

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

};

//

function arraySub( test )
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

  if( !Config.debug )
  return;

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

};

//

function arrayGrow( test )
{
  var got,expected;
  var array = [ 1,2,3,4,5 ];

  test.description = 'defaults';

  /* default call returns copy */

  got = _.arrayGrow( array );
  expected = array;
  test.identical( got, expected );

  test.description = 'increase size of array';

  /* without setting value */

  got = _.arrayGrow( array, 0, array.length + 2 );
  expected = array.length + 2;
  test.identical( got.length, expected );

  /* by setting value */

  got = _.arrayGrow( array, 0, array.length + 2, 0 );
  expected = [ 1,2,3,4,5,0,0 ];
  test.identical( got, expected );

  /* by taking only last element of source array */

  got = _.arrayGrow( array, array.length - 1, array.length * 2, 0 );
  expected = [ 5,0,0,0,0,0 ];
  test.identical( got, expected );

  test.description = 'decrease size of array';

  /**/

  got = _.arrayGrow( array, 0, 3 );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* setting value not affects on array */

  got = _.arrayGrow( array, 0, 3, 0 );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* begin index is negative */

  got = _.arrayGrow( array, -1, 3 );
  expected = [ undefined,1,2,3 ];
  test.identical( got, expected );

  /* end index is negative */

  got = _.arrayGrow( array, 0, -1 );
  expected = [];
  test.identical( got, expected );

  /* begin index negative, set value */

  got = _.arrayGrow( array, -1, 3, 0 );
  expected = [ 0, 1,2,3 ];
  test.identical( got, expected );

  //

  if( !isBrowser )
  {
    test.description = 'buffer';
    got = _.arrayGrow( new Buffer( '123' ), 0, 5, 0 );
    expected = [ 49, 50, 51, 0, 0 ];
    test.identical( got, expected );
  }

  //

  if( !Config.debug )
  return;

  test.description = 'invalid arguments type';

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayGrow( 1 );
  })

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayGrow( array, '1', array.length )
  })

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayGrow( array, 0, '1' )
  })

}

//

function arraySlice( test )
{
  var got,expected;

  //

  test.description = 'defaults';
  var array = [ 1, 2, 3, 4, 5, 6, 7 ];

  /*nothing*/

  got = _.arraySlice( [  ] );
  expected = [  ];
  test.identical( got, expected );

  /*just pass array*/

  got = _.arraySlice( array );
  expected = array;
  test.identical( got, expected );

  //

  test.description = 'make copy of source';

  /* third argument is not provided */

  got = _.arraySlice( array, 2 );
  expected = [ 3, 4, 5, 6, 7 ];
  test.identical( got, expected );

  /* second argument is undefined */

  got = _.arraySlice( array, undefined, 4  );
  expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );

  /* from two to six */

  test.description = 'from two to six';
  got = _.arraySlice( array, 2, 6 );
  expected = [ 3, 4, 5, 6 ];
  test.identical( got, expected );

  /* indexes are out of bound */

  got = _.arraySlice( [ 1,2,3 ], 5, 8 );
  expected = [];
  test.identical( got, expected );

  /* left bound is negative */

  got = _.arraySlice( array, -1, array.length );
  expected = array;
  test.identical( got, expected );

  /* rigth bound is negative */

  got = _.arraySlice( array, 0, -1 );
  expected = [];
  test.identical( got, expected );

  /* rigth bound is out of range */

  got = _.arraySlice( array, 0, array.length + 2 );
  expected = array;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'buffer';

  /**/

  got = _.arraySlice( new Buffer( '123' ), 0, 1 );
  expected = [ 49 ];
  test.identical( got, expected );

  //

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySlice();
  });

  //

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arraySlice( 'wrong argument', 'wrong argument', 'wrong argument' );
  });

};

//

function arrayDuplicate( test )
{
  test.description = 'couple of repeats';
  var got = _.arrayDuplicate( [ 'a', 'b', 'c' ] );
  var expected = [ 'a', 'a', 'b', 'b', 'c', 'c' ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 1 numberOfDuplicatesPerElement 1';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 1 numberOfDuplicatesPerElement 2';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 2
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,10,20,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 2 numberOfDuplicatesPerElement 1';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 2 numberOfDuplicatesPerElement 2';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 2
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,20,10,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'result provided';
  var options =
  {
    src : [ 10,20 ],
    result : [ 1,1,1,1 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 2
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,10,20,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var options =
  {
    src : [ 'abc', 'def' ],
    result : new Array( 6 ),
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 3
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var options =
  {
    src : [ 'abc', 'def' ],
    result : [],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def',  ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var options =
  {
    src : [ 'abc', 'def' ],
    result : [ 1, 2 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 1, 2, 'abc', 'def',  ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var arr = new Uint8Array( 1 );
  arr[ 0 ] = 5;
  var options =
  {
    src : [ 1, 2 ],
    result : arr,
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 5, 1, 2 ];
  var equal = true;
  for( var i = 0; i < expected.length; i++ )
  {
    if( expected[ i ] !== got[ i ]  )
    equal = false;
  }
  test.shouldBe( equal );
  test.identical( got.length, expected.length );

  /* */

  test.description = 'second argument is replaced and non-existent elements from options.src is replaced undefined';
  var options = {
    src : [ 'abc', 'def', undefined ],
    numberOfAtomsPerElement : 3,
    numberOfDuplicatesPerElement : 3
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

  test.description = 'result provided, but not enough length';
  var options =
  {
    src : [ 10,20 ],
    result : [],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 2
  };
  test.shouldThrowError( function ()
  {
    _.arrayDuplicate( options );
  })


};

//

function arrayMask( test )
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


  if( !Config.debug )
  return;

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

};

//

function arraySelect( test )
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

  test.description = 'using object';
  var src = [ 1, 1, 2, 2, 3, 3 ];
  var indices = { atomsPerElement : 2, indices : [ 0, 1, 2 ] }
  var got = _.arraySelect( src,indices );
  var expected = [ 1, 1, 2, 2, 3, 3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function arrayCutin( test )
{

  debugger;

  test.description = 'range as single number';

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 2 );
  var expected = [ 3 ];
  test.identical( got, expected );
  test.identical( dst, [ 1, 2, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, -1 );
  var expected = [];
  test.identical( got, expected );
  test.identical( dst, [ 1, 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 0, [ 0 ] );
  var expected = [ 1 ];
  test.identical( got, expected );
  test.identical( dst, [ 0, 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 0, [] );
  var expected = [ 1 ];
  test.identical( got, expected );
  test.identical( dst, [ 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, [ 0 ], [] );
  var expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );
  test.identical( dst, [] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var expected = dst.slice().splice( 1 );
  var got = _.arrayCutin( dst, [ 1 ], [ 5 ] );
  test.identical( got, expected );
  test.identical( dst, [ 1, 5 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, [ undefined, 1 ], [ 5 ] );
  test.identical( got, [ 1 ] );
  test.identical( dst, [ 5, 2, 3, 4 ] );

  //

  test.description = 'empth';
  var dst = [];
  var cut = _.arrayCutin( [],[],[] );
  test.identical( cut, [] );
  test.identical( dst, [] );

  /* */

  test.description = 'remove two elements';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ], [] );
  var expected = [ 1, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'remove two elements and incut three';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ], [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass only begin of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1 ], [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass empty range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [], [ 11, 22, 33 ] );
  var expected = [ 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass number instead of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, 1, [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'no source, number istead of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, 1 );
  var expected = [ 1, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'no source';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ] );
  var expected = [ 1, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, begin';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -10,2 ],[ 11, 22, 33 ] );
  var expected = [ 11, 22, 33, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 1, 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, end';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 3,10 ],[ 11, 22, 33 ] );
  var expected = [ 1, 2, 3, 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -10,10 ],[ 11, 22, 33 ] );
  var expected = [ 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'negative, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -1, -1 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* */

  test.description = 'zero, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 0, 0 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* first > last */

  test.description = 'first > last';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 9, 0 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* Buffers */

  var list =
  [
    Int8Array,
    Uint8Array,
    Uint8ClampedArray,
    Int16Array,
    Uint16Array,
    Int32Array,
    Uint32Array,
    Float32Array,
    Float64Array,
    ArrayBuffer
  ];

  if( !isBrowser )
  list.push( Buffer );

  for( var i = 0; i < list.length; i++ )
  {
    test.description = 'buffers: ' + list[ i ].name;

    var array = new list[ i ]( 5 );
    for( var j = 0; j < 5; j++ )
    array[ j ] = j + 1;

    //array [ 1,2,3,4,5 ]

    /* simple cut */

    var got = _.arrayCutin( array, 0 );
    var expected = [ 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* simple cut, add one element to begin */

    var got = _.arrayCutin( array, 0, [ 9 ] );
    var expected = [ 9, 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* simple cut */

    var got = _.arrayCutin( array, 4 );
    var expected = [ 1, 2, 3, 4 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range */

    var got = _.arrayCutin( array, [ 0, 1 ] );
    var expected = [ 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range */

    var got = _.arrayCutin( array, [ 2, 5 ] );
    var expected = [ 1, 2 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* single, add new elements to end */

    var got = _.arrayCutin( array, 4, [ 6, 7 ] );
    var expected = [ 1, 2, 3, 4, 6, 7 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range, add new elements to end */

    var got = _.arrayCutin( array, [ 4, 5 ], [ 6, 7 ] );
    var expected = [ 1, 2, 3, 4, 6, 7 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* out of range, returns original */

    var got = _.arrayCutin( array, 10, [ 6, 7 ] );
    var expected = array;
    test.identical( got,expected );

    /* remove all, last index is out of range */

    var got = _.arrayCutin( array, [ 0, 99 ] );
    var expected = new list[ i ]( 0 );
    test.identical( got.byteLength,expected.byteLength );

    /* remove all and fill with new values */

    var got = _.arrayCutin( array, [ 0, 99 ], [ 1, 2, 3, 4, 5 ] );
    var expected = array;
    test.identical( got,expected );

    /* negative */

    var got = _.arrayCutin( array, [ 0, -1 ] );
    var expected = array;
    test.identical( got,expected );

    /* negative */

    var got = _.arrayCutin( array, [ -1, -1 ] );
    var expected = array;
    test.identical( got,expected );

    /* zero, returns original */

    var got = _.arrayCutin( array, [ 0, 0 ], [ 1 ] );
    var expected = array;
    test.identical( got,expected );

    /* empty */

    var got = _.arrayCutin( array, [], [] );
    got = _.definedIs( got.length ) ? got.length : got.byteLength;
    test.identical( got, 0 );

  }

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayCutin();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayCutin( [ 1, 2, 3, 4, 5 ] );
  });

  test.description = 'redundant argument';
  test.shouldThrowError( function()
  {
    _.arrayCutin( [ 1, 'a', 'b', 'c', 5 ], [ 2, 3, 4 ], 1, 3, 'redundant argument' );
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arrayCutin( 'wrong argument', 'wrong argument', 'wrong argument', 'wrong argument' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayCutin( [],[ 'x' ],3 );
  });
};

//

function arrayPut( test )
{

  test.description = 'adds after second element';
  var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
  var expected = [ 1, 2, 'str', true, 7, 8, 9 ];
  test.identical( got, expected );

  test.description = 'adds at the beginning';
  var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
  var expected = [ 'str', true, 7, 8, 5, 6, 9 ];
  test.identical( got, expected );

  test.description = 'add to end';
  var got = _.arrayPut( [ 1,2,3 ], 3, 4, 5, 6 );
  var expected = [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  test.description = 'offset is negative';
  var got = _.arrayPut( [ 1,2,3 ], -1, 4, 5, 6 );
  var expected = [ 5, 6, 3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function arrayFill( test )
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

  test.description = 'array';
  var got = _.arrayFill( [ 1,2,3,4 ], 1 );
  var expected = [ 1,1,1,1 ];
  test.identical( got, expected );

  test.description = 'as object';
  var got = _.arrayFill({ result : [ 1,2,3,4 ], value : 1, times : 3 });
  var expected = [ 1,1,1,4 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayFill();

  });

  test.description = 'zero';
  test.shouldThrowError( function()
  {
    _.arrayFill( 0 );
  });

  test.description = 'negative';
  test.shouldThrowError( function()
  {
    _.arrayFill( -1 );
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

};

//

function arraySupplement( test )
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

  if( !Config.debug )
  return;

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

};

//

function arrayExtendScreening( test )
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

  if( !Config.debug )
  return;

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

};

//

function arrayLeftIndexOf( test )
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
  function arr()
  {
    return arguments;
  }
  var _arr = arr( 3, 7, 13 );
  var got = _.arrayLeftIndexOf( _arr, 13 );
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

  test.description = 'one argument';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ] );
  test.identical( got, -1 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayLeftIndexOf();
  });

  test.description = 'third argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayLeftIndexOf( [ 1, 2, 3 ], 2, 'wrong argument' );
  });

};

//

function arrayLeft( test )
{

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

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayLeft();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayLeft( [] );
  });

  test.description = 'third argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayLeft( [ 1, 2, 3 ], 2, 'wrong argument' );
  });

};

//

function arrayCount( test )
{

  test.description = 'nothing';
  var got = _.arrayCount( [  ], 3 );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'two matching';
  var got = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'arrayLike';
  var src = [ 1, 2, 3 ];
  src[ 'a' ] = 1;
  var got = _.arrayCount( src, 1 );
  var expected = 1;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function arrayCountUnique( test )
{

  test.description = 'nothing';
  var got = _.arrayCountUnique( [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'three pairs';
  var got = _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique();
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], function( e ) { return e }, 'redundant argument' );
  });

  test.description = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique( 'wrong argument', function( e ) { return e } );
  });

  test.description = 'second argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], 'wrong argument' );
  });

};

//

function arrayCompare( test )
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
  var src1 = function src1() {
    return arguments;
  }( 1, 5 );
  var src2 = function src2() {
    return arguments;
  }( 1, 2 );
  var got = _.arrayCompare( src1, src2 );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function arrayHasAny( test )
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

  if( !Config.debug )
  return;

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

};

//

function arraySum( test )
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

  if( !Config.debug )
  return;

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

};

// ---
// array transformation
// ---

function __arrayPrepend( test )
{
  test.description = 'simple';

  var got = _.__arrayPrepend( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayPrepend( [ 1 ], 1 );
  test.identical( got, [ 1, 1 ] );

  var got = _.__arrayPrepend( [ 1 ], 2 );
  test.identical( got, [ 2, 1 ] );

  var got = _.__arrayPrepend( [ 1,2,3 ], 3 );
  test.identical( got, [ 3,1,2,3 ] );

  var got = _.__arrayPrepend( [ 1 ], '1' );
  test.identical( got, [ '1', 1 ] );

  var got = _.__arrayPrepend( [ 1 ], -1 );
  test.identical( got, [ -1, 1 ] );

  var got = _.__arrayPrepend( [ 1 ], [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayPrepend();
  })

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrepend( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayPrepend( 1, 1 );
  })
}

//

function __arrayPrependOnce( test )
{
  test.description = 'simple';

  var got = _.__arrayPrependOnce( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], 2 );
  test.identical( got, [ 2, 1 ] );

  var got = _.__arrayPrependOnce( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.__arrayPrependOnce( [ 1 ], '1' );
  test.identical( got, [ '1', 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], -1 );
  test.identical( got, [ -1, 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependOnce( dst, 4, onEqualize );
  test.identical( got, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependOnce();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.__arrayPrependOnce( 1, 1, 1 );
  })

}

//

//
// function _arrayPrependOnce( test )
// {
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [  ], 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
//   var expected = [ 5, 1, 2, 3, 4 ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//   var expected = [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( 'wrong argument', 5 );
//     });
//
//   }
//
// };

//

function __arrayPrependOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependOnceStrictly( dst , 1 );
  test.identical( got, [ 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, 2 );
  test.identical( got, [ 2, 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, '1' );
  test.identical( got, [ '1', 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, -1 );
  test.identical( got, [ -1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependOnceStrictly( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependOnceStrictly( dst, 4, onEqualize );
  test.identical( got, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependOnceStrictly( 1, 1 );
  })

  test.description = 'ins already exists ion dst';

  test.shouldThrowError( function()
  {
    _.__arrayPrependOnceStrictly( [ 1 ], 1 );
  });

  test.shouldThrowError( function()
  {
     _.__arrayPrependOnceStrictly( [ 1,2,3 ], 3 );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
     _.__arrayPrependOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.__arrayPrependOnceStrictly( dst, { num : 1 }, onEqualize );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.__arrayPrependOnceStrictly( dst, 1, onEqualize );
  });

}

//

function __arrayPrepended( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrepended( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, 1 );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, 2 );
  test.identical( dst, [ 2, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrepended( dst, 3 );
  test.identical( dst, [ 3,1,2,3 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, '1' );
  test.identical( dst, [ '1', 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, -1 );
  test.identical( dst, [ -1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, [ 1 ] );
  test.identical( dst, [ [ 1 ], 1 ] );
  test.identical( got, 0 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayPrepended();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrepended( [], 1, 1 );
  });

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayPrepended( 1, 1 );
  });
}

//

function __arrayPrependedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, 2 );
  test.identical( dst, [ 2, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedOnce( dst, 3 );
  test.identical( dst, [ 1,2,3 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, '1' );
  test.identical( dst, [ '1', 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, -1 );
  test.identical( dst, [ -1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, [ 1 ] );
  test.identical( dst, [ [ 1 ], 1 ] );
  test.identical( got, 0 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependedOnce( dst, 4, onEqualize );
  test.identical( dst, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedOnce();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedOnce( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedOnce( 1, 1 );
  })
}

//

function __arrayPrependArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayPrependArray( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayPrependArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArray( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayPrependArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArray( [ 1, 2 ], 2 );
  });
};

//

function __arrayPrependArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });
}

//

/*function _arrayPrependArrayOnce( test )
{

  test.description = 'array';
  var got = _._arrayPrependArrayOnce([ 0,1 ], [ 2,3 ]);
  var expected = [ 2,3,0,1 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _._arrayPrependArrayOnce([ 1,1 ]);
  var expected = [ 1,1 ];
  test.identical( got,expected );

  test.description = 'number';
  var got = _._arrayPrependArrayOnce([ 1,2 ], 3, 5);
  var expected = [ 3,5,1,2 ];
  test.identical( got,expected );

  test.description = 'string';
  var got = _._arrayPrependArrayOnce([ 1,2 ], 'str1', 'str2');
  var expected = [ 'str1','str2',1,2 ];
  test.identical( got,expected );

  test.description = 'object';
  var got = _._arrayPrependArrayOnce( [ 1,2 ], { a: 1 }, { b: 2 } );
  var expected = [ { a: 1 },{ b: 2 },1,2 ];
  test.identical( got,expected );

  test.description = 'null';
  var got = _._arrayPrependArrayOnce([ 3,9 ], null);
  var expected = [ null,3,9 ];
  test.identical( got,expected );


  if( Config.debug )
  {

    test.description = 'first argument is not array';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce( 4,5 );
    });

    test.description = 'type of the argument is equal undefined';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce( [ 1,3 ], undefined );
    });


    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce();
    });

  }

}*/

//

function __arrayPrependArrayOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArrayOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArrayOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependArrayOnceStrictly( dst, [ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrayOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArrayOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnceStrictly();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnceStrictly( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnceStrictly( [ 1, 2 ], 2 );
  });

  test.description = 'one of elements is not unique';

  var dst = [ 1,2,3 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrayOnceStrictly( dst, [ 4, 5, 2 ] );
  })
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrayOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrayOnceStrictly( [ 1, 2 ], [ 2 ], 3 );
  });
}

//

function __arrayPrependedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayPrependedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 2, 4, 5, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArray( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArray( [ 1, 2 ], 2 );
  });

}

//

function __arrayPrependedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayPrependedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependedArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });
}

//__arrayPrepend*Arrays*

function __arrayPrependArrays( test )
{

  test.description = 'nothing';
  var got = _.__arrayPrependArrays( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayPrependArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  var dst = [];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4 ] ] ];
  var got = _.__arrayPrependArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4 ] ] );
  test.identical( got, dst );

  var dst = [];
  var insArray = [ 1, 2, 3 ]
  var got = _.__arrayPrependArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayPrependArrays( dst, insArray );
  test.identical( dst, [  'a', 1, { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayPrependArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrays( 1, [ 2 ] );
  });

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrays( [], 2 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArrays( [], [ 1 ], [ 2 ] );
  });
};

//

function __arrayPrependArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4 ], 5 ] ];
  var got = _.__arrayPrependArraysOnce( dst, insArray );
  test.identical( dst, [ [ 4 ], 5, 1, 2, 3, 4 ] );
  test.identical( got, dst );

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [ 2, 1, 3 ] );
  test.identical( dst, got );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 1, 2, 3 ], onEqualize );
  test.identical( got, [ 2, 1, 3 ] );
  test.identical( dst, got );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnce( [], [ 1, 2, 3 ], {} );
  });

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnce( [], 2 );
  });

}

//

function __arrayPrependArraysOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArraysOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ [ 'a' ],[ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayPrependArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  var dst = [ 0 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ];
  var got = _.__arrayPrependArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4, [ 5 ] ], 0 ] );
  test.identical( got, dst );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 4,5 ];
  var got = _.__arrayPrependArraysOnceStrictly( dst, [ 1, 2, 3 ], onEqualize )
  test.identical( got, [ 1, 2, 3, 4, 5 ] );
  test.identical( dst, got );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArraysOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnceStrictly();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnceStrictly( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnceStrictly( [], [ 1,2,3 ], {} );
  });

  var dst = [ 1, 2, 3 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArraysOnceStrictly( dst, [ 4, 2, 5 ] );
  })
  test.identical( dst, [ 4, 5, 1, 2, 3 ] )

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArraysOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArraysOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependArraysOnceStrictly( [], 2 );
  });
}

//

function __arrayPrependedArrays( test )
{
  test.description = 'nothing';
  var dst = [];
  var got = _.__arrayPrependedArrays( dst, [] );
  var expected = [ ];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayPrependedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependedArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, 2 );

  var dst = [];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4 ], 5 ] ];
  var got = _.__arrayPrependedArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4 ], 5 ] );
  test.identical( got, 5 );

  var dst = [];
  var got = _.__arrayPrependedArrays( dst, [ 1, 2, 3 ]);
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArrays( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayPrependedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, 2 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrays( 1, [ 2 ] );
  });

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrays( [], 2 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArrays( [], [ 1 ], [ 2 ] );
  });

}

//

function __arrayPrependedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayPrependedArraysOnce( dst, [] );
  var expected = [];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, 3 );

  var dst = [];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ];
  var got = _.__arrayPrependedArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4, [ 5 ] ] ] );
  test.identical( got, 4 );

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 2, 1, 3 ] );
  test.identical( got, 1 );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }
  var dst = [ 1, 3 ];
  var insArray = [ 1, 2, 3 ]
  var got = _.__arrayPrependedArraysOnce( dst, insArray, onEqualize );
  test.identical( dst, [ 2, 1, 3 ] );
  test.identical( got, 1 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependedArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArraysOnce( [], [ 1, 2, 3 ], [] )
  });

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.__arrayPrependedArraysOnce( [ 1 ], 2 );
  });

}

//

function __arrayAppend( test )
{
  test.description = 'simple';

  var got = _.__arrayAppend( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayAppend( [ 1 ], 1 );
  test.identical( got, [ 1, 1 ] );

  var got = _.__arrayAppend( [ 1 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.__arrayAppend( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3,3 ] );

  var got = _.__arrayAppend( [ 1 ], '1' );
  test.identical( got, [ 1, '1' ] );

  var got = _.__arrayAppend( [ 1 ], -1 );
  test.identical( got, [  1, -1 ] );

  var got = _.__arrayAppend( [ 1 ], [ 1 ] );
  test.identical( got, [  1,[ 1 ] ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayAppend();
  })

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppend( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayAppend( 1, 1 );
  })
}

//

function __arrayAppendOnce( test )
{
  test.description = 'simple';

  var got = _.__arrayAppendOnce( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayAppendOnce( [ 1 ], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayAppendOnce( [ 1 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.__arrayAppendOnce( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.__arrayAppendOnce( [ 1 ], '1' );
  test.identical( got, [ 1, '1' ] );

  var got = _.__arrayAppendOnce( [ 1 ], -1 );
  test.identical( got, [ 1, -1 ] );

  var got = _.__arrayAppendOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ 1, [ 1 ] ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendOnce( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendOnce();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.__arrayAppendOnce( 1, 1, 1 );
  })
}

//

// function _arrayAppendOnce( test )
// {
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [  ], 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'nothing to add';
//   var got = _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( 'wrong argument', 5 );
//     });
//
//   }
//
// }

//

function __arrayAppendOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendOnceStrictly( dst , 1 );
  test.identical( got, [ 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, 2 );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, '1' );
  test.identical( got, [ 1,'1' ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, -1 );
  test.identical( got, [ 1, -1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, [ 1 ] );
  test.identical( got, [ 1, [ 1 ] ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendOnceStrictly( dst,{ num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendOnceStrictly( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendOnceStrictly( 1, 1 );
  })

  test.description = 'ins already exists ion dst';

  test.shouldThrowError( function()
  {
    _.__arrayAppendOnceStrictly( [ 1 ], 1 );
  });

  test.shouldThrowError( function()
  {
     _.__arrayAppendOnceStrictly( [ 1,2,3 ], 3 );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
     _.__arrayAppendOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.__arrayAppendOnceStrictly( dst, { num : 1 }, onEqualize );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.__arrayAppendOnceStrictly( dst, 1, onEqualize );
  });
}

//

function __arrayAppended( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppended( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, 1 );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, 2 );
  test.identical( dst, [ 1, 2 ] );
  test.identical( got, 1 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppended( dst, 3 );
  test.identical( dst, [ 1,2,3,3 ] );
  test.identical( got, 3 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, '1' );
  test.identical( dst, [ 1, '1' ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, -1 );
  test.identical( dst, [ 1, -1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, [ 1 ] );
  test.identical( dst, [ 1, [ 1 ] ] );
  test.identical( got, 1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayAppended();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppended( [], 1, 1 );
  });

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayAppended( 1, 1 );
  });
}

//

function __arrayAppendedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, 2 );
  test.identical( dst, [ 1, 2 ] );
  test.identical( got, 1 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedOnce( dst, 3 );
  test.identical( dst, [ 1,2,3 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, '1' );
  test.identical( dst, [ 1,'1' ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, -1 );
  test.identical( dst, [ 1,-1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, [ 1 ] );
  test.identical( dst, [ 1,[ 1 ] ] );
  test.identical( got, 1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );
  test.identical( got, 3 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendedOnce( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );
  test.identical( got, 3 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedOnce();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedOnce( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedOnce( 1, 1, 1 );
  })
}

// //
//
// function __arrayAppendArray( test )
// {
//
//   test.description = 'nothing';
//   var got = _.__arrayAppendArray( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'an argument';
//   var got = _.__arrayAppendArray( [ 1, 2, undefined ] );
//   var expected = [ 1, 2, undefined ];
//   test.identical( got, expected );
//
//   test.description = 'an array';
//   var got = _.__arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
//   var expected = [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.__arrayAppendArray();
//   });
//
//   test.description = 'arguments[0] is wrong, has to be an array';
//   test.shouldThrowError( function()
//   {
//     _.__arrayAppendArray( 'wrong argument', 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
//   });
//
//   test.description = 'arguments[1] is undefined';
//   test.shouldThrowError( function()
//   {
//     _.__arrayAppendArray( [ 1, 2 ], undefined, false, { a : 1 }, 42, [ 3, 7, 13 ] );
//   });
//
// };

//

function __arrayAppendArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayAppendArray( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayAppendArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArray( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  1, 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayAppendArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArray( [ 1, 2 ], 2 );
  });
};

//

// function __arrayAppendArrayOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.__arrayAppendArrayOnce( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'an argument';
//   var got = _.__arrayAppendArrayOnce( [ 1, 2, undefined ] );
//   var expected = [ 1, 2, undefined ];
//   test.identical( got, expected );
//
//   test.description = 'an array';
//   var got = _.__arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
//   var expected = [ 1, 2, 'str', {}, 5 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayAppendArrayOnce();
//     });
//
//     test.description = 'arguments[0] is wrong, has to be an array';
//     test.shouldThrowError( function()
//     {
//       _.__arrayAppendArrayOnce( 'wrong argument', 'str', 2, {}, [ 'str', 5 ] );
//     });
//
//     test.description = 'arguments[3] is undefined';
//     test.shouldThrowError( function()
//     {
//       _.__arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, undefined, [ 'str', 5 ] );
//     });
//
//   }
//
// };

//

function __arrayAppendArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'appends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });

}

//

function __arrayAppendArrayOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArrayOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArrayOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArrayOnceStrictly( dst, [ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrayOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArrayOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnceStrictly();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnceStrictly( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnceStrictly( [ 1, 2 ], 2 );
  });

  test.description = 'one of elements is not unique';

  var dst = [ 1,2,3 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrayOnceStrictly( dst, [ 4, 5, 2 ] );
  })
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrayOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrayOnceStrictly( [ 1, 2 ], [ 2 ], 3 );
  });
}

//

function __arrayAppendedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayAppendedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 2, 4, 5 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArray( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendedArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2, ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArray( [ 1, 2 ], 2 );
  });
}

//

function __arrayAppendedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayAppendedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendedArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendedArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendedArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });

}

//

function __arrayAppendArrays( test )
{

  test.description = 'nothing';
  var got = _.__arrayAppendArrays( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayAppendArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 5 ] ] ]
  var got = _.__arrayAppendArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 1, 2, 3, [ 5 ] ] );
  test.identical( got, dst );

  test.description = 'arguments are not arrays';
  var dst = [];
  var got = _.__arrayAppendArrays( dst, [ 1, 2, 3 ]);
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayAppendArrays( dst, insArray );
  test.identical( dst, [  1, 'a', 1, { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayAppendArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrays( 1, [ 2 ] );
  });

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArrays( [], [ 1 ], [ 2 ] );
  });
};

//

function __arrayAppendArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayAppendArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 5 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ];
  var got = _.__arrayAppendArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 5, [ 4, [ 5 ] ], 6 ] );
  test.identical( got, dst );

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [ 1, 3, 2 ] );
  test.identical( dst, got );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 1, 2, 3 ], onEqualize )
  test.identical( got, [ 1, 3, 2 ] );
  test.identical( dst, got );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnce( [], [ 1, 2, 3 ], [] );
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnce( [], 1 );
  });

}

//

function __arrayAppendArraysOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArraysOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ [ 'a' ],[ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayAppendArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  var dst = [ 0 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ];
  var got = _.__arrayAppendArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 0, 1, 2, 3, [ 4, [ 5 ] ], 6 ] );
  test.identical( got, dst );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 4,5 ];
  var got = _.__arrayAppendArraysOnceStrictly( dst, [ 1, 2, 3 ], onEqualize );
  test.identical( got, [ 4, 5, 1, 2, 3 ] );
  test.identical( dst, got );

  test.description = 'ins has existing element';

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArraysOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnceStrictly();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnceStrictly( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnceStrictly( [], [ 1, 2, 3 ], [] )
  });

  var dst = [ 1, 2, 3 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArraysOnceStrictly( dst, [ 4, 2, 5 ] );
  })
  test.identical( dst, [ 1, 2, 3, 4, 5 ] )

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArraysOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArraysOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.__arrayAppendArraysOnceStrictly( [], 1 );
  });

}

//

function __arrayAppendedArrays( test )
{
  test.description = 'nothing';
  var dst = [];
  var got = _.__arrayAppendedArrays( dst, [] );
  var expected = [ ];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayAppendedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendedArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, 2 );

  var dst = [ 1, 2, 3 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, 5 ], 6 ] ];
  var got = _.__arrayAppendedArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 1, 2, 3, [ 4, 5 ], 6 ] );
  test.identical( got, 5 );

  test.description = 'arguments are not arrays';
  var dst = [];
  var got = _.__arrayAppendedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayAppendedArrays( dst, insArray );
  test.identical( dst, [  1, 'a', 1, { a : 1 }, { b : 2 } ] );
  test.identical( got, 4 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayAppendedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );
  test.identical( got, 2 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrays( 1, [ 2 ] );
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArrays( [], [ 1 ], [ 2 ] );
  });

}

//

function __arrayAppendedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayAppendedArraysOnce( dst, [] );
  var expected = [];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.__arrayAppendedArraysOnce( dst, insArray );
  test.identical( dst, [  1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 5 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ];
  var got = _.__arrayAppendedArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 5, [ 4, [ 5 ] ], 6 ] );
  test.identical( got, 2 );

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 3, 2 ] );
  test.identical( got, 1 );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1, 2, 3 ], onEqualize );
  test.identical( dst, [ 1, 3, 2 ] );
  test.identical( got, 1 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendedArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArraysOnce( [], [ 1, 2, 3 ], [] )
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendedArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.__arrayAppendedArraysOnce( [], 1 );
  });

}

//

function __arrayRemoveOnce( test )
{
  test.description = 'simple';

  var got = _.__arrayRemoveOnce( [], 1 );
  test.identical( got, [] );

  var got = _.__arrayRemoveOnce( [ 1 ], 1 );
  test.identical( got, [] );

  var got = _.__arrayRemoveOnce( [ 1,2,2 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.__arrayRemoveOnce( [ 1,3,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.__arrayRemoveOnce( [ 1 ], '1' );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveOnce( [ 1 ], -1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveOnce( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 2 },{ num : 3 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnce();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnce( 1, 1, 1 );
  })
}

//

// function __arrayRemoveOnce( test ) {
//
//   test.description = 'nothing';
//   var got = _.__arrayRemoveOnce( [  ], 2 );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'one element left';
//   var got = _.__arrayRemoveOnce( [ 2, 4 ], 4 );
//   var expected = [ 2 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.__arrayRemoveOnce( [ true, false, 6 ], true );
//   var expected = [ false, 6 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemoveOnce();
//   });
//
//   test.description = 'not enough arguments';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemoveOnce( [ 2, 4, 6 ] );
//   });
//
//   test.description = 'extra argument';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemoveOnce( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//   });
//
//   test.description = 'arguments[0] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemoveOnce( 'wrong argument', 2 );
//   });
//
//   test.description = 'arguments[2] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemoveOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
//   });
//
// };

//

function __arrayRemoveOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1,2,2 ];
  var got = _.__arrayRemoveOnceStrictly( dst, 2 );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveOnceStrictly( dst, { num : 3 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveOnceStrictly( dst, 3, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnceStrictly( 1, 1 );
  })

  test.description = 'ins not exists';

  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnceStrictly( [ 1 ], 2 );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
    _.__arrayRemoveOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.description = 'onEqualize';
  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

  test.shouldThrowError( function()
  {
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.__arrayRemoveOnceStrictly( dst, { num : 4 }, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


  test.shouldThrowError( function()
  {
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.__arrayRemoveOnceStrictly( dst, 4, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
}

//

// function _arrayRemoved( test )
// {
//
//   test.description = 'nothing';
//   var got = _._arrayRemoved( [  ], 2 );
//   var expected = 0;
//   test.identical( got, expected );
//
//   test.description = 'one element removed';
//   var got = _._arrayRemoved( [ 2, 4, 6 ], 4 );
//   var expected = 1;
//   test.identical( got, expected );
//
//   test.description = 'two elements removed';
//   var got = _._arrayRemoved( [ true, false, 6, true ], true );
//   var expected = 2;
//   test.identical( got, expected );
//
//   test.description = 'three elements removed';
//   var got = _._arrayRemoved( [ 2, 4, 6, 7 ], 2, function ( el, ins ) {
//     return el > ins;
//   });
//   var expected = 3;
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( [ 2, 4, 6 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( 'wrong argument', 2 );
//     });
//
//     test.description = 'arguments[2] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( [ 2, 4, 6 ], 2, 'wrong argument' );
//     });
//
//   }
//
// };

//

function __arrayRemovedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedOnce( dst, 1 );
  test.identical( dst, [ ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, 1 );
  test.identical( dst, [  ] );
  test.identical( got, 0 );

  var dst = [ 2,2,1 ];
  var got = _.__arrayRemovedOnce( dst, 2 );
  test.identical( dst, [ 2,1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, -1 );
  test.identical( dst, [  1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, [ 1 ] );
  test.identical( dst, [  1 ] );
  test.identical( got, -1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemovedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemovedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemovedOnce( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemovedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedOnce();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedOnce( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedOnce( 1, 1 );
  })
}

//

// function __arrayRemovedOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.__arrayRemovedOnce( [  ], 2 );
//   var expected = -1;
//   test.identical( got, expected );
//
//   test.description = 'second element removed';
//   var got = _.__arrayRemovedOnce( [ 2, 4, 6 ], 4 );
//   var expected = 1;
//   test.identical( got, expected );
//
//   test.description = 'first element removed';
//   var got = _.__arrayRemovedOnce( [ true, false, 6 ], true );
//   var expected = 0;
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemovedOnce();
//   });
//
//   test.description = 'not enough arguments';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemovedOnce( [ 2, 4, 6 ] );
//   });
//
//   test.description = 'extra argument';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemovedOnce( [ 2, 4, 6 ], 2, function( el ) { return el; }, 'redundant argument' );
//   });
//
//   test.description = 'arguments[0] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemovedOnce( 'wrong argument', 2 );
//   });
//
//   test.description = 'arguments[2] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.__arrayRemovedOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
//   });
//
// };

//

function __arrayRemoveArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayRemoveArray( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayRemoveArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArray( dst,[ 1,3 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemoveArray( dst, [ 1, 1 ] );
  test.identical( dst, [ ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayRemoveArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemoveArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArray( [ 1, 2 ], 2 );
  });
};

//

function __arrayRemoveArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayRemoveArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemoveArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemoveArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemoveArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemoveArrayOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, dst );
  });

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });
}

// function __arrayRemoveArrayOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.__arrayRemoveArrayOnce( [  ], [  ] );
//   var expected = 0;
//   test.identical( got, expected );
//
//   test.description = 'three elements left';
//   var got = _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
//   var expected = 2;
//   test.identical( got, expected );
//
//   test.description = 'one elements left';
//   var got = _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
//     return a < b;
//   } );
//   var expected = 4;
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'wrong type of arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce('wrong argument', 'wrong argument', 'wrong argument');
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) { return a < b }, 'redundant argument' );
//     });
//
//   }
//
// };

//

function __arrayRemoveArrayOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1,2,2 ];
  var got = _.__arrayRemoveArrayOnceStrictly( dst, [ 2 ] );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveArrayOnceStrictly( dst, [ { num : 3 } ], onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveArrayOnceStrictly( dst, [ 3 ], onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnceStrictly( 1, 1 );
  })

  test.description = 'ins not exists';

  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnceStrictly( [ 1 ], [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrayOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.description = 'onEqualize';
  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

  test.shouldThrowError( function()
  {
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.__arrayRemoveArrayOnceStrictly( dst, [ { num : 4 } ], onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


  test.shouldThrowError( function()
  {
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.__arrayRemoveArrayOnceStrictly( dst, [ 4 ], onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
}

//

function __arrayRemovedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArray( dst, [ 1 ] );
  test.identical( dst, [] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayRemovedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemovedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArray( [ 1, 2 ], 2 );
  });
}

//

function __arrayRemovedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemovedArrayOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, 0 );
  });

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });

}

//

function __arrayRemoveArrays( test )
{
  test.description = 'nothing';
  var got = _.__arrayRemoveArrays( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayRemoveArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArrays( dst,[ 1,3 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1, 2, 2, 2 ];
  var got = _.__arrayRemoveArrays( dst, [ [ 1 ], [ 2 ] ] );
  test.identical( dst, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.__arrayRemoveArrays( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, dst );

  var dst = [ 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemoveArrays( dst, insArray );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ [ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemoveArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, dst );

  var dst = [ [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.__arrayRemoveArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemoveArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArrays();
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayRemoveArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.__arrayRemoveArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function ()
  {
    _.__arrayRemoveArrays( [], [ 1 ], [ 1 ] );
  });

};

//

function __arrayRemoveArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayRemoveArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemoveArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemoveArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemoveArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 2, 3, 3, 4, 5, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray );
  test.identical( got, [ 1, 3, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 2, 2, 3, 4, 4, 5 ];
  var insArray = [ [ 1, 1 ], 2 , [ 3 ], 4, 4, [ 5 ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray );
  test.identical( got, [ 3, 4 ] );
  test.identical( got, dst );

  var dst = [ 5, 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray );
  test.identical( got, [ 5 ] );
  test.identical( got, dst );

  var dst = [ [ 5 ],[ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ],[ 5 ] ] );
  test.identical( got, dst );

  var dst = [ [ 5 ], [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ], [ 5 ] ] );
  test.identical( got, dst );

  function onEqualize( a, b ){ return a === b }
  var dst = [ 1, 2, [ 3 ] ];
  var insArray = [ 1, 2, [ 3 ] ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray, onEqualize );
  test.identical( got, [ [ 3 ] ]);
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemoveArraysOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, dst );
  });

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var insArray = [ [ { num : 3 } ], { num : 1 } ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray, onEqualize )
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var insArray = [ [ 3 ], 1  ];
  var got = _.__arrayRemoveArraysOnce( dst, insArray, onEqualize )
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnce( [  ], [ 1, 2, 3 ], [] )
  });

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.__arrayRemoveArraysOnce( [], 1 );
  });
}

//

function __arrayRemoveArraysOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1, 2, 2 ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, [ 2 ] );
  test.identical( got, [ 1, 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( got, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, insArray );
  test.identical( got, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, 3 ], [ 4 ], 5 ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, insArray );
  test.identical( got, [] );
  test.identical( got, dst );

  var dst = [ 5, 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, insArray );
  test.identical( got, [ 5 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var insArray = [ [ { num : 3 } ], { num : 1 }  ]
  var got = _.__arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize )
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var insArray = [ [ 3 ], 1  ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize );
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnceStrictly( 1, 1 );
  })

  test.description = 'ins not exists';

  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnceStrictly( [ 1 ], [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
    _.__arrayRemoveArraysOnceStrictly( [], [ 1, 2, 3 ], [] );
  });

  test.description = 'onEqualize';
  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

  test.shouldThrowError( function()
  {
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    var insArray = [ [ { num : 4 } ] ];
    _.__arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )

  test.shouldThrowError( function()
  {
    var onEqualize = function( a )
    {
      return a.num;
    }
    var insArray = [ [ 4 ] ];
    _.__arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
}

//

function __arrayRemovedArrays( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArrays( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArrays( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArrays( dst, [ 1 ] );
  test.identical( dst, [] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 4, 5];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.__arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], 2 , [ 3 ], 4, [ 5 ] ]
  var got = _.__arrayRemovedArrays( dst, insArray );
  test.identical( dst, [] );
  test.identical( got, 5 );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.__arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, 3 );

  var dst = [ 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemovedArrays( dst, insArray );
  test.identical( dst, [] );
  test.identical( got, 1 );

  var dst = [ [ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, 0 );

  var dst = [ [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.__arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, 0 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemovedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArrays();
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayRemovedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.__arrayRemovedArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function ()
  {
    _.__arrayRemovedArrays( [], [ 1 ], [ 1 ] );
  });
}

//

function __arrayRemovedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArraysOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 2, 3, 3, 4, 5, 5];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ]
  var got = _.__arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 3, 3, 4, 5 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 2, 2, 3, 4, 4, 5 ];
  var insArray = [ [ 1, 1 ], 2 , [ 3 ], 4, 4, [ 5 ] ];
  var got = _.__arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 2 ] );
  test.identical( got, 7 );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.__arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, 3 );

  var dst = [ 5, 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 5 ] );
  test.identical( got, 1 );

  var dst = [ [ 5 ],[ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.__arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ],[ 5 ] ] );
  test.identical( got, 0 );

  var dst = [ [ 5 ], [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.__arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ], [ 5 ] ] );
  test.identical( got, 0 );

  function onEqualize( a, b ){ return a === b }
  var dst = [ 1, 2, [ 3 ] ];
  var insArray = [ 1, 2, [ 3 ] ];
  var got = _.__arrayRemovedArraysOnce( dst, insArray, onEqualize );
  test.identical( dst, [ [ 3 ] ]);
  test.identical( got, 2 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemovedArraysOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, 0 );
  });

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedArraysOnce( [], [ 1, 2, 3 ], [] )
  });

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.__arrayRemovedArraysOnce( [], 1 );
  });
}

//

function __arrayRemoveAll( test )
{
  test.description = 'simple';

  var got = _.__arrayRemoveAll( [], 1 );
  test.identical( got, [] );

  var got = _.__arrayRemoveAll( [ 1 ], 1 );
  test.identical( got, [ ] );

  var got = _.__arrayRemoveAll( [ 1,2,2,2 ], 2 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveAll( [ 1 ], '1' );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveAll( [ 1 ], -1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveAll( [ 1 ], [ 1 ] );
  test.identical( got, [ 1 ] );

  function onEqualize( a, b )
  {
    return a.value === b;
  }
  var got = _.__arrayRemoveAll( [ { value : 1 }, { value : 1 }, { value : 2 } ], 1, onEqualize );
  test.identical( got, [ { value : 2 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveAll();
  })

  test.description = 'third argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveAll( [ 1 ], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveAll( 1, 1 );
  })
}

//

// function arrayRemoveAll( test ) {
//
//   test.description = 'nothing';
//   var got = _.arrayRemoveAll( [  ], 2 );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'one element left';
//   var got = _.arrayRemoveAll( [ 2, 4 ], 4 );
//   var expected = [ 2 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveAll( [ true, false, 6 ], true );
//   var expected = [ false, 6 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveAll( [ 2, 1, 4, 6 ], 2, function ( el, ins ) {
//     return el > ins;
//   });
//   var expected = [ 2, 1 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( 'wrong argument', 2 );
//     });
//
//     test.description = 'arguments[2] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ], 2, 'wrong argument' );
//     });
//
//   }
//
// }

//

function __arrayRemovedAll( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedAll( dst, 1 );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedAll( dst, 1 );
  test.identical( dst, [] );
  test.identical( got, 1 );

  var dst = [ 1,2,2 ];
  var got = _.__arrayRemovedAll( dst, 2 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 2 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedAll( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedAll( dst, -1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedAll( dst, [ 1 ] );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  function onEqualize( a, b )
  {
    return a.value === b;
  }
  var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
  var got = _.__arrayRemovedAll( dst, 1, onEqualize );
  test.identical( dst, [ { value : 2 } ] );
  test.identical( got, 2 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedAll();
  })

  test.description = 'third argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayRemoveAll( [ 1 ], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.__arrayRemovedAll( 1, 1 );
  })
}

//

function __arrayFlatten( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.__arrayFlatten( [], [] );
  test.identical( got, [] );

  var got  = _.__arrayFlatten( [], [ 1, 2, 3 ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [], [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [], [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [], [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( got, [ 1 ] );

  test.description = 'make array flat, dst is not empty';

  var got  = _.__arrayFlatten( [ 1, 2, 3 ], [ 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlatten( [ 1, 2, 3 ], [ 1, 2, 3 ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [ 1, 2, 3 ],[ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [ 1, 2, 3 ],[ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [ 1 ],[ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( got, [ 1, 1 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.__arrayFlatten
  (
    [],
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 2, 3, 4 ] );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayFlatten();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlatten( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlatten( [], 1 );
  });
}

//

function __arrayFlattenOnce( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.__arrayFlattenOnce( [], [] );
  test.identical( got, [] );

  var got  = _.__arrayFlattenOnce( [], [ 1, 1, 2, 2, 3 , 3 ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlattenOnce( [], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlattenOnce( [], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlattenOnce( [], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  test.identical( got, [ 1 ] );

  test.description = 'make array flat, dst is not empty';

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3, 4 ], [ 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3 ], [ 1, 2, 3, [ [ 4 ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3 ],[ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3 ],[ [ 1, [ 2, [ 3 ] ] ], 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1 ],[ [ [ [ [ 1, 1, 1 ] ] ] ] ]  );
  test.identical( got, [ 1 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.__arrayFlattenOnce
  (
    [ 1, 4 ],
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 4, 2, 3 ] );

  test.description = 'onEqualize';
  var got  = _.__arrayFlattenOnce( [ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnce();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnce( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnce( [], 1 );

  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnce( [], [ 1 ], [] );
  });
}

//

function __arrayFlattenOnceStrictly( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.__arrayFlattenOnceStrictly( [], [] );
  test.identical( got, [] );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ 1, 2, 3, 4 ] )
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ]  ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ [ 1, [ 2, [ 3 ], 4 ] ]  ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ 1, [ 2, [ [ 3, [ 4 ] ] ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  test.description = 'make array flat, dst is not empty';

  var got  = _.__arrayFlattenOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ] );
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  var got  = _.__arrayFlattenOnceStrictly( [ 1, 2, 3 ], [ [ [ 4 ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnceStrictly( [ 1 ], [ [ [ [ [ 0, 2, 3 ] ] ] ] ]  );
  test.identical( got, [ 1, 0, 2, 3 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.__arrayFlattenOnceStrictly
  (
    [ 1, 4 ],
    [
      [ [ 2 ] ],
      [ 3, [ [ [ 5 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 4, 2, 3, 5 ] );

  test.description = 'onEqualize';
  var got  = _.__arrayFlattenOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( [], 1 );

  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( [], [ 1 ], [] );
  });

  var dst = [];
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( dst, [ 1, 1, 2, 2, 3, 3 ] )
  });
  test.identical( dst, [ 1, 2, 3 ] );

  var dst = [];
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( dst, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  });
  test.identical( dst, [ 1, 2, 3 ] );

  var dst = [];
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( dst, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  });
  test.identical( dst, [ 1, 2, 3 ] );

  var dst = [];
  test.shouldThrowError( function()
  {
    _.__arrayFlattenOnceStrictly( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  });
  test.identical( dst, [ 1 ] );
}

//

function __arrayFlattened( test )
{
  test.description = 'make array flat, dst is empty';

  var dst = [];
  var got  = _.__arrayFlattened( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ 1, 2, 3 ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( dst, [ 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat, dst is not empty';

  var dst = [ 1, 2, 3 ];
  var got  = _.__arrayFlattened( dst, [ 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got  = _.__arrayFlattened( dst, [ 1, 2, 3 ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattened( dst, [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattened( dst, [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1 ];
  var got = _.__arrayFlattened( dst, [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat from multiple arrays as one arg';

  var dst = [];
  var got = _.__arrayFlattened
  (
    dst,
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 4 );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayFlattened();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattened( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattened( [], 1 );
  });
}

//

function __arrayFlattenedOnce( test )
{
  test.description = 'make array flat, dst is empty';

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 1, 2, 2, 3 , 3 ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  test.identical( dst, [ 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat, dst is not empty';

  var dst = [ 1, 2, 3, 4 ];
  var got = _.__arrayFlattenedOnce( dst, [ 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 2, 3, [ [ 4 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1, [ 2, [ 3 ] ] ], 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayFlattenedOnce( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  test.description = 'dst contains some inner arrays';

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 2, 3 ]  );
  test.identical( dst, [ [ 1 ], [ 2 ], [ 3 ], 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'make array flat from multiple arrays as one arg';

  var dst = [ 1, 4 ];
  var got  = _.__arrayFlattenedOnce
  (
    dst,
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( dst, [ 1, 4, 2, 3 ] );
  test.identical( got, 2 );

  test.description = 'onEqualize';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 4, 2, 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 1 );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenedOnce();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenedOnce( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenedOnce( [], 1 );

  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayFlattenedOnce( [], [ 1 ], [] );
  });
}

//

function arrayFlatten2( test )
{

  test.description = 'array of the passed arguments';
  var got = _.__arrayFlatten( [],[ 'str', {}, [ 1, 2 ], 5, true ] );
  var expected = [ 'str', {}, 1, 2, 5, true ];
  test.identical( got, expected );

  test.description = 'without undefined';
  var got = _.__arrayFlatten( [ 1, 2, 3 ], [ 13, 'abc', null ] );
  var expected = [ 1, 2, 3, 13, 'abc', null ];
  test.identical( got, expected );

  test.description = 'bad arguments'; //

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.__arrayFlatten() );
  test.shouldThrowError( () => _.__arrayFlatten( [] ) );
  test.shouldThrowError( () => _.__arrayFlatten( [ 1, 2 ], 13, 'abc', {} ) );
  test.shouldThrowError( () => _.__arrayFlatten( [ 1, 2, 3 ], [ 13, 'abc', undefined, null ] ) );

}

//

function __arrayReplaceOnce( test )
{

  test.description = 'nothing';
  var got = _.__arrayReplaceOnce( [  ], 0, 0 );
  var expected = [];
  test.identical( got, expected );

  test.description = 'second element';
  var got = _.__arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
  var expected = [ 1,2,3,4,5 ] ;
  test.identical( got, expected );

  test.description = 'third element';
  var got = _.__arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
  var expected = [ 'Petre', 'Mikle', 'Oleg', 'Bob' ];
  test.identical( got, expected );

  test.description = 'fourth element';
  var got = _.__arrayReplaceOnce( [ true, true, true, true, false ], false, true );
  var expected = [ true, true, true, true, true ];
  test.identical( got, expected );

  test.description = 'element not exists';
  var got = _.__arrayReplaceOnce( [ 1,2,3 ], [ 1 ], [ 4 ] );
  var expected = [ 1,2,3 ];
  test.identical( got, expected );

  test.description = 'equalize';
  function onEqualize( a, b )
  {
    return a === b[ 0 ];
  }
  var got = _.__arrayReplaceOnce( [ 1,2,3 ], [ 1 ], [ 4 ], onEqualize );
  var expected = [ [ 4 ],2,3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnce();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ] );
  });

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnce( 'wrong argument', undefined, 3 );
  });
}

//

function __arrayReplaceOnceStrictly( test )
{

  test.description = 'second element';
  var got = _.__arrayReplaceOnceStrictly( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
  var expected = [ 1,2,3,4,5 ] ;
  test.identical( got, expected );

  test.description = 'third element';
  var got = _.__arrayReplaceOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
  var expected = [ 'Petre', 'Mikle', 'Oleg', 'Bob' ];
  test.identical( got, expected );

  test.description = 'fourth element';
  var got = _.__arrayReplaceOnceStrictly( [ true, true, true, true, false ], false, true );
  var expected = [ true, true, true, true, true ];
  test.identical( got, expected );

  test.description = 'equalize';
  function onEqualize( a, b )
  {
    return a === b[ 0 ];
  }
  var got = _.__arrayReplaceOnceStrictly( [ 1,2,3 ], [ 1 ], [ 4 ], onEqualize );
  var expected = [ [ 4 ],2,3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnceStrictly();
  });

  test.description = 'nothing';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnceStrictly( [], 0, 0 );
  });

  test.description = 'element not exists';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnceStrictly( [ 1,2,3 ], [ 1 ], [ 4 ] );
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnceStrictly( [ 1, 2, undefined, 4, 5 ] );
  });

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnceStrictly( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceOnceStrictly( 'wrong argument', undefined, 3 );
  });
}

//

function __arrayReplacedOnce( test )
{

  test.description = 'nothing';
  var dst = [];
  var got = _.__arrayReplacedOnce( dst, 0, 0 );
  test.identical( dst, [] );
  test.identical( got, -1 );

  test.description = 'second element';
  var dst = [ 1, undefined, 3, 4, 5 ];
  var got = _.__arrayReplacedOnce( dst, undefined, 2 );
  var expected = [ 1,2,3,4,5 ] ;
  test.identical( dst, expected );
  test.identical( got, 1 );

  test.description = 'third element';
  var dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
  var got = _.__arrayReplacedOnce( dst, 'Dmitry', 'Bob' );
  var expected = [ 'Petre', 'Mikle', 'Oleg', 'Bob' ];
  test.identical( dst, expected );
  test.identical( got, 3 );

  test.description = 'fourth element';
  var dst = [ true, true, true, true, false ];
  var got = _.__arrayReplacedOnce( dst, false, true );
  var expected = [ true, true, true, true, true ];
  test.identical( dst, expected );
  test.identical( got, 4 );

  test.description = 'element not exists';
  var dst = [ 1,2,3 ];
  var got = _.__arrayReplacedOnce( dst, [ 1 ], [ 4 ] );
  var expected = [ 1,2,3 ];
  test.identical( dst, expected );
  test.identical( got, -1 );

  test.description = 'equalize';
  function onEqualize( a, b )
  {
    return a === b[ 0 ];
  }
  var dst = [ 1,2,3 ];
  var got = _.__arrayReplacedOnce( dst, [ 1 ], [ 4 ], onEqualize );
  var expected = [ [ 4 ],2,3 ];
  test.identical( dst, expected );
  test.identical( got,0 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedOnce();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedOnce( [ 1, 2, undefined, 4, 5 ] );
  });

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedOnce( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedOnce( 'wrong argument', undefined, 3 );
  });
}

//

function __arrayReplaceArrayOnce( test )
{
  test.description = 'replace elements from ins with sub';

  var dst = [];
  var got = _.__arrayReplaceArrayOnce( dst, [], [] );
  test.identical( got, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnce( dst, [ 1 ], 2 );
  test.identical( got, [ 2, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnce( dst, [ 1, 2 ], 3);
  test.identical( got, [ 3, 3, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnce( dst, [ 1, 0, 4 ], 3 );
  test.identical( got, [ 3, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnce( dst, [ 1, 0, 4 ], [ 3 ] );
  test.identical( got, [ [ 3 ], 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnce( dst, [ undefined ], 0 );
  test.identical( got, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'onEqualize'

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b;
  }
  var got = _.__arrayReplaceArrayOnce( dst, [ 1 ], 0, onEqualize );
  test.identical( got, [ 0, [ 2 ], [ 3 ] ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnce( 1, [ 1 ], 1 );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnce( [ 1, 2 ], 1, 1 );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnce( [ 1, 2 ], [ 1 ], 1, 1 );
  })
}

//

function __arrayReplaceArrayOnceStrictly( test )
{
  test.description = 'nothing replaced';
  var got = _.__arrayReplaceArrayOnceStrictly( [], [], [] );
  test.identical( got, [] );

  //

  test.description = 'replace elements from ins with sub';

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnceStrictly( dst, [ 1 ], 2 );
  test.identical( got, [ 2, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnceStrictly( dst, [ 1, 2 ], 3);
  test.identical( got, [ 3, 3, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArrayOnceStrictly( dst, [ 1, 2 ], [ 3 ]);
  test.identical( got, [ [ 3 ], [ 3 ], 3 ] );
  test.identical( got, dst );

  test.description = 'onEqualize'

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b;
  }
  var got = _.__arrayReplaceArrayOnceStrictly( dst, [ 1 ], 0, onEqualize );
  test.identical( got, [ 0, [ 2 ], [ 3 ] ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnceStrictly();
  })

  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.__arrayReplaceArrayOnceStrictly( dst, [ undefined ], 0 );
  })

  test.description = 'only one replaced';
  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.__arrayReplaceArrayOnceStrictly( dst, [ 1, 0, 4 ], 3 );
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnceStrictly( 1, [ 1 ], 1 );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnceStrictly( [ 1, 2 ], 1, 1 );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArrayOnceStrictly( [ 1, 2 ], [ 1 ], 1, 1 );
  })
}

//

function __arrayReplacedArrayOnce( test )
{
  test.description = 'replace elements from ins with sub';

  var dst = [];
  var got = _.__arrayReplacedArrayOnce( dst, [], [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArrayOnce( dst, [ 1 ], 2 );
  test.identical( dst, [ 2, 2, 3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArrayOnce( dst, [ 1, 2 ], 3);
  test.identical( dst, [ 3, 3, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArrayOnce( dst, [ 1, 0, 4 ], 3 );
  test.identical( dst, [ 3, 2, 3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArrayOnce( dst, [ 1, 0, 4 ], [ 3 ] );
  test.identical( dst, [ [ 3 ], 2, 3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArrayOnce( dst, [ undefined ], 0 );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 0 );

  test.description = 'onEqualize'

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b;
  }
  var got = _.__arrayReplacedArrayOnce( dst, [ 1 ], 0, onEqualize );
  test.identical( dst, [ 0, [ 2 ], [ 3 ] ] );
  test.identical( got, 1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArrayOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArrayOnce( 1, [ 1 ], 1 );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArrayOnce( [ 1, 2 ], 1, 1 );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArrayOnce( [ 1, 2 ], [ 1 ], 1, 1 );
  })
}

//

function __arrayReplaceArraysOnce( test )
{
  test.description = 'replace elements from arrays from ins with relevant values from sub';

  var dst = [];
  var got = _.__arrayReplaceArraysOnce( dst, [ [] ], [ [] ] );
  test.identical( got, [] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
  test.identical( got, [ 3, 4, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ [ 1 ] ] ], [ 0 ] );
  test.identical( got, [ 1, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnce( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
  test.identical( got, [ 0, 2, 0 ] );

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b[ 0 ];
  }
  var got = _.__arrayReplaceArraysOnce( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
  test.identical( got, [ [ 0 ], [ 0 ], [ 0 ] ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( 1, [ [ 1 ] ], [ 1 ] );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( [ 1, 2 ], 1, [ 1 ] );
  })

  test.description = 'ins must be array of arrays';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( [ 1, 2 ],[ 1 ], [ 1 ] );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
  })

  test.description = 'ins and sub length are different';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
  })

  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
  })

  test.description = 'ins[ 0 ] and sub[ 0 ] length are different';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnce( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
  })
}

//

function __arrayReplaceArraysOnceStrictly( test )
{
  test.description = 'replace elements from arrays from ins with relevant values from sub';

  var dst = [];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [] ], [ [] ] );
  test.identical( got, [] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
  test.identical( got, [ 3, 4, 3 ] );

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b[ 0 ];
  }
  var got = _.__arrayReplaceArraysOnceStrictly( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
  test.identical( got, [ [ 0 ], [ 0 ], [ 0 ] ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly();
  })

  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.__arrayReplaceArraysOnceStrictly( dst, [ [ [ 1 ] ] ], [ 0 ] );
  })

  test.description = 'one element is not replaced';
  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.__arrayReplaceArraysOnceStrictly( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( 1, [ [ 1 ] ], [ 1 ] );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( [ 1, 2 ], 1, [ 1 ] );
  })

  test.description = 'ins must be array of arrays';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( [ 1, 2 ],[ 1 ], [ 1 ] );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
  })

  test.description = 'ins and sub length are different';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
  })

  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
  })

  test.description = 'ins[ 0 ] and sub[ 0 ] length are different';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
  })
}

//

function __arrayReplacedArraysOnce( test )
{
  test.description = 'replace elements from arrays from ins with relevant values from sub';

  var dst = [];
  var got = _.__arrayReplacedArraysOnce( dst, [ [] ], [ [] ] );
  test.identical( got, 0 );
  test.identical( dst, [] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1 ] ], [ [ 3 ] ] );
  test.identical( got, 1 );
  test.identical( dst, [ 3, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
  test.identical( got, 3 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
  test.identical( got, 3 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
  test.identical( got, 3 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 4, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ [ 1 ] ] ], [ 0 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedArraysOnce( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
  test.identical( dst, [ 0, 2, 0 ] );
  test.identical( got, 2 );

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b[ 0 ];
  }
  var got = _.__arrayReplacedArraysOnce( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
  test.identical( dst, [ [ 0 ], [ 0 ], [ 0 ] ] );
  test.identical( got, 3 );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( 1, [ [ 1 ] ], [ 1 ] );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( [ 1, 2 ], 1, [ 1 ] );
  })

  test.description = 'ins must be array of arrays';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( [ 1, 2 ],[ 1 ], [ 1 ] );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
  })

  test.description = 'ins and sub length are different';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
  })

  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
  })

  test.description = 'ins[ 0 ] and sub[ 0 ] length are different';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedArraysOnce( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
  })
}

//

function __arrayReplaceAll( test )
{
  test.description = 'replace all ins with sub';

  var dst = [];
  var got = _.__arrayReplaceAll( dst, undefined, 0 );
  test.identical( got, [] );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayReplaceAll( dst, 1, 0 );
  test.identical( got, [ 0, 0, 0 ] );

  var dst = [ 1, 2, 1 ];
  var got = _.__arrayReplaceAll( dst, 1, 0 );
  test.identical( got, [ 0, 2, 0 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplaceAll( dst, 4, 0 );
  test.identical( got, [ 1, 2, 3 ] );

  function onEqualize( a, b )
  {
    return a.value === b;
  }

  var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
  var got = _.__arrayReplaceAll( dst, 1, { value : 0 }, onEqualize );
  test.identical( got, [ { value : 0 }, { value : 0 }, { value : 2 } ] );

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceAll( );
  })

  test.description = 'first arg is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceAll( 1, 1, 1 );
  })

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplaceAll( 1, 1, 1, 1);
  })
}

//

function __arrayReplacedAll( test )
{
  test.description = 'replace all ins with sub';

  var dst = [];
  var got = _.__arrayReplacedAll( dst, undefined, 0 );
  test.identical( got, 0 );
  test.identical( dst, [] );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayReplacedAll( dst, 1, 0 );
  test.identical( got, 3 );
  test.identical( dst, [ 0, 0, 0 ] );

  var dst = [ 1, 2, 1 ];
  var got = _.__arrayReplacedAll( dst, 1, 0 );
  test.identical( got, 2 );
  test.identical( dst, [ 0, 2, 0 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayReplacedAll( dst, 4, 0 );
  test.identical( got, 0 );
  test.identical( dst, [ 1, 2, 3 ] );

  function onEqualize( a, b )
  {
    return a.value === b;
  }

  var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
  var got = _.__arrayReplacedAll( dst, 1, { value : 0 }, onEqualize );
  test.identical( got, 2 );
  test.identical( dst, [ { value : 0 }, { value : 0 }, { value : 2 } ] );

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedAll( );
  })

  test.description = 'first arg is not arrayLike';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedAll( 1, 1, 1 );
  })

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.__arrayReplacedAll( 1, 1, 1, 1);
  })
}

//

function arrayUpdate( test )
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

  if( !Config.debug )
  return;

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

//

function arraySetContainAll( test )
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

  test.description = 'empty';
  var got = _.arraySetContainAll( [ 1,2,3 ], [] );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

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

};

//

function arraySetContainSomething( test )
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

  if( !Config.debug )
  return;

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

};

//

function arrayOrNumber( test )
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

  if( !Config.debug )
  return;

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

};

//

function arrayElementsSwap( test )
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

  if( !Config.debug )
  return;

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

};

//

function arraySame( test )
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
  function src1() {
    return arguments;
  }( 3, 7, 13 );
  function src2() {
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

  if( !Config.debug )
  return;

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

};

//

// function arrayNewOfSameLength( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayNewOfSameLength( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'length = 3';
//   var got = _.arrayNewOfSameLength( [ 1, 2, 3 ] );
//   var expected = [ , , , ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayNewOfSameLength();
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayNewOfSameLength( [ 1, 2, 3 ], 'redundant argument' );
//     });
//
//     test.description = 'argument is not wrapped into array';
//     test.shouldThrowError( function()
//     {
//       _.arrayNewOfSameLength( 1, 2, 3 );
//     });
//
//   }
//
// };

//

var Self =
{

  name : 'wTools.array',
  // verbosity : 9,
  // barringConsole : 0,

  tests :
  {
    // buffer

    bufferRelen : bufferRelen,
    bufferRetype : bufferRetype,
    bufferRawFromBuffer : bufferRawFromBuffer,

    // type test

    arrayIs : arrayIs,
    arrayLike : arrayLike,
    hasLength : hasLength,

    // array maker

    arrayMakeSimilar : arrayMakeSimilar,
    arrayMakeRandom : arrayMakeRandom,
    arrayFromRange : arrayFromRange,
    arrayFrom : arrayFrom,
    arrayAs : arrayAs,

    arrayToMap : arrayToMap,
    arrayToStr : arrayToStr,

    // array transformer

    arraySub : arraySub,
    arrayGrow : arrayGrow,
    arraySlice : arraySlice,
    arrayDuplicate : arrayDuplicate,

    arrayMask : arrayMask,

    arraySelect : arraySelect,

    // array manipulator

    arrayCutin : arrayCutin,
    arrayPut : arrayPut,
    arrayFill : arrayFill,

    arraySupplement : arraySupplement,
    arrayExtendScreening : arrayExtendScreening,

    // array sequential search

    arrayLeftIndexOf : arrayLeftIndexOf,

    arrayLeft : arrayLeft,

    arrayCount : arrayCount,
    arrayCountUnique : arrayCountUnique,

    // array checker

    arrayCompare : arrayCompare,

    arrayHasAny : arrayHasAny,

    // array etc

    arraySum : arraySum,

    // array prepend

    __arrayPrepend : __arrayPrepend,
    __arrayPrependOnce : __arrayPrependOnce,
    __arrayPrependOnceStrictly : __arrayPrependOnceStrictly,
    __arrayPrepended : __arrayPrepended,
    __arrayPrependedOnce : __arrayPrependedOnce,

    __arrayPrependArray : __arrayPrependArray,
    __arrayPrependArrayOnce : __arrayPrependArrayOnce,
    __arrayPrependArrayOnceStrictly : __arrayPrependArrayOnceStrictly,
    __arrayPrependedArray : __arrayPrependedArray,
    __arrayPrependedArrayOnce : __arrayPrependedArrayOnce,

    __arrayPrependArrays : __arrayPrependArrays,
    __arrayPrependArraysOnce : __arrayPrependArraysOnce,
    __arrayPrependArraysOnceStrictly : __arrayPrependArraysOnceStrictly,
    __arrayPrependedArrays : __arrayPrependedArrays,
    __arrayPrependedArraysOnce : __arrayPrependedArraysOnce,

    // array append

    __arrayAppend : __arrayAppend,
    __arrayAppended : __arrayAppended,
    __arrayAppendOnce : __arrayAppendOnce,
    __arrayAppendedOnce : __arrayAppendedOnce,
    __arrayAppendOnceStrictly : __arrayAppendOnceStrictly,

    __arrayAppendArray : __arrayAppendArray,
    __arrayAppendedArray : __arrayAppendedArray,
    __arrayAppendArrayOnce : __arrayAppendArrayOnce,
    __arrayAppendedArrayOnce : __arrayAppendedArrayOnce,
    __arrayAppendArrayOnceStrictly : __arrayAppendArrayOnceStrictly,

    __arrayAppendArrays : __arrayAppendArrays,
    __arrayAppendArraysOnce : __arrayAppendArraysOnce,
    __arrayAppendArraysOnceStrictly : __arrayAppendArraysOnceStrictly,
    __arrayAppendedArrays : __arrayAppendedArrays,
    __arrayAppendedArraysOnce : __arrayAppendedArraysOnce,

    // array remove

    __arrayRemoveOnce : __arrayRemoveOnce,
    // _arrayRemoved : _arrayRemoved,
    __arrayRemovedOnce : __arrayRemovedOnce,
    __arrayRemoveOnceStrictly : __arrayRemoveOnceStrictly,

    __arrayRemoveArray : __arrayRemoveArray,
    __arrayRemovedArray : __arrayRemovedArray,
    __arrayRemoveArrayOnce : __arrayRemoveArrayOnce,
    __arrayRemovedArrayOnce : __arrayRemovedArrayOnce,
    __arrayRemoveArrayOnceStrictly : __arrayRemoveArrayOnceStrictly,

    __arrayRemoveArrays : __arrayRemoveArrays,
    __arrayRemovedArrays : __arrayRemovedArrays,
    __arrayRemoveArraysOnce : __arrayRemoveArraysOnce,
    __arrayRemovedArraysOnce : __arrayRemovedArraysOnce,
    __arrayRemoveArraysOnceStrictly : __arrayRemoveArraysOnceStrictly,

    __arrayRemoveAll : __arrayRemoveAll,
    // arrayRemoveAll : arrayRemoveAll,
    __arrayRemovedAll : __arrayRemovedAll,

    // array flatten

    __arrayFlatten : __arrayFlatten,
    __arrayFlattenOnce : __arrayFlattenOnce,
    __arrayFlattenOnceStrictly : __arrayFlattenOnceStrictly,
    __arrayFlattened : __arrayFlattened,
    __arrayFlattenedOnce : __arrayFlattenedOnce,

    arrayFlatten2 : arrayFlatten2,

    // array replace

    __arrayReplaceOnce : __arrayReplaceOnce,
    __arrayReplaceOnceStrictly : __arrayReplaceOnceStrictly,
    __arrayReplacedOnce : __arrayReplacedOnce,

    __arrayReplaceArrayOnce : __arrayReplaceArrayOnce,
    __arrayReplaceArrayOnceStrictly : __arrayReplaceArrayOnceStrictly,
    __arrayReplacedArrayOnce : __arrayReplacedArrayOnce,

    __arrayReplaceArraysOnce : __arrayReplaceArraysOnce,
    __arrayReplaceArraysOnceStrictly : __arrayReplaceArraysOnceStrictly,
    __arrayReplacedArraysOnce : __arrayReplacedArraysOnce,

    __arrayReplaceAll : __arrayReplaceAll,
    __arrayReplacedAll : __arrayReplacedAll,

    arrayUpdate : arrayUpdate,

    // array set

    arraySetContainAll: arraySetContainAll,
    arraySetContainSomething : arraySetContainSomething,

    // arrayOrNumber : arrayOrNumber, /* deprecated? */

    // arrayElementsSwap : arrayElementsSwap, /* deprecated? */

    // arraySame : arraySame,/* deprecated? */
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
