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

function extendReplacingDstNull( test )
{
  test.case = 'src - empty array';
  var dst = null;
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled array';
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - empty array';
  var dst = undefined;
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled array';
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled simple map';
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - empty simple map';
  var dst = undefined;
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'src - empty pure map';
  var dst = null;
  var src = Object.create( null );
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled pure map';
  var dst = null;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - empty pure map';
  var dst = undefined;
  var src = Object.create( null );
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'src - empty Set';
  var dst = null;
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled Set';
  var dst = null;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - empty Set';
  var dst = undefined;
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled Set';
  var dst = undefined;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'src - empty HashMap';
  var dst = null;
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled HashMap';
  var dst = null;
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - empty HashMap';
  var dst = undefined;
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'src - primitive';
  var dst = null;
  var src = 'str';
  var got = _.container.extendReplacing( dst, src );
  var exp = 'str';
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got === src );

  test.case = 'src - BufferRaw';
  var dst = undefined;
  var src = new BufferRaw( 10 );
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferRaw( 10 );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.container.extendReplacing() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( [ 1,3 ], [ 1,3 ], [ 1,3 ] ) );

  test.case = 'src is WeakMap';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( { a : 1 }, new WeakMap() ) );

  test.case = 'src is WeakSet';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( new Set( [ 1, 2 ] ), new WeakSet( [ 1, 2 ] ) ) );
}

//

function extendReplacingDstMapLike( test ) 
{
  test.open( 'src - mapLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.is( got === dst );
  
  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.is( got === dst );

  /* */ 

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.is( got === dst );
  
  test.case = 'dst - HashMap, different content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.is( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - Set';
  var dst = [ 9, -16 ];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.close( 'src - mapLike' );

  /* - */

  test.open( 'src - hashMapLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.is( got === dst );
  
  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Map( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.is( got === dst );

  /* */ 

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.is( got === dst );
  
  test.case = 'dst - HashMap, different content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Map( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.is( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'dst - Set';
  var dst = [ 9, -16 ];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.is( got !== dst );
  test.is( got !== src );

  test.close( 'src - hashMapLike' );
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

function empty( test ) 
{
  test.case = 'empty array';
  var dst = [];
  var got = _.container.empty( dst );
  var exp = [];
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'filled array';
  var dst = [ 1, null, undefined, 'str', '', false, {}, [], [ 1 ], { a : 1 } ];
  var got = _.container.empty( dst );
  var exp = [];
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'empty unroll';
  var dst = _.unrollMake( [] );
  var got = _.container.empty( dst );
  var exp = _.unrollMake( [] );
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'filled unroll';
  var dst = _.unrollMake( [ 1, null, undefined, 'str', '', false, {}, [], [ 1 ], { a : 1 } ] );
  var got = _.container.empty( dst );
  var exp = _.unrollMake( [] );
  test.identical( got, exp );
  test.is( got === dst );

  /* */

  test.case = 'empty Set';
  var dst = new Set();
  var got = _.container.empty( dst );
  var exp = new Set();
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'filled Set';
  var dst = new Set( [ 1, null, undefined, 'str', '', false, {}, [], [ 1 ], { a : 1 } ] );
  var got = _.container.empty( dst );
  var exp = new Set();
  test.identical( got, exp );
  test.is( got === dst ); 

  /* */

  test.case = 'empty Map';
  var dst = new Map();
  var got = _.container.empty( dst );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.is( got === dst );

  test.case = 'filled Map';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ 'str', 'str' ], [ '', ''], [ false, false ], [ {}, {} ], [ [], [] ] ] );
  var got = _.container.empty( dst );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.is( got === dst ); 

  /* */

  test.case = 'empty simple map';
  var dst = {};
  var got = _.container.empty( dst );
  var exp = {};
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'filled simple map';
  var dst = { 1 : 1, null : null, undefined : undefined, 'str' : 'str', '' : '', false : false };
  var got = _.container.empty( dst );
  var exp = {};
  test.identical( got, exp );
  test.is( got === dst ); 

  test.case = 'empty pure map';
  var dst = Object.create( null );
  var got = _.container.empty( dst );
  var exp = Object.create( null );
  test.identical( got, exp );
  test.is( got === dst );

  test.case = 'filled simple map';
  var dst = Object.create( null );
  dst[ '1' ] = 1;
  dst[ 'null' ] = null;
  dst[ 'undefined' ] = undefined;
  var got = _.container.empty( dst );
  var exp = Object.create( null );
  test.identical( got, exp );
  test.is( got === dst ); 

  /* - */

  if( !Config.debug ) 
  return;

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.container.empty() );
  test.shouldThrowErrorSync( () => _.container.empty( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.container.empty( 1 ) );
  var Constr = function()
  { 
    this.x = 1;
    return this
  };
  test.shouldThrowErrorSync( () => _.container.empty( new Constr() ) );

  test.case = 'not resizable longs';
  test.shouldThrowErrorSync( () => _.container.empty( _.argumentsArrayMake( [] ) ) );
  test.shouldThrowErrorSync( () => _.container.empty( new U8x() ) );
  test.shouldThrowErrorSync( () => _.container.empty( new F64x() ) );

  test.case = 'dst is WeakMap';
  test.shouldThrowErrorSync( () => _.container.empty( new WeakMap() ) );
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
    extendReplacingDstNull,
    extendReplacingDstMapLike,
    extendAppending, /* qqq : extendAppending test routine */

    empty, /* qqq : implement test routine `empty` */

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
