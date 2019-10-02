( function _ContainerAdapter_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

// --
// base tests
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
  var exp = _.containerAdapter.make( [ 1, 2 ] );
  var got = _.containerAdapter.make( [ 1, 2 ] );
  test.identical( got, exp );

  test.case = 'make SetContainerAdapter';
  var exp = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var got = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  test.is( _.containerAdapter.is( got ) );
  test.identical( got, exp );

  // test.case = 'make SetContainerAdapter from SetContainerAdapter';
  // var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  // var exp = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  // var got = _.containerAdapter.make( src );
  // test.identical( got, exp );
}

//--
// SetContainerAdapter
//--

function setAdapterMap( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.map();
  test.is( got !== src );
  test.identical( got, exp );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.map( ( e ) => 123 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.map( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] ) );
  var got = src.map( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var exp = [ ... new Set( [ 1 ] ) ];
  var got = src.map( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( Array.from( ... got.original ),  exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.map( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] ) );
  var got = src.map( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.map( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.map( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] ) );
  var got = src.map( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === src' );
}

//

function setAdapterFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.filter();
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.filter( ( e ) => 123 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ] ) );
  var got = src.filter( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.filter( ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.filter( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 2 ] ) );
  var got = src.filter( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var exp = [ src.original ];
  var got = src.filter( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ] ) );
  var got = src.filter( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.filter( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.filter( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 2 ] ) );
  var got = src.filter( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.filter( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ] ) );
  var got = src.filter( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.filter( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.filter( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 2 ] ) );
  var got = src.filter( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === src' );
}

//

function setAdapterOnce( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once();
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  /* - */

  test.open( 'only onEval' );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, null, true, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  // test.case = 'onEval remove undefined';
  // var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [] ) );
  // var got = src.once( ( e ) => undefined );
  // test.is( got !== src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );
  //
  // test.case = 'onEval check element of array';
  // var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [ [ null ], [ true ], [ 2 ] ] ) );
  // var got = src.once( ( e ) => e[ 0 ] );
  // test.is( got !== src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only onEval' );

  /* - */

  test.open( 'only dst' );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var dst = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'the same containers, onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, [ 2 ], { a : 0 } ] ) );
  var got = src.once( dst, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'the same containers, onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ) ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ), [ 2 ], { a : 0 } ] ) );
  var got = src.once( dst, ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'different containers, onEval remove undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( dst, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 }, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 }, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'src - from empty array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var dst = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'src - from array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false ] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from array, append array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( null, ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  // test.case = 'onEval remove undefined';
  // var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [] ) );
  // var got = src.once( null, ( e ) => undefined );
  // test.is( got !== src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );
  //
  // test.case = 'onEval check element of array, no duplicates in src';
  // var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [ [ null ], [ true ], [ 2 ] ] ) );
  // var got = src.once( null, ( e ) => e[ 0 ] );
  // test.is( got !== src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );
  //
  // test.case = 'onEval check element of array, duplicates in src';
  // var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [ [ null ], [ true ], [ 2 ] ] ) );
  // var got = src.once( null, ( e ) => e[ 0 ] );
  // test.is( got !== src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false ] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( src, ( e, e2 ) => e === e2 );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  // test.case = 'different containers, onEval remove undefined';
  // var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [] ) );
  // var got = src.once( src, ( e ) => undefined );
  // test.is( got === src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );
  //
  // test.case = 'onEval check element of array, no duplicates in src';
  // var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  // var exp = _.containerAdapter.make( new Set( [ [ null ], [ true ], [ 2 ] ] ) );
  // var got = src.once( src, ( e ) => e[ 0 ] );
  // test.is( got === src );
  // test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === src' );
}

//

function setAdapterEach( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );
  test.identical( exp, [] );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( 123 ) );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );
  test.identical( exp, [] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );
  test.identical( exp, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( undefined ) );
  test.is( got === src );
  test.identical( [ ... got.original ], [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( [ e ] ) );
  test.is( got === src );
  test.identical( [ ... got.original ], [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e[ 0 ] ) );
  test.is( got === src );
  test.identical( [ ... got.original ], [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
}

//--
// ArrayContainerAdapter
//--

function arrayAdapterMap( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.map();
  test.is( got !== src );
  test.identical( got.original, exp.original );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.map( ( e ) => 123 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.map( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] );
  var got = src.map( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var exp = _.containerAdapter.make( [ [ 1 ] ] );
  var got = src.map( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.map( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [  0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] );
  var got = src.map( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.map( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => e );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.map( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] );
  var got = src.map( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.close( 'dst === src' );
}

//

function arrayAdapterFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.filter();
  test.is( got !== src );
  test.identical( got.original, exp.original );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.filter( ( e ) => 123 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [] );
  var got = src.filter( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.filter( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 2 ] );
  var got = src.filter( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var exp = _.containerAdapter.make( [ [ 1 ] ] );
  var got = src.filter( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( null, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [] );
  var got = src.filter( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.filter( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 2 ] );
  var got = src.filter( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.filter( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ] );
  var got = src.filter( src, ( e ) => e );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [] );
  var got = src.filter( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.filter( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 2 ] );
  var got = src.filter( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.close( 'dst === src' );
}

//

function arrayAdapterOnce( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.once();
  test.is( got !== src );
  test.identical( got.original, exp.original );

  /* - */

  test.open( 'only onEval' );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, null, true, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [] );
  var got = src.once( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ null ], [ true ], [ 2 ] ] );
  debugger;
  var got = src.once( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only onEval' );

  /* - */

  test.open( 'only dst' );

  test.case = 'src - from empty array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = [];
  var exp = _.containerAdapter.make( [] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, dst - array, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ];
  var exp = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var dst = [];
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, append array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var dst = [ 1, 2, null, undefined, false ];
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'the same containers, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var dst = [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ];
  var exp = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'the same containers, onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'the same containers, onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ) ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ), [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'different containers, onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only dst' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'src - from empty array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var got = src.once( null );
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = _.containerAdapter.make( [] );
  var got = src.once( dst );
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( null );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, append array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var got = src.once( null );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e, e2 ) => e === e2 );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );


  test.case = 'onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => undefined );
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ [ null ], [ true ], [ 2 ] ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ [ null ], [ true ], [ 2 ] ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( src, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( src, ( e, e2 ) => e === e2 );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  // test.case = 'different containers, onEval remove undefined';
  // var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  // var got = src.once( src, ( e ) => undefined );
  // var exp = _.containerAdapter.make( [] );
  // test.is( got === src );
  // test.identical( got.original, exp.original );
  //
  // test.case = 'onEval check element of array, no duplicates in src';
  // var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  // var got = src.once( src, ( e ) => e[ 0 ] );
  // var exp = _.containerAdapter.make( [ [ null ], [ true ], [ 2 ] ] );
  // test.is( got === src );
  // test.identical( got.original, exp.original );

  test.close( 'dst === src' );
}

//

function arrayAdapterOnceExperiment( test )
{
  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ null ], [ true ], [ 2 ] ] );
  var got = src.once( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp.original );
}
arrayAdapterOnceExperiment.experimental = 1;

function arrayAdapterOnceExperiment2( test )
{
  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ null ], [ true ], [ 2 ], 'some unnecessary element' ] );
  var got = src.once( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got, exp );
}
arrayAdapterOnceExperiment2.experimental = 1;

//

function arrayAdapterEach( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( got.original, exp );
  test.identical( exp, [] );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( 123 ) );
  test.is( got === src );
  test.identical( got.original, exp );
  test.identical( exp, [] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( got.original, exp );
  test.identical( exp, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( undefined ) );
  test.is( got === src );
  test.identical( got.original, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( [ e ] ) );
  test.is( got === src );
  test.identical( got.original, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e[ 0 ] ) );
  test.is( got === src );
  test.identical( got.original, [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
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
    arrayAdapterFilter,
    arrayAdapterOnce,
    arrayAdapterOnceExperiment,
    arrayAdapterOnceExperiment2,
    arrayAdapterEach,

    setAdapterMap,
    setAdapterFilter,
    setAdapterOnce,
    setAdapterEach,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
