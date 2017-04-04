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

  //if( typeof wBase === 'undefined' )
  try
  {
    require( '../../abase/wTools.s' );
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;

  _.include( 'wTesting' );

}

var _ = wTools;

//

function strCapitalize( test )
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

function strReplaceAll( test )
{
  test.description = 'simple replace';
  var got = _.strReplaceAll( 'aabaa','b','c' );
  var expected = 'aacaa';
  test.identical( got,expected );

  test.description = 'first two args empty strings';
  var got = _.strReplaceAll( '', '', 'c' );
  var expected = '';
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

  test.description = 'one argument call';
  var got = _.strReplaceAll( { dst : 'aaax', dictionary : { 'x' : 'a' } } );
  var expected = 'aaaa';
  test.identical( got,expected );

  test.description = 'two arguments call';
  var got = _.strReplaceAll( 'hello', { 'l' : 'y' } );
  var expected = 'heyyo';
  test.identical( got,expected );

  test.description = 'no occurrences returns origin';
  var got = _.strReplaceAll( 'hello', 'x', 'y' );
  var expected = 'hello';
  test.identical( got,expected );

  test.description = 'empty dictionary';
  var got = _.strReplaceAll( 'hello', { } );
  var expected = 'hello';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1', '2', '3', '4' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( 1, '2','3');
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1', 2, '3');
    });

    test.description = 'third argument is wrong';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1','2', 3);
    });

    test.description = 'second arg is not a Object';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1', 2);
    });

    test.description = 'argument is not a Object';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( '1' );
    });

    test.description = 'wrong type of dictionary value';
    test.shouldThrowError( function()
    {
      _.strReplaceAll( { dst : 'aaax', dictionary : { 'a' : [ 1, 2 ] } } )
    });

  }
}

//

function strDropPrefix( test )
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

function strDropPostfix( test )
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

function strHtmlEscape( test )
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

  test.description = 'empty string';
  var got = _.strHtmlEscape( '' );
  var expected = '';
  test.identical( got,expected );

  test.description = 'nothin replaced';
  var got = _.strHtmlEscape( 'text' );
  var expected = 'text';
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

function strIndentation( test )
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

function strCamelize( test )
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

function strFilenameFor( test )
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

function toStrMethods( test )
{
  test.description = 'converts routine to string default options';
  var got = _.toStrMethods( function route() {} );
  var expected = '[ routine route ]';
  test.identical( got,expected );

  test.description = 'converts routine to string, levels:0';
  var got = _.toStrMethods( function route() {}, { levels : 0 } );
  var expected = '[ routine route ]';
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

function toStrFields( test )
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

function _toStrShort( test )
{
  test.description = 'Array length test';
  var got = _._toStrShort( [ 1, 2, 'text', undefined ], { } );
  var expected = '[ Array with 4 elements ]';
  test.identical( got,expected );

  test.description = 'date to string';
  var got = _._toStrShort( new Date( Date.UTC( 1993, 12, 12 ) ), { }  );
  var expected = '1994-01-12T00:00:00.000Z';
  test.identical( got,expected );

  test.description = 'string length > 40';
  var got = _._toStrShort( 'toxtndmtmdbmmlzoirmfypyhnrrqfuvybuuvixyrx', { stringWrapper : '"' } );
  var expected = '[ "toxtndmtmdbmmlzoirmf" ... "pyhnrrqfuvybuuvixyrx" ]';
  test.identical( got,expected );

  test.description = 'string with options';
  var got = _._toStrShort( '\toxtndmtmdb', { escaping : 1 } );
  var expected = '\\toxtndmtmdb';
  test.identical( got,expected );

  test.description = 'error to string ';
  var got = _._toStrShort( new Error( 'err' ), { } );
  var expected = '[object Error]';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _._toStrShort( '1', 2 );
    });

    test.description = 'only one argument provided';
    test.shouldThrowError( function()
    {
      _._toStrShort( '1' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrShort( );
    });

  }
}

//

function _toStrIsVisibleElement( test )
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

    // test.description = 'second argument is not a object';
    // test.shouldThrowError( function()
    // {
    //   _._toStrIsVisibleElement( '1', 2 );
    // });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrIsVisibleElement();
    });

  }
}

//

function _toStrIsSimpleElement( test )
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

function _toStrFromRoutine( test )
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

function _toStrFromNumber( test )
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

//

function _toStrFromStr( test )
{
  test.description = 'default options';
  var got = _._toStrFromStr( '123', {} );
  var expected = '123';
  test.identical( got,expected );

  test.description = 'escaping';
  var got = _._toStrFromStr( '\n123\u001b', { escaping : 1 } );
  var expected = '\\n123\\u001b';
  test.identical( got,expected );

  test.description = 'stringWrapper';
  var got = _._toStrFromStr( 'string', { stringWrapper : '"' } );
  var expected = '"string"';
  test.identical( got,expected );

  test.description = 'multilinedString';
  var got = _._toStrFromStr( 'string\nstring2', { stringWrapper : '`' } );
  var expected = "`string\nstring2`";
  test.identical( got,expected );


  /**/

  if( Config.debug )
  {

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromStr( 2, {} );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromStr( '1', 2 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrFromStr();
    });

  }
}

//

function _toStrFromArray( test )
{

  test.description = 'default options';
  var got = _._toStrFromArray( [ 1, 2, 3 ], { tab : ' ', dtab : '   ', level : 1, comma : ', ', wrap : 1 } ).text;
  var expected = '[ 1, 2, 3 ]';
  test.identical( got,expected );

  test.description = 'wrap test';
  var got = _._toStrFromArray( [ 1, 2, 3 ], { tab : ' ', dtab : '   ', level : 1, comma : ', ', wrap : 0 } ).text;
  var expected = '   1, 2, 3';
  test.identical( got,expected );

  test.description = 'levels 0 test';
  var got = _._toStrFromArray( [ 1, 2, 3 ], { tab : ' ', dtab : '   ', level : 0, levels : 0, comma : ', ', wrap : 1 } ).text;
  var expected = '[ Array with 3 elements ]';
  test.identical( got,expected );

  test.description = 'dtab & multiline test';
  var got = _._toStrFromArray( [ 1, 2, 3 ], { tab : ' ', dtab: '-', level : 0, comma : ', ', wrap : 1, multiline : 1 } ).text;
  var expected =
  [
    '[',
    ' -1, ',
    ' -2, ',
    ' -3',
    ' ]',
  ].join( '\n' );
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromArray( 2, {} );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromArray( [], 2 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrFromArray();
    });

  }
}

//

function _toStrFromObject( test )
{
  var def = { tab : ' ', dtab : '   ',level : 0, levels : 1, onlyEnumerable : 1, own : 1, colon : ' : ', comma : ', ', wrap : 1, noObject : 0, multiline : 0};

  test.description = 'default options';
  var got = _._toStrFromObject( { a : 1, b : 2 , c : 'text' }, def );
  var expected = '{ a : 1, b : 2, c : text }';
  test.identical( got.text,expected );

  test.description = 'levels 0 test';
  def.levels = 0;
  var got = _._toStrFromObject( { a : 1, b : 2 , c : 'text' }, def );
  var expected = '[ Object with 3 elements ]';
  test.identical( got.text,expected );

  test.description = 'wrap 0 test';
  def.levels = 1;
  def.wrap = 0;
  var got = _._toStrFromObject( { a : 1, b : 2, c : 'text' }, def );
  var expected = 'a : 1, b : 2, c : text';
  test.identical( got.text,expected );

  test.description = 'noObject test';
  def.noObject = 1;
  var got = _._toStrFromObject( { a : 1, b : 2, c : 'text' }, def );
  var expected = undefined;
  test.identical( got,expected );

  test.description = 'dtab & prependTab & multiline test';
  def.noObject = 0;
  def.dtab = '*';
  def.multiline  = 1;
  def.prependTab = 1;
  var got = _._toStrFromObject( { a : 1, b : 2, c : 'text' }, def );
  var expected =
  [
    ' *a : 1, ',
    ' *b : 2, ',
    ' *c : text',
  ].join( '\n' );
  test.identical( got.text,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromObject( 1, {} );
    });

    test.description = 'empty options';
    test.shouldThrowError( function()
    {
      _._toStrFromObject( { a : 1 }, {} );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromObject( { a : 1 }, 2 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrFromObject();
    });

  }
}

//

function _toStrFromContainer( test )
{
  var o = { tab : ' ', dtab : '   ',level : 0, levels : 1, onlyEnumerable : 1, own : 1, colon : ' : ', comma : ', ', wrap : 1, noObject : 0, multiline : 0, noSubObject : 0, prependTab : 1, json : 0, stringWrapper : '"' };
  var src = { a : 1, b : 2, c : 'text' };
  var names = _.mapOwnKeys( src );
  var optionsItem = null;

  function item_options()
  {
  optionsItem = _.mapExtend( {}, o);
  optionsItem.noObject = o.noSubObject ? 1 : 0;
  optionsItem.tab = o.tab + o.dtab;
  optionsItem.level = o.level + 1;
  optionsItem.prependTab = 0;
  };

  test.description = 'default options';
  item_options();
  var got = _._toStrFromContainer
  ({
    values : src,
    names : names,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : !o.multiline,
    prefix : '{',
    postfix : '}',
  });
  var expected = ' { a : 1, b : 2, c : "text" }';
  test.identical( got,expected );

  test.description = 'wrap 0,comma ,dtab, multiline test';

  o.wrap = 0;
  o.comma = '_';
  o.dtab = '*';
  o.colon = ' | ';
  o.multiline = 1;
  item_options();

  var got = _._toStrFromContainer
  ({
    values : src,
    names : names,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : !o.multiline,
    prefix : '{',
    postfix : '}',
  });
  var expected =
  [
    ' *a | 1_',
    ' *b | 2_',
    ' *c | "text"',
  ].join( '\n' );

  test.identical( got,expected );

  test.description = 'json test';

  o.wrap = 1;
  o.comma = ', ';
  o.dtab = '  ';
  o.multiline = 0;
  o.colon = ' : ';
  o.json = 1;
  o.levels = 256;
  item_options();

  var got = _._toStrFromContainer
  ({
    values : src,
    names : names,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : !o.multiline,
    prefix : '{',
    postfix : '}',
  });
  var expected = ' { "a" : 1, "b" : 2, "c" : "text" }';

  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid  argument type';
    test.shouldThrowError( function()
    {
      _._toStrFromContainer( 1 );
    });

    test.description = 'empty object';
    test.shouldThrowError( function()
    {
      _._toStrFromContainer( { } );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._toStrFromContainer();
    });

  }
}

//

function strTimes( test )
{
  test.description = 'concatenation test';
  var got = _.strTimes( 'a', 2 );
  var expected = 'aa';
  test.identical( got,expected );

  test.description = 'invalid times value';
  var got = _.strTimes( 'a', -2 );
  var expected = '';
  test.identical( got,expected );


  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strTimes( '1' );
    });

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strTimes( 1,2 );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _.strTimes( '1', '2' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strTimes();
    });

  }
}

//

function strLineCount( test )
{
  test.description = 'one line string test';
  var got = _.strLineCount( 'one line' );
  var expected = 1;
  test.identical( got,expected );

  test.description = 'multiline string test';
  var got = _.strLineCount( 'first line\nsecond line\nthird line' );
  var expected = 3;
  test.identical( got,expected );

  test.description = 'multiline  text test';
  var got = _.strLineCount( `one
                             two
                             three`
                          );
  var expected = 3;
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strLineCount( '1', '2' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strLineCount( 123 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strLineCount();
    });

  }
}

//

function _strInhalf( test )
{
  test.description = 'three words with comma';
  var got = _._strInhalf( { src : 'one,two,three', delimeter : ',' } );
  var expected = [ 'one,two','three' ];
  test.identical( got,expected );

  test.description = 'array of splitters';
  var got = _._strInhalf( { src : 'one word,two words,three words', delimeter : [ ',',' ' ] } );
  var expected = [ "one word,two words,three", "words" ]
  test.identical( got,expected );

  test.description = 'zero delimeter length';
  var got = _._strInhalf( { src : 'word,word', delimeter : '' } );
  var expected = [ "word,word", "" ];
  test.identical( got,expected );

  test.description = 'left equal zero';
  var got = _._strInhalf( { src : 'word,word_word', delimeter : '_', left : 0 } );
  var expected = [ "word,word", "word" ];
  test.identical( got,expected );

  test.description = 'left 1 & delimeter length equal zero';
  var got = _._strInhalf( { src : 'word,word_word', delimeter : '', left : 1 } );
  var expected = [ "", "word,word_word" ];
  test.identical( got,expected );


  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _._strInhalf( '1', '2' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _._strInhalf( 123 );
    });

    test.description = 'invalid property type';
    test.shouldThrowError( function()
    {
      _._strInhalf( { src : 1 } );
    });

    test.description = 'invalid property type';
    test.shouldThrowError( function()
    {
      _._strInhalf( { src : 'word', delimeter : 0 } );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._strInhalf();
    });

  }
}

//

function strInhalfLeft( test )
{

  test.description = 'three words with comma';
  var got = _.strInhalfLeft( { src : 'ab,bc,cd', delimeter : ',' } );
  var expected = [ "ab", "bc,cd" ];
  test.identical( got,expected );

  test.description = 'array of splitters';
  var got = _.strInhalfLeft( { src : 'one word,two words,three words', delimeter : [ ',',' ' ] } );
  var expected = [ "one", "word,two words,three words" ];
  test.identical( got,expected );

  test.description = 'zero delimeter length';
  var got = _.strInhalfLeft( { src : 'word,word', delimeter : '' } );
  var expected = [ "", "word,word" ];
  test.identical( got,expected );

  test.description = 'two arguments';
  var got = _.strInhalfLeft( 'word,word_word', '_' );
  var expected = [ "word,word", "word" ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft( '1', '2', '3' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft( 123, ' ' );
    });

    test.description = 'delimeter not defined';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft( { src : 1 } );
    });

    test.description = 'invalid property type';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft( { src : 'word', delimeter : 0 } );
    });

    test.description = 'invalid property defined';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft( { src : 'word', delimeter : 0, left : 0 } );
    });

    test.description = 'only one argument provided';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft('one two three ');
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strInhalfLeft();
    });

  }
}

//

function strInhalfRight( test )
{

  test.description = 'three words with comma';
  var got = _.strInhalfRight( { src : 'ab,bc,cd', delimeter : ',' } );
  var expected = [ "ab,bc","cd" ];
  test.identical( got,expected );

  test.description = 'array of splitters';
  var got = _.strInhalfRight( { src : 'one word,two words,three words', delimeter : [ ',',' ' ] } );
  var expected = [ "one word,two words,three", "words" ];
  test.identical( got,expected );

  test.description = 'zero delimeter length';
  var got = _.strInhalfRight( { src : 'word,word', delimeter : '' } );
  var expected = ["word,word", ""]
  test.identical( got,expected );

  test.description = 'two arguments';
  var got = _.strInhalfRight( 'word,word_word', '_' );
  var expected = [ "word,word", "word" ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strInhalfRight( '1', '2', '3' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strInhalfRight( 123, ' ' );
    });

    test.description = 'delimeter not defined';
    test.shouldThrowError( function()
    {
      _.strInhalfRight( { src : 1 } );
    });

    test.description = 'invalid property type';
    test.shouldThrowError( function()
    {
      _.strInhalfRight( { src : 'word', delimeter : 0 } );
    });

    test.description = 'invalid property defined';
    test.shouldThrowError( function()
    {
      _.strInhalfRight( { src : 'word', delimeter : 0, left : 1 } );
    });

    test.description = 'only one argument provided';
    test.shouldThrowError( function()
    {
      _.strInhalfRight('one two three ');
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strInhalfRight();
    });

  }
}

//

function strSplit( test )
{

  test.description = 'simple string, defalut options';
  var got = _.strSplit( 'a b c d' );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.description = 'arguments as map';
  var got = _.strSplit( { src : 'a,b,c,d', delimeter : ','  } );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.description = 'delimeter as array';
  var got = _.strSplit( { src : 'a,b.c.d', delimeter : [ ',', '.' ]  } );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got,expected );

  test.description = 'zero delimeter length';
  var got = _.strSplit( { src : 'a,b.c.d', delimeter : []  } );
  var expected = [ 'a,b.c.d' ];
  test.identical( got,expected );

  test.description = 'stripping off';
  var got = _.strSplit( { src : '    a,b,c,d   ', delimeter : [ ',' ], stripping : 0  } );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got,expected );

  /* */

  test.description = 'preserving delimeters, many delimeters, delimeter on the begin';
  var got = _.strSplit({ src : '.content', preservingDelimeters : 1, delimeter : [ '.','#' ] })
  var expected = [ '.','content' ];
  test.identical( got,expected );

  test.description = 'preserving delimeters, many delimeters, delimeter on the end';
  var got = _.strSplit({ src : 'content.', preservingDelimeters : 1, delimeter : [ '.','#' ] })
  var expected = [ 'content','.' ];
  test.identical( got,expected );

  /* */

  test.description = 'many delimeters having common, preserving empty';
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
  test.description = 'many delimeters having common, removing empty';
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

  test.description = 'having long common';
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

  test.description = 'having long common 2';
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

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strSplit( '1', '2', '3' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strSplit( 123 );
    });

    test.description = 'invalid property type';
    test.shouldThrowError( function()
    {
      _.strSplit( { src : 'word', delimeter : 0 } );
    });

    test.description = 'invalid property defined';
    test.shouldThrowError( function()
    {
      _.strSplit( { src : 'word', delimeter : 0, left : 1 } );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strSplit();
    });

  }
}

//

function strStrip( test )
{

  test.description = 'simple string, defalut options';
  var got = _.strStrip( '\nabc  ' );
  var expected = 'abc';
  test.identical( got,expected );

  test.description = 'arguments as map';
  var got = _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } );
  var expected = 'b';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strStrip( '1', '2', '3' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strStrip( 123 );
    });

    test.description = 'invalid property type';
    test.shouldThrowError( function()
    {
      _.strStrip( { src : ' word ', delimeter : 0 } );
    });

    test.description = 'invalid property defined';
    test.shouldThrowError( function()
    {
      _.strStrip( { src : ' word ', delimeter : ' ', left : 1 } );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strStrip();
    });

  }
}

//

function strRemoveAllSpaces( test )
{

  test.description = 'simple string, defalut options';
  var got = _.strRemoveAllSpaces( 'a b c d e' );
  var expected = 'abcde';
  test.identical( got,expected );

  test.description = 'sub defined';
  var got = _.strRemoveAllSpaces( 'a b c d e', ', ' );
  var expected = 'a, b, c, d, e';
  test.identical( got,expected );

  test.description = 'empty string';
  var got = _.strRemoveAllSpaces( ' ' );
  var expected = '';
  test.identical( got,expected );

  test.description = 'sub as number';
  var got = _.strRemoveAllSpaces( 'a b c', 0 );
  var expected = 'a0b0c';
  test.identical( got,expected );

  test.description = 'sub as array';
  var got = _.strRemoveAllSpaces( 'a b c d e', [ 5, 6 ] );
  var expected = 'a5,6b5,6c5,6d5,6e';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strRemoveAllSpaces( '1', '2', '3' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strRemoveAllSpaces( 123 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strRemoveAllSpaces();
    });

  }
}

//

function strStripEmptyLines( test )
{

  test.description = 'simple string';
  var got = _.strStripEmptyLines( 'line_one\n\nline_two' );
  var expected = 'line_one\nline_two';
  test.identical( got,expected );

  test.description = 'empty string';
  var got = _.strStripEmptyLines( '' );
  var expected = '';
  test.identical( got,expected );

  test.description = 'single line';
  var got = _.strStripEmptyLines( 'b' );
  var expected = 'b';
  test.identical( got,expected );

  test.description = 'multiple breaklines';
  var got = _.strStripEmptyLines( '\n\na\n\nb\n\n\n' );
  var expected = 'a\nb';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strStripEmptyLines( '1', '2', '3' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strStripEmptyLines( 123 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strStripEmptyLines();
    });

  }
}

//

function strReplaceNames( test )
{

  test.description = 'simple string';
  var got = _.strReplaceNames( 'a b c d',[ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = 'a x y d';
  test.identical( got,expected );

  test.description = 'escaping string';
  var got = _.strReplaceNames( '\na b \n c d',[ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = '\na x \n y d';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strReplaceNames( '1', '2');
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strReplaceNames( 123,[],[] );
    });

    test.description = 'invalid arrays length';
    test.shouldThrowError( function()
    {
      _.strReplaceNames( 'one two',[ 'one' ],[ 'one', 'two' ] );
    });

    test.description = 'invalid second arg type';
    test.shouldThrowError( function()
    {
      _.strReplaceNames( 'one two',5,[ 'one', 'two' ] );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strReplaceNames();
    });

  }
}

//

function strJoin( test )
{

  test.description = 'join numbers';
  var got = _.strJoin( 1, 2, 3 );
  var expected = '123';
  test.identical( got,expected );

  test.description = 'join array + string';
  var got = _.strJoin( [ 1, 2 ], '3' );
  var expected = [ '13', '23' ];
  test.identical( got,expected );

  test.description = 'join two arrays';
  var got = _.strJoin( [ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = [ 'bx', 'cy' ];
  test.identical( got,expected );

  test.description = 'no arguments';
  var got = _.strJoin( );
  var expected = '';
  test.identical( got,expected );

  test.description = 'one argument';
  var got = _.strJoin( '1' );
  var expected = '1';
  test.identical( got,expected );

  test.description = 'different types';
  var got = _.strJoin( 1, '2', [ '3', 4 ], 5, '6' );
  var expected = [ "12356", "12456" ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {
    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strJoin( { a : 1 }, [ 1 ], [ 2 ] );
    });

    test.description = 'arrays with different length';
    test.shouldThrowError( function()
    {
      _.strJoin( [ 1, 2 ], [ 1 ], [ 2 ] );
    });

  }
}

//

function strUnjoin( test )
{
  var any = _.strUnjoin.any;

  test.description = 'case 1';
  var got = _.strUnjoin( 'prefix_something_postfix',[ 'prefix', any, 'postfix' ] );
  var expected = [ "prefix", "_something_", "postfix" ];
  test.identical( got,expected );

  test.description = 'case 2a';
  var got = _.strUnjoin( 'prefix_something_postfix',[ any, 'something', 'postfix' ] );
  var expected = undefined;
  test.identical( got,expected );

  test.description = 'case 2b';
  var got = _.strUnjoin( 'prefix_something_postfix',[ any, 'something', any, 'postfix' ] );
  var expected = [ "prefix_", "something", '_', "postfix" ];
  test.identical( got,expected );

  test.description = 'case 3a';
  var got = _.strUnjoin( 'prefix_something_postfix', [ 'something', 'postfix', any ] );
  var expected = undefined;
  test.identical( got,expected );

  test.description = 'case 3b';
  var got = _.strUnjoin( 'prefix_something_postfix', [ any, 'something', any, 'postfix', any ] );
  var expected = [ "prefix_","something","_", "postfix", "" ];
  test.identical( got,expected );

  test.description = 'case 4';
  var got = _.strUnjoin( 'abc', [ any ] );
  var expected = [ "abc" ];
  test.identical( got,expected );

  test.description = 'case 5';
  var got = _.strUnjoin( 'abc', [ 'a', any ] );
  var expected = [ "a", "bc" ];
  test.identical( got,expected );

  test.description = 'case 6';
  var got = _.strUnjoin( 'abc', [ 'b', any ] );
  var expected = undefined;
  test.identical( got,expected );

  test.description = 'case 7';
  var got = _.strUnjoin( 'abc', [ any, 'b' ] );
  var expected = undefined;
  test.identical( got,expected );

  test.description = 'case 7';
  var got = _.strUnjoin( 'abc', [ any, 'c' ] );
  var expected = [ "ab", "c" ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strUnjoin( '1', '2', '3' );
    });

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strUnjoin( 123, [] );
    });

    test.description = 'invalid second arg type';
    test.shouldThrowError( function()
    {
      _.strUnjoin( 'one two', 123 );
    });

    test.description = 'invalid array element type';
    test.shouldThrowError( function()
    {
      _.strUnjoin( 'one two', [ 1, 'two' ] );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strUnjoin();
    });

  }
}

//

function strUnicodeEscape( test )
{

  test.description = 'simple string';
  var got = _.strUnicodeEscape( 'prefix' );
  var expected = "\\u0070\\u0072\\u0065\\u0066\\u0069\\u0078";
  test.identical( got,expected );

  test.description = 'escaping';
  var got = _.strUnicodeEscape( '\npostfix//' );
  var expected = "\\u000a\\u0070\\u006f\\u0073\\u0074\\u0066\\u0069\\u0078\\u002f\\u002f";
  test.identical( got,expected );

  test.description = 'empty string';
  var got = _.strUnicodeEscape( '' );
  var expected = "";
  test.identical( got,expected );



  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strUnicodeEscape( '1', '2', '3' );
    });

    test.description = 'invalid  argument type';
    test.shouldThrowError( function()
    {
      _.strUnicodeEscape( 123 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strUnicodeEscape();
    });

  }
}

//

function strLinesNumber( test )
{

  test.description = 'simple string';
  var got = _.strLinesNumber( 'line1\nline2\nline3' );
  var expected =
  [
    '1 : line1',
    '2 : line2',
    '3 : line3',
  ].join( '\n' );
  test.identical( got,expected );

  test.description = 'empty string with escaping';
  var got = _.strLinesNumber( '\n\n' );
  var expected =
  [
    '1 : ',
    '2 : ',
    '3 : ',
  ].join( '\n' );
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'invalid  argument type';
    test.shouldThrowError( function()
    {
      _.strLinesNumber( 123 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strLinesNumber();
    });

  }
}

//

function strCount( test )
{

  test.description = 'simple string';
  var got = _.strCount( 'abaac','a' );
  var expected = 3;
  test.identical( got,expected );

  test.description = 'empty src';
  var got = _.strCount( '', 'a' );
  var expected = 0;
  test.identical( got,expected );

  test.description = 'empty substring';
  var got = _.strCount( 'a', '' );
  var expected = 0;
  test.identical( got,expected );



  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strCount( '1', '2', '3' );
    });

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strCount( 123, '1' );
    });

    test.description = 'invalid second arg type';
    test.shouldThrowError( function()
    {
      _.strCount( 'one two', 123 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strCount();
    });

  }
}

//

function strDup( test )
{

  test.description = 'simple string';
  var got = _.strDup( 'a', 5 );
  var expected = 'aaaaa';
  test.identical( got,expected );

  test.description = 'one space';
  var got = _.strDup( ' ', 2 );
  var expected = '  ';
  test.identical( got,expected );

  test.description = 'zero times';
  var got = _.strDup( 'a', 0 );
  var expected = '';
  test.identical( got,expected );



  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strDup( '1', '2', '3' );
    });

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strDup( 123, 1 );
    });

    test.description = 'invalid second arg type';
    test.shouldThrowError( function()
    {
      _.strDup( 'one', 'two'  );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strDup();
    });

  }
}

//

function strToBytes( test )
{

  test.description = 'simple string';
  var got = _.strToBytes( 'abcd' );
  var expected = new Uint8Array ( [ 97, 98, 99, 100 ] );
  test.identical( got,expected );

  test.description = 'escaping';
  var got = _.strToBytes( '\u001bABC\n\t' );
  var expected = new Uint8Array ( [ 27, 65, 66, 67, 10, 9 ] );
  test.identical( got,expected );

  test.description = 'zero length';
  var got = _.strToBytes( '' );
  var expected = new Uint8Array ( [ ] );
  test.identical( got,expected );


  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strToBytes( '1', '2' );
    });

    test.description = 'invalid argument type';
    test.shouldThrowError( function()
    {
      _.strToBytes( 0 );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strToBytes();
    });

  }
}

//

function strMetricFormat( test )
{

  test.description = 'default options';
  var got = _.strMetricFormat( "100m", { } );
  var expected = "100.0 ";
  test.identical( got,expected );

  test.description = 'default options';
  var got = _.strMetricFormat( 0.005 );
  var expected = "5.0 m";
  test.identical( got,expected );

  test.description = 'number to million';
  var got = _.strMetricFormat( 1, { metric : 6 } );
  var expected = "1.0 M";
  test.identical( got,expected );

  test.description = 'metric out of range';
  var got = _.strMetricFormat( 1, { metric : 25 } );
  var expected = "1.0 ";
  test.identical( got,expected );

  test.description = 'fixed : 0';
  var got = _.strMetricFormat( "1300", { fixed : 0 } );
  var expected = "1 k";
  test.identical( got,expected );

  test.description = 'divisor, thousand test';
  var got = _.strMetricFormat( "1000000",{ divisor : 2, thousand:100 } );
  var expected = "1.0 M";
  test.identical( got,expected );

  test.description = 'divisor, thousand,dimensions,metric test';
  var got = _.strMetricFormat( "10000", { divisor : 2, thousand : 10, dimensions : 3,metric: 1 } );
  var expected = '10.0 k'
  test.identical( got,expected );

  test.description = 'divisor, thousand,dimensions test';
  var got = _.strMetricFormat( "10000", { divisor : 2, thousand : 10, dimensions : 3 } );
  var expected = "10.0 h";
  test.identical( got,expected );

  test.description = 'divisor, thousand,dimensions,fixed test';
  var got = _.strMetricFormat( "10000", { divisor : 2, thousand : 10, dimensions : 3, fixed : 0 } );
  var expected = "10 h";
  test.identical( got,expected );



  /**/

  if( Config.debug )
  {

    test.description = 'invalid arguments count';
    test.shouldThrowError( function()
    {
      _.strMetricFormat( '1', { fixed : 0 }, '3' );
    });

    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strMetricFormat( [ 1, 2, 3 ] );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _.strMetricFormat( 11, '0' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strMetricFormat();
    });

    test.description = 'fixed out of range';
    test.shouldThrowError( function()
    {
      _.strMetricFormat( "1300", { fixed : 22 } );
    });

  }
}

//

function strMetricFormatBytes( test )
{

  test.description = 'default options';
  var got = _.strMetricFormatBytes( 1024 );
  var expected = '1024.0 b';
  test.identical( got,expected );

  test.description = 'default options';
  var got = _.strMetricFormatBytes( 2500 );
  var expected = '2.4 kb';
  test.identical( got,expected );

  test.description = 'fixed';
  var got = _.strMetricFormatBytes( 2500, { fixed : 0 } );
  var expected = '2 kb';
  test.identical( got,expected );

  test.description = 'invalid metric value';
  var got = _.strMetricFormatBytes( 2500 , { metric:4 } );
  var expected = '2500.0 b';
  test.identical( got,expected );

  test.description = 'divisor test';
  var got = _.strMetricFormatBytes( Math.pow(2,32) , { divisor:4, thousand: 1024 } );
  var expected = '4.0 Tb';
  test.identical( got,expected );


  /**/

  if( Config.debug )
  {
    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strMetricFormatBytes( [ '1', '2', '3' ] );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _.strMetricFormatBytes( 0, '0' );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strMetricFormatBytes();
    });

    test.description = 'fixed out of range';
    test.shouldThrowError( function()
    {
      _.strMetricFormatBytes( "1300", { fixed : 22 } );
    });

  }
}

//

function strTimeFormat( test )
{

  test.description = 'simple number';
  var got = _.strTimeFormat( 1000 );
  var expected = '1.000 s';
  test.identical( got,expected );

  test.description = 'simple number';
  var got = _.strTimeFormat( 1);
  var expected = '1.000 ms';
  test.identical( got,expected );

  test.description = 'number as string';
  var got = _.strTimeFormat( '1.5' );
  var expected = '1.500 ms';
  test.identical( got,expected );

  test.description = 'big number';
  var got = _.strTimeFormat( Math.pow( 4,7 ) );
  var expected = '16.384 s';
  test.identical( got,expected );

  test.description = 'zero';
  var got = _.strTimeFormat( 0 );
  var expected = '0.000 ys';
  test.identical( got,expected );

  test.description = 'empty call';
  var got = _.strTimeFormat(  );
  var expected = 'NaN s';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

  }
}

//

function strShort( test )
{

  test.description = 'simple string';
  var got = _.strShort( 'string', 4 );
  var expected = '"st" ... "ng"';
  test.identical( got,expected );

  test.description = 'string with escaping';
  var got = _.strShort( 's\ntring', 4 );
  var expected = '"s" ... "ng"';
  test.identical( got,expected );

  test.description = 'limit 0';
  var got = _.strShort( 'string', 0 );
  var expected = 'string';
  test.identical( got,expected );

  test.description = 'limit 1';
  var got = _.strShort( 'string', 1 );
  var expected = '"s"';
  test.identical( got,expected );

  test.description = 'string wih spaces';
  var got = _.strShort( 'str  and', 5 );
  var expected = '"str" ... "nd"';
  test.identical( got,expected );

  test.description = 'one argument call';
  var got = _.strShort( { src : 'string', limit : 4, wrap : "'" } );
  var expected = "'st' ... 'ng'";
  test.identical( got,expected );

  test.description = 'string with whitespaces';
  var got = _.strShort( { src : '  simple string   ', limit : 4, wrap : "'" } );
  var expected = "'  ' ... '  '";
  test.identical( got,expected );

  test.description = 'wrap 0';
  var got = _.strShort( { src : 'simple', limit : 4, wrap : 0 } );
  var expected = "si ... le";
  test.identical( got,expected );

  test.description = 'escaping 0';
  var got = _.strShort( { src : 'si\x01mple', limit : 5, wrap : '"',escaping : 0  } );
  var expected = '"si\x01" ... "le"';
  test.identical( got,expected );

  test.description = 'escaping 1';
  var got = _.strShort( { src : 's\u001btring', limit : 4, wrap : '"' } );
  var expected = '"s" ... "ng"';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {
    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strShort( 1, 5 );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _.strShort( 'string', '0' );
    });
    // test.description = 'invalid argument type( not a Object )';
    // test.shouldThrowError( function()
    // {
    //   _.strShort( 'src' );
    // });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strShort();
    });

    test.description = 'unknown property provided';
    test.shouldThrowError( function()
    {
      _.strShort( { src : 'string', limit : 4, wrap : 0, fixed : 5 } );
    });

  }
}

//

function strLinesSelect( test )
{
  var src =
  `Lorem
  ipsum dolor
  sit amet,
  consectetur
  adipisicing
  elit`;

  test.description = 'first line';
  var got = _.strLinesSelect( src, 0 );
  var expected = 'Lorem';
  test.identical( got,expected );

  test.description = 'first two lines';
  var got = _.strLinesSelect( src, 0, 2 );
  var expected =
  `Lorem
  ipsum dolor`;
  test.identical( got,expected );

  test.description = 'range as array';
  var got = _.strLinesSelect( src, [ 0, 2 ] );
  var expected =
  `Lorem
  ipsum dolor`;
  test.identical( got,expected );

  test.description = 'custom new line';
  var src2 ='Lorem||ipsum dolor||sit amet||consectetur'
  var got = _.strLinesSelect( { src :  src2, range : [ 2, 4 ], nl : '||' } );
  var expected = `||sit amet||consectetur`;
  test.identical( got,expected );

  test.description = 'empty line, out of range';
  var got = _.strLinesSelect( { src :  '', range : [ 1, 1 ] } );
  var expected = undefined;
  test.identical( got,expected );

  test.description = 'empty line';
  var got = _.strLinesSelect( { src :  '', range : [ 0, 1 ] } );
  var expected = '';
  test.identical( got,expected );

  test.description = 'incorrect range';
  var got = _.strLinesSelect( { src :  src, range : [ 2, 1 ] } );
  var expected = '';
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {
    test.description = 'invalid first argument type';
    test.shouldThrowError( function()
    {
      _.strLinesSelect( 1, 1 );
    });

    test.description = 'invalid second argument type';
    test.shouldThrowError( function()
    {
      _.strLinesSelect( 'lorem\nipsum\n', 'second'  );
    });

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.strLinesSelect( );
    });

    test.description = 'unknown property provided';
    test.shouldThrowError( function()
    {
      _.strLinesSelect( { src : 'lorem\nipsum\n', range : [ 0, 1 ], x : 1 } );
    });

  }
}

//

function strCommonLeft( test )
{
  test.description = 'no args';
  var got = _.strCommonLeft( );
  var expected = '';
  test.identical( got, expected );

  test.description = 'one argument';
  var got = _.strCommonLeft( 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.description = 'ins is empty string';
  var got = _.strCommonLeft( '', 'a', 'b' );
  var expected = '';
  test.identical( got, expected );

  test.description = 'several strings';
  var got = _.strCommonLeft( 'abc', 'abd', 'abc', 'ada' );
  var expected = 'a';
  test.identical( got, expected );

  test.description = 'one string is empty';
  var got = _.strCommonLeft( 'abc', '', 'abc', 'ada' );
  var expected = '';
  test.identical( got, expected );

  if( Config.debug )
  {
    test.description = 'ins is array';
    test.shouldThrowError( function( )
    {
      _.strCommonLeft( ['a','b','c'], 'abd', 'abc', 'ada' );
    });
  }
}

//

function strCommonRight( test )
{
  test.description = 'no args';
  var got = _.strCommonRight( );
  var expected = '';
  test.identical( got, expected );

  test.description = 'one argument';
  var got = _.strCommonRight( 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.description = 'ins is empty string';
  var got = _.strCommonRight( '', 'a', 'b' );
  var expected = '';
  test.identical( got, expected );

  test.description = 'several strings';
  var got = _.strCommonRight( 'a', 'cba', 'dba', 'ada' );
  var expected = 'a';
  test.identical( got, expected );

  test.description = 'one string is empty';
  var got = _.strCommonRight( 'abc', '', 'abc', 'ada' );
  var expected = '';
  test.identical( got, expected );

  if( Config.debug )
  {
    test.description = 'ins is array';
    test.shouldThrowError( function( )
    {
      _.strCommonRight( ['a','b','c'], 'abd', 'abc', 'ada' );
    });
  }
}

//

function strExtractStrips( test )
{

  function onStrip( part )
  {
    var temp = part.split( ':' )
    if( temp.length === 2 )
    {
      return temp;
    }
    return undefined;
  }

  test.description = 'case 1';
  var str = 'this #background:red#is#background:default# text and # is not';
  var got = _.strExtractStrips( str, { onStrip : onStrip } );
  var expected =
  [
    'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not'
  ];
  test.identical( got, expected );

  test.description = 'case 2';
  var str = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strExtractStrips( str, { onStrip : onStrip } );
  var expected =
  [
    '#simple # text ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not#'
  ];
  test.identical( got, expected );

  test.description = 'case 3';
  var str = '#background:red#i#s#background:default##text';
  var got = _.strExtractStrips( str, { onStrip : onStrip } );
  var expected =
  [
    [ 'background', 'red' ], 'i#s', [ 'background', 'default' ], '#text'
  ];
  test.identical( got, expected );

  test.description = 'warapped by strips';
  var str = '#background:red#text#background:default#';
  var got = _.strExtractStrips( str, { onStrip : onStrip } );
  var expected =
  [
    [ 'background', 'red' ], 'text', [ 'background', 'default' ]
  ];
  test.identical( got, expected );

}

//

var Self =
{

  name : 'StringTools tests 2',
  verbosity : 6,

  tests :
  {
    strCapitalize : strCapitalize,
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
    _toStrFromStr : _toStrFromStr,
    _toStrFromArray : _toStrFromArray,
    _toStrFromObject : _toStrFromObject,
    _toStrFromContainer : _toStrFromContainer,
    _toStrFromContainer : _toStrFromContainer,

    strTimes : strTimes,
    strLineCount : strLineCount,
    _strInhalf : _strInhalf,
    strInhalfLeft : strInhalfLeft,
    strInhalfRight : strInhalfRight,

    strSplit : strSplit,

    strStrip : strStrip,
    strRemoveAllSpaces : strRemoveAllSpaces,
    strStripEmptyLines : strStripEmptyLines,
    strReplaceNames : strReplaceNames,
    strJoin : strJoin,
    strUnjoin : strUnjoin,
    strUnicodeEscape : strUnicodeEscape,
    strLinesNumber : strLinesNumber,
    strCount : strCount,
    strDup : strDup,
    strToBytes : strToBytes,
    strMetricFormat : strMetricFormat,
    strMetricFormatBytes : strMetricFormatBytes,
    strTimeFormat : strTimeFormat,
    strShort : strShort,
    strLinesSelect : strLinesSelect,
    strCommonLeft : strCommonLeft,
    strCommonRight : strCommonRight,
    strExtractStrips : strExtractStrips,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
