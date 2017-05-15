( function Map_test_s( ) {

'use strict';

/*

 to run this test
 from the project directory run

 npm install
 node ./staging/z.test/Map.test.s

 */

if( typeof module !== 'undefined' )
{

  //if( typeof wBase === 'undefined' )
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

//

function mapKeys( test )
{
  test.description = 'simple';

  var got = _.mapKeys( {} );
  var expected = [];

  var got = _.mapKeys( { a : 7, b : 13 } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.mapKeys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ '3', '7', '13' ];
  test.identical( got, expected );

  var f = function(){};
  Object.setPrototypeOf( f, String );
  f.a = 1;
  var got = _.mapKeys( f );
  var expected = [ 'a' ];
  test.identical( got, expected );

  var got = _.mapKeys( new Date );
  var expected = [ ];
  test.identical( got, expected );

  //

  test.description = 'options';
  var a = { a : 1 }
  var b = { b : 2 }
  Object.setPrototypeOf( a, b );

  /* own off */

  var got = _.mapKeys( a );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  /* own on */

  var o = { own : 1 };
  var got = _.mapKeys.call( o, a );
  var expected = [ 'a' ];
  test.identical( got, expected );

  /* enumerable/own off */

  var o = { enumerable : 0, own : 0 };
  Object.defineProperty( b, 'x', { enumerable : 0 } );
  var got = _.mapKeys.call( o, a );
  var expected = _.mapAllKeys( a );
  test.identical( got, expected );

  /* enumerable off, own on */

  var o = { enumerable : 0, own : 1 };
  Object.defineProperty( a, 'x', { enumerable : 0 } );
  var got = _.mapKeys.call( o, a );
  var expected = [ 'a', 'x' ]
  test.identical( got, expected );

  //

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapKeys();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapKeys( 'wrong arguments' );
    });

    test.description = 'unknown option';
    test.shouldThrowError( function()
    {
      _.mapKeys.call( { x : 1 }, {} )
    });
  }

};

//

function mapOwnKeys( test )
{
  test.description = 'empty'
  var got = _.mapOwnKeys( {} );
  var expected = [];
  test.identical( got, expected )

  //

  test.description = 'simplest'

  var got = _.mapOwnKeys( { a : '1', b : '2' } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected )

  var got = _.mapOwnKeys( new Date );
  var expected = [ ];
  test.identical( got, expected )

  //

  test.description = ''

  var a = { a : 1 };
  var b = { b : 2 };
  var c = { c : 3 };
  Object.setPrototypeOf( a, b );
  Object.setPrototypeOf( b, c );

  var got = _.mapOwnKeys( a );
  var expected = [ 'a' ];
  test.identical( got, expected )

  var got = _.mapOwnKeys( b );
  var expected = [ 'b' ];
  test.identical( got, expected )

  var got = _.mapOwnKeys( c );
  var expected = [ 'c' ];
  test.identical( got, expected );

  //

  test.description = 'enumerable on/off';
  var a = { a : '1' };

  var got = _.mapOwnKeys( a );
  var expected = [ 'a' ]
  test.identical( got, expected );

  Object.defineProperty( a, 'x', { enumerable : false } );
  var o = { enumerable : 0 };
  var got = _.mapOwnKeys.call( o, a );
  var expected = [ 'a', 'x' ]
  test.identical( got, expected );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function ()
    {
      _.mapOwnKeys();
    })

    test.description = 'invalid type';
    test.shouldThrowError( function ()
    {
      _.mapOwnKeys( 1 );
    })

    test.description = 'unknown option';
    test.shouldThrowError( function ()
    {
      _.mapOwnKeys.call( { own : 0 }, {} );
    })
  }

}

//

function mapAllKeys( test )
{
  var _expected =
  [
    "__defineGetter__",
    "__defineSetter__",
    "hasOwnProperty",
    "__lookupGetter__",
    "__lookupSetter__",
    "propertyIsEnumerable",
    "__proto__",
    "constructor",
    "toString",
    "toLocaleString",
    "valueOf",
    "isPrototypeOf"
  ]

  //

  test.description = 'empty'
  var got = _.mapAllKeys( {} );
  test.identical( got.sort(), _expected.sort() )

  //

  test.description = 'one own property'
  var got = _.mapAllKeys( { a : 1 } );
  var expected = _expected.slice();
  expected.push( 'a' );
  test.identical( got.sort(), expected.sort() )

  //

  test.description = 'date'
  var got = _.mapAllKeys( new Date );
  test.identical( got.length, 55 );

  //

  test.description = 'not enumerable'
  var a = { };
  Object.defineProperty( a, 'x', { enumerable : 0 })
  var got = _.mapAllKeys( a );
  var expected = _expected.slice();
  expected.push( 'x' );
  test.identical( got.sort(), expected.sort() );

  //

  test.description = 'from prototype'
  var a = { a : 1 };
  var b = { b : 1 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'x', { enumerable : 0 } );
  Object.defineProperty( b, 'y', { enumerable : 0 } );
  var got = _.mapAllKeys( a );
  var expected = _expected.slice();
  expected = expected.concat( [ 'a','b','x','y' ] );
  test.identical( got.sort(), expected.sort() );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function ()
    {
      _.mapAllKeys();
    })

    test.description = 'invalid argument';
    test.shouldThrowError( function ()
    {
      _.mapAllKeys();
    })

    test.description = 'unknown option';
    test.shouldThrowError( function ()
    {
      _.mapAllKeys.call( { own : 0 }, {} );
    })
  }

}


//

function mapVals( test )
{

  test.description = 'simple';

  var got = _.mapVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.mapVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.mapVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.mapVals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  //

  test.description = 'own'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.mapVals.call( { own : 0, enumerable : 1 }, a );
  var expected = [ 1, 2 ]
  test.identical( got, expected );

  /**/

  var got = _.mapVals.call( { own : 1, enumerable : 1 }, a );
  var expected = [ 1 ];
  test.identical( got, expected );

  //

  test.description = 'enumerable'
  var a = { a : 1 };
  Object.defineProperty( a, 'x', { enumerable : 0, value : 2 } );

  /**/

  var got = _.mapVals.call( { enumerable : 1, own : 0 }, a );
  var expected = [ 1 ];
  test.identical( got, expected );

  /**/

  var got = _.mapVals.call( { enumerable : 0, own : 0 }, a );
  var contains = false;
  for( var i = 0; i < got.length; i++ )
  {
    contains = _.mapContain( a, got[ i ] )
    if( !contains )
    break;
  }
  test.shouldBe( contains );

  //

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapVals();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapVals( 'wrong argument' );
    });

    test.description = 'wrong option';
    test.shouldThrowError( function()
    {
      _.mapVals.call( { a : 1 }, {} );
    });
  }
};

//

function mapOwnVals( test )
{

  test.description = 'simple';

  var got = _.mapOwnVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.mapOwnVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.mapOwnVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.mapOwnVals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  //

  test.description = ' only own values'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.mapOwnVals( a );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* enumerable off */

  Object.defineProperty( a, 'x', { enumerable : 0, value : 3 } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : 4 } );
  var got = _.mapOwnVals.call({ enumerable : 0 }, a );
  var expected = [ 1, 3 ];
  test.identical( got, expected );

  //

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapOwnVals();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapOwnVals( 'wrong argument' );
    });

    test.description = 'wrong option';
    test.shouldThrowError( function()
    {
      _.mapOwnVals.call( { a : 1 }, {} );
    });

  }

};

//

function mapAllVals( test )
{
  test.description = 'simple';

  var got = _.mapAllVals( {} );
  test.shouldBe( got.length );

  /**/

  var got = _.mapAllVals( { a : 7, b : 13 } );
  test.shouldBe( got.length );
  test.shouldBe( got.indexOf( 7 ) !== -1 );
  test.shouldBe( got.indexOf( 13 ) !== -1 );

  /**/

  var got = _.mapAllVals( new Date );
  test.shouldBe( got.length > _.mapAllVals( {} ).length );

  //

  test.description = 'from prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.mapAllVals( a );
  var expected = [ 1 ];
  test.shouldBe( got.length > _.mapAllVals( {} ).length );
  test.shouldBe( got.indexOf( 1 ) !== -1 );
  test.shouldBe( got.indexOf( 2 ) !== -1 );

  //

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapAllVals();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapAllVals( 'wrong argument' );
    });

    test.description = 'wrong option';
    test.shouldThrowError( function()
    {
      _.mapAllVals.call( { a : 1 }, {} );
    });

  }

};

//

function mapExtend( test )
{

  test.description = 'first argument is null';
  var got = _.mapExtend( null, { a : 7, b : 13 }, { c : 3, d : 33 } );
  var expected = { a : 7, b : 13, c : 3, d : 33 };
  test.identical( got, expected );

  test.description = 'multiple object properties';
  var got = _.mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
  var expected = { a : 7, b : 13, c : 3, d : 33, e : 77 };
  test.identical( got, expected );

  test.description = 'object like array';
  var got = _.mapExtend( null, [ 3, 7, 13, 73 ] );
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

    test.description = 'wrong type of boolean';
    test.shouldThrowError( function()
    {
      _.mapExtend( true );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.mapExtend( 'wrong argument' );
    });

  }

};

//

function mapPairs( test )
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

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapPairs( [] );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapPairs( 'wrong argument' );
    });

  }

};

//

function mapOwnKey( test )
{

  test.description = 'second argument is string';
  var got = _.mapOwnKey( { a : 7, b : 13 }, 'a' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'second argument is object';
  var got = _.mapOwnKey( { a : 7, b : 13 }, Object.create( null ).a = 'a' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'second argument is symbol';
  var symbol = Symbol( 'b' ), obj = { a : 7, [ symbol ] : 13 };
  var got = _.mapOwnKey( obj, symbol );
  var expected = true;
  test.identical( got, expected );

  test.description = 'false';
  var got = _.mapOwnKey( Object.create( { a : 7, b : 13 } ), 'a' );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapOwnKey();
    });

    test.description = 'few arguments';
    test.shouldThrowError( function()
    {
      _.mapOwnKey( {} );
    });

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapOwnKey( [] );
    });

    test.description = 'wrong type of second argument';
    test.shouldThrowError( function()
    {
      _.mapOwnKey( {}, 13 );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapOwnKey( '', 7 );
    });

  }

};

//

function mapIdentical( test )
{

  test.description = 'same [ key, value ]';
  var got = _.mapIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'same [ key, value ] in the arrays';
  var got = _.mapIdentical( [ 'a', 7, 'b', 13 ], [ 'a', 7, 'b', 13 ] );
  var expected = true;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.mapIdentical();
    });

    test.description = 'few arguments';
    test.shouldThrowError( function()
    {
      _.mapIdentical( {} );
    });

    test.description = 'too much arguments';
    test.shouldThrowError( function()
    {
      _.mapIdentical( {}, {}, 'redundant argument' );
    });

  }

};

//

function mapContain( test )
{

  test.description = 'first has same keys like second';
  var got = _.mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'in the array';
  var got = _.mapContain( [ 'a', 7, 'b', 13, 'c', 15 ], [ 'a', 7, 'b', 13 ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'number of keys in first not equal';
  var got = _.mapContain( { a : 1 }, { a : 1, b : 2 } );
  var expected = false;
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

    test.description = 'too much arguments';
    test.shouldThrowError( function()
    {
      _.mapContain( {}, {}, 'redundant argument' );
    });

  }

};

//

function mapBut( test )
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


function mapToArray( test )
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


function mapValWithIndex( test )
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

    test.description = 'no arguments';
    test.shouldThrowError( function() {
      _.mapValWithIndex();
    });

    test.description = 'few argument';
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

}


function mapKeyWithIndex( test )
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


function mapIs( test )
{

  test.description = 'an empty object';
  var got = _.mapIs( {} );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.mapIs( { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'no argument';
  var got = _.mapIs();
  var expected = false;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.mapIs( [  ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'a string';
  var got = _.mapIs( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.description = 'a number';
  var got = _.mapIs( 13 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'a boolean';
  var got = _.mapIs( true );
  var expected = false;
  test.identical( got, expected );

  test.description = 'a function';
  var got = _.mapIs( function() {  } );
  var expected = false;
  test.identical( got, expected );

  test.description = 'a string';
  var got = _.mapIs( Object.create( { a : 7 } ) );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    /*test.description = 'inherits through the prototype chain';
    test.shouldThrowError( function()
    {
      _.mapIs( Object.create( { a : 7 } ) );
    });*/

  }

};


function mapClone( test )
{

  test.description = 'an Example';
  function Example() {
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


function mapExtendFiltering( test )
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
      _.mapExtendFiltering( _.filter.supplementary() );
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


function mapSupplement( test )
{

  test.description = 'an object';
  var got = _.mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
  var expected = { a : 1, b : 2, c : 3 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapSupplement();
    });

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapSupplement( [] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapSupplement( 'wrong arguments' );
    });

  }

};


function mapCopy( test )
{

  test.description = 'an object';
  var got = _.mapCopy( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
  var expected = { a : 7, b : 13, c : 3, d : 33, e : 77 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapCopy();
    });

  }

};


function mapFirstPair( test )
{

  test.description = 'first pair [ key, value ]';
  var got = _.mapFirstPair( { a : 3, b : 13 } );
  var expected = [ 'a', 3 ];
  test.identical( got, expected );

  test.description = 'undefined';
  var got = _.mapFirstPair( {  } );
  var expected = undefined;
  test.identical( got, expected );

  test.description = 'object-like';
  var got = _.mapFirstPair( [ [ 'a', 7 ] ] );
  var expected = [ '0', [ 'a', 7 ] ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapFirstPair();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapFirstPair( 'wrong argument' );
    });

  }

};


function mapToStr( test )
{

  test.description = 'returns an empty string';
  var got = _.mapToStr( [  ], ' : ', '; ' );
  var expected = '';
  test.identical( got, expected );

  test.description = 'returns a string representing an object';
  var got = _.mapToStr( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
  var expected = 'a : 1; b : 2; c : 3; d : 4';
  test.identical( got, expected );

  test.description = 'returns a string representing an array';
  var got = _.mapToStr( [ 1, 2, 3 ], ' : ', '; ' );
  var expected = '0 : 1; 1 : 2; 2 : 3';
  test.identical( got, expected );

  test.description = 'returns a string representing an array-like object';
  function args() { return arguments }( 1, 2, 3, 4, 5 );
  var got = _.mapToStr( args, ' : ', '; ' );
  var expected = '0 : 1; 1 : 2; 2 : 3; 3 : 4; 4 : 5';
  test.identical( got, expected );

  test.description = 'returns a string representing a string';
  var got = _.mapToStr( 'abc', ' : ', '; ' );
  var expected = '0 : a; 1 : b; 2 : c';
  test.identical( got, expected );


  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapToStr();
    });

    test.description = 'wrong type of number';
    test.shouldThrowError( function()
    {
      _.mapToStr( 13 );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapToStr( true );
    });

  }

};


function mapGroup( test )
{

  test.description = 'an empty object';
  var got = _.mapGroup( [  ], { key : 'key1' } );
  var expected = {  };
  test.identical( got, expected );

  test.description = 'first argument is an array';
  var got = _.mapGroup( [ { key1 : 44, key2 : 77 }, { key1 : 33 } ], { key : 'key1' } );
  var expected = { 33 : [ { key1 : 33 } ], 44 : [ { key1 : 44, key2 : 77 } ] };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapGroup();
    });

    test.description = 'few arguments';
    test.shouldThrowError( function()
    {
      _.mapGroup( [] );
    });

    test.description = 'first argument not wrapped into array';
    test.shouldThrowError( function()
    {
      _.mapGroup( { key1 : 44, key2 : 77 }, { key1 : 33 } , { key : 'key1' } );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.mapGroup( {  }, [  ] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapGroup( 'wrong arguments' );
    });

  }

};


function mapButFiltering( test )
{

  test.description = 'an object';
  var got = _.mapButFiltering( _.filter.atomic(), { a : 1, b : 'xxx', c : [ 1, 2, 3 ] } );
  var expected = {a: 1, b: "xxx"};
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapButFiltering();
    });

    test.description = 'few arguments';
    test.shouldThrowError( function()
    {
      _.mapButFiltering( _.filter.atomic() );
    });

    test.description = 'second argument is wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapButFiltering( _.filter.atomic(), [] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapButFiltering( 'wrong arguments' );
    });

  }

};


function mapComplement( test )
{

  test.description = 'an object';
  var got = _.mapComplement( { a : 1, b : 'yyy' }, { a : 12 , c : 3 } );
  var expected = { a : 1, b : 'yyy', c : 3 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.mapComplement();
    });

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapComplement( [] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapComplement( 'wrong arguments' );
    });

  }

};


function mapOwnBut( test )
{

  test.description = 'an empty object';
  var got = _.mapOwnBut( {  } );
  var expected = {  };
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.mapOwnBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
  var expected = { c : 3 };
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.mapOwnBut( { a : 7, 'toString' : 5 }, { b : 33, c : 77 } );
  var expected = { a : 7 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.mapOwnBut();
    });

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapOwnBut( [  ] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapOwnBut( 'wrong arguments' );
    });

  }

};



function _mapScreen( test )
{

  test.description = 'an object';
  var options = {};
  options.screenObjects = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
  options.srcObjects = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
  var got = _._mapScreen( options );
  var expected = { a : 33, c : 33, name : "Mikle" };
  test.identical( got, expected );

  test.description = 'an object2'
  var options = {};
  options.screenObjects = { a : 13, b : 77, c : 3, d : 'name' };
  options.srcObjects = { d : 'name', c : 33, a : 'abc' };
  var got = _._mapScreen( options );
  var expected = { a : "abc", c : 33, d : "name" };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._mapScreen();
    });

    test.description = 'redundant arguments';
    test.shouldThrowError( function()
    {
      _._mapScreen( {}, 'wrong arguments' );
    });

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _._mapScreen( [] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _._mapScreen( 'wrong arguments' );
    });

  }

};


function mapScreen( test )
{


  test.description = 'an object'
  var got = _.mapScreen( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
  var expected = { a : "abc", c : 33, d : "name" };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.mapScreen();
    });

    test.description = 'few arguments';
    test.shouldThrowError( function()
    {
      _.mapScreen( {} );
    });

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapScreen( [] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapScreen( 'wrong arguments' );
    });

  }

};

//

function mapScreens( test )
{


  test.description = 'test1';
  var got = _.mapScreens( { d : 'name', c : 33, a : 'abc' }, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );
  console.log(got);
  var expected = { a : "abc", c : 33, d : "name" };
  test.identical( got, expected );

  test.description = 'test2';
  var got = _.mapScreens( [ { d : 'name', c : 33, a : 'abc' } ], [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );
  console.log(got);
  var expected = { a : "abc", c : 33, d : "name" };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.mapScreens();
    });

    test.description = 'first argument is not an object-like';
    test.shouldThrowError( function()
    {
      _.mapScreens( 3, [] );
    });

    test.description = 'second argument is not an object-like';
    test.shouldThrowError( function()
    {
      _.mapScreens( [], '' );
    });

    test.description = 'few arguments';
    test.shouldThrowError( function()
    {
      _.mapScreen( {} );
    });

    test.description = 'redundant arguments';
    test.shouldThrowError( function()
    {
      _.mapScreen( [], [], {} );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.mapScreen( 'wrong arguments' );
    });

  }
};

//

var Self =
{

  name : 'MapTests',

  tests:
  {

    mapKeys : mapKeys,
    mapOwnKeys : mapOwnKeys,
    mapAllKeys : mapAllKeys,
    mapVals : mapVals,
    mapAllVals : mapAllVals,
    mapOwnVals : mapOwnVals,
    mapExtend : mapExtend,
    mapPairs : mapPairs,
    mapOwnKey : mapOwnKey,
    mapIdentical : mapIdentical,
    mapContain : mapContain,
    mapBut : mapBut,
    mapToArray : mapToArray,
    mapValWithIndex : mapValWithIndex,
    mapKeyWithIndex : mapKeyWithIndex,
    mapIs : mapIs,
    mapClone : mapClone,
    mapExtendFiltering : mapExtendFiltering,
    mapSupplement : mapSupplement,
    mapCopy : mapCopy,
    mapFirstPair : mapFirstPair,
    mapToStr : mapToStr,
    mapGroup : mapGroup,
    mapButFiltering : mapButFiltering,
    mapComplement : mapComplement,
    mapOwnBut : mapOwnBut,
    mapScreens : mapScreens,
    mapScreen : mapScreen,
    _mapScreen : _mapScreen,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
