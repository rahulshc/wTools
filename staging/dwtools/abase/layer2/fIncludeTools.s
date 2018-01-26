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

var Module = null;
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

    var handler;
    if( _includeHandlerMap[ src ] )
    handler = _includeHandlerMap[ src ];

    if( !handler )
    {
      paths.push({ path : src });
      continue;
    }

    if( handler.isIncluded )
    if( handler.isIncluded() )
    return handler.returned;

    debugger;

    var result;
    if( handler.include )
    {
      paths.push({ path : handler.include, handler : handler }); debugger;
    }
    else if( handler.includeAny )
    {
      debugger;
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
  // var errors = [];
  return _includeAnyAct( arguments );
  //
  // for( var a = 0 ; a < arguments.length ; a++ )
  // {
  //   var src = arguments[ a ];
  //
  //   if( src !== '' )
  //   try
  //   {
  //     var resolved = __include.resolve( src );
  //     /* console.log( '__include.resolve',src,'->',resolved ); */
  //     src = resolved;
  //   }
  //   catch( err )
  //   {
  //     if( a !== arguments.length-1 && !usingSinglePath )
  //     continue;
  //   }
  //
  //   if( a === arguments.length-1 && src === '' )
  //   return;
  //
  //   var result = _includeAct( src );
  //   return result;
  //
  // }
  //
  // _.assert( 0,'unexpected' );
}

// --
// var
// --

var _includeHandlerMap = {};

_includeHandlerMap[ 'wTesting' ] =
{
  includeAny : [ '../../abase/xtester/cTester.debug.s','abase/xtester/cTester.debug.s','wTesting' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Tester && wTools.Tester._isFullImplementation; },
}

_includeHandlerMap[ 'wLogger' ] =
{
  includeAny : [ '../../abase/oclass/printer/top/Logger.s','abase/oclass/printer/top/Logger.s','wLogger' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Logger; },
}

_includeHandlerMap[ 'wPrinterToFile' ] =
{
  includeAny : [ '../../abase/oclass/printer/top/ToFile.ss','abase/oclass/printer/top/ToFile.ss','wloggertofile' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.PrinterToFile; },
}

_includeHandlerMap[ 'wPrinterToJstructure' ] =
{
  includeAny : [ '../../abase/oclass/printer/top/ToJstructure.s','abase/oclass/printer/top/ToJstructure.s','wloggertojstructure' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.PrinterToJstructure; },
}

_includeHandlerMap[ 'wConsequence' ] =
{
  includeAny : [ '../../abase/oclass/Consequence.s','abase/oclass/Consequence.s','wConsequence' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Consequence; },
}

_includeHandlerMap[ 'wConsequizer' ] =
{
  includeAny : [ '../../abase/mixin/Consequizer.s','abase/mixin/Consequizer.','wconsequizer' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Consequizer; },
}

_includeHandlerMap[ 'wCopyable' ] =
{
  includeAny : [ '../../abase/mixin/Copyable.s','abase/mixin/Copyable.s','wCopyable' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Copyable; },
}

_includeHandlerMap[ 'wInstancing' ] =
{
  includeAny : [ '../../abase/mixin/Instancing.s','abase/mixin/Instancing.s','winstancing' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Instancing; },
}

_includeHandlerMap[ 'wEventHandler' ] =
{
  includeAny : [ '../../abase/mixin/EventHandler.s','abase/mixin/EventHandler.s','wEventHandler' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.EventHandler; },
}

_includeHandlerMap[ 'wFieldsStack' ] =
{
  includeAny : [ '../../abase/mixin/FieldsStack.s','abase/mixin/FieldsStack.s','wfieldsstack' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.FieldsStack; },
}

_includeHandlerMap[ 'wNameTools' ] =
{
  includeAny : [ '../../abase/layer3//NameTools.s','abase/layer3//NameTools.s','wNameTools' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.idWithInt; },
}

_includeHandlerMap[ 'wRegexpObject' ] =
{
  includeAny : [ '../../abase/oclass/RegexpObject.s','abase/oclass/RegexpObject.s','wRegexpObject' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.RegexpObject; },
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

_includeHandlerMap[ 'wBaseEncoder' ] =
{
  includeAny : [ '../../abase/layer3/Encoder.s','abase/layer3/Encoder.s','wbaseencoder' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.encode },
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

_includeHandlerMap[ 'wFilesSvn' ] =
{
  includeAny : [ '../../amid/file/fprovider/pSvn.ss','amid/file/fprovider/pSvn.ss','wFilesSvn' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.fileProvider.Svn },
}

_includeHandlerMap[ 'wNameMapper' ] =
{
  includeAny : [ '../../amid/mapping/NameMapper.s','amid/mapping/NameMapper.s','wnamemapper' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.NameMapper },
}

_includeHandlerMap[ 'wTemplateTreeResolver' ] =
{
  includeAny : [ '../../amid/mapping/TemplateTreeAresolver.s','amid/mapping/TemplateTreeAresolver.s','wtemplatetreeresolver' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.TemplateTreeResolver },
}

_includeHandlerMap[ 'wTemplateTreeEnvironment' ] =
{
  includeAny : [ '../../amid/mapping/TemplateTreeEnvironment.s','amid/mapping/TemplateTreeEnvironment.s','wtemplatetreeenvironment' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.TemplateTreeEnvironment },
}

_includeHandlerMap[ 'wTemplateFileWriter' ] =
{
  includeAny : [ '../../amid/mapping/TemplateFileWriter.s','amid/mapping/TemplateFileWriter.s','wtemplatefilewriter' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.TemplateFileWriter },
}

_includeHandlerMap[ 'wGraph' ] =
{
  includeAny : [ '../../amid/agraph/Graph.s','amid/agraph/Graph.s','wGraph' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.graph },
}

_includeHandlerMap[ 'wSchema' ] =
{
  includeAny : [ '../../amid/schema/Top.s','amid/schema/Top.s','wSchema' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.schema },
}

_includeHandlerMap[ 'wScriptLauncher' ] =
{
  includeAny : [ '../../amid/launcher/ScriptLauncher.s','amid/launcher/ScriptLauncher.s','wscriptlauncher' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.ScriptLauncher },
}

_includeHandlerMap[ 'wExchangePoint' ] =
{
  includeAny : [ '../../amid/exchangePoint/ExchangePoint.s','amid/exchangePoint/ExchangePoint.s','wExchangePoint' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.ExchangePoint },
}

_includeHandlerMap[ 'wCommunicator' ] =
{
  includeAny : [ '../../amid/communicator/Communicator.s','amid/communicator/Communicator.s','wCommunicator' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Communicator },
}

_includeHandlerMap[ 'wIncubator' ] =
{
  includeAny : [ '../../amid/worker/Incubator.s','amid/worker/Incubator.s','wIncubator' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Incubator },
}

_includeHandlerMap[ 'wMaker' ] =
{
  includeAny : [ '../../../dwtools/atop/maker/Maker.s','atop/maker/Maker.s','wMaker' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Maker },
}

_includeHandlerMap[ 'wDeployerUnit' ] =
{
  includeAny : [ '../../../dwtools/atop/deployer/Unit.s','atop/deployer/Unit.s','wDeployerUnit' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.DeployerUnit },
}

_includeHandlerMap[ 'wServlet' ] =
{
  includeAny : [ '../../../dwtools/atop/servlet/Servlet.ss','atop/servlet/Servlet.ss','wServlet' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.servlet },
}

_includeHandlerMap[ 'wMathScalar' ] =
{
  includeAny : [ '../../../dwtools/amath/arithmetic/cScalar.ss','amath/arithmetic/cScalar.ss','wMathScalar' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.clamp },
}

_includeHandlerMap[ 'wMathVector' ] =
{
  includeAny : [ '../../../dwtools/amath/cvector/Base.s','amath/cvector/Base.s','wMathVector' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.vector },
}

_includeHandlerMap[ 'wMathSpace' ] =
{
  includeAny : [ '../../../dwtools/amath/space/wSpace.s','amath/space/wSpace.s','wMathSpace' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.Space },
}

_includeHandlerMap[ 'wMathConcepts' ] =
{
  includeAny : [ '../../../dwtools/amath/geometric/aConcepts.s','amath/geometric/aConcepts.ss','wMathConcepts' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.box },
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

}

_.mapExtend( Self, Proto );

if( typeof __dirname !== 'undefined' )
_.pathUse( __dirname + '/../..' );

})();
