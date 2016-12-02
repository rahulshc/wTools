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

var read = function( data )
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

  var ChildProcess,Chalk;

  return function shell( o )
  {
    var con = new wConsequence();

    debugger;

    if( _.strIs( o ) )
    o = { code : o };

    _.routineOptions( shell,o );
    _.assert( arguments.length === 1 );

    /* */

    if( !ChildProcess )
    ChildProcess = require( 'child_process' );

    if( o.usingColoring )
    if( Chalk === undefined && typeof module !== 'undefined' )
    try
    {
      Chalk = require( 'chalk' );
    }
    catch( err ) 
    {
      Chalk = null;
    }

    /* */

    if( o.usingLogging )
    logger.log( o.code );

    if( o.usingFork )
    o.child = ChildProcess.fork( o.code,'',{ silent : false } );
    else
    o.child = ChildProcess.exec( o.code );

    debugger;

    if( o.child.stdout )
    o.child.stdout.on( 'data', function( data )
    {
      data = 'Output :\n' + _.strIndentation( data,'  ' );
      if( Chalk && o.usingColoring )
      data = Chalk.bgYellow( Chalk.black( data ) );
      logger.log( data );
    });

    if( o.child.stderr )
    o.child.stderr.on( 'data', function( data )
    {
      data = 'Error :\n' + _.strIndentation( data,'  ' );
      if( Chalk && o.usingColoring )
      data = Chalk.bgYellow( Chalk.red( data ) );
      logger.log( data );
    });

    o.child.on( 'close', function( errCode )
    {
      debugger;
      if( errCode !== 0 )
      con.error( _.err( 'error code',errCode ) );
      else
      con.give( errCode );
    });

    return con;
  }

})();

shell.defaults =
{
  code : null,
  usingLogging : 1,
  usingFork : 0,
  usingColoring : 1,
}

//

var exec = function( o )
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

var makeFunction = function( o )
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

var execInWorker = function( o )
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

var makeWorker = function( o )
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

// var execAsyn = function( routine,onEnd,context )
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

var execStages = function( stages,o )
{

  // options

  var o = o || {};
  _.assertMapHasOnly( o,execStages.defaults );
  _.mapComplement( o,execStages.defaults );

  if( o.context === null )
  o.context = this;

  // validation

  if( o.onUpdate )
  throw _.err( 'execStages :','onUpdate is deprecated, please use onEach' );

  _.assert( _.objectIs( stages ) || _.arrayLike( stages ),'expects array or object ( stages ), but got',_.strTypeOf( stages ) );

  for( var s in stages )
  {

    if( !stages[ s ] )
    throw _.err( 'execStages :','#'+s,'stage is not defined' );

    var routine = stages[ s ];

    if( !_.routineIs( routine ) )
    routine = stages[ s ].syn || stages[ s ].asyn;

    if( !_.routineIs( routine ) )
    throw _.err( 'execStages :','stage','#'+s,'does not have routine to execute' );

  }

  //  var

  var conEnd = new wConsequence();
  var arrayLike = _.arrayLike( stages );
  var keys = Object.keys( stages );
  var s = 0;

  // begin

  if( _.routineIs( o.onBegin ) )
  {
    o.onBegin = _.routineJoin( o.context,o.onBegin );
  }

  if( o.onBegin )
  wConsequence.give( o.onBegin,o );
  //wConsequence.giveWithContextAndErrorTo( o.onBegin,o.context,null,o );

  // end

  var handleEnd = function( err )
  {

    if( err )
    {
      debugger;
      err = _.errLog( err );
    }

    if( _.routineIs( o.onEnd ) )
    {
      //debugger;
      o.onEnd = _.routineJoin( o.context,o.onEnd );
    }

    if( o.onEnd )
    wConsequence.give( o.onEnd,o );
    //wConsequence.giveWithContextAndErrorTo( o.onEnd,o.context,err,o );

    conEnd._giveWithError( err,null );

  }

  // next

  var handleNext = function( err )
  {

    if( err )
    return handleEnd( err );

    _.timeOut( o.delay,handleStage );

    return true;
  }

  // staging

  var handleStage = function()
  {

    var stage = stages[ keys[ s ] ];
    o.index = s;
    o.key = keys[ s ];
    s += 1;

    if( !stage )
    return handleEnd( null );

    // arguments

    handleNext.staging = 1;
    var routine = stage;
    var args;

    if( !_.routineIs( routine ) )
    {
      routine = stage.syn || stage.asyn;
      if( stage.args )
      args = _.arraySlice( stage.args );
    }

    if( !args )
    args = o.args ? _.arraySlice( o.args ) : [];

    /*args.push( handleNext ); */

    // next

    var handleStageEnd = function( err,ret )
    {

      if( err )
      return handleEnd( _.err( err ) );

      var isSyn = stage.syn || ( o.syn && !stage.asyn );

      if( !isSyn && !( ret instanceof wConsequence ) )
      {
        isSyn = false;
      }
      else if( isSyn && ( ret instanceof wConsequence ) )
      throw _.err( 'Synchronous stage should not return wConsequence' );

      if( !isSyn || ret instanceof wConsequence )
      {
        if( ret instanceof wConsequence )
        ret.thenDo( handleNext );
        else
        handleNext( null );
      }
      else
      {
        handleNext();
      }

    }

    // exec

    try
    {

      var ret;
      if( o.onEach )
      {
        ret = o.onEach.call( o.context,o,stage );
      }

      if( !( ret instanceof wConsequence ) )
      ret = new wConsequence().give( ret );

      if( !o.manual )
      //if( ret instanceof wConsequence )
      ret.thenDo( _.routineJoin( o.context,routine,args ) );
      //else
      //ret = routine.apply( o.context,args );

      ret.thenDo( handleStageEnd );

    }
    catch( err )
    {
      handleEnd( _.err( err ) );
    }

  }

  //

  _.timeOut( o.delay,handleStage );

  return conEnd;
}

execStages.defaults =
{
  syn : 0,
  delay : 1,
  args : [],
  context : null,
  manual : false,
  stages : null,

  onEach : null,
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

  var exec = function()
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
