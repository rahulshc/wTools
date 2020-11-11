( function _Introspector_test_s_()
{

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

  self.suiteTempPath = path.tempOpen( path.join( __dirname, '../..'  ), 'err' );
  self.assetsOriginalPath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/err-' ) )
  path.tempClose( self.suiteTempPath );
}

// --
// tests
// --

function locationFromStackFrameWithoutLocationField( test )
{

  test.open( 'o - string' );

  test.case = 'empty string';
  var stackFrame = '';
  var exp =
  {
    'original' : '',
    'filePath' : '',
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'complex routineName and windows path in parentheses';
  var stackFrame = 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)';
  var exp =
  {
    'original' : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'complex routineName and normalized path in parentheses';
  var stackFrame = 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)';
  var exp =
  {
    'original' : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'simple routineName and windows path in parentheses';
  var stackFrame = 'at iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  /* xxx2 : problem in _.toStr( 'some\\path' )! */
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'simple routineName and normalized path in parentheses';
  var stackFrame = 'at iteration (/C/dir/File.js:5:47)';
  var exp =
  {
    'original' : 'at iteration (/C/dir/File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName begins on underscore, windows path';
  var stackFrame = 'at _iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at _iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : '_iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : '_iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName begins on double underscore, windows path';
  var stackFrame = 'at __iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at __iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : '__iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : '__iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has underscore in name, windows path';
  var stackFrame = 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and in the middle, windows path';
  var stackFrame = 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and underscore in the middle, windows path';
  var stackFrame = 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore in name, windows path';
  var stackFrame = 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and double underscore in the middle, windows path';
  var stackFrame = 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and in the middle, windows path';
  var stackFrame = 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName end by dot, windows path';
  var stackFrame = 'at wConsequence. (C:\\dir\\File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName end by double dot, windows path';
  var stackFrame = 'at wConsequence.. (C:\\dir\\File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence.. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence..{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence..{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = '<anonymous> in routineName, windows path';
  var stackFrame = 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'a few <anonymous> in routineName, normalized path';
  var stackFrame = 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-}.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'not routineAlias with underscore';
  var stackFrame = 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );


  test.case = 'routinAlias with underscore';
  var stackFrame = 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '_time',
    'internal' : 0,
    'abstraction' : 1,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineAlias with double underscore';
  var stackFrame = 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '__time',
    'internal' : 0,
    'abstraction' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore, routineAlias has single underscore';
  var stackFrame = 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.__time',
    'routineAlias' : '_time',
    'internal' : 0,
    'abstraction' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.__time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'relative path';
  var stackFrame = 'at listOnTimeout (internal/timers.js:531:17)';
  var exp =
  {
    'original' : 'at listOnTimeout (internal/timers.js:531:17)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'listOnTimeout',
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 0,
    'line' : 531,
    'col' : 17,
    'filePathLineCol' : 'internal/timers.js:531:17',
    'routineFilePathLineCol' : 'listOnTimeout @ internal/timers.js:531:17',
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:531:17',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'eval and <anonymous> in path';
  var stackFrame = 'at eval (<anonymous>:1:16)';
  var exp =
  {
    'original' : 'at eval (<anonymous>:1:16)',
    'filePath' : '<anonymous>',
    'routineName' : 'eval',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 1,
    'col' : 16,
    'filePathLineCol' : '<anonymous>:1:16',
    'routineFilePathLineCol' : 'eval @ <anonymous>:1:16',
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var stackFrame = 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)';
  var exp =
  {
    'original' : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var stackFrame = 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)';
  var exp =
  {
    'original' : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.close( 'o - string' );

  /* - */

  test.open( 'o - map' );

  test.case = 'empty string';
  var stackFrame = { stackFrame : '' };
  var exp =
  {
    'original' : '',
    'filePath' : '',
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'complex routineName and windows path in parentheses';
  var stackFrame = { stackFrame : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)' };
  var exp =
  {
    'original' : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'complex routineName and normalized path in parentheses';
  var stackFrame = { stackFrame : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)' };
  var exp =
  {
    'original' : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'simple routineName and windows path in parentheses';
  var stackFrame = { stackFrame : 'at iteration (C:\\dir\\File.js:5:47)' };
  var exp =
  {
    'original' : 'at iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'simple routineName and normalized path in parentheses';
  var stackFrame = { stackFrame : 'at iteration (/C/dir/File.js:5:47)' };
  var exp =
  {
    'original' : 'at iteration (/C/dir/File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName begins on underscore, windows path';
  var stackFrame = { stackFrame : 'at _iteration (C:\\dir\\File.js:5:47)' };
  var exp =
  {
    'original' : 'at _iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : '_iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : '_iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName begins on double underscore, windows path';
  var stackFrame = { stackFrame : 'at __iteration (C:\\dir\\File.js:5:47)' };
  var exp =
  {
    'original' : 'at __iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : '__iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : '__iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has underscore in name, windows path';
  var stackFrame = { stackFrame : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and in the middle, windows path';
  var stackFrame = { stackFrame : 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and underscore in the middle, windows path';
  var stackFrame = { stackFrame : 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore in name, windows path';
  var stackFrame = { stackFrame : 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has underscore at the start and double underscore in the middle, windows path';
  var stackFrame = { stackFrame : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore at the start and in the middle, windows path';
  var stackFrame = { stackFrame : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName end by dot, windows path';
  var stackFrame = { stackFrame : 'at wConsequence. (C:\\dir\\File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName end by double dot, windows path';
  var stackFrame = { stackFrame : 'at wConsequence.. (C:\\dir\\File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence.. (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence..{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence..{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = '<anonymous> in routineName, windows path';
  var stackFrame = { stackFrame : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'a few <anonymous> in routineName, normalized path';
  var stackFrame = { stackFrame : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-}.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'not routineAlias with underscore';
  var stackFrame = { stackFrame : 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)' };
  var exp =
  {
    'original' : 'at Object.time [ab _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineAlias with underscore';
  var stackFrame = { stackFrame : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)' };
  var exp =
  {
    'original' : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '_time',
    'internal' : 0,
    'abstraction' : 1,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineAlias with double underscore';
  var stackFrame = { stackFrame : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)' };
  var exp =
  {
    'original' : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '__time',
    'internal' : 0,
    'abstraction' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'routineName has double underscore, routineAlias has single underscore';
  var stackFrame = { stackFrame : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)' };
  var exp =
  {
    'original' : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.__time',
    'routineAlias' : '_time',
    'internal' : 0,
    'abstraction' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.__time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'relative path';
  var stackFrame = { stackFrame : 'at listOnTimeout (internal/timers.js:531:17)' };
  var exp =
  {
    'original' : 'at listOnTimeout (internal/timers.js:531:17)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'listOnTimeout',
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 0,
    'line' : 531,
    'col' : 17,
    'filePathLineCol' : 'internal/timers.js:531:17',
    'routineFilePathLineCol' : 'listOnTimeout @ internal/timers.js:531:17',
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:531:17',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'eval and <anonymous> in path';
  var stackFrame = { stackFrame : 'at eval (<anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (<anonymous>:1:16)',
    'filePath' : '<anonymous>',
    'routineName' : 'eval',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 1,
    'col' : 16,
    'filePathLineCol' : '<anonymous>:1:16',
    'routineFilePathLineCol' : 'eval @ <anonymous>:1:16',
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var stackFrame = { stackFrame : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var stackFrame = { stackFrame : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
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
  test.case = 'o.location has original field different to stackFrame';
  var location =
  {
    original : 'at stackBasic (/C/dir/Introspector.test.s)',
  }
  var stackFrame = 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)';
  var exp =
  {
    'original' : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location has original field different to stackFrame, filePath - empty string';
  var location =
  {
    original : 'at stackBasic (/C/dir/Introspector.test.s)',
    filePath : '',
  }
  var stackFrame = 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)';
  var exp =
  {
    'original' : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location has original field different to stackFrame, filePath - string with parentheses';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
  }
  var stackFrame = 'at iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47'
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - empty string';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '',
  }
  var stackFrame = 'at iteration (/C/dir/File.js:5:47)';
  var exp =
  {
    'original' : 'at iteration (/C/dir/File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47'
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string with underscore';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '_routine',
  }
  var stackFrame = 'at _iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at _iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '_routine',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : '_routine @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string, which ends by one dot';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '__routine.',
  }
  var stackFrame = 'at __iteration (C:\\dir\\File.js:5:47)';
  var exp =
  {
    'original' : 'at __iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '__routine.',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : '__routine. @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string, which ends by two dots';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '__routine..',
  }
  var stackFrame = 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '__routine..',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:15',
    'routineFilePathLineCol' : '__routine.. @ /C/dir/(Introspector.test.s):5:15',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has underscore at the start and in the middle, o.location.internal - 0';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    internal : 0
  }
  var stackFrame = 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence._handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence._handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has double underscore at the start and underscore in the middle, o.location.internal - 0';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    internal : 0
  }
  var stackFrame = 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.__handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle_Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle_Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has double underscore in name, o.location.internal - 3';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    internal : 31,
    abstraction : 13,
  }
  var stackFrame = 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.handle__Now',
    'routineAlias' : null,
    'internal' : 31,
    'abstraction' : 13,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has underscore at the start and double underscore in the middle, filePath starts from internal';
  var location =
  {
    original : 'at stackBasic (/C/dir/(Introspector.test.s))',
    filePath : 'internal/index.js'
  }
  var stackFrame = 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : 'internal/index.js',
    'routineName' : 'wConsequence._handle__Now',
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : 'internal/index.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle__Now @ internal/index.js:5:15',
    'fileName' : 'index.js',
    'fileNameLineCol' : 'index.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'routineName has double underscore at the start and in the middle, windows path';
  var location = {};
  var stackFrame = 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)';
  var exp =
  {
    'original' : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = '<anonymous> in routineName, windows path';
  var location = {};
  var stackFrame = 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'a few <anonymous> in routineName, normalized path';
  var location = {};
  var stackFrame = 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)';
  var exp =
  {
    'original' : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-}.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location.routineAlias - empty string, o.location.internal - 2';
  var location =
  {
    routineAlias : '',
    internal : 2
  };
  var stackFrame = 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '_time',
    'internal' : 2,
    'abstraction' : 1,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'o.location.routineAlias with double underscore, o.location.internal - 0';
  var location =
  {
    routineAlias : '__routine',
    internal : 0
  };
  var stackFrame = 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.time [as __time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : '/C/dir/Procedure.s',
    'routineName' : 'Object.time',
    'routineAlias' : '__routine',
    'internal' : 0,
    'abstraction' : 2,
    'line' : 1503,
    'col' : 20,
    'filePathLineCol' : '/C/dir/Procedure.s:1503:20',
    'routineFilePathLineCol' : 'Object.time @ /C/dir/Procedure.s:1503:20',
    'fileName' : 'Procedure.s',
    'fileNameLineCol' : 'Procedure.s:1503:20',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'number of o.location.line is different to stack';
  var location =
  {
    filePath : 'internal/timers.js',
    line : 1,
  };
  var stackFrame = 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)';
  var exp =
  {
    'original' : 'at Object.__time [as _time] (C:\\dir\\Procedure.s:1503:20)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'Object.__time',
    'routineAlias' : '_time',
    'internal' : 2,
    'abstraction' : 2,
    'line' : 1,
    'col' : null,
    'filePathLineCol' : 'internal/timers.js:1',
    'routineFilePathLineCol' : 'Object.__time @ internal/timers.js:1',
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:1',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  /* */

  test.case = 'relative path';
  var location =
  {
    filePath : 'internal/timers.js:531:17',
  }
  var stackFrame = 'at listOnTimeout (internal/timers.js)';
  var exp =
  {
    'original' : 'at listOnTimeout (internal/timers.js)',
    'filePath' : 'internal/timers.js',
    'routineName' : 'listOnTimeout',
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 0,
    'line' : 531,
    'col' : 17,
    'filePathLineCol' : 'internal/timers.js:531:17',
    'routineFilePathLineCol' : 'listOnTimeout @ internal/timers.js:531:17',
    'fileName' : 'timers.js',
    'fileNameLineCol' : 'timers.js:531:17',
  }
  var got = _.introspector.locationFromStackFrame( { stackFrame : stackFrame, location } );
  test.identical( got, exp );

  test.case = 'eval and <anonymous> in path';
  var stackFrame = { stackFrame : 'at eval (<anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (<anonymous>:1:16)',
    'filePath' : '<anonymous>',
    'routineName' : 'eval',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 1,
    'col' : 16,
    'filePathLineCol' : '<anonymous>:1:16',
    'routineFilePathLineCol' : 'eval @ <anonymous>:1:16',
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var stackFrame = { stackFrame : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var stackFrame = { stackFrame : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  }
  var got = _.introspector.locationFromStackFrame( stackFrame );
  test.identical( got, exp );

  if( !Config.debug )
  return;

  test.case = 'o.location is an array, o.location is not a map';
  test.shouldThrowErrorSync( () => _.introspector.locationFromStackFrame( { stackFrame : 'at Object.stackBasic', location : [] } ) );
}

//

function locationNormalize( test )
{
  test.case = 'without options';
  var o = {};
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );
  test.is( got === o );

  /* - */

  test.case = 'empty string';
  var o = { original : '' };
  var exp =
  {
    'original' : '',
    'filePath' : '',
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );
  test.is( got === o );

  test.case = 'stack frame line with posix path';
  var o = { original : "at node:internal/main/run_main_module:17:47" };
  var exp =
  {
    'original' : 'at node:internal/main/run_main_module:17:47',
    'filePath' : 'node:internal/main/run_main_module',
    'routineName' : 'node',
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 0,
    'line' : 17,
    'col' : 47,
    'filePathLineCol' : 'node:internal/main/run_main_module:17:47',
    'routineFilePathLineCol' : 'node @ node:internal/main/run_main_module:17:47',
    'fileName' : 'run_main_module',
    'fileNameLineCol' : 'run_main_module:17:47',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );
  test.is( got === o );

  /* */

  test.case = 'stack frame with Windows path';
  var o = { original : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)' };
  var exp =
  {
    'original' : 'at Object.stackBasic (C:\\dir\\Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'stack frame has double underscore in routineName at the start and in the middle, windows path';
  var o = { original :'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)' };
  var exp =
  {
    'original' : 'at wConsequence.__handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.__handle__Now',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:5:15',
    'routineFilePathLineCol' : 'wConsequence.__handle__Now @ /C/dir/File.js:5:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:15',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = '<anonymous> in stack frame, windows path';
  var o = { original : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence.<anonymous> (C:\\dir\\File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'a few <anonymous> in stack frame, normalized path';
  var o = { original : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)' };
  var exp =
  {
    'original' : 'at wConsequence.<anonymous>.<anonymous> (/C/dir/File.js:9:15)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'wConsequence.{-anonymous-}.{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 9,
    'col' : 15,
    'filePathLineCol' : '/C/dir/File.js:9:15',
    'routineFilePathLineCol' : 'wConsequence.{-anonymous-}.{-anonymous-} @ /C/dir/File.js:9:15',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:9:15',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'eval and <anonymous> in stack frame';
  var o = { original : 'at eval (<anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (<anonymous>:1:16)',
    'filePath' : '<anonymous>',
    'routineName' : 'eval',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 1,
    'col' : 16,
    'filePathLineCol' : '<anonymous>:1:16',
    'routineFilePathLineCol' : 'eval @ <anonymous>:1:16',
    'fileName' : '<anonymous>',
    'fileNameLineCol' : '<anonymous>:1:16',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'windows filePath nested in parentheses with routineName and <anonymous>';
  var o = { original : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (eval at program2 (C:\\basic\\program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'normalized filePath nested in parentheses with routineName and <anonymous>';
  var o = { original : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)' };
  var exp =
  {
    'original' : 'at eval (eval at program2 (/C/basic/program2.js:13:5), <anonymous>:1:16)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'program2',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'program2 @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'original with routine alias';
  var o = { original : 'at routine [as time] (/C/basic/program2.js:13:5)' };
  var exp =
  {
    'original' : 'at routine [as time] (/C/basic/program2.js:13:5)',
    'filePath' : '/C/basic/program2.js',
    'routineName' : 'routine',
    'routineAlias' : 'time',
    'internal' : 0,
    'abstraction' : 0,
    'line' : 13,
    'col' : 5,
    'filePathLineCol' : '/C/basic/program2.js:13:5',
    'routineFilePathLineCol' : 'routine @ /C/basic/program2.js:13:5',
    'fileName' : 'program2.js',
    'fileNameLineCol' : 'program2.js:13:5',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'original with internal in path';
  var o = { original : 'at routine [as time] (internal/event)' };
  var exp =
  {
    'original' : 'at routine [as time] (internal/event)',
    'filePath' : 'internal/event',
    'routineName' : 'routine',
    'routineAlias' : 'time',
    'internal' : 2,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : 'internal/event',
    'routineFilePathLineCol' : 'routine @ internal/event',
    'fileName' : 'event',
    'fileNameLineCol' : 'event',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'original with internal in path';
  var o = { original : 'at routine [as time] (node:internal/event)' };
  var exp =
  {
    'original' : 'at routine [as time] (node:internal/event)',
    'filePath' : 'node:internal/event',
    'routineName' : 'routine',
    'routineAlias' : 'time',
    'internal' : 2,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : 'node:internal/event',
    'routineFilePathLineCol' : 'routine @ node:internal/event',
    'fileName' : 'event',
    'fileNameLineCol' : 'event',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'original - not a string';
  var o = { original : [ 'at Object.routine (/some/path)' ] };
  var exp =
  {
    'original' : [ 'at Object.routine (/some/path)' ],
    'filePath' : undefined,
    'routineName' : '{-anonymous-}',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : '{-anonymous-} @ ',
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );
  test.is( got === o );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.introspector.locationNormalize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.introspector.locationNormalize( { original : '' }, { filePath : '/home/user' } ) );

  test.case = 'wrong type of o';
  test.shouldThrowErrorSync( () => _.introspector.locationNormalize([ '/some/path' ]) );

  test.case = 'unknown option in map o';
  test.shouldThrowErrorSync( () => _.introspector.locationNormalize({ unknown : '', original : '' }) );
}

//

function locationNormalizeOptionFilePath( test )
{
  test.case = 'only field filePath - empty string';
  var o = { filePath : '' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field filePath - simple path';
  var o = { filePath : '/C/dir/Introspector.test.s' };
  var exp =
  {
    'original' : null,
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '/C/dir/Introspector.test.s',
    'routineFilePathLineCol' : null,
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field filePath - internal path';
  var o = { filePath : 'internal/event' };
  var exp =
  {
    'original' : null,
    'filePath' : 'internal/event',
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : 'internal/event',
    'routineFilePathLineCol' : null,
    'fileName' : 'event',
    'fileNameLineCol' : 'event',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field filePath - internal path';
  var o = { filePath : 'node:internal/event' };
  var exp =
  {
    'original' : null,
    'filePath' : 'node:internal/event',
    'routineName' : null,
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : 'node:internal/event',
    'routineFilePathLineCol' : null,
    'fileName' : 'event',
    'fileNameLineCol' : 'event',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'field filePath - empty string, options map with original';
  var o =
  {
    original : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)',
    filePath : '',
  };
  var exp =
  {
    'original' : 'at Object.stackBasic (/C/dir/Introspector.test.s:48:79)',
    'filePath' : '/C/dir/Introspector.test.s',
    'routineName' : 'Object.stackBasic',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 48,
    'col' : 79,
    'filePathLineCol' : '/C/dir/Introspector.test.s:48:79',
    'routineFilePathLineCol' : 'Object.stackBasic @ /C/dir/Introspector.test.s:48:79',
    'fileName' : 'Introspector.test.s',
    'fileNameLineCol' : 'Introspector.test.s:48:79',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'field filePath - path to file, options map has field original';
  var o =
  {
    original : 'at iteration (C:\\dir\\File.js:5:47)',
    filePath : '/C/dir/(Introspector.test.s)',
  };
  var exp =
  {
    'original' : 'at iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47'
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'filePath - relative path, options map has field original';
  var o =
  {
    original : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)',
    filePath : 'internal/index.js'
  };
  var exp =
  {
    'original' : 'at wConsequence._handle__Now (C:\\dir\\File.js:5:15)',
    'filePath' : 'internal/index.js',
    'routineName' : 'wConsequence._handle__Now',
    'routineAlias' : null,
    'internal' : 2,
    'abstraction' : 1,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : 'internal/index.js:5:15',
    'routineFilePathLineCol' : 'wConsequence._handle__Now @ internal/index.js:5:15',
    'fileName' : 'index.js',
    'fileNameLineCol' : 'index.js:5:15',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );
}

//

function locationNormalizeOptionsRoutineNameAndRoutineAlias( test )
{
  test.open( 'field routineName' );

  test.case = 'only field routineName - empty string';
  var o = { routineName : '' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : '',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field routineName - simple name';
  var o = { routineName : 'routine' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : 'routine',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : 'routine @ ',
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field routineName - name has <anonymous>';
  var o = { routineName : '<anonymous>' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : '<anonymous>',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : '<anonymous> @ ',
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field routineName - complex name with dot';
  var o = { routineName : 'Object.routine' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : 'Object.routine',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : 'Object.routine @ ',
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - empty string, options map has original';
  var o =
  {
    original : 'at iteration (/C/dir/File.js:5:47)',
    routineName : '',
  };
  var exp =
  {
    'original' : 'at iteration (/C/dir/File.js:5:47)',
    'filePath' : '/C/dir/File.js',
    'routineName' : 'iteration',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 0,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/File.js:5:47',
    'routineFilePathLineCol' : 'iteration @ /C/dir/File.js:5:47',
    'fileName' : 'File.js',
    'fileNameLineCol' : 'File.js:5:47'
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string with underscore';
  var o =
  {
    original : 'at _iteration (C:\\dir\\File.js:5:47)',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '_routine',
  };
  var exp =
  {
    'original' : 'at _iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '_routine',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 1,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : '_routine @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string, which ends by one dot';
  var o =
  {
    original : 'at __iteration (C:\\dir\\File.js:5:47)',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '__routine.',
  };
  var exp =
  {
    'original' : 'at __iteration (C:\\dir\\File.js:5:47)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '__routine.',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 47,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:47',
    'routineFilePathLineCol' : '__routine. @ /C/dir/(Introspector.test.s):5:47',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:47',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'routineName - string, which ends by two dots';
  var o =
  {
    original : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)',
    filePath : '/C/dir/(Introspector.test.s)',
    routineName : '__routine..',
  };
  var exp =
  {
    'original' : 'at wConsequence.handle_Now (C:\\dir\\File.js:5:15)',
    'filePath' : '/C/dir/(Introspector.test.s)',
    'routineName' : '__routine..',
    'routineAlias' : null,
    'internal' : 0,
    'abstraction' : 2,
    'line' : 5,
    'col' : 15,
    'filePathLineCol' : '/C/dir/(Introspector.test.s):5:15',
    'routineFilePathLineCol' : '__routine.. @ /C/dir/(Introspector.test.s):5:15',
    'fileName' : '(Introspector.test.s)',
    'fileNameLineCol' : '(Introspector.test.s):5:15',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  test.close( 'field routineName' );

  /* - */

  test.open( 'field routineAlias' );

  test.case = 'only field routineAlias - empty string';
  var o = { routineAlias : '' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : null,
    'routineAlias' : '',
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field routineAlias - simple name';
  var o = { routineAlias : 'routine' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : null,
    'routineAlias' : 'routine',
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  /* */

  test.case = 'only field routineAlias - name has <anonymous>';
  var o = { routineAlias : '<anonymous>' };
  var exp =
  {
    'original' : null,
    'filePath' : undefined,
    'routineName' : null,
    'routineAlias' : '<anonymous>',
    'internal' : 0,
    'abstraction' : 0,
    'line' : null,
    'col' : null,
    'filePathLineCol' : '',
    'routineFilePathLineCol' : null,
    'fileName' : null,
    'fileNameLineCol' : '',
  };
  var got = _.introspector.locationNormalize( o );
  test.identical( got, exp );

  test.close( 'field routineAlias' );
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

function stackRelative( test )
{

  test.case = 'without arguments';
  var got = stackGet();
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  /* */

  test.open( 'stack - null' );

  test.case = 'without delta';
  var got = stackGet( null );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - undefined';
  var got = stackGet( null, undefined );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 0';
  var got = stackGet( null, 0 );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( null, 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( null, 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.close( 'stack - null' );

  /* */

  test.open( 'stack - undefined' );

  test.case = 'without delta';
  var got = stackGet( undefined );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - undefined';
  var got = stackGet( undefined, undefined );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 0';
  var got = stackGet( undefined, 0 );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( undefined, 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( undefined, 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.close( 'stack - undefined' );

  /* */

  test.open( 'stack - true' );

  test.case = 'without delta';
  var got = stackGet( true );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - undefined';
  var got = stackGet( true, undefined );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 0';
  var got = stackGet( true, 0 );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( true, 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( true, 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.close( 'stack - true' );

  /* */

  test.open( 'stack - false' );

  test.case = 'without delta';
  var got = stackGet( false );
  test.identical( got, '' );

  test.case = 'delta - false';
  var got = stackGet( false, undefined );
  test.identical( got, '' );

  test.case = 'delta - 0';
  var got = stackGet( false, 0 );
  test.identical( got, '' );

  test.case = 'delta - 1';
  var got = stackGet( false, 1 );
  test.identical( got, '' );

  test.case = 'delta - 2';
  var got = stackGet( false, 2 );
  test.identical( got, '' );

  test.close( 'stack - false' );

  /* */

  test.open( 'stack - 0' );

  test.case = 'without delta';
  var got = stackGet( 0 );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 0';
  var got = stackGet( 0, undefined );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 0';
  var got = stackGet( 0, 0 );
  test.is( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( 0, 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( 0, 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.close( 'stack - 0' );

  /* */

  test.open( 'stack - 1' );

  test.case = 'without delta';
  var got = stackGet( 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( 1, undefined );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( 1, 0 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.is( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 1';
  var got = stackGet( 1, 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( 1, 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.isNot( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.close( 'stack - 1' );

  /* */

  test.open( 'stack - 2' );

  test.case = 'without delta';
  var got = stackGet( 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( 2, undefined );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( 2, 0 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.is( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( 2, 1 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.isNot( _.strHas( got, 'at stackGet2 '  ) );
  test.is( _.strHas( got, 'at stackGet '  ) );

  test.case = 'delta - 2';
  var got = stackGet( 2, 2 );
  test.isNot( _.strHas( got, 'at stackGet4 '  ) );
  test.isNot( _.strHas( got, 'at stackGet3 '  ) );
  test.isNot( _.strHas( got, 'at stackGet2 '  ) );
  test.isNot( _.strHas( got, 'at stackGet '  ) );

  test.close( 'stack - 2' );

  /* */

  test.open( 'stack - string' );

  test.case = 'without delta';
  var got = stackGet( 'some\nat@\nb\nc\nd' );
  test.identical( got, 'some\nat@\nb\nc\nd' );

  test.case = 'delta - undefined';
  var got = stackGet( 'some\nat@\nb\nc\nd', undefined );
  test.identical( got, 'some\nat@\nb\nc\nd' );

  test.case = 'delta - 0';
  var got = stackGet( 'some\nat@\nb\nc\nd', 0 );
  test.identical( got, 'some\nat@\nb\nc\nd' );

  test.case = 'delta - 1';
  var got = stackGet( 'some\nat@\nb\nc\nd', 1 );
  test.identical( got, 'some\nat@\nb\nc\nd' );

  test.case = 'delta - 2';
  var got = stackGet( 'some\nat@\nb\nc\nd', 2 );
  test.identical( got, 'some\nat@\nb\nc\nd' );

  test.close( 'stack - string' );

  /* - */

  if( Config.debug )
  {
    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _.introspector.stackRelative( null, [ 1, 2 ], 'extra' ) );

    test.case = 'wrong type of stack';
    test.shouldThrowErrorSync( () => _.introspector.stackRelative( [ 'at @' ] ) );

    test.case = 'wrong type of delta';
    test.shouldThrowErrorSync( () => _.introspector.stackRelative( null, [] ) );
  }

  /* */

  function stackGet()
  {
    return stackGet2.apply( this, arguments );
  }

  function stackGet2()
  {
    return stackGet3.apply( this, arguments );
  }

  function stackGet3()
  {
    return stackGet4.apply( this, arguments );
  }

  function stackGet4()
  {
    return _.introspector.stackRelative( ... arguments );
  }
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

let Self =
{

  name : 'Tools.Introspector',
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

    locationFromStackFrameWithoutLocationField,
    locationFromStackFrameWithLocationField,
    /* qqq for Dmytro : redo tests ( redistribute please ). ask how to */
    locationNormalize, /* qqq for Dmytro : implement full coverage */
    locationNormalizeOptionFilePath,
    locationNormalizeOptionsRoutineNameAndRoutineAlias,

    stackBasic,
    stack,
    stackRelative,

    stackFilter,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
