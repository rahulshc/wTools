( function ExecTools_test_s( ) {

'use strict';

/*

to run this test
from the project directory run

npm install
node ./staging/z.test/ExecTools.test.s

*/

if( typeof module !== 'undefined' )
{

  if( require( 'fs' ).existsSync( __dirname + '/../../amid/diagnostic/Testing.debug.s' ) )
  require( '../../amid/diagnostic/Testing.debug.s' );
  else
  require( 'wTesting' );

  require( '../component/ExecTools.s' );

}

var _ = wTools;
var Self = {};

//

var shell = function( test )
{
  var con = new wConsequence().give();

  con.ifNoErrorThen( function()
  {
    test.description = 'simple command';
    var con = _.shell( 'dir' );
    return test.shouldMessageOnlyOnce( con );
  })
  .ifNoErrorThen( function( data )
  {
    test.identical( data, 0 );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'incorrect command, error from error event';
    var con = _.shell( 'ffff' );
    con = test.shouldMessageOnlyOnce( con );
    return test.shouldThrowError( con );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'incorrect argument, error from close event';
    var con = _.shell( 'dir 2' );
    con = test.shouldMessageOnlyOnce( con );
    return test.shouldThrowError( con );
  });

  return con;
}

//

var Proto =
{

  name : 'ExecTools',

  tests:
  {
    shell : shell,
  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self );

} )( );
