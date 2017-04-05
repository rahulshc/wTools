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

//

function mapValues( test )
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

    test.description = 'wrong type of array';
    test.shouldThrowError( function()
    {
      _.mapValues( [] );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.mapValues( 'wrong argument' );
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

function mapOwn( test )
{

  test.description = 'second argument is string';
  var got = _.mapOwn( { a : 7, b : 13 }, 'a' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'second argument is object';
  var got = _.mapOwn( { a : 7, b : 13 }, Object.create( null ).a = 'a' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'second argument is symbol';
  var symbol = Symbol( 'b' ), obj = { a : 7, [ symbol ] : 13 };
  var got = _.mapOwn( obj, symbol );
  var expected = true;
  test.identical( got, expected );

  test.description = 'false';
  var got = _.mapOwn( Object.create( { a : 7, b : 13 } ), 'a' );
  var expected = false;
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

//

function mapSame( test )
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

    test.description = 'too much arguments';
    test.shouldThrowError( function()
    {
      _.mapSame( {}, {}, 'redundant argument' );
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
    mapValues : mapValues,
    mapExtend : mapExtend,
    mapPairs : mapPairs,
    mapOwn : mapOwn,
    mapSame : mapSame,
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
