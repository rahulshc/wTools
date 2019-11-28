(function _Setup_s_() {

'use strict';

let _global = _global_;
let _realGlobal = _global._realGlobal_
let _ = _global.wTools;
let Self = _global.wTools;;

// --
// setup
// --

//

// function _errUnhandledHandler1( message, sourcePath, lineno, colno, error )
function _errUnhandledHandler1()
{
  // let result;
  //
  // if( Self._handleUnhandledError1 )
  // result = Self._handleUnhandledError1.apply( this, arguments );
  // else
  // result = handleError( new Error( message ) );
  //
  // result = _._errUnhandledHandler2( new Error( message ) );

  let args = _._errUnhandledPre( arguments );
  let result = _._errUnhandledHandler2.apply( this, args );

  if( _._errUnhandledHandler0 )
  _._errUnhandledHandler0.apply( this, arguments );

  return result;
}

//

function _errUnhandledHandler2( err, reason )
{
  if( !reason )
  reason = 'unhandled error';
  let prefix = `--------------- ${reason} --------------->\n`;
  let postfix = `--------------- ${reason} ---------------<\n`;
  let errStr = err.toString();

  try
  {
    errStr = err.toString();
  }
  catch( err2 )
  {
    debugger;
    console.error( err2 );
  }

  console.error( prefix );
  console.error( errStr );
  console.error( err ? err.stack : '' );
  console.error( postfix );
  debugger;

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
    catch( err )
    {
    }
  }

}

//

function _setupUnhandledErrorHandler0()
{

  if( _global._setupUnhandledErrorHandlerDone )
  return;

  _global._setupUnhandledErrorHandlerDone = 1;

  _._errUnhandledHandler1 = _errUnhandledHandler1;
  // let handlerWas = null;
  if( _global.process && typeof _global.process.on === 'function' )
  {
    // handlerWas = _global.process.onUncaughtException;
    // _._errUnhandledHandler0 = _global.process.onUncaughtException;
    // _._errUnhandledHandler1 = _errUnhandledHandler1;
    _global.process.on( 'uncaughtException', _._errUnhandledHandler1 );
    // Self._handleUnhandledError0 = _errHandleNode;
    _._errUnhandledPre = _errPreNode;
    // debugger;
    // if( _global.process.onUncaughtException ) /* xxx qqq : cover that */
    // throw Error( 'not tested' );
  }
  else if( Object.hasOwnProperty.call( _global, 'onerror' ) )
  {
    // handlerWas = _global.onerror;
    _._errUnhandledHandler0 = _global.onerror;
    _global.onerror = _._errUnhandledHandler1;
    // Self._handleUnhandledError0 = _errHandleBrowser;
    _._errUnhandledPre = _errPreBrowser;
  }

  /* */

  // // function _errUnhandledHandler1( message, sourcePath, lineno, colno, error )
  // function _errUnhandledHandler1()
  // {
  //   let result;
  //
  //   // if( Self._handleUnhandledError1 )
  //   // result = Self._handleUnhandledError1.apply( this, arguments );
  //   // else
  //   // result = handleError( new Error( message ) );
  //   //
  //   // result = _._errUnhandledHandler2( new Error( message ) );
  //
  //   _._errUnhandledPre( arguments );
  //
  //   if( handlerWas )
  //   handlerWas.apply( this, arguments );
  //
  //   return result;
  // }

  // /* */
  //
  // function _errHandleNode0( err )
  // {
  //   let result;
  //
  //   // if( Self._handleUnhandledError1 )
  //   // result = Self._handleUnhandledError1.apply( this, arguments );
  //   // else
  //   // result = handleError( err );
  //   //
  //   // result = _._errUnhandledHandler2( err );
  //   //
  //   // if( handlerWas )
  //   // handlerWas.apply( this, arguments );
  //   //
  //   // if( processExit )
  //   // processExit( -1 );
  //
  //   _._errUnhandledHandler1.apply( this, arguments );
  //
  //   if( Self._handleUnhandledError1 )
  //   return result;
  // }

  /* */

  function _errPreBrowser( args )
  {
    return [ new Error( args[ 0 ] ) ];
    // let result;
    //
    // // if( Self._handleUnhandledError1 )
    // // result = Self._handleUnhandledError1.apply( this, arguments );
    // // else
    // // result = handleError( new Error( message ) );
    //
    // result = _._errUnhandledHandler2( new Error( message ) );
    //
    // // if( handlerWas )
    // // handlerWas.apply( this, arguments );
    //
    // return result;
  }

  /* */

  function _errPreNode( args )
  {
    return args;
    // let result;
    //
    // // if( Self._handleUnhandledError1 )
    // // result = Self._handleUnhandledError1.apply( this, arguments );
    // // else
    // // result = handleError( err );
    //
    // result = _._errUnhandledHandler2( err );
    //
    // // if( handlerWas )
    // // handlerWas.apply( this, arguments );
    //
    // // if( processExit )
    // // processExit( -1 );
    //
    // // if( Self._handleUnhandledError1 )
    // // return result;
    //
    // return result;
  }

  /* */

}

//

function _setup0()
{

  _setupUnhandledErrorHandler0();

}

// --
// extend
// --

let Fields =
{

  _setupUnhandledErrorHandlerDone : 0,

}

let Routines =
{

  // _handleUnhandledError0 : null,
  // _handleUnhandledError1 : null,
  _errUnhandledPre : null,
  _errUnhandledHandler0 : null,
  _errUnhandledHandler1,
  _errUnhandledHandler2,
  _setupUnhandledErrorHandler0,
  _setup0,

}

Object.assign( Self, Fields );
Object.assign( Self, Routines );

Self._setup0();

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
