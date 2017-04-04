( function _Include_s_() {

'use strict';

if( typeof module !== 'undefined' && typeof wBase === 'undefined' )
{

  require( './aKernel.s' );

}

//

var usingSinglePath = 0;
var Self = wTools;
var _ = wTools;

if( typeof module !== 'undefined' )
var Module = require( 'module' );
var __include;
if( typeof require !== 'undefined' )
__include = require;
else if( typeof importScripts !== 'undefined' )
__include = importScripts;

// --
// routines
// --

if( 0 )
if( Module )
{
  var _resolveLookupPathsOriginal = Module._resolveLookupPaths;
  Module._resolveLookupPaths = function( request, parent )
  {
    var debug = 0;
    if( request.indexOf( 'abase/component/ArraySorted.s' ) !== -1 )
    {
      debugger;
      debug = 1;
    }
    var result = _resolveLookupPathsOriginal.apply( this,arguments );
    if( debug )
    console.log( '_resolveLookupPaths',result );
    return result;
  }
}

//

function pathUse( src )
{

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );

  if( _.pathRefine )
  src = _.pathRefine( src );

  // console.log( 'pathUse',src );

  if( typeof module !== 'undefined' )
  module.paths.push( src );

  // Module.globalPaths.push( src );

}

//

function pathUseGlobally( paths )
{

  if( _.strIs( paths ) )
  paths = [ paths ];

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( paths ) );

  if( _.fileProvider && _.pathRefine )
  {
    for( var p = 0 ; p < paths.length ; p++ )
    {
      paths[ p ] = _.fileProvider.pathNativize( _.pathResolve( paths[ p ] ) );
      console.log( 'pathUseGlobally',paths[ p ] );
    }
  }

  return _pathUseGlobally( module,paths,[] );

  // /* patch parents */
  //
  // var parent = module;
  // while( parent )
  // {
  //   [].push.apply( parent.paths,paths );
  //   parent = parent.parent;
  // }
  //
  // /* patch childrens */
  //
  // for( var c = 0 ; c < module.children.length ; c++ )
  // [].push.apply( module.children[ c ].paths,paths );

}

//

function _pathUseGlobally( _module,paths,visited )
{

  _.assert( arguments.length === 3 );
  _.assert( _.arrayIs( paths ) );

  if( visited.indexOf( _module ) !== -1 )
  return;

  [].push.apply( Module.globalPaths, paths );

  /* patch parents */

  while( _module )
  {
    _pathUseGloballyChildren( _module,paths,visited );
    // [].push.apply( _module.paths,paths );
    _module = _module.parent;
  }

}

//

function _pathUseGloballyChildren( _module,paths,visited )
{

  _.assert( arguments.length === 3 );
  _.assert( _.arrayIs( paths ) );

  if( visited.indexOf( _module ) !== -1 )
  return;

  visited.push( _module );
  [].push.apply( _module.paths, paths );

  /* patch parents */

  if( _module.children )
  for( var c = 0 ; c < _module.children.length ; c++ )
  _pathUseGloballyChildren( _module.children[ c ],paths,visited );

}

//

function _includeSimplyAct( src )
{

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ),'include expects string' );

  if( typeof module !== 'undefined' )
  try
  {
    return __include( src );
  }
  catch( err )
  {
    throw err;
    throw _.err( err,'\nLooked at\n',_.toStr( Module.globalPaths,{ levels : 2 } ),'\n',_.toStr( module.paths,{ levels : 2 } ) );
  }
  else
  throw _.err( 'Can make include only on Nodejs.' );

}

//

function _includeAct( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );

  var handler;
  if( _includeHandlerMap[ src ] )
  handler = _includeHandlerMap[ src ];

  if( !handler )
  {
    return _includeSimplyAny( src );
  }

  /* */

  if( handler.isIncluded )
  if( handler.isIncluded() )
  return handler.returned;

  var result;
  if( handler.include )
  result = _includeSimply( handler.include );
  else if( handler.includeAny )
  {
    _.assert( _.arrayIs( handler.includeAny ),'include handler expect an array ( includeAny ) if present' );
    result = _includeSimplyAny.apply( _,handler.includeAny );
  }
  else throw _.err( 'Handler does not has ( include ) neither ( includeAny ).\nCant include',src );

  handler.returned = result;

  return result;
}

//

function _includeSimply( src )
{
  if( arguments.length !== 1 )
  return _includeSimply( arguments );

  if( _.arrayLike( src ) )
  {
    var result = [];
    src = _.arrayFlatten( src );
    for( var a = 0 ; a < src.length ; a++ )
    result[ a ] = _includeSimplyAct( src[ a ] );
    return result;
  }

  return _includeSimplyAct( src );
}

//

function include( src )
{
  if( arguments.length !== 1 )
  return _includeAct( arguments );

  if( _.arrayLike( src ) )
  {
    var result = [];
    src = _.arrayFlatten( src );
    for( var a = 0 ; a < src.length ; a++ )
    result[ a ] = _includeAct( src[ a ] );
    return result;
  }

  return _includeAct( src );
}

//

function _includeSimplyAny( src )
{
  var errors = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( a === arguments.length-1 || usingSinglePath )
    {
      try
      {
        return _includeSimplyAct( src );
      }
      catch( err )
      {
        errors.push( err );
        throw _.err.apply( _,errors );
      }
    }
    else try
    {

      var result = _includeSimplyAct( src );
      return result;

    }
    catch( err )
    {
      // _.errLog( err );
      errors.push( err );
    }

  }

}

//

function includeAny()
{
  var errors = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( a === arguments.length-1 || usingSinglePath )
    {
      try
      {
        if( src !== '' )
        return _includeAct( src );
      }
      catch( err )
      {
        errors.push( err );
        throw _.err.apply( _,errors );
      }
    }
    else try
    {

      var result = _includeAct( src );
      return result;

    }
    catch( err )
    {
      errors.push( err );
    }

  }

  // throw _.err( "Cant find any of required packages :",_.arraySlice( arguments ).join( ',' ) );

}

//

// function includeTestsFrom( path )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.strIs( path ) );
//
//   var files = _.fileProvider.filesFind({ filePath : path, ends : [ '.test.s','.test.ss' ] });
//
//   console.log( 'files',_.entitySelect( files,'*.absolute' ) );
//
//   for( var f = 0 ; f < files.length ; f++ )
//   if( files[ f ].stat.isFile() )
//   require( _.fileProvider.pathNativize( files[ f ].absolute ) );
//
// }

//

var _appArgsInSubjectAndMapFormatResult;
function appArgsInSubjectAndMapFormat( o )
{

  o = _.routineOptions( appArgsInSubjectAndMapFormat,o );

  if( _appArgsInSubjectAndMapFormatResult && o.delimeter === _appArgsInSubjectAndMapFormatResult.delimeter )
  return _appArgsInSubjectAndMapFormatResult;

  var result = _appArgsInSubjectAndMapFormatResult = Object.create( null );

  if( _global_.process )
  {

    result.interpreterPath = process.argv[ 0 ];
    result.mainPath = process.argv[ 1 ];
    result.interpreterArgs = process.execArgv;
    result.delimter = o.delimeter;
    result.map = null;
    result.subject = process.argv[ 2 ];

    var args = process.argv.slice( 2 ).join( ' ' );
    args = args.trim();

    if( !args )
    return result;

    var splitted = _.strSplit({ src : args, delimeter : o.delimeter, stripping : 1 });

    if( splitted.length === 1 )
    {
      result.subject = splitted[ 0 ];
      return result;
    }

    splitted[ 0 ] = _.strCutOffAllLeft( splitted[ 0 ],' ' )[ 1 ];

    result.map = _.strParseMap( splitted );

  }

  return result;
}

appArgsInSubjectAndMapFormat.defaults =
{
  delimeter : ':',
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

function appExit( status )
{
  var result;

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( status === undefined || _.numberIs( status ) );

  if( _global_.process )
  {
    process.exit( status !== undefined ? status : appExitCode() );
  }

  return result;
}

// --
// var
// --

var _includeHandlerMap = {};

_includeHandlerMap[ 'wCopyable' ] =
{
  includeAny : [ '../../abase/mixin/Copyable.s','abase/mixin/Copyable.s','wCopyable' ],
  isIncluded : function(){ return typeof wCopyable !== 'undefined'; },
}

_includeHandlerMap[ 'wInstancing' ] =
{
  includeAny : [ '../../abase/mixin/Instancing.s','abase/mixin/Instancing.s','winstancing' ],
  isIncluded : function(){ return typeof wInstancing !== 'undefined'; },
}

_includeHandlerMap[ 'wEventHandler' ] =
{
  includeAny : [ '../../abase/mixin/EventHandler.s','abase/mixin/EventHandler.s','wEventHandler' ],
  isIncluded : function(){ return typeof wEventHandler !== 'undefined'; },
}

_includeHandlerMap[ 'wTesting' ] =
{
  includeAny : [ '../../abase/xTesting/Testing.debug.s','abase/xTesting/Testing.debug.s','wTesting' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Testing && wTools.Testing._isFullImplementation; },
}

_includeHandlerMap[ 'wLogger' ] =
{
  includeAny : [ '../../abase/printer/printer/Logger.s','abase/printer/printer/Logger.s','wLogger' ],
  isIncluded : function(){ return typeof wLogger !== 'undefined'; },
}

_includeHandlerMap[ 'wLoggerToFile' ] =
{
  includeAny : [ '../../abase/printer/printer/LoggerToFile.s','abase/printer/printer/LoggerToFile.s','wloggertofile' ],
  isIncluded : function(){ return typeof wLoggerToFile !== 'undefined'; },
}

_includeHandlerMap[ 'wLoggerToJstructure' ] =
{
  includeAny : [ '../../abase/printer/printer/LoggerToJstructure.s','abase/printer/printer/LoggerToJstructure.s','wloggertojstructure' ],
  isIncluded : function(){ return typeof wLoggerToJstructure !== 'undefined'; },
}

_includeHandlerMap[ 'wColor' ] =
{
  includeAny : [ '../../amid/color/Color.s','amid/color/Color.s','wColor' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.ColorMap },
}

_includeHandlerMap[ 'wColor256' ] =
{
  includeAny : [ '../../amid/color/Color256.s','amid/color/Color256.s','wColor256' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.ColorMap && Object.keys( wTools.ColorMap ).length > 100 },
}

_includeHandlerMap[ 'wConsequence' ] =
{
  includeAny : [ '../../abase/syn/Consequence.s','abase/syn/Consequence.s','wConsequence' ],
  isIncluded : function(){ return typeof wConsequence !== 'undefined'; },
}

_includeHandlerMap[ 'wNameTools' ] =
{
  includeAny : [ '../../abase/component//NameTools.s','abase/component//NameTools.s','wNameTools' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.idNumber; },
}

_includeHandlerMap[ 'wRegexpObject' ] =
{
  includeAny : [ '../../abase/object/RegexpObject.s','abase/object/RegexpObject.s','wRegexpObject' ],
  isIncluded : function(){ return typeof wRegexpObject !== 'undefined' },
}

_includeHandlerMap[ 'wProto' ] =
{
  includeAny : [ '../../abase/component/Proto.s','abase/component/Proto.s','wProto' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.mixin },
}

_includeHandlerMap[ 'wPath' ] =
{
  includeAny : [ '../../abase/component/Path.s','abase/component/Path.s','wPath' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.pathDir },
}

_includeHandlerMap[ 'wFiles' ] =
{
  includeAny : [ '../../amid/file/FileMid.s','amid/file/FileMid.s','wFiles' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.fileProvider },
}

_includeHandlerMap[ 'wTemplateTree' ] =
{
  includeAny : [ '../../amid/mapping/TemplateTree.s','amid/mapping/TemplateTree.s','wtemplatetree' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.TemplateTree },
}

_includeHandlerMap[ 'wNameMapper' ] =
{
  includeAny : [ '../../amid/mapping/NameMapper.s','amid/mapping/NameMapper.s','wnamemapper' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.NameMapper },
}

_includeHandlerMap[ 'wArraySorted' ] =
{
  includeAny : [ '../../abase/component/ArraySorted.s','abase/component/ArraySorted.s','warraysorted' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.arraySortedLookUp },
}

// --
// prototype
// --

var Proto =
{

  pathUse : pathUse,

  pathUseGlobally : pathUseGlobally,
  _pathUseGlobally : _pathUseGlobally,
  _pathUseGloballyChildren : _pathUseGloballyChildren,

  //

  _includeSimplyAct : _includeSimplyAct,
  _includeAct : _includeAct,

  _includeSimply : _includeSimply,
  include : include,

  _includeSimplyAny : _includeSimplyAny,
  includeAny : includeAny,

  //

  appArgsInSubjectAndMapFormat : appArgsInSubjectAndMapFormat,
  appArgs : appArgsInSubjectAndMapFormat,

  appExitCode : appExitCode,
  appExit : appExit,

}

_.mapExtend( Self, Proto );

})();
