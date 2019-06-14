( function _Entity_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../Tools.s' );

  _.include( 'wTesting' );
  // _.include( 'wCloner' );
  // _.include( 'wStringsExtra' );

}

var _global = _global_;
var _ = _global_.wTools;
var Self = {};

// --
//
// --

function eachSample( test )
{

  test.case = 'simplest leftToRight : 1'; /* */

  var expected =
  [
    [ 0,2,5 ],[ 1,2,5 ],
    [ 0,3,5 ],[ 1,3,5 ],
    [ 0,4,5 ],[ 1,4,5 ],
  ];

  var got = _.eachSample
  ({
    sets : [ [ 0,1 ],[ 2,3,4 ],[ 5 ] ],
    leftToRight : 1,
  });

  test.identical( got, expected );

  test.case = 'simplest leftToRight : 0'; /* */

  var expected =
  [
    [ 0,2,5 ],[ 0,3,5 ],[ 0,4,5 ],
    [ 1,2,5 ],[ 1,3,5 ],[ 1,4,5 ],
  ];

  var got = _.eachSample
  ({
    sets : [ [ 0,1 ],[ 2,3,4 ],[ 5 ] ],
    leftToRight : 0,
  });

  test.identical( got, expected );

  test.case = 'simplest leftToRight : 1'; /* */

  var expected =
  [
    { a : 0,b : 2,c : 5 },{ a : 1,b : 2,c : 5 },
    { a : 0,b : 3,c : 5 },{ a : 1,b : 3,c : 5 },
    { a : 0,b : 4,c : 5 },{ a : 1,b : 4,c : 5 },
  ];

  var got = _.eachSample
  ({
    sets : { a : [ 0,1 ],b : [ 2,3,4 ], c : [ 5 ] },
    leftToRight : 1,
  });

  test.identical( got, expected );

  test.case = 'simplest leftToRight : 0'; /* */

  var expected =
  [
    { a : 0,b : 2,c : 5 },{ a : 0,b : 3,c : 5 },{ a : 0,b : 4,c : 5 },
    { a : 1,b : 2,c : 5 },{ a : 1,b : 3,c : 5 },{ a : 1,b : 4,c : 5 },
  ];

  var got = _.eachSample
  ({
    sets : { a : [ 0,1 ],b : [ 2,3,4 ], c : [ 5 ] },
    leftToRight : 0,
  });

  test.identical( got, expected );

  logger.log( 'expected',_.toStr( expected,{ levels : 5 } ) );
  logger.log( 'got',_.toStr( got,{ levels : 5 } ) );

}

//

function entityEach( test )
{
  test.case = 'src is not array or object';

  var got;
  _.entityEach( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEach( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEach( 'a', ( v ) => got = typeof v );
  test.identical( got, 'string' );

  var got;
  _.entityEach( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEach( function b(){ return 'a'}, ( v ) => got = typeof v );
  test.identical( got, 'function' );

  var got;
  _.entityEach( 'a', ( v, i ) => got = v + i );
  test.identical( got, 'aundefined' );

  var got;
  _.entityEach( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  //

  test.case = 'src is an array';

  var got;
  _.entityEach( [], ( v ) => got = typeof v );
  test.identical( got, 'function undefined' );

  var got = [];
  _.entityEach( [], ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );

  var got = [];
  _.entityEach( [ 3 ], ( v, i ) => got[ i ] = v + i + 2 );
  test.identical( got, [ 5 ] );

  var got = [];
  _.entityEach( [ 0, 1, 2 ], ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );

  test.case = 'routine counter';

  function onEach( v, i )
  {
    if( _.strIs( v ) && i >= 0 )
    got += 10;
    got -= 1;
  }

  var got = 0;
  _.entityEach( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( [ 'abc' ], onEach );
  test.identical( got, 10 );

  var got = 0;
  _.entityEach( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEach( [ [ 'a', 'b' ], [ 1, 3, 4 ] ], onEach );
  test.identical( got, -2 );

  var got = 0;
  _.entityEach( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  //

  test.case = 'src is an object';

  var got;
  _.entityEach( {}, ( v ) => got = v );
  test.identical( got, -2 );

  var got = {};
  _.entityEach( {}, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  _.entityEach( { 1 : 2 }, ( v, k ) => got[ k ] = v + k + 2 );
  test.identical( got, { 1 : '212' } );

  var got = {};
  _.entityEach( { a : 1, b : 3, c : 5 }, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b', c : '25c' } );

  test.case = 'routine counter';

  function onEach1( v, k )
  {
    if( _.strIs( v ) && k )
    got += 10;
    got -= 1;
  }

  var got = 0;
  _.entityEach( 1, onEach1 );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( 'abc', onEach1 );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( { a : 'abc' }, onEach1 );
  test.identical( got, 10 );

  var got = 0;
  _.entityEach( { a : 'abc', b : 1, c : 'ab', d : 'a' }, onEach1 );
  test.identical( got, 29 );

  var got = 0;
  _.entityEach( { a : [ 'a', 'b' ], b : [ 1, 3, 4 ] }, onEach1 );
  test.identical( got, -2 );

  var got = 0;
  _.entityEach( { a : { a : 1 }, b : { b : 2 } }, onEach1 );
  test.identical( got, -2 );

  //

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEach() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEach( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then two arg';
  test.shouldThrowErrorSync( () => _.entityEach( [ 1 ], ( a, b, c ) => a + b + c ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEach( { a : 2 }, [] ) );
}

//

function entityEachKey( test )
{
  test.case = 'src is not array or object';

  var got;
  _.entityEachKey( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEachKey( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEachKey( 'a', ( v ) => got = typeof v );
  test.identical( got, 'string' );

  var got;
  _.entityEachKey( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEachKey( function b(){ return 'a'}, ( v ) => got = typeof v );
  test.identical( got, 'function' );

  var got;
  _.entityEachKey( 'a', ( v, i ) => got = v + i );
  test.identical( got, 'aundefined' );

  var got;
  _.entityEachKey( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  //

  test.case = 'src is an array';
  var got;
  _.entityEachKey( [], ( v ) => got = typeof v );
  test.identical( got, 'function undefined' );

  var got = [];
  _.entityEachKey( [], ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );

  var got = [];
  _.entityEachKey( [ 3 ], ( v ) => got.push( v + 2 ) );
  test.identical( got, [ 5 ] );

  var got = [];
  _.entityEachKey( [ 0, 1, 2 ], ( v ) => got.push( v * v ) );
  test.identical( got, [ 0, 1, 4 ] );

  test.case = 'routine counter';
  function onEach( v, i )
  {
    if( _.strIs( v ) && i === undefined )
    got += 10;
    got -= 1;
  }

  var got = 0;
  _.entityEachKey( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachKey( 'abc', onEach );
  test.identical( got, 10 );

  var got = 0;
  _.entityEachKey( [ 'abc' ], onEach );
  test.identical( got, 10 );

  var got = 0;
  _.entityEachKey( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEachKey( [ [ 'a', 'b' ], [ 1, 3, 4 ] ], onEach );
  test.identical( got, -2 );

  var got = 0;
  _.entityEachKey( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  //

  test.case = 'src is an object';
  var got;
  _.entityEachKey( {}, ( v ) => got = v );
  test.identical( got, -2 );

  var got = {};
  _.entityEachKey( {}, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  _.entityEachKey( { 1 : 2 }, ( k, v ) => got[ k ] = v + k + 2 );
  test.identical( got, { 1 : '212' } );

  var got = {};
  _.entityEachKey( { a : 1, b : 3, c : 5 }, ( k, v ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b', c : '25c' } );

  test.case = 'routine counter';
  function onEach1( k, v )
  {
    if( _.strIs( v ) && k )
    got += 10;
    got -= 1;
  }

  var got = 0;
  _.entityEachKey( 1, onEach1 );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachKey( 'abc', onEach1 );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachKey( { a : 'abc' }, onEach1 );
  test.identical( got, 10 );

  var got = 0;
  _.entityEachKey( { a : 'abc', b : 1, c : 'ab', d : 'a' }, onEach1 );
  test.identical( got, 29 );

  var got = 0;
  _.entityEachKey( { a : [ 'a', 'b' ], b : [ 1, 3, 4 ] }, onEach1 );
  test.identical( got, -2 );

  var got = 0;
  _.entityEachKey( { a : { a : 1 }, b : { b : 2 } }, onEach );
  test.identical( got, -2 );

  //

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEachKey() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEachKey( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then two arg';
  test.shouldThrowErrorSync( () => _.entityEachKey( [ 1 ], ( a, b, c ) => a + b + c ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEachKey( { a : 2 }, [] ) );
}

//

function entityEachOwn( test )
{
  test.case = 'src is not array or object';

  var got;
  _.entityEachOwn( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEachOwn( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEachOwn( 'a', ( v ) => got = typeof v );
  test.identical( got, 'string' );

  var got;
  _.entityEachOwn( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEachOwn( function b(){ return 'a'}, ( v ) => got = typeof v );
  test.identical( got, 'function' );

  var got;
  _.entityEachOwn( 'a', ( v, i ) => got = v + i );
  test.identical( got, 'aundefined' );

  var got;
  _.entityEachOwn( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  //

  test.case = 'src is an array';

  var got;
  _.entityEachOwn( [], ( v ) => got = typeof v );
  test.identical( got, 'function undefined' );

  var got = [];
  _.entityEachOwn( [], ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );

  var got = [];
  _.entityEachOwn( [ 3 ], ( v, i ) => got[ i ] = v + i + 2 );
  test.identical( got, [ 5 ] );

  var got = [];
  _.entityEachOwn( [ 0, 1, 2 ], ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );

  test.case = 'routine counter';

  function onEach( v, i )
  {
    if( _.strIs( v ) && i >= 0 )
    got += 10;
    got -= 1;
  }

  var got = 0;
  _.entityEachOwn( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( [ 'abc' ], onEach );
  test.identical( got, 10 );

  var got = 0;
  _.entityEachOwn( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEachOwn( [ [ 'a', 'b' ], [ 1, 3, 4 ] ], onEach );
  test.identical( got, -2 );

  var got = 0;
  _.entityEachOwn( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  //

  test.case = 'src is an object';

  var got;
  _.entityEachOwn( {}, ( v ) => got = v );
  test.identical( got, -2 );

  var got = {};
  _.entityEachOwn( {}, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  _.entityEachOwn( { 1 : 2 }, ( v, k ) => got[ k ] = v + k + 2 );
  test.identical( got, { 1 : '212' } );

  var got = {};
  _.entityEachOwn( { a : 1, b : 3, c : 5 }, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b', c : '25c' } );

  test.case = 'routine counter';

  function onEach1( v, k )
  {
    if( _.strIs( v ) && k )
    got += 10;
    got -= 1;
  }

  var got = 0;
  _.entityEachOwn( 1, onEach1 );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( 'abc', onEach1 );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( { a : 'abc' }, onEach1 );
  test.identical( got, 10 );

  var got = 0;
  _.entityEachOwn( { a : 'abc', b : 1, c : 'ab', d : 'a' }, onEach1 );
  test.identical( got, 29 );

  var got = 0;
  _.entityEachOwn( { a : [ 'a', 'b' ], b : [ 1, 3, 4 ] }, onEach1 );
  test.identical( got, -2 );

  var got = 0;
  _.entityEachOwn( { a : { a : 1 }, b : { b : 2 } }, onEach1 );
  test.identical( got, -2 );

  //

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEachOwn() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then two arg';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 1 ], ( a, b, c ) => a + b + c ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEachOwn( { a : 2 }, [] ) );
}

//



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

  test.case = 'simple test with mapping array by sqr';
  var got = _.entityMap( entity1, callback1 );
  test.identical( got,expected1 );

  test.case = 'simple test with mapping array by sqr : source array should not be modified';
  var got = _.entityMap( entity1, callback1 );
  test.identical( entity1, expected3 );

  test.case = 'simple test with mapping object by sqr';
  var got = _.entityMap( entity2, callback1 );
  test.identical( got,expected2 );

  test.case = 'simple test with mapping object by sqr : using constructor';
  var got = _.entityMap( entity4, callback2 );
  test.identical( got, expected4 );
  test.is( !( got instanceof constr1 ) );
  test.is( _.mapIs( got ) );

  test.case = 'simple test with mapping object by sqr : check callback arguments';
  var externEnt = {};
  var got = _.entityMap( entity4, callback3 );
  test.identical( externEnt, entity4 );

  if( Object.is )
  {
    test.case = 'simple test with mapping object by sqr : source object should be unmodified';
    test.identical( Object.is( got, entity4 ), false );
  }

  /**/

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityMap();
  });

  test.case = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityMap( [ 1,3 ], callback1, callback2 );
  });

  test.case = 'passed argument is not ArrayLike, ObjectLike';
  test.shouldThrowError( function()
  {
    _.entityFilter( 44, callback1 );
  });

  test.case = 'second argument is not routine';
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

  test.case = 'simple test with mapping array by sqrt';
  var got = _.entityFilter( entity1, callback1 );
  test.identical( got,expected1 );

  /*
    TODO : need to check actuality of this test

    test.case = 'simple test with longIs';
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

  test.case = 'simple test with mapping array by sqrt : source array should not be modified';
  var got = _.entityFilter( entity1, callback1 );
  test.identical( entity1, expected3 );

  test.case = 'simple test with mapping object by sqrt';
  var got = _.entityFilter( entity2, callback1 );
  test.identical( got,expected2 );

  test.case = 'simple test with mapping array by sqrt';
  var got = _.entityFilter( entity1, callback1 );
  test.identical( got,expected1 );

  /**/

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityFilter();
  });

  test.case = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityFilter( [ 1,3 ], callback1, callback2 );
  });

  test.case = 'passed argument is not ArrayLike, ObjectLike';
  test.shouldThrowError( function()
  {
    _.entityFilter( 44, callback1 );
  });

  test.case = 'second argument is not routine';
  test.shouldThrowError( function()
  {
    _.entityFilter( [ 1,3 ], 'callback' );
  });

};

//

function entityAssign( test )
{
  test.case = 'src null';
  var dst = new String( 'string' );
  var src = null;
  var got = _.entityAssign( dst, src  );
  var expected = null;
  test.identical( got, expected );

  test.case = 'dst.copy';
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

  test.case = 'src.clone';
  var dst = 1;
  // var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
  var src = { src : 'string', num : 123, clone : function() { return { src : 'string', num : 123 } } }
  var got = _.entityAssign( dst, src  );
  var expected = { src : 'string', num : 123 };
  test.identical( got, expected );
  test.is( got !== expected );
  test.is( got !== src );

  test.case = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2 ,3 ];
  var got = _.entityAssign( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.case = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entityAssign( dst, src  );
  var got = dst;
  var expected = { set : dst.set, value : 100 };
  test.identical( got, expected );

  test.case = 'onRecursive ';
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

  test.case = 'atomic ';
  var src = 2;
  var got = _.entityAssign( null, src );
  var expected = src;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityAssign( );
  });

  test.case = 'src.clone throws "unexpected"';
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

  test.case = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entityAssignFieldFromContainer(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.case = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entityAssignFieldFromContainer(dst, src, name );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'recursive';
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

  test.case = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityAssignFieldFromContainer( );
  });

}

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

  test.case = 'test entityMost with array and default onElement and returnMax = true';
  var got = _._entityMost( args1, undefined, true );
  test.identical( got, expected1 );

  test.case = 'test entityMost with array and default onElement and returnMax = false';
  var got = _._entityMost( args1, undefined, false );
  test.identical( got, expected2 );

  test.case = 'test entityMost with array simple onElement function and returnMax = true';
  var got = _._entityMost( args2, sqr, true );
  test.identical( got, expected3 );

  test.case = 'test entityMost with array : passed array should be unmodified';
  test.identical( args2, expected4 );

  test.case = 'test entityMost with array simple onElement function and returnMax = false';
  var got = _._entityMost( args2, sqr, false );
  test.identical( got, expected5 );

  test.case = 'test entityMost with map and default onElement and returnMax = true';
  var got = _._entityMost( args3, undefined, true );
  test.identical( got, expected6 );

  test.case = 'test entityMost with map and returnMax = false';
  var got = _._entityMost( args3, Math.sqrt, false );
  test.identical( got, expected7 );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowError( function()
  {
    _._entityMost();
  });

  test.case = 'extra argument';
  test.shouldThrowError( function()
  {
    _._entityMost( [ 1,3 ], sqr, true, false );
  });

  test.case = 'second argument is not routine';
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

  test.case = 'test entityMin with array and without onElement callback';
  var got = _.entityMin( args1 );
  test.identical( got, expected1 );



  test.case = 'test entityMin with array simple onElement function';
  var got = _.entityMin( args2, sqr );
  test.identical( got, expected2 );

  test.case = 'test entityMin with array : passed array should be unmodified';
  test.identical( args2, expected3 );



  test.case = 'test entityMin with map';
  var got = _.entityMin( args3 );
  test.identical( got, expected4 );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityMin();
  });

  test.case = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityMin( [ 1,3 ], sqr, true );
  });

  test.case = 'second argument is not routine';
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

  test.case = 'test entityMax with array';
  var got = _.entityMax( args1 );
  test.identical( got, expected1 );

  test.case = 'test entityMax with array and simple onElement function';
  var got = _.entityMax( args2, sqr );
  test.identical( got, expected3 );

  test.case = 'test entityMax with array : passed array should be unmodified';
  test.identical( args2, expected2 );

  test.case = 'test entityMax with map';
  var got = _.entityMax( args3, Math.sqrt );
  test.identical( got, expected4 );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowError( function()
  {
    _.entityMax();
  });

  test.case = 'extra argument';
  test.shouldThrowError( function()
  {
    _.entityMax( [ 1,3 ], sqr, true );
  });

  test.case = 'second argument is not routine';
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

  test.case = 'entity is undefined';
  var got = _.entityLength( x1 );
  test.identical( got, expected1 );

  test.case = 'entity is number';
  var got = _.entityLength( x2 );
  test.identical( got, expected2 );

  test.case = 'entity is string';
  var got = _.entityLength( x3 );
  test.identical( got, expected3 );

  test.case = 'entity is array';
  var got = _.entityLength( x4 );
  test.identical( got, expected4 );

  test.case = 'entity is nested array';
  var got = _.entityLength( x5 );
  test.identical( got, expected5 );

  test.case = 'entity is object';
  var got = _.entityLength( x6 );
  test.identical( got, expected6 );

  test.case = 'entity is nested object';
  var got = _.entityLength( x7 );
  test.identical( got, expected7 );

  test.case = 'entity is array like';
  var got = _.entityLength( x8 );
  test.identical( got, expected8 );

  test.case = 'entity is array like';
  var got = _.entityLength( x8 );
  test.identical( got, expected8 );

  console.log( _.toStr( x9 ) );

  test.case = 'entity is created instance of class';
  var got = _.entityLength( x9 );
  test.identical( got, expected9 );

  test.case = 'some properties are non enumerable';
  var got = _.entityLength( x10 );
  test.identical( got, expected10 );

};

//

function entitySize( test )
{

  test.case = 'string';
  var got = _.entitySize( 'str' );
  var expected = 3 ;
  test.identical( got, expected );

// wrong because routine has this code
// if( _.numberIs( src ) )
// return 8;
// so, expected should be 8

  test.case = 'atomic type';
  var got = _.entitySize( 6 );
  var expected = null;
  test.identical( got, expected );

  test.case = 'buffer';
  var got = _.entitySize( new ArrayBuffer( 10 ) );
  var expected = 10;
  test.identical( got, expected );

// wrong because routine has code
// if( _.longIs( src ) )
// {
//   let result = 0;
//   for( let i = 0; i < src.length; i++ )
//   {
//     result += _.entitySize( src[ i ] );
//     if( isNaN( result ) )
//     break;
//   }
//   return result;
// }
// so, expected should be 3 * 8 = 24

  test.case = 'arraylike';
  var got = _.entitySize( [ 1, 2, 3 ] );
  var expected = 3;
  test.identical( got, expected );

  // wrong because routine has code
  // if( _.mapIs( src ) )
  // {
  //   let result = 0;
  //   for( let k in src )
  //   {
  //     result += _.entitySize( k );
  //     result += _.entitySize( src[ k ] );
  //     if( isNaN( result ) )
  //     break;
  //   }
  //   return result;
  // }
  // so, expected should be 1 + 8 + 1 + 8 = 18

  test.case = 'object';
  var got = _.entitySize( { a : 1, b : 2 } );
  var expected = null;
  test.identical( got, expected );

  // wrong because routine has code
  // if( !_.definedIs( src ) )
  // return 8;
  // so, expected should be 8

  test.case = 'empty call';
  var got = _.entitySize( undefined );
  var expected = null;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.entitySize();
  });

  test.case = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entitySize( 1,2 );
  });

  test.case = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entitySize( 1,undefined );
  });

  test.case = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entitySize( [],undefined );
  });

};

//

var Self =
{

  name : 'Tools/base/l1/Entity',
  silencing : 1,
  // verbosity : 4,
  // importanceOfNegative : 3,

  tests :
  {

    eachSample,

    entityEach,
    entityEachKey,
    entityEachOwn,

    entityMap,
    entityFilter,

    entityAssign,
    entityAssignFieldFromContainer,

    _entityMost,
    entityMin,
    entityMax,

    //

    entityLength,
    entitySize,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
