(function _Diagnostics_s_() {

'use strict';

var _global = _global_;
var _ = _global_.wTools;
var Self = _global_.wTools;

// --
// setup
// --

function _setupConfig()
{

  if( _global.WTOOLS_PRIVATE )
  return;

  // debugger;

  /* config */

  if( !_global.Config )
  _global.Config = Object.create( null );

  if( _global.Config.debug === undefined )
  _global.Config.debug = true;

  _global.Config.debug = !!_global.Config.debug;

}

//

function _setupUnhandledErrorHandler()
{

  if( _global._setupUnhandledErrorHandlerDone )
  return;

  _global._setupUnhandledErrorHandlerDone = true;

  var handlerWas = null;

  if( _global.process && _.routineIs( _global.process.on ) )
  {
    _global.process.on( 'uncaughtException', handleError );
  }
  else if( Object.hasOwnProperty.call( _global_,'onerror' ) )
  {
    handlerWas = _global_.onerror;
    _global_.onerror = handleBrowserError;
  }

  /**/

  function handleBrowserError( message, source, lineno, colno, error )
  {
    debugger;
    var err = _._err
    ({
      args : [ message , error ],
      level : 1,
      sourceCode : source,
      location :
      {
        line : lineno,
        col : colno,
      },
    });


    handleError( err );

    handlerWas.call( this, message, source, lineno, colno, error );
  }

  /* */

  function handleError( err )
  {

    console.error( '------------------------------- unhandled errorr -------------------------------' );

    try
    {

      if( _.appExitCode )
      _.appExitCode( -1 )

      // console.log( err.message );

      if( !err.originalMessage )
      {
        if( _.objectLike( err ) )
        {
          if( _.toStr && _.field )
          console.error( _.toStr.fields( err,{ errorAsMap : 1 } ) );
          else
          console.error( err );
        }
        debugger;
        if( _.errLog )
        _.errLog( 'Uncaught exception :\n',err );
        else
        console.log( 'Uncaught exception :\n',err );
      }
      else
      {
        if( _.errLog )
        _.errLog( 'Uncaught exception :\n',err );
        else
        console.log( 'Uncaught exception :\n',err );
      }

    }
    catch( nerr )
    {
      debugger;
      console.log( err );
    }

    console.error( '------------------------------- unhandled errorr -------------------------------' );
    debugger;

  }

}

//

function _setupLoggerPlaceholder()
{

  if( !_global_.console.debug )
  _global_.console.debug = function debug()
  {
    this.log.apply( this,arguments );
  }

  if( !_global_.logger )
  _global_.logger =
  {
    log : function log() { console.log.apply( console,arguments ); },
    logUp : function logUp() { console.log.apply( console,arguments ); },
    logDown : function logDown() { console.log.apply( console,arguments ); },
    error : function error() { console.error.apply( console,arguments ); },
    errorUp :  function errorUp() { console.error.apply( console,arguments ); },
    errorDown : function errorDown() { console.error.apply( console,arguments ); },
  }

}

//

function _setupTesterPlaceholder()
{

  if( !_global_.wTestSuit )
  _global_.wTestSuit = function wTestSuit( testSuit )
  {

    if( !_globalReal_.wTests )
    _globalReal_.wTests = Object.create( null );

    if( !testSuit.suitFilePath )
    testSuit.suitFilePath = _.diagnosticLocation( 1 ).path;

    if( !testSuit.suitFileLocation )
    testSuit.suitFileLocation = _.diagnosticLocation( 1 ).full;

    _.assert( _.strIsNotEmpty( testSuit.suitFileLocation ),'Test suit expects a mandatory option ( suitFileLocation )' );
    _.assert( _.objectIs( testSuit ) );

    // if( testSuit.name === 'Chaining test' )
    // debugger;

    if( !testSuit.abstract )
    _.assert( !_globalReal_.wTests[ testSuit.name ],'Test suit with name "' + testSuit.name + '" already registered!' );
    _globalReal_.wTests[ testSuit.name ] = testSuit;

    testSuit.inherit = function inherit()
    {
      this.inherit = _.arraySlice( arguments );
    }

    return testSuit;
  }

  /* */

  if( !_.Tester )
  {
    _.Tester = Object.create( null );
    _.Tester.test = function test( testSuitName )
    {
      if( _.workerIs() )
      return;
      _.assert( arguments.length === 0 || arguments.length === 1 );
      _.assert( _.strIs( testSuitName ) || testSuitName === undefined,'test : expects string ( testSuitName )' );
      _.timeReady( function()
      {
        if( _.Tester.test === test )
        throw _.err( 'Cant wTesting.test, missing wTesting package' );
        _.Tester.test.call( _.Tester,testSuitName );
      });
    }
  }

}

//

function _setup()
{

  Self.timeNow = Self._timeNow_functor();
  Self._sourcePath = _.diagnosticStack( 1 );

  _.assert( Self.timeNow );

  if( _global_._wToolsInitConfigExpected !== false )
  {
    _._setupConfig();
    _._setupUnhandledErrorHandler();
    _._setupLoggerPlaceholder();
    _._setupTesterPlaceholder();
  }

}

// --
// prototype
// --

var Proto =
{

  _setupConfig : _setupConfig,
  _setupUnhandledErrorHandler : _setupUnhandledErrorHandler,

  _setupLoggerPlaceholder : _setupLoggerPlaceholder,
  _setupTesterPlaceholder : _setupTesterPlaceholder,

  _setup : _setup,

}

Object.assign( Self,Proto );
Self._setup();

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
