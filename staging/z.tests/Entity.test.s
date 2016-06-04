( function( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/z.tests/Sample.test.s

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

  var entityMap = function( test )
  {

    var entity1 = [ 3, 4, 5 ],
      entity2 = { '3': 3, '4': 4, '5': 5 },
      expected1 = [ 9, 16, 25 ],
      expected2 = { '3': 9, '4': 16, '5': 25 },
      expected3 = entity1.slice();

    var constr1 = function() {
      this.a = 1;
      this.b = 3;
      this.c = 4;
    }
    var entity4 = new constr1(),
      expected4 = { a: '1a', b: '9b', c: '16c'};


    var callback1 = function(v, i, ent) {
      return v * v;
    };

    var callback2 = function(v, i, ent) {
      return v * v + i;
    };

    var callback3 = function(v, i, ent) {
      if (externEnt) externEnt = ent;
      return v * v + i;
    };

    test.description = 'simple test with mapping array by sqr';
    var got = _.entityMap(entity1, callback1);
    test.identical( got,expected1 );

    test.description = 'simple test with mapping array by sqr: source array should not be modified';
    var got = _.entityMap(entity1, callback1);
    test.identical( entity1, expected3 );

    test.description = 'simple test with mapping object by sqr';
    var got = _.entityMap(entity2, callback1);
    test.identical( got,expected2 );

    test.description = 'simple test with mapping object by sqr: using constructor';
    var got = _.entityMap(entity4, callback2);
    test.identical( got, expected4 );

    test.description = 'simple test with mapping object by sqr: check constructor';
    test.identical( got instanceof constr1, true );

    test.description = 'simple test with mapping object by sqr: check callback arguments';
    var externEnt = {};
    var got = _.entityMap(entity4, callback3);
    test.identical( externEnt, entity4 );

    if( Object.is )
    {
      test.description = 'simple test with mapping object by sqr: source object should be unmodified';
      test.identical( Object.is(got, entity4), false );
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
        _.entityMap( [ 1,3 ], callback1, callback2);
      });

      test.description = 'passed argument is not ArrayLike, ObjectLike';
      test.shouldThrowError( function()
      {
        _.entityFilter( 44, callback1);
      });

      test.description = 'second argument is not routine';
      test.shouldThrowError( function()
      {
        _.entityMap( [ 1,3 ], 'callback');
      });

    }

  };

  //

  var entityFilter = function( test ) {
    var entity1 = [ 9, -16, 25, 36, -49 ],
      entity2 = { '3': 9, '4': 16, '5': 25 },
      expected1 = [ 3, 5, 6 ],
      expected2 = { '3': 3, '4': 4, '5': 5 },
      expected3 = entity1.slice();

    var callback1 = function(v, i, ent) {
      if( v < 0 ) return;
      return Math.sqrt(v);
    };

    var testFn1 = function() {
      console.log(arguments);
      return _.entityFilter(arguments, callback1);
    }

    test.description = 'simple test with mapping array by sqrt';
    var got = _.entityFilter(entity1, callback1);
    test.identical( got,expected1 );

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

    test.description = 'simple test with mapping array by sqrt: source array should not be modified';
    var got = _.entityFilter(entity1, callback1);
    test.identical( entity1, expected3 );

    test.description = 'simple test with mapping object by sqrt';
    var got = _.entityFilter(entity2, callback1);
    test.identical( got,expected2 );

    test.description = 'simple test with mapping array by sqrt';
    var got = _.entityFilter(entity1, callback1);
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
        _.entityFilter( [ 1,3 ], callback1, callback2);
      });

      test.description = 'passed argument is not ArrayLike, ObjectLike';
      test.shouldThrowError( function()
      {
        _.entityFilter( 44, callback1);
      });

      test.description = 'second argument is not routine';
      test.shouldThrowError( function()
      {
        _.entityFilter( [ 1,3 ], 'callback');
      });

    }
  };

  //

  var _entityMost = function( test ) {

    var args1 = [ 3, 1, 9, 0, 5 ],
      args2 = [3, -4, 9, -16, 5, -2],
      args3 = { a: 25, b: 16, c: 9 },
      expected1 = { index : 2, key : 2, value : 9, element : 9 },
      expected2 = { index : 3, key : 3, value : 0, element : 0 },
      expected3 = { index : 3, key : 3, value : 256, element : -16 },
      expected4 = args2.slice(),
      expected5 = { index : 5, key : 5, value : 4, element : -2 },
      expected6 = { index : 0, key : 'a', value : 25, element : 25  },
      expected7 = { index : 2, key : 'c', value : 3, element : 9  };

    var sqr = function(v)
    {
      return v * v;
    };

    test.description = 'test entityMost with array and default onElement and returnMax = true';
    var got = _._entityMost(args1, undefined, true);
    test.identical(got, expected1);

    test.description = 'test entityMost with array and default onElement and returnMax = false';
    var got = _._entityMost(args1, undefined, false);
    test.identical(got, expected2);

    test.description = 'test entityMost with array simple onElement function and returnMax = true';
    var got = _._entityMost(args2, sqr, true);
    test.identical(got, expected3);

    test.description = 'test entityMost with array: passed array should be unmodified';
    test.identical(args2, expected4);

    test.description = 'test entityMost with array simple onElement function and returnMax = false';
    var got = _._entityMost(args2, sqr, false);
    test.identical(got, expected5);

    test.description = 'test entityMost with map and default onElement and returnMax = true';
    var got = _._entityMost(args3, undefined, true);
    test.identical(got, expected6);

    test.description = 'test entityMost with map and returnMax = false';
    var got = _._entityMost(args3, Math.sqrt, false);
    test.identical(got, expected7);

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
        _._entityMost( [ 1,3 ], sqr, true, false);
      });

      test.description = 'second argument is not routine';
      test.shouldThrowError( function()
      {
        _._entityMost( [ 1,3 ], 'callback', true);
      });
    }

  };

  //

  var entityMin = function( test )
  {
    var args1 = [ 3, 1, 9, 0, 5 ],
      args2 = [3, -4, 9, -16, 5, -2],
      args3 = { a: 25, b: 16, c: 9 },
      expected1 = { index : 3, key : 3, value : 0, element : 0 },
      expected2 = { index : 5, key : 5, value : 4, element : -2 },
      expected3 = args2.slice(),
      expected4 = { index : 2, key : 'c', value : 9, element : 9  };

    var sqr = function(v)
    {
      return v * v;
    };

    test.description = 'test entityMin with array and without onElement callback';
    var got = _.entityMin(args1);
    test.identical(got, expected1);



    test.description = 'test entityMin with array simple onElement function';
    var got = _.entityMin(args2, sqr);
    test.identical(got, expected2);

    test.description = 'test entityMin with array: passed array should be unmodified';
    test.identical(args2, expected3);



    test.description = 'test entityMin with map';
    var got = _.entityMin(args3);
    test.identical(got, expected4);



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
        _.entityMin( [ 1,3 ], sqr, true);
      });

      test.description = 'second argument is not routine';
      test.shouldThrowError( function()
      {
        _.entityMin( [ 1,3 ], 'callback');
      });
    }
  };

  //

  var entityMax = function( test )
  {

    var args1 = [ 3, 1, 9, 0, 5 ],
      args2 = [3, -4, 9, -16, 5, -2],
      args3 = { a: 25, b: 16, c: 9 },
      expected1 = { index : 2, key : 2, value : 9, element : 9 },
      expected2 = args2.slice(),
      expected3 = { index : 3, key : 3, value : 256, element : -16 },
      expected4 = { index : 0, key : 'a', value : 5, element : 25  };

    var sqr = function(v)
    {
      return v * v;
    };

    test.description = 'test entityMax with array';
    var got = _.entityMax(args1);
    test.identical(got, expected1);

    test.description = 'test entityMax with array and simple onElement function';
    var got = _.entityMax(args2, sqr);
    test.identical(got, expected3);

    test.description = 'test entityMax with array: passed array should be unmodified';
    test.identical(args2, expected2);

    test.description = 'test entityMax with map';
    var got = _.entityMax(args3, Math.sqrt);
    test.identical(got, expected4);

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
        _.entityMax( [ 1,3 ], sqr, true);
      });

      test.description = 'second argument is not routine';
      test.shouldThrowError( function()
      {
        _.entityMax( [ 1,3 ], 'callback');
      });
    }
  };

  //

  var  _entitySame = function( test )
  {
    // number values

    var sameNumbers1 = function( a,b )
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
        strX3 = '0', strY3 = new String('0');

    // array values

    var arrX1 = [], arrY1 = [],
      arrX2 = [ 0, 1, 3 ],              arrY2 = [ 0, 1, 3 ],
      arrX3 = [ 0, 1, 3 ],              arrY3 = [ 0, 1, 2 ],
      arrX4 = [ 0, 1, [ 2, 3 ] ],       arrY4 = [ 0, 1, [ 2, 3 ] ],
      arrX5 = [ 0, 1, { a: 2, b: 3 } ], arrY5 = [ 0, 1, { a: 2, b: 3 } ],
      arrX6 = [ 0, 1, 3 ],              arrY6 = [ '0', '1', '2' ];

    // object values

    var constructor1 = function() {
      this.a = 1;
      this.b = 2;
    };

    var constructor2 = function() {
      this['a'] = 1;
      this['b'] = 2;
    };

    var objX1 = {}, objY1 = {},
      objX2 = { a: 0, b: 1, c: 3 },              objY2 = { a: 0, b: 1, c: 3 },
      objX3 = { a: 0, b: 1, c: 3 },              objY3 = { a: 0, b: 1, c: 2 },
      objX4 = { a: 0, b: 1, e: { c: 2, d: 3 } }, objY4 = { a: 0, b: 1, e: { c: 2, d: 3 } },
      objX5 = { a: 0, b: 1, c: 3 },              objY5 = { a: '0', b: '1', c: '2' },
      objX6 = new constructor1(),                objY6 = new constructor1(),
      objX7 = objX6,                             objY7 = new constructor2();

    // numbers test

    test.description = 'entity same +0 and -0';
    var got = _._entitySame(x1, y1, options1, '');
    test.identical(got, true);

    test.description = 'entity same Number.MAX_VALUE';
    var got = _._entitySame(x2, y2, options1, '');
    test.identical(got, true);

    test.description = 'entity not same numbers';
    var got = _._entitySame(x3, y3, options1, '');
    test.identical(got, false);

    // string tests

    test.description = 'entities is two empty strings';
    var got = _._entitySame(strX1, strY1, options1, '');
    test.identical(got, true);

    test.description = 'entities is two non empty strings';
    var got = _._entitySame(strX2, strY2, options1, '');
    test.identical(got, true);

    test.description = 'entity same: string and object strict mode';
    var got = _._entitySame(strX3, strY3, options1, '');
    test.identical(got, false);

    test.description = 'entity same: string and object non strict mode';
    var got = _._entitySame(strX3, strY3, options2, '');
    test.identical(got, true);

    // array tests

    test.description = 'entities is two empty arrays';
    var got = _._entitySame(arrX1, arrY1, options1, '');
    test.identical(got, true);

    test.description = 'entities is two non empty arrays';
    var got = _._entitySame(arrX2, arrY2, options1, '');
    test.identical(got, true);

    test.description = 'entities is two non empty different arrays';
    var got = _._entitySame(arrX3, arrY3, options1, '');
    test.identical(got, false);

    test.description = 'entities is two non empty nested arrays';
    var got = _._entitySame(arrX4, arrY4, options1, '');
    test.identical(got, true);

    test.description = 'entities is two arrays with objects as elements';
    var got = _._entitySame(arrX5, arrY5, options1, '');
    test.identical(got, true);

    test.description = 'entities is two arrays with strict mode';
    var got = _._entitySame(arrX6, arrY6, options1, '');
    test.identical(got, false);

    test.description = 'entities is two arrays without strict mode';
    var got = _._entitySame(arrX5, arrY5, options2, '');
    test.identical(got, true);

    // object tests

    test.description = 'entities is two empty objects';
    var got = _._entitySame(objX1, objY1, options1, '');
    test.identical(got, true);

    test.description = 'entities is two non empty objects';
    var got = _._entitySame(objX2, objY2, options1, '');
    test.identical(got, true);

    test.description = 'entities is two different objects';
    var got = _._entitySame(objX3, objY3, options1, '');
    test.identical(got, false);

    test.description = 'entities is two non empty nested objects';
    var got = _._entitySame(objX4, objY4, options1, '');
    test.identical(got, true);

    test.description = 'entities is two objects with different type elements: strict mode';
    var got = _._entitySame(objX5, objY5, options1, '');
    test.identical(got, false);

    test.description = 'entities is two objects with different type elements: non strict mode';
    var got = _._entitySame(objX5, objY5, options2, '');
    test.identical(got, true);

    test.description = 'entities is two objects';
    var got = _._entitySame(objX6, objY6, options1, '');
    test.identical(got, true);

    test.description = 'entities is two same objects: different constructors';
    var got = _._entitySame(objX7, objY7, options1, '');
    test.identical(got, true);
  };

  //

  var Proto =
  {

    name : 'entity',

    tests:
    {

      entityMap    : entityMap,
      entityFilter : entityFilter,
      _entityMost  : _entityMost,
      entityMin    : entityMin,
      entityMax    : entityMax,
      _entitySame  : _entitySame

    }

  };

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
