( function _Module_test_s_() {

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

  self.suiteTempPath = path.pathDirTempOpen( path.join( __dirname, '../..'  ), 'module' );
  // self.assetsOriginalSuitePath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/module-' ) )
  path.pathDirTempClose( self.suiteTempPath );
}

// --
// test routines implementation
// --

function basic( test )
{
  let context = this;
  let a = test.assetFor( false );
  let toolsPath = a.path.nativize( a.path.join( __dirname, '../../Tools.s' ) )
  let program1Path = a.program( program1 );
  let program2Path = a.program({ program : program2, globals : { toolsPath, program1Path } });

  /* */

  a.jsNonThrowing({ execPath : program2Path })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'program2.begin' ), 1 );
    test.identical( _.strCount( op.output, 'program1.begin' ), 1 );
    test.identical( _.strCount( op.output, 'program1.end' ), 1 );
    test.identical( _.strCount( op.output, 'program2.end' ), 1 );
    test.identical( _.strCount( op.output, /program2.begin(.|\n|\r)*program1.begin(.|\n|\r)*program1.end(.|\n|\r)*program2.end(.|\n|\r)*/mg ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function program1()
  {
    console.log( 'program1.begin' );
    let _ = require( toolsPath );
    _global_.program2 = true;
    console.log( 'program1.end' );
  }

  function program2()
  {
    console.log( 'program2.begin' );
    let _ = require( toolsPath );
    _global_.program2 = true;
    _.module.declare
    ({
      name : 'program1',
      isIncluded : () => !!_global_.program1,
      sourcePath : program1Path,
    });
    _.include( 'program1' );
    _.include( 'program1' );
    console.log( 'program2.end' );
  }

}

// --
// test suite definition
// --

var Self =
{

  name : 'Tools.base.Module',
  silencing : 1,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    suiteTempPath : null,
    assetsOriginalSuitePath : null,
    defaultJsPath : null,
  },

  tests :
  {

    basic,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
