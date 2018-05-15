( function _StringTools2_test_s_() {

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

  got = _.strBegins( 'abc', [ 1, 'b', 'a' ] );
  expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strBegins( 1, '' ) );
  test.shouldThrowError( () => _.strBegins( 'a', 1 ) );

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

function strRemoveBegin2( test )
{
  test.description = 'returns string with removed occurrence from start';
  var got = _.strRemoveBegin( 'example','exa' );
  var expected = 'mple';
  test.identical( got,expected );

  test.description = 'returns original if no occurrence found';
  var got = _.strRemoveBegin( 'mple','exa' );
  var expected = 'mple';
  test.identical( got,expected );

  /**/

  debugger;

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strRemoveBegin( 'abcd','a','a' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strRemoveBegin( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strRemoveBegin( 1,'2' );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strRemoveBegin( '1',2 );
    });

  }

}

//

function strRemoveEnd2( test )
{
  test.description = 'returns string with removed occurrence from end';
  var got = _.strRemoveEnd( 'example','mple' );
  var expected = 'exa';
  test.identical( got,expected );

  test.description = 'returns original if no occurrence found ';
  var got = _.strRemoveEnd( 'example','' );
  var expected = 'example';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strRemoveEnd( 'one','two','three' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strRemoveEnd( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strRemoveEnd( 1,'second' );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strRemoveEnd( 'first',2 );
    });

  }
}

//

function strRemoveBegin( test )
{
  var got,expected;

  //

  test.description = 'strRemoveBegin';

  /**/

  got = _.strRemoveBegin( '', '' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( '', 'x' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', 'a' );
  expected = 'bc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', 'ab' );
  expected = 'c';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', 'x' );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', 'abc' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', '' );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', '' );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', [ 'a', 'b', 'c' ] );
  expected = 'bc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', [ '', 'a' ] );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', [ 'abc', 'a' ] );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'a', 'd' ] );
  expected = [ 'bc', 'bca', 'cab' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'a', 'b', 'c' ] );
  expected = [ 'bc', 'ca', 'ab' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( [ 'a', 'b', 'c' ], [ 'x' ] );
  expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( [ 'a', 'b', 'c' ], [ ] );
  expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strRemoveBegin( 1, '' ) )
  test.shouldThrowError( () => _.strRemoveBegin( 'a', 1 ) )
  test.shouldThrowError( () => _.strRemoveBegin() )
  test.shouldThrowError( () => _.strRemoveBegin( undefined, undefined ) )
  test.shouldThrowError( () => _.strRemoveBegin( null, null ) )
}

//

function strRemoveEnd( test )
{
  var got,expected;

  //

  test.description = 'strRemoveBegin';

  /**/

  got = _.strRemoveEnd( '', '' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( '', 'x' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', 'c' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', 'bc' );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', 'x' );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', 'abc' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', '' );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', [ 'a', 'b', 'c' ] );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', [ '', 'a' ] );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( 'abc', [ 'abc', 'a' ] );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'a', 'd' ] );
  expected = [ 'abc', 'bc', 'cab' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'a', 'b', 'c' ] );
  expected = [ 'ab', 'bc', 'ca' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( [ 'a', 'b', 'c' ], [ 'x' ] );
  expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strRemoveEnd( [ 'a', 'b', 'c' ], [ ] );
  expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strRemoveEnd( 1, '' ) )
  test.shouldThrowError( () => _.strRemoveEnd( 'a', 1 ) )
  test.shouldThrowError( () => _.strRemoveEnd() )
  test.shouldThrowError( () => _.strRemoveEnd( undefined, undefined ) )
  test.shouldThrowError( () => _.strRemoveEnd( null, null ) )
}

//

function strReplaceBegin( test )
{
  /**/

  var got,expected;

  got = _.strReplaceBegin( '', '', '' );
  expected = '';
  test.identical( got, expected );

  got = _.strReplaceBegin( '', '', 'a' );
  expected = 'a';
  test.identical( got, expected );

  got = _.strReplaceBegin( 'a', 'a', 'b' );
  expected = 'b';
  test.identical( got, expected );

  got = _.strReplaceBegin( 'a', 'x', 'b' );
  expected = 'a';
  test.identical( got, expected );

  got = _.strReplaceBegin( 'abc', 'ab', 'c' );
  expected = 'cc';
  test.identical( got, expected );

  got = _.strReplaceBegin( 'abc', '', 'c' );
  expected = 'cabc';
  test.identical( got, expected );

  got = _.strReplaceBegin( [], '', '' );
  expected = [];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'a', 'b', 'c' ], 'a', 'c' );
  expected = [ 'c', 'b', 'c' ];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], 'c' );
  expected = [ 'c', 'c', 'c' ];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
  expected = [ 'x', 'y', 'z' ];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'aa', 'bb', 'cc' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
  expected = [ 'xa', 'yb', 'zc' ];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'aa', 'bb', 'cc' ], [ 'y', 'z', 'c' ], [ 'x', 'y', 'z' ] );
  expected = [ 'aa', 'bb', 'zc' ];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ], 'c' );
  expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  got = _.strReplaceBegin( [ 'a', 'ab', 'ac' ], 'a', [ 'x', 'y', 'z' ] );
  expected = [ 'x', 'xb', 'xc' ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strReplaceBegin() );
  test.shouldThrowError( () => _.strReplaceBegin( 1, '', '' ) );
  test.shouldThrowError( () => _.strReplaceBegin( 'a', 1, '' ) );
  test.shouldThrowError( () => _.strReplaceBegin( 'a', 'a', 1 ) );
  test.shouldThrowError( () => _.strReplaceBegin( 'a', [ 'x', 1 ], 'a' ) );
  test.shouldThrowError( () => _.strReplaceBegin( 'a', [ 'b', 'a' ], [ 'x', 1 ] ) );
  test.shouldThrowError( () => _.strReplaceBegin( 'a', [ 'a' ], [ 'x', '1' ] ) );
}

//

function strReplaceEnd( test )
{
  /**/

  var got,expected;

  got = _.strReplaceEnd( '', '', '' );
  expected = '';
  test.identical( got, expected );

  got = _.strReplaceEnd( '', '', 'a' );
  expected = 'a';
  test.identical( got, expected );

  got = _.strReplaceEnd( 'a', 'a', 'b' );
  expected = 'b';
  test.identical( got, expected );

  got = _.strReplaceEnd( 'a', 'x', 'b' );
  expected = 'a';
  test.identical( got, expected );

  got = _.strReplaceEnd( 'abc', 'bc', 'c' );
  expected = 'ac';
  test.identical( got, expected );

  got = _.strReplaceEnd( 'abc', '', 'c' );
  expected = 'abcc';
  test.identical( got, expected );

  got = _.strReplaceEnd( [], '', '' );
  expected = [];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'a', 'b', 'c' ], 'a', 'c' );
  expected = [ 'c', 'b', 'c' ];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], 'c' );
  expected = [ 'c', 'c', 'c' ];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
  expected = [ 'x', 'y', 'z' ];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'aa', 'bb', 'cc' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
  expected = [ 'ax', 'by', 'cz' ];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'aa', 'bb', 'cc' ], [ 'y', 'z', 'c' ], [ 'x', 'y', 'z' ] );
  expected = [ 'aa', 'bb', 'cz' ];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ], 'c' );
  expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  got = _.strReplaceEnd( [ 'a', 'ab', 'ca' ], 'a', [ 'x', 'y', 'z' ] );
  expected = [ 'x', 'ab', 'cx' ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.strReplaceEnd() );
  test.shouldThrowError( () => _.strReplaceEnd( 1, '', '' ) );
  test.shouldThrowError( () => _.strReplaceEnd( 'a', 1, '' ) );
  test.shouldThrowError( () => _.strReplaceEnd( 'a', 'a', 1 ) );
  test.shouldThrowError( () => _.strReplaceEnd( 'a', [ 'x', 1 ], 'a' ) );
  test.shouldThrowError( () => _.strReplaceEnd( 'a', [ 'a' ], [ 1 ] ) );
  test.shouldThrowError( () => _.strReplaceEnd( 'a', [ 'b', 'c' ], [ 'c' ] ) );
}

//

function strPrependOnce( test )
{
  var got,expected;

  //

  test.description = 'strPrependOnce';

  /**/

  got = _.strPrependOnce( '', '' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( '', 'a' );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', 'a' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', 'ab' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', 'x' );
  expected = 'xab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', '' );
  expected = 'ab';
  test.identical( got, expected );

}

//

function strAppendOnce( test )
{
  var got,expected;

  //

  test.description = 'strAppendOnce';

  /**/

  got = _.strAppendOnce( '', '' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( '', 'a' );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', 'a' );
  expected = 'aba';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', 'ab' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', 'x' );
  expected = 'abx';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', '' );
  expected = 'ab';
  test.identical( got, expected );

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

    strRemoveBegin2 : strRemoveBegin2,
    strRemoveEnd2 : strRemoveEnd2,

    strRemoveBegin : strRemoveBegin,
    strRemoveEnd : strRemoveEnd,

    strReplaceBegin : strReplaceBegin,
    strReplaceEnd : strReplaceEnd,

    strPrependOnce : strPrependOnce,
    strAppendOnce : strAppendOnce,

  }

}

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
