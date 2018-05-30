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
      require.resolve( toolsPath );
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

var _ = _global_.wTools;

//

function strBeginOf( test )
{
  var got,expected;

  //

  test.description = 'strBeginOf';

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

function strSorterParse( test )
{
  var src;
  var fields;
  var expected;
  var got;

  //

  test.description = 'str without special characters';
  src = 'ab'
  expected = [];
  got = _.strSorterParse( src );

  //

  test.description = 'single pair';
  src = 'a>'
  expected = [ [ 'a', 1 ] ];
  got = _.strSorterParse( src );

  //

  test.description = 'src only';

  src = 'a>b>'
  expected = [ [ 'a', 1 ], [ 'b', 1 ] ];
  got = _.strSorterParse( src );
  test.identical( got, expected );

  src = 'a<b<'
  expected = [ [ 'a', 0 ], [ 'b', 0 ] ];
  got = _.strSorterParse( src );
  test.identical( got, expected );

  src = 'a>b<'
  expected = [ [ 'a', 1 ], [ 'b', 0 ] ];
  got = _.strSorterParse( src );
  test.identical( got, expected );

  src = 'a<b>'
  expected = [ [ 'a', 0 ], [ 'b', 1 ] ];
  got = _.strSorterParse( src );
  test.identical( got, expected );

  src = 'a>b>c<d>'
  expected = [ [ 'a', 1 ], [ 'b', 1 ],[ 'c', 0 ], [ 'd', 1 ] ];
  got = _.strSorterParse( src );
  test.identical( got, expected );

  src = 'a+b>c-d<'
  expected = [ [ 'a+b', 1 ], [ 'c-d', 0 ] ];
  got = _.strSorterParse( src );
  test.identical( got, expected );

  //

  test.description = 'with fields';
  var fields = { a : 'a', b : 'b', 'a+b' : 1, 'c-d' : 1 };

  src = 'a>b>'
  expected = [ [ 'a', 1 ], [ 'b', 1 ] ];
  got = _.strSorterParse( src, fields );
  test.identical( got, expected );

  src = 'a<b<'
  expected = [ [ 'a', 0 ], [ 'b', 0 ] ];
  got = _.strSorterParse( src, fields );
  test.identical( got, expected );

  src = 'a>b<'
  expected = [ [ 'a', 1 ], [ 'b', 0 ] ];
  got = _.strSorterParse( src, fields );
  test.identical( got, expected );

  src = 'a<b>'
  expected = [ [ 'a', 0 ], [ 'b', 1 ] ];
  got = _.strSorterParse( src, fields );
  test.identical( got, expected );

  src = 'a+b>c-d<'
  expected = [ [ 'a+b', 1 ], [ 'c-d', 0 ] ];
  got = _.strSorterParse( src, fields );
  test.identical( got, expected );

  //

  if( !Config.debug )
  return;

  test.description = 'with fields';
  var fields = { a : 'a', b : 'b' };
  src = 'a>b>c>'
  test.shouldThrowError( () => _.strSorterParse( src, fields ) );

  test.description = 'src must be str, fields must be objectLike';
  src = 'a>b';
  fields = [];
  test.shouldThrowError( () => _.strSorterParse( src, fields ) );
}

//

function strEndOf( test )
{
  var got,expected;

  //

  test.description = 'strEndOf';

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

function strInbetweenOf( test )
{
  var got,expected;

  //

  test.description = 'strInbetweenOf';

  /**/

  got = _.strInbetweenOf( '', '', '' );
  expected = undefined;
  test.identical( got, expected );

  /**/

  got = _.strInbetweenOf( 'abc', 'a', 'c' );
  expected = 'b';
  test.identical( got, expected );

  /*firs of begin, last of end*/

  got = _.strInbetweenOf( 'aaabccc', 'a', 'c' );
  expected = 'aabcc';
  test.identical( got, expected );

  /* f > l */

  got = _.strInbetweenOf( 'aaabccc', 'c', 'a' );
  expected = undefined;
  test.identical( got, expected );

  /* begin === end, string contains several of it */

  got = _.strInbetweenOf( 'aaabccc', 'a', 'a' );
  expected = 'a';
  test.identical( got, expected );

  /* begin === end, string contains single */

  got = _.strInbetweenOf( 'abc', 'a', 'a' );
  expected = undefined;
  test.identical( got, expected );

  /**/

  got = _.strInbetweenOf( 'aaabbbccc', [ 'a', 'b' ], [ 'b', 'c' ] );
  expected = 'aabb';
  test.identical( got, expected );

  /**/

  got = _.strInbetweenOf( 'abc', [ 'x','y', 'c' ], 'c' );
  expected = undefined;
  test.identical( got, expected );

  /**/

  got = _.strInbetweenOf( 'abbccc', [ 'b' ], '' );
  expected = 'bccc';
  test.identical( got, expected );

  test.shouldThrowError( () => _.strInbetweenOf( 1, '', '' ) );
  test.shouldThrowError( () => _.strInbetweenOf( 'a', 1, '' ) );
  test.shouldThrowError( () => _.strInbetweenOf( 'a', '', 1 ) );
}

//

function strBegins( test )
{
  var got, expected;

  //

  test.description = 'strBegins';

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

  test.description = 'strEnds';

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

  name : 'StringTools base tests',
  silencing : 1,

  tests :
  {

    strBeginOf : strBeginOf,
    strEndOf : strEndOf,
    strInbetweenOf : strInbetweenOf,

    strBegins : strBegins,
    strEnds : strEnds,

  }

}

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
