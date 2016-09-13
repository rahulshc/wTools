( function _StringTools2_test_s_( ) {

'use strict';

/*

to run this test
from the project directory run

npm install
node ./staging/z.test/Sample.test.s

*/

if( typeof module !== 'undefined' )
{

  require( '../wTools.s' );
  require( '../component/StringTools.s' );

  if( require( 'fs' ).existsSync( __dirname + '/../../amid/diagnostic/Testing.debug.s' ) )
  require( '../../amid/diagnostic/Testing.debug.s' );
  else
  require( 'wTesting' );

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

  // test.description = 'first two args empty strings';
  // var got = _.strReplaceAll( '', '', 'c' );
  // var expected = 'c';
  // test.identical( got,expected );

  // test.description = 'secong argument is empty string';
  // var got = _.strReplaceAll( 'a', '', 'c' );
  // var expected = 'a';
  // test.identical( got,expected );

  // test.description = 'all three args empty strings';
  // var got = _.strReplaceAll( '', '', '' );
  // var expected = '';
  // test.identical( got,expected );

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

var strDropPostfix = function( test )
{
  test.description = 'returns string with removed occurrence from end';
  var got = _.strDropPostfix( 'example','mple' );
  var expected = 'exa';
  test.identical( got,expected );

  test.description = 'returns original if no occurrence found ';
  var got = _.strDropPostfix( 'example','' );
  var expected = 'example';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strDropPostfix( 'one','two','three' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strDropPostfix( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strDropPostfix( 1,'second' );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strDropPostfix( 'first',2 );
    });

  }
}

//

var strHtmlEscape = function( test )
{
  test.description = 'replaces html escape symbols';
  var got = _.strHtmlEscape( '<&test &text &here>' );
  var expected = '&lt;&amp;test &amp;text &amp;here&gt;';
  test.identical( got,expected );

  test.description = 'replaces html escape symbols from array';
  var got = _.strHtmlEscape( ['&','<'] );
  var expected = '&amp;,&lt;';
  test.identical( got,expected );

  test.description = 'object passed';
  var got = _.strHtmlEscape( {'prop': 'value'} );
  var expected = '[object Object]';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strHtmlEscape( 'one','two' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strHtmlEscape( );
    });
  }
}

//

var strIndentation = function( test )
{
  test.description = 'returns indented string';
  var got = _.strIndentation( 'a\nb\nc','\t' );
  var expected = '\ta\n\tb\n\tc';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strIndentation( 'one','two','three' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strIndentation( );
    });

    test.description = 'first argument type is wrong';
    test.shouldThrowError( function()
    {
      _.strIndentation( 123,'second' );
    });

    test.description = 'second argument type is wrong';
    test.shouldThrowError( function()
    {
      _.strIndentation( 'first', 321 );
    });
  }
}

//

var strCamelize = function( test )
{
  test.description = 'converts string to camelcase';
  var got = _.strCamelize( 'a-b_c/d' );
  var expected = 'aBCD';
  test.identical( got,expected );

  test.description = 'string with spaces';
  var got = _.strCamelize( '.test -str_ing /with .spaces' );
  var expected = 'Test StrIng With Spaces';
  test.identical( got,expected );

  test.description = 'string with no spaces';
  var got = _.strCamelize( 'camel.case/string' );
  var expected = 'camelCaseString';
  test.identical( got,expected );

  test.description = 'empty string';
  var got = _.strCamelize( '' );
  var expected = '';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {
    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strCamelize( 'one','two' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strCamelize( );
    });

    test.description = 'wrong argument type';
    test.shouldThrowError( function()
    {
      _.strCamelize( 111 );
    });

    test.description = 'wrong argument type';
    test.shouldThrowError( function()
    {
      _.strCamelize( [ ] );
    });


  }
}

//

var strFilenameFor = function( test )
{
  test.description = 'converts string to camelcase';
  var got = _.strFilenameFor( "'example\\file?name.txt" );
  var expected = '_example_file_name.txt';
  test.identical( got,expected );

  test.description = 'convertion with options';
  var got = _.strFilenameFor( "'example\\file?name.js",{ 'separator':'#' } );
  var expected = '#example#file#name.js';
  test.identical( got,expected );

  test.description = 'empty string';
  var got = _.strFilenameFor( '' );
  var expected = '';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {
    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strFilenameFor( 'one','two','three' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strFilenameFor( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strFilenameFor( 111 );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strFilenameFor( "'example\\file?name.txt",'wrong' );
    });


  }
}

//

var toStrMethods = function( test )
{
  test.description = 'converts routine to string default options';
  var got = _.toStrMethods( function route() {} );
  var expected = '[ routine route ]';
  test.identical( got,expected );

  test.description = 'converts routine to string, levels:0';
  var got = _.toStrMethods( function route() {}, { levels : 0 } );
  var expected = '[object Function]';
  test.identical( got,expected );

  test.description = 'different input data types';
  var got = _.toStrMethods( [ function route() {}, 0, '1', null ] );
  var expected = '';
  test.identical( got,expected );


  /**/

  if( Config.debug )
  {
    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.toStrMethods( 'one','two' );
    });

    test.description = 'wrong arguments count';
    test.shouldThrowError( function()
    {
      _.toStrMethods( { a : 1 }, { b : 1 }, { json : 1 } );
    });

    test.description = 'onlyRoutines & noRoutine both true';
    test.shouldThrowError( function()
    {
      _.toStrMethods( function f () {},{ noRoutine : 1 } );
    });
  }
}

//

var toStrFields = function( test )
{
  test.description = 'Fields default options';
  var got = _.toStrFields( [ 1, 2, 'text', undefined ] );
  var expected = '[ 1, 2, "text", undefined ]';
  test.identical( got,expected );

  test.description = 'Fields, levels : 0';
  var got = _.toStrFields( [ 1, 2, 'text', undefined ], { levels : 0 } );
  var expected = '[ Array with 4 elements ]';
  test.identical( got,expected );

  test.description = 'Ignore routine';
  var got = _.toStrFields( [ function f () {}, 1, 2, 3 ] );
  var expected = '[ 1, 2, 3 ]';
  test.identical( got,expected );

  test.description = 'no arguments';
  var got = _.toStrFields();
  var expected = 'undefined';
  test.identical( got,expected );



  /**/

  if( Config.debug )
  {
    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.toStrFields( 'one','two' );
    });

    test.description = 'wrong arguments count';
    test.shouldThrowError( function()
    {
      _.toStrFields( { a : 1 }, { b : 1 }, { json : 1 } );
    });

    test.description = 'onlyRoutines & noRoutine both true';
    test.shouldThrowError( function()
    {
      _.toStrFields( function f () {}, { onlyRoutines : 1 } );
    });

  }
}

//

var _toStrShort = function( test )
{
  test.description = 'Array length test';
  var got = _._toStrShort( [ 1, 2, 'text', undefined ] );
  var expected = '[ Array with 4 elements ]';
  test.identical( got,expected );

  test.description = 'date to string';
  var got = _._toStrShort( new Date( Date.UTC( 1993, 12, 12 ) ) );
  var expected = '1994-01-12T00:00:00.000Z';
  test.identical( got,expected );

  test.description = 'string length > 40';
  var got = _._toStrShort( 'toxtndmtmdbmmlzoirmfypyhnrrqfuvybuuvixyrx', {} );
  var expected = 'toxtndmtmdbmmlzoirmfypyhnrrqfuvybuuvixyr...';
  test.identical( got,expected );

  test.description = 'string with options';
  var got = _._toStrShort( '\toxtndmtmdb', { escaping : 1 } );
  var expected = '\\toxtndmtmdb';
  test.identical( got,expected );

  test.description = 'error to string ';
  var got = _._toStrShort( new Error( 'err' ) );
  var expected = '[object Error]';
  test.identical( got,expected );

  test.description = 'no arguments ';
  var got = _._toStrShort();
  var expected = 'undefined';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _._toStrShort( '1', 2 );
    });

    test.description = 'if string and no options provided';
    test.shouldThrowError( function()
    {
      _._toStrShort( '1' );
    });

  }
}

//

var _toStrIsVisibleElement = function( test )
{
  test.description = 'default options';
  var got = _._toStrIsVisibleElement( 123, {} );
  var expected = true;
  test.identical( got,expected );

  test.description = 'noAtomic';
  var got = _._toStrIsVisibleElement( 'test', { noAtomic : 1 } );
  var expected = false;
  test.identical( got,expected );

  test.description = 'noObject';
  var got = _._toStrIsVisibleElement( { a : 'test' }, { noObject : 1 } );
  var expected = false;
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _._toStrIsVisibleElement( '1' );
    });

    test.description = 'second argument is not a object';
    test.shouldThrowError( function()
    {
      _._toStrIsVisibleElement( '1', 2 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrIsVisibleElement();
    });

  }
}

//

var _toStrIsSimpleElement = function( test )
{
  test.description = 'default options';
  var got = _._toStrIsSimpleElement( 123, {} );
  var expected = true;
  test.identical( got,expected );

  test.description = 'string length > 40';
  var got = _._toStrIsSimpleElement( 'toxtndmtmdbmmlzoirmfypyhnrrqfuvybuuvixyrx', {} );
  var expected = false;
  test.identical( got,expected );

  test.description = 'object test';
  var got = _._toStrIsSimpleElement( { a : 1 }, {} );
  var expected = false;
  test.identical( got,expected );

  test.description = 'atomic test';
  var got = _._toStrIsSimpleElement( undefined, {} );
  var expected = true;
  test.identical( got,expected );

  test.description = 'escaping test';
  var got = _._toStrIsSimpleElement( '\naaa', { escaping : 1 } );
  var expected = true;
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _._toStrIsSimpleElement( '1' );
    });

    test.description = 'second argument is not a object';
    test.shouldThrowError( function()
    {
      _._toStrIsSimpleElement( '1', 2 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrIsSimpleElement();
    });

  }
}

//

var _toStrFromRoutine = function( test )
{
  test.description = 'routine test';
  var got = _._toStrFromRoutine( function a () {} );
  var expected = '[ routine a ]';
  test.identical( got,expected );

  test.description = 'routine without name';
  var got = _._toStrFromRoutine( function () {} );
  var expected = '[ routine without name ]';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromRoutine( '1' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrFromRoutine();
    });

  }
}

//

var _toStrFromNumber = function( test )
{
  test.description = 'default options';
  var got = _._toStrFromNumber( 123, {} );
  var expected = '123';
  test.identical( got,expected );

  test.description = 'number precision test';
  var got = _._toStrFromNumber( 123, { precision : 2 } );
  var expected = '1.2e+2';
  test.identical( got,expected );

  test.description = 'number fixed test';
  var got = _._toStrFromNumber( 123, { fixed : 2 } );
  var expected = '123.00';
  test.identical( got,expected );

  test.description = 'invalid option type';
  var got = _._toStrFromNumber( 123, { fixed : '2' } );
  var expected = '123';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromNumber( '1',{} );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromNumber( 1, 2 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrFromNumber();
    });

    test.description = 'precision out of range';
    test.shouldThrowError( function()
    {
      _._toStrFromNumber( 1, { precision : 22 });
    });

    test.description = 'fixed out of range';
    test.shouldThrowError( function()
    {
      _._toStrFromNumber( 1, { precision : 22 });
    });

  }
}

var Proto =
{

  name : 'StringTools2 test',

  tests:
  {

    strCapitalize : strCapitalize,
    strStripEmptyLines : strStripEmptyLines,
    strReplaceAll : strReplaceAll,
    strDropPrefix : strDropPrefix,
    strDropPostfix : strDropPostfix,
    strHtmlEscape : strHtmlEscape,
    strIndentation : strIndentation,
    strCamelize : strCamelize,
    strFilenameFor : strFilenameFor,
    toStrMethods : toStrMethods,
    toStrFields : toStrFields,
    _toStrShort : _toStrShort,
    _toStrIsVisibleElement : _toStrIsVisibleElement,
    _toStrIsSimpleElement : _toStrIsSimpleElement,
    _toStrFromRoutine : _toStrFromRoutine,
    _toStrFromNumber : _toStrFromNumber,

  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.testing.test( Self );

} )( );
