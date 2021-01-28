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

  test.case = '2 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( null ) );
  test.true( src1 !== src2 );
  debugger;
  test.identical( src1, src2 );
  debugger;
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  // test.case = '3 levels';
  // var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  // var src2 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  // test.identical( src1, src2 );
  // test.identical( src2, src1 );
  // test.equivalent( src1, src2 );
  // test.equivalent( src2, src1 );

  /* */

}

//

function equal( test )
{

  /* */

  test.case = '2 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( null ) );
  test.true( src1 !== src2 );
  debugger;
  test.identical( src1, src2 );
  debugger;
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  // test.case = '3 levels';
  // var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  // var src2 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  // test.identical( src1, src2 );
  // test.identical( src2, src1 );
  // test.equivalent( src1, src2 );
  // test.equivalent( src2, src1 );

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

    equal,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
