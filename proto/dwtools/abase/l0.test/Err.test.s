( function _Err_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
  // _.include( 'wLooker' );
}

var _ = _global_.wTools;

// --
// tests
// --

function diagnosticStructureGenerate( test )
{

  test.case = 'implicity call';
  var got = _.diagnosticStructureGenerate();
  test.is( _.mapIs( got.structure ) );
  test.identical( got.structure[ 'number.big' ], 1 << 30 );
  test.is( _.numberIs( got.size ) );

  test.case = 'defaultComplexity : 5, depth : 3';
  var got = _.diagnosticStructureGenerate({ defaultComplexity : 5, depth : 3 });
  test.is( _.mapIs( got.structure ) );
  test.is( _.hashMapIs( got.structure.hashmap ) );
  test.is( _.setIs( got.structure.set ) );

}

diagnosticStructureGenerate.timeOut = 30000;

//

function errCatchStackAndMessage( test )
{
  let context = this;
  let visited = [];

  function decrement( i )
  {
    try
    {
      if( i <= 0 )
      throw _.err( 'negative!' );
      return i-1;
    }
    catch( err )
    {
      debugger;
      throw _.err( err, '\nFailed to decrement' );
    }
  }

  function divide( i )
  {
    try
    {
      if( i % 2 === 1 )
      throw _.err( 'odd!' );
      return decrement( i / 2 );
    }
    catch( err )
    {
      throw _.err( err, '\nFailed to divide' );
    }
  }

  let throwsStack =
`
xxx
`

  let callsStack =
`
xxx
`

  try
  {
    divide( 0 );
  }
  catch( err )
  {

    test.description = 'throwsStack';
    let regexp = new RegExp( _.regexpEscape( `${context.nameOfFile}:` ) + '.+', 'g' );
    let throwsStackLocations = _.longOnce( err.throwsStack.match( regexp ) );
    test.is( _.errIs( err ) );
    test.identical( throwsStackLocations.length, 3 );
    test.identical( _.strCount( err.throwsStack, 'caught at' ), 3 );
    test.identical( _.strCount( err.throwsStack, 'caught at decrement @' ), 2 );
    test.identical( _.strCount( err.throwsStack, 'caught at divide @' ), 1 );
    test.identical( _.strCount( err.throwsStack, `${context.nameOfFile}:` ), 3 );

    test.description = 'callsStack';
    test.identical( _.strCount( err.callsStack, 'decrement' ), 1 );
    test.identical( _.strCount( err.callsStack, 'divide' ), 1 );
    test.identical( _.strCount( err.callsStack, `${context.nameOfFile}:` ), 3 );

    visited.push( 'catch1' );
  }

  test.identical( visited, [ 'catch1' ] );
}

// --
// declare
// --

var Self =
{

  name : 'Tools.base.Err',
  silencing : 1,

  context :
  {
    nameOfFile : 'Err.test.s',
  },

  tests :
  {

    diagnosticStructureGenerate,
    errCatchStackAndMessage,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
