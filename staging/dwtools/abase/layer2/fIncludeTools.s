( function _Include_s_() {

'use strict';

//

var usingSinglePath = 0;
var Self = _global_.wTools;
var _ = _global_.wTools;
var _global = _global_;

var Module = null;
var __include;
if( typeof require !== 'undefined' )
__include = require;
else if( typeof importScripts !== 'undefined' )
__include = importScripts;
else if( _global._remoteRequire )
__include = _global._remoteRequire;

// --
// routines
// --

function pathUse( src )
{

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );

  if( _.pathRefine )
  src = _.pathRefine( src );

  if( typeof module !== 'undefined' )
  module.paths.push( src );

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

  if( !Module )
  Module = require( 'module' );

  [].push.apply( Module.globalPaths, paths );

  /* patch parents */

  while( _module )
  {
    _pathUseGloballyChildren( _module,paths,visited );
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
    throw _.err( err,'\n','Cant require',src );
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
  {
    result = _includeWithRequire( handler.include );
  }
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

function _includeAnyAct( srcs )
{
  _.assert( arguments.length === 1 );
  _.assert( _.arrayLike( srcs ) );

  /* */

  var paths = [];
  for( var s = 0 ; s < srcs.length ; s++ )
  {
    var src = srcs[ s ];
    var handler = _includeHandlerMap[ src ];

    if( !handler )
    {
      paths.push({ path : src });
      continue;
    }

    if( handler.isIncluded )
    if( handler.isIncluded() )
    return handler.returned;

    var result;
    if( handler.include )
    {
      paths.push({ path : handler.include, handler : handler }); debugger;
    }
    else if( handler.includeAny )
    {
      _.assert( _.arrayIs( handler.includeAny ),'include handler expect an array ( includeAny ) if present' );
      for( var p = 0 ; p < handler.includeAny.length ; p++ )
      paths.push({ path : handler.includeAny[ p ], handler : handler });
    }
    else throw _.err( 'Handler does not has ( include ) neither ( includeAny ).\nCant use the handler to include file',src );

  }

  /* */

  for( var a = 0 ; a < paths.length ; a++ )
  {
    var src = paths[ a ].path;

    if( src !== '' )
    try
    {
      var resolved = __include.resolve( src );
      src = resolved;
    }
    catch( err )
    {
      if( a !== paths.length-1 && !usingSinglePath )
      continue;
    }

    if( a === paths.length-1 && src === '' )
    return;

    var result = _includeWithRequireAct( src );
    if( paths[ a ].handler )
    paths[ a ].handler.returned = result;
    return result;
  }

  /* */

  debugger;
  throw _.err( 'Can include none of file',srcs );
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

    if( src !== '' )
    try
    {
      var resolved = __include.resolve( src );
      /* console.log( '__include.resolve',src,'->',resolved ); */
      src = resolved;
    }
    catch( err )
    {
      if( a !== arguments.length-1 && !usingSinglePath )
      continue;
    }

    if( a === arguments.length-1 && src === '' )
    return;

    var result = _includeWithRequireAct( src );
    return result;

  }

  _.assert( 0,'unexpected' );
}

//

function includeAny()
{
  return _includeAnyAct( arguments );
}

//

function isIncluded( src )
{

  var handler;
  if( _includeHandlerMap[ src ] )
  handler = _includeHandlerMap[ src ];

  if( !handler )
  return false;

  if( !handler.isIncluded )
  return false;

  return handler.isIncluded();
}

// --
// include map
// --

var _includeHandlerMap = {};

_includeHandlerMap[ 'wTesting' ] =
{
  includeAny : [ '../../abase/xtester/aBase.debug.s','abase/xtester/aBase.debug.s','wTesting' ],
  isIncluded : function(){ return /*typeof _globalReal_ !== 'undefined' &&*/ _globalReal_.wTester && _globalReal_.wTester._isFullImplementation; },
}

_includeHandlerMap[ 'wLogger' ] =
{
  includeAny : [ '../../abase/printer/top/Logger.s','abase/printer/top/Logger.s','wLogger' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Logger; },
}

_includeHandlerMap[ 'wPrinterToFile' ] =
{
  includeAny : [ '../../abase/printer/top/ToFile.ss','abase/printer/top/ToFile.ss','wloggertofile' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.PrinterToFile; },
}

_includeHandlerMap[ 'wPrinterToJs' ] =
{
  includeAny : [ '../../abase/printer/top/ToJstructure.s','abase/printer/top/ToJstructure.s','wloggertojstructure' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.PrinterToJs; },
}

_includeHandlerMap[ 'wConsequence' ] =
{
  includeAny : [ '../../abase/oclass/Consequence.s','abase/oclass/Consequence.s','wConsequence' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Consequence; },
}

_includeHandlerMap[ 'wConsequizer' ] =
{
  includeAny : [ '../../abase/mixin/Consequizer.s','abase/mixin/Consequizer.','wconsequizer' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Consequizer; },
}

_includeHandlerMap[ 'wCopyable' ] =
{
  includeAny : [ '../../abase/mixin/Copyable.s','abase/mixin/Copyable.s','wCopyable' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Copyable; },
}

_includeHandlerMap[ 'wInstancing' ] =
{
  includeAny : [ '../../abase/mixin/Instancing.s','abase/mixin/Instancing.s','winstancing' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Instancing; },
}

_includeHandlerMap[ 'wEventHandler' ] =
{
  includeAny : [ '../../abase/mixin/EventHandler.s','abase/mixin/EventHandler.s','wEventHandler' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.EventHandler; },
}

_includeHandlerMap[ 'wFieldsStack' ] =
{
  includeAny : [ '../../abase/mixin/FieldsStack.s','abase/mixin/FieldsStack.s','wfieldsstack' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.FieldsStack; },
}

_includeHandlerMap[ 'wNameTools' ] =
{
  includeAny : [ '../../abase/layer3//NameTools.s','abase/layer3//NameTools.s','wNameTools' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.idWithInt; },
}

_includeHandlerMap[ 'wProto' ] =
{
  includeAny : [ '../../abase/layer3/Proto.s','abase/layer3/Proto.s','wProto' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.mixinMake },
}

_includeHandlerMap[ 'wTraverser' ] =
{
  includeAny : [ '../../abase/layer3/bTraverser.s','abase/layer3/bTraverser.s','wtraverser' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools._traverse },
}

_includeHandlerMap[ 'wCloner' ] =
{
  includeAny : [ '../../abase/layer4/Cloner.s','abase/layer4/Cloner.s','wcloner' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools._clone },
}

_includeHandlerMap[ 'wPath' ] =
{
  includeAny : [ '../../abase/layer3/PathTools.s','abase/layer3/PathTools.s','wPath' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.pathDir },
}

_includeHandlerMap[ 'wArraySorted' ] =
{
  includeAny : [ '../../abase/layer4/ArraySorted.s','abase/layer4/ArraySorted.s','warraysorted' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.arraySortedLookUp },
}

_includeHandlerMap[ 'wBaseEncoder' ] =
{
  includeAny : [ '../../abase/layer4/Encoder.s','abase/layer4/Encoder.s','wbaseencoder' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.encode },
}

_includeHandlerMap[ 'wRegexpObject' ] =
{
  includeAny : [ '../../amid/bclass/RegexpObject.s','amid/bclass/RegexpObject.s','wRegexpObject' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.RegexpObject; },
}

_includeHandlerMap[ 'wColor' ] =
{
  includeAny : [ '../../amid/color/Color.s','amid/color/Color.s','wColor' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.ColorMap },
}

_includeHandlerMap[ 'wColor256' ] =
{
  includeAny : [ '../../amid/color/Color256.s','amid/color/Color256.s','wColor256' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.ColorMap && Object.keys( _global.wTools.ColorMap ).length > 100 },
}

_includeHandlerMap[ 'wFiles' ] =
{
  includeAny : [ '../../amid/file/FileTop.s','amid/file/FileTop.s','wFiles' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.fileProvider },
}

_includeHandlerMap[ 'wFilesArchive' ] =
{
  includeAny : [ '../../amid/file/FilesArchive.s','amid/file/FilesArchive.s','wfilesarchive' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.FilesArchive },
}

_includeHandlerMap[ 'wFilesTransformers' ] =
{
  includeAny : [ '../../amid/file/FilesTransformers.s','amid/file/FilesTransformers.s','wfilestransformers' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.FileTransformers },
}

_includeHandlerMap[ 'wFilesSvn' ] =
{
  includeAny : [ '../../amid/file/fprovider/pSvn.ss','amid/file/fprovider/pSvn.ss','wFilesSvn' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.fileProvider.Svn },
}


_includeHandlerMap[ 'wTimeMarker' ] =
{
  includeAny : [ '../../amid/mixin/TimeMarker.s','amid/mixin/TimeMarker.s','wtimemarker' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.TimeMakrer },
}

_includeHandlerMap[ 'wPathTranslator' ] =
{
  includeAny : [ '../../amid/path/PathTranslator.s','amid/path/PathTranslator.s','wpathtranslator' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.PathTranslator },
}

_includeHandlerMap[ 'wFileExecutor' ] =
{
  includeAny : [ '../../../dwtools/amid/executor/FileExecutor.s','amid/executor/FileExecutor.s','wFileExecutor' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.wFileExecutor },
}

_includeHandlerMap[ 'wFileExecutorHtmlFormatters' ] =
{
  includeAny : [ '../../../dwtools/amid/executor/HtmlFormatters.s','amid/executor/HtmlFormatters.s','wFileExecutorHtmlFormatters' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.FileExecutorHtmlFormatters },
}

_includeHandlerMap[ 'wStarterMaker' ] =
{
  includeAny : [ '../../../dwtools/amid/starter/StarterMaker.s','amid/starter/StarterMaker.s','wStarterMaker' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.StarterMaker },
}

_includeHandlerMap[ 'wNameMapper' ] =
{
  includeAny : [ '../../amid/amapping/NameMapper.s','amid/amapping/NameMapper.s','wnamemapper' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.NameMapper },
}

_includeHandlerMap[ 'wTemplateTreeResolver' ] =
{
  includeAny : [ '../../amid/amapping/TemplateTreeAresolver.s','amid/amapping/TemplateTreeAresolver.s','wtemplatetreeresolver' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.TemplateTreeResolver },
}

_includeHandlerMap[ 'wTemplateTreeEnvironment' ] =
{
  includeAny : [ '../../amid/amapping/TemplateTreeEnvironment.s','amid/amapping/TemplateTreeEnvironment.s','wtemplatetreeenvironment' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.TemplateTreeEnvironment },
}

_includeHandlerMap[ 'wTemplateFileWriter' ] =
{
  includeAny : [ '../../amid/amapping/TemplateFileWriter.s','amid/amapping/TemplateFileWriter.s','wtemplatefilewriter' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.TemplateFileWriter },
}

_includeHandlerMap[ 'wGraph' ] =
{
  includeAny : [ '../../amid/agraph/Graph.s','amid/agraph/Graph.s','wGraph' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.graph },
}

_includeHandlerMap[ 'wSchema' ] =
{
  includeAny : [ '../../amid/schema/Top.s','amid/schema/Top.s','wSchema' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.schema },
}

_includeHandlerMap[ 'wScriptLauncher' ] =
{
  includeAny : [ '../../amid/launcher/ScriptLauncher.s','amid/launcher/ScriptLauncher.s','wscriptlauncher' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.ScriptLauncher },
}

_includeHandlerMap[ 'wExchangePoint' ] =
{
  includeAny : [ '../../amid/exchangePoint/ExchangePoint.s','amid/exchangePoint/ExchangePoint.s','wExchangePoint' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.ExchangePoint },
}

_includeHandlerMap[ 'wCommunicator' ] =
{
  includeAny : [ '../../amid/communicator/Communicator.s','amid/communicator/Communicator.s','wCommunicator' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Communicator },
}

_includeHandlerMap[ 'wIncubator' ] =
{
  includeAny : [ '../../amid/worker/Incubator.s','amid/worker/Incubator.s','wIncubator' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Incubator },
}

_includeHandlerMap[ 'wMathScalar' ] =
{
  includeAny : [ '../../../dwtools/amath/arithmetic/cScalar.s','amath/arithmetic/cScalar.s','wmathscalar' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.clamp },
}

_includeHandlerMap[ 'wMathVector' ] =
{
  includeAny : [ '../../../dwtools/amath/cvector/Base.s','amath/cvector/Base.s','wmathvector' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.vector },
}

_includeHandlerMap[ 'wMathSpace' ] =
{
  includeAny : [ '../../../dwtools/amath/space/wSpace.s','amath/space/wSpace.s','wmathspace' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Space },
}

_includeHandlerMap[ 'wMathConcepts' ] =
{
  includeAny : [ '../../../dwtools/amath/geometric/aConcepts.s','amath/geometric/aConcepts.ss','wmathconcepts' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.box },
}

_includeHandlerMap[ 'wBaker' ] =
{
  includeAny : [ '../../../dwtools/atop/baker/Baker.s','atop/baker/Baker.s','wBaker' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Baker },
}

_includeHandlerMap[ 'wBakerWithFileExecutor' ] =
{
  includeAny : [ '../../../dwtools/atop/baker/BakerWithFileExecutor.s','atop/baker/BakerWithFileExecutor.s','wBakerWithFileExecutor' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.wBakerWithFileExecutor },
}

_includeHandlerMap[ 'wMaker' ] =
{
  includeAny : [ '../../../dwtools/atop/maker/Maker.s','atop/maker/Maker.s','wMaker' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.Maker },
}

_includeHandlerMap[ 'wDeployerUnit' ] =
{
  includeAny : [ '../../../dwtools/atop/deployer/Unit.s','atop/deployer/Unit.s','wDeployerUnit' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.DeployerUnit },
}

_includeHandlerMap[ 'wServlet' ] =
{
  includeAny : [ '../../../dwtools/atop/servlet/Servlet.ss','atop/servlet/Servlet.ss','wServlet' ],
  isIncluded : function(){ return !!_global.wTools && _global.wTools.servlet },
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
  _includeAnyAct : _includeAnyAct,

  _includeWithRequire : _includeWithRequire,
  include : include,

  _includeWithRequireAny : _includeWithRequireAny,
  includeAny : includeAny,

  isIncluded : isIncluded,

}

_.mapExtend( Self, Proto );

if( typeof __dirname !== 'undefined' )
_.pathUse( __dirname + '/../..' );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_._UsingWtoolsPrivately_ )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
