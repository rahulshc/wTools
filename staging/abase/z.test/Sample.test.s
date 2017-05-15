( function _Sample_test_s_( ) {

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
var sourceFilePath = _.diagnosticLocation().full; // typeof module !== 'undefined' ? __filename : document.scripts[ document.scripts.length-1 ].src;

//

function arrayForRange( test )
{

  test.description = 'single zero';
  var got = _.arrayForRange([ 0,1 ]);
  var expected = [ 0 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _.arrayForRange([ 1,1 ]);
  var expected = [];
  test.identical( got,expected );

  test.description = 'single not zero';
  var got = _.arrayForRange([ 1,2 ]);
  var expected = [ 1 ];
  test.identical( got,expected );

  test.description = 'couple of elements';
  var got = _.arrayForRange([ 1,3 ]);
  var expected = [ 1,2 ];
  test.identical( got,expected );

  test.description = 'single number as argument';
  var got = _.arrayForRange( 3 );
  var expected = [ 0,1,2 ];
  test.identical( got,expected );

  test.description = 'complex case';
  var got = _.arrayForRange([ 3,9 ]);
  var expected = [ 3,4,5,6,7,8 ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'extra argument';
    test.shouldThrowErrorSync( function()
    {
      _.arrayForRange( [ 1,3 ],'wrong arguments' );
    });

    test.description = 'argument not wrapped into array';
    test.shouldThrowErrorSync( function()
    {
      _.arrayForRange( 1,3 );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowErrorSync( function()
    {
      _.arrayForRange( 'wrong arguments' );
    });

    test.description = 'no arguments'
    test.shouldThrowErrorSync( function()
    {
      _.arrayForRange();
    });

  }

}

//

var Self =
{

  name : 'simple1',
  sourceFilePath : sourceFilePath,

  tests :
  {

    arrayForRange : arrayForRange,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
