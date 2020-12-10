( function _Map_test_s()
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
  test.true( _.routineIs( got.getDate ) );
  test.true( _.routineIs( got.toString ) );

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

  var got = _.property.own( {} );
  test.identical( got, {} );

  var got = _.property.own( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.own( { a : 1 } );
  var expected = { a : 1 };
  test.identical( got, expected );

  var a = [];
  a.a = 1;
  var got = _.property.own( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  var got = _.property.own( new Date() );
  var expected = {};
  test.identical( got, expected );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.own( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  /**/

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.own( a, { onlyEnumerable : 0 } );
  var expected = { a : 1, k : 3 };
  test.identical( got, expected );

  /**/

  var got = _.property.own( new Date(), { onlyEnumerable : 0 } );
  test.identical( got, {} )

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.own();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.own( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.own( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.own( { x : 1 }, { 'wrong' : null } );
  });

}

//

function all( test )
{
  test.case = 'empty';

  var got = _.property.all( {} );
  test.true( Object.keys( got ).length !== 0 )
  test.identical( got.constructor.name, 'Object' );

  var got = _.property.all( [] );
  test.true( Object.keys( got ).length !== 0 )
  test.identical( got.constructor.name, 'Array' );

  /* */

  test.case = 'trivial';

  var got = _.property.all( { a : 1 } );
  test.true( Object.keys( got ).length > 1 )
  test.identical( got.a, 1 );

  var a = [];
  a.a = 1;
  var got = _.property.all( a );
  test.true( Object.keys( got ).length > 1 )
  var expected = { a : 1 };
  test.identical( got.a, 1 );

  var got = _.property.all( new Date() );
  test.true( _.routineIs( got.getDate ) );
  test.identical( got.constructor.name, 'Date' );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.all( a );
  test.true( Object.keys( got ).length > 2 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.all( a );
  test.true( Object.keys( got ).length > 3 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );

  /**/

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : undefined } );
  var got = _.property.all( a );
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
    _.property.all();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.all( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.all( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.all( { x : 1 }, { 'wrong' : null } );
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
  test.true( _.routineIs( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.property.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routineIs( got.a ) );

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
  test.true( _.routineIs( got.c ) );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routineIs( got.c ) );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0 };
  var got = _.property.routines( a, o );
  test.true( Object.keys( got ).length > 1 )
  test.true( _.routineIs( got.c ) );
  test.true( _.routineIs( got.__defineGetter__ ) );
  test.true( _.routineIs( got.__defineSetter__ ) );

  /**/

  a.y = function(){}
  var got = _.property.routines( a, { onlyOwn : 1 } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routineIs( got.y ) );

  /* onlyOwn : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  var got = _.property.routines( a, { onlyOwn : 0 } );
  test.true( Object.keys( got ).length === 2 )
  test.true( _.routineIs( got.y ) );
  test.true( _.routineIs( got.c ) );

  /* onlyOwn : 0, enumerable : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  var o = { onlyOwn : 0, onlyEnumerable : 0 };
  var got = _.property.routines( a, o );
  test.true( Object.keys( got ).length > 3 )
  test.true( _.routineIs( got.y ) );
  test.true( _.routineIs( got.c ) );
  test.true( _.routineIs( got.k ) );
  test.true( _.routineIs( got.__defineGetter__ ) );
  test.true( _.routineIs( got.__defineSetter__ ) );

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

  var got = _.property.ownRoutines( {} );
  test.identical( got, {} );

  var got = _.property.ownRoutines( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.ownRoutines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routineIs( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.property.ownRoutines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routineIs( got.a ) );

  var got = _.property.routines( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.ownRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.ownRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  var a = {};
  var b = {};
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  var got = _.property.ownRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.ownRoutines( { enumerable : 0 }, a );
  test.identical( got, {} );

  /* enumerable : 0 */

  var a = {};
  var b = {};
  Object.defineProperty( a, 'k', { enumerable : 0, value : function(){} } );
  var got = _.property.ownRoutines( a, { onlyEnumerable : 0 } );
  test.identical( got.k, a.k );
  test.true( _.routineIs( got.k ) );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownRoutines();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownRoutines( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownRoutines( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownRoutines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function allRoutines( test )
{
  test.case = 'empty';

  var got = _.property.allRoutines( {} );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routineIs( got.__defineGetter__ ) );
  test.true( _.routineIs( got.__defineSetter__ ) );

  var got = _.property.allRoutines( [] );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routineIs( got.__defineGetter__ ) );
  test.true( _.routineIs( got.__defineSetter__ ) );

  /* */

  test.case = 'trivial';

  var got = _.property.allRoutines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routineIs( got.__defineGetter__ ) );
  test.true( _.routineIs( got.__defineSetter__ ) );
  test.true( _.routineIs( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.property.allRoutines( a );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routineIs( got.__defineGetter__ ) );
  test.true( _.routineIs( got.__defineSetter__ ) );
  test.true( _.routineIs( got.a ) );

  var got = _.property.allRoutines( new Date() );
  test.true( Object.keys( got ).length !== 0 );
  test.identical( got.constructor.name, 'Date' );
  test.true( _.routineIs( got.getDate ) );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.allRoutines( a );
  test.true( Object.keys( got ).length > 1 );
  test.true( _.routineIs( got.c ) );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.allRoutines( a );
  test.true( Object.keys( got ).length > 1 );
  test.true( _.routineIs( got.c ) );

  /**/

  Object.defineProperty( a, 'z', { enumerable : 0, value : function(){} } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : function(){} } );
  var got = _.property.allRoutines( a );
  test.true( Object.keys( got ).length > 2 );
  test.true( _.routineIs( got.c ) );
  test.true( _.routineIs( got.y ) );
  test.true( _.routineIs( got.z ) );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.allRoutines();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.allRoutines( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.allRoutines( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.allRoutines( { x : 1 }, { 'wrong' : null } );
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

  var got = _.property.ownFields( {} );
  test.identical( got, {} );

  var got = _.property.ownFields( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.property.ownFields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.a === 1 );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.property.ownFields( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.b === 1 );

  var got = _.property.ownFields( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.property.ownFields( a );
  test.true( Object.keys( got ).length === 1 );
  test.identical( got.a, 1 );

  /* */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.ownFields( a );
  test.true( Object.keys( got ).length === 1 );
  test.identical( got.a, 1 );

  /* enumerable : 0 */

  Object.defineProperty( a, 'y', { enumerable : 0, value : 3 } );
  var got = _.property.ownFields( a, { onlyEnumerable : 0 } );
  test.true( Object.keys( got ).length === 3 )
  test.identical( got.a, 1 );
  test.identical( got.y, 3 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownFields();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownFields( 'x' );
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownFields( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownFields( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.ownFields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function allFields( test )
{
  test.case = 'empty';

  var got = _.property.allFields( {} );
  test.true( Object.keys( got ).length === 1 )
  test.identical( got.__proto__, {}.__proto__ );

  var got = _.property.allFields( [] );
  test.true( Object.keys( got ).length === 2 )
  test.identical( got.__proto__, [].__proto__ );
  test.identical( got.length, 0 );

  /* */

  test.case = 'trivial';

  var got = _.property.allFields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 2 )
  test.true( got.a === 1 );
  test.true( got.__proto__ === {}.__proto__ );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.property.allFields( a );
  console.log(got);
  test.true( Object.keys( got ).length === 3 )
  test.true( got.length === 0 );
  test.true( got.b === 1 );
  test.true( got.__proto__ === [].__proto__ );

  var str = new Date();
  var got = _.property.allFields( str );
  test.identical( got.__proto__, str.__proto__);

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /**/

  var got = _.property.allFields( a );
  test.true( Object.keys( got ).length === 3 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.__proto__, b );

  /**/

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.property.allFields( a );
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
    _.property.allFields();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.property.allFields( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.property.allFields( 'wrong argument' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.property.allFields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function hashMapExtend( test )
{
  test.case = 'dst - null, src - empty hash map';
  var dst = null;
  var src = new Map();
  var got = _.hashMapExtend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - null, src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.hashMapExtend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - null, src - filled hash map';
  var dst = null;
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - null, src - filled simple map';
  var dst = null;
  var src = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ '1', 1 ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  /* - */

  test.open( 'dst - hash map, src - hash map' );

  test.case = 'dst - empty, src - empty';
  var dst = new Map();
  var src = new Map();
  var got = _.hashMapExtend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = new Map();
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = new Map( [ [ { a : 1 }, { a : 1 } ] ] );
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ { a : 1 }, { a : 1 } ], [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = new Map( [ [ 1, 2 ], [ null, undefined ], [ 'str', '' ], [ undefined, null ], [ '', 'str' ], [ false, true ], [ [ 1 ], [  2 ] ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, 2 ], [ null, undefined ], [ 'str', '' ], [ undefined, null ], [ '', 'str' ], [ false, true ], [ [ 1 ], [ 1 ] ], [ [ 1 ], [  2 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst === src';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = dst;
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got === src );

  test.close( 'dst - hash map, src - hash map' );

  /* - */

  test.open( 'dst - hash map, src - simple map' );

  test.case = 'dst - empty, src - empty';
  var dst = new Map();
  var src = {};
  var got = _.hashMapExtend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = new Map();
  var src = { 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false, '1' : [ 1 ] };
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = new Map( [ [ { a : 1 }, { a : 1 } ] ] );
  var src = { 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false, '1' : [ 1 ] };
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ { a : 1 }, { a : 1 } ], [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = new Map( [ [ 1, [ 1 ] ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ] ] );
  var src = { 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false, '1' : [ 1 ] };
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, [ 1 ] ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ '1', [ 1 ] ], [ 'null', null ], [ 'undefined', undefined ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = { 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true, '1' : 2 };
  var got = _.hashMapExtend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', '' ], [ undefined, undefined ], [ '', 'str' ], [ false, false ], [ [ 1 ], [ 1 ] ], [ '1', 2 ], [ 'null', undefined ], [ 'undefined', null ], [ 'false', true ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.close( 'dst - hash map, src - simple map' );

  /* - */

  test.open( 'dst - simple map, src - hash map' );

  test.case = 'dst - empty, src - empty';
  var dst = {};
  var src = new Map();
  var got = _.hashMapExtend( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = {};
  var src = new Map( [ [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = { a : 1 };
  var src = new Map( [ [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = { 'a' : 1, '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = new Map( [ [ '1', 1 ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = new Map( [ [ '1', [ 1 ] ], [ 'null', undefined ], [ 'str', '' ], [ 'undefined', null ], [ '', 'str' ], [ 'false', true ] ] );
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.close( 'dst - simple map, src - hash map' );

  /* - */

  test.open( 'dst - simple map, src - simple map' );

  test.case = 'dst - empty, src - empty';
  var dst = {};
  var src = {};
  var got = _.hashMapExtend( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = {};
  var src = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = { a : 1 };
  var src = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMapExtend( dst, src );
  var exp = { 'a' : 1, '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = { '1' : [ 1 ], 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true };
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst === src';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = dst;
  var got = _.hashMapExtend( dst, src );
  var exp = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got === src );

  test.close( 'dst - simple map, src - simple map' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.hashMapExtend() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.hashMapExtend( new Map( [ [ 1, 1 ] ] ) ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.hashMapExtend( new Map( [ [ 1, 1 ] ] ), {}, {} ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.hashMapExtend( 'wrong', {} ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.hashMapExtend( new Map( [ [ 1, 2 ] ] ), 'wrong' ) );
  test.shouldThrowErrorSync( () => _.hashMapExtend( null, null ) );

  test.case = 'dst - simple map, src - hash map with unliteral keys';
  test.shouldThrowErrorSync( () => _.hashMapExtend( { a : 1 }, new Map( [ [ 1, 2 ], [ null, null ] ] ) ) );
}

//

function mapOnlyPrimitives( test )
{
  test.case = 'emtpy';

  var got = _.mapOnlyPrimitives( {} )
  test.identical( got, {} );

  test.case = 'primitives';

  var src =
  {
    a : null,
    b : undefined,
    c : 5,
    e : false,
    f : 'a',
    g : function(){},
    h : [ 1 ],
    i : new Date(),
    j : new BufferRaw( 5 )
  }
  var got = _.mapOnlyPrimitives( src );
  var expected =
  {
    a : null,
    b : undefined,
    c : 5,
    e : false,
    f : 'a',
  }
  test.identical( got, expected );

  /* */

  test.case = 'only enumerable';
  var a = {};
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } )
  var got = _.mapOnlyPrimitives( a );
  test.identical( got, {} );

  /* */

  test.case = 'from prototype';
  var a = {};
  var b = { a : 1, c : function(){} };
  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  Object.setPrototypeOf( a, b );
  var got = _.mapOnlyPrimitives( a );
  test.identical( got, { a : 1 } );

  /* */

  if( !Config.debug )
  return;

  test.case = 'invalid arg type';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyPrimitives( null )
  });

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyPrimitives()
  })

}

//

function mapButConditional( test )
{

  test.case = 'an object';
  var got = _.mapButConditional( _.property.filter.dstNotHasSrcPrimitive(), { a : 1, b : 'ab', c : [ 1, 2, 3 ] }, { a : 1, b : 'ab', d : [ 1, 2, 3 ] }  );
  var expected = {};
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional();
  });

  test.case = 'few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional( _.property.mapper.primitive() );
  });

  test.case = 'second argument is wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional( _.property.mapper.primitive(), [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional( 'wrong arguments' );
  });

}

//

function mapButConditionalThreeArguments_( test )
{
  var filter = ( dstContainer, srcContainer, key ) =>
  {
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;
    if( dstContainer === key )
    return false;
    if( _.mapIs( dstContainer ) && key in dstContainer )
    return false;

    return true;
  }
  filter.identity = { propertyFilter : true, propertyTransformer : true };

  /* - */

  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapButConditional_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapButConditional_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, {}, [], {}, [] ) );

  test.case = 'wrong type of propertyFilter';
  test.shouldThrowErrorSync( () => _.mapButConditional_( 'wrong', {}, [] ) );
  test.shouldThrowErrorSync( () => _.mapButConditional_( [], null, {}, {} ) );

  test.case = 'propertyFilter has no PropertyFilter';
  var filter = ( a, b, c ) => a > ( b + c );
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, null, {}, {} ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, 3, [] ) );
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, [], {}, {} ) );

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, [], '' ) );
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, null, [], '' ) );
}

//

function mapButConditionalDstMapNull_( test )
{
  var filter = ( dstContainer, srcContainer, key ) =>
  {
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;
    if( dstContainer === key )
    return false;
    if( _.mapIs( dstContainer ) && key in dstContainer )
    return false;

    return true;
  }
  filter.identity = { propertyFilter : true, propertyTransformer : true };

  /* - */

  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapButConditionalDstMapMap_( test )
{
  var filter = ( dstContainer, srcContainer, key ) =>
  {
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;
    if( dstContainer === key )
    return false;
    if( _.mapIs( dstContainer ) && key in dstContainer )
    return false;

    return true;
  }
  filter.identity = { propertyFilter : true, propertyTransformer : true };

  /* - */

  test.open( 'srcMap - map' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var dstMap = { a : 1, b : 4 };
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 4 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap =[ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ]);
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapBut( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapBut() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapBut( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapBut( [], [], {} ) );

  test.case = 'first argument is not an object-like';
  test.shouldThrowErrorSync( () => _.mapBut( 3, [] ) );

  test.case = 'second argument is not an object-like';
  test.shouldThrowErrorSync( () => _.mapBut( [], '' ) );
}

//

function mapButTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapBut_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapBut_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapBut_( {}, [], {}, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapBut_( 3, [] ) );
  test.shouldThrowErrorSync( () => _.mapBut_( [], {}, {} ) );

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapBut_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapBut_( null, [], '' ) );
}

//

function mapButDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapButDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled map, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled array, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled map, has identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled array, has identical keys';
  var dstMap = { a : 1, b : 4 };
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 4, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled map, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled map, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled array, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapButIgnoringUndefinesThreeArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { 0 : 1, 1 : 2, cc : undefined };
  var screenMap = [ 'aa', 0, 'bb', '1' ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', '1' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : undefined };
  var screenMap = { a : undefined, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : undefined, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = { 0 : 1, b : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { b : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( {}, [], {}, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( 3, [] ) );
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( [], {}, {} ) );

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( null, [], '' ) );
}

//

function mapButIgnoringUndefinesDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { 0 : 1, 1 : 2, cc : undefined };
  var screenMap = [ 'aa', 0, 'bb', '1' ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', '1' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : undefined };
  var screenMap = { a : undefined, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : undefined, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = { 0 : 1, b : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapButIgnoringUndefinesDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : undefined };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : undefined };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : undefined };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : undefined };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : undefined, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { aa : 'some', c : 'key', bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : undefined, bb : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : undefined } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { 0 : 1, bb : 2, cc : undefined };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, bb : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { 0 : 1, bb : 2, cc : undefined } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { a : 1, b : 2, cc : undefined };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : undefined } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var dstMap = { a : 1, b : 4 };
  var srcMap = { a : 1, b : undefined, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 4 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : undefined, cc : undefined } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ undefined, 0, undefined, 1 ];;
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ { 0 : 1 }, [ '3', 'b', '1', '3' ] ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, [ '3', 'b', '1', '3' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapOwnBut( test )
{

  test.case = 'an empty object';
  var got = _.mapOwnBut( {}, {} );
  var expected = {  };
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.mapOwnBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
  var expected = { c : 3 };
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.mapOwnBut( { a : 7, toString : 5 }, { b : 33, c : 77 } );
  var expected = { a : 7 };
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnBut();
  });

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnBut( {} );
  });

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnBut( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnBut( 'wrong arguments' );
  });
}

//

function mapOwnButThreeArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected =Object.create( { bb : 2, cc : 3 } );
  expected.aa = 1;
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'a' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = Object.create( { bb : 2, cc : 3 } );
  expected.aa = 1;
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'aa' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = Object.create( { bb : 2, cc : 3 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ { 'aa' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = { a : 1, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = Object.create( { bb : 2, cc : 3 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 1, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = Object.create( { bb : 2, cc : 3 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 0 : 1 }, { 1 : 2 } ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = { 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, { 1 : 2 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOwnBut_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapOwnBut_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOwnBut_( {}, [], {}, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOwnBut_( 3, [] ) );
  test.shouldThrowErrorSync( () => _.mapOwnBut_( [], {}, {} ) );

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapOwnBut_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOwnBut_( null, [], '' ) );
}

//

function mapOwnButDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = { aa : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = { aa : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'aa' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'aa' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = { a : 1, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 1, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 0 : 1 }, { 1 : 2 } ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = { 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, { 1 : 2 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapOwnButDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 2;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 2, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 2;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 2, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'aa' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'aa' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = { a : 1, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 1, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var dstMap = { 0 : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { bb : 2, 1 : 0, 3 : 1, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 0 : 1 }, { 1 : 2 } ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, { 1 : 2 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapOnly( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var got = _.mapOnly( srcMap );
  var expected = { d : 'name', c : 33, a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var got = _.mapOnly( srcMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnly( {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnly( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnly( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnly( 3, [] ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnly( [], '' ) );
}

//

function mapOnlyTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, screenMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, screenMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, screenMap - map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, screenMap - array';
  var srcMap = null;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var got = _.mapOnly_( srcMap );
  var expected = { d : 'name', c : 33, a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var got = _.mapOnly_( srcMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnly_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnly_( {}, {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnly_( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( {}, 2, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnly_( 'wrong', {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( 2, {}, {} ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnly_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( {}, [], '' ) );
}

//

function mapOnlyDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyOwnTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, screenMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, screenMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, screenMap - map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, screenMap - array';
  var srcMap = null;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var got = _.mapOnlyOwn_( srcMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  expected.a = 'abc';
  test.identical( got, expected );
  test.true( got === srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  expected.a = 'abc';
  test.identical( got, expected );
  test.true( got === srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  expected[ 2 ] = 'abc';
  test.identical( got, expected );
  test.true( got === srcMap );
  test.contains( srcMap, { 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var got = _.mapOnlyOwn_( srcMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( {}, {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( {}, 2, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 'wrong', {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 2, {}, {} ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( {}, [], '' ) );
}

//

function mapOnlyOwnDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { 2 : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyOwnDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { 2 : 'abc', a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyComplementingTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, screenMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, screenMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, screenMap - map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, screenMap - array';
  var srcMap = null;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  expected.a = 'abc';
  expected.b = undefined;
  expected.c = 33;
  expected.d = 'name';
  test.identical( got, expected );
  test.true( got === srcMap );
  test.equivalent( srcMap, { a : 'abc', b : undefined, c : 33, d : 'name' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  expected.a = 'abc';
  expected.b = undefined;
  expected.c = 33;
  expected.d = 'name';
  test.identical( got, expected );
  test.true( got === srcMap );
  test.equivalent( srcMap, { a : 'abc', b : undefined, c : 33, d : 'name' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, Object.create( { d : 'name', c : 33 } ) );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  srcMap.b = undefined;
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = Object.create( { d : 'name', c : 33 } );
  expected[ 2 ] = 'abc';
  expected.b = undefined;
  expected.c = 33;
  expected.d = 'name';
  test.identical( got, expected );
  test.true( got === srcMap );
  test.equivalent( srcMap, { 2 : 'abc', b : undefined, c : 33, d : 'name' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( {}, {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( {}, 2, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 'wrong', {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 2, {}, {} ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( {}, [], '' ) );
}

//

function mapOnlyComplementingDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : undefined, c : 33 } );
  srcMap[ 2 ] = 'abc';
  srcMap.b = undefined;
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { 2 : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { 2 : 'abc', b : undefined } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : undefined } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : undefined } ) ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyComplementingDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { 2 : undefined, b : 2 };
  var srcMap = Object.create( { d : undefined, c : 33 } );
  srcMap[ 2 ] = 'abc';
  srcMap.b = undefined;
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { 2 : 'abc', b : 2, c : 33 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { 2 : 'abc', b : undefined } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : undefined } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : undefined } ) ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function _mapOnly( test )
{

  test.case = 'an object';
  var options = {};
  options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
  options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
  var got = _._mapOnly( options );
  var expected = { a : 33, c : 33, name : 'Mikle' };
  test.identical( got, expected );

  test.case = 'an object2'
  var options = {};
  options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
  options.srcMaps = { d : 'name', c : 33, a : 'abc' };
  var got = _._mapOnly( options );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly();
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly( {}, 'wrong arguments' );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly( 'wrong arguments' );
  });

}

//

function mapsAreIdentical( test )
{

  test.case = 'same values';
  var got = _.mapsAreIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'not the same values in'
  var got = _.mapsAreIdentical( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 14 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the first argument'
  var got = _.mapsAreIdentical( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the second argument'
  var got = _.mapsAreIdentical( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var expected = false;
  test.identical( got, expected );

  /* special cases */

  test.case = 'empty maps, standrard'
  var got = _.mapsAreIdentical( {}, {} );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, pure'
  var got = _.mapsAreIdentical( Object.create( null ), Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, one standard another pure'
  var got = _.mapsAreIdentical( {}, Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  /* bad arguments */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical();
  });

  test.case = 'not object-like arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( [ 'a', 7, 'b', 13 ], [ 'a', 7, 'b', 14 ] );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( 'a', 'b' );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( 1, 3 );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( null, null );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( undefined, undefined );
  });

  test.case = 'too few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( {} );
  });

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( {}, {}, 'redundant argument' );
  });

}

//

function mapContain( test )
{

  test.case = 'first has same keys like second';
  var got = _.mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'in the array';
  var got = _.mapContain( [ 'a', 7, 'b', 13, 'c', 15 ], [ 'a', 7, 'b', 13 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number of keys in first not equal';
  var got = _.mapContain( { a : 1 }, { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapContain();
  });

  test.case = 'few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapContain( {} );
  });

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapContain( {}, {}, 'redundant argument' );
  });

}

//

function objectSatisfy( test )
{
  test.open( 'default option' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( template, src );
  test.identical( got, false );

  test.case = 'template is object, src identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  /* */

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.close( 'default option' );

  /* - */

  test.open( 'levels - 0' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.close( 'levels - 0' );

  /* - */

  test.open( 'levels - -1' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.close( 'levels - -1' );

  /* - */

  test.open( 'levels - 2' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var src = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.close( 'levels - 2' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.objectSatisfy() );

  test.case = 'o.template is not an object or a routine';
  test.shouldThrowErrorSync( () => _.objectSatisfy( 'wrong', { a : 2 } ) );
  test.shouldThrowErrorSync( () => _.objectSatisfy( { template : 'wrong', src : { a : 2 } } ) );

  test.case = 'o.src is undefined';
  test.shouldThrowErrorSync( () => _.objectSatisfy( { a : 2 }, undefined ) );
  test.shouldThrowErrorSync( () => _.objectSatisfy( { template : { a : 2 }, src : undefined } ) );

  test.case = 'map o has wrong fields';
  test.shouldThrowErrorSync( () => _.objectSatisfy( { template : { a : 2 }, wrong : { a : 2 } } ) );
}

//

function objectSatisfyOptionStrict( test )
{
  test.open( 'default option levels' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.close( 'default option levels' );

  /* - */

  test.open( 'levels - 0' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.close( 'levels - 0' );

  /* - */

  test.open( 'levels - -1' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.close( 'levels - -1' );

  /* - */

  test.open( 'levels - 2' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var src = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.close( 'levels - 2' );
}

//

function mapOwnKey( test )
{

  test.case = 'second argument is string';
  var got = _.mapOwnKey( { a : 7, b : 13 }, 'a' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'second argument is object';
  var got = _.mapOwnKey( { a : 7, b : 13 }, Object.create( null ).a = 'a' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'second argument is symbol';
  var symbol = Symbol( 'b' );
  var obj = { a : 7, [ symbol ] : 13 };
  var got = _.mapOwnKey( obj, symbol );
  var expected = true;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.mapOwnKey( Object.create( { a : 7, b : 13 } ), 'a' );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnKey();
  });

  test.case = 'few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnKey( {}, 'a', 'b' );
  });

  test.case = 'wrong type of key';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnKey( [], 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnKey( 1 );
  });

  test.case = 'wrong type of second argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnKey( {}, 13 );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOwnKey( '', 7 );
  });

}

//

function mapHasAll( test )
{
  test.case = 'empty';
  var got = _.mapHasAll( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapHasAll( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapHasAll( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapHasAll( { a : 1, b : 2, c :  3 }, { b : 2 } );
  test.true( got );

  test.case = 'has all';
  var got = _.mapHasAll( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapHasAll( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAll( a, { a : 1 } );
  test.true( got );

  var got = _.mapHasAll( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapHasAll( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAll( a, { a : undefined } );
  test.true( got );

  var got = _.mapHasAll( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapHasAll( {}, { toString : 1 } );
  test.true( got );

  test.case = 'map has on proto';
  var a = {};
  var b = { a : 1 };
  Object.setPrototypeOf( a, b );
  var got = _.mapHasAll( a, { a : 1 } );
  test.true( got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAll( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAll( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAll( {}, {}, {} );
    });
  }

}

//

function mapHasAny( test )
{
  test.case = 'empty';
  var got = _.mapHasAny( {}, {} );
  test.true( !got );

  test.case = 'screen empty';
  var got = _.mapHasAny( { a : 1 }, {} );
  test.true( !got );

  test.case = 'same keys';
  var got = _.mapHasAny( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapHasAny( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( got );

  test.case = 'has all';
  var got = _.mapHasAny( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapHasAny( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( got );

  test.case = 'has no one';
  var got = _.mapHasAny( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAny( a, { a : 1 } );
  test.true( got );

  var got = _.mapHasAny( a, a );
  test.true( !got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapHasAny( src, screen );
  test.true( !got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAny( a, { a : undefined } );
  test.true( got );

  var got = _.mapHasAny( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapHasAny( {}, { x : 1, toString : 1 } );
  test.true( got );

  test.case = 'map has on proto';
  var a = {};
  var b = { a : 1 };
  Object.setPrototypeOf( a, b );
  var got = _.mapHasAny( a, { a : 1, x : 1 } );
  test.true( got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAny( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAny( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAny( {}, {}, {} );
    });
  }

}

//

function mapHasNone( test )
{
  test.case = 'empty';
  var got = _.mapHasNone( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapHasNone( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapHasNone( { a : 1 }, { a : 2 } );
  test.true( !got );

  test.case = 'has only one';
  var got = _.mapHasNone( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( !got );

  test.case = 'has all';
  var got = _.mapHasNone( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( !got );

  test.case = 'one is mising';
  var got = _.mapHasNone( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'has no one';
  var got = _.mapHasNone( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( got );

  test.case = 'src has non enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasNone( a, { a : 1 } );
  test.true( !got );

  var got = _.mapHasNone( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapHasNone( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasNone( a, { a : undefined } );
  test.true( !got );

  var got = _.mapHasNone( { a : undefined }, { a : undefined } );
  test.true( !got );

  test.case = 'src has toString on proto';
  var got = _.mapHasNone( {}, { x : 1, toString : 1 } );
  test.true( !got );

  test.case = 'map has on proto';
  var a = {};
  var b = { a : 1 };
  Object.setPrototypeOf( a, b );

  var got = _.mapHasNone( a, { x : 1 } );
  test.true( got );

  var got = _.mapHasNone( a, { a : 1 } );
  test.true( !got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasNone( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasNone( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasNone( {}, {}, {} );
    });
  }

}

//

function mapOwnAll( test )
{
  test.case = 'empty';
  var got = _.mapOwnAll( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapOwnAll( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapOwnAll( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapOwnAll( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( !got );

  test.case = 'has all';
  var got = _.mapOwnAll( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapOwnAll( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'has no one';
  var got = _.mapOwnAll( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOwnAll( a, { a : 1 } );
  test.true( got );

  var got = _.mapOwnAll( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapOwnAll( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOwnAll( a, { a : undefined } );
  test.true( got );

  var got = _.mapOwnAll( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapOwnAll( {}, { x : 1, toString : 1 } );
  test.true( !got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnAll( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnAll( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnAll( {}, {}, {} );
    });

    test.case = 'src is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOwnAll( a, { a : 1 } );
    });

    test.case = 'screen is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOwnAll( { a : 1 }, a );
    });
  }

}

//

function mapOwnAny( test )
{
  test.case = 'empty';
  var got = _.mapOwnAny( {}, {} );
  test.true( !got );

  test.case = 'screen empty';
  var got = _.mapOwnAny( { a : 1 }, {} );
  test.true( !got );

  test.case = 'same keys';
  var got = _.mapOwnAny( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapOwnAny( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( got );

  test.case = 'has all';
  var got = _.mapOwnAny( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapOwnAny( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( got );

  test.case = 'has no one';
  var got = _.mapOwnAny( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOwnAny( a, { a : 1 } );
  test.true( got );

  var got = _.mapOwnAny( a, a );
  test.true( !got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapOwnAny( src, screen );
  test.true( !got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOwnAny( a, { a : undefined } );
  test.true( got );

  var got = _.mapOwnAny( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapOwnAny( {}, { x : 1, toString : 1 } );
  test.true( !got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnAny( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnAny( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnAny( {}, {}, {} );
    });

    test.case = 'src is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOwnAny( a, { a : 1 } );
    });

    test.case = 'screen is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOwnAny( { a : 1 }, a );
    });
  }

}

//

function mapOwnNone( test )
{
  test.case = 'empty';
  var got = _.mapOwnNone( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapOwnNone( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapOwnNone( { a : 1 }, { a : 2 } );
  test.true( !got );

  test.case = 'has only one';
  var got = _.mapOwnNone( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( !got );

  test.case = 'has all';
  var got = _.mapOwnNone( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( !got );

  test.case = 'one is mising';
  var got = _.mapOwnNone( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'has no one';
  var got = _.mapOwnNone( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOwnNone( a, { a : 1 } );
  test.true( !got );

  var got = _.mapOwnNone( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapOwnNone( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOwnNone( a, { a : undefined } );
  test.true( !got );

  var got = _.mapOwnNone( { a : undefined }, { a : undefined } );
  test.true( !got );

  test.case = 'src has toString on proto';
  var got = _.mapOwnNone( {}, { x : 1, toString : 1 } );
  test.true( got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnNone( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnNone( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapOwnNone( {}, {}, {} );
    });

    test.case = 'src is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOwnNone( a, { a : 1 } );
    });

    test.case = 'screen is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOwnNone( { a : 1 }, a );
    });
  }

}

// --
// sure
// --

function sureMapHasExactly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapHasExactly( srcMap, screenMap ), true );
  test.identical( _.sureMapHasExactly( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapHasExactly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapHasExactly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapHasExactly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasExactly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasExactly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasExactly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasExactly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasExactly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapOwnExactly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapOwnExactly( srcMap, screenMap ), true );
  test.identical( _.sureMapOwnExactly( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapOwnExactly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapOwnExactly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapOwnExactly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnExactly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnExactly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnExactly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnExactly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnExactly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapHasOnly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapHasOnly( srcMap, screenMap ), true );
  test.identical( _.sureMapHasOnly( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapHasOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapHasOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapHasOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapOwnOnly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapOwnOnly( srcMap, screenMap ), true );
  test.identical( _.sureMapOwnOnly( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapOwnOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapOwnOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapOwnOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapHasAll( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapHasAll( srcMap, screenMap ), true );
  test.identical( _.sureMapHasAll( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapHasAll( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapHasAll( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapHasAll( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have fields : "name"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasAll( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "name"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasAll( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "name"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasAll( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "name"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasAll( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "name"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasAll( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapOwnAll( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapOwnAll( srcMap, screenMap ), true );
  test.identical( _.sureMapOwnAll( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapOwnAll( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapOwnAll( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapOwnAll( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn fields : "name"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnAll( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "name"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnAll( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "name"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnAll( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "name"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnAll( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "name"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnAll( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapHasNone( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapHasNone( srcMap, screenMap ), true );
  test.identical( _.sureMapHasNone( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapHasNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapHasNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapHasNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no fields : "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "a", "b", "c"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "a", "b", "c"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapHasNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

//

function sureMapOwnNone( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.sureMapOwnNone( srcMap, screenMap ), true );
  test.identical( _.sureMapOwnNone( srcMap, screenMap, msg ), true );
  test.identical( _.sureMapOwnNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.sureMapOwnNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.sureMapOwnNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn no fields : "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "a", "b", "c"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "a", "b", "c"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.sureMapOwnNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );
}

// --
// assert
// --

function assertMapHasFields( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.assertMapHasFields( srcMap, screenMap ), true );
  test.identical( _.assertMapHasFields( srcMap, screenMap, msg ), true );
  test.identical( _.assertMapHasFields( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.assertMapHasFields( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.assertMapHasFields( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasFields( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasFields( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasFields( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasFields( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasFields( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.assertMapHasFields( srcMap, screenMaps ) );
}

//

function assertMapOwnFields( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.assertMapOwnFields( srcMap, screenMap ), true );
  test.identical( _.assertMapOwnFields( srcMap, screenMap, msg ), true );
  test.identical( _.assertMapOwnFields( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.assertMapOwnFields( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.assertMapOwnFields( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnFields( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnFields( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnFields( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnFields( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnFields( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'different values';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.assertMapOwnFields( srcMap, screenMaps ) );
}

//

function assertMapHasOnly( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.assertMapHasOnly( srcMap, screenMap ), true );
  test.identical( _.assertMapHasOnly( srcMap, screenMap, msg ), true );
  test.identical( _.assertMapHasOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.assertMapHasOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.assertMapHasOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.assertMapHasOnly( srcMap, screenMaps ) );
}

//

function assertMapOwnOnly( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.assertMapOwnOnly( srcMap, screenMap ), true );
  test.identical( _.assertMapOwnOnly( srcMap, screenMap, msg ), true );
  test.identical( _.assertMapOwnOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.assertMapOwnOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.assertMapOwnOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn no fields : "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.assertMapOwnOnly( srcMap, screenMaps ) );
}

//

function assertMapHasNone( test )
{
  var err;

  /* - */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.assertMapHasNone( srcMap, screenMap ), true );
  test.identical( _.assertMapHasNone( srcMap, screenMap, msg ), true );
  test.identical( _.assertMapHasNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.assertMapHasNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.assertMapHasNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no fields : "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "a", "b", "c"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "a", "b", "c"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapHasNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.assertMapHasNone( srcMap, screenMaps ) );
}

//

function assertMapOwnNone( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.assertMapOwnNone( srcMap, screenMap ), true );
  test.identical( _.assertMapOwnNone( srcMap, screenMap, msg ), true );
  test.identical( _.assertMapOwnNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.assertMapOwnNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.assertMapOwnNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should onlyOwn no fields : "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "a", "b", "c"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "a", "b", "c"' ), true );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "a", "b", "c"' ), true );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.assertMapOwnNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects two, three or four arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.assertMapOwnNone( srcMap, screenMaps ) );
}

//

function sureMapHasNoUndefine( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + srcMap.b };
  test.identical( _.sureMapHasNoUndefine( srcMap), true );
  test.identical( _.sureMapHasNoUndefine( srcMap, msg ), true );
  test.identical( _.sureMapHasNoUndefine( srcMap, msg, 'msg' ), true );
  test.identical( _.sureMapHasNoUndefine( srcMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var otherMap = { 'd' : undefined };
  try
  {
    _.sureMapHasNoUndefine( otherMap )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no undefines, but has : "d"' ), true );

  test.case = 'check error message, msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.sureMapHasNoUndefine( otherMap, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var otherMap = { 'd' : undefined };
  try
  {
    _.sureMapHasNoUndefine( otherMap, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.sureMapHasNoUndefine( otherMap, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.sureMapHasNoUndefine( otherMap, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, four or more arguments';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.sureMapHasNoUndefine( srcMap, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects one, two or three arguments' ), true );
}

//

function assertMapHasNoUndefine( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + srcMap.b };
  test.identical( _.assertMapHasNoUndefine( srcMap), true );
  test.identical( _.assertMapHasNoUndefine( srcMap, msg ), true );
  test.identical( _.assertMapHasNoUndefine( srcMap, msg, 'msg' ), true );
  test.identical( _.assertMapHasNoUndefine( srcMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var otherMap = { 'd' : undefined };
  try
  {
    _.assertMapHasNoUndefine( otherMap )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Object should have no undefines, but has : "d"' ), true );

  test.case = 'check error message, msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.assertMapHasNoUndefine( otherMap, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, '90 "d"' ), true );

  test.case = 'check error message, msg string';
  var otherMap = { 'd' : undefined };
  try
  {
    _.assertMapHasNoUndefine( otherMap, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg "d"' ), true );

  test.case = 'check error message, msg string & msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.assertMapHasNoUndefine( otherMap, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'msg 90 "d"' ), true );

  test.case = 'check error message, msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.assertMapHasNoUndefine( otherMap, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'This is explanation "d"' ), true );

  test.case = 'check error message, four or more arguments';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.assertMapHasNoUndefine( srcMap, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( _.strHas( err.message, 'Expects one, two or three arguments' ), true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'map with undefined';
  test.shouldThrowErrorSync( () => _.assertMapHasNoUndefine( { 'd' : undefined } ) );
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
    all,

    routines,
    ownRoutines,
    allRoutines,

    fields,
    ownFields,
    allFields,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
