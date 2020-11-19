( function _fErr_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.error;

// --
// implementation
// --

function _handleUncaught2( o )
{

  let process0 = processNamespaceGet();

  optionsRefine();

  /* xxx qqq : resolve issue in browser
    if file has syntax error then unachught error should not ( probably ) be throwen
    because browser thows uncontrolled information about syntax error after that
    avoid duplication of errors in log
  */

  o.err = errRefine( o.err );

  processUncaughtErrorEvent();

  if( _.errIsAttended( o.err ) )
  return;

  debugger;
  consoleUnbar();

  console.error( o.prefix );

  errLogFields();
  errLog();

  console.error( o.postfix );

  processExit();

  /* */

  function optionsRefine()
  {

    if( !o.origination )
    o.origination = 'uncaught error';

    // for( let k in o )
    // if( _handleUncaught2.defaults[ k ] !== undefined )
    // {
    //   console.error( `Routine::_handleUncaught2() does not expect option::${k}` );
    // }

    o.prefix = `--------------- ${o.origination} --------------->\n`;
    o.postfix = `--------------- ${o.origination} ---------------<\n`;
    o.logger = _global.logger || _global.console;

  }

  /* */

  function consoleUnbar()
  {
    let Logger = loggerClassGet();
    try
    {
      if( Logger && Logger.ConsoleBar && Logger.ConsoleIsBarred( console ) )
      Logger.ConsoleBar({ on : 0 });
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }
  }

  /* */

  function errLog()
  {
    try
    {
      if( _._errLog )
      _._errLog( o.err, o.logger );
      else
      console.error( o.err );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
      console.error( o.err );
    }
  }

  /* */

  function errLogFields()
  {
    if( !o.err.originalMessage && _.objectLike && _.objectLike( o.err ) )
    try
    {
      let serr = _.toStr && _.field ? _.toStr.fields( o.err, { errorAsMap : 1 } ) : o.err;
      o.logger.error( serr );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }
  }

  /* */

  function errRefine( err )
  {
    try
    {
      return _.errProcess( err );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }
  }

  /* */

  function processNamespaceGet()
  {
    let result;
    if( !result && _.process && _.process.exitReason )
    result = _.process;
    if( !result && _realGlobal_ && _realGlobal_.wTools && _realGlobal_.wTools.process && _realGlobal_.wTools.process.exitReason )
    result = _realGlobal_.wTools.process;
    // xxx : use _globals_
    if( !result && _realGlobal_._globals_.testing && _globals_.testing.wTools && _globals_.testing.wTools.process && _globals_.testing.wTools.process.exitReason )
    result = _globals_.testing.wTools.process;
    if( !result )
    result = _.process;
    return result;
  }

  /* */

  function loggerClassGet()
  {
    let result;
    if( !result && _.Logger && _.Logger.ConsoleBar )
    result = _.Logger;
    if( !result && _realGlobal_ && _realGlobal_.wTools && _realGlobal_.wTools.Logger && _realGlobal_.wTools.Logger.ConsoleBar )
    result = _realGlobal_.wTools.Logger;
    // xxx : use _globals_
    if( !result && _realGlobal_._globals_.testing && _globals_.testing.wTools && _globals_.testing.wTools.Logger && _globals_.testing.wTools.Logger.ConsoleBar )
    result = _globals_.testing.wTools.Logger;
    return result;
  }

  /* */

  function processUncaughtErrorEvent()
  {
    try
    {
      // if( process0.eventGive ) /* xxx : cover in starter not catching uncaught error */
      if( process0 && process0.eventGive )
      process0.eventGive({ event : 'uncaughtError', args : [ o ] });
      for( let g in _realGlobal_._globals_ )
      {
        let _global = _realGlobal_._globals_[ g ];
        if( _global.wTools && _global.wTools.process && _global.wTools.process.eventGive )
        if( _global.wTools.process !== process0 )
        _global.wTools.process.eventGive({ event : 'uncaughtError', args : [ o ] });
      }
    }
    catch( err2 )
    {
      debugger;
      console.log( err2 );
      exitError( err2, false );
    }
  }

  /* */

  function exitError( err, rewriting )
  {
    let set = false;
    debugger;
    if( process0 && process0.exit )
    try
    {
      process0.exitCode( -1 );
      // if( rewriting || !process0.exitReason() )
      if( !process0.exitReason() )
      process0.exitReason( err );
      set = true;
    }
    catch( err2 )
    {
      debugger;
      console.log( err2 );
    }
    if( !set )
    try
    {
      if( _global.process )
      {
        if( !process.exitCode )
        process.exitCode = -1;
        set = true;
      }
    }
    catch( err2 )
    {
    }
  }

  /* */

  function processExit()
  {
    exitError( o.err, true );
    if( process0 && process0.exit )
    try
    {
      process0.exit();
    }
    catch( err2 )
    {
      debugger;
      console.log( err2 );
      exitError( o.err, false );
    }
    try
    {
      if( _global.process )
      process.exit();
    }
    catch( err2 )
    {
    }
  }

}

_handleUncaught2.defaults =
{
  err : null,
  origination : null,
}

//

function _handleUncaughtAsync( err )
{

  if( _.errIsAttended( err ) )
  return err;

  _.errWary( err, 1 );

  if( _.errIsSuspended( err ) )
  return err;

  let timer = _.time._finally( _.error.uncaughtDelayTime, function uncaught()
  {

    if( _.errIsAttended( err ) )
    return;

    if( _.errIsSuspended( err ) )
    return;

    // if( !_.time.timerInCancelBegun( timer ) && _.errIsSuspended( err ) ) /* yyy */
    // return;

    _.error._handleUncaught2({ err, origination : 'uncaught asynchronous error' });

  });

  return err;
}

//

function _setupUncaughtErrorHandler9()
{

  if( !_realGlobal_._setupUncaughtErrorHandlerDone )
  {
    debugger;
    throw Error( 'setup0 should be called first' );
  }

  if( _realGlobal_._setupUncaughtErrorHandlerDone > 1 )
  return;

  _realGlobal_._setupUncaughtErrorHandlerDone = 2;

  /* */

  if( _global.process && _.routineIs( _global.process.on ) )
  {
    _.error._handleUncaughtHead = _errHeadNode;
  }
  else if( Object.hasOwnProperty.call( _global, 'onerror' ) )
  {
    _.error._handleUncaughtHead = _errHeadBrowser;
  }

  /* */

  function _errHeadBrowser( args )
  {
    let [ message, sourcePath, lineno, colno, error ] = args;
    let err = error || message;

    if( _._err )
    err = _._err
    ({
      args : [ error || message ],
      level : 1,
      fallBackStack : 'at handleError @ ' + sourcePath + ':' + lineno,
      throwLocation :
      {
        filePath : sourcePath,
        line : lineno,
        col : colno,
      },
    });

    return [ { err, args } ];
    // return [ err ];
  }

  /* */

  function _errHeadNode( args )
  {
    return [ { err : args[ 0 ], args } ];
    // return [ args[ 0 ] ];
  }

  /* */

}

//

function error_functor( name, onErrorMake )
{

  if( _.strIs( onErrorMake ) || _.arrayIs( onErrorMake ) )
  {
    let prepend = onErrorMake;
    onErrorMake = function onErrorMake()
    {
      debugger;
      let arg = _.arrayAppendArrays( [], [ prepend, arguments ] );
      return args;
    }
  }
  else if( !onErrorMake )
  {
    onErrorMake = function onErrorMake()
    {
      return arguments;
    }
  }

  let Error =
  {
    [ name ] : function()
    {
      if( !( this instanceof ErrorConstructor ) )
      {
        let err1 = new ErrorConstructor();
        let args1 = onErrorMake.apply( err1, arguments );
        _.assert( _.arrayLike( args1 ) );
        let args2 = _.arrayAppendArrays( [], [ [ err1, ( args1.length ? '\n' : '' ) ], args1 ] );
        let err2 = _._err({ args : args2, level : 2 });

        _.assert( err1 === err2 );
        _.assert( err2 instanceof _global.Error );
        _.assert( err2 instanceof ErrorConstructor );

        return err2;
      }
      else
      {
        _.assert( arguments.length === 0, 'Expects no arguments' );
        return this;
      }
    }
  }

  let ErrorConstructor = Error[ name ];

  _.assert( ErrorConstructor.name === name, 'Looks like your interpreter does not support dynamice naming of functions. Please use ES2015 or later interpreter.' );

  ErrorConstructor.prototype = Object.create( _global.Error.prototype );
  ErrorConstructor.prototype.constructor = ErrorConstructor;
  // ErrorConstructor.constructor = ErrorConstructor;

  return ErrorConstructor;
}

// --
// extension
// --

let Extension =
{

  _handleUncaught2,
  _handleUncaughtAsync,
  _setupUncaughtErrorHandler9,

  error_functor,

  uncaughtDelayTime : 100,

}

//

_.mapExtend( _.error, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
