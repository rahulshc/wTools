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

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

var _assert = _.assert;
var _arraySlice = _.arraySlice;

/*

  !!! rewrite or deprecate?
  !!! introduce paramter to continue on error

*/

/*

!!!

function read( data )
{
  var vm = VirtualMachine.createContext({});
  var script = VirtualMachine.createScript( '(' + s + ')' );
  return script.runInNewContext( vm );
};

*/

// --
// exec
// --

var shell = ( function( o )
{

  var ChildProcess;

  return function shell( o )
  {
    var con = new wConsequence();

    if( _.strIs( o ) )
    o = { code : o };

    _.routineOptions( shell,o );
    _.assert( arguments.length === 1 );

    if( o.args )
    _.assert( _.arrayIs( o.args ) );

    if( o.outputCollecting )
    o.output = '';

    /* */

    if( !ChildProcess )
    ChildProcess = require( 'child_process' );

    if( o.usingColoring )
    if( _.color === undefined && typeof module !== 'undefined' )
    try
    {
      require( 'wLogger' );
      require( 'wColor' );
    }
    catch( err ) 
    {
      _.color = null;
    }

    /* */

    if( o.verbosity )
    {
      if( o.args )
      logger.log( o.code, o.args.join( ' ' ) );
      else
      logger.log( o.code );
    }

    /* */

    try
    {
      var optionsForSpawn = Object.create( null );
      if( o.stdio )
      optionsForSpawn.stdio = o.stdio;

      if( o.mode === 'fork')
      {
        o.child = ChildProcess.fork( o.code,'',{ silent : false } );
      }
      else if( o.mode === 'spawn' )
      {
        var app = o.code;

        if( !o.args )
        {
          o.args = _.strSplit( o.code );
          app = o.args.shift();
        }

        o.child = ChildProcess.spawn( app,o.args,optionsForSpawn );
      }
      else if( o.mode === 'shell' )
      {
        var app = process.platform === 'win32' ? 'cmd' : 'sh';
        var appParam = process.platform === 'win32' ? '/c' : '-c';

        if( o.args )
        o.code = o.code + ' ' + o.args.join( ' ' );

        o.child = ChildProcess.spawn( app,[ appParam,o.code ],optionsForSpawn );
      }
      else if( o.mode === 'exec' )
      {
        logger.warn( '( shell.mode ) "exec" is deprecated' );
        o.child = ChildProcess.exec( o.code );
      }
      else throw _.err( 'unknown mode',o.mode );

    }
    catch( err )
    {
      return con.error( _.errLogOnce( err ) );
    }

    /* */

    if( o.outputPiping )
    if( o.child.stdout )
    o.child.stdout.on( 'data', function( data )
    {

      if( _.bufferAnyIs( data ) )
      data = _.bufferToStr( data );

      if( _.strEnds( data,'\n' ) )
      data = _.strRemoveEnd( data,'\n' );

      if( o.outputCollecting )
      o.output += data;

      if( !o.outputRaw )
      data = 'stdout :\n' + _.strIndentation( data,'  ' );

      if( !o.outputRaw )
      if( _.color && o.usingColoring )
      data = _.strColor.bg( _.strColor.fg( data, 'black' ) , 'yellow' );

      logger.log( data );
    });

    /* */

    if( o.outputPiping )
    if( o.child.stderr )
    o.child.stderr.on( 'data', function( data )
    {

      if( _.bufferAnyIs( data ) )
      data = _.bufferToStr( data );

      if( _.strEnds( data,'\n' ) )
      data = _.strRemoveEnd( data,'\n' );

      if( !o.outputRaw )
      data = 'stder :\n' + _.strIndentation( data,'  ' );

      if( !o.outputRaw )
      if( _.color && o.usingColoring )
      data = _.strColor.bg( _.strColor.fg( data, 'red' ) , 'yellow' );

      // debugger;

      logger.warn( data );
    });

    /* */

    var done = false;
    o.child.on( 'error', function( err )
    {

      if( o.verbosity >= 1 )
      _.errLog( err );

      if( done )
      return;

      done = true;
      con.error( _.err( err ) );
    });

    /* */

    o.child.on( 'close', function( returnCode )
    {

      if( o.verbosity > 1 )
      {
        logger.log( 'Process returned error code :',returnCode );
        if( returnCode )
        logger.log( 'Launched as :',o.code );
      }

      if( done )
      return;

      done = true;

      if( returnCode !== 0 && o.applyingReturnCode )
      if( _.numberIs( returnCode ) )
      _.appExitCode( returnCode );

      o.returnCode = returnCode;

      if( returnCode !== 0 && o.throwingBadReturnCode )
      {
        if( _.numberIs( returnCode ) )
        con.error( _.err( 'Process returned error code :',returnCode,'\nLaunched as :',o.code ) );
      }
      else
      con.give( o );
      /*con.give( returnCode );*/

    });

    return con;
  }

})();

shell.defaults =
{
  code : null,
  mode : 'shell',
  args : null,
  stdio : 'inherit', /* 'pipe' / 'ignore' / 'inherit' */
  throwingBadReturnCode : 0,
  applyingReturnCode : 0,
  usingColoring : 1,
  outputRaw : 0,
  outputPiping : 1,
  outputCollecting : 1,
  verbosity : 1,
}

//

var System;
function shellNode( o )
{

  if( !System )
  {
    System = require( 'os' );
    _.include( 'wPath' );
    _.include( 'wFiles' );
  }

  if( _.strIs( o ) )
  o = { scriptPath : o }

  _.routineOptions( shellNode,o )

  _.assert( _.strIs( o.scriptPath ) );

  var totalmem = System.totalmem();

  if( o.verbosity )
  logger.log( 'System.totalmem()',_.strMetricFormatBytes( totalmem ) );

  /*
  1024*1024 for megabytes
  1.5 factor found empirically for windows
      implementation of nodejs for other OSs could use more memory
  */

  var totalmem = Math.floor( ( totalmem / ( 1024*1024*1.5 ) - 1 ) / 256 ) * 256;

  var argumentsForNode = '--expose-gc --stack-trace-limit=999 --max_old_space_size=' + totalmem + ' --max_executable_size=' + totalmem;
  var scriptPath = _.fileProvider.pathNativize( o.scriptPath );
  var argumentsManual = process.argv.slice( 2 );
  var code = _.strConcat( 'node',argumentsForNode,scriptPath );

  if( argumentsManual.length )
  code += ' "' + argumentsManual.join( '" "' ) + '"';

  var shell =
  {
    code : code,
    outputRaw : 1,
    outputCollecting : 0,
    applyingReturnCode : 1,
    throwingBadReturnCode : 1,
    verbosity : o.verbosity,
  }

  _.shell( shell );

  //process.stdin.pipe( shell.child.stdin );

  // console.log( 'shell',shell );

}

shellNode.defaults =
{
  scriptPath : null,
  verbosity : 1,
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
  prefix += `'use strict;'\n`;
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

    console.error( 'Cant execute code :' );
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
  usingStrict : 1,
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
  var o = o || {};

  _.routineOptionsWithUndefines( execStages,o );

  o.stages = stages;

  Object.preventExtensions( o );

  // validation

  _.assert( _.objectIs( stages ) || _.arrayLike( stages ),'expects array or object ( stages ), but got',_.strTypeOf( stages ) );

  for( var s in stages )
  {

    _.assert( stages[ s ],'execStages :','#'+s,'stage is not defined' );

    var routine = stages[ s ];

    // if( !_.routineIs( routine ) )
    // routine = stages[ s ].syn || stages[ s ].asyn;

    _.assert( _.routineIs( routine ),'execStages :','stage','#'+s,'does not have routine to execute' );

  }

  //  var

  var con = _.timeOut( 1 );
  var keys = Object.keys( stages );
  var s = 0;

  _.assert( arguments.length === 1 || arguments.length === 2 );

  // begin

  if( o.onBegin )
  con.doThen( o.onBegin );

  // end

  function handleEnd()
  {

    con.doThen( function( err,data )
    {

      if( err )
      throw _.errLogOnce( err );
      else
      return data;

    });

    // if( o.onEnd )
    // debugger;

    if( o.onEnd )
    con.doThen( o.onEnd );

  }

  // staging

  function handleStage()
  {

    var stage = stages[ keys[ s ] ];
    var iteration = {};

    iteration.index = s;
    iteration.key = keys[ s ];

    s += 1;

    if( !stage )
    return handleEnd();

    // arguments

    iteration.routine = stage;
    iteration.routine = _.routineJoin( o.context,iteration.routine,o.args );

    function routineCall()
    {
      var ret = iteration.routine();
      return ret;
    }

    // exec

    if( o.onEachRoutine )
    {
      con.ifNoErrorThen( _.routineSeal( o.context,o.onEachRoutine,[ iteration.routine,iteration,o ] ) );
    }

    if( !o.manual )
    con.ifNoErrorThen( routineCall );

    con.timeOutThen( o.delay );

    handleStage();

  }

  //

  handleStage();

  return con;
}

execStages.defaults =
{
  // syn : 0,
  delay : 1,

  args : undefined,
  context : undefined,
  // result : null,

  manual : false,
  // stages : null,

  onEachRoutine : null,
  onBegin : null,
  onEnd : null,
}

//
/*
function execForEach( elements,o )
{

  // validation

  if( !elements ) throw _.err( 'execForEach :','require elements' );
  if( !o ) throw _.err( 'execForEach :','require o' );
  if( o.onEach === undefined ) throw _.err( 'execForEach :','o require onEach' );
  if( o.range === undefined ) throw _.err( 'execForEach :','o require range' );

  // correction

  if( o.batch === undefined ) o.batch = 1;
  if( o.delay === undefined ) o.delay = 0;
  if( o.batch === 0 ) o.batch = o.range[ 1 ] - o.range[ 0 ];

  // begin

  if( o.onBegin ) o.onBegin.call( o.context );

  var r = o.range[ 0 ];

  var range = o.range.slice();

  function exec()
  {

    for( var l = Math.min( range[ 1 ],r+o.batch ) ; r < l ; r++ )
    {
      o.onEach.call( o.context,r );
    }

    if( r < range[ 1 ] )
    {
      _.timeOut( o.delay,exec );
    }
    else
    {
      if( o.onEnd ) o.onEnd.call( o.context );
    }

  }

  exec();

}
*/

// --
// prototype
// --

var Proto =
{

  shell : shell,
  shellNode : shellNode,

  routineMake : routineMake,
  routineExec : routineExec,
  exec : exec,

  execInWorker : execInWorker,
  makeWorker : makeWorker,

  execStages : execStages, /* deprecated */

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
{
  module[ 'exports' ] = Self;
}

})();
