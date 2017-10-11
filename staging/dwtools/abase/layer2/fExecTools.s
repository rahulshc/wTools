( function _ExecTools_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  try
  {
    _global_.Esprima = require( 'esprima' );
  }
  catch( err )
  {
  }

}

var System,ChildProcess;

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

var _assert = _.assert;
var _arraySlice = _.arraySlice;

// --
// exec
// --

function shell( o )
{
  var con = new wConsequence();

  if( _.strIs( o ) )
  o = { path : o };

  _.routineOptions( shell,o );
  _.assert( arguments.length === 1 );
  _.accessorForbid( o,'child' );
  _.accessorForbid( o,'returnCode' );

  if( o.ipc )
  {
    if( _.strIs( o.stdio ) )
    o.stdio = _.dup( o.stdio,3 );
    if( !_.arrayHas( o.stdio,'ipc' ) )
    o.stdio.push( 'ipc' );
  }

  if( o.args )
  _.assert( _.arrayIs( o.args ) );

  if( o.passingThrough )
  {
    var argumentsManual = process.argv.slice( 2 );
    o.args = _.arrayAppendArray( o.args || [],argumentsManual );
/*
    if( argumentsManual.length )
    path += ' "' + argumentsManual.join( '" "' ) + '"';
*/
  }

  if( o.outputCollecting && !o.output )
  o.output = '';

  /* */

  if( !ChildProcess )
  ChildProcess = require( 'child_process' );

  if( o.outputColoring && typeof module !== 'undefined' )
  try
  {
    if( _.Logger === undefined )
    _.include( 'wLogger' );
    if( _.color === undefined )
    _.include( 'wColor' );
  }
  catch( err ) 
  {
  }

  /* */

  if( o.verbosity )
  {
    if( o.args )
    logger.log( o.path, o.args.join( ' ' ) );
    else
    logger.log( o.path );
  }

  /* */

  try
  {
    var optionsForSpawn = Object.create( null );

    if( o.stdio )
    optionsForSpawn.stdio = o.stdio;
    optionsForSpawn.detached = !!o.detaching;

    if( o.mode === 'fork')
    {
      o.process = ChildProcess.fork( o.path,'',{ silent : false } );
    }
    else if( o.mode === 'spawn' )
    {
      var app = o.path;

      if( !o.args )
      {
        o.args = _.strSplit( o.path );
        app = o.args.shift();
      }

      o.process = ChildProcess.spawn( app,o.args,optionsForSpawn );
    }
    else if( o.mode === 'shell' )
    {
      var app = process.platform === 'win32' ? 'cmd' : 'sh';
      var appParam = process.platform === 'win32' ? '/c' : '-c';

      if( o.args )
      o.path = o.path + ' ' + o.args.join( ' ' );

      o.process = ChildProcess.spawn( app,[ appParam,o.path ],optionsForSpawn );
    }
    else if( o.mode === 'exec' )
    {
      logger.warn( '( shell.mode ) "exec" is deprecated' );
      o.process = ChildProcess.exec( o.path );
    }
    else _.assert( 0,'unknown mode',o.mode );

  }
  catch( err )
  {
    return con.error( _.errLogOnce( err ) );
  }

  /* */

  if( o.outputPiping )
  if( o.process.stdout )
  o.process.stdout.on( 'data', function( data )
  {

    // console.log( 'data' );

    if( _.bufferAnyIs( data ) )
    data = _.bufferToStr( data );

    if( _.strEnds( data,'\n' ) )
    data = _.strRemoveEnd( data,'\n' );

    if( o.outputCollecting )
    o.output += data;

    if( o.outputPrefixing )
    data = 'stdout :\n' + _.strIndentation( data,'  ' );

    if( _.color && o.outputColoring )
    data = _.strColor.bg( _.strColor.fg( data, 'black' ) , 'yellow' );

    logger.log( data );
  });

  /* */

  if( o.outputPiping )
  if( o.process.stderr )
  o.process.stderr.on( 'data', function( data )
  {

    if( _.bufferAnyIs( data ) )
    data = _.bufferToStr( data );

    if( _.strEnds( data,'\n' ) )
    data = _.strRemoveEnd( data,'\n' );

    if( o.outputPrefixing )
    data = 'stderr :\n' + _.strIndentation( data,'  ' );

    if( _.color && o.outputColoring )
    data = _.strColor.bg( _.strColor.fg( data, 'red' ) , 'yellow' );

    logger.warn( data );
  });

  /* */

  var done = false;
  o.process.on( 'error', function( err )
  {

    if( o.verbosity >= 1 )
    err = _.errLogOnce( err );

    if( done )
    return;

    done = true;
    con.error( err );
  });

  /* */

  o.process.on( 'close', function( exitCode,signal )
  {

    o.exitCode = exitCode;
    o.signal = signal;

    if( o.verbosity > 1 )
    {
      logger.log( 'Process returned error code :',exitCode );
      if( exitCode )
      logger.log( 'Launched as :',o.path );
    }

    if( done )
    return;

    done = true;

    if( o.applyingExitCode )
    if( exitCode !== 0 || o.signal )
    {
      if( _.numberIs( exitCode ) )
      _.appExitCode( exitCode );
      else
      _.appExitCode( -1 );
    }

    if( exitCode !== 0 && o.throwingBadExitCode )
    {
      if( _.numberIs( exitCode ) )
      con.error( _.err( 'Process returned error code :',exitCode,'\nLaunched as :',o.path ) );
      else
      con.error( _.err( 'Process wass killed by signal :',signal,'\nLaunched as :',o.path ) );
    }
    else
    {
      con.give( o );
    }

  });

  return con;
}

shell.defaults =
{

  path : null,
  args : null,
  mode : 'shell',

  stdio : 'pipe', /* 'pipe' / 'ignore' / 'inherit' */
  ipc : 0,
  detaching : 0,
  passingThrough : 0,

  throwingBadExitCode : 0,
  applyingExitCode : 0,

  outputColoring : 1,
  outputPrefixing : 1,
  outputPiping : 1,
  outputCollecting : 0,
  verbosity : 1,

}

//

function shellNode( o )
{

  if( !System )
  {
    System = require( 'os' );
    _.include( 'wPath' );
    _.include( 'wFiles' );
  }

  if( _.strIs( o ) )
  o = { path : o }

  _.routineOptions( shellNode,o );
  _.assert( _.strIs( o.path ) );
  _.assert( !o.code );
  _.accessorForbid( o,'child' );
  _.accessorForbid( o,'returnCode' );
  _.assert( arguments.length === 1 );

  /*
  1024*1024 for megabytes
  1.5 factor found empirically for windows
      implementation of nodejs for other OSs could be able to use more memory
  */

  var argumentsForNode = '';
  if( o.maximumMemory )
  {
    var totalmem = System.totalmem();
    if( o.verbosity )
    logger.log( 'System.totalmem()',_.strMetricFormatBytes( totalmem ) );
    var totalmem = Math.floor( ( totalmem / ( 1024*1024*1.5 ) - 1 ) / 256 ) * 256;
    argumentsForNode = '--expose-gc --stack-trace-limit=999 --max_old_space_size=' + totalmem;
  }

  var path = _.fileProvider.pathNativize( o.path );
  path = _.strConcat( 'node',argumentsForNode,path );

  // var shellOptions =
  // {
  //   code : code,
  //   outputPrefixing : 1,
  //   outputCollecting : 0,
  //   applyingExitCode : 1,
  //   throwingBadExitCode : 1,
  //   stdio : 'inherit',
  //   verbosity : o.verbosity,
  //   passingThrough : o.passingThrough
  // }

  var shellOptions = _.mapScreen( _.shell.defaults,o );
  shellOptions.path = path;

  var result = _.shell( shellOptions )
  .got( function( err,arg )
  {
    o.exitCode = shellOptions.exitCode;
    o.signal = shellOptions.signal;
    this.give( err,arg );
  });

  o.process = shellOptions.process;

  return result;
}

shellNode.defaults =
{

  path : null,
  verbosity : 1,
  passingThrough : 0,
  maximumMemory : 1,

  outputPrefixing : 1,
  outputCollecting : 0,
  applyingExitCode : 1,
  throwingBadExitCode : 1,

  stdio : 'inherit',

}

shellNode.defaults.__proto__ = shell.defaults;

//

function shellNodePassingThrough( o )
{

  if( _.strIs( o ) )
  o = { path : o }

  _.routineOptions( shellNodePassingThrough,o );
  _.assert( arguments.length === 1 );
  var result = _.shellNode( o );

  return result;
}

shellNodePassingThrough.defaults =
{

  passingThrough : 1,
  maximumMemory : 1,

}

shellNodePassingThrough.defaults.__proto__ = shellNode.defaults;

// --
//
// --

function routineSourceGet( o )
{
  if( _.routineIs( o ) )
  o = { routine : o };

  _.routineOptions( routineSourceGet,o );
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( o.routine ) );

  var result = o.routine.toSource ? o.routine.toSource() : o.routine.toString();

  var reg1 = /^\s*function\s*\w*\s*\([^\)]*\)\s*\{\s*/;
  var reg2 = /\s*\}\s*$/;
  if( !o.withWrap && reg1.exec( result ) )
  {
    result = result.replace( reg1,'' );
    result = result.replace( reg2,'' );
  }

  return result;
}

routineSourceGet.defaults =
{
  routine : null,
  wrap : 1,
  withWrap : 1,
}

//

function routineMake( o )
{
  var result;

  if( _.strIs( o ) )
  o = { code : o };

  _.routineOptions( routineMake,o );
  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( o.externals ) || o.externals === null );

  /* prefix */

  var prefix = '\n';

  if( o.usingStrict )
  prefix += `'use strict';\n`;
  if( o.debug )
  prefix += 'debugger;\n';
  if( o.filePath )
  prefix += '// ' + o.filePath + '\n';

  if( o.externals )
  {
    if( !wTools.__externals__ )
    wTools.__externals__ = [];
    wTools.__externals__.push( o.externals );
    prefix += '\n';
    for( e in o.externals )
    prefix += 'var ' + e + ' = ' + '_global_.wTools.__externals__[ ' + String( wTools.__externals__.length-1 ) + ' ].' + e + ';\n';
    prefix += '\n';
  }

  /* */

  try
  {

    if( o.prependingReturn )
    try
    {
      var code = prefix + 'return ' + o.code.trimLeft();
      result = new Function( code );
    }
    catch( err )
    {
      var code = prefix + o.code;
      result = new Function( code );
    }
    else
    {
      var code = prefix + o.code;
      result = new Function( code );
    }

  }
  catch( err )
  {

    console.error( 'Cant parse the routine :' );
    console.error( code );

    if( _global_.document )
    {
      var e = document.createElement( 'script' );
      e.type = 'text/javascript';
      e.src = 'data:text/javascript;charset=utf-8,' + escape( o.code );
      document.head.appendChild( e );
    }
    else if( _global_.Blob && _global_.Worker )
    {
      var worker = _.makeWorker( code )
    }
    else if( _global_.Esprima || _global_.esprima )
    {
      var Esprima = _global_.Esprima || _global_.esprima;
      try
      {
        var parsed = Esprima.parse( '(function(){\n' + code + '\n})();' );
      }
      catch( err2 )
      {
        debugger;
        throw _._err
        ({
          args : [ err , err2 ],
          level : 1,
          sourceCode : code,
        });
      }
    }

    throw _.err( 'More information about error is comming asynchronously.\n',err );
    return null;
  }

  return result;
}

routineMake.defaults =
{
  debug : 0,
  code : null,
  filePath : null,
  prependingReturn : 1,
  usingStrict : 0,
  externals : null,
}

//

function routineExec( o )
{
  var result = Object.create( null );

  if( _.strIs( o ) )
  o = { code : o };
  _.assert( arguments.length === 1 );
  _.routineOptions( routineExec,o );

  o.routine = routineMake
  ({
    code : o.code,
    debug : o.debug,
    filePath : o.filePath,
    prependingReturn : o.prependingReturn,
    externals : o.externals,
  });

  /* */

  try
  {
    // debugger;
    if( o.context )
    o.result = o.routine.apply( o.context );
    else
    o.result = o.routine.call( _global_ );
    // debugger;
  }
  catch( err )
  {
    debugger;
    throw _._err
    ({
      args : [ err ],
      level : 1,
      sourceCode : o.routine.toString(),
      location : { path : o.filePath },
    });
    // throw _.err( err );
  }

  return o;
}

routineExec.defaults =
{
  context : null,
}

routineExec.defaults.__proto__ = routineMake.defaults;

//

function exec( o )
{
  _.assert( arguments.length === 1 );
  if( _.strIs( o ) )
  o = { code : o };
  routineExec( o );
  return o.result;
}

exec.defaults =
{
}

exec.defaults.__proto__ = routineExec.defaults;

//

function execInWorker( o )
{
  var result;

  if( _.strIs( o ) )
  o = { code : o };
  _.assert( arguments.length === 1 );
  _.routineOptions( execInWorker,o );

  var blob = new Blob( [ o.code ], { type : 'text/javascript' } );
  var worker = new Worker( URL.createObjectURL( blob ) );

  throw _.err( 'not implemented' );

}

execInWorker.defaults =
{
  code : null,
}

//

function makeWorker( o )
{
  var result;

  if( _.strIs( o ) )
  o = { code : o };
  _.assert( arguments.length === 1 );
  _.routineOptions( makeWorker,o );

  var blob = new Blob( [ o.code ], { type : 'text/javascript' } );
  var worker = new Worker( URL.createObjectURL( blob ) );

  return worker;
}

makeWorker.defaults =
{
  code : null,
}

//

// function execAsyn( routine,onEnd,context )
// {
//   _assert( arguments.length >= 3,'execAsyn :','expects 3 arguments or more' );
//
//   var args = arraySlice( arguments,3 ); throw _.err( 'not tested' );
//
//   _.timeOut( 0,function()
//   {
//
//     routine.apply( context,args );
//     onEnd();
//
//   });
//
// }

//

function execStages( stages,o )
{
  var o = o || Object.create( null );

  _.routineOptionsWithUndefines( execStages,o );

  o.stages = stages;

  Object.preventExtensions( o );

  /* validation */

  _.assert( _.objectIs( stages ) || _.arrayLike( stages ),'expects array or object ( stages ), but got',_.strTypeOf( stages ) );

  for( var s in stages )
  {

    var routine = stages[ s ];

    _.assert( routine || routine === null,'execStages :','#'+s,'stage is not defined' );
    _.assert( _.routineIs( routine ) || routine === null,'execStages :','stage','#'+s,'does not have routine to execute' );

  }

  /*  var */

  var con = _.timeOut( 1 );
  var keys = Object.keys( stages );
  var s = 0;

  _.assert( arguments.length === 1 || arguments.length === 2 );

  /* begin */

  if( o.onBegin )
  con.doThen( o.onBegin );

  /* end */

  function handleEnd()
  {

    con.doThen( function( err,data )
    {

      if( err )
      throw _.errLogOnce( err );
      else
      return data;

    });

    if( o.onEnd )
    con.doThen( o.onEnd );

  }

  /* staging */

  function handleStage()
  {

    var stage = stages[ keys[ s ] ];
    var iteration = Object.create( null );

    iteration.index = s;
    iteration.key = keys[ s ];

    s += 1;

    if( stage === null )
    return handleStage();

    if( !stage )
    return handleEnd();

    /* arguments */

    iteration.routine = stage;
    iteration.routine = _.routineJoin( o.context,iteration.routine,o.args );

    function routineCall()
    {
      var ret = iteration.routine();
      return ret;
    }

    /* exec */

    if( o.onEachRoutine )
    {
      con.ifNoErrorThen( _.routineSeal( o.context,o.onEachRoutine,[ iteration.routine,iteration,o ] ) );
    }

    if( !o.manual )
    con.ifNoErrorThen( routineCall );

    con.timeOutThen( o.delay );

    handleStage();

  }

  /* */

  handleStage();

  return con;
}

execStages.defaults =
{
  delay : 1,

  args : undefined,
  context : undefined,

  manual : false,

  onEachRoutine : null,
  onBegin : null,
  onEnd : null,
}

// --
//
// --

var _appArgsInSubjectAndMapFormatResult;
function appArgsInSubjectAndMapFormat( o )
{

  o = _.routineOptions( appArgsInSubjectAndMapFormat,o );

  if( _appArgsInSubjectAndMapFormatResult && o.delimeter === _appArgsInSubjectAndMapFormatResult.delimeter )
  return _appArgsInSubjectAndMapFormatResult;

  var result = _appArgsInSubjectAndMapFormatResult = Object.create( null );

  if( _global_.process )
  {
    if( o.argv )
    _.assert( _.arrayLike( o.argv ) );

    var argv = o.argv || process.argv;

    result.interpreterPath = argv[ 0 ];
    result.mainPath = argv[ 1 ];
    result.interpreterArgs = process.execArgv;
    result.delimter = o.delimeter;
    result.map = Object.create( null );
    result.subject = '';
    result.scriptArgs = argv.slice( 2 );

    if( !result.scriptArgs.length )
    return result;

    var scriptArgs = [];
    result.scriptArgs.forEach( function( arg, pos )
    {
      if( arg.length > 1 && arg.indexOf( o.delimeter ) !== -1 )
      {
        var argSplitted = _.strSplit({ src : arg, delimeter : o.delimeter, stripping : 1, preservingDelimeters : 1 })
        scriptArgs.push.apply( scriptArgs, argSplitted );
      }
      else
      scriptArgs.push( arg );
    })

    result.scriptArgs = scriptArgs;

    if( result.scriptArgs.length === 1 )
    {
      result.subject = result.scriptArgs[ 0 ];
      return result;
    }

    var i =  result.scriptArgs.indexOf( o.delimeter );
    if( i > 1 )
    {
      var part = result.scriptArgs.slice( 0, i - 1 );
      var subject = part.join( ' ' );
      var regexp = new RegExp( '.?\h*\\' + o.delimeter + '\\h*.?' );
      if( !regexp.test( subject ) )
      result.subject = subject;
    }

    if( i < 0 )
    result.subject = result.scriptArgs.shift();

    var args = result.scriptArgs.join( ' ' );
    args = args.trim();

    if( !args )
    return result;

    var splitted = _.strSplit({ src : args, delimeter : o.delimeter, stripping : 1 });

    if( splitted.length === 1 )
    {
      result.subject = splitted[ 0 ];
      return result;
    }

    _.assert( _.strCutOffAllLeft( splitted[ 0 ],' ' ).length === 3 )
    splitted[ 0 ] = _.strCutOffAllLeft( splitted[ 0 ],' ' )[ 2 ];

    result.map = _.strParseMap( splitted.join( ':' ) );

  }

  return result;
}

appArgsInSubjectAndMapFormat.defaults =
{
  delimeter : ':',
  argv : null
}

//

function appAnchor( o )
{
  var o = o || {};

  _.routineOptions( appAnchor,o );

  var a = _.strParseMap
  ({
    src : _.strRemoveBegin( window.location.hash,'#' ),
    valKeyDelimeter : ':',
    entryDelimeter : ';',
  });

  if( o.extend )
  {
    _.mapExtend( a,o.extend );
  }

  if( o.del )
  {
    _.mapDelete( a,o.del );
  }

  if( o.extend || o.del )
  {

    var newHash = '#' + _.mapToStr
    ({
      src : a,
      valKeyDelimeter : ':',
      entryDelimeter : ';',
    });

    if( o.replacing )
    history.replaceState( undefined, undefined, newHash )
    else
    window.location.hash = newHash;

  }

  return a;
}

appAnchor.defaults =
{
  extend : null,
  del : null,
  replacing : 0,
}

//

function appExitCode( status )
{
  var result;

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( status === undefined || _.numberIs( status ) );

  if( _global_.process )
  {
    result = process.exitCode;
    if( status !== undefined )
    process.exitCode = status;
  }

  return result;
}

//

function appExit( exitCode )
{

  exitCode = exitCode !== undefined ? exitCode : appExitCode();

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( exitCode === undefined || _.numberIs( exitCode ) );

  if( _global_.process )
  {
    process.exit( exitCode );
  }
  else
  {
    debugger;
  }

}

//

function appExitWithBeep( exitCode )
{

  exitCode = exitCode !== undefined ? exitCode : appExitCode();

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( exitCode === undefined || _.numberIs( exitCode ) );

  _.beep();

  if( exitCode )
  _.beep();

  _.appExit( exitCode );
}

// --
// prototype
// --

var Proto =
{

  shell : shell,
  shellNode : shellNode,
  shellNodePassingThrough : shellNodePassingThrough,

  //

  routineSourceGet : routineSourceGet,

  routineMake : routineMake,
  routineExec : routineExec,

  exec : exec,

  execInWorker : execInWorker,
  makeWorker : makeWorker,

  execStages : execStages, /* experimental */

  //

  appArgsInSubjectAndMapFormat : appArgsInSubjectAndMapFormat,
  appArgs : appArgsInSubjectAndMapFormat,

  appAnchor : appAnchor,

  appExitCode : appExitCode,
  appExit : appExit,
  appExitWithBeep : appExitWithBeep,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
