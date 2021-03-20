( function _ModulesRegistry_s_()
{

'use strict';

let _global = _global_;
let _ = _global.wTools = _global.wTools || Object.create( null );
_.module = _.module || Object.create( null );
_.module._modulesToRegister = _.module._modulesToRegister || Object.create( null );
let Self = _.module._modulesToRegister;

/*
  Temporary solution.
*/

// --
// helper
// --

function _entryPath( filePath, name )
{
  _.assert( arguments.length === 2 );
  return [ '../../' + filePath, filePath, name ]; /* xxx : remove first element? */
}

//

function _predeclaredNormalize( module, name )
{
  module.alias = module.alias || [];
  _.arrayAppendOnce( module.alias, name.toLowerCase() );
}

//

function _predeclaredNormalizeEach( modules )
{
  _.each( modules, ( module, name ) => { _.module._predeclaredNormalize( module, name ) } );
}

// --
// include map
// --

// base / l1

let wTools =
{
  entryPath : _entryPath( 'abase/Layer1.s', 'wTools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.longHas },
}

// base / l2

let wBlueprint =
{
  entryPath : _entryPath( 'abase/l2_blueprint/Include.s', 'wblueprint' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.blueprint },
}

let wEntityBasic =
{
  entryPath : _entryPath( 'abase/l2/EntityBasic.s', 'wentitybasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityVals; },
}

let wLooker =
{
  entryPath : _entryPath( 'abase/l2/Looker.s', 'wlooker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.look; },
}

let wPathBasic =
{
  entryPath : _entryPath( 'abase/l3/PathsBasic.s', 'wpathbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.path && !!_global.wTools.path.s },
}

let wIntrospectorBasic =
{
  entryPath : _entryPath( 'abase/l2/Introspector.s', 'wintrospectorbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.exec },
}

// base / l3

let wProto =
{
  entryPath : _entryPath( 'abase/l3_proto/Include.s', 'wProto' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.mixinDelcare },
}

let wStringer =
{
  entryPath : _entryPath( 'abase/l3/Stringer.s', 'wstringer' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Stringer; },
}

// base / l4

let wReplicator =
{
  entryPath : _entryPath( 'abase/l4/Replicator.s', 'wreplicator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.replicate; },
}

let wLookerExtra =
{
  entryPath : _entryPath( 'abase/l4/LookerExtra.s', 'wlookerextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entitySearch },
}

let wArraySorted =
{
  entryPath : _entryPath( 'abase/l4/ArraySorted.s', 'warraysorted' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.sorted && !!_global.wTools.sorted.lookUp },
}

let wArraySparse =
{
  entryPath : _entryPath( 'abase/l4/ArraySparse.s', 'warraysparse' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.sparse },
}

let wProcess =
{
  entryPath : _entryPath( 'abase/l4_process/module/Process.s', 'wprocess' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.process && !!_global.wTools.process.start },
}

let wUriBasic =
{
  entryPath : _entryPath( 'abase/l5/Uris.s', 'wuribasic' ),
  isIncluded : function()
  {
    return !!_global.wTools && !!_global.wTools.uri && !!_global.wTools.uri.s && !!_global.wTools.uri.s.parse
  },
}

let wTraverser =
{
  entryPath : _entryPath( 'abase/l4/Traverser.s', 'wtraverser' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.traverse },
}

let wBaseEncoder =
{
  entryPath : _entryPath( 'abase/l4/Encoder.s', 'wbaseencoder' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.encode },
}

// base / l5

let wPathTools =
{
  entryPath : _entryPath( 'abase/l5/PathTools.s', 'wpathtools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.path && !!_global.wTools.path.mapExtend },
}

let wSelector =
{
  entryPath : _entryPath( 'abase/l5/Selector.s', 'wselector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.select; },
}

let wWebUriBasic =
{
  entryPath : _entryPath( 'abase/l5/WebUri.s', 'wweburibasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.weburi },
}

let wCloner =
{
  entryPath : _entryPath( 'abase/l5/Cloner.s', 'wcloner' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._clone },
}

let wStringsExtra =
{
  entryPath : _entryPath( 'abase/l5/StringTools.s', 'wstringsextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.strSorterParse; },
}

let wProcessWatcher =
{
  entryPath : _entryPath( 'abase/l5/ProcessWatcher.s', 'wprocesswatcher' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.process && !!_global.wTools.process.watchMaking; },
}

// base / l6

let wResolver =
{
  entryPath : _entryPath( 'abase/l6/Resolver.s', 'wresolver' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.resolver; },
}

let wEqualer =
{
  entryPath : _entryPath( 'abase/l6/Equaler.s', 'wequaler' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._equalIt },
}

let wSelectorExtra =
{
  entryPath : _entryPath( 'abase/l6/SelectorExtra.s', 'wselectorextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityProbe; },
}

// base / l7

let wResolverExtra =
{
  entryPath : _entryPath( 'abase/l7/ResolverExtra.s', 'wresolverextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.resolverAdv && !!_global.wTools.resolverAdv.resolve; },
}

// base / l7_mixin

let wConsequizer =
{
  entryPath : _entryPath( 'abase/l7_mixin/Consequizer.', 'wconsequizer' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Consequizer; },
}

let wCopyable =
{
  entryPath : _entryPath( 'abase/l7_mixin/Copyable.s', 'wCopyable' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Copyable; },
}

let wInstancing =
{
  entryPath : _entryPath( 'abase/l7_mixin/Instancing.s', 'winstancing' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Instancing; },
}

let wEventHandler =
{
  entryPath : _entryPath( 'abase/l7_mixin/EventHandler.s', 'wEventHandler' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.EventHandler; },
}

let wFieldsStack =
{
  entryPath : _entryPath( 'abase/l7_mixin/FieldsStack.s', 'wfieldsstack' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FieldsStack; },
}

// base / l8

let wProcedure =
{
  entryPath : _entryPath( 'abase/l8_procedure/Include.s', 'wprocedure' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.procedure },
}

// base / l9

let wLogger =
{
  entryPath : _entryPath( 'abase/l9/logger/entry/Logger.s', 'wLogger' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Logger; },
}

let wPrinterToFile =
{
  entryPath : _entryPath( 'abase/l9/logger/ToFile.ss', 'wloggertofile' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PrinterToFile; },
}

let wPrinterToJs =
{
  entryPath : _entryPath( 'abase/l9/logger/ToJstructure.s', 'wloggertojs' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PrinterToJs; },
}

let wConsequence =
{
  entryPath : _entryPath( 'abase/l9/consequence/Namespace.s', 'wConsequence' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Consequence; },
}

// abase_dom

let wDomBaseLayer1 =
{
  entryPath : _entryPath( 'abase_dom/l1/Common.js', 'wdombaselayer1' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBaselayer1Loaded },
}

let wDomBaseLayer3 =
{
  entryPath : _entryPath( 'abase_dom/l3/Common.js', 'wdombaselayer3' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBaselayer3Loaded },
}

let wDomBaseLayer5 =
{
  entryPath : _entryPath( 'abase_dom/l5/Common.js', 'wdombasel5' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBasel5Loaded },
}

// amid

// amid / l1

let wGdf =
{
  entryPath : _entryPath( 'amid/l1/gdf/entry/Gdf.s', 'wgdf' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Gdf },
}

let wGraphBasic =
{
  entryPath : _entryPath( 'amid/l1/graphBasic/IncludeTop.s', 'wgraphbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.graph && !!_global.wTools.graph.AbstractGraphSystem },
}

let wGraphTools =
{
  entryPath : _entryPath( 'amid/l1/graphTools/IncludeTop.s', 'wgraphtools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.graph && !!_global.wTools.graph.GraphSystem },
}

// let wGraphLive =
// {
//   entryPath : _entryPath( 'amid/l1/graphTools/IncludeLive', 'wgraphlive' ),
//   isIncluded : function(){ return !!_global.wTools && !!_global.wTools.LiveSystem },
// }

let wRegexpObject =
{
  entryPath : _entryPath( 'amid/l1/regexp/RegexpObject.s', 'wRegexpObject' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.RegexpObject; },
}

let wVocabulary =
{
  entryPath : _entryPath( 'amid/l1/vocabulary/Vocabulary.s', 'wvocabulary' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Vocabulary },
}

let wSchema =
{
  entryPath : _entryPath( 'amid/l1/schema/include/Mid.s', 'wschema' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.schema },
}

let wStxt =
{
  entryPath : _entryPath( 'amid/l1/stxt/entry/Stxt.s', 'wstxt' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.stxt && !!_global.wTools.stxt.Parser },
}

let wLoggerSocket =
{
  entryPath : _entryPath( 'amid/l1_logger/Socket.s', 'wloggersocket' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.LoggerSocketReceiver },
}

let wHttp =
{
  entryPath : _entryPath( 'amid/l1/http/Include.s', 'whttp' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.http },
}

// mid / l3

let wStager =
{
  entryPath : _entryPath( 'amid/l3/stager/Stager.s', 'wstager' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Stager },
}

let wIntrospector =
{
  entryPath : _entryPath( 'amid/l3/introspector/module/Full.s', 'wintrospector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.introspector && !!_global.wTools.thisFile },
}

let wPersistent =
{
  entryPath : _entryPath( 'amid/l3/persistent/Include.s', 'wpersistent' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.persistent },
}

let wRemote =
{
  entryPath : _entryPath( 'amid/l3/remote/Include.s', 'wremote' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.remote },
}

let wGitTools =
{
  entryPath : _entryPath( 'amid/l3/git/entry/GitTools.ss', 'wgittools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.git },
}

let wNpmTools =
{
  entryPath : _entryPath( 'amid/l3/npm/Include.ss', 'wnpmtools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.npm },
}

let wYamlTools =
{
  entryPath : _entryPath( 'amid/l3/yaml/include/Mid.s', 'wyamltools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.yaml },
}

// mid / l3 / image

let wImage =
{
  entryPath : _entryPath( 'amid/l3/image/entry/Image.s', 'wimage' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image },
}

let wImageReader =
{
  entryPath : _entryPath( 'amid/l3/image/entry/Reader.s', 'wimagereader' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.reader },
}

let wImageWriter =
{
  entryPath : _entryPath( 'amid/l3/image/entry/Writer.s', 'wimagewriter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.writer },
}

let wImageReaderPng =
{
  entryPath : _entryPath( 'amid/l3/image/entry/ReaderPng.s', 'wimagereaderpng' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.reader.Png },
}

let wImageReaderPngjs =
{
  entryPath : _entryPath( 'amid/l3/image/entry/ReaderPngjs.s', 'wimagereaderpngjs' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.reader.Pngjs },
}

// mid / l4 / files

let wFiles =
{
  entryPath : _entryPath( 'amid/l4_files/entry/Files.s', 'wFiles' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider },
}

let wFilesArchive =
{
  entryPath : _entryPath( 'amid/l4_files/entry/Archive.s', 'wfilesarchive' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesArchive },
}

let wFilesEncoders =
{
  entryPath : _entryPath( 'amid/l4_files/entry/EncodersExtended.s', 'wfilesencoders' ),
  isIncluded : function()
  {
    return !!_global.wTools && !!_global.wTools.files
    && !!_global.wTools.files.ReadEncoders && !!_global.wTools.files.ReadEncoders.yml
  },
}

let wFilesExtract =
{
  entryPath : _entryPath( 'amid/l4_files/entry/Extract.ss', 'wfilesextract' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Extract },
}

let wFilesHardDrive =
{
  entryPath : _entryPath( 'amid/l4_files/entry/HardDrive.ss', 'wfilesharddrive' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.HardDrive },
}

let wFilesNpm =
{
  entryPath : _entryPath( 'amid/l4_files/entry/Npm.ss', 'wfilesnpm' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Npm },
}

let wFilesGit =
{
  entryPath : _entryPath( 'amid/l4_files/entry/Git.ss', 'wfilesgit' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Git },
}

let wFilesSvn =
{
  entryPath : _entryPath( 'amid/l4_files/entry/Svn.ss', 'wfilesvn' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Svn },
}

let wFilesImap =
{
  entryPath : _entryPath( 'amid/l4_files/l7_provider/Imap.ss', 'wfilesimap' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider },
}

// mid / l5

let wCensorBasic =
{
  entryPath : _entryPath( 'amid/l5/censor/entry/CensorBasic.s', 'wcensorbasic' ),
  isIncluded : function(){ return !!_global.censor && !!_global.censor.replace },
}

let wBitmask =
{
  entryPath : _entryPath( 'amid/l5_mapper/Bitmask.s', 'wBitmask' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Bitmask },
}

let wPathTranslator =
{
  entryPath : _entryPath( 'amid/l5_mapper/PathTranslator.s', 'wpathtranslator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PathTranslator },
}

let wNameMapper =
{
  entryPath : _entryPath( 'amid/l5_mapper/NameMapper.s', 'wnamemapper' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.NameMapper },
}

let wTemplateTreeResolver =
{
  entryPath : _entryPath( 'amid/l5_mapper/TemplateTreeResolver.s', 'wtemplatetreeresolver' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeResolver },
}

// let wTemplateTreeResolverAdv =
// {
//   entryPath : _entryPath( 'amid/l5_mapper/TemplateTreeResolverAdv.s', 'wtemplatetreeresolverAdv' ),
//   isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeResolverAdv },
// }

let wTemplateTreeEnvironment =
{
  entryPath : _entryPath( 'amid/l5_mapper/TemplateTreeEnvironment.s', 'wtemplatetreeenvironment' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeEnvironment },
}

let wTemplateFileWriter =
{
  entryPath : _entryPath( 'amid/l5_mapper/TemplateFileWriter.s', 'wtemplatefilewriter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateFileWriter },
}

//

let wColor =
{
  entryPath : _entryPath( 'amid/l1/color/entry/ColorBasic.s', 'wColor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.color && !!_global.wTools.color.ColorMap },
}

let wColor256 =
{
  entryPath : _entryPath( 'amid/l1/color/entry/Color256.s', 'wColor256' ),
  isIncluded : function()
  {
    return !!_global.wTools && !!_global.wTools.color
    && !!_global.wTools.color.ColorMap && Object.keys( _global.wTools.color.ColorMap ).length > 100
  },
}

let wChangeTransactor =
{
  entryPath : _entryPath( 'amid/changes/ChangeTransactor.s', 'wChangeTransactor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ChangeTransactor },
}

let wCommandsAggregator =
{
  entryPath : _entryPath( 'amid/l7/commands/CommandsAggregator.s', 'wcommandsaggregator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CommandsAggregator },
}

let wCommandsConfig =
{
  entryPath : _entryPath( 'amid/l7/commands/mixin/CommandsConfig.s', 'wcommandsconfig' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CommandsConfig },
}

let wFileExecutor =
{
  entryPath : _entryPath( 'amid/l7/executor/FileExecutor.s', 'wFileExecutor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.wFileExecutor },
}

let wFileExecutorHtmlFormatters =
{
  entryPath : _entryPath( 'amid/l7/executor/HtmlFormatters.s', 'wFileExecutorHtmlFormatters' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FileExecutorHtmlFormatters },
}

let wTimeMarker =
{
  entryPath : _entryPath( 'amid/amixin/TimeMarker.s', 'wtimemarker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TimeMarker },
}

let wVerbal =
{
  entryPath : _entryPath( 'amid/amixin/Verbal.s', 'wverbal' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Verbal },
}

let wStateStorage =
{
  entryPath : _entryPath( 'amid/amixin/aStateStorage.s', 'wstatestorage' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StateStorage },
}

let wStateSession =
{
  entryPath : _entryPath( 'amid/amixin/StateSession.s', 'wstatesession' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StateSession },
}

let wScriptLauncher =
{
  entryPath : _entryPath( 'amid/launcher/ScriptLauncher.s', 'wscriptlauncher' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ScriptLauncher },
}

let wExchangePoint =
{
  entryPath : _entryPath( 'amid/exchangePoint/ExchangePoint.s', 'wExchangePoint' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ExchangePoint },
}

let wCommunicator =
{
  entryPath : _entryPath( 'amid/communicator/Communicator.s', 'wCommunicator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Communicator },
}

let wIncubator =
{
  entryPath : _entryPath( 'amid/worker/Incubator.s', 'wIncubator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Incubator },
}

let wCollectionOfInstances =
{
  entryPath : _entryPath( 'amid/container/CollectionOfInstances.s', 'wcollectionofinstances' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CollectionOfInstances },
}

let wServletTools =
{
  entryPath : _entryPath( 'amid/servlet/ServletTools.ss', 'wservlettools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.servlet },
}

let wDocParser =
{
  entryPath : _entryPath( 'amid/docparser/entry/DocParser.s', 'wdocparser' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.docgen && !!_global.wTools.docgen.ParserJsdoc },
}

// math

let wMathScalar =
{
  entryPath : _entryPath( 'amath/l1/Scalar.s', 'wmathscalar' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.math && !!_global.wTools.math.clamp },
}

let wMathVector =
{
  entryPath : _entryPath( 'amath/l3_vector/Include.s', 'wmathvector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.avector && !!_global.wTools.avector.abs },
}

let wMathMatrix =
{
  entryPath : _entryPath( 'amath/l5_matrix/module/full/Include.s', 'wmathmatrix' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Space },
}

let wMathGeometric =
{
  entryPath : _entryPath( 'amath/l6/Geometric.s', 'wmathgeometric' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.math.d2TriPointInside },
}

let wMathModels =
{
  entryPath : _entryPath( 'amath/l8/Concepts.s', 'wmathmodels' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.box },
}

// top

let willbe =
{
  entryPath : _entryPath( 'atop/will/entry/Include.s', 'willbe' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Will },
}

let wStarter =
{
  entryPath : _entryPath( 'atop/starter/entry/Main.s', 'wstarter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StarterMaker },
}

let wTesting =
{
  entryPath : _entryPath( 'atop/testing/entry/Main.s', 'wTesting' ),
  isIncluded : function(){ return _realGlobal_.wTester && _realGlobal_.wTester._isReal_; },
}

let wTranspile =
{
  entryPath : _entryPath( 'atop/transpile/entry/Include.s', 'wtranspile' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.trs },
}

let wFilesOperationsDirector =
{
  entryPath : _entryPath( 'atop/files/OperationsDirector.s', 'wfilesoperationsdirector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesOperationsDirector },
}

let wFilesLinker =
{
  entryPath : _entryPath( 'atop/files/Linker.s', 'wfileslinker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesLinker },
}

let wBaker =
{
  entryPath : _entryPath( 'atop/baker/Baker.s', 'wBaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Baker },
}

let wBakerWithFileExecutor =
{
  entryPath : _entryPath( 'atop/baker/BakerWithFileExecutor.s', 'wBakerWithFileExecutor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.wBakerWithFileExecutor },
}

let wMaker =
{
  entryPath : _entryPath( 'atop/maker/Maker.s', 'wMaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Maker },
}

let wPuppet =
{
  entryPath : _entryPath( 'atop/puppet/Main.s', 'wpuppet' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.puppet },
}

let wCensor =
{
  entryPath : _entryPath( 'atop/censor/entry/Exec', 'wcensor' ),
  isIncluded : function(){ return !!_global.censor && !!_global.censor.Cui },
}

// --
// declare
// --

let Extension =
{

  _entryPath,
  _predeclaredNormalize,
  _predeclaredNormalizeEach,

}

Object.assign( _.module, Extension );

//

let Modules =
{

  // base / l1

  wTools,

  // base / l2

  wBlueprint,
  wEntityBasic,
  wLooker,
  wPathBasic,
  wIntrospectorBasic,

  // base / l3

  wProto,
  wStringer,

  // base / l4

  wReplicator,
  wLookerExtra,
  wArraySorted,
  wArraySparse,
  wProcess,
  wUriBasic,
  wTraverser,
  wBaseEncoder,

  // base / l5

  wPathTools,
  wSelector,
  wWebUriBasic,
  wCloner,
  wStringsExtra,
  wProcessWatcher,

  // base / l6

  wResolver,
  wEqualer,
  wSelectorExtra,

  // base / l7

  wResolverExtra,

  // base / l7_mixin

  wConsequizer,
  wCopyable,
  wInstancing,
  wEventHandler,
  wFieldsStack,

  // base / l8

  wProcedure,

  // base / l9

  wLogger,
  wPrinterToFile,
  wPrinterToJs,
  wConsequence,

  // base_dom

  wDomBaseLayer1,
  wDomBaseLayer3,
  wDomBaseLayer5,

  // mid

  // mid / l1

  wGdf,
  wGraphBasic,
  wGraphTools,
  wRegexpObject,
  wVocabulary,
  wSchema,
  wStxt,

  wLoggerSocket,
  wHttp,

  // mid / l3

  wStager,
  wIntrospector,
  wPersistent,
  wRemote,
  wGitTools,
  wNpmTools,
  wYamlTools,

  // mid / l3 / image

  /* xxx : move to l4 */

  wImage,
  wImageReader,
  wImageWriter,
  wImageReaderPng,
  wImageReaderPngjs,

  // amid / l4 / files

  wFiles,
  wFilesArchive,
  wFilesEncoders,
  wFilesExtract,
  wFilesHardDrive,
  wFilesNpm,
  wFilesGit,
  wFilesSvn,
  wFilesImap,

  // amid / l5

  wCensorBasic,
  wBitmask,
  wPathTranslator,
  wNameMapper,
  wTemplateTreeResolver,
  // wTemplateTreeResolverAdv,
  wTemplateTreeEnvironment,
  wTemplateFileWriter,

  //

  wColor,
  wColor256,
  wChangeTransactor,
  wCommandsAggregator,
  wCommandsConfig,

  wFileExecutor,
  wFileExecutorHtmlFormatters,

  wTimeMarker,
  wVerbal,
  wStateStorage,
  wStateSession,

  wScriptLauncher,
  wExchangePoint,
  wCommunicator,
  wIncubator,
  wCollectionOfInstances,
  wServletTools,
  wDocParser,

  // math

  wMathScalar,
  wMathVector,
  wMathMatrix,
  wMathGeometric,
  wMathModels,

  // top

  willbe,
  wStarter,
  wTesting,
  wTranspile,
  wFilesOperationsDirector,
  wFilesLinker,
  wBaker,
  wBakerWithFileExecutor,
  wMaker,
  wPuppet,
  wCensor,

}

Object.assign( _.module._modulesToRegister, Modules );

_.module._predeclaredNormalizeEach( _.module._modulesToRegister );
if( _.module.predeclareAll )
_.module.predeclareAll({ modules : _.module._modulesToRegister, basePath : __dirname });

/*
xxx : remove isIncluded
*/

// _.mapSupplement( _global.ModulesRegistry, Modules );
// if( _.module )
// _.module.registerKnown( _global.ModulesRegistry );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();

/* xxx : rename
- wequaler -> wequaler
- wpathbasic -> wpathbasic
- wuribasic -> wuribasic
- wprocess -> wprocess
- wentitybasic -> wentitybasic
- wweburibasic -> wweburibasic
- wintrospectorbasic -> wintrospectorbasic
- wdombasic -> wdombasic

- wEqualer -> wEqualer
- wPathBasic -> wPathBasic
- wUriBasic -> wUriBasic
- wProcess -> wProcessBasic
- wEntityBasic -> wEntityBasic
- wWebUriBasic -> wWebUriBasic
- wIntrospectorBasic -> wIntrospectorBasic
- wDomBasic -> wDomBasic
*/
