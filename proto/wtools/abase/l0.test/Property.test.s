( function _Property_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

//--
// map checker
//--

function _of( test )
{
  test.case = 'empty';

  var got = _.property.of( {} );
  test.identical( got, {} );

  var got = _.property.of( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.of( { a : 1 } );
  var expected = { a : 1 };
  test.identical( got, expected );

  var a = [];
  a.a = 1;
  var got = _.property.of( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  var got = _.property.of( new Date() );
  var expected = {};
  test.identical( got, expected );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.of( a );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );

  /**/

  var o = { onlyOwn : 1, onlyEnumerable : 1 };
  var got = _.property.of( a, o );
  var expected = { a : 1 };
  test.identical( got, expected );

  /**/

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  var got = _.property.of( a, o );
  var expected = { a : 1, k : 3 };
  test.identical( got, expected );

  /**/

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.of( a, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.true( Object.keys( got ).length > 3 );
  test.true( got.a === 1 );
  test.true( got.b === 2 );
  test.true( got.k === 3 );

  /**/

  var got = _.property.of( new Date(), { onlyEnumerable : 0, onlyOwn : 0 } );
  test.true( Object.keys( got ).length !== 0 );
  test.true( got.constructor.name === 'Date' );
  test.true( _.routine.is( got.getDate ) );
  test.true( _.routine.is( got.toString ) );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.of();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.of( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.of( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.of( { x : 1 }, { 'wrong' : null } );
  });

}

//

function own( test )
{
  test.case = 'empty';

  var got = _.property.onlyOwn( {} );
  test.identical( got, {} );

  var got = _.property.onlyOwn( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.onlyOwn( { a : 1 } );
  var expected = { a : 1 };
  test.identical( got, expected );

  var a = [];
  a.a = 1;
  var got = _.property.onlyOwn( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  var got = _.property.onlyOwn( new Date() );
  var expected = {};
  test.identical( got, expected );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.onlyOwn( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  /**/

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyOwn( a, { onlyEnumerable : 0 } );
  var expected = { a : 1, k : 3 };
  test.identical( got, expected );

  /**/

  var got = _.property.onlyOwn( new Date(), { onlyEnumerable : 0 } );
  test.identical( got, {} )

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwn();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwn( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwn( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwn( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyExplicit( test )
{
  test.case = 'empty';

  var got = _.property.onlyExplicit( {} );
  test.true( Object.keys( got ).length !== 0 )
  test.identical( got.constructor.name, 'Object' );

  var got = _.property.onlyExplicit( [] );
  test.true( Object.keys( got ).length !== 0 )
  test.identical( got.constructor.name, 'Array' );

  /* */

  test.case = 'trivial';

  var got = _.property.onlyExplicit( { a : 1 } );
  test.true( Object.keys( got ).length > 1 )
  test.identical( got.a, 1 );

  var a = [];
  a.a = 1;
  var got = _.property.onlyExplicit( a );
  test.true( Object.keys( got ).length > 1 )
  var expected = { a : 1 };
  test.identical( got.a, 1 );

  var got = _.property.onlyExplicit( new Date() );
  test.true( _.routine.is( got.getDate ) );
  test.identical( got.constructor.name, 'Date' );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.onlyExplicit( a );
  test.true( Object.keys( got ).length > 2 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyExplicit( a );
  test.true( Object.keys( got ).length > 3 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );

  /**/

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : undefined } );
  var got = _.property.onlyExplicit( a );
  test.true( Object.keys( got ).length > 3 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, undefined );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicit();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicit( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicit( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicit( { x : 1 }, { 'wrong' : null } );
  });

}

//

function routines( test )
{
  test.case = 'empty';

  var got = _.property.routines( {} );
  test.identical( got, {} );

  var got = _.property.routines( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.routines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.property.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.a ) );

  var got = _.property.routines( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.c ) );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.c ) );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0 };
  var got = _.property.routines( a, o );
  test.true( Object.keys( got ).length > 1 )
  test.true( _.routine.is( got.c ) );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  /**/

  a.y = function(){}
  var got = _.property.routines( a, { onlyOwn : 1 } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.y ) );

  /* onlyOwn : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  var got = _.property.routines( a, { onlyOwn : 0 } );
  test.true( Object.keys( got ).length === 2 )
  test.true( _.routine.is( got.y ) );
  test.true( _.routine.is( got.c ) );

  /* onlyOwn : 0, enumerable : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  var o = { onlyOwn : 0, onlyEnumerable : 0 };
  var got = _.property.routines( a, o );
  test.true( Object.keys( got ).length > 3 )
  test.true( _.routine.is( got.y ) );
  test.true( _.routine.is( got.c ) );
  test.true( _.routine.is( got.k ) );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.routines();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.routines( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.routines( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.routines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function ownRoutines( test )
{
  test.case = 'empty';

  var got = _.property.onlyOwnRoutines( {} );
  test.identical( got, {} );

  var got = _.property.onlyOwnRoutines( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.onlyOwnRoutines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.property.onlyOwnRoutines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.a ) );

  var got = _.property.routines( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.onlyOwnRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyOwnRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  var a = {};
  var b = {};
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  var got = _.property.onlyOwnRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyOwnRoutines( { enumerable : 0 }, a );
  test.identical( got, {} );

  /* enumerable : 0 */

  var a = {};
  var b = {};
  Object.defineProperty( a, 'k', { enumerable : 0, value : function(){} } );
  var got = _.property.onlyOwnRoutines( a, { onlyEnumerable : 0 } );
  test.identical( got.k, a.k );
  test.true( _.routine.is( got.k ) );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnRoutines();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnRoutines( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnRoutines( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnRoutines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyExplicitRoutines( test )
{
  test.case = 'empty';

  var got = _.property.onlyExplicitRoutines( {} );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  var got = _.property.onlyExplicitRoutines( [] );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  /* */

  test.case = 'trivial';

  var got = _.property.onlyExplicitRoutines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );
  test.true( _.routine.is( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.property.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );
  test.true( _.routine.is( got.a ) );

  var got = _.property.onlyExplicitRoutines( new Date() );
  test.true( Object.keys( got ).length !== 0 );
  test.identical( got.constructor.name, 'Date' );
  test.true( _.routine.is( got.getDate ) );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length > 1 );
  test.true( _.routine.is( got.c ) );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length > 1 );
  test.true( _.routine.is( got.c ) );

  /**/

  Object.defineProperty( a, 'z', { enumerable : 0, value : function(){} } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : function(){} } );
  var got = _.property.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length > 2 );
  test.true( _.routine.is( got.c ) );
  test.true( _.routine.is( got.y ) );
  test.true( _.routine.is( got.z ) );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitRoutines();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitRoutines( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitRoutines( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitRoutines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function fields( test )
{
  test.case = 'empty';

  var got = _.property.fields( {} );
  test.identical( got, {} );

  var got = _.property.fields( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.fields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.a === 1 );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.property.fields( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.b === 1 );

  var got = _.property.fields( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.fields( a );
  test.true( Object.keys( got ).length === 2 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.fields( a );
  test.true( Object.keys( got ).length === 2 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.fields( a, { onlyEnumerable : 0 } );
  test.true( Object.keys( got ).length === 4 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );

  /**/

  a.y = function(){}
  var got = _.property.fields( a, { onlyOwn : 1 } );
  test.true( Object.keys( got ).length === 1 )
  test.identical( got.a, 1 );

  /* onlyOwn : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  var got = _.property.fields( a, { onlyOwn : 0, onlyEnumerable : 1 } );
  test.true( Object.keys( got ).length === 2 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /* enumerable : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  Object.defineProperty( b, 'z', { enumerable : 0, value : 3 } );
  var got = _.property.fields( a, { onlyEnumerable : 0 } );
  test.identical( Object.keys( got ).length, 4 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.z, 3 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.fields();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.fields( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.fields( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.fields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function ownFields( test )
{
  test.case = 'empty';

  var got = _.property.onlyOwnFields( {} );
  test.identical( got, {} );

  var got = _.property.onlyOwnFields( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.onlyOwnFields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.a === 1 );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.property.onlyOwnFields( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.b === 1 );

  var got = _.property.onlyOwnFields( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.property.onlyOwnFields( a );
  test.true( Object.keys( got ).length === 1 );
  test.identical( got.a, 1 );

  /* */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyOwnFields( a );
  test.true( Object.keys( got ).length === 1 );
  test.identical( got.a, 1 );

  /* enumerable : 0 */

  Object.defineProperty( a, 'y', { enumerable : 0, value : 3 } );
  var got = _.property.onlyOwnFields( a, { onlyEnumerable : 0 } );
  test.true( Object.keys( got ).length === 3 )
  test.identical( got.a, 1 );
  test.identical( got.y, 3 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnFields();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnFields( 'x' );
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnFields( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnFields( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyOwnFields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyExplicitFields( test )
{
  test.case = 'empty';

  var got = _.property.onlyExplicitFields( {} );
  test.true( Object.keys( got ).length === 1 )
  test.identical( got.__proto__, {}.__proto__ );

  var got = _.property.onlyExplicitFields( [] );
  test.true( Object.keys( got ).length === 2 )
  test.identical( got.__proto__, [].__proto__ );
  test.identical( got.length, 0 );

  /* */

  test.case = 'trivial';

  var got = _.property.onlyExplicitFields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 2 )
  test.true( got.a === 1 );
  test.true( got.__proto__ === {}.__proto__ );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.property.onlyExplicitFields( a );
  console.log(got);
  test.true( Object.keys( got ).length === 3 )
  test.true( got.length === 0 );
  test.true( got.b === 1 );
  test.true( got.__proto__ === [].__proto__ );

  var str = new Date();
  var got = _.property.onlyExplicitFields( str );
  test.identical( got.__proto__, str.__proto__);

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.onlyExplicitFields( a );
  test.true( Object.keys( got ).length === 3 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.__proto__, b );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.onlyExplicitFields( a );
  test.true( Object.keys( got ).length === 4 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );
  test.identical( got.__proto__, b );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitFields();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitFields( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitFields( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.onlyExplicitFields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyImplicit( test )
{

  /* */

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'polluted map';
  var src = {};
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.escape.prototype, Object.prototype );
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.escape.prototype, prototype );
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'prototyped from pure map';
  var prototype = {};
  var src = Object.create( prototype );
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.escape.prototype, prototype );
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'function';
  var src = function(){};
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.escape.prototype, Object.getPrototypeOf( Function ) );
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'array';
  var src = [];
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.escape.prototype, Array.prototype );
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'arguments array';
  var src = _.argumentsArray.make();
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.escape.prototype, Object.prototype );
  var got = _.property.onlyImplicit( src );
  test.identical( got, exp );

  /* */

}

// --
// define test suite
// --

let Self =
{

  name : 'Tools.Property',
  silencing : 1,

  tests :
  {

    _of,
    own,
    onlyExplicit,

    routines,
    ownRoutines,
    onlyExplicitRoutines,

    fields,
    ownFields,
    onlyExplicitFields,

    onlyImplicit,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
