( function _Entity_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );
  _.include( 'wCloner' );
  _.include( 'wStringsExtra' );

}

var _global = _global_; var _ = _global_.wTools;
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

  if( !Config.debug )
  return;

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

  if( !Config.debug )
  return;

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

  if( !Config.debug )
  return;

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

  if( !Config.debug )
  return;

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

  if( !Config.debug )
  return;

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

function entityAssign( test )
{
  test.description = 'src null';
  var dst = new String( 'string' );
  var src = null;
  var got = _.entityAssign( dst, src  );
  var expected = null;
  test.identical( got, expected );

  test.description = 'dst.copy';
  var dst = { copy : function( src ) { for( var i in src ) this[ i ] = src[ i ] } };
  var src = { src : 'string', num : 123 }
  _.entityAssign( dst, src  );
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
  var got = _.entityAssign( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.description = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2 ,3 ];
  var got = _.entityAssign( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.description = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entityAssign( dst, src  );
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
  _.entityAssign( dst, src, onRecursive  );
  var got = dst;
  var expected = src;
  test.identical( got, expected );

  test.description = 'atomic ';
  var src = 2;
  var got = _.entityAssign( null, src );
  var expected = src;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.description = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityAssign( );
  });

  test.description = 'src.clone throws "unexpected"';
  test.shouldThrowError( function()
  {
    var dst = {};
    var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
    _.entityAssign( dst, src  );
  });

}

//

function entityAssignFieldFromContainer( test )
{

  test.description = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entityAssignFieldFromContainer(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.description = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entityAssignFieldFromContainer(dst, src, name );
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
  var got = _.entityAssignFieldFromContainer(dst, src, name,onRecursive );
  var expected = dst[ name ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.description = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityAssignFieldFromContainer( );
  });

}

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

  if( !Config.debug )
  return;

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

  if( !Config.debug )
  return;

  test.description = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityHasNan( );
  });

}

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

  if( !Config.debug )
  return;

  test.description = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityHasUndef( );
  });

}

//

function entitySize( test )
{

  test.description = 'string';
  var got = _.entitySize( 'str' );
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
  var got = _.entitySize( undefined );
  var expected = null;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.entitySize();
  });

  test.description = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entitySize( 1,2 );
  });

  test.description = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entitySize( 1,undefined );
  });

  test.description = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entitySize( [],undefined );
  });

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

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex();
  });

  test.description = 'no selector';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( [ 1 ] );
  });

  test.description = 'bad selector';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( [ 0 ],'1' );
  });

  test.description = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( true,0 );
  });

  test.description = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( 1,2 );
  });

  test.description = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( 1,undefined );
  });

  test.description = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( [ 0 ],0,0 );
  });

}

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

  test.description = 'value undefined';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ], undefined );
  var expected =  null;
  test.identical( got, expected );

  test.description = 'value string';
  var got = _.entityKeyWithValue( [ 0 ],'1' );
  var expected =  null;
  test.identical( got, expected );

  test.description = 'value string';
  var got = _.entityKeyWithValue( [ 0 ],'1' );
  var expected =  null;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue();
  });

  test.description = 'no selector';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( [ 1 ] );
  });

  test.description = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( true,0 );
  });

  test.description = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( 1,2 );
  });

  test.description = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( 1,undefined );
  });

  test.description = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( [ 0 ],0,0 );
  });

}

//

var Self =
{

  name : 'Tools/base/laye1/Entity',
  silencing : 1,
  // verbosity : 4,
  // importanceOfNegative : 3,

  tests :
  {

    entityMap    : entityMap,
    entityFilter : entityFilter,

    _entityMost  : _entityMost,
    entityMin    : entityMin,
    entityMax    : entityMax,

    entityLength : entityLength,
    entityAssign : entityAssign,
    entityAssignFieldFromContainer : entityAssignFieldFromContainer,
    entityCoerceTo : entityCoerceTo,
    entityHasNan : entityHasNan,
    entityHasUndef : entityHasUndef,
    entitySize : entitySize,

    entityValueWithIndex : entityValueWithIndex,
    entityKeyWithValue : entityKeyWithValue,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
