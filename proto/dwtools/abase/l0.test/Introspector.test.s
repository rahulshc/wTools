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

function locationFromStackFrameWithoutLocationField( test )
{

  test.open( 'o - string' );

  test.case = 'empty string';
  var stackCall = '';
  var exp =
  {
    'original' : '',
    'filePath' : '',
    'routineName' : '',
    'routineAlias' : null,
    'internal' : 0,
    'filePathLineCol' : '',
    'fileNameLineCol' : '',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'complex routineName and windows path in parentheses';
  var stackCall = 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)';
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
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'complex routineName and normalized path in parentheses';
  var stackCall = 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)';
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
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'simple routineName and windows path in parentheses';
  var stackCall = 'at iteration (C:\\dir\\File.js:5:47)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  /* xxx2 : problem in _.toStr( 'some\\path' )! */
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'simple routineName and normalized path in parentheses';
  var stackCall = 'at iteration (/C/dir/File.js:5:47)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName begins on underscore, windows path';
  var stackCall = 'at _iteration (C:\\dir\\File.js:5:47)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName begins on double underscore, windows path';
  var stackCall = 'at __iteration (C:\\dir\\File.js:5:47)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has underscore in name, windows path';
  var stackCall = 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and in the middle, windows path';
  var stackCall = 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and underscore in the middle, windows path';
  var stackCall = 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore in name, windows path';
  var stackCall = 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and double underscore in the middle, windows path';
  var stackCall = 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and in the middle, windows path';
  var stackCall = 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName end by dot, windows path';
  var stackCall = 'at wConsequence. (C:\\dir\\File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName end by double dot, windows path';
  var stackCall = 'at wConsequence.. (C:\\dir\\File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence.. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence..{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence..{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = '<anonymous> in routineName, windows path';
  var stackCall = 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'a few <anonymous> in routineName, normalized path';
  var stackCall = 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'not routineAlias with underscore';
  var stackCall = 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );


  test.case = 'routinAlias with underscore';
  var stackCall = 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)';
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
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineAlias with double underscore';
  var stackCall = 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)';
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
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore, routineAlias has single underscore';
  var stackCall = 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)';
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
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'relative path';
  var stackCall = 'at listOnTimeout (internal/timers.js:531:17)';
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
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:531:17',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'eval and <anonymous> in path';
  var stackCall = 'at eval (<anonymous>:1:16)';
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
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var stackCall = 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)';
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
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var stackCall = 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)';
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
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.close( 'o - string' );

  /* - */

  test.open( 'o - map' );

  test.case = 'empty string';
  var stackCall = { stackFrame : '' };
  var exp =
  {
    'original' : '',
    'filePath' : '',
    'routineName' : '',
    'routineAlias' : null,
    'internal' : 0,
    'filePathLineCol' : '',
    'fileNameLineCol' : '',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'complex routineName and windows path in parentheses';
  var stackCall = { stackFrame : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)' };
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
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'complex routineName and normalized path in parentheses';
  var stackCall = { stackFrame : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)' };
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
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'simple routineName and windows path in parentheses';
  var stackCall = { stackFrame : 'at iteration (C:\\dir\\File.js:5:47)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'simple routineName and normalized path in parentheses';
  var stackCall = { stackFrame : 'at iteration (/C/dir/File.js:5:47)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName begins on underscore, windows path';
  var stackCall = { stackFrame : 'at _iteration (C:\\dir\\File.js:5:47)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName begins on double underscore, windows path';
  var stackCall = { stackFrame : 'at __iteration (C:\\dir\\File.js:5:47)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has underscore in name, windows path';
  var stackCall = { stackFrame : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and in the middle, windows path';
  var stackCall = { stackFrame : 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and underscore in the middle, windows path';
  var stackCall = { stackFrame : 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore in name, windows path';
  var stackCall = { stackFrame : 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and double underscore in the middle, windows path';
  var stackCall = { stackFrame : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and in the middle, windows path';
  var stackCall = { stackFrame : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName end by dot, windows path';
  var stackCall = { stackFrame : 'at wConsequence. (C:\\dir\\File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName end by double dot, windows path';
  var stackCall = { stackFrame : 'at wConsequence.. (C:\\dir\\File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence.. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence..{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence..{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = '<anonymous> in routineName, windows path';
  var stackCall = { stackFrame : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'a few <anonymous> in routineName, normalized path';
  var stackCall = { stackFrame : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)' };
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'not routineAlias with underscore';
  var stackCall = { stackFrame : 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)' };
  var exp =
  {
    'original' : 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineAlias with underscore';
  var stackCall = { stackFrame : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)' };
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
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineAlias with double underscore';
  var stackCall = { stackFrame : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)' };
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
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'routineName has double underscore, routineAlias has single underscore';
  var stackCall = { stackFrame : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)' };
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
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'relative path';
  var stackCall = { stackFrame : 'at listOnTimeout (internal/timers.js:531:17)' };
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
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:531:17',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'eval and <anonymous> in path';
  var stackCall = { stackFrame : 'at eval (<anonymous>:1:16)' };
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
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var stackCall = { stackFrame : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)' };
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
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var stackCall = { stackFrame : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)' };
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
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.close( 'o - map' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( 'at @abc2:0', 'unnecessary' ) );

  test.case = 'unnecessary option in map options';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( { stackFrame : 'abc', range : [ 1, 2 ] } ) );

  test.case = 'wrong type of map options';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( [ [ stackFrame, 'abc' ] ] ) );

  test.case = 'wrong type of o.stackFrame';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( { stackFrame : [ 'string in array' ] } ) );

  test.case = 'wrong type of o.location.filePath';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( { stackFrame : 'at abc (/a/b/c)', location : { filePath : true } } ) );

  test.case = 'wrong type of o.location.routineName';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( { stackFrame : 'at abc (/a/b/c)', location : { routineName : [] } } ) );

  test.case = 'stackFrame is null';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( { stackFrame : null } ) );

}

//

function locationFromStackFrameWithLocationField( test )
{
  test.case = 'o.location is an array, o.location as not a map';
  var location = [];
  var stackCall = 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)';
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got.original, 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)' );
  test.identical( got.filePath, '/C/dir/Introspector.test.s' );
  test.is( _.arrayIs( got ) );

  /* */

  test.case = 'o.location has original field different to stackFrame';
  var location =
  {
    original : 'at stackBasic (/C/dir/Introspector.test.s)',
  }
  var stackCall = 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/Introspector.test.s)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location has original field different to stackFrame, filePath - empty string';
  var location =
  {
    original : 'at stackBasic (/C/dir/Introspector.test.s)',
    filePath : '',
  }
  var stackCall = 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/Introspector.test.s)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location has original field different to stackFrame, filePath - string with parentheses';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
  }
  var stackCall = 'at iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47'
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - empty string';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '',
  }
  var stackCall = 'at iteration (/C/dir/File.js:5:47)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47'
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string with underscore';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '_routine',
  }
  var stackCall = 'at _iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '_routine',
    'routineAlias' : null,
    'internal' : 1,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : '_routine @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string, which ends by one dot';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '__routine.',
  }
  var stackCall = 'at __iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '__routine.',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : '__routine. @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string, which ends by two dots';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '__routine..',
  }
  var stackCall = 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '__routine..',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:15',
    'routineFilePathLineCol' : '__routine.. @ /C/dir/(Introspector.test.s):5:15',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has underscore at the start and in the middle, o.location.internal - 0';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    internal : 0
  }
  var stackCall = 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has double underscore at the start and underscore in the middle, o.location.internal - 0';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    internal : 0
  }
  var stackCall ='at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has double underscore in name, o.location.internal - 3';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    internal : 3
  }
  var stackCall = 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle__Now',
    'routineAlias' : null,
    'internal' : 3,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has underscore at the start and double underscore in the middle, filePath starts from internal';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : 'internal/index.js'
  }
  var stackCall = 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at stackBasic (/C/dir/(Introspector.test.s))',
    'filePath' : 'internal/index.js',
    'routineName' : 'wConsequence._handle__Now',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : 'internal/index.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle__Now @ internal/index.js:5:15',
    'fileName' : 'index.js',
    'fileNameLineCol' : 'index.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has double underscore at the start and in the middle, windows path';
  var location = {};
  var stackCall = 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = '<anonymous> in routineName, windows path';
  var location = {};
  var stackCall = 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'a few <anonymous> in routineName, normalized path';
  var location = {};
  var stackCall = 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)';
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
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location.routineAlias - empty string, o.location.internal - 2';
  var location =
  {
    routineAlias : '',
    internal : 2
  };
  var stackCall = 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '_time',
    'internal' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location.routineAlias with double underscore, o.location.internal - 0';
  var location =
  {
    routineAlias : '__routine',
    internal : 0
  };
  var stackCall = 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '__routine',
    'internal' : 0,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'number of o.location.line is different to stack';
  var location =
  {
    filePath : 'internal/timers.js',
    line : 1,
  };
  var stackCall = 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'Object.__time',
    'routineAlias' : '_time',
    'internal' : 2,
    'line' : 1,
    'filePathLineCol' : 'internal/timers.js:1',
    'routineFilePathLineCol' : 'Object.__time @ internal/timers.js:1',
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:1',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  /* */

  test.case = 'relative path';
  var location =
  {
    filePath : 'internal/timers.js:531:17',
  }
  var stackCall = 'at listOnTimeout (internal/timers.js)';
  var exp =
  {
    'original' : 'at listOnTimeout (internal/timers.js)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'listOnTimeout',
    'routineAlias' : null,
    'internal' : 2,
    'line' : 531,
    'col' : 17,
    'filePathLineCol' : 'internal/timers.js:531:17',
    'routineFilePathLineCol' : 'listOnTimeout @ internal/timers.js:531:17',
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:531:17',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackCall, location : location } );
  test.identical( got, exp );

  test.case = 'eval and <anonymous> in path';
  var stackCall = { stackFrame : 'at eval (<anonymous>:1:16)' };
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
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var stackCall = { stackFrame : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)' };
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
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var stackCall = { stackFrame : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)' };
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
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackCall );
  test.identical( got, exp );
}

//

function stackBasic( test )
{

  /* - */

  test.case = 'trivial';
  var expectedTrace = [ 'function3', 'function2', 'function1', _.introspector.location().routineName ];
  var got = function1();
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
  test.case = 'stack is map, range - undefined';
  var got = _.introspector.stack( { notError : 1 }, undefined );
  test.identical( got, undefined );

  test.case = 'stack is Set, range - undefined';
  var got = _.introspector.stack( new Set( [ 1, 2, 3 ] ), undefined );
  test.identical( got, undefined );

  test.case = 'stack - empty string, range - undefined';
  var got = _.introspector.stack( '', undefined );
  test.identical( got, '' );

  test.case = 'stack - empty array, range - undefined';
  var got = _.introspector.stack( [], undefined );
  test.identical( got, '' );

  /* - */

  test.open( 'stack - string, first line - has not "at" or "@"' );

  test.case = 'only stack';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd' );
  test.identical( got, 'at@\nb\nc\nd' );

  test.case = 'range - undefined';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', undefined );
  test.identical( got, 'at@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] > last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 0, 5 ] );
  test.identical( got, 'at@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] === last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 0, 3 ] );
  test.identical( got, 'at@\nb\nc' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 0, 1 ] );
  test.identical( got, 'at@' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < 0';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 0, -1 ] );
  test.identical( got, 'at@\nb\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] > last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ -3, 4 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] === last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ -3, 3 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ -3, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < 0';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ -3, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] > last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 2, 4 ] );
  test.identical( got, 'c\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] === last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 2, 3 ] );
  test.identical( got, 'c' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < last index';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 2, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < 0';
  var got = _.introspector.stack( 'some\nat@\nb\nc\nd', [ 2, -1 ] );
  test.identical( got, 'c\nd' );

  test.close( 'stack - string, first line - has not "at" or "@"' );

  /* - */

  test.open( 'stack - string, first line - has "at " or "@"' );

  test.case = 'only stack';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t' );
  test.identical( got, 'at\nb\nc\nd' );

  test.case = 'range - undefined';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', undefined );
  test.identical( got, 'at\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] > last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 0, 5 ] );
  test.identical( got, 'at\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] === last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 0, 3 ] );
  test.identical( got, 'at\nb\nc' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 0, 1 ] );
  test.identical( got, 'at' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < 0';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 0, -1 ] );
  test.identical( got, 'at\nb\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] > last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ -3, 4 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] === last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ -3, 3 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ -3, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < 0';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ -3, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] > last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 2, 4 ] );
  test.identical( got, 'c\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] === last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 2, 3 ] );
  test.identical( got, 'c' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < last index';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 2, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < 0';
  var got = _.introspector.stack( 'at \nb\nc\nd\n \t', [ 2, -1 ] );
  test.identical( got, 'c\nd' );

  /* */

  test.case = 'only stack';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t' );
  test.identical( got, '@\nb\nc\nd' );

  test.case = 'range - undefined';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', undefined );
  test.identical( got, '@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] > last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 0, 5 ] );
  test.identical( got, '@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] === last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 0, 3 ] );
  test.identical( got, '@\nb\nc' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 0, 1 ] );
  test.identical( got, '@' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < 0';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 0, -1 ] );
  test.identical( got, '@\nb\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] > last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ -3, 4 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] === last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ -3, 3 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ -3, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < 0';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ -3, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] > last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 2, 4 ] );
  test.identical( got, 'c\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] === last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 2, 3 ] );
  test.identical( got, 'c' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < last index';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 2, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < 0';
  var got = _.introspector.stack( '@\nb\nc\nd\n \t', [ 2, -1 ] );
  test.identical( got, 'c\nd' );

  test.close( 'stack - string, first line - has "at " or "@"' );

  /* - */

  test.open( 'stack - array, first element - has not "at" or "@"' );

  test.case = 'range - undefined';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], undefined );
  test.identical( got, 'at\n@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] > last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, 7 ] );
  test.identical( got, 'at\n@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] === last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, 4 ] );
  test.identical( got, 'at\n@\nb\nc' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, 1 ] );
  test.identical( got, 'at' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < 0';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, -1 ] );
  test.identical( got, 'at\n@\nb\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] > last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, 7 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] === last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, 4 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < 0';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] > last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, 7 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] === last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, 4 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < last index';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < 0';
  var got = _.introspector.stack( [ '(vm.js: 12', '(module.js:', '(internal/module.js:', 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.close( 'stack - array, first element - has not "at" or "@"' );

  /* - */

  test.open( 'stack - array, first element - has "at" or "@"' );

  test.case = 'range - undefined';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], undefined );
  test.identical( got, 'at\n@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] > last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, 7 ] );
  test.identical( got, 'at\n@\nb\nc\nd' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] === last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, 4 ] );
  test.identical( got, 'at\n@\nb\nc' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, 1 ] );
  test.identical( got, 'at' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] < 0';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 0, -1 ] );
  test.identical( got, 'at\n@\nb\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] > last index';
  var got = _.introspector.stack( [ 'some', 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, 7 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] === last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, 4 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - -3, range[ 1 ] < 0';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ -3, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] > last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, 7 ] );
  test.identical( got, 'b\nc\nd' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] === last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, 4 ] );
  test.identical( got, 'b\nc' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < last index';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, 1 ] );
  test.identical( got, '' );

  test.case = 'range[ 0 ] - 2, range[ 1 ] < 0';
  var got = _.introspector.stack( [ 'at ', '@', 'b', 'c', 'd', '\t' ], [ 2, -1 ] );
  test.identical( got, 'b\nc\nd' );

  test.close( 'stack - array, first element - has "at" or "@"' );

  /* - */

  test.open( 'only range' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - Infinity';
  var got = _.introspector.stack( [ 0, Infinity ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - 100';
  var got = _.introspector.stack( [ 0, 100 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - 10';
  var got = _.introspector.stack( [ 0, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - -1';
  var got = _.introspector.stack( [ 0, -1 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  /* */

  test.case = 'range[ 0 ] - 2, range[ 1 ] - Infinity';
  var got = _.introspector.stack( [ 2, Infinity ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - 100';
  var got = _.introspector.stack( [ 2, 100 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - 10';
  var got = _.introspector.stack( [ 2, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 8 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - -1';
  var got = _.introspector.stack( [ 2, -1 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  /* */

  test.case = 'range[ 0 ] - -2, range[ 1 ] - Infinity';
  var got = _.introspector.stack( [ -2, Infinity ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - 100';
  var got = _.introspector.stack( [ -2, 100 ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - 10';
  var got = _.introspector.stack( [ -2, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 1 );
  test.is( arr[ 0 ].indexOf( 'at ') === -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - -1';
  var got = _.introspector.stack( [ -2, -1 ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.close( 'only range' );

  /* - */

  test.open( 'stack - null, range' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - Infinity';
  var got = _.introspector.stack( null, [ 0, Infinity ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - 100';
  var got = _.introspector.stack( null, [ 0, 100 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - 10';
  var got = _.introspector.stack( null, [ 0, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - -1';
  var got = _.introspector.stack( null, [ 0, -1 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  /* */

  test.case = 'range[ 0 ] - 2, range[ 1 ] - Infinity';
  var got = _.introspector.stack( null, [ 2, Infinity ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - 100';
  var got = _.introspector.stack( null, [ 2, 100 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - 10';
  var got = _.introspector.stack( null, [ 2, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 8 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - -1';
  var got = _.introspector.stack( null, [ 2, -1 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  /* */

  test.case = 'range[ 0 ] - -2, range[ 1 ] - Infinity';
  var got = _.introspector.stack( null, [ -2, Infinity ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - 100';
  var got = _.introspector.stack( null, [ -2, 100 ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - 10';
  var got = _.introspector.stack( null, [ -2, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 1 );
  test.is( arr[ 0 ].indexOf( 'at ') === -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - -1';
  var got = _.introspector.stack( null, [ -2, -1 ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.close( 'stack - null, range' );

  /* - */

  test.open( 'stack - error, range' );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - Infinity';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 0, Infinity ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - 100';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 0, 100 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - 10';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 0, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.case = 'range[ 0 ] - 0, range[ 1 ] - -1';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 0, -1 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  /* */

  test.case = 'range[ 0 ] - 2, range[ 1 ] - Infinity';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 2, Infinity ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - 100';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 2, 100 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - 10';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 2, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 8 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - 2, range[ 1 ] - -1';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ 2, -1 ] );
  var arr = got.split( '\n' );
  test.gt( arr.length, 10 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  /* */

  test.case = 'range[ 0 ] - -2, range[ 1 ] - Infinity';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ -2, Infinity ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - 100';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ -2, 100 ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - 10';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ -2, 10 ] );
  var arr = got.split( '\n' );
  test.identical( arr.length, 1 );
  test.is( arr[ 0 ].indexOf( 'at ') === -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'range[ 0 ] - -2, range[ 1 ] - -1';
  var got = _.introspector.stack( new Error( 'Uncaught error' ), [ -2, -1 ] );
  var arr = got.split( '\n' );
  test.le( arr.length, 2 );
  test.is( arr[ 0 ].indexOf( 'at ') !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.close( 'stack - error, range' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.introspector.stack( null, [ 1, 2 ], 'extra' ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.introspector.stack( [ 'at @' ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ undefined, 1 ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ '', 1 ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ false, 1 ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ true, 1 ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ null, 1 ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ 1, '' ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ 1, undefined ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ 1, false ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ 1, true ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( [ 1, null ] ) );
  test.shouldThrowErrorSync( () => _.introspector.stack( { notError : 1 } ) );
}

//

function stackFilter( test )
{
  test.open( 'onEach returns element' );

  test.case = 'only onEach';
  var got = _.introspector.stackFilter( ( e ) => e );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 2 );

  test.case = 'stack is undefined';
  var got = _.introspector.stackFilter( undefined, ( e ) => e );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 2 );

  test.case = 'stack is null';
  var got = _.introspector.stackFilter( undefined, ( e ) => e );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 2 );

  test.case = 'stack is string';
  var got = _.introspector.stackFilter( 'at routine\n stack', ( e ) => e );
  test.is( got.indexOf( 'at routine' ) !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'stack is array';
  var got = _.introspector.stackFilter( [ 'at routine', ' stack' ], ( e ) => e );
  test.is( got.indexOf( 'at routine' ) !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'stack is error';
  var got = _.introspector.stackFilter( new Error(), ( e ) => e );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.close( 'onEach returns element' );

  /* - */

  test.open( 'onEach returns map with original field' );

  test.case = 'only onEach';
  var got = _.introspector.stackFilter( ( e, k ) => { return { original : e.original, key : k } } );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 2 );

  test.case = 'stack is undefined';
  var got = _.introspector.stackFilter( undefined, ( e, k ) => { return { original : e.original, key : k } } );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 2 );

  test.case = 'stack is null';
  var got = _.introspector.stackFilter( undefined, ( e, k ) => { return { original : e.original, key : k } } );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 2 );

  test.case = 'stack is string';
  var got = _.introspector.stackFilter( 'at routine\n stack', ( e, k ) => { return { original : e.original, key : k } } );
  test.is( got.indexOf( 'at routine' ) !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'stack is array';
  var got = _.introspector.stackFilter( [ 'at routine', ' stack' ], ( e, k ) => { return { original : e.original, key : k } } );
  test.is( got.indexOf( 'at routine' ) !== -1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 0 );

  test.case = 'stack is error';
  var got = _.introspector.stackFilter( new Error(), ( e, k ) => { return { original : e.original, key : k } } );
  test.identical( _.strCount( got, _.path.nativize( _.introspector.location().filePath ) ), 1 );
  test.identical( _.strCount( got, _.introspector.location().routineName ), 1 );

  test.close( 'onEach returns map with original field' );

  /* - */

  test.open( 'onEach returns key as string' );

  test.case = 'only onEach';
  var got = _.introspector.stackFilter( ( e, k ) => String( k ) );
  var arr = got.split( '\n' );
  test.identical( arr[ 0 ], '0' );
  test.identical( arr[ 1 ], '1' );

  test.case = 'stack is undefined';
  var got = _.introspector.stackFilter( undefined, ( e, k ) => String( k ) );
  var arr = got.split( '\n' );
  test.identical( arr[ 0 ], '0' );
  test.identical( arr[ 1 ], '1' );

  test.case = 'stack is null';
  var got = _.introspector.stackFilter( undefined, ( e, k ) => String( k ) );
  var arr = got.split( '\n' );
  test.identical( arr[ 0 ], '0' );
  test.identical( arr[ 1 ], '1' );

  test.case = 'stack is string';
  var got = _.introspector.stackFilter( 'at routine\n stack', ( e, k ) => String( k ) );
  var arr = got.split( '\n' );
  test.identical( arr[ 0 ], '0' );
  test.identical( arr[ 1 ], '1' );

  test.case = 'stack is array';
  var got = _.introspector.stackFilter( [ 'at routine', ' stack' ], ( e, k ) => String( k ) );
  var arr = got.split( '\n' );
  test.identical( arr[ 0 ], '0' );
  test.identical( arr[ 1 ], '1' );

  test.case = 'stack is error';
  var got = _.introspector.stackFilter( new Error(), ( e, k ) => String( k ) );
  var arr = got.split( '\n' );
  test.identical( arr[ 0 ], '0' );
  test.identical( arr[ 1 ], '1' );

  test.close( 'onEach returns key as string' );

  /* - */

  test.open( 'onEach returns undefined' );

  test.case = 'only onEach';
  var got = _.introspector.stackFilter( ( e, k ) => undefined );
  test.identical( got, '' );

  test.case = 'stack is undefined';
  var got = _.introspector.stackFilter( undefined, ( e, k ) => undefined );
  test.identical( got, '' );

  test.case = 'stack is null';
  var got = _.introspector.stackFilter( undefined, ( e, k ) => undefined );
  test.identical( got, '' );

  test.case = 'stack is string';
  var got = _.introspector.stackFilter( 'at routine\n stack', ( e, k ) => undefined );
  test.identical( got, '' );

  test.case = 'stack is array';
  var got = _.introspector.stackFilter( [ 'at routine', ' stack' ], ( e, k ) => undefined );
  test.identical( got, '' );

  test.case = 'stack is error';
  var got = _.introspector.stackFilter( new Error(), ( e, k ) => undefined );
  test.identical( got, '' );

  test.close( 'onEach returns undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter( undefined, ( e ) => e, 'extra' ) );

  test.case = 'stack is not a stack';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter( { original : '/usr/bin/' }, ( e ) => e ) );

  test.case = 'onEach is not a routine';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter( 'at routine stackFilter\n at @233', 'wrong' ) );

  test.case = 'onEach returns wrong value';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter( 'at routine stackFilter\n at @233', ( e, k ) => [ e, k ] ) );

  test.case = 'onEach returns object without original field';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter( 'at routine stackFilter\n at @233', ( e, k ) => { return {  element : e.original, key : k } } ) );

  test.case = 'onEach returns object, original field is not a string';
  test.shouldThrowErrorSync( () => _.introspector.stackFilter( 'at routine stackFilter\n at @233', ( e, k ) => { return { original : e, key : k } } ) );
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
    execJsPath : null,
  },

  tests :
  {

    /* qqq : implement test routine for _.err | Dmytro : implemented */

    locationFromStackFrameWithoutLocationField,
    locationFromStackFrameWithLocationField,

    stackBasic,
    stack, /* qqq : extend the routine | Dmytro : extended */

    stackFilter,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
