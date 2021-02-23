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
// l0/l3/Number.s
//--

function numberIs( test )
{
  test.case = 'null';
  var got = _.number.is( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.is( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.is( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.is( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.is( 2 );
  test.identical( got, true );

  test.case = 'Positive float Number';
  var got = _.number.is( 2.33 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.number.is( -2 );
  test.identical( got, true );

  test.case = 'Negative float Number';
  var got = _.number.is( -2.33 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.number.is( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.number.is( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.number.is( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.number.is( NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.number.is( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.number.is( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.number.is( -Infinity );
  test.identical( got, true );

  /* - */

  test.case = 'empty string';
  var got = _.number.is( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.is( 'abc' );
  test.identical( got, false );

  test.case = 'String positive Number';
  var got = _.number.is( '2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.is( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.is( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.is( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.is( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.is( function(){} );
  test.identical( got, false );
}

//

function numberIsNotNan( test )
{
  test.case = 'null';
  var got = _.number.isNotNan( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.isNotNan( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.isNotNan( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.isNotNan( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.isNotNan( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.number.isNotNan( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.number.isNotNan( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.number.isNotNan( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.number.isNotNan( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.number.isNotNan( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.number.isNotNan( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.number.isNotNan( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.number.isNotNan( -Infinity );
  test.identical( got, true );

  /* - */

  test.case = 'empty string';
  var got = _.number.isNotNan( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.isNotNan( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.number.isNotNan( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.number.isNotNan( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.number.isNotNan( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.number.isNotNan( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.number.isNotNan( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.number.isNotNan( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.number.isNotNan( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.number.isNotNan( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.number.isNotNan( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.number.isNotNan( 'abc2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.isNotNan( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.isNotNan( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.isNotNan( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.isNotNan( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.isNotNan( function(){} );
  test.identical( got, false );
}

//

function numberIsFinite( test )
{
  test.case = 'null';
  var got = _.number.isFinite( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.isFinite( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.isFinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.isFinite( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.isFinite( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.number.isFinite( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.number.isFinite( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.number.isFinite( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.number.isFinite( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.number.isFinite( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.number.isFinite( Infinity );
  test.identical( got, false );

  test.case = 'Positive Infinity';
  var got = _.number.isFinite( +Infinity );
  test.identical( got, false );

  test.case = 'Negative Infinity';
  var got = _.number.isFinite( -Infinity );
  test.identical( got, false );

  /* - */

  test.case = 'empty string';
  var got = _.number.isFinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.isFinite( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.number.isFinite( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.number.isFinite( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.number.isFinite( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.number.isFinite( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.number.isFinite( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.number.isFinite( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.number.isFinite( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.number.isFinite( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.number.isFinite( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.number.isFinite( 'abc2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.isFinite( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.isFinite( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.isFinite( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.isFinite( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.isFinite( function(){} );
  test.identical( got, false );
}

//

function numberIsInfinite( test )
{
  test.case = 'null';
  var got = _.number.isInfinite( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.isInfinite( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.isInfinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.isInfinite( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.isInfinite( 2 );
  test.identical( got, false );

  test.case = 'Negative Number';
  var got = _.number.isInfinite( -2 );
  test.identical( got, false );

  test.case = 'Zero Number';
  var got = _.number.isInfinite( 0 );
  test.identical( got, false );

  test.case = '-Zero Number';
  var got = _.number.isInfinite( -0 );
  test.identical( got, false );

  test.case = '+Zero Number';
  var got = _.number.isInfinite( +0 );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.number.isInfinite( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.number.isInfinite( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.number.isInfinite( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.number.isInfinite( -Infinity );
  test.identical( got, true );

  /* - */

  test.case = 'empty string';
  var got = _.number.isInfinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.isInfinite( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.number.isInfinite( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.number.isInfinite( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.number.isInfinite( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.number.isInfinite( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.number.isInfinite( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.number.isInfinite( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.number.isInfinite( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.number.isInfinite( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.number.isInfinite( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.number.isInfinite( 'abc2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.isInfinite( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.isInfinite( new Map() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.isInfinite( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.isInfinite( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.isInfinite( function(){} );
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

  /* - */

  test.case = 'false';
  var got = _.intIs( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.intIs( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.intIs( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.intIs( -2 );
  test.identical( got, true );

  /* - */

  test.case = '2.00 Number';
  var got = _.intIs( 2.00 );
  test.identical( got, true );

  test.case = '2.50 Number';
  var got = _.intIs( 2.50 );
  test.identical( got, false );

  test.case = '2.49 Number';
  var got = _.intIs( 2.49 );
  test.identical( got, false );

  test.case = '2.00000000001 Number';
  var got = _.intIs( 2.00000000001 );
  test.identical( got, false );

  test.case = '-2.00000000001 Number';
  var got = _.intIs( -2.00000000001 );
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

  /* - */

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
  test.identical( got, false );

  test.case = 'Positive Infinity';
  var got = _.intIs( +Infinity );
  test.identical( got, false );

  test.case = 'Negative Infinity';
  var got = _.intIs( -Infinity );
  test.identical( got, false );

  /* - */

  test.case = 'empty string';
  var got = _.intIs( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.intIs( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.intIs( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.intIs( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.intIs( '0' );
  test.identical( got, false );

  /* - */

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

/* - */

function numbersAreAll( test )
{
  test.case = 'empty array';
  var got = _.number.s.areAll( [] );
  test.identical( got, false );

  /* - */

  test.case = 'array of stings';
  var got = _.number.s.areAll( [ 'a', 'b' ] );
  test.identical( got, false );

  test.case = 'array of stings of numbers';
  var got = _.number.s.areAll( [ '1', '2' ] );
  test.identical( got, false );

  test.case = 'array of stings and numbers';
  var got = _.number.s.areAll( [ 'a', 1 ] );
  test.identical( got, false );

  /* - */

  test.case = 'array of integers';
  var got = _.number.s.areAll( [ 1, 2 ] );
  test.identical( got, true );

  test.case = 'array of floats';
  var got = _.number.s.areAll( [ 1.00, 2.22 ] );
  test.identical( got, true );

  test.case = 'array of special number values';
  var got = _.number.s.areAll( [ Infinity, -Infinity, NaN ] );
  test.identical( got, true );

  /* - */

  test.case = 'Typed array';
  var got = _.number.s.areAll( new I8x([ 1, 2 ]) );
  test.identical( got, true );

  test.case = 'Object of numbers';
  var got = _.number.s.areAll({ '0' : 1, '1' : 2 });
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areAll() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areAll( [ 1, 2 ], 'extra' ) );

}

//

function numbersAreIdentical( test )
{
  test.case = 'empty strings';
  var got = _.number.s.areIdentical( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.s.areIdentical( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.s.areIdentical( '1', 1 );
  test.identical( got, false );

  /* - */

  test.case = 'numbers 1 and 1 ';
  var got = _.number.s.areIdentical( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.number.s.areIdentical( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  var got = _.number.s.areIdentical( 1.00000000000001, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.number.s.areIdentical( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.number.s.areIdentical( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.number.s.areIdentical( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.number.s.areIdentical( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.s.areIdentical( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.number.s.areIdentical( +0, -0 );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.s.areIdentical( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.number.s.areIdentical( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.number.s.areIdentical( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.number.s.areIdentical( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.s.areIdentical( NaN, NaN );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areIdentical() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areIdentical( 1, 2, 'extra' ) );
}

//

function numbersAreIdenticalNotStrictly( test )
{
  test.case = 'empty strings';
  var got = _.number.s.areIdenticalNotStrictly( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.s.areIdenticalNotStrictly( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.s.areIdenticalNotStrictly( '1', 1 );
  test.identical( got, false );

  /* - */

  test.case = 'numbers 1 and 1';
  var got = _.number.s.areIdenticalNotStrictly( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1';
  var got = _.number.s.areIdenticalNotStrictly( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1';
  var got = _.number.s.areIdenticalNotStrictly( 1.00000000000001, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.2 and 1';
  var got = _.number.s.areIdenticalNotStrictly( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00';
  var got = _.number.s.areIdenticalNotStrictly( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0';
  var got = _.number.s.areIdenticalNotStrictly( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0';
  var got = _.number.s.areIdenticalNotStrictly( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.s.areIdenticalNotStrictly( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0';
  var got = _.number.s.areIdenticalNotStrictly( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN';
  var got = _.number.s.areIdenticalNotStrictly( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity';
  var got = _.number.s.areIdenticalNotStrictly( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity';
  var got = _.number.s.areIdenticalNotStrictly( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity';
  var got = _.number.s.areIdenticalNotStrictly( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN';
  var got = _.number.s.areIdenticalNotStrictly( NaN, NaN );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areIdenticalNotStrictly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areIdenticalNotStrictly( 1, 2, 'extra' ) );
}

//

/* qqq for Yevhen : bad! ask */
function numbersAreEquivalentBasic( test )
{

  test.case = 'empty strings';
  var got = _.number.s.areEquivalent( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.s.areEquivalent( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.s.areEquivalent( '1', 1 );
  test.identical( got, false );

  test.case = 'numbers 1 and 1 ';
  var got = _.number.s.areEquivalent( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.number.s.areEquivalent( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  var got = _.number.s.areEquivalent( 1.00000000000001, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.number.s.areEquivalent( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.number.s.areEquivalent( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.number.s.areEquivalent( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.number.s.areEquivalent( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.s.areEquivalent( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.number.s.areEquivalent( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.s.areEquivalent( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.number.s.areEquivalent( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.number.s.areEquivalent( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.number.s.areEquivalent( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.s.areEquivalent( NaN, NaN );
  test.identical( got, true );

  /* qqq for Yevhen : extend */

  test.case = 'number 3 and big int 3';
  var got = _.number.s.areEquivalent( 3, 3n );
  test.identical( got, true );
  debugger;
  var got = _.number.s.areEquivalent( 3n, 3 );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areEquivalent() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areEquivalent( 1, 2, 0.7, 'extra' ) );

  test.case = 'negative accuracy';
  test.shouldThrowErrorSync( () => _.number.s.areEquivalent( 1, 1, -0.5 ) );

  test.case = 'not a number accuracy';
  test.shouldThrowErrorSync( () => _.number.s.areEquivalent( 1, 1, '-0.5' ) );
}

//

/* qqq for Yevhen : use `/ * * /` as delimeter between cases or nothing, not `//` */

function numbersAreEquivalentOptionAccuracy( test ) /* qqq for Yevhen : bad name, not option, it's argument! */
{
  test.open( 'positive numbers' )

  test.case = 'numbers 1.00 and 1.04999, acc = 0.05 ';
  var got = _.number.s.areEquivalent( 1.00, 1.04999, 0.05 );
  test.identical( got, true );

  test.case = 'numbers 1 and 1.04999, acc = 0.05 ';
  var got = _.number.s.areEquivalent( 1, 1.04999, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 1 and 2, acc = 1 ';
  var got = _.number.s.areEquivalent( 1, 2, 1 );
  test.identical( got, true );

  test.case = 'numbers 10 and 20, acc = 11 ';
  var got = _.number.s.areEquivalent( 10, 20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998001, acc = 0.001 ';
  var got = _.number.s.areEquivalent( 0.999, 0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers 0.999 and 0.998, acc = 0.0001 ';
  var got = _.number.s.areEquivalent( 0.999, 0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.000001 ';
  var got = _.number.s.areEquivalent( 0.999999, 0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.0000001 ';
  var got = _.number.s.areEquivalent( 0.999999, 0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers 0.9999999999 and 0.999999999801, acc = 0.0000000001 ';
  var got = _.number.s.areEquivalent( 0.9999999999, 0.999999999801, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.0000000001 ';
  var got = _.number.s.areEquivalent( 0.9999999999, 0.9999999998, 0.0000000001 );
  test.identical( got, false );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.00000000001 ';
  var got = _.number.s.areEquivalent( 0.9999999999, 0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers 0.99999999999 and 0.99999999998001, acc = 0.00000000001 ';
  var got = _.number.s.areEquivalent( 0.99999999999, 0.99999999998001, 0.00000000001 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998, acc = 0 ';
  var got = _.number.s.areEquivalent( 0.999, 0.998, 0 );
  test.identical( got, false );

  test.case = 'numbers 0.999 and 0.999, acc = 0 ';
  var got = _.number.s.areEquivalent( 0.999, 0.999, 0 );
  test.identical( got, true );

  test.case = 'numbers 999 and 999, acc = 0 ';
  var got = _.number.s.areEquivalent( 999, 999, 0 );
  test.identical( got, true );

  test.close( 'positive numbers' );

  /* - */

  test.open( 'negative numbers' )

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.number.s.areEquivalent( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.number.s.areEquivalent( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -1 and -2, acc = 1 ';
  var got = _.number.s.areEquivalent( -1, -2, 1 );
  test.identical( got, true );

  test.case = 'numbers -10 and -20, acc = 11 ';
  var got = _.number.s.areEquivalent( -10, -20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -0.999 and -0.9980001, acc = 0.001 ';
  var got = _.number.s.areEquivalent( -0.999, -0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers -0.999 and -0.998, acc = 0.0001 ';
  var got = _.number.s.areEquivalent( -0.999, -0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.000001 ';
  var got = _.number.s.areEquivalent( -0.999999, -0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.0000001 ';
  var got = _.number.s.areEquivalent( -0.999999, -0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers -0.9999999999 and -0.99999999980001, acc = 0.0000000001 ';
  var got = _.number.s.areEquivalent( -0.9999999999, -0.99999999980001, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers -0.9999999999 and -0.9999999998, acc = 0.00000000001 ';
  var got = _.number.s.areEquivalent( -0.9999999999, -0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers -0.99999999999 and -0.999999999980001, acc = 0.00000000001 ';
  var got = _.number.s.areEquivalent( -0.99999999999, -0.999999999980001, 0.00000000001 );
  test.identical( got, true );

  test.close( 'negative numbers' )

  /* - */

  test.open( 'negative and positive numbers' )

  test.case = 'numbers 10 and -20, acc = 30 ';
  var got = _.number.s.areEquivalent( 10, -20, 30 );
  test.identical( got, true );

  test.case = 'numbers 10 and -20, acc = 10 ';
  var got = _.number.s.areEquivalent( 10, -20, 10 );
  test.identical( got, false );

  test.close( 'negative and positive numbers' )

  /* - */

  test.open( 'big int' )

  /* qqq for Yevhen : extend */

  // test.case = 'number 3.01 and big int 3';
  // var got = _.number.s.areEquivalent( 3.1, 3n, 0.10001 );
  // test.identical( got, true );
  // var got = _.number.s.areEquivalent( 3n, 3.1, 0.10001 );
  // test.identical( got, true );

  test.close( 'big int' )

}

//

function numbersAreFinite( test )
{

  test.case = 'empty array';
  var got = _.number.s.areFinite([]);
  test.identical( got, false );

  test.open( 'strings, numbers' )

  test.case = 'numbers 1, 1, string 1 ';
  var got = _.number.s.areFinite([ 1, 1, '1' ]);
  test.identical( got, false );

  test.case = 'strings 1, 1, -1 ';
  var got = _.number.s.areFinite([ '1', '1', '-1' ]);
  test.identical( got, false );

  test.close( 'strings, numbers' )

  /* - */

  test.open( 'numbers' )

  test.case = 'array 1, 1, -1 ';
  var got = _.number.s.areFinite([ 1, 1, -1 ]);
  test.identical( got, true );

  test.case = 'array 1.2, 0.9999, -1 ';
  var got = _.number.s.areFinite([ 1.2, 0.9999, -1 ]);
  test.identical( got, true );

  test.case = 'array 1, 1, NaN ';
  var got = _.number.s.areFinite([ 1, 1, NaN ]);
  test.identical( got, false );

  test.case = 'array NaN, NaN, NaN ';
  var got = _.number.s.areFinite([ NaN, NaN, NaN ]);
  test.identical( got, false );

  test.case = 'array 1, 1, Infinity ';
  var got = _.number.s.areFinite([ 1, 1, Infinity ]);
  test.identical( got, false );

  test.case = 'array 1, 1, -Infinity ';
  var got = _.number.s.areFinite([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.close( 'numbers' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areFinite() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areFinite( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function numbersArePositive( test )
{
  test.case = '1 1 1';
  var got = _.number.s.arePositive([ 1, 1, 1 ]);
  test.identical( got, true );

  test.case = '-1 1 1';
  var got = _.number.s.arePositive([ -1, 1, 1 ]);
  test.identical( got, false );

  test.case = '1 1 -Infinity';
  var got = _.number.s.arePositive([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.case = '1 1 Infinity';
  var got = _.number.s.arePositive([ 1, 1, Infinity ]);
  test.identical( got, true );

  test.case = '1 1 -0 ';
  var got = _.number.s.arePositive([ 1, 1, -0 ]);
  test.identical( got, true );

  test.case = '1 1 0 ';
  var got = _.number.s.arePositive([ 1, 1, 0 ]);
  test.identical( got, true );

  test.case = '-0.000000000000000000001 1 0 ';
  var got = _.number.s.arePositive([ -0.000000000000000000001, 1, 0 ]);
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.arePositive() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.arePositive( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function numbersAreInt( test )
{
  test.case = '1 1 1';
  var got = _.number.s.areInt([ 1, 1, 1 ]);
  test.identical( got, true );

  test.case = '-1 1 1';
  var got = _.number.s.areInt([ -1, 1, 1 ]);
  test.identical( got, true );

  /* */

  test.case = '1 1 -Infinity';
  var got = _.number.s.areInt([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.case = '1 1 Infinity';
  var got = _.number.s.areInt([ 1, 1, Infinity ]);
  test.identical( got, false );

  test.case = '1 1 NaN';
  var got = _.number.s.areInt([ 1, 1, NaN ]);
  test.identical( got, false );

  /* */

  test.case = '1.00 1 0.00 ';
  var got = _.number.s.areInt([ 1.00, 1, 0.00 ]);
  test.identical( got, true );

  test.case = '1.1 1 0 ';
  var got = _.number.s.areInt([ 1.1, 1, 0 ]);
  test.identical( got, false );

  test.case = '0.000000000000000000001 1 0 ';
  var got = _.number.s.areInt([ 0.000000000000000000001, 1, 0 ]);
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areInt() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areInt( [ 1, 2, 0.7 ], 'extra' ) );
}


//--
// l0/l5/Number.s
//--

function bigIntFrom( test )
{
  test.open( 'numbers' );

  test.case = '1';
  var got = _.bigInt.from( 1 );
  test.identical( got, 1n );

  test.case = '-1';
  var got = _.bigInt.from( -1 );
  test.identical( got, -1n );

  test.case = '-10000000000';
  var got = _.bigInt.from( -10000000000 );
  test.identical( got, -10000000000n );

  test.case = '1e5';
  var got = _.bigInt.from( 1e5 );
  test.identical( got, 100000n );

  test.case = '100000000000000000000';
  var got = _.bigInt.from( 100000000000000000000 );
  test.identical( got, 100000000000000000000n );

  test.case = '1e10';
  var got = _.bigInt.from( 1e10 );
  test.identical( got, 10000000000n );

  test.close( 'numbers' );

  /* - */

  test.open( 'string' );

  test.case = '1';
  var got = _.bigInt.from( '1' );
  test.identical( got, 1n );

  test.case = '100000';
  var got = _.bigInt.from( '100000' );
  test.identical( got, 100000n );

  test.case = '-10000';
  var got = _.bigInt.from( '-10000' );
  test.identical( got, -10000n );

  test.close( 'string' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bigInt.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bigInt.from( 1, 'extra' ) );

  test.case = 'not a number or string argument';
  test.shouldThrowErrorSync( () => _.bigInt.from( {} ) );
}

//--
// l0/l8/Number.s
//--

function numbersTotal( test )
{

  test.case = 'empty array';
  var got = _.number.s.total([]);
  test.identical( got, 0 );

  /* - */

  test.open( 'number input' )

  test.case = 'input 1, 2, 3';
  var got = _.number.s.total([ 1, 2, 3 ]);
  test.identical( got, 6 );

  test.case = 'input 1000, 200, 3';
  var got = _.number.s.total([ 1000, 200, 3 ]);
  test.identical( got, 1203 );

  test.case = 'input 1.00, 2.00, 3.00';
  var got = _.number.s.total([ 1.00, 2.00, 3.00 ]);
  test.identical( got, 6 );

  test.case = 'input 1.50, 2.50, 3';
  var got = _.number.s.total([ 1.50, 2.50, 3 ]);
  test.identical( got, 7 );

  test.case = 'input 1.55, 2.55, 3.05';
  var got = _.number.s.total([ 1.55, 2.55, 3.05 ]);
  test.eq( got, 7.15 );

  test.case = 'input 1.555, 2.555, 3.111';
  var got = _.number.s.total([ 1.555, 2.555, 3.111 ]);
  test.identical( got, 7.221 );

  test.case = 'input 1.5555, 2.555, 3.11';
  var got = _.number.s.total([ 1.5555, 2.555, 3.11 ]);
  test.eq( got, 7.2205 );

  test.case = 'input 1, 1, 0.99999999999999999999999';
  var got = _.number.s.total([ 1, 1, 0.99999999999999999999999 ]);
  test.eq( got, 2.99999999999999999999999 );

  test.close( 'number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.total() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.total( [ 1, 2, 0.7 ], 'extra' ) );

  test.case = 'input : \'a\', \'b\'';
  test.shouldThrowErrorSync( () => _.number.s.total([ 'a', 'b' ] ) );

  test.case = 'input : \'1\', \'2\', \'3\'';
  test.shouldThrowErrorSync( () => _.number.s.total([ '1', '2', '3' ]) );

  test.case = 'input : 1, 2, \'3\'';
  test.shouldThrowErrorSync( () => _.number.s.total([ 1, 2, '3' ]) );
}

//

function numberFrom( test )
{
  test.case = 'null';
  var got = _.number.from( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.number.from( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.number.from( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.number.from( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.number.from( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.number.from( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.number.from( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.number.from( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.number.from( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.number.from( '12' );
  test.identical( got, 12 );

  test.case = 'string with floating point digit symbols';
  var got = _.number.from( '12.33' );
  test.identical( got, 12.33 );

  test.case = 'Set';
  var got = _.number.from( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.number.from( new Map() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.number.from( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.number.from( src );
  test.identical( got, 0 );

  test.case = 'empty object';
  var src = {};
  var got = _.number.from( src );
  test.identical( got, NaN );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.number.from( src );
  test.identical( got, NaN );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.number.from( src );
  test.identical( got, 0 );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.number.from( src );
  test.identical( got, NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.from( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function numbersFrom( test )
{
  test.case = 'null';
  var got = _.number.s.from( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.number.s.from( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.number.s.from( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.number.s.from( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.number.s.from( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.number.s.from( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.number.s.from( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.number.s.from( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.number.s.from( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.number.s.from( '12' );
  test.identical( got, 12 );

  test.case = 'Set';
  var got = _.number.s.from( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.number.s.from( new Map() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.number.s.from( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.number.s.from( src );
  test.identical( got, [] );
  test.true( got !== src );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 2, 3 ] );
  test.true( got !== src );

  test.case = 'array with strings without digits';
  var src = [ '', 'a', 'str' ];
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.true( got !== src );

  test.case = 'array with strings with digits';
  var src = [ '1', '1.2', '12.3' ];
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );
  test.true( got !== src );

  test.case = 'array with elements, which does not convert to number';
  var src = [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ];
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.true( got !== src );

  /* */

  test.case = 'empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.number.s.from( src );
  test.identical( got, [] );

  test.case = 'argumentsArray with numbers';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'argumentsArray with strings without digits';
  var src = _.argumentsArray.make( [ '', 'a', 'str' ] );
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'argumentsArray with strings with digits';
  var src = _.argumentsArray.make( [ '1', '1.2', '12.3' ] );
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );

  test.case = 'argumentsArray with elements, which does not convert to number';
  var src = _.argumentsArray.make( [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ] );
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.number.s.from( src );
  test.identical( got, [] );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 2, 3 ] );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.number.s.from( src );
  test.identical( got, {} );
  test.true( got !== src );

  test.case = 'map, values is numbers';
  var src = { a : 1, b : 2, c : 3 };
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.true( got !== src );

  test.case = 'map, values is not digit literals';
  var src = { a : '', b : 'a', c : 'str' };
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  test.case = 'map, values is digit literals';
  var src = { a : '1', b : '1.2', c : '12.3' };
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.true( got !== src );

  test.case = 'map, values does not convert to number';
  var src = { a : new Set(), b : [ 1, 2 ], c : { a : 2 } };
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  /* */

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.number.s.from( src );
  test.identical( got, {} );
  test.true( got !== src );

  test.case = 'map, values is numbers';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  src.c = 3;
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.true( got !== src );

  test.case = 'map, values is not digit literals';
  var src = Object.create( null );
  src.a = '';
  src.b = 'a';
  src.c = 'str';
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  test.case = 'map, values is digit literals';
  var src = Object.create( null );
  src.a = '1';
  src.b = '1.2';
  src.c = '12.3';
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.true( got !== src );

  test.case = 'map, values does not convert to number';
  var src = Object.create( null );
  src.a = new Set();
  src.b = [ 1, 2 ];
  src.c = { a : 2 };
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

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
  var got = _.number.s.from( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.true( got !== src );

  test.case = 'numbers as properties';
  var src = new Constr( 1, 2 );
  var got = _.number.s.from( src );
  test.identical( got, { x : 1, y : 2 } );
  test.true( got !== src );

  test.case = 'not digit literals as properties';
  var src = new Constr( '', 'a' );
  var got = _.number.s.from( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.true( got !== src );

  test.case = 'digit literals as properties';
  var src = new Constr( '1', '1.2' );
  var got = _.number.s.from( src );
  test.identical( got, { x : 1, y : 1.2 } );
  test.true( got !== src );

  test.case = 'value of properties is not convertable to number';
  var src = new Constr( [ 1, 2 ], { a : 2 } );
  var got = _.number.s.from( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.true( got !== src );

  test.close( 'instance of constructor' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.from( [ 1, 2 ], 'extra' ) );

  test.case = 'src has not converted type';
  test.shouldThrowErrorSync( () => _.number.s.from( Symbol.for( 'a' ) ) );
  test.shouldThrowErrorSync( () => _.number.s.from( [ 1, Symbol.for( 'a' ) ] ) );
}

//

function numberFromStr( test )
{
  test.case = 'src - empty string';
  var src = '';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string with space';
  var src = ' ';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string integer';
  var src = '1';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with other literals';
  var src = '1 a';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with other literals';
  var src = '1aa';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string';
  var src = 'a';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string';
  var src = 'a1';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string integer with space after';
  var src = '1 ';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with space before';
  var src = ' 1';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with spaces';
  var src = '  1  ';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string negative integer';
  var src = '-1';
  var got = _.number.fromStr( src );
  test.identical( got, -1 );

  test.case = 'src - string float';
  var src = '1.01';
  var got = _.number.fromStr( src );
  test.identical( got, 1.01 );

  test.case = 'src - string negative float';
  var src = '-1.01';
  var got = _.number.fromStr( src );
  test.identical( got, -1.01 );

  test.case = 'src - string float without 0 before dot';
  var src = '.01';
  var got = _.number.fromStr( src );
  test.identical( got, 0.01 );

  test.case = 'src - string negative float without 0 before dot';
  var src = '-.01';
  var got = _.number.fromStr( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = 'NaN';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string +0';
  var src = '+0';
  var got = _.number.fromStr( src );
  test.identical( got, +0 );

  test.case = 'src - string -0';
  var src = '-0';
  var got = _.number.fromStr( src );
  test.identical( got, -0 );

  test.case = 'src - string Infinity';
  var src = 'Infinity';
  var got = _.number.fromStr( src );
  test.identical( got, Infinity );

  test.case = 'src - string -Infinity';
  var src = '-Infinity';
  var got = _.number.fromStr( src );
  test.identical( got, -Infinity );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.fromStr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.fromStr( '1', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.number.fromStr( null ) );
  test.shouldThrowErrorSync( () => _.number.fromStr( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.number.fromStr( 1 ) );
}

//

function numberFromStrMaybe( test )
{
  test.case = 'src - number integer';
  var src = 1;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - number negative integer';
  var src = -1;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1 );

  test.case = 'src - number float';
  var src = 1.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1.01 );

  test.case = 'src - number negative float';
  var src = -1.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1.01 );

  test.case = 'src - number float without 0 before dot';
  var src = 0.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0.01 );

  test.case = 'src - number negative float without 0 before dot';
  var src = -0.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = NaN;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, NaN );

  test.case = 'src - number +0';
  var src = +0;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, +0 );

  test.case = 'src - number -0';
  var src = -0;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0 );

  test.case = 'src - number Infinity';
  var src = Infinity;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, Infinity );

  test.case = 'src - number -Infinity';
  var src = -Infinity;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -Infinity );

  /* */

  test.case = 'src - empty string';
  var src = '';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '' );

  test.case = 'src - string with space';
  var src = ' ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0 );

  test.case = 'src - string with spaces';
  var src = '   ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0 );

  test.case = 'src - string integer';
  var src = '1';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string BigInt';
  var src = '1n';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '1n' );

  test.case = 'src - string integer with other literals';
  var src = '1 a';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '1 a' );

  test.case = 'src - string integer with other literals';
  var src = '1aa';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '1aa' );

  test.case = 'src - string';
  var src = 'a';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 'a' );

  test.case = 'src - string integer with space after';
  var src = '1 ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with space before';
  var src = ' 1';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with spaces';
  var src = '  1  ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string negative integer';
  var src = '-1';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1 );

  test.case = 'src - string float';
  var src = '1.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1.01 );

  test.case = 'src - string negative float';
  var src = '-1.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1.01 );

  test.case = 'src - string float without 0 before dot';
  var src = '.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0.01 );

  test.case = 'src - string negative float without 0 before dot';
  var src = '-.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = 'NaN';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 'NaN' );

  test.case = 'src - string +0';
  var src = '+0';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, +0 );

  test.case = 'src - string -0';
  var src = '-0';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0 );

  test.case = 'src - string Infinity';
  var src = 'Infinity';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, Infinity );

  test.case = 'src - string -Infinity';
  var src = '-Infinity';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -Infinity );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe( '1', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe( null ) );
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe( [ 1 ] ) );
}

//

function numbersSlice( test )
{

  test.open( 'number' )

  test.case = 'src - number 100';
  var src = 100;
  var got = _.number.s.slice( src );
  test.identical( got, 100 );

  test.case = 'src - number 1.00';
  var src = 1.00;
  var got = _.number.s.slice( src );
  test.identical( got, 1.00 );

  test.case = 'src - number 1.99';
  var src = 1.99;
  var got = _.number.s.slice( src );
  test.identical( got, 1.99 );

  test.close( 'number' )

  /* - */

  test.open( 'array' )

  test.case = 'src - array [ 1, 2, 3 ], no range';
  var src = [ 1, 2, 3 ];
  var got = _.number.s.slice( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ] with range [ 1, 3 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, 1, 3 );
  test.identical( got, [ 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ 1, undefined ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, 1 );
  test.identical( got, [ 2, 3, 4, 5 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ undefined, 3 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, undefined, 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ 0, 0 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, 0, 0 );
  test.identical( got, [] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ -1, 2 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, -1, 2 );
  test.identical( got, [] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ -1, -2 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, -1, -2 );
  test.identical( got, [] );

  test.close( 'array' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.slice() );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.number.s.slice( null ) );
  test.shouldThrowErrorSync( () => _.number.s.slice( '1' ) );
  test.shouldThrowErrorSync( () => _.number.s.slice( [ 1, 2, '3' ] ) );
}

//

function numberRandom( test )
{
  test.case = 'range - 0';
  var got = _.number.random( 0 );
  test.identical( got, 0 );

  test.case = 'range > 0';
  var got = _.number.random( 10 );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range < 0';
  var got = _.number.random( -10 );
  test.ge( got, -10 );
  test.le( got, 0 );

  /* */

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] === 0';
  var got = _.number.random( [ 0, 0 ] );
  test.identical( got, 0 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] > 0';
  var got = _.number.random( [ 10, 10 ] );
  test.identical( got, 10 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] < 0';
  var got = _.number.random( [ -10, -10 ] );
  test.identical( got, -10 );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] >  0';
  var got = _.number.random( [ 0, 10 ] );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] ===  0';
  var got = _.number.random( [ 10, 0 ] );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var got = _.number.random( [ 5, 10 ] );
  test.ge( got, 5 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var got = _.number.random( [ 10, 5 ] );
  test.ge( got, 5 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] <  0';
  var got = _.number.random( [ 0, -10 ] );
  test.ge( got, -10 );
  test.le( got, 0 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] ===  0';
  var got = _.number.random( [ -10, 0 ] );
  test.ge( got, -10 );
  test.le( got, 0 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] > range[ 1 ]';
  var got = _.number.random( [ -5, -10 ] );
  test.ge( got, -10 );
  test.le( got, -5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var got = _.number.random( [ -10, -5 ] );
  test.ge( got, -10 );
  test.le( got, -5 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] < 0';
  var got = _.number.random( [ 5, -10 ] );
  test.ge( got, -10 );
  test.le( got, 5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] > 0';
  var got = _.number.random( [ -10, 5 ] );
  test.ge( got, -10 );
  test.le( got, 5 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.random() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.random( [ 0, 2 ], 'extra' ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.number.random( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.number.random( { a : 1 } ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.number.random( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.number.random( [ 1, 2, 3 ] ) );
}

//

function intRandom( test )
{
  test.case = 'range - 0';
  var got = _.intRandom( 0 );
  test.identical( got, 0 );

  test.case = 'range === 1';
  var got = _.intRandom( 1 );
  test.true( got === 0 || got === 1 );

  test.case = 'range > 0';
  var got = _.intRandom( 10 );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range < 0';
  var got = _.intRandom( -10 );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.true( Math.floor( got ) === got );

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
  test.true( got === 0 || got === 1 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] >  0';
  var got = _.intRandom( [ 0, 10 ] );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] ===  0';
  var got = _.intRandom( [ 10, 0 ] );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 1 ] - range[ 1 ] === 1';
  var got = _.intRandom( [ 5, 6 ] );
  test.true( got === 5 || got === 6 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var got = _.intRandom( [ 5, 10 ] );
  test.ge( got, 5 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var got = _.intRandom( [ 10, 5 ] );
  test.ge( got, 5 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -1';
  var got = _.intRandom( [ 0, -1 ] );
  test.true( got === -1 || got === 0 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] <  0';
  var got = _.intRandom( [ 0, -10 ] );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] ===  0';
  var got = _.intRandom( [ -10, 0 ] );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] - range[ 1 ] === 1';
  var got = _.intRandom( [ -6, -5 ] );
  test.true( got === -6 || got === -5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] > range[ 1 ]';
  var got = _.intRandom( [ -5, -10 ] );
  test.ge( got, -10 );
  test.le( got, -5 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var got = _.intRandom( [ -10, -5 ] );
  test.ge( got, -10 );
  test.le( got, -5 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] < 0';
  var got = _.intRandom( [ 5, -10 ] );
  test.ge( got, -10 );
  test.le( got, 5 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] > 0';
  var got = _.intRandom( [ -10, 5 ] );
  test.ge( got, -10 );
  test.le( got, 5 );
  test.true( Math.floor( got ) === got );

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

//

function numbersMake( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.number.s.make( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.number.s.make( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.number.s.make( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.case = 'num = 1.99, len = 2';
  var got = _.number.s.make( 1.99, 2 );
  test.identical( got, [ 1.99, 1.99 ] );

  test.case = 'num = -1.99999999, len = 3';
  var got = _.number.s.make( -1.99999999, 3 );
  test.identical( got, [ -1.99999999, -1.99999999, -1.99999999 ] );

  test.case = 'num = NaN, len = 3';
  var got = _.number.s.make( NaN, 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'num = Infinity, len = 3';
  var got = _.number.s.make( Infinity, 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'num = -Infinity, len = 3';
  var got = _.number.s.make( -Infinity, 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );


  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.number.s.make( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.number.s.make( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.number.s.make( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.01, -3 ], len = 3';
  var got = _.number.s.make( [ 1.00, 2.01, -3 ], 3 );
  test.identical( got, [ 1.00, 2.01, -3 ] );

  test.case = 'arr = [ NaN, NaN, NaN ], len = 3';
  var got = _.number.s.make( [ NaN, NaN, NaN ], 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'arr = [ Infinity, Infinity, Infinity ], len = 3';
  var got = _.number.s.make( [ Infinity, Infinity, Infinity ], 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'arr = [ -Infinity, -Infinity, -Infinity ], len = 3';
  var got = _.number.s.make( [ -Infinity, -Infinity, -Infinity ], 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );

  test.case = 'arr = [ NaN, Infinity, -Infinity ], len = 3';
  var got = _.number.s.make( [ NaN, Infinity, -Infinity ], 3 );
  test.identical( got, [ NaN, Infinity, -Infinity ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.make() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.make( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.number.s.make( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.number.s.make( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.number.s.make( [ '1', 1, 1 ], 4 ) );

  test.case = 'not number';
  test.shouldThrowErrorSync( () => _.number.s.make( '1', 4 ) );
}

//

function numbersFromNumber( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.number.s.fromNumber( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.number.s.fromNumber( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.number.s.fromNumber( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.case = 'num = 1.99, len = 2';
  var got = _.number.s.fromNumber( 1.99, 2 );
  test.identical( got, [ 1.99, 1.99 ] );

  test.case = 'num = -1.99999999, len = 3';
  var got = _.number.s.fromNumber( -1.99999999, 3 );
  test.identical( got, [ -1.99999999, -1.99999999, -1.99999999 ] );

  test.case = 'num = NaN, len = 3';
  var got = _.number.s.fromNumber( NaN, 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'num = Infinity, len = 3';
  var got = _.number.s.fromNumber( Infinity, 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'num = -Infinity, len = 3';
  var got = _.number.s.fromNumber( -Infinity, 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );


  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.number.s.fromNumber( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.number.s.fromNumber( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.number.s.fromNumber( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.01, -3 ], len = 3';
  var got = _.number.s.fromNumber( [ 1.00, 2.01, -3 ], 3 );
  test.identical( got, [ 1.00, 2.01, -3 ] );

  test.case = 'arr = [ NaN, NaN, NaN ], len = 3';
  var got = _.number.s.fromNumber( [ NaN, NaN, NaN ], 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'arr = [ Infinity, Infinity, Infinity ], len = 3';
  var got = _.number.s.fromNumber( [ Infinity, Infinity, Infinity ], 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'arr = [ -Infinity, -Infinity, -Infinity ], len = 3';
  var got = _.number.s.fromNumber( [ -Infinity, -Infinity, -Infinity ], 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );

  test.case = 'arr = [ NaN, Infinity, -Infinity ], len = 3';
  var got = _.number.s.fromNumber( [ NaN, Infinity, -Infinity ], 3 );
  test.identical( got, [ NaN, Infinity, -Infinity ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( [ '1', 1, 1 ], 4 ) );

  test.case = 'not number';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( '1', 4 ) );
}

//

function numbersFromInt( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.number.s.fromInt( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.number.s.fromInt( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.number.s.fromInt( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.number.s.fromInt( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.number.s.fromInt( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.number.s.fromInt( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.00, -3 ], len = 3';
  var got = _.number.s.fromInt( [ 1.00, 2.00, -3 ], 3 );
  test.identical( got, [ 1.00, 2.00, -3 ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromInt() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( [ '1', 1, 1 ], 4 ) );

  test.case = 'not a number';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( '1', 4 ) );

  test.case = 'not an integer';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( 1.99, 2 ) );
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

    // l0/l3/Number.s

    numberIs,
    numberIsNotNan,
    numberIsFinite,
    numberIsInfinite,
    intIs,
    numbersAreAll,
    numbersAreIdentical,
    numbersAreIdenticalNotStrictly,
    numbersAreEquivalentBasic,
    numbersAreEquivalentOptionAccuracy,
    numbersAreFinite,
    numbersArePositive,
    numbersAreInt,

    // l0/l8/Number.s
    bigIntFrom,

    // l0/l8/Number.s

    numbersTotal,
    numberFrom,
    numbersFrom,
    numberFromStr,
    numberFromStrMaybe,

    numbersSlice,

    numberRandom,
    intRandom,

    numbersMake,
    numbersFromNumber,
    numbersFromInt,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
