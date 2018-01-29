( function _Entity_test_s_( ) {

'use strict';

/*

 to run this test
 from the project directory run

 npm install
 node ./staging/z.test/Sample.test.s

 */

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath )/*hhh*/;
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath )/*hhh*/;
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _ = _global_.wTools;
var Self = {};

//

function entityMap( test )
{

  var entity1 = [ 3, 4, 5 ],
    entity2 = { '3' : 3, '4' : 4, '5' : 5 },
    expected1 = [ 9, 16, 25 ],
    expected2 = { '3' : 9, '4' : 16, '5' : 25 },
    expected3 = entity1.slice();

  function constr1()
  {
    this.a = 1;
    this.b = 3;
    this.c = 4;
  }
  var entity4 = new constr1(),
    expected4 = { a : '1a', b : '9b', c : '16c' };


  function callback1(v, i, ent )
  {
    return v * v;
  };

  function callback2( v, i, ent )
  {
    return v * v + i;
  };

  function callback3( v, i, ent )
  {
    if( externEnt ) externEnt = ent;
    return v * v + i;
  };

  test.description = 'simple test with mapping array by sqr';
  var got = _.entityMap( entity1, callback1 );
  test.identical( got,expected1 );

  test.description = 'simple test with mapping array by sqr : source array should not be modified';
  var got = _.entityMap( entity1, callback1 );
  test.identical( entity1, expected3 );

  test.description = 'simple test with mapping object by sqr';
  var got = _.entityMap( entity2, callback1 );
  test.identical( got,expected2 );

  test.description = 'simple test with mapping object by sqr : using constructor';
  var got = _.entityMap( entity4, callback2 );
  test.identical( got, expected4 );

  test.description = 'simple test with mapping object by sqr : check constructor';
  test.identical( got instanceof constr1, true );

  test.description = 'simple test with mapping object by sqr : check callback arguments';
  var externEnt = {};
  var got = _.entityMap( entity4, callback3 );
  test.identical( externEnt, entity4 );

  if( Object.is )
  {
    test.description = 'simple test with mapping object by sqr : source object should be unmodified';
    test.identical( Object.is( got, entity4 ), false );
  }

  /**/

  if( Config.debug )
  {

    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityMap();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityMap( [ 1,3 ], callback1, callback2 );
    });

    test.description = 'passed argument is not ArrayLike, ObjectLike';
    test.shouldThrowError( function()
    {
      _.entityFilter( 44, callback1 );
    });

    test.description = 'second argument is not routine';
    test.shouldThrowError( function()
    {
      _.entityMap( [ 1,3 ], 'callback' );
    });

  }

};

//

function entityFilter( test )
{
  var entity1 = [ 9, -16, 25, 36, -49 ],
    entity2 = { '3' : 9, '4' : 16, '5' : 25 },
    expected1 = [ 3, 5, 6 ],
    expected2 = { '3' : 3, '4' : 4, '5' : 5 },
    expected3 = entity1.slice();

  function callback1( v, i, ent )
  {
    if( v < 0 ) return;
    return Math.sqrt( v );
  };

  function testFn1()
  {
    return _.entityFilter( arguments, callback1 );
  }

  test.description = 'simple test with mapping array by sqrt';
  var got = _.entityFilter( entity1, callback1 );
  test.identical( got,expected1 );

  /*
    TODO : need to check actuality of this test

    test.description = 'simple test with arrayLike';
    var got = null;
    try
    {
      got = testFn1( 9, -16, 25, 36, -49 );

    }
    catch(e)
    {
      console.log(' test throws errror, but should not ');
      console.log(e);
    }
    finally
    {
      test.identical( got, expected1 );
    }
  */

  test.description = 'simple test with mapping array by sqrt : source array should not be modified';
  var got = _.entityFilter( entity1, callback1 );
  test.identical( entity1, expected3 );

  test.description = 'simple test with mapping object by sqrt';
  var got = _.entityFilter( entity2, callback1 );
  test.identical( got,expected2 );

  test.description = 'simple test with mapping array by sqrt';
  var got = _.entityFilter( entity1, callback1 );
  test.identical( got,expected1 );

  /**/

  if( Config.debug )
  {

    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityFilter();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityFilter( [ 1,3 ], callback1, callback2 );
    });

    test.description = 'passed argument is not ArrayLike, ObjectLike';
    test.shouldThrowError( function()
    {
      _.entityFilter( 44, callback1 );
    });

    test.description = 'second argument is not routine';
    test.shouldThrowError( function()
    {
      _.entityFilter( [ 1,3 ], 'callback' );
    });

  }
};

//

function _entityMost( test )
{

  var args1 = [ 3, 1, 9, 0, 5 ],
    args2 = [3, -4, 9, -16, 5, -2],
    args3 = { a : 25, b : 16, c : 9 },
    expected1 = { index : 2, key : 2, value : 9, element : 9 },
    expected2 = { index : 3, key : 3, value : 0, element : 0 },
    expected3 = { index : 3, key : 3, value : 256, element : -16 },
    expected4 = args2.slice(),
    expected5 = { index : 5, key : 5, value : 4, element : -2 },
    expected6 = { index : 0, key : 'a', value : 25, element : 25  },
    expected7 = { index : 2, key : 'c', value : 3, element : 9  };

  function sqr( v )
  {
    return v * v;
  };

  test.description = 'test entityMost with array and default onElement and returnMax = true';
  var got = _._entityMost( args1, undefined, true );
  test.identical( got, expected1 );

  test.description = 'test entityMost with array and default onElement and returnMax = false';
  var got = _._entityMost( args1, undefined, false );
  test.identical( got, expected2 );

  test.description = 'test entityMost with array simple onElement function and returnMax = true';
  var got = _._entityMost( args2, sqr, true );
  test.identical( got, expected3 );

  test.description = 'test entityMost with array : passed array should be unmodified';
  test.identical( args2, expected4 );

  test.description = 'test entityMost with array simple onElement function and returnMax = false';
  var got = _._entityMost( args2, sqr, false );
  test.identical( got, expected5 );

  test.description = 'test entityMost with map and default onElement and returnMax = true';
  var got = _._entityMost( args3, undefined, true );
  test.identical( got, expected6 );

  test.description = 'test entityMost with map and returnMax = false';
  var got = _._entityMost( args3, Math.sqrt, false );
  test.identical( got, expected7 );

  if( Config.debug )
  {
    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _._entityMost();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _._entityMost( [ 1,3 ], sqr, true, false );
    });

    test.description = 'second argument is not routine';
    test.shouldThrowError( function()
    {
      _._entityMost( [ 1,3 ], 'callback', true );
    });
  }

};

//

function entityMin( test )
{
  var args1 = [ 3, 1, 9, 0, 5 ],
    args2 = [ 3, -4, 9, -16, 5, -2 ],
    args3 = { a : 25, b : 16, c : 9 },
    expected1 = { index : 3, key : 3, value : 0, element : 0 },
    expected2 = { index : 5, key : 5, value : 4, element : -2 },
    expected3 = args2.slice(),
    expected4 = { index : 2, key : 'c', value : 9, element : 9  };

  function sqr(v)
  {
    return v * v;
  };

  test.description = 'test entityMin with array and without onElement callback';
  var got = _.entityMin( args1 );
  test.identical( got, expected1 );



  test.description = 'test entityMin with array simple onElement function';
  var got = _.entityMin( args2, sqr );
  test.identical( got, expected2 );

  test.description = 'test entityMin with array : passed array should be unmodified';
  test.identical( args2, expected3 );



  test.description = 'test entityMin with map';
  var got = _.entityMin( args3 );
  test.identical( got, expected4 );



  if( Config.debug )
  {
    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityMin();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityMin( [ 1,3 ], sqr, true );
    });

    test.description = 'second argument is not routine';
    test.shouldThrowError( function()
    {
      _.entityMin( [ 1,3 ], 'callback' );
    });
  }
};

//

function entityMax( test )
{

  var args1 = [ 3, 1, 9, 0, 5 ],
    args2 = [ 3, -4, 9, -16, 5, -2 ],
    args3 = { a : 25, b : 16, c : 9 },
    expected1 = { index : 2, key : 2, value : 9, element : 9 },
    expected2 = args2.slice(),
    expected3 = { index : 3, key : 3, value : 256, element : -16 },
    expected4 = { index : 0, key : 'a', value : 5, element : 25 };

  function sqr( v )
  {
    return v * v;
  };

  test.description = 'test entityMax with array';
  var got = _.entityMax( args1 );
  test.identical( got, expected1 );

  test.description = 'test entityMax with array and simple onElement function';
  var got = _.entityMax( args2, sqr );
  test.identical( got, expected3 );

  test.description = 'test entityMax with array : passed array should be unmodified';
  test.identical( args2, expected2 );

  test.description = 'test entityMax with map';
  var got = _.entityMax( args3, Math.sqrt );
  test.identical( got, expected4 );

  if( Config.debug )
  {
    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityMax();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityMax( [ 1,3 ], sqr, true );
    });

    test.description = 'second argument is not routine';
    test.shouldThrowError( function()
    {
      _.entityMax( [ 1,3 ], 'callback' );
    });
  }
};

//

function _entityEqualAct( test )
{
  // number values

  function sameNumbers1( a,b )
  {
    return a === b;
  };

  var options1 =
  {
    onSameNumbers : sameNumbers1,
    contain : 0,
    strict : 1,
    lastPath : '',
  };

  var options2 =
  {
    onSameNumbers : sameNumbers1,
    contain : 0,
    strict : 0,
    lastPath : '',
  };

  var x1 = -0, y1 = +0,
    x2 = Number.MAX_VALUE, y2 = Number.MAX_VALUE,
    x3 = 44, y3 = 34;

  // string values

    var strX1 = '', strY1 = '',
      strX2 = '0', strY2 = '0',
      strX3 = '0', strY3 = new String( '0' );

  // array values

  var arrX1 = [], arrY1 = [],
    arrX2 = [ 0, 1, 3 ],              arrY2 = [ 0, 1, 3 ],
    arrX3 = [ 0, 1, 3 ],              arrY3 = [ 0, 1, 2 ],
    arrX4 = [ 0, 1, [ 2, 3 ] ],       arrY4 = [ 0, 1, [ 2, 3 ] ],
    arrX5 = [ 0, 1, { a : 2, b : 3 } ], arrY5 = [ 0, 1, { a : 2, b : 3 } ],
    arrX6 = [ 0, 1, 3 ],              arrY6 = [ '0', '1', '2' ];

  // object values

  function constructor1()
  {
    this.a = 1;
    this.b = 2;
  };

  function constructor2()
  {
    this['a'] = 1;
    this['b'] = 2;
  };

  var objX1 = {}, objY1 = {},
    objX2 = { a : 0, b : 1, c : 3 },              objY2 = { a : 0, b : 1, c : 3 },
    objX3 = { a : 0, b : 1, c : 3 },              objY3 = { a : 0, b : 1, c : 2 },
    objX4 = { a : 0, b : 1, e : { c : 2, d : 3 } }, objY4 = { a : 0, b : 1, e : { c : 2, d : 3 } },
    objX5 = { a : 0, b : 1, c : 3 },              objY5 = { a : '0', b : '1', c : '2' },
    objX6 = new constructor1(),                objY6 = new constructor1(),
    objX7 = objX6,                             objY7 = new constructor2();

  // numbers test

  test.description = 'entity same +0 and -0';
  var got = _._entityEqualAct( x1, y1, options1 );
  test.identical( got, true );

  test.description = 'entity same Number.MAX_VALUE';
  var got = _._entityEqualAct( x2, y2, options1 );
  test.identical (got, true );

  test.description = 'entity not same numbers';
  var got = _._entityEqualAct( x3, y3, options1 );
  test.identical( got, false );

  // string tests

  test.description = 'entities is two empty strings';
  var got = _._entityEqualAct( strX1, strY1, options1 );
  test.identical( got, true );

  test.description = 'entities is two non empty strings';
  var got = _._entityEqualAct( strX2, strY2, options1 );
  test.identical( got, true );

  test.description = 'entity same : string and object strict mode';
  var got = _._entityEqualAct( strX3, strY3, options1 );
  test.identical( got, false );

  test.description = 'entity same : string and object non strict mode';
  var got = _._entityEqualAct( strX3, strY3, options2 );
  test.identical( got, true );

  // array tests

  test.description = 'entities is two empty arrays';
  var got = _._entityEqualAct( arrX1, arrY1, options1 );
  test.identical( got, true );

  test.description = 'entities is two non empty arrays';
  var got = _._entityEqualAct( arrX2, arrY2, options1 );
  test.identical( got, true );

  test.description = 'entities is two non empty different arrays';
  var got = _._entityEqualAct( arrX3, arrY3, options1 );
  test.identical( got, false );

  test.description = 'entities is two non empty nested arrays';
  var got = _._entityEqualAct( arrX4, arrY4, options1 );
  test.identical( got, true );

  test.description = 'entities is two arrays with objects as elements';
  var got = _._entityEqualAct( arrX5, arrY5, options1 );
  test.identical( got, true );

  test.description = 'entities is two arrays with strict mode';
  var got = _._entityEqualAct( arrX6, arrY6, options1 );
  test.identical( got, false );

  test.description = 'entities is two arrays without strict mode';
  var got = _._entityEqualAct( arrX5, arrY5, options2 );
  test.identical( got, true );

  // object tests

  test.description = 'entities is two empty objects';
  var got = _._entityEqualAct( objX1, objY1, options1 );
  test.identical( got, true );

  test.description = 'entities is two non empty objects';
  var got = _._entityEqualAct( objX2, objY2, options1 );
  test.identical( got, true );

  test.description = 'entities is two different objects';
  var got = _._entityEqualAct( objX3, objY3, options1 );
  test.identical( got, false );

  test.description = 'entities is two non empty nested objects';
  var got = _._entityEqualAct( objX4, objY4, options1 );
  test.identical( got, true );

  test.description = 'entities is two objects with different type elements : strict mode';
  var got = _._entityEqualAct( objX5, objY5, options1 );
  test.identical( got, false );

  /*
    TODO : need to check actuality of this test

    test.description = 'entities is two objects with different type elements : non strict mode';
    var got = _._entityEqualAct(objX5, objY5, options2, '');
    test.identical(got, true);
  */

  test.description = 'entities is two objects';
  var got = _._entityEqualAct( objX6, objY6, options1 );
  test.identical( got, true );

  test.description = 'entities is two same objects : different constructors';
  var got = _._entityEqualAct( objX7, objY7, options1 );
  test.identical( got, true );

  if( Config.debug )
  {
    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _._entityEqualAct();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _._entityEqualAct( rrX5, arrY5, options1 , false );
    });

  }
};

//

function entityIdentical( test )
{

  var options =
  {
    strict : 0
  };

  // numbers

  var x1 = 44, y1 = 44,
    x2 = 44, y2 = 34;

  // strings

  var strX1 = '4', strY1 = 4,
    strX2 = '0', strY2 = '0',
    strX3 = '0', strY3 = new String( '0' );

  // array values

  var arrX1 = [ 0, 1, 3 ], arrY1 = [ 0, 1, 3 ],
    arrX2 = [ 0, 1, 3 ], arrY2 = [ 0, 1, 2 ];


  // object values

  var objX1 = { a : 0, b : 1, c : 3 }, objY1 = { a : 0, b : 1, c : 3 },
    objX2 = { a : 0, b : 1, c : 3 }, objY2 = { a : 0, b : 1, c : 2 },
    objX3 = { a : 0, b : 1, e : { c : 2, d : 3 } }, objY3 = { a : 0, b : 1, e : { c : 2, d : 3 } };


  // numbers test

  test.description = 'identical numbers';
  var got = _.entityIdentical( x1, y1 );
  test.identical( got, true );

  test.description = 'not identical numbers';
  var got = _.entityIdentical( x2, y2 );
  test.identical( got, false );

  // strins test

  /*
    TODO : need to check actuality of this test

    test.description = 'mismatch types';
    var got = _.entityIdentical( strX1, strX1 );
    test.identical(got, false);
  */

  test.description = 'mismatch types : no strict';
  var got = _.entityIdentical( strX1, strX1, options );
  test.identical( got, true );

  test.description = 'entities is two non empty same strings';
  var got = _.entityIdentical( strX2, strY2 );
  test.identical( got, true );

  test.description = 'string and object';
  var got = _.entityIdentical( strX3, strY3, options);
  test.identical( got, true );

  // array tests

  test.description = 'tests two non empty arrays';
  var got = _.entityIdentical( arrX1, arrY1 );
  test.identical( got, true );

  test.description = 'tests two non empty different arrays';
  var got = _.entityIdentical( arrX2, arrY2 );
  test.identical( got, false );

  // object tests

  test.description = 'tests two non empty objects';
  var got = _.entityIdentical( objX1, objY1 );
  test.identical( got, true );

  test.description = 'tests two different objects';
  var got = _.entityIdentical( objX2, objY2 );
  test.identical( got, false );

  test.description = 'tests nested objects';
  var got = _.entityIdentical( objX3, objY3 );
  test.identical( got, true );

  if( Config.debug )
  {

    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityIdentical();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityIdentical( strX3, strY3, options, '');
    });

  }

};

//

function entityEquivalent( test )
{
  var defaultEPS = 1e-5;

  var options =
  {
    eps : defaultEPS
  }

  // numbers

  var x1 = 44, y1 = 44,
    x2 = 44, y2 = 44 + defaultEPS / 2,
    x3 = 44, y3 = 44 + 2 * defaultEPS;

  // numbers test

  test.description = 'identical numbers';
  var got = _.entityEquivalent( x1, y1, options );
  test.identical( got, true );

  test.description = ' practically equivalent numbers';
  var got = _.entityEquivalent( x2, y2, options );
  test.identical( got, true );

  test.description = ' not equivalent numbers';
  var got = _.entityEquivalent( x3, y3, options );
  test.identical( got, false );

  if( Config.debug )
  {

    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityEquivalent();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityEquivalent( strX3, strY3, options, '');
    });

  }
};

//

function entityContain( test )
{
  // array values

  var arrX1 = [ 0, 1, 3 ], arrY1 = [ 0, 1, 3 ],
    arrX2 = [ 0, 1, 3 ], arrY2 = [ 0, 1, 2 ],
    arrX3 = [ 0, 1, 2, 3, 9 ], arrY3 = [ 0, 1, 2 ],
    arrX4 = [ [0, 1, 2], 3, 9 ], arrY4 = [ 0, 1, 2 ],
    arrX5 = [ [0, 1, 2], 3, 9 ], arrY5 = [[ 0, 1, 2 ]];


  // object values

  var objX1 = { a : 0, b : 1, c : 3 }, objY1 = { a : 0, b : 1, c : 3 },
    objX2 = { a : 0, b : 1, c : 3 }, objY2 = { a : 0, b : 1, d : 2 },
    objX3 = { a : 0, b : 1, e : { c : 2, d : 3 } }, objY3 = { a : 0, e : { c : 2, d : 3 } },
    objX4 = { a : 0, b : 1, c : 3 }, objY4 = { a : 0, b : 1 };

  // array tests

  test.description = 'tests two non empty arrays : same length';
  var got = _.entityContain( arrX1, arrY1 );
  test.identical( got, true );

  test.description = 'tests two non empty different arrays';
  var got = _.entityContain( arrX2, arrY2 );
  test.identical( got, false );

  test.description = 'one array contains other`s elements';
  var got = _.entityContain( arrX3, arrY3 );
  test.identical( got, true );

  test.description = 'one array contains other as element';
  var got = _.entityContain( arrX4, arrY4 );
  test.identical( got, false );

  test.description = 'nested arrays';
  var got = _.entityContain( arrX5, arrY5 );
  test.identical( got, true );

  // object tests

  test.description = 'tests two non empty objects : identical keys';
  var got = _.entityContain( objX1, objY1 );
  test.identical( got, true );

  test.description = 'tests two different objects : identical keys';
  var got = _.entityContain( objX2, objY2 );
  test.identical( got, false );

  test.description = 'tests nested objects : identical';
  var got = _.entityContain( objX3, objY3 );
  test.identical( got, true );

  test.description = 'one object contains elements of another';
  var got = _.entityContain( objX4, objY4 );
  test.identical( got, true );

  if( Config.debug )
  {

    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityContain();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.entityContain( strX3, strY3, options, '');
    });

  }
};

//

function entityLength( test )
{

  var x1 = undefined,
    x2 = 34,
    x3 = 'hello',
    x4 = [ 23, 17, , 34 ],
    x5 = [ 0, 1, [ 2, 4 ] ],
    x6 = { a : 1, b : 2, c : 3},
    x7 = { a : 1, b : { e : 2, c : 3} },
    x8 = ( function(){ return arguments } )( 0, 1, 2, 4 ); // array like entity

  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[100] = 'sms';
  };

  Constr1.prototype.toString = function()
  {
    console.log('some message');
  }

  Constr1.prototype.c = 99;

  var x9 = new Constr1(),
    x10 = {};

  Object.defineProperties( x10, // add properties, only one is enumerable
    {
      "property1" : {
        value : true,
        writable : true
      },
      "property2" : {
        value : "Hello",
        writable : true
      },
      "property3" : {
        enumerable : true,
        value : "World",
        writable : true
      }
  });

  var expected1 = 0,
    expected2 = 1,
    expected3 = 1,
    expected4 = 4,
    expected5 = 3,
    expected6 = 3,
    expected7 = 2,
    expected8 = 4,
    expected9 = 3,
    expected10 = 1;

  test.description = 'entity is undefined';
  var got = _.entityLength( x1 );
  test.identical( got, expected1 );

  test.description = 'entity is number';
  var got = _.entityLength( x2 );
  test.identical( got, expected2 );

  test.description = 'entity is string';
  var got = _.entityLength( x3 );
  test.identical( got, expected3 );

  test.description = 'entity is array';
  var got = _.entityLength( x4 );
  test.identical( got, expected4 );

  test.description = 'entity is nested array';
  var got = _.entityLength( x5 );
  test.identical( got, expected5 );

  test.description = 'entity is object';
  var got = _.entityLength( x6 );
  test.identical( got, expected6 );

  test.description = 'entity is nested object';
  var got = _.entityLength( x7 );
  test.identical( got, expected7 );

  test.description = 'entity is array like';
  var got = _.entityLength( x8 );
  test.identical( got, expected8 );

  test.description = 'entity is array like';
  var got = _.entityLength( x8 );
  test.identical( got, expected8 );

  console.log( _.toStr( x9 ) );

  test.description = 'entity is created instance of class';
  var got = _.entityLength( x9 );
  test.identical( got, expected9 );

  test.description = 'some properties are non enumerable';
  var got = _.entityLength( x10 );
  test.identical( got, expected10 );

};

//

function entityCopyTry( test )
{
  test.description = 'src null';
  var dst = new String( 'string' );
  var src = null;
  var got = _.entityCopyTry( dst, src  );
  var expected = null;
  test.identical( got, expected );

  test.description = 'dst.copy';
  var dst = { copy : function( src ) { for( var i in src ) this[ i ] = src[ i ] } };
  var src = { src : 'string', num : 123 }
  _.entityCopyTry( dst, src  );
  var got = dst;
  var expected =
  {
    copy : dst.copy,
    src : 'string',
    num : 123

  };
  test.identical( got, expected );

  test.description = 'src.clone';
  var dst = 1;
  var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
  var got = _.entityCopyTry( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.description = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2 ,3 ];
  var got = _.entityCopyTry( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.description = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entityCopyTry( dst, src  );
  var got = dst;
  var expected = { set : dst.set, value : 100 };
  test.identical( got, expected );

  test.description = 'onRecursive ';
  var dst = { };
  var src = { value : 100, a : {  b : 101 } };
  function onRecursive( dstContainer,srcContainer,key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  _.entityCopyTry( dst, src, onRecursive  );
  var got = dst;
  var expected = src;
  test.identical( got, expected );

  test.description = 'atomic ';
  var src = 2;
  var got = _.entityCopyTry( null, src );
  var expected = src;
  test.identical( got, expected );

  if( Config.debug )
  {

    test.description = 'missed arguments';
    test.shouldThrowError( function()
    {
      _.entityCopyTry( );
    });

    test.description = 'src.clone throws "unexpected"';
    test.shouldThrowError( function()
    {
      var dst = {};
      var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
      _.entityCopyTry( dst, src  );
    });



  }
};

//

function entityCopyField( test )
{

  test.description = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entityCopyField(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.description = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entityCopyField(dst, src, name );
  var expected = undefined;
  test.identical( got, expected );

  test.description = 'recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  function onRecursive( dstContainer,srcContainer,key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  var got = _.entityCopyField(dst, src, name,onRecursive );
  var expected = dst[ name ];
  test.identical( got, expected );



  if( Config.debug )
  {
    test.description = 'argument missed';
    test.shouldThrowError( function()
    {
      _.entityCopyField( );
    });
  }

};

//

function entityCoerceTo( test )
{

  test.description = 'string & num';
  var src = '5';
  var ins =  1
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.description = 'num to string';
  var src = 1;
  var ins =  '5';
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.description = 'to boolean';
  var src = 1;
  var ins =  true;
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.description = 'object and num';
  var src = { a : 1 };
  var ins =  1;
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.description = 'array and string';
  var src = [ 1, 2, 3 ];
  var ins =  'str';
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  if( Config.debug )
  {
    test.description = 'argument missed';
    test.shouldThrowError( function()
    {
      _.entityCoerceTo( );
    });

    test.description = 'unknown type';
    test.shouldThrowError( function()
    {
      _.entityCoerceTo( 1, { a : 1 }  );
    });
  }

};

//

function entityHasNan( test )
{

  test.description = 'undefined';
  var got = _.entityHasNan( undefined );
  var expected = true;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.entityHasNan( 150 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.entityHasNan( null );
  var expected = false;
  test.identical( got, expected );

  test.description = 'array';
  var got = _.entityHasNan( [ 1,'A2',3 ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.entityHasNan( { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  if( Config.debug )
  {
    test.description = 'argument missed';
    test.shouldThrowError( function()
    {
      _.entityHasNan( );
    });

  }

};

//

function entityHasUndef( test )
{

  test.description = 'undefined';
  var got = _.entityHasUndef( undefined );
  var expected = true;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.entityHasUndef( 150 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'array';
  var got = _.entityHasUndef( [ 1,'2',3 ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.entityHasUndef( { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  if( Config.debug )
  {
    test.description = 'argument missed';
    test.shouldThrowError( function()
    {
      _.entityHasUndef( );
    });

  }

};

//

function _entityEqual( test )
{
  //default options
  test.description = 'default options, number';
  var got = _._entityEqual( 1, 1 );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'default options, string';
  var got = _._entityEqual( '123', '123' );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'default options, boolean';
  var got = _._entityEqual( 0, false );
  var expected = false;
  test.identical( got, expected );

  test.description = 'default options, array';
  var got = _._entityEqual( [ 1, 2 ,'3'], [ 1, 2, 3 ] );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'default options, object';
  var src1 = { a : 1, b : 2 , c : { d : 3  }  };
  var src2 = { a : 1, b : 2 , c : { d : 3  }  };
  var got = _._entityEqual( src1, src2 );
  var expected = true ;
  test.identical( got, expected );

  //custom options

  test.description = 'number & string, strict : 0';
  var got = _._entityEqual( '123', 123, { strict : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'number & boolean, strict : 0';
  var got = _._entityEqual( false, 0, { strict : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'src1 constains elem from src2 ';
  var got = _._entityEqual( { a : 1, b : 2 }, { b : 2 }, { contain : 1 } );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'src1 constains elem from src2, strict : 0 ';
  var got = _._entityEqual( { a : 1, b : '2' }, { b : 2 }, { contain : 1, strict : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.description = 'onSameNumbers';
  function onSameNumbers( a, b ){ return _.entityEquivalent( a, b, { eps : 1 } ) };
  var got = _._entityEqual( { a : 1, b : 2 }, { a : 2, b : 2 }, { onSameNumbers : onSameNumbers } );
  var expected = true ;
  test.identical( got, expected );

  if( Config.debug )
  {
    test.description = 'argument missed';
    test.shouldThrowError( function()
    {
      _._entityEqual( );
    });

    test.description = 'options is not a Object';
    test.shouldThrowError( function()
    {
      _._entityEqual( 1, 2, 3 );
    });

    test.description = 'extendet options';
    test.shouldThrowError( function()
    {
      _._entityEqual( 1, 2, { fixed : 1 } );
    });

  }

};

//

function entityDiff( test )
{
  //returns false if same

  test.description = 'number';
  var got = _.entityDiff( 1, 1 );
  var expected = false ;
  test.identical( got, expected );

  test.description = 'strings';
  var got = _.entityDiff( 'abc', 'abd' );
  var expected =
  [
    'at : ',
    'src1 :',
    'abc',
    'src2 :',
    'abd ',
    'difference :',
    'ab*'
  ].join('\n');
  test.identical( got, expected );

  test.description = 'arrays';
  var got = _.entityDiff( [ 1, 2, 3 ], [ 1, 2, 4 ] );
  var expected =
  [
    'at : .2',
    'src1 :',
    '3',
    'src2 :',
    '4 ',
    'difference :',
    '*'
  ].join('\n');
  test.identical( got, expected );

  test.description = 'objects,custom path';
  var src1 = { a : { a : 1, b : '2' }, b : [ 1,2 ] };
  var src2 = { a : { a : 1, b : '2' } };
  var got = _.entityDiff( src1, src2, { path : 'a.b' } );
  var expected =
  [
    'at : a.b',
    'src1 :',
    '"2"',
    'src2 :',
    '"2" ',
    'difference :',
    'false'
  ].join('\n');
  test.identical( got, expected );


  if( Config.debug )
  {
    test.description = 'argument missed';
    test.shouldThrowError( function()
    {
      _.entityDiff( );
    });

    test.description = 'invalid options type';
    test.shouldThrowError( function()
    {
      _.entityDiff( 1, 2, 3 );
    });
  }

};

//

function entitySize( test )
{
  test.description = 'string';
  var got = _.entitySize( "str" );
  var expected = 3 ;
  test.identical( got, expected );

  test.description = 'atomic type';
  var got = _.entitySize( 6 );
  var expected = null;
  test.identical( got, expected );

  test.description = 'buffer';
  var got = _.entitySize( new ArrayBuffer( 10 ) );
  var expected = 10;
  test.identical( got, expected );

  test.description = 'arraylike';
  var got = _.entitySize( [ 1, 2, 3 ] );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.entitySize( { a : 1, b : 2 } );
  var expected = null;
  test.identical( got, expected );

  test.description = 'empty call';
  var got = _.entitySize( );
  var expected = null;
  test.identical( got, expected );

  // if( Config.debug )
  // {
  //
  // }

};

//

function entityValueWithIndex( test )
{
  test.description = 'array';
  var got = _.entityValueWithIndex( [ [ 1, 2, 3 ] ], 0 );
  var expected = [ 1, 2, 3 ] ;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.entityValueWithIndex( { a : 1, b : [ 1, 2, 3 ] }, 1 );
  var expected = [ 1, 2, 3 ] ;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.entityValueWithIndex( 'simple string', 5 );
  var expected = 'e' ;
  test.identical( got, expected );

  test.description = 'empty call';
  var got = _.entityValueWithIndex( );
  var expected = undefined ;
  test.identical( got, expected );

  test.description = 'other type';
  var got = _.entityValueWithIndex( true , 1);
  var expected = undefined ;
  test.identical( got, expected );

  test.description = 'index undefined';
  var got = _.entityValueWithIndex( 'str' );
  var expected = undefined ;
  test.identical( got, expected );

  // if( Config.debug )
  // {
  //
  // }

};

//

function entityKeyWithValue( test )
{
  test.description = 'array';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ], 3 );
  var expected =  2;
  test.identical( got, expected );

  test.description = 'array#2';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ], 'a' );
  var expected =  null;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.entityKeyWithValue( { a : 1, b : 'a' }, 'a' );
  var expected =  'b';
  test.identical( got, expected );

  test.description = 'empty call';
  var got = _.entityKeyWithValue( );
  var expected =  null;
  test.identical( got, expected );

  test.description = 'value undefined';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ] );
  var expected =  null;
  test.identical( got, expected );


  // if( Config.debug )
  // {
  //
  // }

};

// //
//
// function _entitySelectOptions( test )
// {
//   test.description = 'two args call';
//   var container = [ 1, 2, 3, 4 ];
//   var query = '0.1.2';
//   var got = _._entitySelectOptions( container, query );
//   var expected =
//   {
//     container : container,
//     query : query,
//     set : null,
//     delimeter : [ '.','[',']' ],
//     qarrey : [ "0", "1", "2" ],
//     undefinedForNone : 1
//   };
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'query as string, options in object';
//   var o =
//   {
//     container : [ 1, 2, 3, 4 ],
//     query : '0.1.2',
//   };
//
//   var got = _._entitySelectOptions( o );
//   var expected =
//   {
//     container : o.container,
//     query : o.query,
//     set : null,
//     delimeter : [ '.','[',']' ],
//     qarrey : [ "0", "1", "2" ],
//     undefinedForNone : 1
//   };
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'query as array';
//   var o =
//   {
//     container : [ 1, [ 2, 3, 4 ], 5 ],
//     query : [ '1','1'],
//     set : 12,
//   };
//
//   var got = _._entitySelectOptions( o );
//   var expected =
//   {
//     container : o.container,
//     query : o.query,
//     set : o.set,
//     delimeter : [ '.','[',']' ],
//     qarrey : [ [ "1" ], [ "1" ] ],
//     undefinedForNone : 1
//   };
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'object,set,delimeter,undefinedForNone';
//   var o =
//   {
//     container : { a : { b : { c : 1 } } },
//     query : 'a->b->c',
//     set : '0',
//     delimeter : [ '->' ],
//     undefinedForNone : 0
//   };
//
//   var got = _._entitySelectOptions( o );
//   var expected =
//   {
//     container : o.container,
//     query : o.query,
//     set : o.set,
//     delimeter : o.delimeter,
//     qarrey : [ "a", "b", "c" ],
//     undefinedForNone : o.undefinedForNone
//   };
//   test.identical( got, expected );
//
//   if( Config.debug )
//   {
//     test.description = 'argument missed';
//     test.shouldThrowError( function()
//     {
//       _._entitySelectOptions( );
//     });
//
//     test.description = 'extended by unknown property';
//     test.shouldThrowError( function()
//     {
//       _._entitySelectOptions( { fff : 0 } );
//     });
//
//     test.description = 'query is not String or Array';
//     test.shouldThrowError( function()
//     {
//       _._entitySelectOptions( [ 1, 2, 3 ], 1 );
//     });
//
//     test.description = 'options are not in Object';
//     test.shouldThrowError( function()
//     {
//       _._entitySelectOptions( [ [ 0,1,2 ], '0' ] );
//     });
//
//   }
//
// };

//

// function __entitySelectAct( test )
// {
//   test.description = 'qarrey is empty';
//   var o =
//   {
//     container : [ 1, 2, 3 ],
//     set : 'x',
//     qarrey : [ ],
//     undefinedForNone : 1
//   };
//   var got = _.__entitySelectAct( o );
//   var expected = o.container;
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'atomic';
//   var o =
//   {
//     container : 1,
//     set : 'x',
//     qarrey : [ "0" ],
//     undefinedForNone : 1
//   };
//   var got = _.__entitySelectAct( o );
//   var expected = undefined;
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'qarrey has "*"';
//   var o =
//   {
//     container : [ 1, [ 2, 3, 4 ], 5],
//     qarrey : [ "*" ],
//     set : 'x',
//     undefinedForNone : 1
//   };
//   var got = _.__entitySelectAct( o );
//   var expected = ["x", "x", "x"];
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'replace all in arr inside container';
//   var o =
//   {
//     container : [ 1, [ 2, 3, 4 ], 5],
//     qarrey : [ "1","*" ],
//     set : 'x',
//     undefinedForNone : 1
//   };
//   _.__entitySelectAct( o );
//   var got = o.container[ 1 ];
//   var expected = ["x", "x", "x"];
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'index values is undefined';
//   var o =
//   {
//     container : [ 1, [ 2, 3, 4 ], 5],
//     qarrey : [ "3" ],
//     set : 'x',
//     undefinedForNone : 1
//   };
//   _.__entitySelectAct( o );
//   var got = o.container[ 3 ];
//   var expected = o.set;
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'object';
//   var o =
//   {
//     container : { a : { b : { c : 0 } } },
//     qarrey : [ "a", "b" ],
//     set : 'x',
//     undefinedForNone : 1
//   };
//   _.__entitySelectAct( o );
//   var got = o.container;
//   var expected = { a : { b : 'x' } };
//   test.identical( got, expected );
//
//   //
//
//   if( Config.debug )
//   {
//     test.description = 'atomic, undefinedForNone false';
//     test.shouldThrowError( function()
//     {
//       _.__entitySelectAct( { container : 1, qarrey : [ "0" ], undefinedForNone : 0 } );
//     });
//
//   }
//
// }

//

// function entityGroup( test )
// {
//   test.description = 'default options';
//   var o =
//   {
//     src : [ { a : 1, b : 1 }, { a : 2, b : 2 } ],
//   };
//   var got = _.entityGroup( o );
//   var expected =
//   {
//     a : [ 1, 2 ],
//     b : [ 1, 2 ]
//   }
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'one key';
//     var o =
//     {
//       src : [ { a : 1, b : 1 }, { a : 2, b : 2 } ],
//       key : [ 'a' ]
//     };
//     var got = _.entityGroup( o );
//   var expected =
//   {
//     a : { 1 : [ o.src[ 0 ] ], 2 : [ o.src[ 1 ] ] }
//   }
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'one key, usingOriginal false';
//     var o =
//     {
//       src : [ { a : 1, b : 1 }, { a : 2, b : 2 } ],
//       key : [ 'a' ],
//       usingOriginal : 0
//     };
//     var got = _.entityGroup( o );
//   var expected =
//   {
//     a : [ 1, 2 ]
//   }
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'key as string';
//   var o =
//   {
//     src : [ { a : 1, b : 1 }, { b : 1 }, { a : 2, b : 2 } ],
//     key : 'b',
//   };
//   var got = _.entityGroup( o );
//   var expected =
//   {
//     "1" : [ { a : 1, b : 1 }, { b : 1 } ],
//     "2" : [ { a : 2, b : 2 } ],
//   }
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'src objectLike, key as string';
//   var o =
//   {
//     src : { a : { b : 1 }, b : { b : 1 }, c : { b : 2 } },
//     key : 'b',
//   };
//   var got = _.entityGroup( o );
//   var expected =
//   {
//     "1" : [ { b : 1 }, { b : 1 } ],
//     "2" : [ { b : 2 } ]
//   }
//   test.identical( got, expected );
//
//   //
//
//   test.description = 'array';
//   var o =
//   {
//     src : [ [ 0, 1, 1 ],[ 0, 2, 2 ] ],
//     key : [ 0],
//   };
//   var got = _.entityGroup( o );
//   var expected =
//   {
//     "0" :
//     {
//       "0" :
//       [
//         [ 0, 1, 1 ],
//         [ 0, 2, 2 ]
//       ],
//     }
//   }
//   test.identical( got, expected );
//
//   //
//
//   if( Config.debug )
//   {
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//        _.entityGroup();
//     });
//
//     test.description = 'invalid key type';
//     test.shouldThrowError( function()
//     {
//       var o =
//       {
//         src : [ { a : 1, b : 1 }, { b : 1 } ],
//         key : { a : 1 },
//       };
//        _.entityGroup( o );
//     });
//
//     test.description = 'invalid src type';
//     test.shouldThrowError( function()
//     {
//       var o =
//       {
//         src : 12,
//         key : 'a',
//       };
//        _.entityGroup( o );
//     });
//
//   }
//
// };

//

var Self =
{

  name : 'entity',
  silencing : 1,

  tests :
  {

    entityMap    : entityMap,
    entityFilter : entityFilter,

    _entityMost  : _entityMost,
    entityMin    : entityMin,
    entityMax    : entityMax,

    _entityEqualAct  : _entityEqualAct,
    entityIdentical : entityIdentical,
    entityEquivalent : entityEquivalent,
    entityContain : entityContain,

    entityLength : entityLength,
    entityCopyTry : entityCopyTry,
    entityCopyField : entityCopyField,
    entityCoerceTo : entityCoerceTo,
    entityHasNan : entityHasNan,
    entityHasUndef : entityHasUndef,
    _entityEqual : _entityEqual,
    entityDiff : entityDiff,
    entitySize : entitySize,
    entityValueWithIndex : entityValueWithIndex,
    entityKeyWithValue : entityKeyWithValue,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
