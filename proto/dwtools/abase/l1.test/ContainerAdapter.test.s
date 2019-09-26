( function _ContainerAdapter_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

// --
//
// --

function trivial( test )
{
  test.case = 'check array';
  var got = _.containerAdapter.is( [ 1, 2 ] );
  test.identical( got, false );

  test.case = 'check instance of ContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = _.containerAdapter.is( src );
  test.identical( got, true );

  test.case = 'make ArrayContainerAdapter';
  var got = _.containerAdapter.make( [ 1, 2 ] );
  var exp = _.containerAdapter.make( [ 1, 2 ] );
  test.identical( got, exp );

  test.case = 'make SetContainerAdapter';
  var got = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  test.is( _.containerAdapter.is( got ) );
  test.identical( got, exp );

  // test.case = 'make SetContainerAdapter from SetContainerAdapter';
  // var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  // var got = _.containerAdapter.make( src );
  // var exp = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  // test.identical( got, exp );
}

//

function arrayAdapterMap( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var got = src.map();
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got, exp );

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var got = src.map( ( e ) => 123 );
  var exp = _.containerAdapter.make( [ 123 ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => undefined );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => [ e ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var got = src.map( null, ( e, k, src ) => src );
  var exp = _.containerAdapter.make( [ [ 1 ] ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => undefined );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => [ e ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === dst' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var got = src.map( src, ( e, k, src ) => src );
  var exp = _.containerAdapter.make( [ [] ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => undefined );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => [ e ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
  test.is( got === src );
  test.identical( got, exp );

  test.close( 'dst === dst' );
}

//

function arrayAdapterFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var got = src.filter();
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got, exp );

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var got = src.filter( ( e ) => 123 );
  var exp = _.containerAdapter.make( [ 123 ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( ( e ) => undefined );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( ( e ) => [ e ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.filter( ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var got = src.filter( null, ( e, k, src ) => src );
  var exp = _.containerAdapter.make( [ [ 1 ] ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( null, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( null, ( e ) => undefined );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( null, ( e ) => [ e ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.filter( null, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
  test.is( got !== src );
  test.identical( got, exp );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === dst' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var got = src.filter( src, ( e, k, src ) => src );
  var exp = _.containerAdapter.make( [ [] ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( src, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( src, ( e ) => undefined );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( src, ( e ) => [ e ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from empty array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.filter( src, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
  test.is( got === src );
  test.identical( got, exp );

  test.close( 'dst === dst' );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.ContainerAdapter',
  silencing : 1,

  tests :
  {
    trivial,
    arrayAdapterMap,
    // arrayAdapterFilter,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
