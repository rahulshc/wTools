( function _Container_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );

}

var _global = _global_;
var _ = _global_.wTools;
var Self = {};

// --
// tests
// --

function is( test )
{

  test.case = 'not';
  test.identical( _.container.is( null ), false );
  test.identical( _.container.is( undefined ), false );
  test.identical( _.container.is( 'str' ), false );
  test.identical( _.container.is( 0 ), false );
  test.identical( _.container.is( 1 ), false );
  test.identical( _.container.is( false ), false );
  test.identical( _.container.is( true ), false );
  test.identical( _.container.is( new Date() ), false );

  test.case = 'map';
  test.identical( _.container.is( {} ), true );
  test.identical( _.container.is( { a : 1 } ), true );
  test.identical( _.container.is( Object.create( null ) ), true );

  test.case = 'hashmap';
  test.identical( _.container.is( new HashMap ), true );
  test.identical( _.container.is( new HashMap([ [ 'a', 'b' ] ]) ), true );

  test.case = 'array';
  test.identical( _.container.is( [] ), true );
  test.identical( _.container.is( [ false ] ), true );

  test.case = 'typed buffer';
  test.identical( _.container.is( new F32x() ), true );
  test.identical( _.container.is( new F32x([ 1, 2, 3 ]) ), true );

  test.case = 'set';
  test.identical( _.container.is( new Set ), true );
  test.identical( _.container.is( new Set([ 'a', 'b' ]) ), true );

}

//

function instanceOfContainer( test )
{

  test.case = 'not';
  test.identical( null instanceof _.container, false );
  test.identical( undefined instanceof _.container, false );
  test.identical( 'str' instanceof _.container, false );
  test.identical( 0 instanceof _.container, false );
  test.identical( 1 instanceof _.container, false );
  test.identical( false instanceof _.container, false );
  test.identical( true instanceof _.container, false );
  test.identical( new Date() instanceof _.container, false );

  test.case = 'map';
  test.identical( {} instanceof _.container, true );
  var map = { a : 1 };
  test.identical( map instanceof _.container, true );
  var map = Object.create( null );
  test.identical( map instanceof _.container, true );

  test.case = 'hashmap';
  test.identical( new HashMap instanceof _.container, true );
  test.identical( new HashMap([ [ 'a', 'b' ] ]) instanceof _.container, true );

  test.case = 'array';
  test.identical( [] instanceof _.container, true );
  test.identical( [ false ] instanceof _.container, true );

  test.case = 'typed buffer';
  test.identical( new F32x() instanceof _.container, true );
  test.identical( new F32x([ 1, 2, 3 ]) instanceof _.container, true );

  test.case = 'set';
  test.identical( new Set instanceof _.container, true );
  test.identical( new Set([ 'a', 'b' ]) instanceof _.container, true );

}

//

function extend( test )
{

  test.case = 'src and dst is ArrayLike';

  var got = _.container.extend( [ 9, -16 ], [ 3, 5, 6 ] );
  test.identical( got, [ 9, -16, 3, 5, 6 ] );
  // test.identical( got, [ 3, 5, 6 ] );

  var got = _.container.extend( [], [ 3, 5, 6 ] );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src and dst is ObjectLike';

  var got = _.container.extend( { a : 1 }, { a : 3, b : 5, c : 6 } );
  test.identical( got, { a : 3, b : 5, c : 6 } );

  var got = _.container.extend( {}, { a : 3, b : 5, c : 6 } );
  test.identical( got, { a : 3, b : 5, c : 6 } );

  var got = _.container.extend( { d : 4 }, { a : 3, b : 5, c : 6 } );
  test.identical( got, { d : 4, a : 3, b : 5, c : 6 } );

  test.case = 'dst is ObjectLike, src is ArrayLike';

  var dst = {};
  var src = [ 3, 5, 6 ];
  var got = _.container.extend( dst, src );
  test.identical( got, [ {}, 3, 5, 6 ] );
  test.is( got !== dst );
  test.is( got[ 0 ] === dst );
  // test.identical( got, { 0 : 3, 1 : 5, 2 : 6 } );

  var exp =
  [
    { 'a' : 1 },
    3,
    5,
    6
  ]
  var got = _.container.extend( { a : 1 }, [ 3, 5, 6 ] );
  test.identical( got, exp );
  // test.identical( got, { a : 1, 0 : 3, 1 : 5, 2 : 6 } );

  test.case = 'src is ObjectLike, dst is ArrayLike';

  var exp = [ 9, -16, { a : 3, b : 5, c : 6 } ];
  var got = _.container.extend( [ 9, -16 ], { a : 3, b : 5, c : 6 } );
  test.identical( got, exp );
  // test.identical( got, [ 9, -16 ] );

  var got = _.container.extend( [], { a : 3, b : 5, c : 6 } );
  test.identical( got, [ { a : 3, b : 5, c : 6 } ] );
  // test.identical( got, [] );

  var exp =
  [
    1,
    2,
    -3,
    { '0' : 3, '1' : 5, '2' : 6 }
  ]
  var got = _.container.extend( [ 1, 2, -3 ], { 0 : 3, 1 : 5, 2 : 6 } );
  test.identical( got, exp );
  // test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src is not ObjectLike or ArrayLike';

  var exp = [ 9, -16, 1 ];
  var got = _.container.extend( [ 9, -16 ], 1 );
  test.identical( got, exp );
  // test.identical( got, 1 );

  var exp = [ 'str' ];
  var got = _.container.extend( [], 'str' );
  test.identical( got, exp );
  // test.identical( got, 'str' );

  var exp =
  [
    { 'a' : 1 },
    1,
  ]
  var got = _.container.extend( { a : 1 }, 1 );
  test.identical( got, exp );
  // test.identical( got, 1 );

  var exp = [ {}, 'str' ];
  var got = _.container.extend( {}, 'str' );
  test.identical( got, exp );
  // test.identical( got, 'str' );

  var exp = [ 0, 1 ];
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extend( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = { 'a' : 1, 'b' : 2 };
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extend( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.container.extend();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.container.extend( [ 1,3 ], [ 1,3 ], [ 1,3 ] );
  });

  test.case = 'dst is undefined';
  test.shouldThrowErrorSync( function()
  {
    _.container.extend( undefined, [ 0, 1 ] );
  });

  test.shouldThrowErrorSync( function()
  {
    _.container.extend( undefined, { a : 1, b : 2 } );
  });

  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extend( null, [ 0, 1 ] );
  // });

  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extend( null, { a : 1, b : 2 } );
  // });

}

// --
// define test suite
// --

var Self =
{

  name : 'Tools.base.Container',
  silencing : 1,

  tests :
  {

    is,
    instanceOfContainer,
    extend, /* qqq : extend test routine */

    /* qqq : implement test routine `empty` */

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
