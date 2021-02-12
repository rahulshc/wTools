( function _Container_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );

}

let _global = _global_;
let _ = _global_.wTools;

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

  test.case = 'instance';
  let src = new function Con() { this.a = 1 };
  test.identical( _.container.is( src ), false );

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

function like( test )
{

  test.case = 'not';
  test.identical( _.container.like( null ), false );
  test.identical( _.container.like( undefined ), false );
  test.identical( _.container.like( 'str' ), false );
  test.identical( _.container.like( 0 ), false );
  test.identical( _.container.like( 1 ), false );
  test.identical( _.container.like( false ), false );
  test.identical( _.container.like( true ), false );
  test.identical( _.container.like( new Date() ), false );

  test.case = 'map';
  test.identical( _.container.like( {} ), true );
  test.identical( _.container.like( { a : 1 } ), true );
  test.identical( _.container.like( Object.create( null ) ), true );

  test.case = 'instance';
  let src = new function Con() { this.a = 1 };
  test.identical( _.container.like( src ), true );

  test.case = 'hashmap';
  test.identical( _.container.like( new HashMap ), true );
  test.identical( _.container.like( new HashMap([ [ 'a', 'b' ] ]) ), true );

  test.case = 'array';
  test.identical( _.container.like( [] ), true );
  test.identical( _.container.like( [ false ] ), true );

  test.case = 'typed buffer';
  test.identical( _.container.like( new F32x() ), true );
  test.identical( _.container.like( new F32x([ 1, 2, 3 ]) ), true );

  test.case = 'set';
  test.identical( _.container.like( new Set ), true );
  test.identical( _.container.like( new Set([ 'a', 'b' ]) ), true );

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

/* qqq : normalize the test, please | Dmytro : normalized, extended coverage, improved routine extendReplacing by using correct condition */

function extendReplacingDstNull( test )
{
  test.case = 'src - empty array';
  var dst = null;
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty array';
  var dst = undefined;
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty simple map';
  var dst = undefined;
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty pure map';
  var dst = null;
  var src = Object.create( null );
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled pure map';
  var dst = null;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var dst = undefined;
  var src = Object.create( null );
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty Set';
  var dst = null;
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = null;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty Set';
  var dst = undefined;
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = undefined;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty HashMap';
  var dst = null;
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled HashMap';
  var dst = null;
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty HashMap';
  var dst = undefined;
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - primitive';
  var dst = null;
  var src = 'str';
  var got = _.container.extendReplacing( dst, src );
  var exp = 'str';
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  test.case = 'src - BufferRaw';
  var dst = undefined;
  var src = new BufferRaw( 10 );
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferRaw( 10 );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  /* - */

  test.open( 'src - not container' );

  test.case = 'dst - primitive, src - primitive';
  var dst = 'str';
  var got = _.container.extendReplacing( dst, 1 );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'dst - long, src - primitive';
  var dst = [ 1, 2 ];
  var got = _.container.extendReplacing( dst, 1 );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'dst - map, src - primitive';
  var dst = { a : 2 };
  var got = _.container.extendReplacing( dst, 'str' );
  var exp = 'str';
  test.identical( got, exp );

  test.case = 'dst - HashMap, src - primitive';
  var dst = new Map( [ [ undefined, undefined ] ] );
  var got = _.container.extendReplacing( dst, null );
  var exp = null;
  test.identical( got, exp );

  test.case = 'dst - Set, src - primitive';
  var dst = new Set( [ 1, 2 ] );
  var got = _.container.extendReplacing( dst, undefined );
  var exp = undefined;
  test.identical( got, exp );

  /* */

  test.case = 'dst - long, src - BufferRaw';
  var dst = [ 1, 2 ];
  var src = new BufferRaw();
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferRaw();
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - map, src - function';
  var dst = { a : 2 };
  var src = () => {};
  var got = _.container.extendReplacing( dst, src );
  var exp = src;
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - HashMap, src - BufferView';
  var dst = new Map( [ [ undefined, undefined ] ] );
  var src = new BufferView( new BufferRaw() );
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferView( new BufferRaw() );
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - Set, src - object';
  var dst = new Set( [ 1, 2 ] );
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.container.extendReplacing( dst, src );
  test.identical( got.x, 1 );
  test.true( got === src );

  test.close( 'src - not container' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.container.extendReplacing() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( [ 1, 3 ], [ 1, 3 ], [ 1, 3 ] ) );

  test.case = 'src is WeakMap';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( { a : 1 }, new WeakMap() ) );

  test.case = 'src is WeakSet';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( new Set( [ 1, 2 ] ), new WeakSet( [ 1, 2 ] ) ) );
}

//

function extendReplacingDstMapAndHashMapLike( test )
{
  test.open( 'src - mapLike_' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - mapLike_' );

  /* - */

  test.open( 'src - hashMapLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Map( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Map( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = new Map();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - hashMapLike' );
}

//

function extendReplacingDstLongAndSetLike( test )
{
  test.open( 'src - longLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src - empty';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2, 3 ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - long, src - long';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6, 7 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 4, 5, 6, 7 ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long not extensible, src - long';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6 ];
  Object.preventExtensions( dst );
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 4, 5, 6 ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long not extensible, src - long';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6, 7 ];
  Object.preventExtensions( dst );
  test.shouldThrowErrorSync( () => _.container.extendReplacing( dst, src ) );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( src, [ 4, 5, 6, 7 ] );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - longLike' );

  /* - */

  test.open( 'src - setLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src -empty';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2 ];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 1, 2, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, different content';
  var dst = new Set( [ 1, 2 ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 1, 2, 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, almost identical content';
  var dst = new Set( [ 9, -16, 'str', null ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.close( 'src - setLike' );
}

//

/* aaa : normalize the test, please | Dmytro : normalized, extended coverage */

function extendAppendingDstNull( test )
{
  test.case = 'src - empty array';
  var dst = null;
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty array';
  var dst = undefined;
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty simple map';
  var dst = undefined;
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty pure map';
  var dst = null;
  var src = Object.create( null );
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled pure map';
  var dst = null;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var dst = undefined;
  var src = Object.create( null );
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty Set';
  var dst = null;
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = null;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty Set';
  var dst = undefined;
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = undefined;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty HashMap';
  var dst = null;
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled HashMap';
  var dst = null;
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty HashMap';
  var dst = undefined;
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - primitive';
  var dst = null;
  var src = 'str';
  var got = _.container.extendAppending( dst, src );
  var exp = 'str';
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  test.case = 'src - BufferRaw';
  var dst = undefined;
  var src = new BufferRaw( 10 );
  var got = _.container.extendAppending( dst, src );
  var exp = new BufferRaw( 10 );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  /* - */

  test.open( 'src - not container' );

  test.case = 'dst - long, src - primitive';
  var dst = [ 1, 2 ];
  var got = _.container.extendAppending( dst, 1 );
  var exp = [ 1, 2, 1 ];
  test.identical( got, exp );

  test.case = 'dst - map, src - primitive';
  var dst = { a : 2 };
  var got = _.container.extendAppending( dst, 'str' );
  var exp = [ { a : 2 }, 'str' ];
  test.identical( got, exp );

  test.case = 'dst - HashMap, src - primitive';
  var dst = new Map( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, null );
  var exp = [ new Map( [ [ undefined, undefined ] ] ), null ];
  test.identical( got, exp );

  test.case = 'dst - Set, src - primitive';
  var dst = new Set( [ 1, 2 ] );
  var got = _.container.extendAppending( dst, undefined );
  var exp = [ new Set( [ 1, 2 ] ), undefined ];
  test.identical( got, exp );

  /* */

  test.case = 'dst - long, src - BufferRaw';
  var dst = [ 1, 2 ];
  var got = _.container.extendAppending( dst, new BufferRaw() );
  var exp = [ 1, 2, new BufferRaw() ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, src - function';
  var dst = { a : 2 };
  var func = () => {};
  var got = _.container.extendAppending( dst, func );
  var exp = [ { a : 2 }, func ];
  test.identical( got, exp );

  test.case = 'dst - HashMap, src - BufferView';
  var dst = new Map( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, new BufferView( new BufferRaw() ) );
  var exp = [ new Map( [ [ undefined, undefined ] ] ), new BufferView( new BufferRaw() ) ];
  test.identical( got, exp );

  test.case = 'dst - Set, src - object';
  var dst = new Set( [ 1, 2 ] );
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var constr = new Constr();
  var got = _.container.extendAppending( dst, constr );
  var exp = [ dst, constr ];
  test.identical( got, exp );

  test.close( 'src - not container' );

  /* - */

  test.open( 'dst - not container' );

  test.case = 'dst - primitive, src - primitive';
  var dst = 'str';
  var got = _.container.extendAppending( dst, 1 );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'dst - primitive, src - long';
  var dst = 1;
  var src = [ 1, 2 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2 ];
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - primitive, src - map';
  var dst = 'str';
  var src = { a : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 2 };
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - primitive, src - HashMap';
  var dst = true;
  var src = new Map( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ undefined, undefined ] ] );
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - primitive, src - set';
  var dst = false;
  var src = new Set( [ 1, 2 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 1, 2 ] );
  test.identical( got, exp );
  test.true( got === src );

  /* */

  test.case = 'dst - BufferRaw, src - long';
  var dst = new BufferRaw();
  var src = [ 1, 2 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2 ];
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - function, src - map';
  var dst = () => {};
  var src = { a : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 2 };
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - BufferView, src - HashMap';
  var dst = new BufferView( new BufferRaw() );
  var src = new Map( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ undefined, undefined ] ] );
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - object, src - Set';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var dst = new Constr;
  var src = new Set( [ 1, 2 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 1, 2 ] );
  test.identical( got, exp );
  test.true( got === src );

  test.close( 'dst - not container' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.container.extendAppending() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.container.extendAppending( [ 1, 3 ], [ 1, 3 ], [ 1, 3 ] ) );

  test.case = 'src is WeakMap';
  test.shouldThrowErrorSync( () => _.container.extendAppending( { a : 1 }, new WeakMap() ) );

  test.case = 'src is WeakSet';
  test.shouldThrowErrorSync( () => _.container.extendAppending( new Set( [ 1, 2 ] ), new WeakSet( [ 1, 2 ] ) ) );
}

//

function extendAppendingDstMapAndHashMapLike( test )
{
  test.open( 'src - mapLike_' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ {} ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, {} ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), {} ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), {} ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - mapLike_' );

  /* - */

  test.open( 'src - hashMapLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Map( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = new Map();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Map( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map() ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, new Map() ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), new Map() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = new Map();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), new Map() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), new Map( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - hashMapLike' );
}

//

function extendAppendingDstLongAndSetLike( test )
{
  test.open( 'src - longLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [ {} ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ {}, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src - empty';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ { 'a' : 1, 'b' : 2, 'c' : 3 }, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ { 'a' : 1, 'b' : 2, 'c' : 3 }, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map(), 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ), 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2, 3 ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2, 3, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, 'str', null, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16 ] );
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.close( 'src - longLike' );

  /* - */

  test.open( 'src - setLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ {}, new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ {}, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src -empty';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ { a : 1, b : 2, c : 3 }, new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ { a : 1, b : 2, c : 3 }, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new Map();
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map(), new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new Map();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map(), new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ), new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Map( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ), new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set() ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2 ];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, 'str', null, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, different content';
  var dst = new Set( [ 1, 2 ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 1, 2, 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, almost identical content';
  var dst = new Set( [ 9, -16, 'str', null ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.close( 'src - setLike' );
}

//

function empty( test )
{
  test.case = 'empty array';
  var dst = [];
  var got = _.container.empty( dst );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'filled array';
  var dst = [ 1, null, undefined, 'str', '', false, {}, [], [ 1 ], { a : 1 } ];
  var got = _.container.empty( dst );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'empty unroll';
  var dst = _.unrollMake( [] );
  var got = _.container.empty( dst );
  var exp = _.unrollMake( [] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'filled unroll';
  var dst = _.unrollMake( [ 1, null, undefined, 'str', '', false, {}, [], [ 1 ], { a : 1 } ] );
  var got = _.container.empty( dst );
  var exp = _.unrollMake( [] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'empty Set';
  var dst = new Set();
  var got = _.container.empty( dst );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'filled Set';
  var dst = new Set( [ 1, null, undefined, 'str', '', false, {}, [], [ 1 ], { a : 1 } ] );
  var got = _.container.empty( dst );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'empty Map';
  var dst = new Map();
  var got = _.container.empty( dst );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );

  test.case = 'filled Map';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ 'str', 'str' ], [ '', '' ], [ false, false ], [ {}, {} ], [ [], [] ] ] );
  var got = _.container.empty( dst );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );

  /* */

  test.case = 'empty simple map';
  var dst = {};
  var got = _.container.empty( dst );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'filled simple map';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', '' : '', 'false' : false };
  var got = _.container.empty( dst );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'empty pure map';
  var dst = Object.create( null );
  var got = _.container.empty( dst );
  var exp = Object.create( null );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'filled simple map';
  var dst = Object.create( null );
  dst[ '1' ] = 1;
  dst[ 'null' ] = null;
  dst[ 'undefined' ] = undefined;
  var got = _.container.empty( dst );
  var exp = Object.create( null );
  test.identical( got, exp );
  test.true( got === dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.container.empty() );
  test.shouldThrowErrorSync( () => _.container.empty( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.container.empty( 1 ) );
  function Constr()
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

let Self =
{

  name : 'Tools.Container',
  silencing : 1,

  tests :
  {

    is,
    like,
    instanceOfContainer,

    extendReplacingDstNull,
    extendReplacingDstMapAndHashMapLike,
    extendReplacingDstLongAndSetLike,

    extendAppendingDstNull, /* qqq : extendAppending test routine | Dmytro : split and extended coverage of routine */
    extendAppendingDstMapAndHashMapLike,
    extendAppendingDstLongAndSetLike,

    empty, /* qqq : implement test routine `empty` | Dmytro : implemented */

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
