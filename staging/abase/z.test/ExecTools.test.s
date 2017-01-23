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

  require( '../../../../wTesting/staging/abase/object/Testing.debug.s' );

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

  con
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'simple command';
  //   var con = _.shell( 'sh exit' );
  //   return test.shouldMessageOnlyOnce( con );
  // })
  // // .ifNoErrorThen( function( data )
  // // {
  // //   test.identical( data, 0 );
  // // })
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'incorrect command, error from error event';
  //   var con = _.shell( 'xxx' );
  //   con = test.shouldMessageOnlyOnce( con );
  //   return test.shouldThrowError( con );
  // })
  .ifNoErrorThen( function()
  {
    test.description = 'several arguments';
    var con = _.shell( 'sh ls -al' );
    con = test.shouldMessageOnlyOnce( con );
  });

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
