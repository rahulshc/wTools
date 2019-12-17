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

/* qqq : normalize the test, please */

function extendReplacing( test )
{

  test.case = 'src and dst is ArrayLike';

  var got = _.container.extendReplacing( [ 9, -16 ], [ 3, 5, 6 ] );
  test.identical( got, [ 9, -16, 3, 5, 6 ] );
  // test.identical( got, [ 3, 5, 6 ] );

  var got = _.container.extendReplacing( [], [ 3, 5, 6 ] );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src and dst is ObjectLike';

  var got = _.container.extendReplacing( { a : 1 }, { a : 3, b : 5, c : 6 } );
  test.identical( got, { a : 3, b : 5, c : 6 } );

  var got = _.container.extendReplacing( {}, { a : 3, b : 5, c : 6 } );
  test.identical( got, { a : 3, b : 5, c : 6 } );

  var got = _.container.extendReplacing( { d : 4 }, { a : 3, b : 5, c : 6 } );
  test.identical( got, { d : 4, a : 3, b : 5, c : 6 } );

  test.case = 'dst is ObjectLike, src is ArrayLike';

  var dst = {};
  var src = [ 3, 5, 6 ];
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, [ 3, 5, 6 ] );
  test.is( got !== dst );
  test.is( got !== src );

  var exp = [ 3, 5, 6 ];
  var got = _.container.extendReplacing( { a : 1 }, [ 3, 5, 6 ] );
  test.identical( got, exp );

  test.case = 'src is ObjectLike, dst is ArrayLike';

  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 }
  var got = _.container.extendReplacing( [ 9, -16 ], { a : 3, b : 5, c : 6 } );
  test.identical( got, exp );

  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var dst = [];
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  var exp = { '0' : 3, '1' : 5, '2' : 6 }
  var dst = [ 1, 2, -3 ];
  var src = { 0 : 3, 1 : 5, 2 : 6 };
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, exp );

  test.case = 'src is not ObjectLike or ArrayLike';

  var exp = 1;
  var got = _.container.extendReplacing( [ 9, -16 ], 1 );
  test.identical( got, exp );

  var exp = 'str';
  var got = _.container.extendReplacing( [], 'str' );
  test.identical( got, exp );

  var exp = 1;
  var got = _.container.extendReplacing( { a : 1 }, 1 );
  test.identical( got, exp );

  var exp = 'str';
  var got = _.container.extendReplacing( {}, 'str' );
  test.identical( got, exp );

  var exp = [ 0, 1 ];
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = { 'a' : 1, 'b' : 2 };
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = [ 0, 1 ];
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = { 'a' : 1, 'b' : 2 };
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.container.extendReplacing();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.container.extendReplacing( [ 1,3 ], [ 1,3 ], [ 1,3 ] );
  });

  // test.case = 'dst is undefined';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendReplacing( undefined, [ 0, 1 ] );
  // });
  //
  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendReplacing( undefined, { a : 1, b : 2 } );
  // });

  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendReplacing( null, [ 0, 1 ] );
  // });

  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendReplacing( null, { a : 1, b : 2 } );
  // });

}

//

/* qqq : normalize the test, please */
function extendAppending( test )
{

  test.case = 'src and dst is ArrayLike';

  var got = _.container.extendAppending( [ 9, -16 ], [ 3, 5, 6 ] );
  test.identical( got, [ 9, -16, 3, 5, 6 ] );

  var got = _.container.extendAppending( [], [ 3, 5, 6 ] );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src and dst is ObjectLike';

  var got = _.container.extendAppending( { a : 1 }, { a : 3, b : 5, c : 6 } );
  test.identical( got, { a : 3, b : 5, c : 6 } );

  var got = _.container.extendAppending( {}, { a : 3, b : 5, c : 6 } );
  test.identical( got, { a : 3, b : 5, c : 6 } );

  var got = _.container.extendAppending( { d : 4 }, { a : 3, b : 5, c : 6 } );
  test.identical( got, { d : 4, a : 3, b : 5, c : 6 } );

  test.case = 'dst is ObjectLike, src is ArrayLike';

  var dst = {};
  var src = [ 3, 5, 6 ];
  var got = _.container.extendAppending( dst, src );
  test.identical( got, [ {}, 3, 5, 6 ] );
  test.is( got !== dst );
  test.is( got[ 0 ] === dst );

  var exp =
  [
    { 'a' : 1 },
    3,
    5,
    6
  ]
  var got = _.container.extendAppending( { a : 1 }, [ 3, 5, 6 ] );
  test.identical( got, exp );

  test.case = 'src is ObjectLike, dst is ArrayLike';

  var exp = [ 9, -16, { a : 3, b : 5, c : 6 } ];
  var got = _.container.extendAppending( [ 9, -16 ], { a : 3, b : 5, c : 6 } );
  test.identical( got, exp );

  var got = _.container.extendAppending( [], { a : 3, b : 5, c : 6 } );
  test.identical( got, [ { a : 3, b : 5, c : 6 } ] );

  var exp =
  [
    1,
    2,
    -3,
    { '0' : 3, '1' : 5, '2' : 6 }
  ]
  var src = { 0 : 3, 1 : 5, 2 : 6 };
  var dst = [ 1, 2, -3 ];
  var got = _.container.extendAppending( dst, src );
  test.identical( got, exp );
  test.is( got !== src );
  test.is( got === dst );

  test.case = 'src is not ObjectLike or ArrayLike';

  var exp = [ 9, -16, 1 ];
  var got = _.container.extendAppending( [ 9, -16 ], 1 );
  test.identical( got, exp );

  var exp = [ 'str' ];
  var got = _.container.extendAppending( [], 'str' );
  test.identical( got, exp );

  var exp =
  [
    { 'a' : 1 },
    1,
  ]
  var got = _.container.extendAppending( { a : 1 }, 1 );
  test.identical( got, exp );

  var exp = [ {}, 'str' ];
  var got = _.container.extendAppending( {}, 'str' );
  test.identical( got, exp );

  var exp = [ 0, 1 ];
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendAppending( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = { 'a' : 1, 'b' : 2 };
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendAppending( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = [ 0, 1 ];
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendAppending( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  var exp = { 'a' : 1, 'b' : 2 };
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendAppending( dst, src );
  test.identical( got, exp );
  test.is( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.container.extendAppending();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.container.extendAppending( [ 1,3 ], [ 1,3 ], [ 1,3 ] );
  });

  // test.case = 'dst is undefined';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendAppending( undefined, [ 0, 1 ] );
  // });
  //
  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendAppending( undefined, { a : 1, b : 2 } );
  // });

  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendAppending( null, [ 0, 1 ] );
  // });

  // test.shouldThrowErrorSync( function()
  // {
  //   _.container.extendAppending( null, { a : 1, b : 2 } );
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
    extendReplacing,
    extendAppending, /* qqq : extendAppending test routine */

    /* qqq : implement test routine `empty` */

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
