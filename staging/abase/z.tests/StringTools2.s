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

var Proto =
{

  name : 'strCapitalize test',

  tests:
  {

    strCapitalize : strCapitalize,

  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.testing.test( Self );

} )( );
