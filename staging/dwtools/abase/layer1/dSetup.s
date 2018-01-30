(function _Diagnostics_s_() {

'use strict';

var _ = _global_.wTools;
var Self = _global_.wTools;

// --
// setup
// --

function _setupConfig()
{

  if( _global_._UsingWtoolsPrivately_ )
  return;

  // debugger;

  /* config */

  if( !_global_.Config )
  _global_.Config = Object.create( null );

  if( _global_.Config.debug === undefined )
  _global_.Config.debug = true;

  // Object.defineProperty( _global_, 'Config',
  // {
  //   value : _global_.Config,
  //   enumerable : true,
  //   writable : false,
  // });
  //
  // Object.defineProperty( _global_.Config, 'debug',
  // {
  //   value : !!_global_.Config.debug,
  //   enumerable : true,
  //   writable : false,
  // });
  //
  // Object.defineProperty( _global_, 'DEBUG',
  // {
  //   value : _global_.Config.debug,
  //   enumerable : true,
  //   writable : false,
  // });

  _global_.Config.debug = !!_global_.Config.debug;

  // _global_.DEBUG = _global_.Config.debug;
  // debugger;

}

//

function _setupUnhandledErrorHandler()
{

  // console.log( '_setupUnhandledErrorHandler' );

  if( _global_._setupUnhandledErrorHandlerDone )
  return;

  _global_._setupUnhandledErrorHandlerDone = true;

  if( typeof process !== 'undefined' && _.routineIs( process.on ) )
  process.on( 'uncaughtException', function( err )
  {

    console.error( '------------------------------- unhandled errorr -------------------------------' );

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
      if( _.nameUnfielded )
      _.errLog( 'Uncaught exception :',err );
      else
      console.log( 'Uncaught exception :',err );
    }
    else
    {
      if( _.nameUnfielded )
      _.errLog( 'Uncaught exception :',err );
      else
      console.log( 'Uncaught exception :',err );
    }

    console.error( '------------------------------- unhandled errorr -------------------------------' );
    debugger;

    if( _global_.process && !process.exitCode )
    process.exitCode = -1;
  });

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
    log : _.routineJoin( console,console.log ),
    logUp : _.routineJoin( console,console.log ),
    logDown : _.routineJoin( console,console.log ),
    error : _.routineJoin( console,console.error ),
    errorUp : _.routineJoin( console,console.error ),
    errorDown : _.routineJoin( console,console.error ),
  }

}

//

function _setupTesterPlaceholder()
{

  if( !_global_.wTestSuite )
  _global_.wTestSuite = function wTestSuite( testSuite )
  {

    if( !_globalReal_.wTests )
    _globalReal_.wTests = Object.create( null );

    if( !testSuite.suiteFilePath )
    testSuite.suiteFilePath = _.diagnosticLocation( 1 ).path;

    if( !testSuite.suiteFileLocation )
    testSuite.suiteFileLocation = _.diagnosticLocation( 1 ).full;

    _.assert( _.strIsNotEmpty( testSuite.suiteFileLocation ),'Test suite expects a mandatory option ( suiteFileLocation )' );
    _.assert( _.objectIs( testSuite ) );

    // if( testSuite.name === 'Chaining test' )
    // debugger;

    if( !testSuite.abstract )
    _.assert( !_globalReal_.wTests[ testSuite.name ],'Test suite with name "' + testSuite.name + '" already registered!' );
    _globalReal_.wTests[ testSuite.name ] = testSuite;

    testSuite.inherit = function inherit()
    {
      this.inherit = _.arraySlice( arguments );
    }

    return testSuite;
  }

  /* */

  if( !_.Tester )
  {
    _.Tester = Object.create( null );
    _.Tester.test = function test( testSuiteName )
    {
      if( _.workerIs() )
      return;
      _.assert( arguments.length === 0 || arguments.length === 1 );
      _.assert( _.strIs( testSuiteName ) || testSuiteName === undefined,'test : expects string ( testSuiteName )' );
      _.timeReady( function()
      {
        if( _.Tester.test === test )
        throw _.err( 'Cant wTesting.test, missing wTesting package' );
        _.Tester.test.call( _.Tester,testSuiteName );
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
if( _global_._UsingWtoolsPrivately_ )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
