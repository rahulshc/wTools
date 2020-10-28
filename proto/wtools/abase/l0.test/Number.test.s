/* eslint-disable */
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

  /* - */

  test.case = 'false';
  var got = _.numberIs( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIs( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.numberIs( 2 );
  test.identical( got, true );

  test.case = 'Positive float Number';
  var got = _.numberIs( 2.33 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.numberIs( -2 );
  test.identical( got, true );

  test.case = 'Negative float Number';
  var got = _.numberIs( -2.33 );
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

  /* - */

  test.case = 'empty string';
  var got = _.numberIs( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIs( 'abc' );
  test.identical( got, false );

  test.case = 'String positive Number';
  var got = _.numberIs( '2' );
  test.identical( got, false );

  /* - */

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

  /* - */

  test.case = 'false';
  var got = _.numberIsNotNan( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIsNotNan( true );
  test.identical( got, false );

  /* - */

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

  /* - */

  test.case = 'empty string';
  var got = _.numberIsNotNan( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIsNotNan( 'abc' );
  test.identical( got, false );

  /* - */

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

  /* - */

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

  /* - */

  test.case = 'false';
  var got = _.numberIsFinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIsFinite( true );
  test.identical( got, false );

  /* - */

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

  /* - */

  test.case = 'empty string';
  var got = _.numberIsFinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIsFinite( 'abc' );
  test.identical( got, false );

  /* - */

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

  /* - */

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

  /* - */

  test.case = 'false';
  var got = _.numberIsInfinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.numberIsInfinite( true );
  test.identical( got, false );

  /* - */

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

  /* - */

  test.case = 'empty string';
  var got = _.numberIsInfinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.numberIsInfinite( 'abc' );
  test.identical( got, false );

  /* - */

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

  /* - */

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
  var got = _.numbersAreAll( [] );
  test.identical( got, false );

  /* - */

  test.case = 'array of stings';
  var got = _.numbersAreAll( [ 'a', 'b' ] );
  test.identical( got, false );

  test.case = 'array of stings of numbers';
  var got = _.numbersAreAll( [ '1', '2' ] );
  test.identical( got, false );

  test.case = 'array of stings and numbers';
  var got = _.numbersAreAll( [ 'a', 1 ] );
  test.identical( got, false );

  /* - */

  test.case = 'array of integers';
  var got = _.numbersAreAll( [ 1, 2 ] );
  test.identical( got, true );

  test.case = 'array of floats';
  var got = _.numbersAreAll( [ 1.00, 2.22 ] );
  test.identical( got, true );

  test.case = 'array of special number values';
  var got = _.numbersAreAll( [ Infinity, -Infinity, NaN ] );
  test.identical( got, true );

  /* - */

  test.case = 'Typed array';
  var got = _.numbersAreAll( new I8x([ 1, 2 ]) );
  test.identical( got, true );

  test.case = 'Object of numbers';
  var got = _.numbersAreAll({ '0' : 1, '1' : 2 });
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersAreAll() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersAreAll( [ 1, 2 ], 'extra' ) );

}

//

function numbersAreIdentical( test )
{
  test.case = 'empty strings';
  var got = _.numbersAreIdentical( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.numbersAreIdentical( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.numbersAreIdentical( '1', 1 );
  test.identical( got, false );

  /* - */

  test.case = 'numbers 1 and 1 ';
  var got = _.numbersAreIdentical( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.numbersAreIdentical( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  var got = _.numbersAreIdentical( 1.00000000000001, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.numbersAreIdentical( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.numbersAreIdentical( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.numbersAreIdentical( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.numbersAreIdentical( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.numbersAreIdentical( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.numbersAreIdentical( +0, -0 );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.numbersAreIdentical( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.numbersAreIdentical( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.numbersAreIdentical( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.numbersAreIdentical( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.numbersAreIdentical( NaN, NaN );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersAreIdentical() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersAreIdentical( 1, 2, 'extra' ) );
}

//

function numbersAreIdenticalNotStrictly( test )
{
  test.case = 'empty strings';
  var got = _.numbersAreIdenticalNotStrictly( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.numbersAreIdenticalNotStrictly( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.numbersAreIdenticalNotStrictly( '1', 1 );
  test.identical( got, false );

  /* - */

  test.case = 'numbers 1 and 1';
  var got = _.numbersAreIdenticalNotStrictly( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1';
  var got = _.numbersAreIdenticalNotStrictly( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1';
  var got = _.numbersAreIdenticalNotStrictly( 1.00000000000001, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.2 and 1';
  var got = _.numbersAreIdenticalNotStrictly( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00';
  var got = _.numbersAreIdenticalNotStrictly( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0';
  var got = _.numbersAreIdenticalNotStrictly( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0';
  var got = _.numbersAreIdenticalNotStrictly( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.numbersAreIdenticalNotStrictly( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0';
  var got = _.numbersAreIdenticalNotStrictly( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN';
  var got = _.numbersAreIdenticalNotStrictly( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity';
  var got = _.numbersAreIdenticalNotStrictly( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity';
  var got = _.numbersAreIdenticalNotStrictly( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity';
  var got = _.numbersAreIdenticalNotStrictly( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN';
  var got = _.numbersAreIdenticalNotStrictly( NaN, NaN );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersAreIdenticalNotStrictly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersAreIdenticalNotStrictly( 1, 2, 'extra' ) );
}

//

/* qqq for Yevhen : bad! ask */
function numbersAreEquivalentBasic( test )
{

  test.case = 'empty strings';
  var got = _.numbersAreEquivalent( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.numbersAreEquivalent( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.numbersAreEquivalent( '1', 1 );
  test.identical( got, false );

  test.case = 'numbers 1 and 1 ';
  var got = _.numbersAreEquivalent( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.numbersAreEquivalent( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  var got = _.numbersAreEquivalent( 1.00000000000001, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.numbersAreEquivalent( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.numbersAreEquivalent( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.numbersAreEquivalent( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.numbersAreEquivalent( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.numbersAreEquivalent( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.numbersAreEquivalent( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN ';
  var got = _.numbersAreEquivalent( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.numbersAreEquivalent( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.numbersAreEquivalent( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.numbersAreEquivalent( -Infinity, +Infinity );
  test.identical( got, false );


  /* qqq for Yevhen : extend */

  test.case = 'number 3 and big int 3';
  var got = _.numbersAreEquivalent( 3, 3n );
  test.identical( got, true );
  debugger;
  var got = _.numbersAreEquivalent( 3n, 3 );
  test.identical( got, true );

  test.case = 'number 3 and big int 4';
  var got = _.numbersAreEquivalent( 3, 4n );
  test.identical( got, false );

  test.case = 'bigint 3 and number 4';
  var got = _.numbersAreEquivalent( 3n, 4 );
  test.identical( got, false );

  test.case = 'bigint 3 and number 4.0';
  var got = _.numbersAreEquivalent( 3n, 4.0 );
  test.identical( got, false );

  test.case = 'bigint 3 and number 3.0';
  var got = _.numbersAreEquivalent( 3n, 3.0 );
  test.identical( got, true );

  test.case = 'big int 3 and big int 3';
  var got = _.numbersAreEquivalent( 3n, 3n );
  test.identical( got, true );

  test.case = 'big int 3 and big int 4';
  var got = _.numbersAreEquivalent( 3n, 4n );
  test.identical( got, false );

  test.case = 'big int 3 and big int -3';
  var got = _.numbersAreEquivalent( 3n, -3n );
  test.identical( got, false );

  test.case = 'big int 0 and big int -0';
  var got = _.numbersAreEquivalent( 0n, -0n );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersAreEquivalent() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersAreEquivalent( 1, 2, 0.7, 'extra' ) );

  test.case = 'negative accuracy';
  test.shouldThrowErrorSync( () => _.numbersAreEquivalent( 1, 1, -0.5 ) );

  test.case = 'not a number accuracy';
  test.shouldThrowErrorSync( () => _.numbersAreEquivalent( 1, 1, '-0.5' ) );
}

//

/* qqq for Yevhen : use `/ * * /` as delimeter between cases or nothing, not `//` | aaa : Changed */

function numbersAreEquivalentArgumentAccuracy( test ) /* qqq for Yevhen : bad name, not option, it's argument! | aaa : Fixed */
{
  test.open( 'positive numbers' )

  test.case = 'numbers 1 and 1.0, acc = 0 ';
  var got = _.numbersAreEquivalent( 1, 1.0, 0 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1.04999, acc = 0.05 ';
  var got = _.numbersAreEquivalent( 1.00, 1.04999, 0.05 );
  test.identical( got, true );

  test.case = 'numbers 1 and 1.04999, acc = 0.05 ';
  var got = _.numbersAreEquivalent( 1, 1.04999, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 1 and 2, acc = 1 ';
  var got = _.numbersAreEquivalent( 1, 2, 1 );
  test.identical( got, true );

  test.case = 'numbers 10 and 20, acc = 11 ';
  var got = _.numbersAreEquivalent( 10, 20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 10 and 20.0, acc = 11 ';
  var got = _.numbersAreEquivalent( 10, 20.0, 11 );
  test.identical( got, true );

  test.case = 'numbers 10.0 and 20, acc = 11 ';
  var got = _.numbersAreEquivalent( 10.0, 20, 11 );
  test.identical( got, true );

  test.case = 'numbers 1 and 1.9, acc = 0.9 ';
  var got = _.numbersAreEquivalent( 1, 1.9, 0.9 );
  test.identical( got, true );

  test.case = 'numbers 10 and 20, acc = 11.50 ';
  var got = _.numbersAreEquivalent( 10, 20, 10.00 );
  test.identical( got, true );

  test.case = 'numbers 1 and 0.9, acc = 0.1';
  var got = _.numbersAreEquivalent( 1, 0.9, 0.1 );
  test.identical( got, true );

  test.case = 'numbers 2.5 and 1.5, acc = 1';
  var got = _.numbersAreEquivalent( 2.5, 1.5, 1 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998001, acc = 0.001 ';
  var got = _.numbersAreEquivalent( 0.999, 0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers 0.999 and 0.998, acc = 0.0001 ';
  var got = _.numbersAreEquivalent( 0.999, 0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.000001 ';
  var got = _.numbersAreEquivalent( 0.999999, 0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.0000001 ';
  var got = _.numbersAreEquivalent( 0.999999, 0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers 0.9999999999 and 0.999999999801, acc = 0.0000000001 ';
  var got = _.numbersAreEquivalent( 0.9999999999, 0.999999999801, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.0000000001 ';
  var got = _.numbersAreEquivalent( 0.9999999999, 0.9999999998, 0.0000000001 );
  test.identical( got, false );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.00000000001 ';
  var got = _.numbersAreEquivalent( 0.9999999999, 0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers 0.99999999999 and 0.99999999998001, acc = 0.00000000001 ';
  var got = _.numbersAreEquivalent( 0.99999999999, 0.99999999998001, 0.00000000001 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998, acc = 0 ';
  var got = _.numbersAreEquivalent( 0.999, 0.998, 0 );
  test.identical( got, false );

  test.case = 'numbers 0.999 and 0.999, acc = 0 ';
  var got = _.numbersAreEquivalent( 0.999, 0.999, 0 );
  test.identical( got, true );

  test.case = 'numbers 999 and 999, acc = 0 ';
  var got = _.numbersAreEquivalent( 999, 999, 0 );
  test.identical( got, true );

  test.close( 'positive numbers' );

  /* - */

  test.open( 'negative numbers' )

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.numbersAreEquivalent( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.numbersAreEquivalent( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -1 and -2, acc = 1 ';
  var got = _.numbersAreEquivalent( -1, -2, 1 );
  test.identical( got, true );

  test.case = 'numbers -10 and -20, acc = 11 ';
  var got = _.numbersAreEquivalent( -10, -20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -0.999 and -0.9980001, acc = 0.001 ';
  var got = _.numbersAreEquivalent( -0.999, -0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers -0.999 and -0.998, acc = 0.0001 ';
  var got = _.numbersAreEquivalent( -0.999, -0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.000001 ';
  var got = _.numbersAreEquivalent( -0.999999, -0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.0000001 ';
  var got = _.numbersAreEquivalent( -0.999999, -0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers -0.9999999999 and -0.99999999980001, acc = 0.0000000001 ';
  var got = _.numbersAreEquivalent( -0.9999999999, -0.99999999980001, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers -0.9999999999 and -0.9999999998, acc = 0.00000000001 ';
  var got = _.numbersAreEquivalent( -0.9999999999, -0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers -0.99999999999 and -0.999999999980001, acc = 0.00000000001 ';
  var got = _.numbersAreEquivalent( -0.99999999999, -0.999999999980001, 0.00000000001 );
  test.identical( got, true );

  test.close( 'negative numbers' )

  /* - */

  test.open( 'negative and positive numbers' )

  test.case = 'numbers 10 and -20, acc = 30 ';
  var got = _.numbersAreEquivalent( 10, -20, 30 );
  test.identical( got, true );

  test.case = 'numbers 10 and -20, acc = 10 ';
  var got = _.numbersAreEquivalent( 10, -20, 10 );
  test.identical( got, false );

  test.close( 'negative and positive numbers' )

  /* - */

  test.open( 'big int' )

  /* qqq for Yevhen : extend | aaa : Done*/

  test.case = 'number 3.1 and big int 3, acc 0.10001';
  var got = _.numbersAreEquivalent( 3.1, 3n, 0.10001 );
  test.identical( got, true );
  var got = _.numbersAreEquivalent( 3n, 3.1, 0.10001 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 3n and BIF 2n, acc BIF 1n';
  var got = _.numbersAreEquivalent( 3n, 2n, 1n );
  test.identical( got, true );

  test.case = 'BIF - BigInt( Math.pow( 2, 53 ) - 1 ) and BIF 10n, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 10n';
  var got = _.numbersAreEquivalent( - BigInt( Math.pow( 2, 53 ) - 1 ), 10n, BigInt( Math.pow( 2, 53 ) - 1 ) + 10n );
  test.identical( got, true );

  test.case = 'BIF 4n and BIF 3n, acc FIB 1';
  var got = _.numbersAreEquivalent( 4n, 3n, 1 );
  test.identical( got, true );

  test.case = 'BIF 3n and BIF 2n, acc FOB 1.01';
  var got = _.numbersAreEquivalent( 3n, 2n, 1.01 );
  test.identical( got, true );

  /* */

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 100n, acc BIF 100';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 100n );
  test.identical( got, true );

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) - 1 ) + BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, BigInt( Math.pow( 2, 53 ) - 1 ) + 1n );
  test.identical( got, true );

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 100n, acc FIB 100';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 100 );
  test.identical( got, true );

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 100n, acc FOB 100';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 100.1 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 3n and FIB 2, acc BIF 1';
  var got = _.numbersAreEquivalent( 3n, 2, 1n );
  test.identical( got, true );

  test.case = 'BIF - BigInt( Math.pow( 2, 53 ) - 1 ) and FIB 10, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 10n';
  var got = _.numbersAreEquivalent( - BigInt( Math.pow( 2, 53 ) - 1 ), 10, BigInt( Math.pow( 2, 53 ) - 1 ) + 10n );
  test.identical( got, true );

  test.case = 'BIF 3n and FIB 2, acc FIB 1';
  var got = _.numbersAreEquivalent( 3n, 2, 1 );
  test.identical( got, true );

  test.case = 'BIF 3n and FIB 2, acc FOB 1';
  var got = _.numbersAreEquivalent( 3n, 2, 1.01 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 3n and FOB 2.99, acc BIF 1n';
  var got = _.numbersAreEquivalent( 3n, 2.99, 1n );
  test.identical( got, true );

  test.case = 'BIF -BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB 0.5, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 2n';
  var got = _.numbersAreEquivalent( -BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, 0.5, BigInt( Math.pow( 2, 53 ) - 1 ) + 2n );
  test.identical( got, true );

  test.case = 'BIF 3n and FOB 2.99, acc FIB 1';
  var got = _.numbersAreEquivalent( 3n, 2.99, 1 );
  test.identical( got, true );

  test.case = 'BIF 3n and FOB 2.5, acc FOB 0.5';
  var got = _.numbersAreEquivalent( 3n, 2.5, 0.5 );
  test.identical( got, true );

  /* */

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 200n, acc BIF 100n';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 200n, 100n );
  test.identical( got, true );

  test.case = 'BOF 2n * BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n';
  var got = _.numbersAreEquivalent( 2n * BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 100n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 200n, acc FIB 100';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 200n, 100 );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 200n, acc FOB 100.1';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 200n, 100.1 );
  test.identical( got, true );

  /* */

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB Math.pow( 2, 53 ) - 1, acc BIF 100n';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, Math.pow( 2, 53 ) - 1, 100n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB 99, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 99, BigInt( Math.pow( 2, 53 ) - 1 ) + 1n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB Math.pow( 2, 53 ) - 1, acc FIB 100';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, Math.pow( 2, 53 ) - 1, 100 );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB Math.pow( 2, 53 ) - 1, acc FOB 100.1';
  var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, Math.pow( 2, 53 ) - 1, 100.1 );
  test.identical( got, true );

  /* */

  /* BOF and FOB */
  // test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 52 ) - 1.5 ), acc FOB 1.5';
  // debugger
  //                                   /*        9007199254740992n        */ /* 4503599627370494.5 */ /* 9007199254740992n - 4503599627370494.5 */
  // var got = _.numbersAreEquivalent( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 52 ) - 1.5, 4503599627370497.5 /* BECOMES ROUNDED UP 4503599627370498*/);
  // test.identical( got, true );

  /* ----------- */

  /* */

  test.case = 'FIB 3 and FIB 2, acc BIF 1';
  var got = _.numbersAreEquivalent( 3, 2, 1n );
  test.identical( got, true );

  test.case = 'FIB - Math.pow( 2, 53 ) - 1 and FIB 5, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 5n';
  var got = _.numbersAreEquivalent( - Math.pow( 2, 53 ) - 1, 5, BigInt( Math.pow( 2, 53 ) - 1 ) + 5n );
  test.identical( got, true );

  test.case = 'FIB 3 and FIB 2, acc FIB 1';
  var got = _.numbersAreEquivalent( 3, 2, 1 );
  test.identical( got, true );

  test.case = 'FIB 3 and FIB 2, acc FOB 1';
  var got = _.numbersAreEquivalent( 3, 2, 1.0001 );
  test.identical( got, true );

  /* */

  test.case = 'FIB 3 and FOB 2.99, acc BIF 1n';
  var got = _.numbersAreEquivalent( 3, 2.99, 1n );
  test.identical( got, true );

  test.case = 'FIB - Math.pow( 2, 53 ) - 1 and FOB 4.99, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 5n';
  var got = _.numbersAreEquivalent( - Math.pow( 2, 53 ) - 1, 4.99, BigInt( Math.pow( 2, 53 ) - 1 ) + 5n );
  test.identical( got, true );

  test.case = 'FIB 3 and FOB 2.99, acc FIB 1';
  var got = _.numbersAreEquivalent( 3, 2.99, 1 );
  test.identical( got, true );

  test.case = 'FIB 3 and FOB 2.5, acc FOB 0.5';
  var got = _.numbersAreEquivalent( 3, 2.5, 0.5 );
  test.identical( got, true );

  /* */

  test.case = 'FOB 3.6 and FOB 2.6, acc BIF 1n';
  var got = _.numbersAreEquivalent( 3.6, 2.6, 1n );
  test.identical( got, true );

  test.case = 'FOB - Math.pow( 2, 53 ) - 2.5 and FOB 2.5, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 5n';
  var got = _.numbersAreEquivalent( - Math.pow( 2, 53 ) - 2.5, 2.5, BigInt( Math.pow( 2, 53 ) - 1 ) + 5n );
  test.identical( got, true );

  test.case = 'FOB 3.6 and FOB 2.6, acc FIB 1';
  var got = _.numbersAreEquivalent( 3.6, 2.6, 1 );
  test.identical( got, true );

  test.case = 'FOB 3.6 and FOB 2.5, acc FOB 1.1';
  var got = _.numbersAreEquivalent( 3.6, 2.5, 1.1 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 4 and FOB 3.51, acc FIB 0';
  var got = _.numbersAreEquivalent( 4n, 3.51, 0 );
  test.identical( got, false );

  test.case = 'BIF 4 and FOB 3.95, acc FIB 0';
  var got = _.numbersAreEquivalent( 3n, 3.95, 0 );
  test.identical( got, false );

  test.case = 'BIF 4 and FOB 3.1, acc FIB 0';
  var got = _.numbersAreEquivalent( 4n, 3.1, 0 );
  test.identical( got, false );

  /* Additional */

  // test.case = 'bigint 4 and number 3, acc number 1';
  // var got = _.numbersAreEquivalent( 4n, 3, 1 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3.0, acc number 1';
  // var got = _.numbersAreEquivalent( 4n, 3.0, 1 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3.0, acc bigint 1';
  // var got = _.numbersAreEquivalent( 4n, 3.0, 1n );
  // test.identical( got, true );

  // test.case = 'bigint 4 and bigint 3, acc number 1';
  // var got = _.numbersAreEquivalent( 4n, 3n, 1 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and bigint 3, acc number 1.0';
  // var got = _.numbersAreEquivalent( 4n, 3n, 1.01 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3.5, acc number 0.5';
  // var got = _.numbersAreEquivalent( 4n, 3.5, 0.5 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3, acc number 1.01';
  // var got = _.numbersAreEquivalent( 4n, 3, 1.01 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3, acc bigint 1';
  // var got = _.numbersAreEquivalent( 4n, 3, 1n );
  // test.identical( got, true );

  // test.case = 'number 4 and number 3, acc bigint 1';
  // var got = _.numbersAreEquivalent( 4, 3, 1n );
  // test.identical( got, true );

  // test.case = 'number 4 and number 3.0, acc bigint 1';
  // var got = _.numbersAreEquivalent( 4, 3.0, 1n );
  // test.identical( got, true );

  // test.case = 'number 4.5 and number 3.5, acc bigint 1';
  // var got = _.numbersAreEquivalent( 4.5, 3.5, 1n );
  // test.identical( got, true );

  // test.case = 'bigint 4 and bigint 3, acc bigint 1';
  // var got = _.numbersAreEquivalent( 4n, 3n, 1n );
  // test.identical( got, true );

  /* */

  test.close( 'big int' )

}

//

function numbersAreFinite( test )
{

  test.case = 'empty array';
  var got = _.numbersAreFinite([]);
  test.identical( got, false );

  test.open( 'strings, numbers' )

  test.case = 'numbers 1, 1, string 1 ';
  var got = _.numbersAreFinite([ 1, 1, '1' ]);
  test.identical( got, false );

  test.case = 'strings 1, 1, -1 ';
  var got = _.numbersAreFinite([ '1', '1', '-1' ]);
  test.identical( got, false );

  test.close( 'strings, numbers' )

  /* - */

  test.open( 'numbers' )

  test.case = 'array 1, 1, -1 ';
  var got = _.numbersAreFinite([ 1, 1, -1 ]);
  test.identical( got, true );

  test.case = 'array 1.2, 0.9999, -1 ';
  var got = _.numbersAreFinite([ 1.2, 0.9999, -1 ]);
  test.identical( got, true );

  test.case = 'array 1, 1, NaN ';
  var got = _.numbersAreFinite([ 1, 1, NaN ]);
  test.identical( got, false );

  test.case = 'array NaN, NaN, NaN ';
  var got = _.numbersAreFinite([ NaN, NaN, NaN ]);
  test.identical( got, false );

  test.case = 'array 1, 1, Infinity ';
  var got = _.numbersAreFinite([ 1, 1, Infinity ]);
  test.identical( got, false );

  test.case = 'array 1, 1, -Infinity ';
  var got = _.numbersAreFinite([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.close( 'numbers' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersAreFinite() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersAreFinite( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function numbersArePositive( test )
{
  test.case = '1 1 1';
  var got = _.numbersArePositive([ 1, 1, 1 ]);
  test.identical( got, true );

  test.case = '-1 1 1';
  var got = _.numbersArePositive([ -1, 1, 1 ]);
  test.identical( got, false );

  test.case = '1 1 -Infinity';
  var got = _.numbersArePositive([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.case = '1 1 Infinity';
  var got = _.numbersArePositive([ 1, 1, Infinity ]);
  test.identical( got, true );

  test.case = '1 1 -0 ';
  var got = _.numbersArePositive([ 1, 1, -0 ]);
  test.identical( got, true );

  test.case = '1 1 0 ';
  var got = _.numbersArePositive([ 1, 1, 0 ]);
  test.identical( got, true );

  test.case = '-0.000000000000000000001 1 0 ';
  var got = _.numbersArePositive([ -0.000000000000000000001, 1, 0 ]);
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersArePositive() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersArePositive( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function numbersAreInt( test )
{
  test.case = '1 1 1';
  var got = _.numbersAreInt([ 1, 1, 1 ]);
  test.identical( got, true );

  test.case = '-1 1 1';
  var got = _.numbersAreInt([ -1, 1, 1 ]);
  test.identical( got, true );

  //

  test.case = '1 1 -Infinity';
  var got = _.numbersAreInt([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.case = '1 1 Infinity';
  var got = _.numbersAreInt([ 1, 1, Infinity ]);
  test.identical( got, false );

  test.case = '1 1 NaN';
  var got = _.numbersAreInt([ 1, 1, NaN ]);
  test.identical( got, false );

  //

  test.case = '1.00 1 0.00 ';
  var got = _.numbersAreInt([ 1.00, 1, 0.00 ]);
  test.identical( got, true );

  test.case = '1.1 1 0 ';
  var got = _.numbersAreInt([ 1.1, 1, 0 ]);
  test.identical( got, false );

  test.case = '0.000000000000000000001 1 0 ';
  var got = _.numbersAreInt([ 0.000000000000000000001, 1, 0 ]);
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersAreInt() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersAreInt( [ 1, 2, 0.7 ], 'extra' ) );
}


//--
// l0/l5/fNumber.s
//--

function bigIntFrom( test )
{
  test.open( 'numbers' );

  test.case = '1';
  var got = _.bigIntFrom( 1 );
  test.identical( got, 1n );

  test.case = '-1';
  var got = _.bigIntFrom( -1 );
  test.identical( got, -1n );

  test.case = '-10000000000';
  var got = _.bigIntFrom( -10000000000 );
  test.identical( got, -10000000000n );

  test.case = '1e5';
  var got = _.bigIntFrom( 1e5 );
  test.identical( got, 100000n );

  test.case = '100000000000000000000';
  var got = _.bigIntFrom( 100000000000000000000 );
  test.identical( got, 100000000000000000000n );

  test.case = '1e10';
  var got = _.bigIntFrom( 1e10 );
  test.identical( got, 10000000000n );

  test.close( 'numbers' );

  /* - */

  test.open( 'string' );

  test.case = '1';
  var got = _.bigIntFrom( '1' );
  test.identical( got, 1n );

  test.case = '100000';
  var got = _.bigIntFrom( '100000' );
  test.identical( got, 100000n );

  test.case = '-10000';
  var got = _.bigIntFrom( '-10000' );
  test.identical( got, -10000n );

  test.close( 'string' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bigIntFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bigIntFrom( 1, 'extra' ) );

  test.case = 'not a number or string argument';
  test.shouldThrowErrorSync( () => _.bigIntFrom( {} ) );
}

//--
// l0/l8/gNumber.s
//--

function numbersTotal( test )
{

  test.case = 'empty array';
  var got = _.numbersTotal([]);
  test.identical( got, 0 );

  /* - */

  test.open( 'number input' )

  test.case = 'input 1, 2, 3';
  var got = _.numbersTotal([ 1, 2, 3 ]);
  test.identical( got, 6 );

  test.case = 'input 1000, 200, 3';
  var got = _.numbersTotal([ 1000, 200, 3 ]);
  test.identical( got, 1203 );

  test.case = 'input 1.00, 2.00, 3.00';
  var got = _.numbersTotal([ 1.00, 2.00, 3.00 ]);
  test.identical( got, 6 );

  test.case = 'input 1.50, 2.50, 3';
  var got = _.numbersTotal([ 1.50, 2.50, 3 ]);
  test.identical( got, 7 );

  test.case = 'input 1.55, 2.55, 3.05';
  var got = _.numbersTotal([ 1.55, 2.55, 3.05 ]);
  test.et( got, 7.15 );

  test.case = 'input 1.555, 2.555, 3.111';
  var got = _.numbersTotal([ 1.555, 2.555, 3.111 ]);
  test.identical( got, 7.221 );

  test.case = 'input 1.5555, 2.555, 3.11';
  var got = _.numbersTotal([ 1.5555, 2.555, 3.11 ]);
  test.et( got, 7.2205 );

  test.case = 'input 1, 1, 0.99999999999999999999999';
  var got = _.numbersTotal([ 1, 1, 0.99999999999999999999999 ]);
  test.et( got, 2.99999999999999999999999 );

  test.close( 'number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersTotal() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersTotal( [ 1, 2, 0.7 ], 'extra' ) );

  test.case = 'input : \'a\', \'b\'';
  test.shouldThrowErrorSync( () => _.numbersTotal([ 'a', 'b' ] ) );

  test.case = 'input : \'1\', \'2\', \'3\'';
  test.shouldThrowErrorSync( () => _.numbersTotal([ '1', '2', '3' ]) );

  test.case = 'input : 1, 2, \'3\'';
  test.shouldThrowErrorSync( () => _.numbersTotal([ 1, 2, '3' ]) );
}

//

function numberFrom( test )
{
  test.case = 'null';
  var got = _.numberFrom( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.numberFrom( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.numberFrom( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.numberFrom( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.numberFrom( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.numberFrom( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.numberFrom( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.numberFrom( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.numberFrom( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.numberFrom( '12' );
  test.identical( got, 12 );

  test.case = 'string with floating point digit symbols';
  var got = _.numberFrom( '12.33' );
  test.identical( got, 12.33 );

  test.case = 'Set';
  var got = _.numberFrom( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.numberFrom( new Map() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.numberFrom( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.numberFrom( src );
  test.identical( got, 0 );

  test.case = 'empty object';
  var src = {};
  var got = _.numberFrom( src );
  test.identical( got, NaN );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.numberFrom( src );
  test.identical( got, NaN );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.numberFrom( src );
  test.identical( got, 0 );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.numberFrom( src );
  test.identical( got, NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numberFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numberFrom( [ 1, 2, 0.7 ], 'extra' ) );
}

//

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

function numberFromStr( test )
{
  test.case = 'src - empty string';
  var src = '';
  var got = _.numberFromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string with space';
  var src = ' ';
  var got = _.numberFromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string integer';
  var src = '1';
  var got = _.numberFromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with other literals';
  var src = '1 a';
  var got = _.numberFromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with other literals';
  var src = '1aa';
  var got = _.numberFromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string';
  var src = 'a';
  var got = _.numberFromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string';
  var src = 'a1';
  var got = _.numberFromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string integer with space after';
  var src = '1 ';
  var got = _.numberFromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with space before';
  var src = ' 1';
  var got = _.numberFromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with spaces';
  var src = '  1  ';
  var got = _.numberFromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string negative integer';
  var src = '-1';
  var got = _.numberFromStr( src );
  test.identical( got, -1 );

  test.case = 'src - string float';
  var src = '1.01';
  var got = _.numberFromStr( src );
  test.identical( got, 1.01 );

  test.case = 'src - string negative float';
  var src = '-1.01';
  var got = _.numberFromStr( src );
  test.identical( got, -1.01 );

  test.case = 'src - string float without 0 before dot';
  var src = '.01';
  var got = _.numberFromStr( src );
  test.identical( got, 0.01 );

  test.case = 'src - string negative float without 0 before dot';
  var src = '-.01';
  var got = _.numberFromStr( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = 'NaN';
  var got = _.numberFromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string +0';
  var src = '+0';
  var got = _.numberFromStr( src );
  test.identical( got, +0 );

  test.case = 'src - string -0';
  var src = '-0';
  var got = _.numberFromStr( src );
  test.identical( got, -0 );

  test.case = 'src - string Infinity';
  var src = 'Infinity';
  var got = _.numberFromStr( src );
  test.identical( got, Infinity );

  test.case = 'src - string -Infinity';
  var src = '-Infinity';
  var got = _.numberFromStr( src );
  test.identical( got, -Infinity );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numberFromStr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numberFromStr( '1', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.numberFromStr( null ) );
  test.shouldThrowErrorSync( () => _.numberFromStr( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.numberFromStr( 1 ) );
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

function numbersSlice( test )
{

  test.open( 'number' )

  test.case = 'src - number 100';
  var src = 100;
  var got = _.numbersSlice( src );
  test.identical( got, 100 );

  test.case = 'src - number 1.00';
  var src = 1.00;
  var got = _.numbersSlice( src );
  test.identical( got, 1.00 );

  test.case = 'src - number 1.99';
  var src = 1.99;
  var got = _.numbersSlice( src );
  test.identical( got, 1.99 );

  test.close( 'number' )

  /* - */

  test.open( 'array' )

  test.case = 'src - array [ 1, 2, 3 ], no range';
  var src = [ 1, 2, 3 ];
  var got = _.numbersSlice( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ] with range [ 1, 3 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.numbersSlice( src, 1, 3 );
  test.identical( got, [ 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ 1, undefined ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.numbersSlice( src, 1 );
  test.identical( got, [ 2, 3, 4, 5 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ undefined, 3 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.numbersSlice( src, undefined, 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ 0, 0 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.numbersSlice( src, 0, 0 );
  test.identical( got, [] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ -1, 2 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.numbersSlice( src, -1, 2 );
  test.identical( got, [] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ -1, -2 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.numbersSlice( src, -1, -2 );
  test.identical( got, [] );

  test.close( 'array' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersSlice() );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.numbersSlice( null ) );
  test.shouldThrowErrorSync( () => _.numbersSlice( '1' ) );
  test.shouldThrowErrorSync( () => _.numbersSlice( [ 1, 2, '3' ] ) );
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

//

function numbersMake( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.numbersMake( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.numbersMake( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.numbersMake( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.case = 'num = 1.99, len = 2';
  var got = _.numbersMake( 1.99, 2 );
  test.identical( got, [ 1.99, 1.99 ] );

  test.case = 'num = -1.99999999, len = 3';
  var got = _.numbersMake( -1.99999999, 3 );
  test.identical( got, [ -1.99999999, -1.99999999, -1.99999999 ] );

  test.case = 'num = NaN, len = 3';
  var got = _.numbersMake( NaN, 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'num = Infinity, len = 3';
  var got = _.numbersMake( Infinity, 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'num = -Infinity, len = 3';
  var got = _.numbersMake( -Infinity, 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );


  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.numbersMake( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.numbersMake( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.numbersMake( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.01, -3 ], len = 3';
  var got = _.numbersMake( [ 1.00, 2.01, -3 ], 3 );
  test.identical( got, [ 1.00, 2.01, -3 ] );

  test.case = 'arr = [ NaN, NaN, NaN ], len = 3';
  var got = _.numbersMake( [ NaN, NaN, NaN ], 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'arr = [ Infinity, Infinity, Infinity ], len = 3';
  var got = _.numbersMake( [ Infinity, Infinity, Infinity ], 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'arr = [ -Infinity, -Infinity, -Infinity ], len = 3';
  var got = _.numbersMake( [ -Infinity, -Infinity, -Infinity ], 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );

  test.case = 'arr = [ NaN, Infinity, -Infinity ], len = 3';
  var got = _.numbersMake( [ NaN, Infinity, -Infinity ], 3 );
  test.identical( got, [ NaN, Infinity, -Infinity ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersMake() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersMake( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.numbersMake( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.numbersMake( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.numbersMake( [ '1', 1, 1 ], 4 ) );

  test.case = 'not number';
  test.shouldThrowErrorSync( () => _.numbersMake( '1', 4 ) );
}

//

function numbersFromNumber( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.numbersFromNumber( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.numbersFromNumber( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.numbersFromNumber( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.case = 'num = 1.99, len = 2';
  var got = _.numbersFromNumber( 1.99, 2 );
  test.identical( got, [ 1.99, 1.99 ] );

  test.case = 'num = -1.99999999, len = 3';
  var got = _.numbersFromNumber( -1.99999999, 3 );
  test.identical( got, [ -1.99999999, -1.99999999, -1.99999999 ] );

  test.case = 'num = NaN, len = 3';
  var got = _.numbersFromNumber( NaN, 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'num = Infinity, len = 3';
  var got = _.numbersFromNumber( Infinity, 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'num = -Infinity, len = 3';
  var got = _.numbersFromNumber( -Infinity, 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );


  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.numbersFromNumber( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.numbersFromNumber( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.numbersFromNumber( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.01, -3 ], len = 3';
  var got = _.numbersFromNumber( [ 1.00, 2.01, -3 ], 3 );
  test.identical( got, [ 1.00, 2.01, -3 ] );

  test.case = 'arr = [ NaN, NaN, NaN ], len = 3';
  var got = _.numbersFromNumber( [ NaN, NaN, NaN ], 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'arr = [ Infinity, Infinity, Infinity ], len = 3';
  var got = _.numbersFromNumber( [ Infinity, Infinity, Infinity ], 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'arr = [ -Infinity, -Infinity, -Infinity ], len = 3';
  var got = _.numbersFromNumber( [ -Infinity, -Infinity, -Infinity ], 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );

  test.case = 'arr = [ NaN, Infinity, -Infinity ], len = 3';
  var got = _.numbersFromNumber( [ NaN, Infinity, -Infinity ], 3 );
  test.identical( got, [ NaN, Infinity, -Infinity ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersFromNumber() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersFromNumber( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.numbersFromNumber( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.numbersFromNumber( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.numbersFromNumber( [ '1', 1, 1 ], 4 ) );

  test.case = 'not number';
  test.shouldThrowErrorSync( () => _.numbersFromNumber( '1', 4 ) );
}

//

function numbersFromInt( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.numbersFromInt( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.numbersFromInt( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.numbersFromInt( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.numbersFromInt( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.numbersFromInt( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.numbersFromInt( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.00, -3 ], len = 3';
  var got = _.numbersFromInt( [ 1.00, 2.00, -3 ], 3 );
  test.identical( got, [ 1.00, 2.00, -3 ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersFromInt() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersFromInt( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.numbersFromInt( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.numbersFromInt( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.numbersFromInt( [ '1', 1, 1 ], 4 ) );

  test.case = 'not a number';
  test.shouldThrowErrorSync( () => _.numbersFromInt( '1', 4 ) );

  test.case = 'not an integer';
  test.shouldThrowErrorSync( () => _.numbersFromInt( 1.99, 2 ) );
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
    numbersAreAll,
    numbersAreIdentical,
    numbersAreIdenticalNotStrictly,
    numbersAreEquivalentBasic,
    numbersAreEquivalentArgumentAccuracy,
    numbersAreFinite,
    numbersArePositive,
    numbersAreInt,

    // l0/l8/gNumber.s
    bigIntFrom,

    // l0/l8/gNumber.s

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
