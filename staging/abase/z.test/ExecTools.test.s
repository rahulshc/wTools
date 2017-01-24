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

  require( '../wTools.s' );
  require( '../component/ExecTools.s' );

  // require( '../../../../wTesting/staging/abase/object/Testing.debug.s' );

  require( '../../amid/diagnostic/Testing.debug.s' );

  // try
  // {
  //   require( '../../amid/diagnostic/Testing.debug.s' );
  // }
  // catch( err )
  // {
  //   require( 'wTesting' );
  // }

}

var _ = wTools;
var Self = {};

//

var shell = function shell( test )
{
  var con = new wConsequence().give();

  test.description = 'test';
  test.identical( 0, 0 );

  con
  .ifNoErrorThen( function()
  {
    test.description = 'simple command';
    var con = _.shell( 'exit' );
    return test.shouldMessageOnlyOnce( con );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'bad command, shell';
    var con = _.shell({ code : 'xxx', throwingBadReturnCode : 1, mode : 'shell' });
    return test.shouldThrowError( con );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'bad command, spawn';
    var con = _.shell({ code : 'xxx', throwingBadReturnCode : 1, mode : 'spawn' });
    return test.shouldThrowError( con );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'several arguments';
    var con = _.shell( 'echo echo something' );
    return test.mustNotThrowError( con );
  })
  ;

  return con;
}

//

var Proto =
{

  name : 'ExecTools',
  verbose : 1,

  tests :
  {
    shell : shell,
  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self );

} )( );
