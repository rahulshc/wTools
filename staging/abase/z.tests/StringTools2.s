( function _StringTools2_s_( ) {

'use strict';

/*

to run this test
from the project directory run

npm install
node ./staging/z.tests/Sample.test.s

*/

if( typeof module !== 'undefined' )
{

  if( require( 'fs' ).existsSync( __dirname + '/../../amid/diagnostic/Testing.debug.s' ) )
  require( '../../amid/diagnostic/Testing.debug.s' );
  else
  require( 'wTesting' );

  require( '../component/StringTools.s' );

}

var _ = wTools;
var Self = {};

//

var strCapitalize = function( test )
{

  test.description = 'single word';
  var got = _.strCapitalize( 'one' );
  var expected = 'One';
  test.identical( got,expected );

  test.description = 'two words';
  var got = _.strCapitalize( 'one two' );
  var expected = 'One two';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments length';
    test.shouldThrowError( function()
    {
      _.strCapitalize( 'first','wrond argument' );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.strCapitalize( 777 );
    });

    test.description = 'no argument provided';
    test.shouldThrowError( function()
    {
      _.strCapitalize();
    });

  }
}

//

var strStripEmptyLines = function( test )
{

  test.description = 'single line test';
  var got = _.strStripEmptyLines( 'first\n\nsecond' );
  var expected = 'first\nsecond\n';
  test.identical( got,expected );

  test.description = 'no empty lines';
  var got = _.strStripEmptyLines( 'first' );
  var expected = 'first\n';
  test.identical( got,expected );

  test.description = 'empty string';
  var got = _.strStripEmptyLines( '' );
  var expected = '';
  test.identical( got,expected );

  test.description = 'multiple breaklines';
  var got = _.strStripEmptyLines( '\n\na\n\nb\n\n\n' );
  var expected = 'a\nb\n';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strStripEmptyLines( 'line1','line2' );
    });

    test.description = 'wrong argument type';
    test.shouldThrowError( function()
    {
      _.strStripEmptyLines( 111 );
    });

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.strStripEmptyLines( );
    });

  }
}

//

var strReplaceAll = function( test )
{
  test.description = 'simple replace';
  var got = _.strReplaceAll( 'aabaa','b','c' );
  var expected = 'aacaa';
  test.identical( got,expected );

  test.description = 'first two args empty strings';
  var got = _.strReplaceAll( '', '', 'c' );
  var expected = 'c';
  test.identical( got,expected );

  test.description = 'secong argument is empty string';
  var got = _.strReplaceAll( 'a', '', 'c' );
  var expected = 'a';
  test.identical( got,expected );

  test.description = 'all three args empty strings';
  var got = _.strReplaceAll( '', '', '' );
  var expected = '';
  test.identical( got,expected );

  test.description = 'third arg is empty string ';
  var got = _.strReplaceAll( 'a', 'a', '' );
  var expected = '';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1','2','3','4' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( 1,'2','3');
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1',2,'3');
    });

    test.description = 'third argument is wrong';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1','2',3);
    });

  }
}

//

var strDropPrefix = function( test )
{
  test.description = 'returns string with removed occurrence from start';
  var got = _.strDropPrefix( 'example','exa' );
  var expected = 'mple';
  test.identical( got,expected );

  test.description = 'returns original if no occurrence found';
  var got = _.strDropPrefix( 'mple','exa' );
  var expected = 'mple';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strDropPrefix( 'abcd','a','a' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strDropPrefix( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strDropPrefix( 1,'2' );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strDropPrefix( '1',2 );
    });

  }

}

//

var Proto =
{

  name : 'StringTools2 test',

  tests:
  {

    strCapitalize : strCapitalize,
    strStripEmptyLines : strStripEmptyLines,
    strReplaceAll : strReplaceAll,
    strDropPrefix : strDropPrefix

  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.testing.test( Self );

} )( );
