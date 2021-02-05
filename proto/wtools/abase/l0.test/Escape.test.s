( function _Escape_test_s_()
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
// implement
// --

function basic( test )
{

  /* */

  test.case = 'number';
  var src = 13;
  var exp = 13;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'null';
  var src = null;
  var exp = _.null;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'undefined';
  var src = undefined;
  var exp = _.undefined;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'nothing';
  var src = _.nothing;
  var exp = _.escape.nothing;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped1 null';
  var src = _.null;
  var exp = _.escape.null;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped1 undefined';
  var src = _.undefined;
  var exp = _.escape.undefined;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped1 nothing';
  var src = _.nothing;
  var exp = _.escape.nothing;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped2 null';
  var src = _.escape.null;
  var exp = new _.Escape( _.escape.null );
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped2 undefined';
  var src = _.escape.undefined;
  var exp = new _.Escape( _.escape.undefined );
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped2 nothing';
  var src = _.escape.nothing;
  var exp = new _.Escape( _.escape.nothing );
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

}

//

function right( test )
{

  /* */

  test.case = 'null';
  var src = null;
  var exp = null;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right === src );

  /* */

  test.case = 'undefined';
  var src = undefined;
  var exp = undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right === src );

  /* */

  test.case = 'number';
  var src = 13;
  var exp = 13;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right === src );

  /* */

  test.case = 'nothing';
  var src = _.nothing;
  var exp = undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped null';
  var src = _.null;
  var exp = null;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped undefined';
  var src = _.undefined;
  var exp = undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped2 null';
  var src = _.escape.null;
  var exp = _.null;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped2 undefined';
  var src = _.escape.undefined;
  var exp = _.undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped2 nothing';
  var src = _.escape.nothing;
  var exp = _.nothing;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

}

//

function equal( test )
{

  /* */

  test.case = 'equal, 2 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( null ) );
  test.true( src1 === _.escape.null );
  test.true( src1 === src2 );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'equal, 3 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  test.true( src1 !== _.escape.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val === src2.val.val );
  test.true( src1.val.val === _.null );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'equal, 4 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  test.true( src1 !== _.escape.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val.val === src2.val.val.val );
  test.true( src1.val.val.val === _.null );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'not equal, 2 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( undefined ) );
  test.true( src1 === _.escape.null );
  test.true( src1 !== src2 );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'not equal, 3 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( undefined ) ) );
  test.true( src1 !== _.escape.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val !== src2.val.val );
  test.true( src1.val.val === _.null );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'not equal, 4 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( undefined ) ) ) );
  test.true( src1 !== _.escape.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val.val !== src2.val.val.val );
  test.true( src1.val.val.val === _.null );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'not equal, 2 and 4 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  test.true( src1 === _.escape.null );
  test.true( src1 !== src2 );
  test.true( src1.val === _.null );
  test.true( src2.val.val.val === _.null );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

}

//

function toStrStandard( test )
{

  /* */

  test.case = 'String( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var got = String( src );
  var exp = `Escape( null )`;
  test.identical( got, exp );

  /* */

  test.case = 'strType( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var got = _.strType( src );
  var exp = `Escape`;
  test.identical( got, exp );

  /* */

  test.case = 'Object.prototype.toString( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var got = Object.prototype.toString.call( src );
  var exp = '[object Escape]';
  test.identical( got, exp );

  /* */

  test.case = 'String( Escape( _.null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var got = String( src );
  var exp = `Escape( Symbol( null ) )`;
  test.identical( got, exp );

  /* */

  test.case = 'strType( Escape( null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var got = _.strType( src );
  var exp = `Escape`;
  test.identical( got, exp );

  /* */

  test.case = 'Object.prototype.toString( Escape( null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var got = Object.prototype.toString.call( src );
  var exp = '[object Escape]';
  test.identical( got, exp );

  /* */

}

//

function is( test )
{

  test.case = '_.null';
  var src = _.null;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.undefined';
  var src = _.undefined;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.nothing';
  var src = _.nothing;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'null';
  var src = null;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'undefined';
  var src = undefined;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'string';
  var src = 'string';
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'number';
  var src = 1;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'boolean';
  var src = true;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'object';
  var src = {};
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

}

//

function make( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.null );
  test.identical( got.val, src );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.undefined );
  test.identical( got.val, src );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.nothing );
  test.identical( got.val, src );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );
  test.identical( _.escape.unwrap( got ), src );

  test.case = 'null';
  var src = null;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

}

//

function from( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.nothing );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = 'null';
  var src = null;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

}

//

function isEscapable( test )
{

  test.case = '_.null';
  var src = _.null;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.undefined';
  var src = _.undefined;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.nothing';
  var src = _.nothing;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'null';
  var src = null;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'undefined';
  var src = undefined;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'string';
  var src = 'string';
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'number';
  var src = 1;
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'boolean';
  var src = true;
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'object';
  var src = {};
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

}

//

function left( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.nothing );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = 'null';
  var src = null;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, _.null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, _.undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}

//

function rightWithNothing( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, undefined );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.null );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.undefined );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 1 );

  test.case = '_.escape.make( \'hello\' )';
  var src = _.escape.make( 'hello' );
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 'hello' );

  test.case = 'null';
  var src = null;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}

//

function rightWithoutNothing( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.null';
  var src = _.escape.null;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.null );

  test.case = '_.escape.undefined';
  var src = _.escape.undefined;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.undefined );

  test.case = '_.escape.nothing';
  var src = _.escape.nothing;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 1 );

  test.case = '_.escape.make( \'hello\' )';
  var src = _.escape.make( 'hello' );
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 'hello' );

  test.case = 'null';
  var src = null;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}

//

function wrap( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.nothing );

  test.case = 'null';
  var src = null;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  /* - */

  test.case = 'already escaped - _.escape.null'
  test.shouldThrowErrorSync( () => _.escape.wrap( _.escape.null ) );

  test.case = 'already escaped - _.escape.make( 1 )'
  test.shouldThrowErrorSync( () => _.escape.wrap( _.escape.make( 1 ) ) );

}


// --
// declare
// --

let Self =
{

  name : 'Tools.Escape',
  silencing : 1,

  tests :
  {

    basic,
    right,
    equal,
    toStrStandard,

    // l3

    is,
    make,
    from,

    // l5

    isEscapable,
    left,
    rightWithNothing,
    rightWithoutNothing,
    wrap,
    // unwrap

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
