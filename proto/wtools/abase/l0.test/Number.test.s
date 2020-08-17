( function _Number_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

let _ = wTools;

//--
// l0/l3/iNumber.s
//--

function numberIs( test )
{
  test.case = 'null';
  var got = _.numberIs( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.numberIs( undefined );
  test.identical( got, false );

  //

  test.case = 'false';
  var got = _.numberIs( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIs( true );
  test.identical( got, false );

  //

  test.case = 'Positive Number';
  var got = _.numberIs( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.numberIs( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.numberIs( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.numberIs( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.numberIs( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.numberIs( NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.numberIs( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.numberIs( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.numberIs( -Infinity );
  test.identical( got, true );

  //

  test.case = 'empty string';
  var got = _.numberIs( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIs( 'abc' );
  test.identical( got, false );

  //

  test.case = 'String positive Number';
  var got = _.numberIs( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.numberIs( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.numberIs( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.numberIs( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.numberIs( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.numberIs( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.numberIs( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.numberIs( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.numberIs( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.numberIs( 'abc2' );
  test.identical( got, false );

  //

  test.case = 'Set';
  var got = _.numberIs( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.numberIs( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.numberIs( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.numberIs( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.numberIs( function(){} );
  test.identical( got, false );
}

//

function numberIsNotNan( test )
{
  test.case = 'null';
  var got = _.numberIsNotNan( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.numberIsNotNan( undefined );
  test.identical( got, false );

  //

  test.case = 'false';
  var got = _.numberIsNotNan( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIsNotNan( true );
  test.identical( got, false );

  //

  test.case = 'Positive Number';
  var got = _.numberIsNotNan( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.numberIsNotNan( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.numberIsNotNan( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.numberIsNotNan( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.numberIsNotNan( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.numberIsNotNan( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.numberIsNotNan( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.numberIsNotNan( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.numberIsNotNan( -Infinity );
  test.identical( got, true );

  //

  test.case = 'empty string';
  var got = _.numberIsNotNan( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIsNotNan( 'abc' );
  test.identical( got, false );

  //

  test.case = 'String positive Number';
  var got = _.numberIsNotNan( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.numberIsNotNan( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.numberIsNotNan( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.numberIsNotNan( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.numberIsNotNan( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.numberIsNotNan( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.numberIsNotNan( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.numberIsNotNan( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.numberIsNotNan( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.numberIsNotNan( 'abc2' );
  test.identical( got, false );

  //

  test.case = 'Set';
  var got = _.numberIsNotNan( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.numberIsNotNan( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.numberIsNotNan( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.numberIsNotNan( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.numberIsNotNan( function(){} );
  test.identical( got, false );
}

//

function numberIsFinite( test )
{
  test.case = 'null';
  var got = _.numberIsFinite( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.numberIsFinite( undefined );
  test.identical( got, false );

  //

  test.case = 'false';
  var got = _.numberIsFinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIsFinite( true );
  test.identical( got, false );

  //

  test.case = 'Positive Number';
  var got = _.numberIsFinite( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.numberIsFinite( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.numberIsFinite( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.numberIsFinite( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.numberIsFinite( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.numberIsFinite( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.numberIsFinite( Infinity );
  test.identical( got, false );

  test.case = 'Positive Infinity';
  var got = _.numberIsFinite( +Infinity );
  test.identical( got, false );

  test.case = 'Negative Infinity';
  var got = _.numberIsFinite( -Infinity );
  test.identical( got, false );

  //

  test.case = 'empty string';
  var got = _.numberIsFinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIsFinite( 'abc' );
  test.identical( got, false );

  //

  test.case = 'String positive Number';
  var got = _.numberIsFinite( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.numberIsFinite( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.numberIsFinite( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.numberIsFinite( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.numberIsFinite( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.numberIsFinite( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.numberIsFinite( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.numberIsFinite( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.numberIsFinite( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.numberIsFinite( 'abc2' );
  test.identical( got, false );

  //

  test.case = 'Set';
  var got = _.numberIsFinite( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.numberIsFinite( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.numberIsFinite( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.numberIsFinite( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.numberIsFinite( function(){} );
  test.identical( got, false );
}

//

function numberIsInfinite( test )
{
  test.case = 'null';
  var got = _.numberIsInfinite( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.numberIsInfinite( undefined );
  test.identical( got, false );

  //

  test.case = 'false';
  var got = _.numberIsInfinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIsInfinite( true );
  test.identical( got, false );

  //

  test.case = 'Positive Number';
  var got = _.numberIsInfinite( 2 );
  test.identical( got, false );

  test.case = 'Negative Number';
  var got = _.numberIsInfinite( -2 );
  test.identical( got, false );

  test.case = 'Zero Number';
  var got = _.numberIsInfinite( 0 );
  test.identical( got, false );

  test.case = '-Zero Number';
  var got = _.numberIsInfinite( -0 );
  test.identical( got, false );

  test.case = '+Zero Number';
  var got = _.numberIsInfinite( +0 );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.numberIsInfinite( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.numberIsInfinite( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.numberIsInfinite( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.numberIsInfinite( -Infinity );
  test.identical( got, true );

  //

  test.case = 'empty string';
  var got = _.numberIsInfinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIsInfinite( 'abc' );
  test.identical( got, false );

  //

  test.case = 'String positive Number';
  var got = _.numberIsInfinite( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.numberIsInfinite( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.numberIsInfinite( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.numberIsInfinite( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.numberIsInfinite( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.numberIsInfinite( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.numberIsInfinite( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.numberIsInfinite( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.numberIsInfinite( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.numberIsInfinite( 'abc2' );
  test.identical( got, false );

  //

  test.case = 'Set';
  var got = _.numberIsInfinite( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.numberIsInfinite( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.numberIsInfinite( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.numberIsInfinite( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.numberIsInfinite( function(){} );
  test.identical( got, false );
}

//

function intIs( test )
{
  test.case = 'null';
  var got = _.intIs( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.intIs( undefined );
  test.identical( got, false );

  //

  test.case = 'false';
  var got = _.intIs( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.intIs( true );
  test.identical( got, false );

  //

  test.case = 'Positive Number';
  var got = _.intIs( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.intIs( -2 );
  test.identical( got, true );

  //

  test.case = '2.00 Number';
  var got = _.intIs( 2.00 );
  test.identical( got, true );

  test.case = '2.49 Number';
  var got = _.intIs( 2.49 );
  test.identical( got, false );

  test.case = '2.50 Number';
  var got = _.intIs( 2.50 );
  test.identical( got, false );

  test.case = '2.51 Number';
  var got = _.intIs( 2.51 );
  test.identical( got, false );

  test.case = '-2.00 Number';
  var got = _.intIs( -2.00 );
  test.identical( got, true );

  test.case = '-2.49 Number';
  var got = _.intIs( -2.49 );
  test.identical( got, false );

  test.case = '-2.50 Number';
  var got = _.intIs( -2.50 );
  test.identical( got, false );

  test.case = '-2.51 Number';
  var got = _.intIs( -2.51 );
  test.identical( got, false );

  //

  test.case = 'Negative Number';
  var got = _.intIs( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.intIs( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.intIs( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.intIs( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.intIs( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.intIs( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.intIs( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.intIs( -Infinity );
  test.identical( got, true );

  //

  test.case = 'empty string';
  var got = _.intIs( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.intIs( 'abc' );
  test.identical( got, false );

  //

  test.case = 'String positive Number';
  var got = _.intIs( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.intIs( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.intIs( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.intIs( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.intIs( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.intIs( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.intIs( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.intIs( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.intIs( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.intIs( 'abc2' );
  test.identical( got, false );

  //

  test.case = 'Set';
  var got = _.intIs( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.intIs( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.intIs( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.intIs( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.intIs( function(){} );
  test.identical( got, false );
}


//

//--
// l0/l8/gNumber.s
//--

function numbersFrom( test )
{
  test.case = 'null';
  var got = _.numbersFrom( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.numbersFrom( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.numbersFrom( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.numbersFrom( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.numbersFrom( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.numbersFrom( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.numbersFrom( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.numbersFrom( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.numbersFrom( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.numbersFrom( '12' );
  test.identical( got, 12 );

  test.case = 'Set';
  var got = _.numbersFrom( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.numbersFrom( new Map() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.numbersFrom( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.numbersFrom( src );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 2, 3 ] );
  test.is( got !== src );

  test.case = 'array with strings without digits';
  var src = [ '', 'a', 'str' ];
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.is( got !== src );

  test.case = 'array with strings with digits';
  var src = [ '1', '1.2', '12.3' ];
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );
  test.is( got !== src );

  test.case = 'array with elements, which does not convert to number';
  var src = [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ];
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.is( got !== src );

  /* */

  test.case = 'empty argumentsArray';
  var src = _.argumentsArrayMake( [] );
  var got = _.numbersFrom( src );
  test.identical( got, [] );

  test.case = 'argumentsArray with numbers';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'argumentsArray with strings without digits';
  var src = _.argumentsArrayMake( [ '', 'a', 'str' ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'argumentsArray with strings with digits';
  var src = _.argumentsArrayMake( [ '1', '1.2', '12.3' ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );

  test.case = 'argumentsArray with elements, which does not convert to number';
  var src = _.argumentsArrayMake( [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.numbersFrom( src );
  test.identical( got, [] );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 2, 3 ] );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.numbersFrom( src );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map, values is numbers';
  var src = { a : 1, b : 2, c : 3 };
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.is( got !== src );

  test.case = 'map, values is not digit literals';
  var src = { a : '', b : 'a', c : 'str' };
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  test.case = 'map, values is digit literals';
  var src = { a : '1', b : '1.2', c : '12.3' };
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.is( got !== src );

  test.case = 'map, values does not convert to number';
  var src = { a : new Set(), b : [ 1, 2 ], c : { a : 2 } };
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  /* */

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.numbersFrom( src );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map, values is numbers';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  src.c = 3;
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.is( got !== src );

  test.case = 'map, values is not digit literals';
  var src = Object.create( null );
  src.a = '';
  src.b = 'a';
  src.c = 'str';
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  test.case = 'map, values is digit literals';
  var src = Object.create( null );
  src.a = '1';
  src.b = '1.2';
  src.c = '12.3';
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.is( got !== src );

  test.case = 'map, values does not convert to number';
  var src = Object.create( null );
  src.a = new Set();
  src.b = [ 1, 2 ];
  src.c = { a : 2 };
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  /* - */

  test.open( 'instance of constructor' );

  function Constr()
  {
    this.x = arguments[ 0 ];
    this.y = arguments[ 1 ];
    return this;
  };

  test.case = 'empty instance';
  var src = new Constr();
  var got = _.numbersFrom( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.is( got !== src );

  test.case = 'numbers as properties';
  var src = new Constr( 1, 2 );
  var got = _.numbersFrom( src );
  test.identical( got, { x : 1, y : 2 } );
  test.is( got !== src );

  test.case = 'not digit literals as properties';
  var src = new Constr( '', 'a' );
  var got = _.numbersFrom( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.is( got !== src );

  test.case = 'digit literals as properties';
  var src = new Constr( '1', '1.2' );
  var got = _.numbersFrom( src );
  test.identical( got, { x : 1, y : 1.2 } );
  test.is( got !== src );

  test.case = 'value of properties is not convertable to number';
  var src = new Constr( [ 1, 2 ], { a : 2 } );
  var got = _.numbersFrom( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.is( got !== src );

  test.close( 'instance of constructor' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersFrom( [ 1, 2 ], 'extra' ) );

  test.case = 'src has not converted type';
  test.shouldThrowErrorSync( () => _.numbersFrom( Symbol.for( 'a' ) ) );
  test.shouldThrowErrorSync( () => _.numbersFrom( [ 1, Symbol.for( 'a' ) ] ) );
}

//

function numberFromStrMaybe( test )
{
  test.case = 'src - number integer';
  var src = 1;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - number negative integer';
  var src = -1;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -1 );

  test.case = 'src - number float';
  var src = 1.01;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1.01 );

  test.case = 'src - number negative float';
  var src = -1.01;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -1.01 );

  test.case = 'src - number float without 0 before dot';
  var src = 0.01;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 0.01 );

  test.case = 'src - number negative float without 0 before dot';
  var src = -0.01;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = NaN;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, NaN );

  test.case = 'src - number +0';
  var src = +0;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, +0 );

  test.case = 'src - number -0';
  var src = -0;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -0 );

  test.case = 'src - number Infinity';
  var src = Infinity;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, Infinity );

  test.case = 'src - number -Infinity';
  var src = -Infinity;
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -Infinity );

  /* */

  test.case = 'src - empty string';
  var src = '';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, '' );

  test.case = 'src - string with space';
  var src = ' ';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 0 );

  test.case = 'src - string with spaces';
  var src = '   ';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 0 );

  test.case = 'src - string integer';
  var src = '1';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string BigInt';
  var src = '1n';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, '1n' );

  test.case = 'src - string integer with other literals';
  var src = '1 a';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, '1 a' );

  test.case = 'src - string integer with other literals';
  var src = '1aa';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, '1aa' );

  test.case = 'src - string';
  var src = 'a';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 'a' );

  test.case = 'src - string integer with space after';
  var src = '1 ';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with space before';
  var src = ' 1';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with spaces';
  var src = '  1  ';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string negative integer';
  var src = '-1';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -1 );

  test.case = 'src - string float';
  var src = '1.01';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 1.01 );

  test.case = 'src - string negative float';
  var src = '-1.01';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -1.01 );

  test.case = 'src - string float without 0 before dot';
  var src = '.01';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 0.01 );

  test.case = 'src - string negative float without 0 before dot';
  var src = '-.01';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = 'NaN';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, 'NaN' );

  test.case = 'src - string +0';
  var src = '+0';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, +0 );

  test.case = 'src - string -0';
  var src = '-0';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -0 );

  test.case = 'src - string Infinity';
  var src = 'Infinity';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, Infinity );

  test.case = 'src - string -Infinity';
  var src = '-Infinity';
  var got = _.numberFromStrMaybe( src );
  test.identical( got, -Infinity );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numberFromStrMaybe() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numberFromStrMaybe( '1', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.numberFromStrMaybe( null ) );
  test.shouldThrowErrorSync( () => _.numberFromStrMaybe( [ 1 ] ) );
}

//

function numberRandom( test )
{
  test.case = 'range - 0';
  var got = _.numberRandom( 0 );
  test.identical( got, 0 );

  test.case = 'range > 0';
  var got = _.numberRandom( 10 );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range < 0';
  var got = _.numberRandom( -10 );
  test.ge( got, -10 );
  test.le( got, 0 );

  /* */

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] === 0';
  var got = _.numberRandom( [ 0, 0 ] );
  test.identical( got, 0 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] > 0';
  var got = _.numberRandom( [ 10, 10 ] );
  test.identical( got, 10 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] < 0';
  var got = _.numberRandom( [ -10, -10 ] );
  test.identical( got, -10 );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] >  0';
  var got = _.numberRandom( [ 0, 10 ] );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] ===  0';
  var got = _.numberRandom( [ 10, 0 ] );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var got = _.numberRandom( [ 5, 10 ] );
  test.ge( got, 5 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var got = _.numberRandom( [ 10, 5 ] );
  test.ge( got, 5 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] <  0';
  var got = _.numberRandom( [ 0, -10 ] );
  test.ge( got, -10 );
  test.le( got, 0 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] ===  0';
  var got = _.numberRandom( [ -10, 0 ] );
  test.ge( got, -10 );
  test.le( got, 0 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] > range[ 1 ]';
  var got = _.numberRandom( [ -5, -10 ] );
  test.ge( got, -10 );
  test.le( got, -5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var got = _.numberRandom( [ -10, -5 ] );
  test.ge( got, -10 );
  test.le( got, -5 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] < 0';
  var got = _.numberRandom( [ 5, -10 ] );
  test.ge( got, -10 );
  test.le( got, 5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] > 0';
  var got = _.numberRandom( [ -10, 5 ] );
  test.ge( got, -10 );
  test.le( got, 5 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numberRandom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numberRandom( [ 0, 2 ], 'extra' ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.numberRandom( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.numberRandom( { a : 1 } ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.numberRandom( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.numberRandom( [ 1, 2, 3 ] ) );
}

//

function intRandom( test )
{
  test.case = 'range - 0';
  var got = _.intRandom( 0 );
  test.identical( got, 0 );

  test.case = 'range === 1';
  var got = _.intRandom( 1 );
  test.is( got === 0 || got === 1 );

  test.case = 'range > 0';
  var got = _.intRandom( 10 );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.is( Math.floor( got ) === got );

  test.case = 'range < 0';
  var got = _.intRandom( -10 );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.is( Math.floor( got ) === got );

  /* */

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] === 0';
  var got = _.intRandom( [ 0, 0 ] );
  test.identical( got, 0 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] > 0';
  var got = _.intRandom( [ 10, 10 ] );
  test.identical( got, 10 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] < 0';
  var got = _.intRandom( [ -10, -10 ] );
  test.identical( got, -10 );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] === 1';
  var got = _.intRandom( [ 0, 1 ] );
  test.is( got === 0 || got === 1 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] >  0';
  var got = _.intRandom( [ 0, 10 ] );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] ===  0';
  var got = _.intRandom( [ 10, 0 ] );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 1 ] - range[ 1 ] === 1';
  var got = _.intRandom( [ 5, 6 ] );
  test.is( got === 5 || got === 6 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var got = _.intRandom( [ 5, 10 ] );
  test.ge( got, 5 );
  test.le( got, 10 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var got = _.intRandom( [ 10, 5 ] );
  test.ge( got, 5 );
  test.le( got, 10 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -1';
  var got = _.intRandom( [ 0, -1 ] );
  test.is( got === -1 || got === 0 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] <  0';
  var got = _.intRandom( [ 0, -10 ] );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] ===  0';
  var got = _.intRandom( [ -10, 0 ] );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] - range[ 1 ] === 1';
  var got = _.intRandom( [ -6, -5 ] );
  test.is( got === -6 || got === -5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] > range[ 1 ]';
  var got = _.intRandom( [ -5, -10 ] );
  test.ge( got, -10 );
  test.le( got, -5 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var got = _.intRandom( [ -10, -5 ] );
  test.ge( got, -10 );
  test.le( got, -5 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] < 0';
  var got = _.intRandom( [ 5, -10 ] );
  test.ge( got, -10 );
  test.le( got, 5 );
  test.is( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] > 0';
  var got = _.intRandom( [ -10, 5 ] );
  test.ge( got, -10 );
  test.le( got, 5 );
  test.is( Math.floor( got ) === got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.intRandom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.intRandom( [ 0, 2 ], 'extra' ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.intRandom( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.intRandom( { a : 1 } ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.intRandom( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.intRandom( [ 1, 2, 3 ] ) );
}

// --
// declaration
// --

let Self =
{

  name : 'Tools.Number',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l3/iNumber.s

    numberIs,
    numberIsNotNan,
    numberIsFinite,
    numberIsInfinite,
    intIs,

    // l0/l8/gNumber.s

    numbersFrom,
    numberFromStrMaybe,

    numberRandom,
    intRandom,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
