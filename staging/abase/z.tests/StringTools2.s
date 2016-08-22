( function _StringTools2_test_s_( ) {

'use strict';

/*

to run this test
from the project directory run

npm install
node ./staging/z.tests/Sample.test.s

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

  }
}

//

var Proto =
{

  name : 'strCapitalize test',

  tests:
  {

    strCapitalize : strCapitalize,
    strStripEmptyLines : strStripEmptyLines

  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.testing.test( Self );

} )( );
