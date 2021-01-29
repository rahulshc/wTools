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

  // test.case = 'equal, 2 levels';
  // var src1 = _.escape.left( _.escape.left( null ) );
  // var src2 = _.escape.left( _.escape.left( null ) );
  // test.true( src1 === _.escape.null );
  // test.true( src1 === src2 );
  // test.identical( src1, src2 );
  // test.identical( src2, src1 );
  // test.equivalent( src1, src2 );
  // test.equivalent( src2, src1 );
  //
  // /* */
  //
  // test.case = 'equal, 3 levels';
  // var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  // var src2 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  // test.true( src1 !== _.escape.null );
  // test.true( src1 !== src2 );
  // test.true( src1.val.val === src2.val.val );
  // test.true( src1.val.val === _.null );
  // test.identical( src1, src2 );
  // test.identical( src2, src1 );
  // test.equivalent( src1, src2 );
  // test.equivalent( src2, src1 );
  //
  // /* */
  //
  // test.case = 'equal, 4 levels';
  // var src1 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  // var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  // test.true( src1 !== _.escape.null );
  // test.true( src1 !== src2 );
  // test.true( src1.val.val.val === src2.val.val.val );
  // test.true( src1.val.val.val === _.null );
  // test.identical( src1, src2 );
  // test.identical( src2, src1 );
  // test.equivalent( src1, src2 );
  // test.equivalent( src2, src1 );
  //
  // /* */
  //
  // test.case = 'not equal, 2 levels';
  // var src1 = _.escape.left( _.escape.left( null ) );
  // var src2 = _.escape.left( _.escape.left( undefined ) );
  // test.true( src1 === _.escape.null );
  // test.true( src1 !== src2 );
  // test.ni( src1, src2 );
  // test.ni( src2, src1 );
  // test.ne( src1, src2 );
  // test.ne( src2, src1 );

  /* */

  test.case = 'not equal, 3 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( undefined ) ) );
  test.true( src1 !== _.escape.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val !== src2.val.val );
  test.true( src1.val.val === _.null );
  debugger;
  test.ni( src1, src2 );
  // test.ni( src2, src1 );
  // test.ne( src1, src2 );
  // test.ne( src2, src1 );
  debugger;

  /* */

  // test.case = 'not equal, 4 levels';
  // var src1 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  // var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( undefined ) ) ) );
  // test.true( src1 !== _.escape.null );
  // test.true( src1 !== src2 );
  // test.true( src1.val.val.val !== src2.val.val.val );
  // test.true( src1.val.val.val === _.null );
  // test.ni( src1, src2 );
  // test.ni( src2, src1 );
  // test.ne( src1, src2 );
  // test.ne( src2, src1 );
  //
  // /* */
  //
  // test.case = 'not equal, 2 and 4 levels';
  // var src1 = _.escape.left( _.escape.left( null ) );
  // var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( undefined ) ) ) );
  // test.true( src1 !== _.escape.null );
  // test.true( src1 !== src2 );
  // test.true( src1.val.val.val === src2.val.val.val );
  // test.true( src1.val.val.val === _.null );
  // test.ni( src1, src2 );
  // test.ni( src2, src1 );
  // test.ne( src1, src2 );
  // test.ne( src2, src1 );

  /* */

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

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
