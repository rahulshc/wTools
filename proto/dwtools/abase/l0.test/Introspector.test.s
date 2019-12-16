( function _Introspector_test_s_( ) {

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

function stackBasic( test )
{

  /* - */

  test.case = 'trivial';
  debugger;
  var expectedTrace = [ 'function3', 'function2', 'function1', _.introspector.location().routineName, _.introspector.location().fileName ];
  var got = function1();
  debugger;
  got = got.split( '\n' );
  expectedTrace.forEach( function( expectedStr, i )
  {
    var expectedRegexp = new RegExp( expectedStr );
    test.description = expectedStr;
    test.identical( expectedRegexp.test( got[ i ] ), true );
  });

  /* - */

  function function1( )
  {
    return function2( );
  }

  function function2( )
  {
    return function3( );
  }

  function function3( )
  {
    debugger;
    return _.introspector.stack();
  }

}

//

function stack( test )
{
  let context = this;

  test.case = '[ 0, -1 ]';
  var got = _.introspector.stack([ 0, -1 ]);
  test.gt( got.split( '\n' ).length, 10 );
  var routineName = _.introspector.location().routineName;
  test.identical( _.strCount( got, routineName ), 1 );

  test.case = '[ 0, Infinity ]';
  var got = _.introspector.stack([ 0, Infinity ]);
  test.gt( got.split( '\n' ).length, 10 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'comparison of [ 0, -1 ] and [ 0, Infinity ]';
  var got1 = _.introspector.stack([ 0, -1 ]);
  var got2 = _.introspector.stack([ 0, Infinity ]);
  test.identical( _.strLinesBut( got1, 0 ), _.strLinesBut( got2, 0 ) );

  test.case = 'comparison of [ 0, -2 ] and [ 0, Infinity ]';
  var got1 = _.introspector.stack([ 0, -2 ]);
  var got2 = _.introspector.stack([ 0, Infinity ]);
  test.identical( _.strLinesBut( got1, 0 ), _.strLinesBut( _.strLinesBut( got2, 0 ), -1 ) );

  test.case = 'comparison of default call and [ 0, Infinity ]';
  var got1 = _.introspector.stack();
  var got2 = _.introspector.stack([ 0, Infinity ]);
  test.identical( _.strLinesBut( got1, 0 ), _.strLinesBut( got2, 0 ) );

  test.case = 'not an error';
  var exp = undefined;
  var got = _.introspector.stack( { notError : 1 }, undefined );
  test.identical( got, exp );

  if( !Config.debug )
  return;

  test.case = 'not a range';
  test.shouldThrowErrorSync( () =>
  {
    var got = _.introspector.stack( { notError : 1 } );
  });

}

//

function locationFromStackFrame( test )
{

  /**/

  var stackCall = 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at iteration (/C/dir/File.js:5:47)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at iteration (/C/dir/File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at iteration (C:\\dir\\File.js:5:47)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js'
  }
  /* xxx2 : problem in _.toStr( 'some\\path' )! */
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at _iteration (C:\\dir\\File.js:5:47)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at _iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : '_iteration',
    'routineAlias' : null,
    'internal' : 1,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : '_iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at __iteration (C:\\dir\\File.js:5:47)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at __iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : '__iteration',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : '__iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle_Now',
    'routineAlias' : null,
    'internal' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle_Now',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle__Now',
    'routineAlias' : null,
    'internal' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle__Now',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-}.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '_time',
    'internal' : 1,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '__time',
    'internal' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.__time',
    'routineAlias' : '_time',
    'internal' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.__time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at listOnTimeout (internal/timers.js:531:17)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at listOnTimeout (internal/timers.js:531:17)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'listOnTimeout',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 531,
    'col' : 17,
    'filePathLineCol' : 'internal/timers.js:531:17',
    'routineFilePathLineCol' : 'listOnTimeout @ internal/timers.js:531:17',
    'fileName' : 'timers.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at eval (<anonymous>:1:16)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at eval (<anonymous>:1:16)',
    'filePath' : '<anonymous>',
    'routineName' : 'eval',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 1,
    'col' : 16,
    'filePathLineCol' : '<anonymous>:1:16',
    'routineFilePathLineCol' : 'eval @ <anonymous>:1:16',
    'fileName' : '<anonymous>'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

  var stackCall = 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)';
  test.case = stackCall;
  var exp =
  {
    'original' : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  /**/

}

// --
// declare
// --

var Self =
{

  name : 'Tools.base.Introspector',
  silencing : 1,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    // nameOfFile : _.introspector.location().fileName, /* xxx */
    suiteTempPath : null,
    assetsOriginalSuitePath : null,
    defaultJsPath : null,
  },

  tests :
  {

    /* qqq : implement test routine for _.err */

    stackBasic,
    stack, /* qqq : extend the routine */

    locationFromStackFrame,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
