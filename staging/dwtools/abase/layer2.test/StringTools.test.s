( function _StringTools_test_s_() {

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

  var _global = _global_; var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _global = _global_; var _ = _global_.wTools;

// --
//
// --

function strRemoveBegin2( test )
{

  test.case = 'returns string with removed occurrence from start';
  var got = _.strRemoveBegin( 'example','exa' );
  var expected = 'mple';
  test.identical( got,expected );

  test.case = 'returns original if no occurrence found';
  var got = _.strRemoveBegin( 'mple','exa' );
  var expected = 'mple';
  test.identical( got,expected );

  /**/

  debugger;

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strRemoveBegin( 'abcd','a','a' );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strRemoveBegin( );
  });

  test.case = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.strRemoveBegin( 1,'2' );
  });

  test.case = 'second argument is wrong';
  test.shouldThrowError( function()
  {
    _.strRemoveBegin( '1',2 );
  });

}

//

function strRemoveEnd2( test )
{
  test.case = 'returns string with removed occurrence from end';
  var got = _.strRemoveEnd( 'example','mple' );
  var expected = 'exa';
  test.identical( got,expected );

  test.case = 'returns original if no occurrence found ';
  var got = _.strRemoveEnd( 'example','' );
  var expected = 'example';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strRemoveEnd( 'one','two','three' );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strRemoveEnd( );
  });

  test.case = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.strRemoveEnd( 1,'second' );
  });

  test.case = 'second argument is wrong';
  test.shouldThrowError( function()
  {
    _.strRemoveEnd( 'first',2 );
  });

}

//

function strRemoveBegin( test )
{
  var got,expected;

  //

  test.case = 'strRemoveBegin';

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
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'aabbcc', [ 'a', 'b', 'c' ] );
  expected = 'abbcc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abcabc', [ 'a', 'b', 'c' ] );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strRemoveBegin( 'abc', [ '', 'a' ] );
  expected = 'bc';
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
  expected = [ '', '', '' ];
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

  test.case = 'strRemoveBegin';

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

  test.case = 'strPrependOnce';

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

  test.case = 'strAppendOnce';

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

// --
//
// --

function strForRange( test )
{

  test.case = 'returns string representing the range of numbers';
  var got = _.strForRange( [ 1, 10 ] );
  var expected = '[ 1..10 ]';
  test.identical( got, expected );

  test.case = 'returns string representing the range of symbols';
  var got = _.strForRange( [ 'a', 'z' ] );
  var expected = '[ a..z ]';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strForRange( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strForRange( 'wrong argument' );
  } );

  test.case = 'too many arguments';
  test.shouldThrowError( function( )
  {
    _.strForRange( [ 1, 10 ], 'redundant argument' );
  } );

};

//

function strCapitalize( test )
{

  test.case = 'first letter is upper case';
  var got = _.strCapitalize( 'object' );
  var expected = 'Object';
  test.identical( got, expected );

  test.case = 'single word';
  var got = _.strCapitalize( 'one' );
  var expected = 'One';
  test.identical( got,expected );

  test.case = 'two words';
  var got = _.strCapitalize( 'one two' );
  var expected = 'One two';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments length';
  test.shouldThrowError( function()
  {
    _.strCapitalize( 'first','wrond argument' );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.strCapitalize( 777 );
  });

  test.case = 'no argument provided';
  test.shouldThrowError( function()
  {
    _.strCapitalize();
  });

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strCapitalize( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strCapitalize( 33 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowError( function( )
  {
    _.strCapitalize( 'object', 'redundant argument' );
  } );

}

//

function strIndentation( test )
{
  var got, expected;

  //

  test.case = 'single line';

  /**/

  got = _.strIndentation( '', '_' );
  expected = '_';
  test.identical( got, expected );

  /* no new lines, returns tab + source */

  got = _.strIndentation( 'abc', '_' );
  expected = '_abc';
  test.identical( got, expected );

  //

  test.case = 'multiline';

  /**/

  got = _.strIndentation( 'a\nb', '_' );
  expected = '_a\n_b';
  test.identical( got, expected );

  /* tab before first and each new line */

  got = _.strIndentation( '\na\nb\nc', '_' );
  expected = '_\n_a\n_b\n_c';
  test.identical( got, expected );

  /* tabs count = new lines count + 1 for first line */

  got = _.strIndentation( '\n\n\n', '_' );
  expected = '_\n_\n_\n_';
  test.identical( got, expected );

  /**/

  got = _.strIndentation( 'a\nb\nc','\t' );
  expected = '\ta\n\tb\n\tc';
  test.identical( got,expected );

  //

  test.case = 'array';

  /**/

  got = _.strIndentation( [ 'a', 'b', 'c' ],'_' );
  expected = '_a\n_b\n_c';
  test.identical( got,expected );

  /* join array to string */

  var arr = [ 'a\nb', 'b\nc', 'c\nd' ];
  got = _.strIndentation( arr.join( '\n' ), '_' );
  expected = '_a\n_b\n_b\n_c\n_c\n_d';
  test.identical( got,expected );


  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strIndentation( 'one','two','three' );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strIndentation( );
  });

  test.case = 'first argument type is wrong';
  test.shouldThrowError( function()
  {
    _.strIndentation( 123,'second' );
  });

  test.case = 'second argument type is wrong';
  test.shouldThrowError( function()
  {
    _.strIndentation( 'first', 321 );
  });

}

//

function strCountLines( test )
{

  test.case = 'returns 1';
  var func = 'function( x, y ) { return x + y; }';
  var got = _.strCountLines( func );
  var expected = 1;
  test.identical( got, expected );

  test.case = 'returns 4';
  var func = 'function( x, y ) \n { \n   return x + y; \n }';
  var got = _.strCountLines( func );
  var expected = 4;
  test.identical( got, expected );

  test.case = 'one line string test';
  var got = _.strCountLines( 'one line' );
  var expected = 1;
  test.identical( got,expected );

  test.case = 'multiline string test';
  var got = _.strCountLines( 'first line\nsecond line\nthird line' );
  var expected = 3;
  test.identical( got,expected );

  test.case = 'multiline  text test';
  var got = _.strCountLines( `one
                             two
                             three`
                          );
  var expected = 3;
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strCountLines( '1', '2' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strCountLines( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strCountLines();
  });

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strCountLines( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strCountLines( [ 1, '\n', 2 ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strCountLines( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowError( function( )
  {
    _.strCountLines( 'function( x, y ) \n { \n   return x + y; \n }', 'redundant argument' );
  } );

}

//

function strSplitFast( test )
{

  test.case = 'trivial';

  var got = _.strSplitFast( '', '' );
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplitFast( 'abc', '' );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplitFast( '', 'a' );
  var expected = [ '' ];
  test.identical( got, expected );

  var got = _.strSplitFast( 'test test test' );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var got = _.strSplitFast( ' test   test   test ' );
  var expected = [ '', 'test', '', '', 'test', '', '', 'test', '' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplitFast( ' test   test   test ', 'something' );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplitFast( ' test <delimteter>  test<delimteter>   test ', '<delimteter>' );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var got = _.strSplitFast( 'a b c d' );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  /*
    preservingEmpty : 1,
    preservingDelimeters : 0,
  */

  var op =
  {
    preservingEmpty : 1,
    preservingDelimeters : 0,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ '', 'test', '', '', 'test', '', '', 'test', '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ', 'something';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ', '<delimteter>';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got,expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got,expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ '', 'content' ];
  test.identical( got,expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '' ];
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'Aa', '', '', '', '', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<', ];
  var expected = [ 'Aa ', ' ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<' ];
  var expected = [ 'Aa ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'a1', 'a2', 'a3', '', '', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', '', ' b ', '', ' c ', '', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ '', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ '', '', '', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', 'a b', ' ', '', ' c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '" ""', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', '', '', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', 'x', '', '', '', '', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 0,
    preservingDelimeters : 0,
  */

  var op =
  {
    preservingEmpty : 0,
    preservingDelimeters : 0,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ', 'something';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ', '<delimteter>';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got,expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got,expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = ['content' ];
  test.identical( got,expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content' ];
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'Aa', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<', ];
  var expected = [ 'Aa ', ' ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<' ];
  var expected = [ 'Aa ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'a1', 'a2', 'a3', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a b', ' ', ' c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '" ""' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ 'x', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 1,
    preservingDelimeters : 1,
  */

  var op =
  {
    preservingEmpty : 1,
    preservingDelimeters : 1,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', '', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', ' ', 'test', ' ', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ '', ' ', 'test', ' ', '', ' ', '', ' ', 'test', ' ', '', ' ', '', ' ', 'test', ' ', '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ', 'something';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ', '<delimteter>';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', 'c', ' ', 'd' ];
  test.identical( got,expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got,expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got,expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got,expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', ',', 'b', ',', 'c', ',', 'd   ' ];
  test.identical( got,expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ '', '.', 'content' ];
  test.identical( got,expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '.', '' ];
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'Aa', ' ', '', '<<!', '', ' ', '', '<<-', '', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<', ];
  var expected = [ 'Aa ', '<<!', ' ', '<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<' ];
  var expected = [ 'Aa ', '<<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'a1', ' ', 'a2', ' ', 'a3', ' ', '', '<<<-', '', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', '.', '', ',', ' b ', '.', '', ',', ' c ', '.', '', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ',' , ' b ', ',', ' c ', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ '', ',', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ '', ',', '', ',', '', ',', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', 'a b', '"', ' ', '"', '', '"', ' c', '"', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '" ""', ' c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', '', '"', '', '"', '', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', '', '"', '', '"', '', ' c', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '', 'a', '', ' ', '', 'b', '', '"', '', ' ', '', '"', '', '"', '', ' ', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', 'x', '', '', ' ', '', '"', '', '"', '', ' ', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 0,
    preservingDelimeters : 1,
  */

  var op =
  {
    preservingEmpty : 0,
    preservingDelimeters : 1,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', ' ', 'test', ' ', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ ' ', 'test', ' ', ' ', ' ', 'test', ' ', ' ', ' ', 'test', ' ' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ', 'something';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ', '<delimteter>';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', 'c', ' ', 'd' ];
  test.identical( got,expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got,expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got,expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got,expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', ',', 'b', ',', 'c', ',', 'd   ' ];
  test.identical( got,expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ '.', 'content' ];
  test.identical( got,expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.','#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '.' ];
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'Aa', ' ', '<<!', ' ', '<<-', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<', ];
  var expected = [ 'Aa ', '<<!', ' ', '<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<' ];
  var expected = [ 'Aa ', '<<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  var expected = [ 'a1', ' ', 'a2', ' ', 'a3', ' ', '<<<-', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got,expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', '.', ',', ' b ', '.', ',', ' c ', '.', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ',' , ' b ', ',', ' c ', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ ',' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ ',', ',', ',' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' c', '"' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '" ""', ' c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' c' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', 'x', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strSplitFast( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strSplitFast( [  ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strSplitFast( 13 );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strSplitFast( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strSplitFast( 123 );
  });

  test.case = 'invalid option type';
  test.shouldThrowError( function()
  {
    _.strSplitFast( { src : 3 } );
  });

  test.case = 'invalid option defined';
  test.shouldThrowError( function()
  {
    _.strSplitFast( { src : 'word', delimeter : 0, left : 1 } );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strSplitFast();
  });

}

//

function strSplit2( test )
{

  /* */

  test.open( 'delimeter:" "' );

  test.case = ' space at the beginning'; /**/
  var got = _.strSplit2( ' aa b#b cc', ' ' );
  var expected = [ '', '', 'aa', '', 'b#b', '', 'cc' ];
  test.identical( got, expected );

  test.case = 'space in the end';  /**/
  var got = _.strSplit2( 'aa b#b cc ', ' ' );
  var expected = [ 'aa', '', 'b#b', '', 'cc', '', '' ];
  test.identical( got, expected );

  test.case = 'space on the beginning and the end';  /**/
  var got = _.strSplit2( ' aa b#b cc ', ' ' );
  var expected = [ '', '', 'aa', '', 'b#b', '', 'cc', '', '' ];
  test.identical( got, expected );

  test.close( 'delimeter:" "' );

  /* */

  test.open( 'delimeter:"#"' );

  test.case = ' space at the beginning'; /**/
  var got = _.strSplit2( ' aa b#b cc', '#' );
  var expected = [ 'aa b', '#', 'b cc' ];
  test.identical( got, expected );

  test.case = 'space in the end';  /**/
  var got = _.strSplit2( 'aa b#b cc ', '#' );
  var expected = [ 'aa b', '#', 'b cc' ];
  test.identical( got, expected );

  test.case = 'space on the beginning and the end';  /**/
  var got = _.strSplit2( ' aa b#b cc ', '#' );
  var expected = [ 'aa b', '#', 'b cc' ];
  test.identical( got, expected );

  test.close( 'delimeter:"#"' );

  /* */

  // test.case = 'trivial';
  //
  // var got = _.strSplit2( '', '' );
  // var expected = [];
  // test.identical( got, expected );
  //
  // var got = _.strSplit2( 'abc', '' );
  // var expected = [ 'a', 'b', 'c' ];
  // test.identical( got, expected );
  //
  // var got = _.strSplit2( '', 'a' );
  // var expected = [ '' ];
  // test.identical( got, expected );
  //
  // var got = _.strSplit2( 'test test test' );
  // var expected = [ 'test', 'test', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'split string into an array of strings';
  // var got = _.strSplit2( ' test   test   test ' );
  // var expected = [ '', 'test', '', '', 'test', '', '', 'test', '' ];
  // test.identical( got, expected );
  //
  // test.case = 'returns an array of strings';
  // var got = _.strSplit2( ' test   test   test ', 'something' );
  // var expected = [ ' test   test   test ' ];
  // test.identical( got, expected );
  //
  // test.case = 'returns an array of strings';
  // var got = _.strSplit2( ' test <delimteter>  test<delimteter>   test ', '<delimteter>' );
  // var expected = [ ' test ', '  test', '   test ' ];
  // test.identical( got, expected );
  //
  // test.case = 'simple string, default options';
  // var got = _.strSplit2( 'a b c d' );
  // var expected = [ 'a', 'b', 'c', 'd' ];
  // test.identical( got,expected );

  test.open( 'quotes' );

  test.case = 'long with quotes inside';
  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    delimeter : [ ' > ', ' < ', '/' ],
  }
  o.src = 'Test check ( Tools/base/layer2/String / strSplit2 / delimeter:" " > space on the beginning and the end <  ) # 3 ... failed';
  var got = _.strSplit2( o );
  var expected = [ 'Test check ( Tools', '/', 'base', '/', 'layer2', '/', 'String ', '/', ' strSplit2 ', '/', ' delimeter:', '" "', '', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.close( 'quotes' );

  // /*
  //   stripping : 1,
  //   quoting : 0,
  //   preservingEmpty : 0,
  // */
  //
  // var op =
  // {
  //   stripping : 1,
  //   quoting : 0,
  //   preservingEmpty : 0,
  // }
  //
  // /* */
  //
  // test.case = 'empty both';
  // var o = _.mapExtend( null, op );
  // o.src = '';
  // o.delimeter = '';
  // var got = _.strSplit2( o );
  // var expected = [];
  // test.identical( got, expected );
  //
  // test.case = 'empty delimeter';
  // var o = _.mapExtend( null, op );
  // o.src = 'abc';
  // o.delimeter = '';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', 'b', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'empty src';
  // var o = _.mapExtend( null, op );
  // o.src = '';
  // o.delimeter = 'a';
  // var got = _.strSplit2( o );
  // var expected = [];
  // test.identical( got, expected );
  //
  // test.case = 'has empty element in result';
  // var o = _.mapExtend( null, op );
  // o.src = 'a b  c';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', 'b', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'returns an array of strings';
  // var o = _.mapExtend( null, op );
  // o.src = 'test test test';
  // var got = _.strSplit2( o );
  // var expected = [ 'test', 'test', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'split string into an array of strings';
  // var o = _.mapExtend( null, op );
  // o.src = ' test   test   test ';
  // var got = _.strSplit2( o );
  // var expected = [ 'test', 'test', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'split with delimeter which src does not have';
  // var o = _.mapExtend( null, op );
  // o.src = ' test   test   test ', 'something';
  // o.delimeter = 'x';
  // var got = _.strSplit2( o );
  // var expected = [ 'test   test   test' ];
  // test.identical( got, expected );
  //
  // test.case = 'custom delimeter';
  // var o = _.mapExtend( null, op );
  // o.src = ' test <delimteter>  test<delimteter>   test ', '<delimteter>';
  // o.delimeter = '<delimteter>';
  // var got = _.strSplit2( o );
  // var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'simple string, default options';
  // var o = _.mapExtend( null, op );
  // o.src = 'a b c d';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', 'b', 'c', 'd' ];
  // test.identical( got,expected );
  //
  // test.case = 'arguments as map';
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b,c,d';
  // o.delimeter = ',';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  // test.identical( got,expected );
  //
  // test.case = 'delimeter as array';
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b.c.d';
  // o.delimeter = [ ',', '.' ];
  // var got = _.strSplit2( o );
  // var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  // test.identical( got,expected );
  //
  // test.case = 'zero delimeter length';
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b.c.d';
  // o.delimeter = [];
  // var got = _.strSplit2( o );
  // var expected = [ 'a,b.c.d' ];
  // test.identical( got,expected );
  //
  // test.case = 'stripping off';
  // var o = _.mapExtend( null, op );
  // o.src = '    a,b,c,d   ';
  // o.delimeter = [ ',' ];
  // var got = _.strSplit2( o );
  // var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  // test.identical( got,expected );
  //
  // /* */
  //
  // test.case = 'many delimeters, delimeter on the begin';
  // var o = _.mapExtend( null, op );
  // o.src = '.content';
  // o.delimeter = [ '.','#' ];
  // var got = _.strSplit2( o )
  // var expected = [ '.', 'content' ];
  // test.identical( got,expected );
  //
  // test.case = 'many delimeters, delimeter on the end';
  // var o = _.mapExtend( null, op );
  // o.src = 'content.';
  // o.delimeter = [ '.','#' ];
  // var got = _.strSplit2( o )
  // var expected = [ 'content', '.' ];
  // test.identical( got,expected );
  //
  // test.case = 'many delimeters having common';
  // var o = _.mapExtend( null, op );
  // o.src = 'Aa <<! <<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  // var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'many delimeters having common';
  // var o = _.mapExtend( null, op );
  // o.src = 'Aa <<! <<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<', ];
  // var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'having long common';
  // var o = _.mapExtend( null, op );
  // o.src = 'Aa <<<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<' ];
  // var expected = [ 'Aa', '<<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'having long common 2';
  // var o = _.mapExtend( null, op );
  // o.src = 'a1 a2 a3 <<<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  // var expected = [ 'a1', 'a2', 'a3', '<<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'delimeter not exist in src';
  //
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b,c';
  // o.delimeter = [ '.' ];
  // var expected = [ 'a,b,c' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // /**/
  //
  // test.case = 'several delimeters';
  // var o = _.mapExtend( null, op );
  // o.src = 'a ., b ., c ., d';
  // o.delimeter = [ ',', '.' ];
  // var expected = [ 'a', '.', ',', 'b', '.', ',', 'c', '.', ',', 'd' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // test.case = 'one delimeters';
  // var o = _.mapExtend( null, op );
  // o.src = 'a , b , c , d';
  // o.delimeter = ',';
  // var expected = [ 'a', ',' , 'b', ',', 'c', ',', 'd' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // test.case = 'delimeters equal src';
  // var o = _.mapExtend( null, op );
  // o.src = ',';
  // o.delimeter = ',';
  // var expected = [ ',' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // test.case = 'src is triplet of delimeter';
  // var o = _.mapExtend( null, op );
  // o.src = ',,,';
  // o.delimeter = ',';
  // var expected = [ ',', ',', ',' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // /* */
  //
  // test.case = 'quoted at edges';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c"';
  // o.delimeter = [ '"' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', '"','"', 'c', '"' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ 'a b', ' c' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '" ""', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle with space first';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ 'a b', ' ', ' c', '"' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', '"', '"', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle with space last';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ 'a b', ' c', '"', ' ' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', '"', '"', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'delimeter with empty string at the beginning of array';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a', 'b', '"', '"', '"', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" x "" c';
  // o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', 'x', '"', '"', 'c' ];
  // test.identical( got, expected );

  /*
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
  */

  var op =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
  }

  /* */

  // test.case = 'empty both';
  // var o = _.mapExtend( null, op );
  // o.src = '';
  // o.delimeter = '';
  // var got = _.strSplit2( o );
  // var expected = [];
  // test.identical( got, expected );
  //
  // test.case = 'empty delimeter';
  // var o = _.mapExtend( null, op );
  // o.src = 'abc';
  // o.delimeter = '';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', 'b', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'empty src';
  // var o = _.mapExtend( null, op );
  // o.src = '';
  // o.delimeter = 'a';
  // var got = _.strSplit2( o );
  // var expected = [];
  // test.identical( got, expected );
  //
  // test.case = 'has empty element in result';
  // var o = _.mapExtend( null, op );
  // o.src = 'a b  c';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', 'b', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'returns an array of strings';
  // var o = _.mapExtend( null, op );
  // o.src = 'test test test';
  // var got = _.strSplit2( o );
  // var expected = [ 'test', 'test', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'split string into an array of strings';
  // var o = _.mapExtend( null, op );
  // o.src = ' test   test   test ';
  // var got = _.strSplit2( o );
  // var expected = [ 'test', 'test', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'split with delimeter which src does not have';
  // var o = _.mapExtend( null, op );
  // o.src = ' test   test   test ', 'something';
  // o.delimeter = 'x';
  // var got = _.strSplit2( o );
  // var expected = [ 'test   test   test' ];
  // test.identical( got, expected );
  //
  // test.case = 'custom delimeter';
  // var o = _.mapExtend( null, op );
  // o.src = ' test <delimteter>  test<delimteter>   test ', '<delimteter>';
  // o.delimeter = '<delimteter>';
  // var got = _.strSplit2( o );
  // var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  // test.identical( got, expected );
  //
  // test.case = 'simple string, default options';
  // var o = _.mapExtend( null, op );
  // o.src = 'a b c d';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', 'b', 'c', 'd' ];
  // test.identical( got,expected );
  //
  // test.case = 'arguments as map';
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b,c,d';
  // o.delimeter = ',';
  // var got = _.strSplit2( o );
  // var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  // test.identical( got,expected );
  //
  // test.case = 'delimeter as array';
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b.c.d';
  // o.delimeter = [ ',', '.' ];
  // var got = _.strSplit2( o );
  // var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  // test.identical( got,expected );
  //
  // test.case = 'zero delimeter length';
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b.c.d';
  // o.delimeter = [];
  // var got = _.strSplit2( o );
  // var expected = [ 'a,b.c.d' ];
  // test.identical( got,expected );
  //
  // test.case = 'stripping off';
  // var o = _.mapExtend( null, op );
  // o.src = '    a,b,c,d   ';
  // o.delimeter = [ ',' ];
  // var got = _.strSplit2( o );
  // var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  // test.identical( got,expected );
  //
  // /* */
  //
  // test.case = 'many delimeters, delimeter on the begin';
  // var o = _.mapExtend( null, op );
  // o.src = '.content';
  // o.delimeter = [ '.','#' ];
  // var got = _.strSplit2( o )
  // var expected = [ '.', 'content' ];
  // test.identical( got,expected );
  //
  // test.case = 'many delimeters, delimeter on the end';
  // var o = _.mapExtend( null, op );
  // o.src = 'content.';
  // o.delimeter = [ '.','#' ];
  // var got = _.strSplit2( o )
  // var expected = [ 'content', '.' ];
  // test.identical( got,expected );
  //
  // test.case = 'many delimeters having common';
  // var o = _.mapExtend( null, op );
  // o.src = 'Aa <<! <<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  // var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'many delimeters having common';
  // var o = _.mapExtend( null, op );
  // o.src = 'Aa <<! <<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<', ];
  // var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'having long common';
  // var o = _.mapExtend( null, op );
  // o.src = 'Aa <<<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<' ];
  // var expected = [ 'Aa', '<<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'having long common 2';
  // var o = _.mapExtend( null, op );
  // o.src = 'a1 a2 a3 <<<- Bb';
  // o.delimeter = [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ];
  // var expected = [ 'a1', 'a2', 'a3', '<<<-', 'Bb' ];
  // var got = _.strSplit2( o );
  // test.identical( got,expected );
  //
  // test.case = 'delimeter not exist in src';
  //
  // var o = _.mapExtend( null, op );
  // o.src = 'a,b,c';
  // o.delimeter = [ '.' ];
  // var expected = [ 'a,b,c' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // /**/
  //
  // test.case = 'several delimeters';
  // var o = _.mapExtend( null, op );
  // o.src = 'a ., b ., c ., d';
  // o.delimeter = [ ',', '.' ];
  // var expected = [ 'a', '.', ',', 'b', '.', ',', 'c', '.', ',', 'd' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // test.case = 'one delimeters';
  // var o = _.mapExtend( null, op );
  // o.src = 'a , b , c , d';
  // o.delimeter = ',';
  // var expected = [ 'a', ',' , 'b', ',', 'c', ',', 'd' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // test.case = 'delimeters equal src';
  // var o = _.mapExtend( null, op );
  // o.src = ',';
  // o.delimeter = ',';
  // var expected = [ ',' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );
  //
  // test.case = 'src is triplet of delimeter';
  // var o = _.mapExtend( null, op );
  // o.src = ',,,';
  // o.delimeter = ',';
  // var expected = [ ',', ',', ',' ];
  // var got = _.strSplit2( o );
  // test.identical( got, expected );

  /* */

  // test.case = 'complex quoted at edges';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" " c"';
  // o.delimeter = [ '"' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"a b"', '"c"' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ 'a b', ' c' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '" ""', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle with space first';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ 'a b', ' ', ' c', '"' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', '"', '"', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle with space last';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ 'a b', ' c', '"', ' ' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', '"', '"', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'delimeter with empty string at the beginning of array';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" "" c';
  // o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a', 'b', '"', '"', '"', 'c' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted in the middle';
  // var o = _.mapExtend( null, op );
  // o.src = '"a b" x "" c';
  // o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"', 'a b', '"', 'x', '"', '"', 'c' ];
  // test.identical( got, expected );

  /* special quoting tests */

  /*
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
  */

  // test.case = 'quoted at edges, delimeter : #';
  // var o = _.mapExtend( null, op );
  // o.src = '"aa"bb"cc"';
  // o.delimeter = [ '#' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"aa"', 'bb', '"cc"' ];
  // test.identical( got, expected );
  //
  // test.case = 'quoted at edges with extra quote inside, delimeter : #';
  // var o = _.mapExtend( null, op );
  // o.src = '"aa"bb""cc"';
  // o.delimeter = [ '#' ];
  // var got = _.strSplit2( o );
  // var expected = [ '"aa"', 'bb', '""', 'cc"' ];
  // test.identical( got, expected );

  var op =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
    delimeter : '#',
  }

  test.testsGroupOpen( 'delimeter:#' );

  /* */

  test.case = 'quoted at edges"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb"cc"';
  var got = _.strSplit2( o );
  var expected = [ '"aa"', 'bb', '"cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with extra quote inside "';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb""cc"';
  var got = _.strSplit2( o );
  var expected = [ '"aa"', 'bb', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside the first quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"a#a"bb""cc"';
  var got = _.strSplit2( o );
  var expected = [ '"a#a"', 'bb', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside not quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"b#b""cc"';
  var got = _.strSplit2( o );
  var expected = [ '"aa"', 'b', '#', 'b', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside the last quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb""c#c"';
  var got = _.strSplit2( o );
  var expected = [ '"aa"', 'bb', '""', 'c', '#', 'c"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside all 3 text splits"';
  var o = _.mapExtend( null, op );
  o.src = '"a#a"b#b""c#c"';
  var got = _.strSplit2( o );
  var expected = [ '"a#a"', 'b', '#', 'b', '""', 'c', '#', 'c"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with extra spaces on edges';
  var o = _.mapExtend( null, op );
  o.src = ' "aa"bb"cc" ';
  var got = _.strSplit2( o );
  var expected = [ '"aa"', 'bb', '"cc"' ];
  test.identical( got, expected );

  debugger;
  test.testsGroupClose( 'delimeter:#' );

}

//

function strSplit( test )
{

  test.case = 'returns an array of strings';
  var got = _.strSplit( 'test test test' );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var got = _.strSplit( ' test   test   test ' );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplit( ' test   test   test ', 'redundant argument' );
  var expected = [ 'test   test   test' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplit( ' test <delimteter>  test<delimteter>   test ', '<delimteter>' );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var got = _.strSplit( 'a b c d' );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'arguments as map';
  var got = _.strSplit( { src : 'a,b,c,d', delimeter : ','  } );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'delimeter as array';
  var got = _.strSplit( { src : 'a,b.c.d', delimeter : [ ',', '.' ]  } );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.case = 'zero delimeter length';
  var got = _.strSplit( { src : 'a,b.c.d', delimeter : []  } );
  var expected = [ 'a,b.c.d' ];
  test.identical( got,expected );

  test.case = 'stripping off';
  var got = _.strSplit( { src : '    a,b,c,d   ', delimeter : [ ',' ], stripping : 0  } );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got,expected );

  /* */

  test.case = 'preserving delimeters, many delimeters, delimeter on the begin';
  var got = _.strSplit({ src : '.content', preservingDelimeters : 1, delimeter : [ '.','#' ] })
  var expected = [ '.','content' ];
  test.identical( got,expected );

  test.case = 'preserving delimeters, many delimeters, delimeter on the end';
  var got = _.strSplit({ src : 'content.', preservingDelimeters : 1, delimeter : [ '.','#' ] })
  var expected = [ 'content','.' ];
  test.identical( got,expected );

  /* */

  test.case = 'many delimeters having common, preserving empty';
  var src = 'Aa <<! <<- Bb';
  var expected = [ 'Aa',' ','','<<!','',' ','','<<-','',' ','Bb' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
  });

  test.identical( got,expected );
  test.case = 'many delimeters having common, removing empty';
  var src = 'Aa <<! <<- Bb';
  var expected = [ 'Aa',' ','<<!',' ','<<-',' ','Bb' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
    preservingEmpty : 0,
    preservingDelimeters : 1,
    stripping : 0,
  });
  test.identical( got,expected );

  /* */

  test.case = 'having long common';
  var src = 'Aa <<<- Bb';
  var expected = [ 'Aa',' ','','<<<-','',' ','Bb' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
  });
  test.identical( got,expected );

  /* */

  test.case = 'having long common 2';
  var src = 'a1 a2 a3 <<<- Bb';
  var expected = [ 'a1',' ','a2',' ','a3',' ','','<<<-','',' ','Bb' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
  });
  test.identical( got,expected );

  /*delimeter not exist in src*/

  var src = 'a,b,c';
  var expected = [ 'a,b,c' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ '.' ],
    preservingDelimeters : 1
  });
  test.identical( got, expected );

  /*delimeter not exist in src*/

  var src = 'a,b,c';
  var expected = [ 'a,b,c' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ '.' ],
    preservingDelimeters : 1
  });
  test.identical( got, expected );

  /**/

  test.case = 'preservingEmpty';

  var src = 'a ., b ., c ., d';
  var expected = [ 'a', '', 'b', '', 'c', '', 'd' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : [ ',', '.' ],
    preservingEmpty : 1
  });
  test.identical( got, expected );

  /**/

  var src = 'a , b , c , d';
  var expected = [ 'a', 'b', 'c', 'd' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : ',',
    preservingEmpty : 1
  });
  test.identical( got, expected );


  /**/

  var src = ',';
  var expected = [ '', '' ];
  var got = _.strSplit
  ({
    src : src,
    delimeter : ',',
    preservingEmpty : 1
  });
  test.identical( got, expected );

  /**/

  var src = ',,,';
  var expected = [];
  var got = _.strSplit
  ({
    src : src,
    delimeter : ',',
    preservingEmpty : 0
  });
  test.identical( got, expected );

  /* take into acount text inside " " */

  test.case = 'take into acount text inside ""';

  var o =
  {
    src : '"/path/with space/" a b c',
    quoting : 1,
    preservingEmpty : 1,
  }
  var got = _.strSplit( o );
  var expected = [ '/path/with space/', '', 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'take into acount text inside ""';

  var o =
  {
    src : '"/path/with space/" a b c',
    quoting : 1,
    preservingEmpty : 0,
  }
  var got = _.strSplit( o );
  var expected = [ '/path/with space/', 'a', 'b', 'c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : 'a "/path with/empty space/" a',
    quoting : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a', '/path with/empty space/', 'a' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b c" "a b c" "a b c"',
    quoting : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b c', 'a b c', 'a b c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b c" "a b c" "a b c"',
    quoting : 1,
    preservingEmpty : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b c', '', 'a b c', '', 'a b c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b c"x"a b c"x"a b c"',
    quoting : 1,
    delimeter : [ 'x' ],
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b c', 'x', 'a b c', 'x', 'a b c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b" "" c"',
    quoting : 0,
    delimeter : [ '"' ],
    stripping : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ '', '\"', 'a b', '\"', '', '\"', '', '\"', 'c', '\"', '' ]
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b" "" c',
    quoting : 0,
    delimeter : [ '"' ],
    stripping : 0,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ '', '\"', 'a b', '\"', ' ', '\"', '', '\"', ' c' ];
  test.identical( got, expected );

  var o =
  {
    src : '"a b" "" c',
    quoting : 1,
    delimeter : [ '"' ],
    stripping : 0,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b', ' ', '', ' c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b" "" c',
    quoting : 1,
    delimeter : [ '"' ],
    stripping : 0,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b', ' ', '', ' c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b" "" c',
    quoting : 1,
    delimeter : [ '"' ],
    stripping : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b', '', '', 'c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b" "" c"',
    quoting : 1,
    delimeter : [ '"' ],
    stripping : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b', '', '', 'c' ];
  test.identical( got, expected );

  /**/

  var o =
  {
    src : '"a b" "" c"',
    quoting : 1,
    delimeter : [ '"' ],
    stripping : 0,
    preservingEmpty : 1,
    preservingDelimeters : 1
  }
  var got = _.strSplit( o );
  var expected = [ 'a b', ' ', '', ' c' ];
  test.identical( got, expected );

  /*
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
  */

  var op =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
  }

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strSplit( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strSplit( [  ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strSplit( 13 );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strSplit( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strSplit( 123 );
  });

  test.case = 'invalid option type';
  test.shouldThrowError( function()
  {
    _.strSplit( { src : 3 } );
  });

  test.case = 'invalid option defined';
  test.shouldThrowError( function()
  {
    _.strSplit( { src : 'word', delimeter : 0, left : 1 } );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strSplit();
  });

}

//

function strSplitStrNumber( test )
{

  test.case = 'returns object with one property';
  var got = _.strSplitStrNumber( 'abcdef' );
  var expected = { str : 'abcdef' };
  test.identical( got, expected );

  test.case = 'returns object with two properties';
  var got = _.strSplitStrNumber( 'abc3def' );
  var expected = { str : 'abc', number : 3 };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strSplitStrNumber( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strSplitStrNumber( [  ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strSplitStrNumber( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowError( function( )
  {
    _.strSplitStrNumber( 'abc3', 'redundant argument' );
  } );

}
//

function strCutOffLeft( test )
{
  var got,expected;

  //

  test.case = 'single delimeter';

  /**/

  got = _.strCutOffLeft( '', '' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( '', [ '' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abc', [ '' ] );
  expected = [ '', '', 'abc' ];
  test.identical( got, expected );

  /* empty delimeters array */

  got = _.strCutOffLeft( 'abca', [] );
  expected = [ '', '', 'abca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( '', 'a' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( '', [ 'a' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abca', 'a' );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'a' ] );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strCutOffLeft( 'abca', 'd' );
  expected = [ '', '', 'abca' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strCutOffLeft( 'abca', [ 'd' ] );
  expected = [ '', '', 'abca' ];
  test.identical( got, expected );

  //

  test.case = 'single delimeter, number';

  /*!!!*/

  got = _.strCutOffLeft( 'abca', '', 2 );
  expected = [ 'a', '', 'bca' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strCutOffLeft( 'abca', 'a', 2 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strCutOffLeft( 'abca', [ 'a' ], 2 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strCutOffLeft( 'abcaca', 'a', 3 );
  expected = [ 'abcac', 'a', '' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strCutOffLeft( 'abcaca', [ 'a' ], 3 );
  expected = [ 'abcac', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abcaca', 'a', 4 );
  expected = [ 'abcaca', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abcaca', [ 'a' ], 4 );
  expected = [ 'abcaca', 'a', '' ];
  test.identical( got, expected );

  //

  test.case = 'several delimeters';

  /**/

  got = _.strCutOffLeft( 'abca', [ 'a', 'c' ] );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'c', 'a' ] );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'x', 'y' ] );
  expected = [ '', '', 'abca'  ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'x', 'y', 'a' ] );
  expected = [ '', 'a', 'bca'  ];
  test.identical( got, expected );

  //

  test.case = 'several delimeters, number';

  /* empty delimeters array */

  got = _.strCutOffLeft( 'abca', [], 2 );
  expected = [ '', '', 'abca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'abcbc', [ 'c', 'a' ], 2 );
  expected = [ 'ab', 'c', 'bc' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'cbcbc', [ 'c', 'a' ], 3 );
  expected = [ 'cbcb', 'c', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'cbcbc', [ 'c', 'a' ], 4 );
  expected = [ 'cbcbc', 'c', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'jj', [ 'c', 'a' ], 4 );
  expected = [ 'jj', 'c', ''];
  test.identical( got, expected );

  //

  test.case = 'one of delimeters contains other';

  //

  got = _.strCutOffLeft( 'ab', [ 'a', 'ab' ] );
  expected = [ '', 'a', 'b' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'ab', [ 'ab', 'a' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'ab', [ 'b', 'ab' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'ab', [ 'ab', 'b' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffLeft( 'a b c', ' ', 1 );
  expected = [ 'a', ' ', 'b c' ];
  test.identical( got, expected );

  //

  test.case = 'single delimeter'

  /* cut on first appear */

  got = _.strCutOffLeft( 'abca', 'a', 1 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got ,expected );

  /* no occurrences */

  got = _.strCutOffLeft( 'jj', 'a', 1 );
  expected = [ '', '', 'jj'];
  test.identical( got ,expected );

  /* cut on second appear */

  got = _.strCutOffLeft( 'abca', 'a', 2 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got ,expected );

  /* 5 attempts */

  got = _.strCutOffLeft( 'abca', 'a', 5 );
  expected = [ 'abca', 'a', '' ];
  test.identical( got ,expected );

  //

  test.case = 'multiple delimeter'

  /**/

  got = _.strCutOffLeft( 'abca', [ 'a', 'c' ], 1 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got ,expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got ,expected );

  /**/

  got = _.strCutOffLeft( 'abca', [ 'a', 'c' ], 3 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got ,expected );

  /* no occurrences */

  got = _.strCutOffLeft( 'jj', [ 'a', 'c' ], 1 );
  expected = [ '', '', 'jj' ];
  test.identical( got ,expected );

  /* no occurrences */

  got = _.strCutOffLeft( 'jj', [ 'a' ], 1 );
  expected = [ '', '', 'jj' ];
  test.identical( got ,expected );

  //

  test.case = 'options as map';

  /**/

  got = _.strCutOffLeft({ src : 'abca', delimeter : 'a', number : 1 });
  expected = [ '', 'a', 'bca' ];
  test.identical( got ,expected );

  /* number option is missing */

  got = _.strCutOffLeft({ src : 'abca', delimeter : 'a' });
  expected = [ '', 'a', 'bca' ];
  test.identical( got ,expected );

  //

  test.case = 'number option check';

  /* number is zero */

  got = _.strCutOffLeft( 'abca', 'a', 0 );
  expected = [ '', '', 'abca' ];
  test.identical( got ,expected );

  /* number is negative */

  got = _.strCutOffLeft( 'abca', 'a', -1 );
  expected = [ '', '', 'abca' ];
  test.identical( got ,expected );

  if( !Config.debug )
  return;

  test.case = 'single argument but object expected';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffLeft( 'abc' );
  })

  test.case = 'invalid option';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffLeft({ src : 'abc', delimeter : 'a', query : 'a' });
  })

  test.case = 'changing of left option not allowed';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffLeft({ src : 'abc', delimeter : 'a', left : 0 });
  })

}

//

function strCutOffRight( test )
{
  var got,expected;

  //

  test.case = 'single delimeter';

  /**/

  got = _.strCutOffRight( '', '' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( '', [ '' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /*!!!*/

  got = _.strCutOffRight( 'abc', [ '' ] );
  expected = [ 'ab', '', 'c' ];
  test.identical( got, expected );

  /* empty delimeters array */

  got = _.strCutOffRight( 'abca', [] );
  expected = [ 'abca', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( '', 'a' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( '', [ 'a' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abca', 'a' );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'a' ] );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strCutOffRight( 'abca', 'd' );
  expected = [ 'abca', '', '' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strCutOffRight( 'abca', [ 'd' ] );
  expected = [ 'abca', '', '' ];
  test.identical( got, expected );

  //

  test.case = 'single delimeter, number';

  /*!!!*/

  got = _.strCutOffRight( 'abca', '', 2 );
  expected = [ 'ab', '', 'ca' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strCutOffRight( 'abca', 'a', 2 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strCutOffRight( 'abca', [ 'a' ], 2 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strCutOffRight( 'abcaca', 'a', 3 );
  expected = [ '', 'a', 'bcaca' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strCutOffRight( 'abcaca', [ 'a' ], 3 );
  expected = [ '', 'a', 'bcaca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abcaca', 'a', 4 );
  expected = [ '', '', 'abcaca' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abcaca', [ 'a' ], 4 );
  expected = [ '', '', 'abcaca' ];
  test.identical( got, expected );

  //

  test.case = 'several delimeters';

  /**/

  got = _.strCutOffRight( 'abca', [ 'a', 'c' ] );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'c', 'a' ] );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'x', 'y' ] );
  expected = [ 'abca', '', ''  ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'x', 'y', 'a' ] );
  expected = [ 'abc', 'a', ''  ];
  test.identical( got, expected );

  //

  test.case = 'several delimeters, number';

  /* empty delimeters array */

  got = _.strCutOffRight( 'abca', [], 2 );
  expected = [ 'abca', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'abcbc', [ 'c', 'a' ], 2 );
  expected = [ 'ab', 'c', 'bc' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'cbcbc', [ 'c', 'a' ], 3 );
  expected = [ '', 'c', 'bcbc' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'cbcbc', [ 'c', 'a' ], 4 );
  expected = [ '', '', 'cbcbc' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'jj', [ 'c', 'a' ], 4 );
  expected = [ '', 'c', 'jj' ];
  test.identical( got, expected );

  //

  test.case = 'one of delimeters contains other';

  //

  got = _.strCutOffRight( 'ab', [ 'a', 'ab' ] );
  expected = [ '', 'a', 'b' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'ab', [ 'ab', 'a' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'ab', [ 'b', 'ab' ] );
  expected = [ 'a', 'b', '' ];
  test.identical( got, expected );

  /**/

  got = _.strCutOffRight( 'ab', [ 'ab', 'b' ] );
  expected = [ 'a', 'b', '' ];
  test.identical( got, expected );

  //

  test.case = 'defaults'

  /**/

  got = _.strCutOffRight( 'a b c', ' ', 1 );
  expected = [ 'a b', ' ', 'c' ];
  test.identical( got, expected );

  //

  test.case = 'single delimeter'

  /* cut on first appear */

  got = _.strCutOffRight( 'abca', 'a', 1 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got ,expected );

  /* no occurrences */

  got = _.strCutOffRight( 'jj', 'a', 1 );
  expected = [ 'jj', '', '' ];
  test.identical( got ,expected );

  /* cut on second appear */

  got = _.strCutOffRight( 'abca', 'a', 2 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got ,expected );

  /**/

  got = _.strCutOffRight( 'abca', 'a', 5 );
  expected = [ '', '', 'abca' ];
  test.identical( got ,expected );

  //

  test.case = 'multiple delimeter'

  /**/

  got = _.strCutOffRight( 'abca', [ 'a', 'c' ], 1 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got ,expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got ,expected );

  /**/

  got = _.strCutOffRight( 'abca', [ 'a', 'c' ], 3 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got ,expected );

  /* no occurrences */

  got = _.strCutOffRight( 'jj', [ 'a', 'c' ], 1 );
  expected = [ 'jj', '', '' ];
  test.identical( got ,expected );

  /* no occurrences */

  got = _.strCutOffRight( 'jj', [ 'a' ], 1 );
  expected = [ 'jj', '', '' ];
  test.identical( got ,expected );

  //

  test.case = 'options as map';

  /**/

  got = _.strCutOffRight({ src : 'abca', delimeter : 'a', number : 1 });
  expected = [ 'abc', 'a', '' ];
  test.identical( got ,expected );

  /* number option is missing */

  got = _.strCutOffRight({ src : 'abca', delimeter : 'a' });
  expected = [ 'abc', 'a', '' ];
  test.identical( got ,expected );

  //

  test.case = 'number option check';

  /* number is zero */

  got = _.strCutOffRight( 'abca', 'a', 0 );
  expected = [ 'abca', '', '' ];
  test.identical( got ,expected );

  /* number is negative */

  got = _.strCutOffRight( 'abca', 'a', -1 );
  expected = [ 'abca', '', '' ];
  test.identical( got ,expected );

  if( !Config.debug )
  return;

  test.case = 'single argument but object expected';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffRight( 'abc' );
  });

  test.case = 'invalid option';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffRight({ src : 'abc', delimeter : 'a', query : 'a' });
  });

  test.case = 'changing of left option not allowed';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffRight({ src : 'abc', delimeter : 'a', left : 0 });
  });

}

//

function strCutOffAllLeft( test )
{
  var got, expected;

  test.case = 'cut in most right position';

  /* nothing */

  got = _.strCutOffAllLeft( '', 'b' );
  expected = [ '', '', '' ];
  test.identical( got,expected );

  /* nothing */

  got = _.strCutOffAllLeft( '', '' );
  expected = [ '', '', '' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllLeft( 'ahpc', 'h' );
  expected = [ 'a', 'h', 'pc' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllLeft( 'ahpc', 'c' );
  expected = [ 'ahp', 'c', '' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllLeft( 'appbb', 'b' );
  expected = [ 'appb', 'b', '' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllLeft( 'jj', 'a' );
  expected = [ '', '', 'jj' ];
  test.identical( got,expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'delimeter must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffAllLeft( 'jj', 1 );
  })

  test.case = 'source must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffAllLeft( 1, '1' );
  })

}

//

function strCutOffAllRight( test )
{
  var got, expected;

  test.case = 'cut in most left position';

  /* nothing */

  got = _.strCutOffAllRight( '', 'b' );
  expected = [ '', '', '' ];
  test.identical( got,expected );

  /* nothing */

  got = _.strCutOffAllRight( '', '' );
  expected = [ '', '', '' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllRight( 'appc', 'p' );
  expected = [ 'a', 'p', 'pc' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllRight( 'appc', 'c' );
  expected = [ 'app', 'c', '' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllRight( 'appc', 'a' );
  expected = [ '', 'a', 'ppc' ];
  test.identical( got,expected );

  /**/

  got = _.strCutOffAllRight( 'jj', 'a' );
  expected = [ 'jj', '', '' ];
  test.identical( got,expected );

  //

  if( !Config.debug )
  return;

  test.case = 'delimeter must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffAllRight( 'jj', 1 );
  });

  test.case = 'source must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strCutOffAllRight( 1, '1' );
  });

}

//

function strStrip( test )
{

  test.case = 'simple string, default options';
  var got = _.strStrip( '\nabc  ' );
  var expected = 'abc';
  test.identical( got,expected );

  test.case = 'arguments as map';
  var got = _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } );
  var expected = 'b';
  test.identical( got,expected );

  test.case = 'nothing to remove';
  var got = _.strStrip( 'test' );
  var expected = 'test';
  test.identical( got, expected );

  test.case = 'removes whitespace from both ends of a string';
  var got = _.strStrip( ' test ' );
  var expected = 'test';
  test.identical( got, expected );

  test.case = 'Empty array';
  var got = _.strStrip( [] );
  var expected = [];
  test.identical( got, expected );

  test.case = 'Array with single string';
  var got = _.strStrip( [ '' ] );
  var expected = [ '' ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strStrip( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strStrip( 123 );
  });

  test.case = 'invalid property type';
  test.shouldThrowError( function()
  {
    _.strStrip( { src : ' word ', delimeter : 0 } );
  });

  test.case = 'invalid property defined';
  test.shouldThrowError( function()
  {
    _.strStrip( { src : ' word ', delimeter : ' ', left : 1 } );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strStrip();
  });

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strStrip( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strStrip( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowError( function( )
  {
    _.strStrip( ' test ', 'redundant argument' );
  } );

}

//

/* qqq : uncover it please */

function strStrip( test )
{
  var cases =
  [
    { description : 'defaults, src is a string' },
    { src : '', expected : '' },
    { src : 'a', expected : 'a' },
    { src : '   a   ', expected : 'a' },
    { src : ' \0 a \0 ', expected : 'a' },
    { src : '\r\n\t\f\v a \v\r\n\t\f', expected : 'a' },

    { description : 'stripper contains regexp special symbols' },
    { src : { src : '\\s\\s', stripper : '\\s' } , expected : '' },
    { src : { src : '(x)(x)', stripper : '(x)' } , expected : '' },
    { src : { src : 'abc', stripper : '[abc]' } , expected : 'abc' },
    { src : { src : '[abc]', stripper : '[abc]' } , expected : '' },
    { src : { src : 'abc', stripper : '[^abc]' } , expected : 'abc' },
    { src : { src : 'abc', stripper : '[a-c]' } , expected : 'abc' },
    { src : { src : '[a-c]', stripper : '[a-c]' } , expected : '' },
    { src : { src : 'ab(a|b)', stripper : '(a|b)' } , expected : 'ab' },
    { src : { src : 'gp', stripper : 'a+' } , expected : 'gp' },
    { src : { src : 'hp', stripper : 'b{3}' } , expected : 'hp' },
    { src : { src : 'acbc', stripper : '^[ab]c$' } , expected : 'acbc' },

    {
      description : 'defaults, src is an array',
      src :
      [
        '',
        'a',
        '   a   ',
        ' \0 a \0 ',
        '\r\n\t\f\v a \v\r\n\t\f'
      ],
      expected :
      [
        '',
        'a',
        'a',
        'a',
        'a'
      ]
    },
    {
      description : 'src array of strings, custom stripper',
      src :
      {
        src :
        [
          '',
          'a',
          ' a ',
          '  a  ',
          ' \n ',
          ' a b c ',
        ],
        stripper : ' '
      },
      expected :
      [
        '',
        'a',
        'a',
        'a',
        '\n',
        'abc'
      ]
    },
    {
      description : 'src array of strings, custom stripper as regexp',
      src :
      {
        src :
        [
          'x',
          'xx',
          'axbxc',
          'x\nx'
        ],
        stripper : new RegExp( 'x' ),
      },
      expected :
      [
        '',
        'x',
        'abxc',
        '\nx'
      ]
    },
    {
      description : 'src array of strings, custom stripper as regexp',
      src :
      {
        src :
        [
          'abc',
          'acb',
          'bac',
          'cab',
        ],
        stripper : /abc|[abc]/,
      },
      expected :
      [
        '',
        'cb',
        'ac',
        'ab'
      ]
    },
    {
      description : 'src array of strings, custom stripper as regexp',
      src :
      {
        src :
        [
          'abc',
          'acb',
          'bac',
          'bca',
          'cba',
          'cab',
        ],
        stripper : /[abc]/g,
      },
      expected : [ '','','', '', '', '' ]
    },
    {
      description : 'src string, stripper array of strings',
      src :
      {
        src : 'xxyy',
        stripper :
        [
          'x',
          'y',
        ]
      },
      expected : ''
    },
    {
      src :
      {
        src : 'jjkk',
        stripper :
        [
          'x',
          'y',
        ]
      },
      expected : 'jjkk'
    },
    {
      description : 'invalid type',
      args : 0,
      err : true
    },
    {
      description : 'too many arguments',
      args : [ 'a', '' ],
      err : true
    },
    {
      description : 'one string has invalid type',
      args : [ [ 'a', 0, 'b' ] ],
      err : true
    },
    {
      description : 'stripper has invalid type',
      args : [ { src : 'a', stripper : 0 } ],
      err : true
    },
    {
      description : 'stripper has invalid type',
      args : [ { src : 'a', stripper : [ 'a', 0 ] } ],
      err : true
    },
  ]

  /**/

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.description )
    test.case = c.description;

    if( c.err )
    test.shouldThrowError( () => _.strStrip.apply( _, _.arrayAs( c.args ) ) );

    if( c.src )
    {
      var identical = test.identical( _.strStrip( c.src ), c.expected );
      if( !identical )
      {
        debugger;
        test.identical( _.strStrip( c.src ), c.expected )
        debugger;
      }
    }

  }

}

//

function strRemoveAllSpaces( test )
{

  test.case = 'removes the spaces from the given string';
  var got = _.strRemoveAllSpaces( 'a b c d e f' );
  var expected = 'abcdef';
  test.identical( got, expected );

  test.case = 'replaces the all spaces with the commas';
  var got = _.strRemoveAllSpaces( 'a b c d e f', ',' );
  var expected = 'a,b,c,d,e,f';
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var got = _.strRemoveAllSpaces( 'a b c d e' );
  var expected = 'abcde';
  test.identical( got,expected );

  test.case = 'sub defined';
  var got = _.strRemoveAllSpaces( 'a b c d e', ', ' );
  var expected = 'a, b, c, d, e';
  test.identical( got,expected );

  test.case = 'empty string';
  var got = _.strRemoveAllSpaces( ' ' );
  var expected = '';
  test.identical( got,expected );

  test.case = 'sub as number';
  var got = _.strRemoveAllSpaces( 'a b c', 0 );
  var expected = 'a0b0c';
  test.identical( got,expected );

  test.case = 'sub as array';
  var got = _.strRemoveAllSpaces( 'a b c d e', [ 5, 6 ] );
  var expected = 'a5,6b5,6c5,6d5,6e';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strRemoveAllSpaces( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strRemoveAllSpaces( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strRemoveAllSpaces();
  });

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strRemoveAllSpaces( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strRemoveAllSpaces( [  ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strRemoveAllSpaces( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowError( function( )
  {
    _.strRemoveAllSpaces( 'a b c d e f', ',', 'redundant argument' );
  } );

}

//

function strStripEmptyLines( test )
{

  test.case = 'simple string';
  var got = _.strStripEmptyLines( 'line_one\n\nline_two' );
  var expected = 'line_one\nline_two';
  test.identical( got,expected );

  test.case = 'empty string';
  var got = _.strStripEmptyLines( '' );
  var expected = '';
  test.identical( got,expected );

  test.case = 'single line';
  var got = _.strStripEmptyLines( 'b' );
  var expected = 'b';
  test.identical( got,expected );

  test.case = 'multiple breaklines';
  var got = _.strStripEmptyLines( '\n\na\n\nb\n\n\n' );
  var expected = 'a\nb';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strStripEmptyLines( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strStripEmptyLines( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strStripEmptyLines();
  });

}

//

function strReplaceWords( test )
{

  test.case = 'simple string';
  var got = _.strReplaceWords( 'a b c d',[ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = 'a x y d';
  test.identical( got,expected );

  test.case = 'escaping string';
  var got = _.strReplaceWords( '\na b \n c d',[ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = '\na x \n y d';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strReplaceWords( '1', '2');
  });

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strReplaceWords( 123,[],[] );
  });

  test.case = 'invalid arrays length';
  test.shouldThrowError( function()
  {
    _.strReplaceWords( 'one two',[ 'one' ],[ 'one', 'two' ] );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowError( function()
  {
    _.strReplaceWords( 'one two',5,[ 'one', 'two' ] );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strReplaceWords();
  });

}

//

function strJoin( test )
{

  test.case = 'join numbers';
  var got = _.strJoin( 1, 2, 3 );
  var expected = '123';
  test.identical( got,expected );

  test.case = 'join array + string';
  var got = _.strJoin( [ 1, 2 ], '3' );
  var expected = [ '13', '23' ];
  test.identical( got,expected );

  test.case = 'join two arrays';
  var got = _.strJoin( [ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = [ 'bx', 'cy' ];
  test.identical( got,expected );

  test.case = 'no arguments';
  var got = _.strJoin( );
  var expected = '';
  test.identical( got,expected );

  test.case = 'one argument';
  var got = _.strJoin( '1' );
  var expected = '1';
  test.identical( got,expected );

  test.case = 'different types';
  var got = _.strJoin( 1, '2', [ '3', 4 ], 5, '6' );
  var expected = [ "12356", "12456" ];
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid argument type';
  test.shouldThrowError( function()
  {
    _.strJoin( { a : 1 }, [ 1 ], [ 2 ] );
  });

  test.case = 'arrays with different length';
  test.shouldThrowError( function()
  {
    _.strJoin( [ 1, 2 ], [ 1 ], [ 2 ] );
  });

}

//

function strUnjoin( test )
{
  var any = _.strUnjoin.any;

  test.case = 'case 1';
  var got = _.strUnjoin( 'prefix_something_postfix',[ 'prefix', any, 'postfix' ] );
  var expected = [ "prefix", "_something_", "postfix" ];
  test.identical( got,expected );

  test.case = 'case 2a';
  var got = _.strUnjoin( 'prefix_something_postfix',[ any, 'something', 'postfix' ] );
  var expected = undefined;
  test.identical( got,expected );

  test.case = 'case 2b';
  var got = _.strUnjoin( 'prefix_something_postfix',[ any, 'something', any, 'postfix' ] );
  var expected = [ "prefix_", "something", '_', "postfix" ];
  test.identical( got,expected );

  test.case = 'case 3a';
  var got = _.strUnjoin( 'prefix_something_postfix', [ 'something', 'postfix', any ] );
  var expected = undefined;
  test.identical( got,expected );

  test.case = 'case 3b';
  var got = _.strUnjoin( 'prefix_something_postfix', [ any, 'something', any, 'postfix', any ] );
  var expected = [ "prefix_","something","_", "postfix", "" ];
  test.identical( got,expected );

  test.case = 'case 4';
  var got = _.strUnjoin( 'abc', [ any ] );
  var expected = [ "abc" ];
  test.identical( got,expected );

  test.case = 'case 5';
  var got = _.strUnjoin( 'abc', [ 'a', any ] );
  var expected = [ "a", "bc" ];
  test.identical( got,expected );

  test.case = 'case 6';
  var got = _.strUnjoin( 'abc', [ 'b', any ] );
  var expected = undefined;
  test.identical( got,expected );

  test.case = 'case 7';
  var got = _.strUnjoin( 'abc', [ any, 'b' ] );
  var expected = undefined;
  test.identical( got,expected );

  test.case = 'case 7';
  var got = _.strUnjoin( 'abc', [ any, 'c' ] );
  var expected = [ "ab", "c" ];
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strUnjoin( '1', '2', '3' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowError( function()
  {
    _.strUnjoin( 123, [] );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowError( function()
  {
    _.strUnjoin( 'one two', 123 );
  });

  test.case = 'invalid array element type';
  test.shouldThrowError( function()
  {
    _.strUnjoin( 'one two', [ 1, 'two' ] );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strUnjoin();
  });

}

//

function strUnicodeEscape( test )
{

  test.case = 'simple string';
  var got = _.strUnicodeEscape( 'prefix' );
  var expected = "\\u0070\\u0072\\u0065\\u0066\\u0069\\u0078";
  test.identical( got,expected );

  test.case = 'escaping';
  var got = _.strUnicodeEscape( '\npostfix//' );
  var expected = "\\u000a\\u0070\\u006f\\u0073\\u0074\\u0066\\u0069\\u0078\\u002f\\u002f";
  test.identical( got,expected );

  test.case = 'empty string';
  var got = _.strUnicodeEscape( '' );
  var expected = "";
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strUnicodeEscape( '1', '2', '3' );
  });

  test.case = 'invalid  argument type';
  test.shouldThrowError( function()
  {
    _.strUnicodeEscape( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strUnicodeEscape();
  });

}

//

function strLinesNumber( test )
{
  var got,expected;

  test.case = 'trivial';

  test.case = 'returns the object';
  var got = _.strLinesNumber( 'abc\ndef\nghi' );
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'returns the object';
  var got = _.strLinesNumber( [] );
  var expected = '';
  test.identical( got, expected );

  //

  test.case = 'string';

  /**/

  got = _.strLinesNumber( '' );
  expected = '1 : ';
  test.identical( got, expected );

  /**/

  got = _.strLinesNumber( 'a' );
  expected = '1 : a';
  test.identical( got, expected );

  /**/

  got = _.strLinesNumber( 'a\nb' );
  expected = '1 : a\n2 : b';
  test.identical( got, expected );

  /**/

  got = _.strLinesNumber( 'a\nb', 2 );
  expected = '2 : a\n3 : b';
  test.identical( got, expected );

  /**/

  got = _.strLinesNumber( 'line1\nline2\nline3' );
  expected =
  [
    '1 : line1',
    '2 : line2',
    '3 : line3',
  ].join( '\n' );
  test.identical( got,expected );

  /**/

  got = _.strLinesNumber( '\n\n' );
  var expected =
  [
    '1 : ',
    '2 : ',
    '3 : ',
  ].join( '\n' );
  test.identical( got,expected );

  //

  test.case = 'array';

  /**/

  got = _.strLinesNumber( [ 'line1', 'line2', 'line3' ] );
  expected =
  [
    '1 : line1',
    '2 : line2',
    '3 : line3',
  ].join( '\n' );

  /**/

  got = _.strLinesNumber( [ 'line', 'line', 'line' ], 2 );
  expected =
  [
    '2 : line',
    '3 : line',
    '4 : line',
  ].join( '\n' );

  /**/

  got = _.strLinesNumber( [ 'line\n', 'line\n', 'line\n' ] );
  expected =
  [
    '1 : line\n',
    '2 : line\n',
    '3 : line\n',
  ].join( '\n' );

  //

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strLinesNumber();
  } );

  test.case = 'argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strLinesNumber( 13 );
  } );

  test.case = 'invalid  argument type';
  test.shouldThrowError( function()
  {
    _.strLinesNumber( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strLinesNumber();
  });

}

//

function strCount( test )
{

  test.case = 'returns 2';
  var got = _.strCount( 'abc\ndef\nghi', '\n' );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'simple string';
  var got = _.strCount( 'abaac','a' );
  var expected = 3;
  test.identical( got,expected );

  test.case = 'empty src';
  var got = _.strCount( '', 'a' );
  var expected = 0;
  test.identical( got,expected );

  test.case = 'empty substring';
  var got = _.strCount( 'a', '' );
  var expected = 0;
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strCount( );
  } );

  test.case = 'first argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strCount( [  ], '\n' );
  } );

  test.case = 'second argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strCount( 'abc\ndef\nghi', 13 );
  } );

  test.case = 'not enough arguments';
  test.shouldThrowError( function( )
  {
    _.strCount( 'abc\ndef\nghi' );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strCount( '1', '2', '3' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowError( function()
  {
    _.strCount( 123, '1' );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowError( function()
  {
    _.strCount( 'one two', 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strCount();
  });

}

//

function strDup( test )
{

  test.case = 'concatenation test';
  var got = _.strDup( 'a', 2 );
  var expected = 'aa';
  test.identical( got,expected );

  test.case = 'invalid times value';
  var got = _.strDup( 'a', -2 );
  var expected = '';
  test.identical( got,expected );

  test.case = 'simple string';
  var got = _.strDup( 'a', 2 );
  var expected = 'aa';
  test.identical( got,expected );

  test.case = 'one space';
  var got = _.strDup( ' ', 2 );
  var expected = '  ';
  test.identical( got,expected );

  test.case = 'zero times';
  var got = _.strDup( 'a', 0 );
  var expected = '';
  test.identical( got,expected );

  test.case = 'returns the empty string';
  var got = _.strDup( 'abc', 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'returns the first copy of the given string';
  var got = _.strDup( 'abc', 1 );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'copies and concatenates first argument three times';
  var got = _.strDup( 'abc', 3 );
  var expected = 'abcabcabc';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strDup( '1', '2', '3' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowError( function()
  {
    _.strDup( 123, 1 );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowError( function()
  {
    _.strDup( 'one', 'two'  );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strDup();
  });

  test.case = 'no arguments';
  test.shouldThrowError( function( )
  {
    _.strDup( );
  } );

  test.case = 'second argument is wrong';
  test.shouldThrowError( function( )
  {
    _.strDup( 'a', 'wrong argument' );
  } );

  test.case = 'second argument is not provided';
  test.shouldThrowError( function( )
  {
    _.strDup( 'a' );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowError( function()
  {
    _.strDup( '1' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowError( function()
  {
    _.strDup( 1,2 );
  });

  test.case = 'invalid second argument type';
  test.shouldThrowError( function()
  {
    _.strDup( '1', '2' );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strDup();
  });

}

//

function strShort( test )
{

  test.case = 'simple string';
  var got = _.strShort( 'string', 4 );
  var expected = '\'st\' ... \'ng\'';
  test.identical( got,expected );

  test.case = 'string with escaping';
  var got = _.strShort( 's\ntring', 4 );
  var expected = '\'s\' ... \'ng\'';
  test.identical( got,expected );

  test.case = 'limit 0';
  var got = _.strShort( 'string', 0 );
  var expected = 'string';
  test.identical( got,expected );

  test.case = 'limit 1';
  var got = _.strShort( 'string', 1 );
  var expected = '\'s\'';
  test.identical( got,expected );

  test.case = 'string wih spaces';
  var got = _.strShort( 'source and', 5 );
  var expected = '\'sou\' ... \'nd\'';
  test.identical( got,expected );

  test.case = 'one argument call';
  var got = _.strShort( { src : 'string', limit : 4, wrap : "'" } );
  var expected = "'st' ... 'ng'";
  test.identical( got,expected );

  test.case = 'string with whitespaces';
  var got = _.strShort( { src : '  simple string   ', limit : 4, wrap : "'" } );
  var expected = "'  ' ... '  '";
  test.identical( got,expected );

  test.case = 'wrap 0';
  var got = _.strShort( { src : 'simple', limit : 4, wrap : 0 } );
  var expected = "si ... le";
  test.identical( got,expected );

  test.case = 'escaping 0';
  var got = _.strShort( { src : 'si\x01mple', limit : 5, wrap : '"',escaping : 0  } );
  var expected = '"si\x01" ... "le"';
  test.identical( got,expected );

  test.case = 'escaping 1';
  var got = _.strShort( { src : 's\u001btring', limit : 4, wrap : '"' } );
  var expected = '"s" ... "ng"';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid first argument type';
  test.shouldThrowError( function()
  {
    _.strShort( 1, 5 );
  });

  test.case = 'invalid second argument type';
  test.shouldThrowError( function()
  {
    _.strShort( 'string', '0' );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strShort();
  });

  test.case = 'unknown property provided';
  test.shouldThrowError( function()
  {
    _.strShort( { src : 'string', limit : 4, wrap : 0, fixed : 5 } );
  });

}

//

function strLinesSelect( test )
{
  var got,expected;
  var src = 'a\nb\nc\nd';

  //

  test.case = 'single line selection';

  /**/

  got = _.strLinesSelect( '', 1 );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( 'abc', 1 );
  expected = 'abc';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( 'abc', 0 );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, 1 );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, 2 );
  expected = 'b';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, -1 );
  expected = '';
  test.identical( got, expected );

  /* line number bigger then actual count of lines */

  got = _.strLinesSelect( src, 99 );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, 1, 2 );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ 1, 2 ] );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ -1, 2 ] );
  expected = 'a';
  test.identical( got, expected );

  //

  test.case = 'multiline selection';

  /**/

  got = _.strLinesSelect( src, [ -1, -1 ] );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( '', [ 1, 3 ] );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ 1, 3 ] );
  expected = 'a\nb';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ -1, 2 ] );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ 1, 4 ] );
  expected = 'a\nb\nc';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ 99, 4 ] );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ 1, 99 ] );
  expected = src;
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect( src, [ 2, 5 ] );
  expected = 'b\nc\nd';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect({ src : src, range : [ 2, 5 ], zero : 4 });
  expected = 'a';
  test.identical( got, expected );

  //

  test.case = 'selection without range provided, selectMode : center';

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 2,
    numberOfLines : 3,
    selectMode : 'center',
    zero : 1
  });
  expected = 'a\nb\nc';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 3,
    selectMode : 'center',
    zero : 1
  });
  expected = 'a\nb';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 1,
    selectMode : 'center',
    zero : 1
  });
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 99,
    selectMode : 'center',
    zero : 1
  });
  expected = src;
  test.identical( got, expected );

  /**/

  var src = 'a\nb\nc\nd';
  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : -1,
    selectMode : 'center',
    zero : 1
  });
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 0,
    numberOfLines : 1,
    selectMode : 'center',
    zero : 1
  });
  expected = '';
  test.identical( got, expected );

  got = _.strLinesSelect
  ({
    src : '',
    line : 1,
    numberOfLines : 1,
    selectMode : 'center',
    zero : 1
  });
  expected = '';
  test.identical( got, expected );

  //

  test.case = 'selection without range provided, selectMode : begin';

  /*two lines from begining of the string*/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 2,
    selectMode : 'begin',
    zero : 1
  });
  expected = 'a\nb';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : -1,
    numberOfLines : 2,
    selectMode : 'begin',
    zero : 1
  });
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 0,
    selectMode : 'begin',
    zero : 1
  });
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 99,
    selectMode : 'begin',
    zero : 1
  });
  expected = src;
  test.identical( got, expected );

  /* zero > range[ 0 ] */

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 5,
    selectMode : 'begin',
    zero : 2
  });
  expected = src;
  test.identical( got, expected );

  //

  test.case = 'selection without range provided, selectMode : end';

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 4,
    numberOfLines : 2,
    selectMode : 'end'
  });
  expected = 'c\nd';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : -1,
    numberOfLines : 2,
    selectMode : 'end'
  });
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 0,
    selectMode : 'end'
  });
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 99,
    selectMode : 'end'
  });
  expected = 'a';
  test.identical( got, expected );

  /* zero > range[ 0 ] */

  got = _.strLinesSelect
  ({
    src : src,
    line : 1,
    numberOfLines : 5,
    selectMode : 'end',
    zero : 2
  });
  expected = '';
  test.identical( got, expected );

  //

  test.case = 'custom new line'
  var src2 = 'a b c d'

  /**/

  got = _.strLinesSelect
  ({
    src : src2,
    range : [ 1, 3 ],
    delimteter : ' '
  });
  expected = 'a b';
  test.identical( got, expected );

  /**/

  got = _.strLinesSelect
  ({
    src : src2,
    range : [ 1, 3 ],
    delimteter : 'x'
  });
  expected = src2;
  test.identical( got, expected );

  //

  test.case = 'number'

  /**/

  got = _.strLinesSelect
  ({
    src : src,
    range : [ 1, 3 ],
    number : 1
  });
  expected = '1 : a\n2 : b';
  test.identical( got, expected );

  //

  var src =
  `Lorem
  ipsum dolor
  sit amet,
  consectetur
  adipisicing
  elit`;

  //

  test.case = 'first line';
  var got = _.strLinesSelect( src, 1 );
  var expected = 'Lorem';
  test.identical( got,expected );

  //

  test.case = 'first two lines';
  var got = _.strLinesSelect( src, 1, 3 );
  var expected =
  `Lorem
  ipsum dolor`;
  test.identical( got,expected );

  //

  test.case = 'range as array';
  var got = _.strLinesSelect( src, [ 1, 3 ] );
  var expected =
  `Lorem
  ipsum dolor`;
  test.identical( got,expected );



  test.case = 'custom new line';
  var src2 ='Lorem||ipsum dolor||sit amet||consectetur'
  var got = _.strLinesSelect( { src : src2, range : [ 3, 5 ], zero : 1, delimteter : '||' } );
  var expected = `sit amet||consectetur`;
  test.identical( got,expected );

  //

  test.case = 'empty line, out of range';
  var got = _.strLinesSelect( { src : '', range : [ 1, 1 ] } );
  var expected = '';
  test.identical( got,expected );

  //

  test.case = 'empty line';
  var got = _.strLinesSelect( { src : '', range : [ 0, 1 ] } );
  var expected = '';
  test.identical( got,expected );

  //

  test.case = 'incorrect range';
  var got = _.strLinesSelect( { src :  src, range : [ 2, 1 ] } );
  var expected = '';
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid first argument type';
  test.shouldThrowError( function()
  {
    _.strLinesSelect( 1, 1 );
  });

  test.case = 'invalid second argument type';
  test.shouldThrowError( function()
  {
    _.strLinesSelect( 'lorem\nipsum\n', 'second'  );
  });

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.strLinesSelect( );
  });

  test.case = 'unknown property provided';
  test.shouldThrowError( function()
  {
    _.strLinesSelect( { src : 'lorem\nipsum\n', range : [ 0, 1 ], x : 1 } );
  });

}

//

function strCommonLeft( test )
{
  test.case = 'no args';
  var got = _.strCommonLeft( );
  var expected = '';
  test.identical( got, expected );

  test.case = 'one argument';
  var got = _.strCommonLeft( 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'ins is empty string';
  var got = _.strCommonLeft( '', 'a', 'b' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'several strings';
  var got = _.strCommonLeft( 'abc', 'abd', 'abc', 'ada' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'one string is empty';
  var got = _.strCommonLeft( 'abc', '', 'abc', 'ada' );
  var expected = '';
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'ins is array';
  test.shouldThrowError( function( )
  {
    _.strCommonLeft( ['a','b','c'], 'abd', 'abc', 'ada' );
  });

}

//

function strCommonRight( test )
{
  test.case = 'no args';
  var got = _.strCommonRight( );
  var expected = '';
  test.identical( got, expected );

  test.case = 'one argument';
  var got = _.strCommonRight( 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'ins is empty string';
  var got = _.strCommonRight( '', 'a', 'b' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'several strings';
  var got = _.strCommonRight( 'a', 'cba', 'dba', 'ada' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'one string is empty';
  var got = _.strCommonRight( 'abc', '', 'abc', 'ada' );
  var expected = '';
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'ins is array';
  test.shouldThrowError( function( )
  {
    _.strCommonRight( ['a','b','c'], 'abd', 'abc', 'ada' );
  });

}

//

function strExtractInlined( test )
{

  function onInlined( part )
  {
    var temp = part.split( ':' )
    if( temp.length === 2 )
    {
      return temp;
    }
    return undefined;
  }

  /* */

  test.case = 'empty';
  var srcStr = '';
  var got = _.strExtractInlined( srcStr );
  var expected = [ '' ];
  test.identical( got, expected );

  /* */

  test.case = 'without inlined text';
  var srcStr = 'a';
  var got = _.strExtractInlined( srcStr );
  var expected = [ 'a' ];
  test.identical( got, expected );

  /* */

  test.case = 'default options';
  var srcStr = 'ab#cd#ef';
  var got = _.strExtractInlined( srcStr );
  var expected = [ 'ab', [ 'cd' ], 'ef' ];
  test.identical( got, expected );

  /* */

  test.case = 'trivial case';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined,  });
  var expected =
  [
    'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and is not'
  ];
  test.identical( got, expected );

  /* */

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this #background:red#is#background:default# text and # is not';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined,  });
  var expected =
  [
    'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not'
  ];
  test.identical( got, expected );

  /* */

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined,  });
  var expected =
  [
    '#simple # text ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not#'
  ];
  test.identical( got, expected );

  /* */

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '#background:red#i#s#background:default##text';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined,  });
  var expected =
  [
    '', [ 'background', 'red' ], 'i#s', [ 'background', 'default' ], '#text'
  ];
  test.identical( got, expected );

  /* */

  test.case = 'inlined at the beginning and the end';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined,  });
  var expected =
  [
    '', [ 'background', 'red' ], 'i#s', [ 'background', 'default' ], ''
  ];
  test.identical( got, expected );

  /* */

  test.case = 'inlined at the beginning and the end with preservingEmpty:0';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined, preservingEmpty : 0 });
  var expected =
  [
    [ 'background', 'red' ], 'i#s', [ 'background', 'default' ],
  ];
  test.identical( got, expected );

  /* */

  test.case = 'wrapped by inlined text';
  var srcStr = '#background:red#text#background:default#';
  var got = _.strExtractInlined({ src : srcStr, onInlined : onInlined,  } );
  var expected =
  [
    '', [ 'background', 'red' ], 'text', [ 'background', 'default' ], '',
  ];
  test.identical( got, expected );

  /* */ //

  test.case = 'preservingEmpty:0, no empty';
  var srcStr = '#inline1#ordinary#inline2#';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0 });
  var expected =
  [
    [ 'inline1' ], 'ordinary', [ 'inline2' ],
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, empty left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0 });
  var expected =
  [
    [ '' ], 'ordinary', [ 'inline2' ],
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, empty right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0 });
  var expected =
  [
    [ 'inline1' ], 'ordinary', [ '' ],
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, empty middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0 });
  var expected =
  [
    [ 'inline1' ], [ 'inline2' ],
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, empty all';
  var srcStr = '####';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0 });
  var expected = [ [ '' ],[ '' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, empty all';
  var srcStr = '';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0 });
  var expected = [];
  test.identical( got, expected );

  /* */ //

  test.case = 'preservingEmpty:0, onInlined:null no empty';
  var srcStr = '#inline1#ordinary#inline2#';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0, onInlined:null });
  var expected =
  [
    'inline1', 'ordinary', 'inline2',
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, onInlined:null, empty left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0, onInlined:null });
  var expected =
  [
    'ordinary', 'inline2',
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, onInlined:null, empty right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0, onInlined:null });
  var expected =
  [
    'inline1', 'ordinary',
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, onInlined:null, empty middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0, onInlined:null });
  var expected =
  [
    'inline1', 'inline2',
  ];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, onInlined:null, empty all';
  var srcStr = '####';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0, onInlined:null });
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'preservingEmpty:0, onInlined:null, empty all';
  var srcStr = '';
  var got = _.strExtractInlined({ src : srcStr, preservingEmpty : 0, onInlined:null });
  var expected = [];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'too many arguments';
  test.shouldThrowError( () => { debugger; _.strExtractInlined( '',{},'' ) } );

}

//

function strExtractInlinedStereo( test )
{
  var got,expected;

  test.case = 'default';

  /* nothing */

  got = _.strExtractInlinedStereo( '' );
  expected = [ '' ];
  test.identical( got, expected );

  /* prefix/postfix # by default*/

  debugger;
  got = _.strExtractInlinedStereo( '#abc#' );
  debugger;
  expected = [ '', 'abc', '' ];
  test.identical( got, expected );

  //

  test.case = 'with options';

  /* pre/post are same*/

  got = _.strExtractInlinedStereo( { prefix : '/', postfix : '/', src : '/abc/' } );
  expected = [ '', 'abc', '' ];
  test.identical( got, expected );

  /**/

  got = _.strExtractInlinedStereo( { prefix : '/', postfix : '/', src : '//abc//' } );
  expected = [ '', '', 'abc', '', '' ];
  test.identical( got, expected );

  /* different pre/post */

  got = _.strExtractInlinedStereo( { prefix : '/#', postfix : '#', src : '/#abc#' } );
  expected = [ 'abc' ];
  test.identical( got, expected );

  /* postfix appears in source two times */
  got = _.strExtractInlinedStereo( { prefix : '/', postfix : '#', src : '/ab#c#' } );
  expected = [ 'ab', 'c#' ];
  test.identical( got, expected );

  /* onInlined #1 */
  function onInlined1( strip )
  {
    if( strip.length )
    return strip;
  }
  got = _.strExtractInlinedStereo( { onInlined : onInlined1, src : '#abc#' } );
  expected = [ '#abc#' ];
  test.identical( got, expected );

  /* onInlined #2 */
  function onInlined2( strip )
  {
    return strip + strip;
  }
  got = _.strExtractInlinedStereo( { prefix : '/', postfix : '#', onInlined : onInlined2, src : '/abc#' } );
  expected = [ 'abcabc' ];
  test.identical( got, expected );

}

//

var Self =
{

  name : 'Tools/base/layer2/String',
  silencing : 0,

  tests :
  {

    strRemoveBegin2 : strRemoveBegin2,
    strRemoveEnd2 : strRemoveEnd2,

    strRemoveBegin : strRemoveBegin,
    strRemoveEnd : strRemoveEnd,

    strReplaceBegin : strReplaceBegin,
    strReplaceEnd : strReplaceEnd,

    strPrependOnce : strPrependOnce,
    strAppendOnce : strAppendOnce,

    //

    strForRange : strForRange,
    strCapitalize : strCapitalize,

    strIndentation : strIndentation,

    strCountLines : strCountLines,

    strSplitFast : strSplitFast,
    strSplit2 : strSplit2,

    strSplit : strSplit,
    strSplitStrNumber : strSplitStrNumber,

    strCutOffLeft : strCutOffLeft,
    strCutOffRight : strCutOffRight,
    strCutOffAllLeft : strCutOffAllLeft,
    strCutOffAllRight : strCutOffAllRight,

    strStrip : strStrip,
    strRemoveAllSpaces : strRemoveAllSpaces,
    strStripEmptyLines : strStripEmptyLines,
    strReplaceWords : strReplaceWords,
    strJoin : strJoin,
    strUnjoin : strUnjoin,
    strUnicodeEscape : strUnicodeEscape,
    strLinesNumber : strLinesNumber,
    strCount : strCount,
    strDup : strDup,

    strShort : strShort,
    strLinesSelect : strLinesSelect,
    strCommonLeft : strCommonLeft,
    strCommonRight : strCommonRight,

    strExtractInlined : strExtractInlined,
    strExtractInlinedStereo : strExtractInlinedStereo,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
