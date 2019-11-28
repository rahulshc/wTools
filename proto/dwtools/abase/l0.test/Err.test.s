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
// tester
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

function diagnosticStack( test )
{
  let context = this;

  test.case = '[ 0, -1 ]';
  var got = _.diagnosticStack([ 0, -1 ]);
  test.gt( got.split( '\n' ).length, 10 );
  test.identical( _.strCount( got, context.nameOfFile ), 1 );

  test.case = '[ 0, Infinity ]';
  var got = _.diagnosticStack([ 0, Infinity ]);
  test.gt( got.split( '\n' ).length, 10 );
  test.identical( _.strCount( got, context.nameOfFile ), 1 );

  test.case = 'comparison of [ 0, -1 ] and [ 0, Infinity ]';
  var got1 = _.diagnosticStack([ 0, -1 ]);
  var got2 = _.diagnosticStack([ 0, Infinity ]);
  test.identical( _.strLinesBut( got1, 0 ), _.strLinesBut( got2, 0 ) );

  test.case = 'comparison of [ 0, -2 ] and [ 0, Infinity ]';
  var got1 = _.diagnosticStack([ 0, -2 ]);
  var got2 = _.diagnosticStack([ 0, Infinity ]);
  test.identical( _.strLinesBut( got1, 0 ), _.strLinesBut( _.strLinesBut( got2, 0 ), -1 ) );

  test.case = 'comparison of default call and [ 0, Infinity ]';
  var got1 = _.diagnosticStack();
  var got2 = _.diagnosticStack([ 0, Infinity ]);
  test.identical( _.strLinesBut( got1, 0 ), _.strLinesBut( got2, 0 ) );

}

//

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

function unhandledError( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let toolsPath = _testerGlobal_.wTools.strEscape( a.path.nativize( a.path.join( __dirname, '../Layer2.s' ) ) );
  let programSourceCode =
`
var toolsPath = '${toolsPath}';
${program.toString()}
program();
`

  a.fileProvider.fileWrite( a.abs( 'Program.js' ), programSourceCode );
  a.jsNonThrowing({ execPath : a.abs( 'Program.js' ) })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- unhandled error -' ), 2 );
    test.identical( _.strCount( op.output, 'Unhandled error' ), 1 );
    test.identical( _.strCount( op.output, '------>' ), 1 );
    test.identical( _.strCount( op.output, '------<' ), 1 );
    test.identical( _.strCount( op.output, '= Process' ), 1 );
    test.identical( _.strCount( op.output, 'Current path :' ), 1 );
    test.identical( _.strCount( op.output, 'Exec path :' ), 1 );
    test.identical( _.strCount( op.output, '= Message of error#' ), 1 );
    test.identical( _.strCount( op.output, '= Condensed calls stack' ), 1 );
    test.identical( _.strCount( op.output, '= Throws stack' ), 1 );
    test.is( true );
    return null;
  });

  return a.ready;

  function program()
  {
    require( toolsPath );
    throw 'Unhandled error'
  }

}

//

function sourceCode( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let toolsPath = _testerGlobal_.wTools.strEscape( a.path.nativize( a.path.join( __dirname, '../Layer2.s' ) ) );
  let programSourceCode =
`
var toolsPath = '${toolsPath}';
${program.toString()}
program();
`

/* xxx : implement helpers */

  a.fileProvider.fileWrite( a.abs( 'Program.js' ), programSourceCode );
  a.jsNonThrowing({ execPath : a.abs( 'Program.js' ) })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- unhandled error -' ), 2 );
    test.identical( _.strCount( op.output, '= Source code from' ), 1 );
    test.identical( _.strCount( op.output, `* 7 :     throw Error( 'Unhandled error' );` ), 1 );
    return null;
  });

  return a.ready;

  function program()
  {
    let _ = require( toolsPath );
    _.include( 'wFiles' );
    throw Error( 'Unhandled error' );
  }

}

//

function asyncStackInConsequenceTrivial( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let toolsPath = _testerGlobal_.wTools.strEscape( a.path.nativize( a.path.join( __dirname, '../Layer2.s' ) ) );
  let programSourceCode =
`
var toolsPath = '${toolsPath}';
${program.toString()}
program();
`

  /* */

  a.fileProvider.fileWrite( a.abs( 'Program.js' ), programSourceCode );
  a.jsNonThrowing({ execPath : a.abs( 'Program.js' ) })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- unhandled error -' ), 2 );
    test.identical( _.strCount( op.output, '= Source code from' ), 1 );
    test.identical( _.strCount( op.output, `Program.js:11` ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function program()
  {
    let delay = 250;
    let _ = require( toolsPath );
    _.include( 'wFiles' );
    _.include( 'wConsequence' );

    var timeBefore = _.time.now();
    var t = _.time.outError( delay );
    t.finally( function( err, got )
    {
      if( err )
      _.errAttend( err );
      return null;
    })
    _.time.out( delay / 2, () => { t.error( _.errAttend( 'stop' ) ); return null; } );

    return t;
  }

}

asyncStackInConsequenceTrivial.timeOut = 30000;
asyncStackInConsequenceTrivial.description =
`
stack has async substack
`

//

function asyncStackInConsequenceThen( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let toolsPath = _testerGlobal_.wTools.strEscape( a.path.nativize( a.path.join( __dirname, '../Layer2.s' ) ) );
  let programSourceCode =
`
var toolsPath = '${toolsPath}';
${program.toString()}
program();
`

  /* */

  logger.log( _.strLinesNumber( programSourceCode ) );
  a.fileProvider.fileWrite( a.abs( 'Program.js' ), programSourceCode );
  a.jsNonThrowing({ execPath : a.abs( 'Program.js' ) })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- unhandled error -' ), 2 );
    test.identical( _.strCount( op.output, '= Source code from' ), 1 );
    test.identical( _.strCount( op.output, `Program.js:11` ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function program()
  {
    let _ = require( toolsPath );
    _.include( 'wFiles' );
    _.include( 'wConsequence' );

    var con = _.Consequence()
    con.then( function callback1( arg )
    {
      return 'callback1';
    })
    con.then( function callback2( arg )
    {
      throw 'callback2';
      return 'callback2';
    })

    _.time.out( 100, function timeOut1()
    {
      con.take( 'timeout1' );
    });

  }

}

asyncStackInConsequenceThen.timeOut = 30000;
asyncStackInConsequenceThen.description =
`
each callback has its own stack
`

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
    nameOfFile : 'Err.test.s',
    suiteTempPath : null,
    assetsOriginalSuitePath : null,
    defaultJsPath : null,
  },

  tests :
  {

    diagnosticStack, /* qqq : extend the routine */
    diagnosticStructureGenerate,
    errCatchStackAndMessage,
    unhandledError,
    sourceCode,
    asyncStackInConsequenceTrivial,
    asyncStackInConsequenceThen,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
