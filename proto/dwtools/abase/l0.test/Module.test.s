( function _Module_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
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

function withIsIncluded( test )
{
  let context = this;
  let a = test.assetFor( false );
  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let program1Path = a.program( program1 );
  let program2Path = a.program({ routine : program2, locals : { _ToolsPath_, program1Path } });

  /* */

  a.appStartNonThrowing({ execPath : program2Path })
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
    console.log( 'program1.begin' ); debugger;
    let _ = require( toolsPath );
    _global_.program2 = true;
    console.log( 'program1.end' );
  }

  function program2()
  {
    console.log( 'program2.begin' );
    let _ = require( _ToolsPath_ );
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

//

function withoutIsIncluded( test )
{
  let context = this;
  let a = test.assetFor( false );
  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let program1Path = a.program( program1 );
  let program2Path = a.program({ routine : program2, locals : { _ToolsPath_, program1Path } });

  /* */

  a.appStartNonThrowing({ execPath : program2Path })
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
    let _ = require( _ToolsPath_ );
    _global_.program2 = true;
    _.module.declare
    ({
      name : 'program1',
      sourcePath : program1Path,
    });
    _.include( 'program1' );
    _.include( 'program1' );
    console.log( 'program2.end' );
  }

}

//

function moduleExportsUndefined( test )
{
  let context = this;
  let a = test.assetFor( false );
  let program1Path = a.program( program1 );
  let modulePath = a.path.join( program1Path, '../module.js' )

  a.fileProvider.fileWrite({ filePath : modulePath, data : `module.exports = undefined;` })

  /* */

  a.appStartNonThrowing({ execPath : program1Path })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'program1.begin' ), 1 );
    test.identical( _.strCount( op.output, 'importedModule: undefined' ), 1 );
    test.identical( _.strCount( op.output, 'program1.end' ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function program1()
  {
    console.log( 'program1.begin' );
    let _ = require( toolsPath );
    var importedModule = require( './module.js' );
    console.log( 'importedModule:', importedModule)
    console.log( 'program1.end' );
  }
}

moduleExportsUndefined.description  =
`
  Included module returns undefined
`

//

function resolve( test )
{
  let context = this;

  var exp = _.path.nativize( _.path.normalize( __dirname + '/../Layer1.s' ) );
  var got = _.module.resolve( 'wTools' );
  test.identical( got, exp );

}

resolve.description  =
`
  Routine _.module.resolve return path to include path of the specified module.
`

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
    appJsPath : null,
  },

  tests :
  {

    withIsIncluded,
    withoutIsIncluded,
    moduleExportsUndefined,
    resolve,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
