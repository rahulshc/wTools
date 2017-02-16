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

    if( o.usingLogging )
    logger.log( o.code );

    /* */

    try
    {

      if( o.mode === 'fork')
      {
        o.child = ChildProcess.fork( o.code,'',{ silent : false } );
      }
      else if( o.mode === 'spawn' )
      {
        var args = _.strSplit( o.code );
        var app = args.shift();
        // logger.log( 'spawn :',app,args );
        o.child = ChildProcess.spawn( app, args );
        // var i = o.code.indexOf( ' ' );
        // o.child = ChildProcess.spawn( o.code.substring( 0,i ),[ o.code.substring( i+1 ) ] );
      }
      else if( o.mode === 'shell' )
      {
        // var i = o.code.indexOf( ' ' );
        // o.child = ChildProcess.spawn( o.code.substring( 0,i ),[ o.code.substring( i+1 ) ] );
        var app = process.platform === 'win32' ? 'cmd' : 'sh';
        var appParam = process.platform === 'win32' ? '/c' : '-c';
        // logger.log( app,'-c',o.code );
        o.child = ChildProcess.spawn( app,[ appParam,o.code ] );
      }
      else if( o.mode === 'exec' )
      {
        logger.warn( 'shell.mode "exec" is deprecated' );
        o.child = ChildProcess.exec( o.code );
      }
      else throw _.err( 'unknown mode',o.mode );

    }
    catch( err )
    {
      return con.error( err );
    }

    /* */

    if( o.child.stdout )
    o.child.stdout.on( 'data', function( data )
    {
      // logger.log( 'stdout',_.strTypeOf( data ),arguments.length );

      if( _.bufferAnyIs( data ) )
      data = _.bufferToStr( data );

      data = 'stdout :\n' + _.strIndentation( data,'  ' );
      if( _.color && o.usingColoring )
      data = _.strColor.bg( _.strColor.fg( data, 'black' ) , 'yellow' );
      logger.log( data );
    });

    /* */

    if( o.child.stderr )
    o.child.stderr.on( 'data', function( data )
    {
      // logger.log( 'stderr',_.strTypeOf( data ),arguments.length );

      if( _.bufferAnyIs( data ) )
      data = _.bufferToStr( data );

      data = 'stder :\n' + _.strIndentation( data,'  ' );
      if( _.color && o.usingColoring )
      data = _.strColor.bg( _.strColor.fg( data, 'red' ) , 'yellow' );
      logger.log( data );
    });

    /* */

    var done = false;
    o.child.on( 'error', function( err )
    {

      if( o.usingLogging > 1 )
      _.errLog( err );

      if( done )
      return;

      done = true;
      con.error( _.err( err ) );
    });

    /* */

    o.child.on( 'close', function( errCode )
    {

      if( o.usingLogging > 1 )
      {
        logger.log( 'Process returned error code :',errCode,'\nLaunched as :',o.code );
      }

      if( done )
      return;

      done = true;

      if( errCode !== 0 && o.throwingBadReturnCode )
      con.error( _.err( 'Process returned error code :',errCode,'\nLaunched as :',o.code ) );
      else
      con.give( errCode );

    });

    return con;
  }

})();

shell.defaults =
{
  code : null,
  mode : 'shell',
  throwingBadReturnCode : 0,
  usingColoring : 1,
  usingLogging : 1,
}

//

var exec = function exec( o )
{
  var result;

  if( _.strIs( o ) )
  o = { code : o };
  _.assert( arguments.length === 1 );
  _.routineOptions( makeFunction,o );

  var f = makeFunction({ code : o.code });
  try
  {
    result = f.call();
  }
  catch( err )
  {
    throw _.err( err );
  }

  return result;
}

exec.defaults =
{
  code : null,
}

//

function makeFunction( o )
{
  var result;

  if( _.strIs( o ) )
  o = { code : o };
  _.assert( arguments.length === 1 );
  _.routineOptions( makeFunction,o );

  var code = 'return' + o.code + '';

  try
  {

    //result = eval( code );
    result = new Function( code );

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
    else
    if( _global_.Blob && _global_.Worker )
    {
      var worker = _.makeWorker( code )
    }
    else if( _global_.Esprima || _global_.esprima )
    {
      var Esprima = _global_.Esprima || _global_.esprima;
      var parsed = Esprima.parse( '(function(){\n' + code + '\n})();' );
    }

    throw _.err( 'More information about error is comming asynchronously.\n',err );
    return null;
  }

  return result;
}

makeFunction.defaults =
{
  code : null,
}

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

var execStages = function execStages( stages,o )
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
  con.thenDo( o.onBegin );

  // end

  function handleEnd()
  {

    con.thenDo( function( err,data )
    {

      if( err )
      throw _.errLogOnce( err );
      else
      return data;

    });

    // if( o.onEnd )
    // debugger;

    if( o.onEnd )
    con.thenDo( o.onEnd );

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

    con.thenTimeOut( o.delay );

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
var execForEach = function execForEach( elements,o )
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

  exec : exec,
  makeFunction : makeFunction,

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
