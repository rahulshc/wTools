(function _Setup_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools;

let Self = _global.wTools.setup = _global.wTools.setup || Object.create( null );
_.error = _.error || Object.create( null );
_.process = _.process || Object.create( null );

// --
// setup
// --

function _handleUncaught1()
{

  debugger;
  let args = _.error._handleUncaughtHead( arguments );
  let result = _.error._handleUncaught2.apply( this, args );

  if( _.error._handleUncaught0 )
  _.error._handleUncaught0.apply( this, arguments );

  return result;
}

//

function _handleUncaughtPromise1( err, promise )
{
  let o = Object.create( null );
  o.promise = promise;
  o.err = err;
  o.origination = 'uncaught promise error';
  let result = _.error._handleUncaught2.call( this, o );
  return result;
}

//

// function _handleUncaught2( err, origination )
function _handleUncaught2( o )
{
  return _.error._handleUncaught2Minimal( o );
}

//

// function _handleUncaught2Minimal( err, origination )
function _handleUncaught2Minimal( o )
{
  if( !o.origination )
  o.origination = 'uncaught error';
  o.prefix = `--------------- ${o.origination} --------------->\n`;
  o.postfix = `--------------- ${o.origination} ---------------<\n`;
  let errStr = o.err.toString();

  try
  {
    errStr = o.err.toString();
  }
  catch( err2 )
  {
    debugger;
    console.error( err2 );
  }

  console.error( o.prefix );
  console.error( errStr );
  console.error( '' );
  console.error( `_realGlobal_._setupUncaughtErrorHandlerDone : ${_realGlobal_._setupUncaughtErrorHandlerDone}` );
  console.error( '' );
  console.error( o.err ? o.err.stack : '' );
  console.error( o.postfix );

  processExit();

  /* */

  function processExit()
  {
    try
    {
      if( _global.process )
      {
        if( !process.exitCode )
        process.exitCode = -1;
      }
    }
    catch( err2 )
    {
    }
  }

}

//

function _setupUncaughtErrorHandler2()
{

  if( _realGlobal_._setupUncaughtErrorHandlerDone )
  return;

  _realGlobal_._setupUncaughtErrorHandlerDone = 1;

  if( _realGlobal_.process && typeof _realGlobal_.process.on === 'function' )
  {

    _realGlobal_.process.on( 'uncaughtException', _.error._handleUncaught1 );
    _realGlobal_.process.on( 'unhandledRejection', _.error._handleUncaughtPromise1 );
    _.error._handleUncaughtHead = _handleUncaughtHeadNode;

  }
  else if( Object.hasOwnProperty.call( _realGlobal_, 'onerror' ) )
  {
    _.error._handleUncaught0 = _realGlobal_.onerror;
    _realGlobal_.onerror = _.error._handleUncaught1;
    _.error._handleUncaughtHead = _handleUncaughtHeadBrowser;
  }

  /* */

  function _handleUncaughtHeadBrowser( args )
  {
    debugger;
    let [ message, sourcePath, lineno, colno, error ] = args;
    let err = error || message;
    return [ { err : new Error( args[ 0 ] ), args : args } ];
  }

  /* */

  function _handleUncaughtHeadNode( args )
  {
    return [ { err : args[ 0 ], args : args } ];
  }

  /* */

}

//

function _setup2()
{

  _.error._setupUncaughtErrorHandler2();

}

// --
// extend
// --

let ErrorExtension =
{

  _handleUncaughtHead : null,
  _handleUncaught0 : null,
  _handleUncaught1,
  _handleUncaughtPromise1,
  _handleUncaught2,
  _handleUncaught2Minimal,

  _setupUncaughtErrorHandler2,
  _setup2,

}

let SetupExtension =
{

}

Object.assign( _.error, ErrorExtension );
Object.assign( _.setup, SetupExtension );

_.error._setup2();

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
