( function _Module_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;
const __ = _globals_.testing.wTools;
let fileProvider = __.fileProvider;
let path = fileProvider.path;

// --
// context
// --

function onSuiteBegin()
{
  let self = this;

  self.suiteTempPath = path.tempOpen( path.join( __dirname, '../..'  ), 'module' );
  // self.assetsOriginalPath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/module-' ) )
  path.tempClose( self.suiteTempPath );
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
    _.module.predeclare
    ({
      name : 'program1',
      isIncluded : () => !!_global_.program1,
      sourcePath : program1Path,
      basePath : '.',
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
    _.module.predeclare
    ({
      name : 'program1',
      sourcePath : program1Path,
      basePath : '.',
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

//

function toolsPathGetBasic( test )
{
  let context = this;

  /* */

  test.case = 'basic';
  var got = _.module.toolsPathGet();
  var exp = _.path.nativize( __.path.join( __dirname, '../../Tools.s' ) );
  test.identical( got, exp );
  console.log( `toolsPath : ${got}` );

  /* */

}

//

function toolsPathGetTester( test )
{
  let context = this;
  let a = test.assetFor( false );
  let programPath = a.program( program );

  console.log( 'programPath', programPath );

  var toolsPath1 = _.module.toolsPathGet();
  return a.forkNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    var toolsPath2 = op.output.trim();
    var exp = __.path.join( __dirname, '../../Tools.s' );
    test.identical( toolsPath1, exp );
    test.identical( toolsPath2, exp );
    return op;
  });

  function program()
  {
    console.log( toolsPath );
  }

}

//

function includedModuleSourcePathValid( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  let start = __.process.starter
  ({
    outputCollecting : 1,
    outputPiping : 1,
    inputMirroring : 1,
    throwingExitCode : 0,
    mode : 'fork',
  });

  act({});

  /* */

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      let program0 = __.program.write
      ({
        routine : _program0,
        tempPath : a.abs( '.' ),
      });

      let program1 = __.program.write
      ({
        routine : _program1,
        tempPath : a.abs( '.' ),
      });
      console.log( _.strLinesNumber( program1.sourceCode ) );

      let program2 = __.program.write
      ({
        routine : _program2,
        tempPath : a.abs( '.' ),
      });

      let program3 = __.program.write
      ({
        routine : _program3,
        tempPath : a.abs( '.' ),
      });

      return start
      ({
        execPath : program0.programPath,
        currentPath : _.path.dir( program0.programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
  `
  xxx
  `
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function _program0()
  {
    console.log( 'program0.begin' );
    module.exports = 0;
    require( './_program1' );
    console.log( 'program0.end' );
  }

  /* - */

  function _program1()
  {
    let _ = require( toolsPath );
    console.log( 'program1.begin' );

    var moduleFile = _.module.fileGet( __dirname + '/_program0' );
    console.log( `program1.begin : program0 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program1.begin : program0 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program1.begin : program0 : moduleFile : ${moduleFile.moduleNativeFile === module.parent}` );
    console.log( `program1.begin : program0 : returned : ${moduleFile.returned}` );
    console.log( `program1.begin : program0 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileGet( __dirname + '/_program1' );
    console.log( `program1.begin : program1 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program1.begin : program1 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program1.begin : program1 : moduleFile : ${moduleFile.moduleNativeFile === module}` );
    console.log( `program1.begin : program1 : returned : ${moduleFile.returned}` );
    console.log( `program1.begin : program1 : module : ${moduleFile.module}` );

    module.exports = 1;
    require( './_program2' );

    var moduleFile = _.module.fileGet( __dirname + '/_program0' );
    console.log( `program1.after : program0 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program1.after : program0 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program1.after : program0 : moduleFile : ${moduleFile.moduleNativeFile === module.parent}` );
    console.log( `program1.after : program0 : returned : ${moduleFile.returned}` );
    console.log( `program1.after : program0 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileGet( __dirname + '/_program1' );
    console.log( `program1.after : program1 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program1.after : program1 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program1.after : program1 : moduleFile : ${moduleFile.moduleNativeFile === module}` );
    console.log( `program1.after : program1 : returned : ${moduleFile.returned}` );
    console.log( `program1.after : program1 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileGet( __dirname + '/_program2' );
    console.log( `program1.after : program2 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program1.after : program2 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program1.after : program2 : moduleFile : ${moduleFile.moduleNativeFile === module.children[ 1 ]}` );
    console.log( `program1.after : program2 : returned : ${moduleFile.returned}` );
    console.log( `program1.after : program2 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileGet( __dirname + '/_program3' );
    console.log( `program1.after : program3 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program1.after : program3 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program1.after : program3 : moduleFile : ${moduleFile.moduleNativeFile === module.children[ 1 ].children[ 0 ]}` );
    console.log( `program1.after : program3 : returned : ${moduleFile.returned}` );
    console.log( `program1.after : program3 : module : ${moduleFile.module}` );

    console.log( 'program1.end' );
  }

  /* - */

  function _program2()
  {
    const _ = _global_.wTools;
    console.log( 'program2.begin' );
    require( './_program3' );
    module.exports = 2;
    console.log( 'program2.end' );
  }

  /* - */

  function _program3()
  {
    const _ = _global_.wTools;
    console.log( 'program3' );

    // var moduleFile = _.module.fileGet( __dirname + '/_program2' );
    // console.log( `program3 : program2 : sourcePath : ${moduleFile.sourcePath}` );
    // console.log( `program3 : program2 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    // console.log( `program3 : program2 : moduleFile : ${moduleFile.moduleNativeFile === module.parent}` );
    // console.log( `program3 : program2 : returned : ${moduleFile.returned}` );
    // console.log( `program3 : program2 : module : ${moduleFile.module}` );
    //
    // var moduleFile = _.module.fileGet( __dirname + '/_program3' );
    // console.log( `program3 : program3 : sourcePath : ${moduleFile.sourcePath}` );
    // console.log( `program3 : program3 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    // console.log( `program3 : program3 : moduleFile : ${moduleFile.moduleNativeFile === module}` );
    // console.log( `program3 : program3 : returned : ${moduleFile.returned}` );
    // console.log( `program3 : program3 : module : ${moduleFile.module}` );

    module.exports = 3;
  }

  /* - */

}

//

function moduleIsIncluded( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  let start = __.process.starter
  ({
    outputCollecting : 1,
    outputPiping : 1,
    inputMirroring : 1,
    throwingExitCode : 0,
    mode : 'fork',
  });

  test.true( _.module.isIncluded( 'wTesting' ) );
  test.true( !_.module.isIncluded( 'abcdef123' ) );

  act({ routine : _programWithRequire });
  // act({ routine : _programWithIncludeLower });
  // act({ routine : _programWithIncludeUpper });

  return ready;

  /* - xxx */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env, { level : 1 } )}`;

      let program = __.program.write
      ({
        routine : env.routine,
        withSubmodules : 1,
        tempPath : a.abs( '.' ),
      });

      console.log( _.strLinesNumber( program.sourceCode ) );

      return start
      ({
        execPath : program.programPath,
        currentPath : _.path.dir( program.programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
  `
  isIncluded( wLooker ) false
  isIncluded( wlooker ) false
  isIncluded( wLooker ) true
  isIncluded( wlooker ) true
  `
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function _programWithRequire()
  {
    let _ = require( toolsPath );
    let Module = require( 'module' );
    // console.log( `program1.globalPaths\n  ${Module.globalPaths.join( '\n  ' )}` );
    // console.log( `program1.paths\n  ${module.paths.join( '\n  ' )}` );
    debugger;
    console.log( 'isIncluded( wTesting )', _.module.isIncluded( 'wTesting' ) );
    debugger;
    require( 'wTesting' );
    debugger;
    console.log( 'isIncluded( wTesting )', _.module.isIncluded( 'wTesting' ) );
    debugger;
  }

  /* - */

  function _programWithIncludeLower()
  {
    let _ = require( toolsPath );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
    _.include( 'wlooker' );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
  }

  /* - */

  function _programWithIncludeUpper()
  {
    let _ = require( toolsPath );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
    _.include( 'wlooker' );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
  }

  /* - */

}

//

/* qqq xxx : make test from this */
function dependancyAssumption( test )
{
  let context = this;
  let a = test.assetFor( false );

  programWrite( program1 );
  programWrite( program2 );
  programWrite( program3 );

  return a.fork({ execPath : a.abs( 'program1' ) })
  .then( ( op ) =>
  {
    var exp =
`
xxx
`
    test.equivalent( op.output, exp );
    test.identical( op.exitCode, 0 );
    return op;
  });

  /* */

  function programWrite( program )
  {
    var postfix =
    `
    ${program.name}();
    `
    __.fileProvider.fileWrite( a.abs( program.name ), program.toString() + postfix );
  }

  /* */

  function program1()
  {
    let Module = require( 'module' );
    Module.globalPaths.push( '/program1/global' );
    module.paths.push( '/program1/local' ); debugger;
    console.log( `program1.before.globalPaths\n  ${Module.globalPaths.join( '\n  ' )}` );
    console.log( `program1.before.paths\n  ${module.paths.join( '\n  ' )}` );

    require( './program2' );

    console.log( `program1.after.globalPaths\n  ${Module.globalPaths.join( '\n  ' )}` );
    console.log( `program1.after.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* */

  function program2()
  {
    let Module = require( 'module' );
    Module.globalPaths.push( '/program2/global' );
    module.paths.push( '/program2/local' );
    console.log( `program2.before.globalPaths\n  ${Module.globalPaths.join( '\n  ' )}` );
    console.log( `program2.before.paths\n  ${module.paths.join( '\n  ' )}` );

    require( './program3' );

    console.log( `program2.after.globalPaths\n  ${Module.globalPaths.join( '\n  ' )}` );
    console.log( `program2.after.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* */

  function program3()
  {
    let Module = require( 'module' );
    Module.globalPaths.push( '/program3/global' );
    module.paths.push( '/program3/local' );
    console.log( `program3.globalPaths\n  ${Module.globalPaths.join( '\n  ' )}` );
    console.log( `program3.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* */

}

dependancyAssumption.experimental = 1;

// --
// test suite definition
// --

let Self =
{

  name : 'Tools.Module',
  silencing : 1,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
  },

  tests :
  {

    withIsIncluded,
    withoutIsIncluded,
    moduleExportsUndefined,
    resolve,
    toolsPathGetBasic,
    toolsPathGetTester,

    includedModuleSourcePathValid,
    moduleIsIncluded,
    dependancyAssumption,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
