( function _Include_s_() {

'use strict';

if( typeof module !== 'undefined' && typeof wBase === 'undefined' )
{

  require( './aFundamental.s' );

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
else if( _global_._remoteRequire )
__include = _global_._remoteRequire;

// --
// routines
// --

// if( 0 )
// if( Module )
// {
//   var _resolveLookupPathsOriginal = Module._resolveLookupPaths;
//   Module._resolveLookupPaths = function( request, parent )
//   {
//     var debug = 0;
//     if( request.indexOf( 'abase/layer3/ArraySorted.s' ) !== -1 )
//     {
//       debugger;
//       debug = 1;
//     }
//     var result = _resolveLookupPathsOriginal.apply( this,arguments );
//     if( debug )
//     console.log( '_resolveLookupPaths',result );
//     return result;
//   }
// }

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

function _includeWithRequireAct( src )
{

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ),'include expects string' );

  /* console.log( '_includeWithRequireAct', '"' + src + '"' ); */

  if( typeof module !== 'undefined' )
  try
  {
    return __include( src );
  }
  catch( err )
  {
    debugger;
    // throw err;
    throw _.err( err,'\n','Cant require',src );
    // throw _.err( err,'\nLooked at\n',_.toStr( Module.globalPaths,{ levels : 2 } ),'\n',_.toStr( module.paths,{ levels : 2 } ) );
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
    return _includeWithRequireAny( src );
  }

  /* */

  if( handler.isIncluded )
  if( handler.isIncluded() )
  return handler.returned;

  var result;
  if( handler.include )
  result = _includeWithRequire( handler.include );
  else if( handler.includeAny )
  {
    _.assert( _.arrayIs( handler.includeAny ),'include handler expect an array ( includeAny ) if present' );
    result = _includeWithRequireAny.apply( _,handler.includeAny );
  }
  else throw _.err( 'Handler does not has ( include ) neither ( includeAny ).\nCant use the handler to include file',src );

  handler.returned = result;

  return result;
}

//

function _includeWithRequire( src )
{
  if( arguments.length !== 1 )
  return _includeWithRequire( arguments );

  if( _.arrayLike( src ) )
  {
    var result = [];
    src = _.arrayFlatten( [], src );
    for( var a = 0 ; a < src.length ; a++ )
    result[ a ] = _includeWithRequireAct( src[ a ] );
    return result;
  }

  return _includeWithRequireAct( src );
}

//

function include( src )
{
  if( arguments.length !== 1 )
  return _includeAct( arguments );

  if( _.arrayLike( src ) )
  {
    var result = [];
    src = _.arrayFlatten( [], src );
    for( var a = 0 ; a < src.length ; a++ )
    result[ a ] = _includeAct( src[ a ] );
    return result;
  }

  return _includeAct( src );
}

//

function _includeWithRequireAny( src )
{
  var errors = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    try
    {
      var resolved = __include.resolve( src );
      // console.log( '__include.resolve',src,'->',resolved );
    }
    catch( err )
    {
      // console.log( 'not found',src,'trying',arguments[ a+1 ] );
      /* console.log( err ); */
      if( a !== arguments.length-1 && !usingSinglePath )
      continue;
    }

    if( a === arguments.length-1 && src === '' )
    return;

    // if( a === arguments.length-1 || usingSinglePath )
    // {
    //   try
    //   {
    //     return _includeWithRequireAct( src );
    //   }
    //   catch( err )
    //   {
    //     errors.push( err );
    //     throw _.err.apply( _,errors );
    //   }
    // }
    // else try
    {

      var result = _includeWithRequireAct( src );
      return result;

    }
    // catch( err )
    // {
    //   errors.push( err );
    // }

  }

  _.assert( 0,'unexpected' );
}

//

function includeAny()
{
  var errors = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    try
    {
      var resolved = __include.resolve( src );
      // console.log( '__include.resolve',src,'->',resolved );
    }
    catch( err )
    {
      // console.log( 'not found',src,'trying',arguments[ a+1 ] );
      /* console.log( err ); */
      if( a !== arguments.length-1 && !usingSinglePath )
      continue;
    }

    if( a === arguments.length-1 && src === '' )
    return;

    // if( a === arguments.length-1 || usingSinglePath )
    // {
    //   try
    //   {
    //     if( src !== '' )
    //     return _includeAct( src );
    //   }
    //   catch( err )
    //   {
    //     errors.push( err );
    //     throw _.err.apply( _,errors );
    //   }
    // }
    // else try
    {

      var result = _includeAct( src );
      return result;

    }
    // catch( err )
    // {
    //   errors.push( err );
    // }

  }

  // throw _.err( "Cant find any of required packages :",_.arraySlice( arguments ).join( ',' ) );

  _.assert( 0,'unexpected' );
}

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
  includeAny : [ '../../abase/xtester/cTester.debug.s','abase/xtester/cTester.debug.s','wTesting' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Tester && wTools.Tester._isFullImplementation; },
}

_includeHandlerMap[ 'wLogger' ] =
{
  includeAny : [ '../../abase/oclass/printer/top/Logger.s','abase/oclass/printer/top/Logger.s','wLogger' ],
  isIncluded : function(){ return typeof wLogger !== 'undefined'; },
}

_includeHandlerMap[ 'wPrinterToFile' ] =
{
  includeAny : [ '../../abase/oclass/printer/top/ToFile.ss','abase/oclass/printer/top/ToFile.ss','wloggertofile' ],
  isIncluded : function(){ debugger; return typeof wPrinterToFile !== 'undefined'; },
}

_includeHandlerMap[ 'wPrinterToJstructure' ] =
{
  includeAny : [ '../../abase/oclass/printer/top/ToJstructure.s','abase/oclass/printer/top/ToJstructure.s','wloggertojstructure' ],
  isIncluded : function(){ return typeof wPrinterToJstructure !== 'undefined'; },
}

_includeHandlerMap[ 'wConsequence' ] =
{
  includeAny : [ '../../abase/oclass/Consequence.s','abase/oclass/Consequence.s','wConsequence' ],
  isIncluded : function(){ return typeof wConsequence !== 'undefined'; },
}

_includeHandlerMap[ 'wConsequizer' ] =
{
  includeAny : [ '../../abase/mixin/Consequizer.s','abase/mixin/Consequizer.','wconsequizer' ],
  isIncluded : function(){ return typeof wConsequizer !== 'undefined'; },
}

_includeHandlerMap[ 'wNameTools' ] =
{
  includeAny : [ '../../abase/layer3//NameTools.s','abase/layer3//NameTools.s','wNameTools' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.idWithInt; },
}

_includeHandlerMap[ 'wRegexpObject' ] =
{
  includeAny : [ '../../abase/oclass/RegexpObject.s','abase/oclass/RegexpObject.s','wRegexpObject' ],
  isIncluded : function(){ return typeof wRegexpObject !== 'undefined' },
}

_includeHandlerMap[ 'wProto' ] =
{
  includeAny : [ '../../abase/layer3/Proto.s','abase/layer3/Proto.s','wProto' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.mixin },
}

_includeHandlerMap[ 'wCloner' ] =
{
  includeAny : [ '../../abase/layer3/Cloner.s','abase/layer3/Cloner.s','wcloner' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools._clone },
}

_includeHandlerMap[ 'wPath' ] =
{
  includeAny : [ '../../abase/layer3/PathTools.s','abase/layer3/PathTools.s','wPath' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.pathDir },
}

_includeHandlerMap[ 'wArraySorted' ] =
{
  includeAny : [ '../../abase/layer3/ArraySorted.s','abase/layer3/ArraySorted.s','warraysorted' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.arraySortedLookUp },
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

_includeHandlerMap[ 'wFiles' ] =
{
  includeAny : [ '../../amid/file/FileTop.s','amid/file/FileTop.s','wFiles' ],
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

_includeHandlerMap[ 'wGraph' ] =
{
  includeAny : [ '../../amid/agraph/Graph.s','amid/agraph/Graph.s','wGraph' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.graph },
}

_includeHandlerMap[ 'wSchema' ] =
{
  includeAny : [ '../../amid/schema/SchemaSystem.s','amid/schema/SchemaSystem.s','wSchema' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.SchemaSystem },
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

  _includeWithRequireAct : _includeWithRequireAct,
  _includeAct : _includeAct,

  _includeWithRequire : _includeWithRequire,
  include : include,

  _includeWithRequireAny : _includeWithRequireAny,
  includeAny : includeAny,

  //

  appArgsInSubjectAndMapFormat : appArgsInSubjectAndMapFormat,
  appArgs : appArgsInSubjectAndMapFormat,

  appAnchor : appAnchor,

  appExitCode : appExitCode,
  appExit : appExit,
  appExitWithBeep : appExitWithBeep,

}

_.mapExtend( Self, Proto );

if( typeof __dirname !== 'undefined' )
_.pathUse( __dirname + '/../..' );

})();
