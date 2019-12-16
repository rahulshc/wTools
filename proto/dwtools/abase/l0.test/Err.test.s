( function _Err_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

let _ = _global_.wTools;
let fileProvider = _testerGlobal_.wTools.fileProvider;
let path = fileProvider.path;

// --
// context
// --

function onSuiteBegin()
{
  let self = this;

  self.suiteTempPath = path.pathDirTempOpen( path.join( __dirname, '../..'  ), 'err' );
  self.assetsOriginalSuitePath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/err-' ) )
  path.pathDirTempClose( self.suiteTempPath );
}

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

function errArgumentObject( test )
{
  let context = this;
  let visited = [];

  var args = [ 'str', { num : 1 } ];
  var err = _._err({ args });
  test.is( _.errIs( err ) );

  var errStr = String( err );
  console.log( errStr );
  test.identical( _.strCount( errStr, 'at Object.errArgumentObject' ), 2 );
  test.identical( _.strCount( errStr, '* 68 :   var err = _._err({ args });' ), 1 );

}

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
    test.identical( _.strCount( err.throwsStack, 'thrown at' ), 3 );
    test.identical( _.strCount( err.throwsStack, 'thrown at decrement @' ), 2 );
    test.identical( _.strCount( err.throwsStack, 'thrown at divide @' ), 1 );
    test.identical( _.strCount( err.throwsStack, `${context.nameOfFile}:` ), 3 );

    test.description = 'callsStack';
    test.identical( _.strCount( err.callsStack, 'decrement' ), 1 );
    test.identical( _.strCount( err.callsStack, 'divide' ), 1 );
    test.identical( _.strCount( err.callsStack, `${context.nameOfFile}:` ), 3 );

    visited.push( 'catch1' );
  }

  test.identical( visited, [ 'catch1' ] );
}

//

function uncaughtError( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let programPath = a.program( program );

  /* */

  a.jsNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- uncaught error -' ), 2 );
    test.identical( _.strCount( op.output, 'Uncaught error' ), 1 );
    test.identical( _.strCount( op.output, '------>' ), 1 );
    test.identical( _.strCount( op.output, '------<' ), 1 );
    test.identical( _.strCount( op.output, '= Process' ), 1 );
    test.identical( _.strCount( op.output, 'Current path :' ), 1 );
    test.identical( _.strCount( op.output, 'Exec path :' ), 1 );
    test.identical( _.strCount( op.output, '= Message of error#' ), 1 );
    test.identical( _.strCount( op.output, '= Beautified calls stack' ), 1 );
    test.identical( _.strCount( op.output, '= Throws stack' ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function program()
  {
    require( toolsPath );
    throw 'Uncaught error'
  }

}

//

function sourceCode( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let programPath = a.program( program );

  /* */

  a.jsNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- uncaught error -' ), 2 );
    test.identical( _.strCount( op.output, '= Source code from' ), 1 );
    test.identical( _.strCount( op.output, `* 5 :     throw Error( 'Uncaught error' );` ), 1 );
    return null;
  });

  return a.ready;

  function program()
  {
    let _ = require( toolsPath );
    _.include( 'wFiles' );
    throw Error( 'Uncaught error' );
  }

}

//

function assert( test )
{
  var err;

  test.case = 'assert pass condition';
  var got = _.assert( 5 === 5 );
  test.identical( got, true );

  test.case = 'passed failure condition : should generates exception';
  try
  {
    _.assert( 5 != 5 )
  }
  catch ( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );

  test.case = 'passed failure condition with passed message : should generates exception with message';
  try
  {
    _.assert( false, 'short error description' )
  }
  catch ( e )
  {
    err = e;
  }
  test.identical( /short error description/.test( err.message ), true );

}

// --
// declare
// --

var Self =
{

  name : 'Tools.base.Err',
  silencing : 1,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    nameOfFile : _.introspector.location().fileName,
    suiteTempPath : null,
    assetsOriginalSuitePath : null,
    execJsPath : null,
  },

  tests :
  {

    /* qqq : implement test routine for _.err */

    diagnosticStructureGenerate,

    errArgumentObject,
    errCatchStackAndMessage,

    uncaughtError,
    sourceCode,
    assert,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
