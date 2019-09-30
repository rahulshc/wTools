( function _Functional_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
  _.include( 'wSelector' );
}

var _ = wTools;

//--
// scalar
//--

function scalarAppend( test )
{
  test.case = 'dst is undefined, src = undefined';
  var dst = undefined;
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is undefined, src is longLike';
  var dst = undefined;
  var src = [ null, '', 1, [], [ 1, [ 2 ] ] ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is undefined, src = unroll';
  var dst = undefined;
  var src = _.unrollMake( [ null, '', 1 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src = argumentsArray';
  var dst = undefined;
  var src = _.argumentsArrayMake( [ null, '', 1 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src is buffer';
  var dst = undefined;
  var src = new F32x( [ 0, 2, 10 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 0, 2, 10 ] );

  test.case = 'dst is undefined, src is string';
  var dst = undefined;
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is undefined, src is map';
  var dst = undefined;
  var src = { 'a' : 'str' };
  var got = _.scalarAppend( dst, src );
  test.identical( got, { 'a' : 'str' } );

  /* dst is array */

  test.case = 'dst is empty array, src is empty array';
  var dst = [];
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty array, src is null';
  var dst = [];
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is array, src = undefined';
  var dst = [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ];
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is string';
  var dst = [ 1, null, 'str', [] ];
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'str' ] );
  test.is( got === dst );

  test.case = 'dst is array, src is map';
  var dst = [ 1, null, 'str', [] ];
  var src = { 'a' : 1 };
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is array, src = array';
  var dst = [ 1, null, 'str', [] ];
  var src = [ 'src', 2, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'src', 2, undefined ] );
  test.is( got === dst );

  /* dst is unroll */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.unrollMake( [] );
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.unrollMake( [] );
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.unrollMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is string';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'str' ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is map';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = array';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = [ 'src', 2, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'src', 2, undefined ] );
  test.is( got === dst );

  /* dst is argumentsArray */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.argumentsArrayMake( [] );
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.argumentsArrayMake( [] );
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is unroll, src is string';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'str' ] );

  test.case = 'dst is unroll, src is map';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 } ] );

  test.case = 'dst is unroll, src = array';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = [ 'src', 2, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, null, 'str', [], 'src', 2, undefined ] );

  /* dst is buffer */

  test.case = 'dst is empty buffer, src = undefined';
  var dst = new U8x();
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty buffer, src is empty array';
  var dst = new U8x();
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [] );

  test.case = 'dst is buffer, src = undefined';
  var dst = new U8x( [ 1, 2, 0, 78 ] );
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is number';
  var dst = new I16x( [ 1, 2, 0, 78 ] );
  var src = 32;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 32 ] );

  test.case = 'dst is buffer, src is empty array';
  var dst = new U16x( [ 1, 2, 0, 78 ] );
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src = array';
  var dst = new I32x( [ 1, 2, 0, 78 ] );
  var src = [ 'str', null, undefined ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 'str', null, undefined ] );

  test.case = 'dst is buffer, src is buffer';
  var dst = new U32x( [ 1, 2, 0, 78 ] );
  var src = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 1, 2, 3, 4 ] );

  /* dst not undefined, not longLike */

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = null;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null, null ] );

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, null );

  test.case = 'dst is null, src is empty array';
  var dst = null;
  var src = [];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = '';
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 'str', '' ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = undefined;
  var got = _.scalarAppend( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is number, src is string';
  var dst = 1;
  var src = [ '', 2, [], [ { a : 2 } ] ];
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ 1, '', 2, [], [ { a : 2 } ] ] );

  test.case = 'dst is map, src is buffer';
  var dst = { 'a' : 1 };
  var src = new U8x( [ 10, 20, 30 ] );
  var got = _.scalarAppend( dst, src );
  test.identical( got, [ { 'a' : 1 }, 10, 20, 30 ] );

  /* */

  test.case = 'dst === src';
  var arr = [ 1, 2, 'str' ];
  var dst = arr;
  var src = arr;
  var got = _.scalarAppend( dst, src );
  test.identical( got, [  1, 2, 'str',  1, 2, 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong arguments.length';
  test.shouldThrowErrorSync( () => _.scalarAppend() );
  test.shouldThrowErrorSync( () => _.scalarAppend( 1 ) );
  test.shouldThrowErrorSync( () => _.scalarAppend( 1, 2, 'str' ) );
}

//

function scalarAppendOnce( test )
{
  test.case = 'dst is undefined, src = undefined';
  var dst = undefined;
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is undefined, src is longLike';
  var dst = undefined;
  var src = [ null, '', 1, [], [ 1, [ 2 ] ], null, 1 ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null, '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is undefined, src = unroll';
  var dst = undefined;
  var src = _.unrollMake( [ null, '', 1 , null, '', 1 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src = argumentsArray';
  var dst = undefined;
  var src = _.argumentsArrayMake( [ null, '', 1 , null, '', 1 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null, '', 1 ] );

  test.case = 'dst is undefined, src is buffer';
  var dst = undefined;
  var src = new F32x( [ 0, 2, 10, 0, 2, 10 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 0, 2, 10 ] );

  test.case = 'dst is undefined, src is string';
  var dst = undefined;
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is undefined, src is map';
  var dst = undefined;
  var src = { 'a' : 'str' };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, { 'a' : 'str' } );

  /* dst is array */

  test.case = 'dst is empty array, src is empty array';
  var dst = [];
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty array, src is null';
  var dst = [];
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is array, src = undefined';
  var dst = [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ], [ 1, [ 2 ] ] ];
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is array, src is string';
  var dst = [ 1, null, 'str', [], 1 ];
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], 1 ] );
  test.is( got === dst );

  test.case = 'dst is array, src is map';
  var dst = [ 1, null, 'str', [], { 'a' : 1 } ];
  var src = { 'a' : 1 };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 }, { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is array, src = array';
  var dst = [ 1, null, 'str', [] ];
  var src = [ 'str', 1, undefined ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], undefined ] );
  test.is( got === dst );

  /* dst is unroll */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.unrollMake( [] );
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.unrollMake( [] );
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.unrollMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is string';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [] ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src is map';
  var dst = _.unrollMake( [ 1, null, 'str', [], { 'a' : 1 } ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 }, { 'a' : 1 } ] );
  test.is( got === dst );

  test.case = 'dst is unroll, src = array';
  var dst = _.unrollMake( [ 1, null, 'str', [] ] );
  var src = [ 'str', 1, undefined ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], undefined ] );
  test.is( got === dst );

  /* dst is argumentsArray */

  test.case = 'dst is empty unroll, src is empty array';
  var dst = _.argumentsArrayMake( [] );
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty unroll, src is null';
  var dst = _.argumentsArrayMake( [] );
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is unroll, src = undefined';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', '', 1, [], [ 1, [ 2 ] ] ] );

  test.case = 'dst is unroll, src is string';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [] ] );

  test.case = 'dst is unroll, src is map';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [], { 'a' : 1 } ] );
  var src = { 'a' : 1 };
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], { 'a' : 1 }, { 'a' : 1 } ] );

  test.case = 'dst is unroll, src = array';
  var dst = _.argumentsArrayMake( [ 1, null, 'str', [] ] );
  var src = [ 'str', 1, undefined ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, null, 'str', [], undefined ] );

  /* dst is buffer */

  test.case = 'dst is empty buffer, src = undefined';
  var dst = new U8x();
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is empty buffer, src is empty array';
  var dst = new U8x();
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [] );

  test.case = 'dst is buffer, src = undefined';
  var dst = new U8x( [ 1, 2, 0, 78 ] );
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is number';
  var dst = new I16x( [ 1, 2, 0, 78 ] );
  var src = 0;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src is empty array';
  var dst = new U16x( [ 1, 2, 0, 78 ] );
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78 ] );

  test.case = 'dst is buffer, src = array';
  var dst = new I32x( [ 1, 2, 0, 78 ] );
  var src = [ 'str', 2, 78 ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 'str' ] );

  test.case = 'dst is buffer, src is buffer';
  var dst = new U32x( [ 1, 2, 0, 78 ] );
  var src = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, 2, 0, 78, 3, 4 ] );

  /* dst not undefined, not longLike */

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = null;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is null, src is null';
  var dst = null;
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, null );

  test.case = 'dst is null, src is empty array';
  var dst = null;
  var src = [];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ null ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = 'str';
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 'str' ] );

  test.case = 'dst is string, src is string';
  var dst = 'str';
  var src = undefined;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, 'str' );

  test.case = 'dst is number, src is string';
  var dst = 1;
  var src = [ '', 1, [], [ { a : 2 } ] ];
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ 1, '', [], [ { a : 2 } ] ] );

  test.case = 'dst is map, src is buffer';
  var dst = { 'a' : 1 };
  var src = new U8x( [ 10, 20, 30 ] );
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [ { 'a' : 1 }, 10, 20, 30 ] );

  /* */

  test.case = 'dst === src';
  var arr = [ 1, 2, 'str' ];
  var dst = arr;
  var src = arr;
  var got = _.scalarAppendOnce( dst, src );
  test.identical( got, [  1, 2, 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong arguments.length';
  test.shouldThrowErrorSync( () => _.scalarAppendOnce() );
  test.shouldThrowErrorSync( () => _.scalarAppendOnce( 1 ) );
  test.shouldThrowErrorSync( () => _.scalarAppendOnce( 1, 2, 'str' ) );
}

//

function scalarToVector( test )
{

  test.case = 'nothing';
  var got = _.scalarToVector( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.case = 'static array';
  var got = _.scalarToVector( 3, 7 );
  var expected = [ 3, 3, 3, 3, 3, 3, 3 ];
  test.identical( got, expected );

  test.case = 'original array';
  var got = _.scalarToVector( [ 3, 7, 13 ], 3 );
  var expected = [ 3, 7, 13 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector();
  });

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( [ 1, 2, 3 ] );
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( [ 1, 2, 3 ], 3, 'redundant argument' );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector('wrong argument', 'wrong argument');
  });

  test.case = 'second argument too much';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( [ 1, 2, 3 ], 4 );
  });

  test.case = 'first three arguments are not wrapped into array';
  test.shouldThrowErrorSync( function()
  {
    _.scalarToVector( 1, 2, 3, 3 );
  });
};

// --
// tests
// --

function entityEach( test )
{
  test.open( 'src is an ArrayLike');

  test.case = 'empty arrayLike objects';
  var got;
  var src = [];
  _.entityEach( src, ( v ) => got = typeof v );
  test.identical( got, undefined );

  var got = [];
  var src = _.unrollMake( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = _.argumentsArrayMake( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new Array( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, src );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new F32x( 0 );
  _.entityEach( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  //

  test.case = 'not empty arrayLike objects';

  var got = [];
  var src = [ 0, 1, 2 ];
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );

  var got = [];
  var src = _.unrollMake( [ 0, 1, _.unrollMake( [ 2 ] ) ] );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( src ) );

  var got = [];
  var src = _.argumentsArrayMake( [ 0, 1, 2 ] );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new Array( 0, 1, 2 );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new F32x( [ 0, 1, 2 ] );
  _.entityEach( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  //

  test.case = 'routine counter';

  var onEach = function( v, i )
  {
    if( _.strIs( v ) && i >= 0 )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEach( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEach( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  var got = 0;
  var src = _.unrollFrom( [ 1, 'str', _.unrollMake( [ 2, 'str' ] ) ] );
  _.entityEach( src, onEach );
  test.identical( got, 18 );

  var got = 0;
  var src = _.argumentsArrayMake( [ 1, 'str', [ 2, 'str' ] ] );
  _.entityEach( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new Array( 1, 'str', [ 2, 'str' ] );
  _.entityEach( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new F32x( [ 1, 1, [ 2 ] ] );
  _.entityEach( src, onEach );
  test.identical( got, -3 );

  test.case = 'Third argument in onEach'
  var onEach = function( v, i, src )
  {
    if( _.longIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got;
  var src = [ 0, 1, 3, 5 ];
  _.entityEach( src, onEach );
  test.identical( got, src );

  var got;
  var src = _.unrollMake( [ 0, 1, _.unrollFrom( [ 3, 5 ] ) ] );
  _.entityEach( src, onEach );
  test.identical( got, [ 0, 1, 3, 5 ] );
  test.is( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got;
  var src = _.argumentsArrayMake( [ 0, 1, [ 3, 5 ] ] );
  _.entityEach( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new Array( 1, 2, null, true );
  _.entityEach( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new F32x( [ 1, 2, 1, 3 ] );
  _.entityEach( src, onEach );
  test.equivalent( got, [ 1, 2, 1, 3 ] );
  test.is( _.longIs( got ) );

  test.close( 'src is an ArrayLike');

  /* - */

  test.open( 'src is an object' );

  var got = {};
  _.entityEach( {}, ( v ) => got = v );
  test.identical( got, {} );

  var got = {};
  _.entityEach( Object.create( null ), ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  _.entityEach( { a : 1, b : 3, c : 5 }, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b', c : '25c' } );

  //

  test.case = 'routine counter';

  var onEach = function( v, k )
  {
    if( _.strIs( v ) && k )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEach( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEach( { a : 'abc', b : { a : 1 }, c : [ null ], d : undefined }, onEach );
  test.identical( got, 7 );

  var got = 0;
  _.entityEach( { a : 'abc', b : 1, c : 'ab', d : 'a' }, onEach );
  test.identical( got, 29 );

  //

  test.case = 'Third argument in onEach'
  var onEach = function( v, k, src )
  {
    if( _.objectIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  _.entityEach( src, onEach );
  test.identical( got, src );

  test.close( 'src is an object' );

  /* - */

  test.case = 'src is not ArrayLike or ObjectLike';

  var got;
  _.entityEach( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEach( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEach( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEach( function b(){ return 'a'}, ( v ) => got = typeof v );
  test.identical( got, 'function' );

  var got;
  _.entityEach( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  //

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEach() );

  test.case = 'only one argument';
  test.shouldThrowErrorSync( () => _.entityEach( [ 'a' ] ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEach( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three args';
  test.shouldThrowErrorSync( () => _.entityEach( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEach( { a : 2 }, [] ) );
}

//
//
// function entityEachKey( test )
// {
//   test.open( 'src is an ArrayLike');
//
//   test.case = 'empty arrayLike objects'
//   var got;
//   var src = [];
//   _.entityEachKey( src, ( v ) => got = typeof v );
//   test.identical( got, undefined );
//
//   var got = [];
//   var src = _.unrollMake( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, [] );
//   test.isNot( _.unrollIs( got ) );
//   test.is( _.arrayIs( got ) );
//
//   var got = [];
//   var src = _.argumentsArrayMake( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, [] );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new Array( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, src );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new F32x( 0 );
//   _.entityEachKey( src, ( v, i ) => got[ i ] = v + i );
//   test.identical( got, [] );
//
//   //
//
//   test.case = 'not empty arrayLike objects';
//
//   var got = [];
//   var src = [ 0, 1, 2 ];
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//
//   var got = [];
//   var src = _.unrollMake( [ 0, 1, _.unrollMake( [ 2 ] ) ] );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.isNot( _.unrollIs( got ) );
//   test.is( _.arrayIs( src ) );
//
//   var got = [];
//   var src = _.argumentsArrayMake( [ 0, 1, 2 ] );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new Array( 0, 1, 2 );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.is( _.longIs( src ) );
//
//   var got = [];
//   var src = new F32x( [ 0, 1, 2 ] );
//   _.entityEachKey( src, ( v, u, i ) => got[ i ] = v * v );
//   test.identical( got, [ 0, 1, 4 ] );
//   test.is( _.longIs( src ) );
//
//   //
//
//   test.case = 'routine counter';
//
//   var onEach = function( v, u )
//   {
//     if( _.strIs( v ) && u === undefined )
//     got += 10;
//     else
//     got -= 1;
//   }
//
//   var got = 0;
//   _.entityEachKey( 1, onEach );
//   test.identical( got, -1 );
//
//   var got = 0;
//   _.entityEachKey( 'abc', onEach );
//   test.identical( got, 10 );
//
//   var got = 0;
//   _.entityEachKey( [ 'abc', 1, 'ab', 'a',  { a : 1 } ], onEach );
//   test.identical( got, 28 );
//
//   var got = 0;
//   var src = _.unrollFrom( [ 1, 'str', _.unrollMake( [ { a : 'abc' }, 'str' ] ) ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, 18 );
//
//   var got = 0;
//   var src = _.argumentsArrayMake( [ 1, 'str', [ [ 'abc' ], 'str' ] ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, 8 );
//
//   var got = 0;
//   var src = new Array( 1, 'str', [ 2, 'str' ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, 8 );
//
//   var got = 0;
//   var src = new F32x( [ 1, 1, [ 2 ] ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, -3 );
//
//   test.case = 'Third argument in onEach'
//   var onEach = function( v, u, i )
//   {
//     if( _.longIs( arguments[ 3 ] ) )
//     got = src;
//     else
//     got += 10;
//   }
//
//   var got;
//   var src = [ 0, 1, 3, 5 ];
//   _.entityEachKey( src, onEach );
//   test.identical( got, src );
//
//   var got;
//   var src = _.unrollMake( [ 0, 1, _.unrollFrom( [ 3, 5 ] ) ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, [ 0, 1, 3, 5 ] );
//   test.is( _.unrollIs( got ) );
//   test.is( _.arrayIs( got ) );
//
//   var got;
//   var src = _.argumentsArrayMake( [ 0, 1, [ 3, 5 ] ] );
//   _.entityEachKey( src, onEach );
//   test.identical( got, src );
//   test.is( _.longIs( got ) );
//
//   var got;
//   var src = new Array( 1, 2, null, true );
//   _.entityEachKey( src, onEach );
//   test.identical( got, src );
//   test.is( _.longIs( got ) );
//
//   var got;
//   var src = new F32x( [ 1, 2, 1, 3 ] );
//   _.entityEachKey( src, onEach );
//   test.equivalent( got, [ 1, 2, 1, 3 ] );
//   test.is( _.longIs( got ) );
//
//   test.close( 'src is an ArrayLike');
//
//   /* - */
//
//   test.open( 'src is an ObjectLike' );
//
//   test.case = 'not onEach';
//   var got = {};
//   _.entityEachKey( {}, ( v ) => got = v );
//   test.identical( got, {} );
//
//   var got = {};
//   _.entityEachKey( Object.create( null ), ( v, k ) => got[ k ] = v + k );
//   test.identical( got, {} );
//
//   var got = {};
//   _.entityEachKey( { a : 1, b : 3, c : 5 }, ( k, v ) => got[ k ] = v * v + k );
//   test.identical( got, { a : '1a', b : '9b', c : '25c' } );
//
//   //
//
//   test.case = 'routine counter';
//   var onEach = function( k, v )
//   {
//     if( _.strIs( v ) && k )
//     got += 10;
//     else
//     got -= 1;
//   }
//
//   var got = 0;
//   _.entityEachKey( 'abc', onEach );
//   test.identical( got, -1 );
//
//   var got = 0;
//   _.entityEachKey( { a : 'abc' }, onEach );
//   test.identical( got, 10 );
//
//   var got = 0;
//   _.entityEachKey( { a : 'abc', b : 1, c : 'ab', d : null }, onEach );
//   test.identical( got, 18 );
//
//   var got = 0;
//   _.entityEachKey( { a : [ 'a', 'b' ], b : { e : 1 } }, onEach );
//   test.identical( got, -2 );
//
//   //
//
//   test.case = 'Third argument in onEach'
//   var onEach = function( v, k, i )
//   {
//     got[ i ] = v + k;
//   }
//
//   var got = {};
//   _.entityEachKey( { ak : 'a', bk : 'b', ck : 'c' }, onEach );
//   test.identical( got, { 0 : 'a1', 1 : 'b2', 2 : 'c3' } );
//
//   test.close( 'src is an ObjectLike' );
//
//   /* - */
//
//   test.case = 'src is not ArrayLike or ObjectLike';
//
//   var got;
//   _.entityEachKey( null, ( v ) => got = typeof v );
//   test.identical( got, 'object' );
//
//   var got;
//   _.entityEachKey( 1, ( v ) => got = typeof v );
//   test.identical( got, 'number' );
//
//   var got;
//   _.entityEachKey( 'a', ( v ) => got = v + 2 );
//   test.identical( got, 'a2' );
//
//   var got;
//   _.entityEachKey( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
//   test.identical( got, 'function undefined' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.entityEachKey() );
//
//   test.case = 'only one argument';
//   test.shouldThrowErrorSync( () => _.entityEachKey( [ 'a' ] ) );
//
//   test.case = 'too many arguments';
//   test.shouldThrowErrorSync( () => _.entityEachKey( [ 'a' ], ( a ) => a, ( b ) => b ) );
//
//   test.case = 'onEach has more then three arg';
//   test.shouldThrowErrorSync( () => _.entityEachKey( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );
//
//   test.case = 'onEach is not a routine';
//   test.shouldThrowErrorSync( () => _.entityEachKey( { a : 2 }, [] ) );
// }

//

function entityEachOwn( test )
{
  test.open( 'src is an ArrayLike');

  test.case = 'empty arrayLike objects';
  var got;
  var src = [];
  _.entityEachOwn( src, ( v ) => got = typeof v );
  test.identical( got, undefined );

  var got = [];
  var src = _.unrollMake( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = _.argumentsArrayMake( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new Array( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, src );
  test.is( _.arrayIs( got ) );

  var got = [];
  var src = new F32x( 0 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v + i );
  test.identical( got, [] );
  test.is( _.arrayIs( got ) );

  //

  test.case = 'not empty arrayLike objects';

  var got = [];
  var src = [ 0, 1, 2 ];
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );

  var got = [];
  var src = _.unrollMake( [ 0, 1, _.unrollMake( [ 2 ] ) ] );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( src ) );

  var got = [];
  var src = _.argumentsArrayMake( [ 0, 1, 2 ] );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new Array( 0, 1, 2 );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  var got = [];
  var src = new F32x( [ 0, 1, 2 ] );
  _.entityEachOwn( src, ( v, i ) => got[ i ] = v * v + i );
  test.identical( got, [ 0, 2, 6 ] );
  test.is( _.longIs( src ) );

  //

  test.case = 'routine counter';

  var onEach = function( v, i )
  {
    if( _.strIs( v ) && i >= 0 )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEachOwn( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( 'abc', onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( [ 'abc', 1, 'ab', 'a' ], onEach );
  test.identical( got, 29 );

  var got = 0;
  _.entityEachOwn( [ { a : 1 }, { b : 2 } ], onEach );
  test.identical( got, -2 );

  var got = 0;
  var src = _.unrollFrom( [ 1, 'str', _.unrollMake( [ 2, 'str' ] ) ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, 18 );

  var got = 0;
  var src = _.argumentsArrayMake( [ 1, 'str', [ 2, 'str' ] ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new Array( 1, 'str', [ 2, 'str' ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = new F32x( [ 1, 1, [ 2 ] ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, -3 );

  test.case = 'Third argument in onEach'
  var onEach = function( v, i, src )
  {
    if( _.longIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got;
  var src = [ 0, 1, 3, 5 ];
  _.entityEachOwn( src, onEach );
  test.identical( got, src );

  var got;
  var src = _.unrollMake( [ 0, 1, _.unrollFrom( [ 3, 5 ] ) ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, [ 0, 1, 3, 5 ] );
  test.is( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got;
  var src = _.argumentsArrayMake( [ 0, 1, [ 3, 5 ] ] );
  _.entityEachOwn( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new Array( 1, 2, null, true );
  _.entityEachOwn( src, onEach );
  test.identical( got, src );
  test.is( _.longIs( got ) );

  var got;
  var src = new F32x( [ 1, 2, 1, 3 ] );
  _.entityEachOwn( src, onEach );
  test.equivalent( got, [ 1, 2, 1, 3 ] );
  test.is( _.longIs( got ) );

  test.close( 'src is an ArrayLike');

  /* - */

  test.open( 'src is an ObjectLike' );

  var got ={};
  _.entityEachOwn( {}, ( v ) => got = v );
  test.identical( got, {} );

  var got = {};
  var src = Object.create( null );
  var src2 = Object.create( src );
  _.entityEachOwn( src, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );
  _.entityEachOwn( src2, ( v, k ) => got[ k ] = v + k );
  test.identical( got, {} );

  var got = {};
  var src = Object.create( null );
  src.a = 1;
  src.b = 3;
  var src2 = Object.create( src );
  _.entityEachOwn( src2, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, {} );
  _.entityEachOwn( src, ( v, k ) => got[ k ] = v * v + k );
  test.identical( got, { a : '1a', b : '9b' } );

  test.case = 'routine counter';

  var onEach = function( v, k )
  {
    if( _.strIs( v ) && k )
    got += 10;
    else
    got -= 1;
  }

  var got = 0;
  _.entityEachOwn( 1, onEach );
  test.identical( got, -1 );

  var got = 0;
  _.entityEachOwn( { a : 'abc', b : 1, c : 'ab', d : null }, onEach );
  test.identical( got, 18 );

  var got = 0;
  var src = { name : 'object', toString : 1, toSource : null };
  var src2 = Object.create( src );
  _.entityEachOwn( src2, onEach );
  test.identical( got, 0 );
  _.entityEachOwn( src, onEach );
  test.identical( got, 8 );

  var got = 0;
  var src = Object.create( null );
  src.a = [ 'a', 'b' ];
  src.b = { a : 1 };
  var src2 = Object.create( src );
  src2.c = 'str';
  test.identical( src.a, src2.a );
  test.identical( src.b, src2.b );
  _.entityEachOwn( src, onEach );
  test.identical( got, -2 );
  _.entityEachOwn( src2, onEach );
  test.identical( got, 8 );

  test.case = 'Third argument in onEach'
  var onEach = function( v, k, src )
  {
    if( _.objectIs( src ) )
    got = src;
    else
    got += 10;
  }

  var got = {};
  var src = Object.create( null );
  src.a = 'str';
  var src2 = Object.create( src );
  _.entityEachOwn( src2, onEach );
  test.identical( got, {} );
  _.entityEachOwn( src, onEach );
  test.identical( got, src );

  test.close( 'src is an ObjectLike' );

  /* - */

  test.case = 'src is not ArrayLike or ObjectLike';

  var got;
  _.entityEachOwn( null, ( v ) => got = typeof v );
  test.identical( got, 'object' );

  var got;
  _.entityEachOwn( 1, ( v ) => got = typeof v );
  test.identical( got, 'number' );

  var got;
  _.entityEachOwn( 'a', ( v ) => got = v + 2 );
  test.identical( got, 'a2' );

  var got;
  _.entityEachOwn( function b(){ return 'a'}, ( v, i ) => got = typeof v + ' ' + typeof i );
  test.identical( got, 'function undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityEachOwn() );

  test.case = 'only one argument';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 'a' ] ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arg';
  test.shouldThrowErrorSync( () => _.entityEachOwn( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityEachOwn( { a : 2 }, [] ) );
}

//

function entityOnlyOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOnly( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOnly( dst, undefined, '*/x' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOnly( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityOnly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityOnly( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityOnlyOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOnly( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOnly( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOnly( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOnly( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOnlyBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = exp;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOnly( dst, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOnlyBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, null : null, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );


  test.case = 'dst - array, src - array';
  var exp = [ false, 0, 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - number';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = 'dst';
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = '';
  var dst = '';
  var src = 'src';
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = false;
  var dst = false;
  var src = 2;
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityOnly( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = 0;
  var dst = 0;
  var src = true;
  var got = _.entityOnly( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityOnly( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = '';
  var dst = '';
  var src = true;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = false;
  var dst = false;
  var src = 1;
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOnly( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOnly( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityOnly( dst, src, '*/x' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - 0';
  var exp = undefined;
  var dst = 'dst';
  var src = 0;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityOnly( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOnlyDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { map : { a : 0 } };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityOnly( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityOnly( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = {};
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ false, 1 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityOnly( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityOnly( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : 1, f2 : 0 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOnly( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : false, f2 : 3 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOnly( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = 0;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOnly( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOnly( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

}

//

function entityOnlyOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src' ], 8 );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { 'a' : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 3, null, undefined, [ 0 ], '', { a : 0 }, false, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', false, { a : 3 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  // test.case = 'has unnecessary elements, onEach returns undefined';
  // var exp = new Set( [ [ 2 ], { a : 3 } ] );
  // var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  // var src = new Set( [ { a : 3 }, 0, 1, null, undefined, [ 2 ], '', false, 'str' ] );
  // var got = _.entityOnly( dst, src, ( e ) => undefined );
  // test.is( got === dst );
  // test.is( got !== src );
  // test.equivalent( [ ... got ], [ ... exp ] );
  //
  // test.case = 'without unnecessary elements, onEach returns undefined';
  // var exp = new Set( [] );
  // var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  // var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  // var got = _.entityOnly( dst, src, ( e ) => undefined );
  // test.is( got === dst );
  // test.is( got !== src );
  // test.equivalent( [ ... got ], [ ... exp ] );
  //
  // test.case = 'onEach is selector';
  // var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  // var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  // var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  // var got = _.entityOnly( dst, src, '*/f1' );
  // test.is( got === dst );
  // test.is( got !== src );
  // test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityOnlyOnlySetsExperiment( test )
{
  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ { a : 3 }, 0, 1, null, undefined, [ 2 ], '', false, 'str' ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.equivalent( [ ... got ], [ ... exp ] );
}
entityOnlyOnlySetsExperiment.experimental = 1;

//

function entityOnlyOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityOnly( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityOnly( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map();
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ]);
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityOnly( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 0, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityOnly( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityOnly* routines */

//

function entityButOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = exp;
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityBut( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityBut( dst, undefined, '*/x' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var got = _.entityBut( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityBut() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityBut( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityButOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false, 0 ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityBut( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = new Constructor1();
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false, 0 ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ false ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = new Constructor1();
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { b : { f1 : false, f2 : 3 } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : false, f2 : 3 } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityBut( null, src, '*/x' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityBut( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = '';
  var src = '';
  var got = _.entityBut( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = false;
  var src = false;
  var got = _.entityBut( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = 0;
  var src = 0;
  var got = _.entityBut( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityButBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false, 0 ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ false ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : 1, f2 : 0 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityBut( dst, src, '*/x' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = '';
  var dst = '';
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = false;
  var dst = false;
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = 0;
  var dst = 0;
  var src = dst;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityButBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - number';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = undefined;
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = '';
  var dst = '';
  var src = null;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = false;
  var dst = false;
  var src = undefined;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = undefined;
  var dst = false;
  var src = 2;
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = 0;
  var dst = 0;
  var src = false;
  var got = _.entityBut( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = undefined;
  var dst = 0;
  var src = true;
  var got = _.entityBut( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = '';
  var dst = '';
  var src = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = false;
  var dst = false;
  var src  = true;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = 0;
  var dst = 0;
  var src = 1;
  var got = _.entityBut( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { false : false, zero : 0 };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false, 0, { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = false;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = '';
  var dst = '';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = false;
  var dst = false;
  var src = 0;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = 0;
  var dst = 0;
  var src = '';
  var got = _.entityBut( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { '' : 'str::empty' };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ false ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = false;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = '';
  var dst = '';
  var src = null;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = '';
  var dst = '';
  var src = true;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = false;
  var dst = false;
  var src = 0;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = false;
  var dst = false;
  var src = 1;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = 0;
  var dst = 0;
  var src = '';
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityBut( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityBut( dst, src, '*/x' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - 0';
  var exp = 'dst';
  var dst = 'dst';
  var src = 0;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = '';
  var dst = '';
  var src = 1;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = false;
  var dst = false;
  var src = true;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = 0;
  var dst = 0;
  var src = null;
  var got = _.entityBut( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityButDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], '' : 'str::empty' };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityBut( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ false, true, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityBut( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, true, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityBut( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { '' : 'str::empty' };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ true ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = 0;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityBut( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityBut( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 0 : { f1 : 1, f2 : 0 }, 2 : { f1 : [], f2 : 'str' } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityBut( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityBut( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityBut( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

function entityButOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : false, f2 : 3 } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : false, f2 : 3 } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, null, undefined, '', false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : false, f2 : 3 } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 0, null, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ 0, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ [ 2 ], { a : 3 } ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityButOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityBut( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityBut( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'b', { f1 : false, f2 : 3 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 0, 0 ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 0, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityBut( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 0, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityBut( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityBut* routines */

//

function entityAndOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityAnd( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityAnd( dst, undefined, '*/x' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityAnd( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityAnd() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityAnd( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityAndOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  debugger;
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityAnd( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityAnd( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityAnd( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityAnd( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityAndBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = exp;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityAnd( dst, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityAndBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - number';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = 'dst';
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityAnd( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = undefined;
  var dst = false;
  var src = 2;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = undefined;
  var dst = 0;
  var src = true;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityAnd( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, 'str', [ 1 ] ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityAnd( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityAnd( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = { c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityAnd( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var exp = undefined;
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityAnd( dst, src, '*/x' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - 0';
  var exp = undefined;
  var dst = 'dst';
  var src = 0;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityAnd( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityAndDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { map : { a : 0 } };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityAnd( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityAnd( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = {};
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityAnd( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = undefined;
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityAnd( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = {};
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityAnd( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityAnd( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : 1, f2 : 0 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityAnd( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : false, f2 : 3 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityAnd( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

function entityAndOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 1, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [1, 'str' ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 2 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

//

function entityAndOnlySetsExperiment( test )
{
  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.identical( [ ... got ], [ ... exp ] );
}
entityAndOnlySetsExperiment.experimental = 1;

//

function entityAndOnlyHashMaps( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityAnd( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var src = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var got = _.entityAnd( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = dst;
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has unnecessary elements';
  var exp = new Map( [ [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 0 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, true ], [ [ 2 ], [ 1 ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, 'null' ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Map( [ [ 1, 1 ], [ 'str', 'str' ] ] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 4 ], [ [ 2 ], [ 1 ] ], [ { a : 0 }, { a : 0 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 0, 0 ], [ 1, 1 ], [ null, null ], [ undefined, undefined ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 0, 1 ], [ 1, 1 ], [ null, 'null' ], [ undefined, 'undefined' ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Map( [] );
  var dst = new Map( [ [ 1, 1 ], [ [ 2 ], [ 2 ] ], [ { a : 3 }, { a : 3 } ], [ 'str', 'str' ] ] );
  var src = new Map( [ [ 1, 2 ], [ [ 2 ], [ '2' ] ], [ { a : 3 }, { a : 0 } ], [ 'str', 'src' ] ] );
  var got = _.entityAnd( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'onEach is selector';
  var exp = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ] ] );
  var dst = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : false, f2 : 3 } ], [ 'c', { f1 : [], f2 : 'str' } ] ] );
  var src = new Map( [ [ 'a', { f1 : 1, f2 : 0 } ], [ 'b', { f1 : 1, f2 : 3 } ], [ 'c', { f1 : undefined, f2 : 'str' } ] ] );
  var got = _.entityAnd( dst, src, '*/f1' );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.close( 'both' );
}

/* end of entityAnd* routines */

//

function entityOrOnlyDst( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOr( dst );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, ( e, k ) => e );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, undefined, '*/f2' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var got = _.entityOr( dst, undefined, '*/x' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var got = _.entityOr( dst, undefined, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityOr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], ( e ) => e, 'extra' ) );

  test.case = 'wrong onEach type';
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], [] ) );

  test.case = 'onEach.length > 3';
  test.shouldThrowErrorSync( () => _.entityOr( [ 1, 2 ], [ 0, 1 ], ( a, b, c, d ) => a - b + c - d ) );
}

//

function entityOrOnlySrc( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOr( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOr( null, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = undefined;
  var src = new Constructor1();
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = undefined;
  var src = 'src';
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( null, src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( null, src, '*/f2' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - obj';
  var exp = new Constructor1();
  var src = exp;
  var got = _.entityOr( null, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = 'src';
  var src = 'src';
  var got = _.entityOr( null, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'src - empty str';
  var exp = undefined;
  var src = '';
  var got = _.entityOr( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - false';
  var exp = undefined;
  var src = false;
  var got = _.entityOr( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - 0';
  var exp = undefined;
  var src = 0;
  var got = _.entityOr( null, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOrBothSame( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = src;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = exp;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map';
  var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array';
  var exp = [ 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = undefined;
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - map, */f2';
  var exp = { b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = dst;
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - array, */f2';
  var exp = [ { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = dst;
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - obj';
  var exp = new Constructor1();
  var dst = exp;
  var src = dst;
  var got = _.entityOr( dst, src, '*/x' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - empty str';
  var exp = undefined;
  var dst = '';
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false';
  var exp = undefined;
  var dst = false;
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0';
  var exp = undefined;
  var dst = 0;
  var src = dst;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOrBoth( test )
{

  function Constructor1()
  {
    this.x = 1;
    return this;
  }

  /* - */

  test.open( 'no onEach' );

  test.case = 'dst - map, src - map';
  var exp = { null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, null : 'null', true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 1, false, 0, 'str', [ 1 ] ];
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - number';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = 0;
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - obj';
  var exp = 'dst';
  var dst = 'dst';
  var src = new Constructor1();
  var got = _.entityOr( dst, src );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - str';
  var exp = 'src';
  var dst = '';
  var src = 'src';
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - undefined';
  var exp = undefined;
  var dst = false;
  var src = undefined;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - number';
  var exp = 2;
  var dst = false;
  var src = 2;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - false';
  var exp = undefined;
  var dst = 0;
  var src = false;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - true';
  var exp = true;
  var dst = 0;
  var src = true;
  var got = _.entityOr( dst, src );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* - */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'dst - map, src - map';
  var exp = {};
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'dst::empty' };
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 }, 2, 3 ];
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - obj';
  var exp = undefined;
  var dst = new Constructor1();
  var src = new Constructor1();
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src  = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, dst - str';
  var exp = undefined;
  var dst = '';
  var src = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - true';
  var exp = undefined;
  var dst = false;
  var src  = true;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - 1';
  var exp = undefined;
  var dst = 0;
  var src = 1;
  var got = _.entityOr( dst, src, ( e, k ) => undefined );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* - */

  test.open( 'onEach - routine returning element' );

  test.case = 'dst - map, src - map';
  var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'src::empty' };
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ true, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ false, 0, true, 1, 'str', [ 1 ] ];
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = 'dst';
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = 'dst';
  var dst = 'dst';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst === got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = true;
  var dst = '';
  var src = true;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = 1;
  var dst = false;
  var src = 1;
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src === got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOr( dst, src, ( e, k ) => e );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* - */

  test.open( 'onEach - routine returning key' );

  test.case = 'dst - map, src - map';
  var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
  var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var src = { 0 : null, false : 0, zero : false, true : 1, one : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array';
  var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var dst = [ false, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
  var src = [ true, 0, false, 1, 'str', [ 1 ] ];
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - false';
  var exp = undefined;
  var dst = new Constructor1();
  var src = false;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - str';
  var exp = undefined;
  var dst = 'dst';
  var src = 'src';
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - str, src - null';
  var exp = undefined;
  var dst = 'dst';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - null';
  var exp = undefined;
  var dst = '';
  var src = null;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - true';
  var exp = undefined;
  var dst = '';
  var src = true;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 0';
  var exp = undefined;
  var dst = false;
  var src = 0;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src - 1';
  var exp = undefined;
  var dst = false;
  var src = 1;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src = empty string';
  var exp = undefined;
  var dst = 0;
  var src = '';
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* - */

  test.open( 'onEach - selector' );

  test.case = 'dst - map, src - map, */f1';
  var exp = { a : { f1 : 1, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 3, f2 : 0 }, b : { f1 : 1, f2 : 3 }, c : { f1 : 0, f2 : 'str' } };
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - map, src - map, */f2';
  var exp = {  a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var dst = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
  var src = { a : { f1 : 1, f2 : 1 }, b : { f1 : false, f2 : 0 }, c : { f1 : [], f2 : 'str' } };
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f1';
  var exp = [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 0, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - array, src - array, */f2';
  var exp = [ { f1 : 1, f2 : true }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
  var src = [ { f1 : 1, f2 : true }, { f1 : false, f2 : false }, { f1 : [], f2 : 'str' } ];
  var got = _.entityOr( dst, src, '*/f2' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - obj, src - str';
  var exp = new Constructor1();
  var dst = new Constructor1();
  var src = 'src';
  var got = _.entityOr( dst, src, '*/x' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  // Dmytro : delimeter '*/length' check length of string as property

  test.case = 'dst - str, src - 0';
  var exp = 'dst';
  var dst = 'dst';
  var src = 0;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst === got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - empty str, src - 1';
  var exp = undefined;
  var dst = '';
  var src = 1;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - false, src = true';
  var exp = undefined;
  var dst = false;
  var src = true;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst !== got );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'dst - 0, src - null';
  var exp = undefined;
  var dst = 0;
  var src = null;
  var got = _.entityOr( dst, src, '*/length' );
  test.is( dst !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );
}

//

function entityOrDiffTypes( test )
{
  test.shouldThrowErrorSync
  ( () =>
  {
    /* Dmytro : need clarification. Array prototype has some properties, the access to this properties provides by  arr[ property ].
    the example below show this effect */

    test.case = 'dst - map, src - array';
    var exp = { true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var dst = { false : false, zero : 0, null : null, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ false, 0, 'null', true, 1, 'str', [ 1 ], { a : 0 }, '' ];
    var got = _.entityOr( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1, true, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { 1 : 1, false : false, zero : 0, null : 'null', true : true, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var got = _.entityOr( dst, src );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = {};
    var dst = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], maps : { a : 0 }, '' : 'str::empty' };
    var src = [ true, false, 1, 0, 'str', [], {} ];
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 1 ];
    var dst = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = [ 1 ];
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOr( dst, src, ( e, k ) => e );
    test.is( dst !== got );
    test.is( src === got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array';
    var exp = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 } };
    var dst = { 0 : 'zero', false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
    var src = [ 1, 2, 3, 4 ];
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map';
    var exp = [ 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var dst = [ true, 0, false, 1, 'str', [ 1 ], { a : 0 } ];
    var src = { a : 2, b : 3, 0 : 'str', 2 : false, 3 : true };
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - obj, src - map';
    var exp = new Constructor1();
    var dst = new Constructor1();
    var src = { a : 0 };
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - 0, src = array';
    var exp = undefined;
    var dst = 0;
    var src = [ 1 ];
    var got = _.entityOr( dst, src, ( e, k ) => k );
    test.is( dst !== got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with maps, */f1';
    var exp = {};
    var dst = { a : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
    var src = [ { f1 : 3, f2 : 0 }, { f1 : 1, f2 : 3 }, { f1 : 0, f2 : 'str' } ];
    var got = _.entityOr( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - map, src - array with map, */f2';
    var exp = { 1 : { f1 : false, f2 : 3 } };
    var dst = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, 2 : { f1 : [], f2 : 'str' } };
    var src = [ 0, { f1 : 1, f2 : 1 }, 2, 3 ];
    var got = _.entityOr( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f1';
    var exp = [ { f1 : 1, f2 : 0 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOr( dst, src, '*/f1' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });

  test.shouldThrowErrorSync
  ( () =>
  {
    test.case = 'dst - array, src - map, */f2';
    var exp = [ { f1 : false, f2 : 3 } ];
    var dst = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
    var src = { 0 : { f1 : 1, f2 : 0 }, 1 : { f1 : false, f2 : 3 }, a : { f1 : [], f2 : 'str' } };
    var got = _.entityOr( dst, src, '*/f2' );
    test.is( dst === got );
    test.is( src !== got );
    test.identical( got, exp );
  });
}

//

//

function entityOrOnlySets( test )
{
  test.open( 'only dst' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, undefined, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOr( dst, undefined, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'only src' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => e );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src, ( e, k ) => k );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( null, src, ( e ) => undefined );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var src = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var got = _.entityOr( null, src, '*/f1' );
  test.is( got !== src );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'only src' );

  /* - */

  test.open( 'both same' );

  test.case = 'has unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = dst;
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 0 }, { f1 : [], f2 : 'str' } ] );
  var dst = new Set( [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ] );
  var src = dst;
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both same' );

  /* - */

  test.open( 'both' );

  test.case = 'has same unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, false, 'some', 7 ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has different unnecessary elements';
  var exp = new Set( [ 1,[ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 1, 0, [ 2 ], null, 'str', undefined, '', { a : 3 }, 'some', 7 ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 3, 4 ], { b : 3 }, 'src', 8 ] );
  var got = _.entityOr( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 0 ], { a : 3 }, '', false, 'str' ] );
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns value';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 2, [ 0 ], { a : 0 }, 'src' ] );
  var got = _.entityOr( dst, src, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns key';
  var exp = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 4, null, undefined, [ 0 ], { a : 0 }, '', false, 'str' ] );
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns key';
  var exp = new Set( [ [ 2 ], { a : 3 }, 'str' ] );
  var dst = new Set( [ 0, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 0 ], { a : 0 }, 'str' ] );
  var got = _.entityOr( dst, src, ( e, k ) => k );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'has unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var src = new Set( [ 0, 1, null, undefined, [ 2 ], '', { a : 3 }, false, 'str' ] );
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'without unnecessary elements, onEach returns undefined';
  var exp = new Set( [] );
  var dst = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var src = new Set( [ 1, [ 2 ], { a : 3 }, 'str' ] );
  var got = _.entityOr( dst, src, ( e ) => undefined );
  test.is( got === dst );
  test.is( got !== src );
  test.equivalent( [ ... got ], [ ... exp ] );

  test.case = 'onEach is selector';
  var exp = new Set( [ { f1 : 1, f2 : 'str' } ] );
  var dst = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var src = new Set( [ { f1 : undefined, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : 1, f2 : 'str' } ] );
  var got = _.entityOr( dst, src, '*/f1' );
  test.is( got === dst );
  test.identical( [ ... got ], [ ... exp ] );

  test.close( 'both' );
}

/* end of entityOr* routines */

//

// function entityBut( test )
// {
//
//   function Constructor1()
//   {
//     this.x = 1;
//     return this;
//   }
//
//   /* */
//
//   test.open( 'no onEach' );
//
//   test.case = 'src - map';
//   var exp = { false : false, zero : 0 };
//   var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
//   var got = _.entityBut( src );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - array';
//   var exp = [ false, 0 ];
//   var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
//   var got = _.entityBut( src );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - obj';
//   var exp = undefined;
//   var src = new Constructor1();
//   var got = _.entityBut( src );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - str';
//   var exp = undefined;
//   var src = 'src';
//   var got = _.entityBut( src );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - empty str';
//   var exp = '';
//   var src = '';
//   var got = _.entityBut( src );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - false';
//   var exp = false;
//   var src = false;
//   var got = _.entityBut( src );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - 0';
//   var exp = 0;
//   var src = 0;
//   var got = _.entityBut( src );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.close( 'no onEach' );
//
//   /* */
//
//   test.open( 'onEach - routine returning undefined' );
//
//   test.case = 'src - map';
//   var exp = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
//   var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - array';
//   var exp = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
//   var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - obj';
//   var exp = new Constructor1();
//   var src = exp;
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - str';
//   var exp = 'src';
//   var src = 'src';
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - empty str';
//   var exp = '';
//   var src = '';
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - false';
//   var exp = false;
//   var src = false;
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - 0';
//   var exp = 0;
//   var src = 0;
//   var got = _.entityBut( src, ( e, k ) => undefined );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.close( 'onEach - routine returning undefined' );
//
//   /* */
//
//   test.open( 'onEach - routine returning element' );
//
//   test.case = 'src - map';
//   var exp = { false : false, zero : 0 };
//   var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - array';
//   var exp = [ false, 0 ];
//   var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - obj';
//   var exp = undefined;
//   var src = new Constructor1();
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - str';
//   var exp = undefined;
//   var src = 'src';
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - empty str';
//   var exp = '';
//   var src = '';
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - false';
//   var exp = false;
//   var src = false;
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - 0';
//   var exp = 0;
//   var src = 0;
//   var got = _.entityBut( src, ( e, k ) => e );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.close( 'onEach - routine returning element' );
//
//   /* */
//
//   test.open( 'onEach - routine returning key' );
//
//   test.case = 'src - map';
//   var exp = { '' : 'str::empty' };
//   var src = { false : false, zero : 0, true : true, one : 1, str : 'str', arr : [ 1 ], map : { a : 0 }, '' : 'str::empty' };
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - array';
//   var exp = [ false ];
//   var src = [ false, 0, true, 1, 'str', [ 1 ], { a : 0 } ];
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - obj';
//   var exp = new Constructor1();
//   var src = exp;
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - str';
//   var exp = 'src';
//   var src = 'src';
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - empty str';
//   var exp = '';
//   var src = '';
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - false';
//   var exp = false;
//   var src = false;
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - 0';
//   var exp = 0;
//   var src = 0;
//   var got = _.entityBut( src, ( e, k ) => k );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.close( 'onEach - routine returning key' );
//
//   /* */
//
//   test.open( 'onEach - selector' );
//
//   test.case = 'src - map, */f1';
//   var exp = { b : { f1 : false, f2 : 3 } };
//   var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
//   var got = _.entityBut( src, '*/f1' );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - map, */f2';
//   var exp = { a : { f1 : 1, f2 : 0 } };
//   var src = { a : { f1 : 1, f2 : 0 }, b : { f1 : false, f2 : 3 }, c : { f1 : [], f2 : 'str' } };
//   var got = _.entityBut( src, '*/f2' );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - array, */f1';
//   var exp = [ { f1 : false, f2 : 3 } ];
//   var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
//   var got = _.entityBut( src, '*/f1' );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - array, */f2';
//   var exp = [ { f1 : 1, f2 : 0 } ];
//   var src = [ { f1 : 1, f2 : 0 }, { f1 : false, f2 : 3 }, { f1 : [], f2 : 'str' } ];
//   var got = _.entityBut( src, '*/f2' );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - obj';
//   var exp = undefined;
//   var src = new Constructor1();
//   var got = _.entityBut( src, '*/x' );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - str';
//   var exp = undefined;
//   var src = 'src';
//   var got = _.entityBut( src, '*/length' );
//   test.is( src !== got );
//   test.identical( got, exp );
//
//   test.case = 'src - empty str';
//   var exp = '';
//   var src = '';
//   var got = _.entityBut( src, '*/length' );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - false';
//   var exp = false;
//   var src = false;
//   var got = _.entityBut( src, '*/length' );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.case = 'src - 0';
//   var exp = 0;
//   var src = 0;
//   var got = _.entityBut( src, '*/length' );
//   test.is( src === got );
//   test.identical( got, exp );
//
//   test.close( 'onEach - selector' );
//
//   /* */
//
// } /* end of function entityBut */

//

function entityAll( test )
{
  test.open( 'onEach is routine' );

  test.case = 'array';

  var got = _.entityAll( [ 1, 'str', undefined ], ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, 4 ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, true );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, false ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, false );

  var got = _.entityAll( [ 1, 'str', 3, null ], () => undefined );
  test.identical( got, undefined );

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), undefined, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  test.case = 'Array';

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new Array( 1, 2, [ 'str' ], false, 4 );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  test.case = 'F32x';

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], false, 4 ] );
  var got = _.entityAll( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src, () => undefined );
  test.identical( got, undefined );

  test.case = 'ObjectLike';

  var got = _.entityAll( { 1 : 2, c : 4, a : undefined }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAll( { 'a' : 'a', '4' : '4', 'true' : 'true' }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityAll( { 1 : 2, 2 : 3, a : null }, ( v, k ) => v !== k );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : 3, c : true }, ( v, k ) => v !== k );
  test.identical( got, true );

  var got = _.entityAll( { 'a' : 'a', 'b' : 'str' }, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : false }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAll( { a : 1, b : false }, ( v, k, src ) => src.length !== k );
  test.identical( got, true );

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityAll( undefined, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityAll( null, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( 1, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( 'str', ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( false, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAll( true, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAll( true, ( src, u, u2 ) => src !== u2 );
  test.identical( got, true );

  test.close( 'onEach is routine' );

  /* - */

  test.open( 'onEach is null' );

  test.case = 'array';

  var got = _.entityAll( [ 1, 'str', undefined ] );
  test.identical( got, undefined );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, 4 ] );
  test.identical( got, true );

  var got = _.entityAll( [ 1, 'str', { a : 2 }, false ] );
  test.identical( got, false );

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), null, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, null );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), false, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, false );

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], undefined, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, undefined );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, false );

  test.case = 'Array';

  var src = new Array( 1, 2, [ 'str' ], null, 4 );
  var got = _.entityAll( src );
  test.identical( got, null );

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = new Array( 1, 2, [ 'str' ], false, 4 );
  var got = _.entityAll( src );
  test.identical( got, false );

  test.case = 'F32x';

  var src = new F32x( [ null, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, 0 );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAll( src );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], 'str', 4 ] );
  var got = _.entityAll( src );
  test.identical( got, NaN );

  test.case = 'ObjectLike';

  var got = _.entityAll( { 1 : 2, c : 4, a : undefined } );
  test.identical( got, undefined );

  var got = _.entityAll( { 1 : 2, 2 : 3, a : null } );
  test.identical( got, null );

  var got = _.entityAll( { a : 1, b : 3, c : true } );
  test.identical( got, true );

  var got = _.entityAll( { a : 'a', b : 'str' } );
  test.identical( got, true );

  var got = _.entityAll( { a : 1, b : false } );
  test.identical( got, false );

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityAll( undefined );
  test.identical( got, undefined );

  var got = _.entityAll( null );
  test.identical( got, null );

  var got = _.entityAll( 1 );
  test.identical( got, true );

  var got = _.entityAll( 'str' );
  test.identical( got, true );

  var got = _.entityAll( false );
  test.identical( got, false );

  var got = _.entityAll( true );
  test.identical( got, true );

  test.close( 'onEach is null' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityAll() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityAll( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arg';
  test.shouldThrowErrorSync( () => _.entityAll( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityAll( { a : 2 }, [] ) );
}

//

function entityAny( test )
{
  test.open( 'onEach is routine' );

  test.case = 'array';

  var got = _.entityAny( [ 1, 'str', undefined ], ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var got = _.entityAny( [ false, false, undefined ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, false );

  var got = _.entityAny( [ 1, 'str', { a : 2 }, false ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, true );

  var got = _.entityAny( [ 1, 'str', 3, null ], () => undefined );
  test.identical( got, false );

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( null ) ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ) ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ false, null, undefined ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  test.case = 'Array';

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = new Array( false, undefined, null );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new Array( 1, 2, [ 'str' ], false, 4 );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  test.case = 'F32x';

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, true );

  var src = new F32x( [ 'a', undefined, false, null ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], false, 4 ] );
  var got = _.entityAny( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityAny( src, () => undefined );
  test.identical( got, false );

  test.case = 'ObjectLike';

  var got = _.entityAny( { 1 : 2, c : 4, a : undefined }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAny( { 'a' : false, '4' : false, 'true' : 'true' }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityAny( { 1 : 2, 2 : 3, a : null }, ( v, k ) => typeof v === typeof k );
  test.identical( got, false );

  var got = _.entityAny( { 'a' : [], 'b' : 'str' }, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var got = _.entityAny( { a : 1, b : false }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityAny( { a : 1, b : false }, ( v, k, u ) => v !== u );
  test.identical( got, true );

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityAny( undefined, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityAny( null, ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAny( 1, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAny( 'str', ( src, u ) => src === u );
  test.identical( got, false );

  var got = _.entityAny( false, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAny( true, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityAny( true, ( src, u, u2 ) => src !== u2 );
  test.identical( got, true );

  test.close( 'onEach is routine' );

  /* - */

  test.open( 'onEach is null' );

  test.case = 'array';

  var got = _.entityAny( [ 1, 'str', undefined ] );
  test.identical( got, 1 );

  var got = _.entityAny( [ 'str', 1, { a : 2 }, 4 ] );
  test.identical( got, 'str' );

  var got = _.entityAny( [ false, null, undefined ] );
  test.identical( got, false );

  test.case = 'unroll';

  var src = _.unrollFrom( [ false, 2, _.unrollFrom( [ 'str' ] ), null, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 2 );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 'str' );

  var src = _.unrollMake( [ null, undefined, false ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ null, false, [ 'str' ], undefined, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, [ 'str' ] );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 1 );

  var src = _.argumentsArrayMake( [ null, false, undefined ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  test.case = 'Array';

  var src = new Array( false, 'ab', [ 'str' ], null, 4 );
  var got = _.entityAny( src );
  test.identical( got, 'ab' );

  var src = new Array( null, 22, [ 'str' ], 3, 4 );
  var got = _.entityAny( src );
  test.identical( got, 22 );

  var src = new Array( null, false, undefined );
  var got = _.entityAny( src );
  test.identical( got, false );

  test.case = 'F32x';

  var src = new F32x( [ 5, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 5 );

  var src = new F32x( [ undefined, [ 8 ], 3, 4 ] );
  var got = _.entityAny( src );
  test.identical( got, 8 );

  var src = new F32x( [ 'str', undefined, { a : 2 } ] );
  var got = _.entityAny( src );
  test.identical( got, false );

  test.case = 'ObjectLike';

  var got = _.entityAny( { 1 : 2, c : 4, a : undefined } );
  test.identical( got, 2 );

  var got = _.entityAny( { 1 : 2, 2 : 3, a : null } );
  test.identical( got, 2 );

  var got = _.entityAny( { a : false, b : null, c : undefined } );
  test.identical( got, false );

  var got = _.entityAny( { a : 'a', b : 'str' } );
  test.identical( got, 'a' );

  var got = _.entityAny( { a : 1, b : false } );
  test.identical( got, 1 );

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityAny( undefined );
  test.identical( got, false );

  var got = _.entityAny( null );
  test.identical( got, false );

  var got = _.entityAny( 1 );
  test.identical( got, 1 );

  var got = _.entityAny( 'str' );
  test.identical( got, 'str' );

  var got = _.entityAny( false );
  test.identical( got, false );

  var got = _.entityAny( true );
  test.identical( got, true );

  test.close( 'onEach is null' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityAny() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityAny( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arg';
  test.shouldThrowErrorSync( () => _.entityAny( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityAny( { a : 2 }, [] ) );
}

//

function entityNone( test )
{
  test.open( 'onEach is routine' );

  test.case = 'array';

  var got = _.entityNone( [ 1, 'str', undefined ], ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var got = _.entityNone( [ false, false, undefined ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, true );

  var got = _.entityNone( [ 1, 'str', { a : 2 }, false ], ( v, i ) => !!v && i + 2 < 6 );
  test.identical( got, false );

  var got = _.entityNone( [ 1, 'str', 3, null ], () => undefined );
  test.identical( got, true );

  test.case = 'unroll';

  var src = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( null ) ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ) ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.unrollMake( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ false, null, undefined ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], false, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  test.case = 'Array';

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new Array( false, undefined, null );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new Array( 1, 2, [ 'str' ], false, 4 );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  test.case = 'F32x';

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 4 );
  test.identical( got, false );

  var src = new F32x( [ 'a', undefined, false, null ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, true );

  var src = new F32x( [ 1, 2, [ 8 ], false, 4 ] );
  var got = _.entityNone( src, ( v, i ) => !!v && i + 2 < 7 );
  test.identical( got, false );

  var src = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityNone( src, () => undefined );
  test.identical( got, true );

  test.case = 'ObjectLike';

  var got = _.entityNone( { 1 : 2, c : 4, a : undefined }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityNone( { 'a' : false, '4' : false, 'true' : 'true' }, ( v, k ) => v === k );
  test.identical( got, false );

  var got = _.entityNone( { 1 : 2, 2 : 3, a : null }, ( v, k ) => typeof v === typeof k );
  test.identical( got, true );

  var got = _.entityNone( { 'a' : [], 'b' : 'str' }, ( v, k ) => typeof v === typeof k );
  test.identical( got, false );

  var got = _.entityNone( { a : 1, b : false }, ( v, k ) => v === k );
  test.identical( got, true );

  var got = _.entityNone( { a : 1, b : false }, ( v, k, src ) => src.length === v );
  test.identical( got, true );

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityNone( undefined, ( src, u ) => src !== u );
  test.identical( got, true );

  var got = _.entityNone( null, ( src, u ) => src === u );
  test.identical( got, true );

  var got = _.entityNone( 1, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityNone( 'str', ( src, u ) => src === u );
  test.identical( got, true );

  var got = _.entityNone( false, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityNone( true, ( src, u ) => src !== u );
  test.identical( got, false );

  var got = _.entityNone( true, ( src, u, u2 ) => src !== u2 );
  test.identical( got, false );

  test.close( 'onEach is routine' );

  /* - */

  test.open( 'onEach is undefined' );

  test.case = 'array';

  var got = _.entityNone( [ 1, 'str', undefined ] );
  test.identical( got, false );

  var got = _.entityNone( [ 'str', 1, { a : 2 }, 4 ] );
  test.identical( got, false );

  var got = _.entityNone( [ false, null, undefined ] );
  test.identical( got, true );


  test.case = 'unroll';

  var src = _.unrollFrom( [ false, 2, _.unrollFrom( [ 'str' ] ), null, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.unrollMake( [ undefined, false, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.unrollMake( [ null, undefined, false ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  test.case = 'argument array';

  var src = _.argumentsArrayMake( [ null, false, [ 'str' ], undefined, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = _.argumentsArrayMake( [ null, false, undefined ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  test.case = 'Array';

  var src = new Array( false, 'ab', [ 'str' ], null, 4 );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new Array( null, 22, [ 'str' ], 3, 4 );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new Array( null, false, undefined );
  var got = _.entityNone( src );
  test.identical( got, true );

  test.case = 'F32x';

  var src = new F32x( [ 5, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new F32x( [ undefined, [ 8 ], 3, 4 ] );
  var got = _.entityNone( src );
  test.identical( got, false );

  var src = new F32x( [ 'str', undefined, { a : 2 } ] );
  var got = _.entityNone( src );
  test.identical( got, true );

  test.case = 'ObjectLike';

  var got = _.entityNone( { 1 : 2, c : 4, a : undefined } );
  test.identical( got, false );

  var got = _.entityNone( { 1 : 2, 2 : 3, a : null } );
  test.identical( got, false );

  var got = _.entityNone( { a : false, b : null, c : undefined } );
  test.identical( got, true );

  var got = _.entityNone( { a : 'a', b : 'str' } );
  test.identical( got, false );

  var got = _.entityNone( { a : 1, b : false } );
  test.identical( got, false );

  test.case = 'no ArrayLike, no ObjectLike'

  var got = _.entityNone( undefined );
  test.identical( got, true );

  var got = _.entityNone( null );
  test.identical( got, true );

  var got = _.entityNone( 1 );
  test.identical( got, false );

  var got = _.entityNone( 'str' );
  test.identical( got, false );

  var got = _.entityNone( false );
  test.identical( got, true );

  var got = _.entityNone( true );
  test.identical( got, false );

  test.close( 'onEach is undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entityNone() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.entityNone( [ 'a' ], ( a ) => a, ( b ) => b ) );

  test.case = 'onEach has more then three arguments';
  test.shouldThrowErrorSync( () => _.entityNone( [ 1 ], ( a, b, c, d ) => a + b + c + d ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.entityNone( { a : 2 }, [] ) );
}

//

function entityMap( test )
{
  test.open( 'src is arrayLike' );

  test.case = 'simple test with mapping array by sqr';
  var got = _.entityMap( [ 3, 4, 5 ], ( v, i, ent ) => v * v );
  test.identical( got,[ 9, 16, 25 ] );

  test.case = 'array';
  var src1 = [ 1, 2, null, 'str' ];
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 2, 'str3' ] );

  test.case = 'unroll';
  var src1 = _.unrollFrom( [ 1, 2, _.unrollFrom( [ 'str' ] ), 3, 4 ] );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 'str2', 6, 8 ] );
  test.is( _.arrayIs( got ) );
  test.isNot( _.unrollIs( got ) );

  test.case = 'argument array';
  var src1 = _.argumentsArrayMake( [ 1, 2, [ 'str' ], 3, 4 ] );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 'str2', 6, 8 ] );
  test.is( _.arrayIs( got ) );

  test.case = 'Array';
  var src1 = new Array( 1, 2, [ 'str' ], 3, 4 );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.identical( got, [ 1, 3, 'str2', 6, 8 ] );
  test.is( _.arrayIs( got ) );

  test.case = 'F32x';
  var src1 = new F32x( [ 1, 2, [ 8 ], 3, 4 ] );
  var got = _.entityMap( src1, ( v, i, s ) => v + i );
  test.equivalent( got, [ 1, 3, 10, 6, 8 ] );
  test.is( _.longIs( got ) );

  test.close( 'src is arrayLike' );

  /* - */

  test.open( 'src is objectLike' );

  test.case = 'simple test with mapping object by sqr';
  var got = _.entityMap( { '3' : 3, '4' : 4, '5' : 5 }, ( v, i, ent ) => v * v );
  test.identical( got,{ '3' : 9, '4' : 16, '5' : 25 } );
  test.is( _.mapIs( got ) );

  var src1 = { a : 1, b : 2, c : null, d : 'str' };
  var got = _.entityMap( src1, ( v, k, s ) => v + k );
  test.identical( got, { a : '1a', b : '2b', c : 'nullc', d : 'strd' } );
  test.is( _.mapIs( got ) );

  test.case = 'object';
  function constr()
  {
    this.a = 1;
    this.b = 3;
    this.c = 4;
  }
  var got = _.entityMap( new constr(), ( e, i, ent ) => e.b );
  test.identical( got, 3 );

  // test.case = 'routine constructor';
  // function constr()
  // {
  //   this.a = 1;
  //   this.b = 3;
  //   this.c = 4;
  // }
  // var got = _.entityMap( new constr(), ( v, i, ent ) => v * v + i );
  // test.identical( got, { a : '1a', b : '9b', c : '16c' } );
  // test.is( !( got instanceof constr ) );
  // test.is( _.mapIs( got ) );

  test.case = 'simple test with mapping object by sqr : check callback arguments';
  var callback = function( v, i, ent )
  {
    if( externEnt )
    externEnt = ent;
    return v * v + i;
  };
  var externEnt = {};
  var got = _.entityMap( Object.assign( {}, { 'a' : 1, 'b' : 3, 'c' : 4 } ), callback );
  test.identical( externEnt, { 'a' : 1, 'b' : 3, 'c' : 4 } );

  test.case = 'mapping object by sqr : source object should be unmodified';
  test.identical( Object.is( got, Object.assign( {}, { 'a' : 1, 'b' : 3, 'c' : 4 } ) ), false );

  test.close( 'src is objectLike' );

  /* - */

  test.case = 'no ArrayLike, no ObjectLike';
  var got = _.entityMap( 2, ( v, u, u2 ) => v + v );
  test.identical( got, 4 );

  var got = _.entityMap( 'a', ( v, u, u2 ) => v + v );
  test.identical( got, 'aa' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( () => _.entityMap() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityMap( [ 1,3 ], callback1, callback2 ) );

  test.case = 'passed argument has undefines';
  test.shouldThrowErrorSync( () => _.entityMap( [ 1, undefined ], ( v, i ) => v ) );
  test.shouldThrowErrorSync( () => _.entityMap( { a : 2, b : undefined }, ( v, i ) => v ) );
  test.shouldThrowErrorSync( () => _.entityMap( undefined, ( v, i ) => v ) );

  test.case = 'second argument is not routine';
  test.shouldThrowErrorSync( () => _.entityMap( [ 1, 2 ], {} ) );
}

//
  //TODO : need to check actuality of this test
  // it works correctly

function entityFilter( test )
{
  test.open( 'onEach is routine' );

  var callback = function( v, i, ent )
  {
    if( v < 0 ) return;
    return Math.sqrt( v );
  };

  test.case = 'number';
  var got = _.entityFilter( 3, callback );
  test.identical( got, Math.sqrt( 3 ) );

  test.case = 'string';
  var got = _.entityFilter( 'str', ( v ) => v + ' ' + v );
  test.identical( got, 'str str' );

  test.case = 'simple test with mapping array by sqrt';
  var got = _.entityFilter( [ 9, -16, 25, 36, -49 ], callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  var src = _.unrollMake( [ 9, _.unrollMake( [ -16, 25, _.unrollFrom( [ 36, -49 ] ) ] ) ] );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );
  test.isNot( _.unrollIs( got) );

  var src = _.argumentsArrayMake( [ 9, -16, 25, 36, -49 ] );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );

  var src = new Array( 9, -16, 25, 36, -49 );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );

  var src = new F32x( [ 9, -16, 25, 36, -49 ] );
  var src = Array.from( src );
  var got = _.entityFilter( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  test.case = 'simple test with mapping object by sqrt';
  var got = _.entityFilter( { '3' : 9, '4' : 16, '5' : 25, '6' : -36 }, callback );
  test.identical( got, { '3' : 3, '4' : 4, '5' : 5 } );
  test.notIdentical( got, { '3' : 3, '4' : 4, '5' : 5, '6' : 6 } );

  test.case = 'callback in routine';
  var testFn1 = function()
  {
    return _.entityFilter( arguments, callback );
  }
  var got = testFn1( 9, -16, 25, 36, -49 );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src is array, filter make unrolls';
  var onEach = ( e, i, s ) => _.unrollMake( [ e ] );
  var src = [ 1, [ 2, 3 ], [ 'str', null, undefined ] ];
  var got = _.entityFilter( src, onEach );
  test.identical( got, [ 1, [ 2, 3 ], [ 'str', null, undefined ] ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  test.case = 'src is array, filter check equality';
  var onEach = ( e, i, s ) => e === i;
  var src = [ 0, 2, 2, [ 'str', null ], undefined ];
  var got = _.entityFilter( src, onEach );
  test.identical( got, [ true, false, true, false, false ] );
  test.notIdentical( got, [ true, false, true, false, false, false ] );
  test.is( _.arrayIs( got ) );

  test.close( 'onEach is routine' );

  /* - */

  test.case = 'onEach is objectLike - condition, one entry';
  var callback = { '3' : 9 };
  var got = _.entityFilter( { a : { '3' : 9 }, b : { '3' : 4 } }, callback );
  test.identical( got, { a : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, a few entry';
  var callback = { '3' : 9 };
  var src = { a : { '3' : 9 }, b : { '3' : 4 }, c : { '3' : 9 }, d : { '3' : 9 } };
  var got = _.entityFilter( src, callback );
  test.identical( got, { a : { '3' : 9 }, c : { '3' : 9 }, d : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, entry nested to next level';
  var callback = { '3' : 9 };
  var src = { a : { b : { '3' : 9 } } };
  var got = _.entityFilter( src, callback );
  test.identical( got, {} );
  test.notIdentical( got, { a : { b : { '3' : 9 } } } );

  test.case = 'onEach is objectLike - routine, entry nested to next level';
  var onEach = function( e )
  {
    return true;
  }
  var callback = { '3' : onEach };
  var src = { a : { '3' : 9 } };
  var got = _.entityFilter( src, callback );
  test.identical( got, {} );
  test.notIdentical( got, { a : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, identical entry';
  var onEach = function( e )
  {
    return true;
  }
  var callback = { '3' : onEach };
  var src = { a : { '3' : onEach } };
  var got = _.entityFilter( src, callback );
  test.identical( got, { a : { '3' : onEach } } );
  test.notIdentical( got, {} );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( () => _.entityFilter() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityFilter( [ 1,3 ], () => true, 1 ) );

  test.case = 'onEach is not routine';
  test.shouldThrowErrorSync( () => _.entityFilter( [ 1,3 ], 'callback' ) );

  test.case = 'src is undefined';
  test.shouldThrowErrorSync( () => _.entityFilter( undefined, callback1 ) );
};

//

function entityFilterDeep( test )
{
  test.open( 'onEach is routine' );

  var callback = function( v, i, ent )
  {
    if( v < 0 ) return;
    return Math.sqrt( v );
  };

  test.case = 'simple test with mapping array by sqrt';
  var got = _.entityFilterDeep( [ 9, -16, 25, 36, -49 ], callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  var src = _.unrollMake( [ 9, _.unrollMake( [ -16, 25, _.unrollFrom( [ 36, -49 ] ) ] ) ] );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );
  test.isNot( _.unrollIs( got) );

  var src = _.argumentsArrayMake( [ 9, -16, 25, 36, -49 ] );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );

  var src = new Array( 9, -16, 25, 36, -49 );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );

  var src = new F32x( [ 9, -16, 25, 36, -49 ] );
  var src = Array.from( src );
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, [ 3, 5, 6 ] );
  test.notIdentical( got, [ 3, 4, 5, 6, 7 ] );

  test.case = 'simple test with mapping object by sqrt';
  var got = _.entityFilterDeep( { '3' : 9, '4' : 16, '5' : 25, '6' : -36 }, callback );
  test.identical( got, { '3' : 3, '4' : 4, '5' : 5 } );
  test.notIdentical( got, { '3' : 3, '4' : 4, '5' : 5, '6' : 6 } );

  test.case = 'callback in routine';
  var testFn1 = function()
  {
    return _.entityFilterDeep( arguments, callback );
  }
  var got = testFn1( 9, -16, 25, 36, -49 );
  test.identical( got, [ 3, 5, 6 ] );

  test.case = 'src is array, filter make unrolls';
  var onEach = ( e, i, s ) => _.unrollMake( [ e ] );
  var src = [ 1, [ 2, 3 ], [ 'str', null, undefined ] ];
  var got = _.entityFilterDeep( src, onEach );
  test.identical( got, [ 1, [ 2, 3 ], [ 'str', null, undefined ] ] );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  test.case = 'src is array, filter check equality';
  var onEach = ( e, i, s ) => e === i;
  var src = [ 0, 2, 2, [ 'str', null ], undefined ];
  var got = _.entityFilterDeep( src, onEach );
  test.identical( got, [ true, false, true, false, false ] );
  test.notIdentical( got, [ true, false, true, false, false, false ] );
  test.is( _.arrayIs( got ) );

  test.close( 'onEach is routine' );

  /* - */

  test.case = 'onEach is objectLike - condition, one entry';
  var callback = { '3' : 9 };
  var got = _.entityFilterDeep( { a : { '3' : 9 }, b : { '3' : 4 } }, callback );
  test.identical( got, { a : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, a few entry';
  var callback = { '3' : 9 };
  var src = { a : { '3' : 9 }, b : { '4' : 4 }, c : { '3' : 9 }, d : { '3' : 9 } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { '3' : 9 }, c : { '3' : 9 }, d : { '3' : 9 } } );

  test.case = 'onEach is objectLike - condition, entry nested to next levels';
  var callback = { '3' : 9 };
  var src = { a : { a : { b : { c : { '3' : 9, '4' : 6 } } } } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, {} );
  test.notIdentical( got, { a : { a : { b : { c : { '3' : 9, '4' : 6 } } } } } );

  test.case = 'onEach is objectLike - routine, entry nested to next level';
  var onEach = function( e )
  {
    return true;
  }
  var callback = { '3' : onEach };
  var src = { a : { b : { '3' : 9 } } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { b : { '3' : 9 } } } );
  test.notIdentical( got, {} );

  test.case = 'onEach is objectLike - routine, entry nested to next level';
  var onEach = function( e )
  {
    for( let k in e )
    {
      e[ k ] = e[ k ] + 5;
      if( e[ k ] !== 10 )
      return false;
    }
    return true;
  }
  var callback = { '3' : onEach };
  var src = { a : { b : 5, c : 5, d : 5 } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { b : 5, c : 5, d : 5 } } );
  test.notIdentical( got, {} );

  test.case = 'onEach is objectLike - condition, identical entry';
  var onEach = function( e )
  {
    return true;
  }
  var callback = { '3' : onEach };
  var src = { a : { '3' : onEach } };
  var got = _.entityFilterDeep( src, callback );
  test.identical( got, { a : { '3' : onEach } } );
  test.notIdentical( got, {} );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( () => _.entityFilterDeep() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.entityFilterDeep( [ 1,3 ], () => true, 1 ) );

  test.case = 'onEach is not routine';
  test.shouldThrowErrorSync( () => _.entityFilterDeep( [ 1,3 ], 'callback' ) );

  test.case = 'src is not arrayLike or mapLike';
  test.shouldThrowErrorSync( () => _.entityFilterDeep( undefined, callback1 ) );
}

//

function index( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.index( src );
  var exp = {};
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.index( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : 'a', b : 'b', c : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : 'src' };
  var src = 'src';
  var got = _.index( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.index( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp = { '[object Object]' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '[object Object]' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '[object Object]' : 'src' };
  var src = 'src';
  var got = _.index( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.index( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp = { '[object Object]' : 'c' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.index( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '[object Object]' : 'c' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.index( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '[object Object]' : 'src' };
  var src = 'src';
  var got = _.index( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.index( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.index( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.index( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function index */

//

function indexExtending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : undefined };
  var src = 'src';
  var got = _.indexExtending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : 'a', b : 'b', c : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : 'src' };
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c',
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2',
    'xk' : 'ck'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 2,
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined }
  var src = 'src';
  var got = _.indexExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.indexExtending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexExtending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.indexExtending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function indexExtending */

//

function indexSupplementing( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : undefined };
  var src = 'src';
  var got = _.indexSupplementing( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : 'a', b : 'b', c : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : 'src' };
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'a',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'a',
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2',
    'xk' : 'ak'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 0,
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined }
  var src = 'src';
  var got = _.indexSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.indexSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.indexSupplementing( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function indexSupplementing */

//

function indexAppending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : undefined };
  var src = 'src';
  var got = _.indexAppending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : 'a', b : 'b', c : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'src' : 'src' };
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : [ 'a', 'b', 'c' ],
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : [ 'a', 'b', 'c' ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2',
    'xk' : [ 'ak', 'bk', 'ck' ],
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : [ 0, 1, 2 ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined }
  var src = 'src';
  var got = _.indexAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.indexAppending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexAppending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.indexAppending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function indexAppending */

//

function indexPrepending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src );
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src );
  var exp = { a : undefined, b : undefined, c : undefined };
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexPrepending( src );
  var exp = { 'src' : undefined };
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { 'a' : 'a', 'b' : 'b', 'c' : 'c' };
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { a : 'a', b : 'b', c : 'c' };
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => e );
  var exp = { 'src' : 'src' };
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : [ 'c', 'b', 'a' ],
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c',
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : [ 'c', 'b', 'a' ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined2' : 'src', 'x' : 'src' };
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2',
    'xk' : [ 'ck', 'bk', 'ak' ],
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.indexPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : [ 2, 1, 0 ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.indexPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined }
  var src = 'src';
  var got = _.indexPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.indexPrepending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { 'a.f1' : { f1 : 'a.f1', f2 : 'a.f2' }, 'b.f1' : { f1 : 'b.f1', f2 : 'b.f2' }, 'c.f1' : { f1 : 'c.f1', f2 : 'c.f2' } };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.indexPrepending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { '3' : 'src' };
  var src = 'src';
  var got = _.indexPrepending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function indexPrepending */

//

function remap( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remap( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remap( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : { 'ak' : 'a', 'ak2' : 'a', 'x' : 'a' },
    'bk' : { 'bk' : 'b', 'bk2' : 'b', 'x' : 'b' },
    'ck' : { 'ck' : 'c', 'ck2' : 'c', 'x' : 'c' }
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : { '0' : 'a', '02' : 'a', 'x' : 'a' },
    '1' : { '1' : 'b', '12' : 'b', 'x' : 'b' },
    '2' : { '2' : 'c', '22' : 'c', 'x' : 'c' }
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : { 'xk' : 'ak' },
    'bk' : { 'xk' : 'bk' },
    'ck' : { 'xk' : 'ck' }
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remap( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : { 'xk' : 0 },
    '1' : { 'xk' : 1 },
    '2' : { 'xk' : 2 }
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remap( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remap( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remap( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remap( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remap( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remap */

//

function remapExtending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'c',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'c'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : 'ck',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 2
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapExtending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapExtending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapExtending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapExtending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapExtending */

//

function remapSupplementing( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : 'a',
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : 'a'
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : 'ak',
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : 0
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapSupplementing( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapSupplementing( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapSupplementing( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapSupplementing */

//

function remapAppending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : [ 'a', 'b', 'c' ],
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : [ 'a', 'b', 'c' ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : [ 'ak', 'bk', 'ck' ],
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : [ 0, 1, 2 ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapAppending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapAppending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapAppending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapAppending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapAppending */

//

function remapPrepending( test )
{

  /* */

  test.open( 'no onEach' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { a : undefined, b : undefined, c : undefined };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'no onEach' );

  /* */

  test.open( 'onEach - routine returning undefined' );

  test.case = 'src - map';
  var exp = {};
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = {};
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => undefined );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning undefined' );

  /* */

  test.open( 'onEach - routine returning element' );

  test.case = 'src - map';
  var exp = { ak : 'a', bk : 'b', ck : 'c' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a', '1' : 'b', '2' : 'c' };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => e );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning element' );

  /* */

  test.open( 'onEach - routine returning key' );

  test.case = 'src - map';
  var exp = { 'ak' : 'ak', 'bk' : 'bk', 'ck' : 'ck' };
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 0, '1' : 1, '2' : 2 };
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( _.entityLength( got ), _.entityLength( src ) );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {}
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => k );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning key' );

  /* */

  test.open( 'onEach - routine returning map' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a',
    'x' : [ 'c', 'b', 'a' ],
    'bk' : 'b',
    'bk2' : 'b',
    'ck' : 'c',
    'ck2' : 'c'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b',
    '22' : 'c',
    '02' : 'a',
    'x' : [ 'c', 'b', 'a' ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src', 'x' : 'src' }
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => { return { [ k ] : e, [ k+'2' ] : e, [ 'x' ] : e } } );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning map' );

  /* */

  test.open( 'onEach - routine returning unroll' );

  test.case = 'src - map';
  var exp = { 'ak' : 'x', 'bk' : 'x', 'ck' : 'x' }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'x', '1' : 'x', '2' : 'x' }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ k, k+'2', 'x' ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll' );

  /* */

  test.open( 'onEach - routine returning unroll of maps' );

  test.case = 'src - map';
  var exp =
  {
    'ak' : 'a',
    'ak2' : 'a2',
    'xk' : [ 'ck', 'bk', 'ak' ],
    'bk' : 'b',
    'bk2' : 'b2',
    'ck' : 'c',
    'ck2' : 'c2'
  }
  var src = { ak : 'a', bk : 'b', ck : 'c' };
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp =
  {
    '0' : 'a',
    '1' : 'b',
    '2' : 'c',
    '12' : 'b2',
    '22' : 'c2',
    '02' : 'a2',
    'xk' : [ 2, 1, 0 ],
  }
  var src = [ 'a', 'b', 'c' ];
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = { 'undefined' : 'src', 'undefined2' : 'src2', 'xk' : undefined };
  var src = 'src';
  var got = _.remapPrepending( src, ( e, k ) => _.unrollMake([ { [ k ] : e }, { [ k+'2' ] : e + '2' }, { 'xk' : k } ]) );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - routine returning unroll of maps' );

  /* */

  test.open( 'onEach - selector' );

  test.case = 'src - map';
  var exp = { 'a' : 'a.f1', 'b' : 'b.f1', 'c' : 'c.f1' };
  var src = { a : { f1 : 'a.f1', f2 : 'a.f2' }, b : { f1 : 'b.f1', f2 : 'b.f2' }, c : { f1 : 'c.f1', f2 : 'c.f2' } };
  var got = _.remapPrepending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - array';
  var exp = { '0' : 'a.f1', '1' : 'b.f1', '2' : 'c.f1' };
  var src = [ { f1 : 'a.f1', f2 : 'a.f2' }, { f1 : 'b.f1', f2 : 'b.f2' }, { f1 : 'c.f1', f2 : 'c.f2' } ];
  var got = _.remapPrepending( src, '*/f1' );
  test.is( src !== got );
  test.identical( got, exp );

  test.case = 'src - str';
  var exp = {};
  var src = 'src';
  var got = _.remapPrepending( src, '*/length' );
  test.is( src !== got );
  test.identical( got, exp );

  test.close( 'onEach - selector' );

  /* */

} /* end of function remapPrepending */

// --
//
// --

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
  test.shouldThrowErrorSync( function()
  {
    _._entityMost();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _._entityMost( [ 1,3 ], sqr, true, false );
  });

  test.case = 'second argument is not routine';
  test.shouldThrowErrorSync( function()
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
  test.shouldThrowErrorSync( function()
  {
    _.entityMin();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.entityMin( [ 1,3 ], sqr, true );
  });

  test.case = 'second argument is not routine';
  test.shouldThrowErrorSync( function()
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
  test.shouldThrowErrorSync( function()
  {
    _.entityMax();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.entityMax( [ 1,3 ], sqr, true );
  });

  test.case = 'second argument is not routine';
  test.shouldThrowErrorSync( function()
  {
    _.entityMax( [ 1,3 ], 'callback' );
  });

};

// --
//
// --

function eachSample( test )
{
  test.case = 'empty sets';
  var got = _.eachSample( [] );
  var expected = [ [] ];
  test.identical( got, expected );

  var got = _.eachSample( { sets : {} } );
  var expected = [ {} ];
  test.identical( got, expected );

  var got = _.eachSample( {}, null );
  var expected = [ {} ];
  test.identical( got, expected );

  test.case = 'empty sets and unroll, Array';
  var got = _.eachSample( _.unrollMake( [] ) );
  var expected = [ [] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.isNot( _.unrollIs( got ) );

  var got = _.eachSample( new Array() );
  var expected = [ [] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var src = _.arrayFrom( new F32x() )
  var got = _.eachSample( src );
  var expected = [ [] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample( _.argumentsArrayMake( 0 ), null );
  var expected = [ [] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  /* - */

  test.case = 'sets with primitive';
  var got = _.eachSample( [ 1 ] );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );

  var got = _.eachSample( { a : 1 }, null );
  var expected = [ { a : 1 } ];
  test.identical( got, expected );

  var got = _.eachSample( [ 1, 2, null ] );
  var expected = [ [ 1, 2, null ] ];
  test.identical( got, expected );

  var got = _.eachSample( { a : 1, b : 2, c : null }, null );
  var expected = [ { a : 1, b : 2, c : null } ];
  test.identical( got, expected );

  test.case = 'sets with primitive and unroll, Array';
  var got = _.eachSample( _.unrollMake( [ 1 ] ) );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );
  test.isNot( _.unrollIs( got ) );

  var got = _.eachSample( new Array( [ 1 ] ) );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var src = _.arrayFrom( new F32x( [ 1 ] ) );
  var got = _.eachSample( src );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample( _.argumentsArrayMake( [ 1 ] ), null );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  /* - */

  test.case = 'sets with empty array, empty map';
  var got = _.eachSample( [ [] ] );
  var expected = [ [ undefined ] ];
  test.identical( got, expected );

  var got = _.eachSample( { a : [] }, null );
  var expected = [ { a : undefined } ];
  test.identical( got, expected );

  var got = _.eachSample( [ [], [] ] );
  var expected = [ [ undefined, undefined ] ];
  test.identical( got, expected );

  var got = _.eachSample( { a : [], b : [] }, null );
  var expected = [ { a : undefined, b : undefined } ];
  test.identical( got, expected );

  var got = _.eachSample( [ [], [], [] ] );
  var expected = [ [ undefined, undefined, undefined ] ];
  test.identical( got, expected );

  var got = _.eachSample( { a : [], b : [], c : [] }, null );
  var expected = [ { a : undefined, b : undefined, c : undefined } ];
  test.identical( got, expected );

  test.case = 'sets with empty unrolls, Arrays';
  var got = _.eachSample( _.unrollMake( [ [], [] ] ) );
  var expected = [ [ undefined, undefined ] ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample( new Array( [ [], [], [] ] ) );
  var expected = [ [ [] ], [ [] ], [ [] ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var src = _.arrayFrom( new F32x( [ [], [], [] ] ) );
  var got = _.eachSample( src );
  var expected = [ [ 0, 0, 0 ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample( _.argumentsArrayMake( [ [], [] ] ) );
  var expected = [ [ undefined, undefined ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  /* - */

  test.case = 'sets with primitive, result : null';

  var got = _.eachSample( { sets : [ 1, 2, 3 ], result : 0 } );
  var expected = 0;
  test.identical( got, expected );

  var got = _.eachSample( { sets : { a : 1, b : 2, c : null }, result : 0 } );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'sets with unroll, Array, result : null';
  var got = _.eachSample( { sets : _.unrollMake( [ 1, 2, 3 ] ), result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  var got = _.eachSample( { sets : new Array( [ 1, 2, 3 ] ), result : 0 } );
  var expected = 2;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  var src = _.arrayFrom( new F32x( [ 1, 2, 3 ] ) );
  var got = _.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  var got = _.eachSample( { sets : _.argumentsArrayMake( [ 1, 2, 3 ] ), result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  /* - */

  test.case = 'sets with single not empty array, single not empty map';
  var got = _.eachSample( [ [ 1, 2, null, 'str' ] ] );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );

  var got = _.eachSample( { a : [ 1, 2, null, 'str' ] }, null );
  var expected =
  [
    { a : 1 },
    { a : 2 },
    { a : null },
    { a : 'str' }
  ];
  test.identical( got, expected );

  test.case = 'sets with single not empty unroll, Array';
  var got = _.eachSample( _.unrollMake( [ [ 1, 2, null, 'str' ] ] ) );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample( _.argumentsArrayMake( [ [ 1, 2, null, 'str' ] ] ) );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample( new Array( [ [ 1, 2, null, 'str' ] ] ) );
  var expected = [ [ [ 1, 2, null, 'str' ] ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var src = _.arrayFrom( new F32x( [ [ 1, 2, 3 ] ] ) );
  var got = _.eachSample( src );
  test.notIdentical( got, [ [ [ 1, 2, 3 ] ] ] );
  test.is( _.arrayIs( got ) );

  /* - */

  test.case = 'simplest, leftToRight : 1';

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ] }
  });
  var expected =
  [
    { a : 0, b : 2 }, { a : 1, b : 2 },
    { a : 0, b : 3 }, { a : 1, b : 3 }
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ], 6 ]
  });
  var expected =
  [
    [ 0, 2, 6 ], [ 1, 2, 6 ],
    [ 0, 3, 6 ], [ 1, 3, 6 ],
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 }
  });
  var expected =
  [
    { a : 0, b : 2, c : 6 },
    { a : 1, b : 2, c : 6 },
    { a : 0, b : 3, c : 6 },
    { a : 1, b : 3, c : 6 }
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ]
  });
  var expected =
  [
    [ 0, 2, 6 ], [ 1, 2, 6 ],
    [ 0, 3, 6 ], [ 1, 3, 6 ],
    [ 0, 2, null ], [ 1, 2, null ],
    [ 0, 3, null ], [ 1, 3, null ],
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ], c: [ 6, null ] }
  });
  var expected =
  [
    { a : 0, b : 2, c : 6 }, { a : 1, b : 2, c : 6 },
    { a : 0, b : 3, c : 6 }, { a : 1, b : 3, c : 6 },
    { a : 0, b : 2, c : null }, { a : 1, b : 2, c : null },
    { a : 0, b : 3, c : null }, { a : 1, b : 3, c : null },
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : [ _.argumentsArrayMake( [ 0, 1 ] ), _.argumentsArrayMake( [ 2, 3 ] ) ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample
  ({
    sets : [ new Array( [ 0, 1 ] ), new Array( [ 2, 3 ] ) ]
  });
  var expected = [ [ [ 0, 1 ], [ 2, 3 ] ] ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  var a = _.arrayFrom( new F32x( [ 0, 1 ] ) );
  var b = _.arrayFrom( new F32x( [ 2, 3 ] ) );
  var got = _.eachSample
  ({
    sets : [ a, b ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.is( _.arrayIs( got ) );

  /* - */

  test.case = 'simplest leftToRight : 0';

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 5, 6 ] ],
    leftToRight : 0,
  });
  var expected =
  [
    [ 0, 5 ],[ 0, 6 ],
    [ 1, 5 ],[ 1, 6 ]
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 5, 6 ] },
    leftToRight : 0,
  });
  var expected =
  [
    { a : 0, b : 5 }, { a : 0, b : 6 },
    { a : 1, b : 5 }, { a : 1, b : 6 }
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 'str', null ], [ true, 2 ] ],
    leftToRight : 0,
  });
  var expected =
  [
    [ 0, 'str', true ], [ 0, 'str', 2 ],
    [ 0, null, true ], [ 0, null, 2 ],
    [ 1, 'str', true ], [ 1, 'str', 2 ],
    [ 1, null, true ], [ 1, null, 2 ]
  ];
  test.identical( got, expected );

  /* - */

  test.case = 'simplest, leftToRight : 1, result : 0';

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ],
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ] },
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ], 6 ],
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 },
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ],
    result : 0,
  });
  var expected = 7;
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ], c: [ 6, null ] },
    result : 0,
  });
  var expected = 7;
  test.identical( got, expected );

  test.case = 'simplest, leftToRight : 1, unroll, Array';
  var got = _.eachSample
  ({
    sets : [ _.unrollMake( [ 0, 1 ] ), _.unrollMake( [ 2, 3 ] ) ],
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  var got = _.eachSample
  ({
    sets : [ _.argumentsArrayMake( [ 0, 1 ] ), _.argumentsArrayMake( [ 2, 3 ] ) ],
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  var got = _.eachSample
  ({
    sets : [ new Array( [ 0, 1 ] ), new Array( [ 2, 3 ] ) ],
    result : 0,
  });
  var expected = 0;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  var a = _.arrayFrom( new F32x( [ 0, 1 ] ) );
  var b = _.arrayFrom( new F32x( [ 2, 3 ] ) );
  var got = _.eachSample
  ({
    sets : [ a, b ],
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.is( _.primitiveIs( got ) );

  test.case = 'not default sample, equal length of vectors';
  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ],
    sample : [ 1, 2 ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );

  test.case = 'not default sample, sample.length > vector.length';
  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ],
    sample : [ 1, 2, 3 ]
  });
  var expected =
  [
    [ 0, 2, 3 ], [ 1, 2, 3 ],
    [ 0, 3, 3 ], [ 1, 3, 3 ],
  ];
  test.identical( got, expected );

  var got = _.eachSample
  ({
    sets : { a : [ 0, 1 ], b : [ 2, 3 ] },
    sample : { ak : 'a', bk : 'b', ck : 'c' }
  });
  var expected =
  [
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 0,
      'b' : 2
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 1,
      'b' : 2
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 0,
      'b' : 3
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 1,
      'b' : 3
    }
  ]
  test.identical( got, expected );

  test.case = 'onEach is used';
  var onEach = function( sample, i )
  {
    return sample[ i ] = sample[ i ] + 12;
  }
  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ],
    onEach : onEach,
    sample : [ 1, 2, 3 ]
  });
  var expected =
  [
    [ 0, 2, 3 ], [ 1, 2, 3 ],
    [ 0, 3, 3 ], [ 1, 3, 15 ],
  ];
  test.identical( got, expected );

  test.case = 'onEach is used';
  var result = [];
  var onEach = function( sample, i )
  {
    _.arrayAppend( result, sample[ i ] );
  }
  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ],
    onEach : onEach,
    sample : [ 1, 2, 3, 4 ]
  });
  var expected =
  [
    [ 0, 2, 3, 4 ], [ 1, 2, 3, 4 ],
    [ 0, 3, 3, 4 ], [ 1, 3, 3, 4 ],
  ];
  test.identical( got, expected );
  test.identical( result, [ 0, 2, 3, 4 ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'not argument, extra arguments';
  test.shouldThrowErrorSync( () => _.eachSample() );
  test.shouldThrowErrorSync( () => _.eachSample( [ [ 1 ], [ 2 ] ], null, [ 1 ] ) );

  test.case = 'o.sets is not arraylike, not mapLike';
  test.shouldThrowErrorSync( () => _.eachSample( {} ) );
  test.shouldThrowErrorSync( () => _.eachSample( 1 ) );
  test.shouldThrowErrorSync( () => _.eachSample( 'str', null ) );

  test.case = 'onEach is not a routine or null';
  test.shouldThrowErrorSync( () => _.eachSample( [ [ 1 ], [ 2 ] ], 'str' ) );

  test.case = 'o.base has a value';
  var o = {};
  o.sets = [ [ 1, 0 ], [ 2, 3 ] ];
  o.base = [ 5 ];
  test.shouldThrowErrorSync( () => _.eachSample( o ) );

  test.case = 'o.add has a value';
  var o = {};
  o.sets = [ [ 1, 0 ], [ 2, 3 ] ];
  o.add = [ 5 ];
  test.shouldThrowErrorSync( () => _.eachSample( o ) );
}

//

function eachSampleExperiment( test )
{
  debugger;

  var got = _.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

  var got = _.eachSample
  ({
    sets : [ _.unrollMake( [ 0, 1 ] ), _.unrollMake( [ 2, 3 ] ) ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.isNot( _.unrollIs( got ) );
  test.is( _.arrayIs( got ) );

}
eachSampleExperiment.experimental = 1;

// --
//
// --

var Self =
{

  name : 'Tools.base.Functional',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // scalar

    scalarAppend,
    scalarAppendOnce,

    scalarToVector,

    //

    entityEach,
    // entityEachKey,
    entityEachOwn,

    entityOnlyOnlyDst,
    entityOnlyOnlySrc,
    entityOnlyBothSame, /* qqq : implement | Dmytro : implemented */
    entityOnlyBoth, /* qqq : implement | Dmytro : implemented, cases with different types of src and dst added */
    entityOnlyDiffTypes, /* qqq : implement | Dmytro : cases with different types of src and dst added */
    entityOnlyOnlySets,
    entityOnlyOnlySetsExperiment,
    entityOnlyOnlyHashMaps,

    entityButOnlyDst, /* qqq : implement | Dmytro : implemented */
    entityButOnlySrc, /* qqq : implement | Dmytro : implemented */
    entityButBothSame, /* qqq : implement | Dmytro : implemented */
    entityButBoth, /* qqq : implement | Dmytro : implemented */
    entityButDiffTypes,
    entityButOnlySets,
    entityButOnlyHashMaps,

/*
                        only / but            and                      or                         xor                          xand
value for evaluator       src              dst, src                 dst, src                    dst, src                    dst, src
value for dst             dst                dst                    first +                     first +                   dst if positive
*/

    entityAndOnlyDst, /* qqq : implement | Dmytro : implemented */
    entityAndOnlySrc, /* qqq : implement | Dmytro : implemented */
    entityAndBothSame, /* qqq : implement | Dmytro : implemented */
    entityAndBoth, /* qqq : implement | Dmytro : implemented */
    entityAndDiffTypes,
    entityAndOnlySets,
    entityAndOnlySetsExperiment,
    entityAndOnlyHashMaps,

    entityOrOnlyDst, /* qqq : implement */
    entityOrOnlySrc, /* qqq : implement */
    entityOrBothSame, /* qqq : implement */
    entityOrBoth, /* qqq : implement */
    entityOrDiffTypes,
    entityOrOnlySets,

    // entityXorOnlyDst, /* qqq : implement */
    // entityXorOnlySrc, /* qqq : implement */
    // entityXorBothSame, /* qqq : implement */
    // entityXorBoth, /* qqq : implement */

    // entityXandOnlyDst, /* qqq : implement */
    // entityXandOnlySrc, /* qqq : implement */
    // entityXandBothSame, /* qqq : implement */
    // entityXandBoth, /* qqq : implement */

    entityAll,
    entityAny,
    entityNone,

    entityMap,
    entityFilter,
    entityFilterDeep,

    index,
    indexExtending,
    indexSupplementing,
    indexAppending,
    indexPrepending,

    remap,
    remapExtending,
    remapSupplementing,
    remapAppending,
    remapPrepending,

    //

    _entityMost,
    entityMin,
    entityMax,

    //

    eachSample,
    eachSampleExperiment,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
