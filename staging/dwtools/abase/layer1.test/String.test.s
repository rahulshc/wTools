( function _String_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

}
var _global = _global_;
var _ = _global_.wTools;

//

function strBeginOf( test )
{
  var got,expected;

  //

  test.case = 'strBeginOf';

  /**/

  got = _.strBeginOf( 'abc', '' );
  expected = 'abc';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', 'c' );
  expected = 'ab';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', 'bc' );
  expected = 'a';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', ' c' );
  expected = undefined;
  test.identical( got,expected )

  /* end.length > src.length */

  got = _.strBeginOf( 'abc', 'abcd' );
  expected = undefined;
  test.identical( got,expected )

  /* same length, not equal*/

  got = _.strBeginOf( 'abc', 'cba' );
  expected = undefined;
  test.identical( got,expected )

  /* equal */

  got = _.strBeginOf( 'abc', 'abc' );
  expected = '';
  test.identical( got,expected )

  /* array */

  got = _.strBeginOf( 'abc', [] );
  expected = undefined;
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', [ '' ] );
  expected = 'abc';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abccc', [ 'c', 'ccc' ] );
  expected = 'abcc';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', [ 'a', 'ab', 'abc' ] );
  expected = '';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', [ 'x', 'y', 'c' ] );
  expected = 'ab';
  test.identical( got,expected )

  /**/

  got = _.strBeginOf( 'abc', [ 'x', 'y', 'z' ] );
  expected = undefined;
  test.identical( got,expected )

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strBeginOf( 1, '' ) );
  test.shouldThrowError( () => _.strBeginOf( 'abc', 1 ) );
  test.shouldThrowError( () => _.strBeginOf() );
  test.shouldThrowError( () => _.strBeginOf( undefined, undefined ) );
  test.shouldThrowError( () => _.strBeginOf( null, null ) );
}

//

function strEndOf( test )
{
  var got,expected;

  //

  test.case = 'strEndOf';

  /**/

  got = _.strEndOf( 'abc', '' );
  expected = 'abc';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', 'a' );
  expected = 'bc';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', 'ab' );
  expected = 'c';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', ' a' );
  expected = undefined;
  test.identical( got,expected )

  /* end.length > src.length */

  got = _.strEndOf( 'abc', 'abcd' );
  expected = undefined;
  test.identical( got,expected )

  /* same length */

  got = _.strEndOf( 'abc', 'cba' );
  expected = undefined;
  test.identical( got,expected )

  /* equal */

  got = _.strEndOf( 'abc', 'abc' );
  expected = '';
  test.identical( got,expected )

  /* array */

  got = _.strEndOf( 'abc', [] );
  expected = undefined;
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', [ '' ] );
  expected = 'abc';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abccc', [ 'a', 'ab' ] );
  expected = 'bccc';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', [ 'ab', 'abc' ] );
  expected = 'c';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', [ 'x', 'y', 'a' ] );
  expected = 'bc';
  test.identical( got,expected )

  /**/

  got = _.strEndOf( 'abc', [ 'x', 'y', 'z' ] );
  expected = undefined;
  test.identical( got,expected )

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strEndOf( 1, '' ) );
  test.shouldThrowError( () => _.strEndOf( 'abc', 1 ) );
  test.shouldThrowError( () => _.strEndOf() );
  test.shouldThrowError( () => _.strEndOf( undefined, undefined ) );
  test.shouldThrowError( () => _.strEndOf( null, null ) );

}

//

function strFindInsideOf( test )
{
  var got,expected;

  //

  test.case = 'strFindInsideOf';

  /**/

  got = _.strFindInsideOf( '', '', '' );
  expected = undefined;
  test.identical( got, expected );

  /**/

  got = _.strFindInsideOf( 'abc', 'a', 'c' );
  expected = 'b';
  test.identical( got, expected );

  /*firs of begin, last of end*/

  got = _.strFindInsideOf( 'aaabccc', 'a', 'c' );
  expected = 'aabcc';
  test.identical( got, expected );

  /* f > l */

  got = _.strFindInsideOf( 'aaabccc', 'c', 'a' );
  expected = undefined;
  test.identical( got, expected );

  /* begin === end, string contains several of it */

  got = _.strFindInsideOf( 'aaabccc', 'a', 'a' );
  expected = 'a';
  test.identical( got, expected );

  /* begin === end, string contains single */

  got = _.strFindInsideOf( 'abc', 'a', 'a' );
  expected = undefined;
  test.identical( got, expected );

  /**/

  got = _.strFindInsideOf( 'aaabbbccc', [ 'a', 'b' ], [ 'b', 'c' ] );
  expected = 'aabb';
  test.identical( got, expected );

  /**/

  got = _.strFindInsideOf( 'abc', [ 'x','y', 'c' ], 'c' );
  expected = undefined;
  test.identical( got, expected );

  /**/

  got = _.strFindInsideOf( 'abbccc', [ 'b' ], '' );
  expected = 'bccc';
  test.identical( got, expected );

  test.shouldThrowError( () => _.strFindInsideOf( 1, '', '' ) );
  test.shouldThrowError( () => _.strFindInsideOf( 'a', 1, '' ) );
  test.shouldThrowError( () => _.strFindInsideOf( 'a', '', 1 ) );
}

//

function strBegins( test )
{
  var got, expected;

  //

  test.case = 'strBegins';

  /**/

  got = _.strBegins( '', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'a', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'a', 'a' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'a', 'b' );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', 'ab' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', 'abc' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', ' a' );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [ 'x', 'y', 'ab' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [ '' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [] );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [ '1', 'b', 'a' ] );
  expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strBegins( 1, '' ) );
  test.shouldThrowError( () => _.strBegins( 'a', 1 ) );
  test.shouldThrowError( () => _.strBegins( 'abc', [ 1, 'b', 'a' ] ) );

}

//

function strEnds( test )
{
  var got, expected;

  //

  test.case = 'strEnds';

  /**/

  got = _.strEnds( '', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'a', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'a', 'a' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'a', 'b' );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', 'bc' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', 'abc' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [ 'x', 'y', 'bc' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [ '' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [] );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [ 1, 'b', 'c' ] );
  expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strEnds( 1, '' ) );
  test.shouldThrowError( () => _.strEnds( 'a', 1 ) );
}

//

var Self =
{

  name : 'Tools/base/layer1/String',
  silencing : 1,

  tests :
  {

    strBeginOf : strBeginOf,
    strEndOf : strEndOf,
    strFindInsideOf : strFindInsideOf,

    strBegins : strBegins,
    strEnds : strEnds,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
