( function _l8_Module_s_()
{

'use strict';

//

let _global = _global_;
const _ = _global_.wTools;

var Module = null;
var __nativeInclude;
if( typeof require !== 'undefined' )
__nativeInclude = require;
else if( typeof importScripts !== 'undefined' )
__nativeInclude = importScripts;
else if( _global._remoteRequire )
__nativeInclude = _global._remoteRequire;

let Self = _.module = _.module || Object.create( null );
_realGlobal_.wTools.module = _realGlobal_.wTools.module || Object.create( null );

// --
// routines
// --

// function usePath( src )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.strIs( src ) );
//
//   if( _.path && _.path.refine )
//   src = _.path.refine( src );
//
//   if( typeof module !== 'undefined' && module.paths )
//   if( module.paths.indexOf( src ) === -1 )
//   module.paths.push( src );
//
// }
//
// //
//
// function usePathGlobally( paths )
// {
//
//   if( _.strIs( paths ) )
//   paths = [ paths ];
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.arrayIs( paths ) );
//
//   debugger;
//   if( _.path.nativize && _.path.refine )
//   {
//     for( var p = 0 ; p < paths.length ; p++ )
//     {
//       paths[ p ] = _.path.nativize( _.path.resolve( paths[ p ] ) );
//       console.log( 'usePathGlobally', paths[ p ] );
//     }
//   }
//
//   return _usePathGlobally( module, paths, [] );
// }
//
// //
//
// function _usePathGlobally( _module, paths, visited )
// {
//
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.arrayIs( paths ) );
//
//   if( visited.indexOf( _module ) !== -1 )
//   return;
//
//   if( !Module )
//   Module = require( 'module' );
//
//   for( let p = 0 ; p < paths.length ; p++ )
//   if( Module.globalPaths.indexOf( paths[ p ] ) === -1 )
//   Module.globalPaths.push( paths[ p ] );
//
//   /* patch parents */
//
//   while( _module )
//   {
//     _usePathGloballyChildren( _module, paths, visited );
//     _module = _module.parent;
//   }
//
// }
//
// //
//
// function _usePathGloballyChildren( _module, paths, visited )
// {
//
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.arrayIs( paths ) );
//
//   if( visited.indexOf( _module ) !== -1 )
//   return;
//
//   visited.push( _module );
//
//   for( let p = 0 ; p < paths.length ; p++ )
//   {
//     if( _module.paths.indexOf( paths[ p ] ) === -1 )
//     _module.paths.push( paths[ p ] );
//   }
//
//   /* patch parents */
//
//   if( _module.children )
//   {
//     for( var c = 0 ; c < _module.children.length ; c++ )
//     _usePathGloballyChildren( _module.children[ c ], paths, visited );
//   }
//
// }

//

/* xxx : qqq : for Yevhen : introduce and cover _.module.nativeFileIs() */
/* qqq : for Yevhen : cover */
function path_head( routine, args )
{

  let o = args[ 0 ];
  if( !_.mapIs( o ) )
  o = { paths : o }
  if( _.strIs( o.paths ) )
  o.paths = [ o.paths ];

  _.assert( args.length === 1 );
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( o.paths ) );
  _.routine.options( pathAmend, o );

  if( _.path.nativize && _.path.normalize )
  {
    for( var p = 0 ; p < o.paths.length ; p++ )
    {
      o.paths[ p ] = _.path.nativize( _.path.normalize( o.paths[ p ] ) );
      console.log( 'usePathGlobally', o.paths[ p ] );
    }
  }

  return o;
}

//

function pathAmend_body( o )
{

  // if( !Module )
  const Module = require( 'module' );

  let pathAmend = o.amending === 'prepend' ? pathsPrependOnce : pathsAppendOnce;

  if( o.globally )
  pathAmend( Module.globalPaths, o.paths );

  if( o.locally && o.moduleNativeFile )
  pathAmend( o.moduleNativeFile.paths, o.paths );

  if( o.locally && o.permanent )
  {
    if( o.amending === 'prepend' )
    _.module._prependPath = _.arrayPrependArray( _.module._prependPath, o.paths );
    if( o.amending === 'append' )
    _.module._appendPath = _.arrayAppendArray( _.module._appendPath, o.paths );
  }

  if( o.locally && o.recursive && o.moduleNativeFile )
  return _root( o.moduleNativeFile, o.paths, new Set );

  /* - */

  function _root( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    if( o.recursive >= 2 )
    while( _module.parent )
    {
      _module = _module.parent; debugger;
    }

    _children1( _module, paths, visited );
  }

  /* - */

  function _children1( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    pathAmend( _module.paths, paths );

    if( o.recursive >= 2 )
    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function _children2( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    pathAmend( _module.paths, paths );

    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function pathsAppendOnce( dst, src )
  {
    for( let p = 0 ; p < src.length ; p++ )
    {
      if( dst.indexOf( src[ p ] ) === -1 )
      dst.push( src[ p ] );
    }
  }

  /* - */

  function pathsPrependOnce( dst, src )
  {
    for( let p = 0 ; p < src.length ; p++ )
    {
      if( dst.indexOf( src[ p ] ) === -1 )
      dst.unshift( src[ p ] );
    }
  }

  /* - */

}

pathAmend_body.defaults =
{
  module : null,
  paths : null,
  permanent : 0,
  globally : 1,
  locally : 0,
  recursive : 2,
  amending : 'append',
}

let pathAmend = _.routine.unite( path_head, pathAmend_body );

//

function pathRemove_body( o )
{

  if( !Module )
  Module = require( 'module' );

  if( o.globally )
  remove( Module.globalPaths, o.paths );

  if( o.locally && o.moduleNativeFile )
  remove( o.moduleNativeFile.paths, o.paths );

  if( o.locally && o.permanent )
  {
    if( _.module._prependPath )
    remove( _.module._prependPath, o.paths );
    if( _.module._appendPath )
    remove( _.module._appendPath, o.paths );
  }

  if( o.locally && o.recursive && o.moduleNativeFile )
  return _root( o.moduleNativeFile, o.paths, new Set );

  /* - */

  function _root( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    if( o.recursive >= 2 )
    while( _module.parent )
    {
      _module = _module.parent; debugger;
    }

    _children1( _module, paths, visited );
  }

  /* - */

  function _children1( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    remove( _module.paths, paths );

    if( o.recursive >= 2 )
    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function _children2( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    remove( _module.paths, paths );

    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function remove( dst, src )
  {
    for( let p = 0 ; p < src.length ; p++ )
    {
      if( dst.indexOf( src[ p ] ) !== -1 )
      dst.splice( p, 1 );
    }
  }

  /* - */

}

pathRemove_body.defaults =
{
  moduleNativeFile : null,
  paths : null,
  permanent : 0,
  globally : 1,
  locally : 0,
  recursive : 2,
  amending : 'append',
}

let pathRemove = _.routine.unite( path_head, pathRemove_body );

//

function pathGet( o )
{
  let result = [];

  _.assert( arguments.length === 0 || arguments.length === 1 );
  o = _.routine.options( pathGet, o );
  o.moduleNativeFile = o.moduleNativeFile || module;

  if( !Module )
  Module = require( 'module' );

  if( o.globally )
  {
    _.assert( _.arrayIs( Module.globalPaths ) );
    result.push( ... Module.globalPaths );
  }

  if( o.locally )
  {
    _.assert( _.arrayIs( o.moduleNativeFile.paths ) );
    result.push( ... o.moduleNativeFile.paths );
  }

  return result;
}

pathGet.defaults =
{
  moduleNativeFile : null,
  globally : 1,
  locally : 0,
}

// --
// predeclare
// --

function predeclare( o )
{

  _.routine.options( predeclare, arguments );

  if( _.strIs( o.alias ) )
  o.alias = [ o.alias ];
  else if( o.alias === null )
  o.alias = [];

  _.assert( _.arrayIs( o.alias ) );
  _.assert( _.strIs( o.name ) );
  _.assert( !_.module.predeclaredModulesByName.has( o.name ), () => `Module ${o.name} was already predeclared` );
  _.assert( _.strDefined( o.basePath ), '{-o.basePath-} is mandatory' );
  _.assert( o.includedFiles === undefined );

  o.includedFiles = null;

  _.arrayPrependOnce( o.alias, o.name );
  o.entryPath = _.arrayAs( o.entryPath );

  for( let i = 0 ; i < o.entryPath.length ; i++ )
  {
    let entryPath = o.entryPath[ i ];
    let was = _.module.predeclaredModulesByPath.get( entryPath );
    _.assert
    (
      !was || was === o, () => `Module ${o.name} is trying to register path registered by ${was.name}\nPath : ${entryPath}`
    );
    _.assert( _.strIs( entryPath ), `Expects string, but got ${_.entity.strType( entryPath )}` );
  }

  for( let i = 0 ; i < o.entryPath.length ; i++ )
  {
    let entryPath = o.entryPath[ i ];
    if( _.path.isDotted( entryPath ) )
    {
      entryPath = o.entryPath[ i ] = _.path.canonize( o.basePath + '/' + entryPath );
    }
    else
    {
      let normalized = _.path.canonize( entryPath );
      if( _.path.isAbsolute( normalized ) )
      entryPath = o.entryPath[ i ] = normalized;
    }
    delete o.basePath;
    o.status = 0;
    _.module.predeclaredModulesByPath.set( entryPath, o );
  }

  o.alias.forEach( ( name ) => _.module.predeclaredModulesByName.set( name, o ) );

  return o;
}

predeclare.defaults =
{
  name : null,
  alias : null,
  entryPath : null,
  basePath : null,
  isIncluded : null,
}

//

function predeclareAll( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.mapIs( o.modules ) );
  _.routine.options( predeclareAll, arguments );

  for( let k in o.modules )
  {
    let module = o.modules[ k ];
    _.assert( module.name === k || module.name === undefined );
    _.assert( _.mapIs( module ) );
    module.name = k;
    if( !module.basePath )
    module.basePath = o.basePath;
    _.module.predeclare( module );
  }

}

predeclareAll.defaults =
{
  modules : null,
  basePath : null,
}

// --
// include
// --

function _sourceFileIncludeSingle( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ), 'Expects string' );

  if( typeof module === 'undefined' )
  throw _.error.err( 'Cant include, routine "require" does not exist.' );
  else
  return _.module.__nativeInclude( _.path.nativize( src ) );

  // if( typeof module !== 'undefined' )
  // return _.module.__nativeInclude( _.path.nativize( src ) );
  // else
  // throw _.error.err( 'Cant include, routine "require" does not exist.' );

}

//

function include()
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( arguments[ 0 ] ) );
  let resolved = _.module.resolve( ... arguments );
  return _.module._sourceFileIncludeSingle( resolved );
}

//

function includeFirst()
{
  let resolved = _.module.resolveFirst( ... arguments );
  if( resolved )
  return _.module._sourceFileIncludeSingle( resolved );
}

//

/* zzz : reimplement */
function isIncluded( src )
{
  debugger;
  if( _.module.includedModules.has( src ) )
  return true;
  return false;
}

// function isIncluded( src )
// {
//   var descriptor = _.module.predeclaredModulesByName.get( src );
//
//   if( !descriptor )
//   return false;
//
//   if( !descriptor.isIncluded )
//   {
//     debugger;
//     return false;
//   }
//
//   return descriptor.isIncluded();
// }

//

function _trackingEnable()
{

  const Module = require( 'module' );
  const NjsResolveFilename = Module._resolveFilename;
  const NjsLoad1 = Module._load;
  const NjsLoad2 = Module.prototype.load;

  let including = false;
  let lastRequest;
  let lastParent;
  let lastResolvedPath;

  _.assert( _.routineIs( NjsResolveFilename ) );
  _.assert( _.routineIs( NjsLoad1 ) );
  _.assert( _.routineIs( NjsLoad2 ) );

  if( _global === _realGlobal_ )
  Module._resolveFilename = function _resolveFilename( /* request, parent, isMain, options */ )
  {
    let request = arguments[ 0 ];
    let parent = arguments[ 1 ];
    let isMain = arguments[ 2 ];
    let options = arguments[ 3 ];
    if( lastParent === parent && lastRequest === request )
    return lastResolvedPath;
    lastResolvedPath = NjsResolveFilename.apply( this, arguments );
    lastRequest = request;
    lastParent = parent;
    return lastResolvedPath;
  }

  if( _global === _realGlobal_ )
  Module._load = function _load( request, parent, isMain )
  {
    let result;
    let resolvedPath;
    let moduleNativeFiles;

    including = true;
    moduleNativeFiles = Module._cache;
    if( parent.moduleNativeFilesMap )
    Module._cache = parent.moduleNativeFilesMap;

    try
    {
      resolvedPath = Module._resolveFilename( request, parent, isMain );
      result = NjsLoad1.apply( this, arguments );
    }
    catch( err )
    {
      debugger;
      let error;
      if( parent && parent.filename )
      error = _.err( err, `\nScript "${parent.filename}" failed to include "${request}"` );
      else
      error = _.err( err, `\nFailed to include "${request}"` );
      throw error;
    }
    finally
    {
      Module._cache = moduleNativeFiles;
      including = false;
    }

    return result;
  }

  Module.prototype.load = function load( sourcePath )
  {
    /*
    ignore includes of other global namespaces
    */
    if( _.module.moduleNativeFilesMap !== Module._cache )
    {
      return NjsLoad2.apply( this, arguments );
    }

    let result;
    let moduleNativeFile = this

    let moduleFile = _.module._universalFileFrom
    ({
      sourcePath,
      requestedSourcePath : null,
      returned : null,
      moduleNativeFile,
      status : 1,
    });

    _.assert( moduleNativeFile === moduleFile.moduleNativeFile );
    _.assert( moduleNativeFile === Module._cache[ moduleFile.sourcePath ] );

    try
    {
      result = NjsLoad2.apply( this, arguments );
    }
    catch( err )
    {
      err = _.err( err );
      moduleFile.error = moduleFile.error || err;
      throw err;
    }
    finally
    {
      moduleFile.status = 2;
      moduleFile.returned = moduleNativeFile.exports;
    }

    return result;
  }

}

// --
// file
// --

/* qqq xxx : cover */
function nativeFileIs( src )
{
  if( !src )
  return false;
  if( !Module )
  return true;
  return src instanceof Module;
}

//

/* qqq xxx : cover */
function universalFileIs( src )
{
  if( !src )
  return false;
  return _.objectIs( src );
}

//

function _universalFileFrom( o )
{
  _.assert( !o.module );
  _.assert( _.module.nativeFileIs( o.moduleNativeFile ) );
  try
  {

    /* xxx : check and optimize */
    if( _global_.process && _global_.process.platform === 'win32' )
    o.sourcePath = _.path.normalize( o.sourcePath );

    let moduleFile2 = _.module.includedSourceFiles.get( o.sourcePath );
    if( moduleFile2 )
    {
      debugger;
      return moduleFile2;
    }

    _.assert( !o.moduleNativeFile.moduleUniveralFile );
    o.moduleNativeFile.moduleUniveralFile = o;
    _.assert( !o.moduleNativeFile.moduleNativeFilesMap );
    o.moduleNativeFile.moduleNativeFilesMap = Module._cache;
    Object.setPrototypeOf( o, null );

    _.module.includedSourceFiles.set( o.sourcePath, o );

    if( o.moduleNativeFile )
    {
      if( _.module._prependPath || _.module._appendPath )
      debugger;
      if( _.module._prependPath )
      _.arrayPrependArrayOnce( o.moduleNativeFile.paths, _.module._prependPath );
      if( _.module._appendPath )
      _.arrayAppendArrayOnce( o.moduleNativeFile.paths, _.module._appendPath );
    }

    o.global = o.global || _global;
    o.error = o.error || null;
    o.module = o.module || _.module.predeclaredModulesByPath.get( o.sourcePath ) || null;
    if( o.module )
    {
      o.module.returned = o.returned;
      o.module.status = 2;
      o.module.includedFiles = o.module.includedFiles || new HashMap();
      o.module.includedFiles.set( o.sourcePath, o );
      let was = _.module.includedModules.get( o.sourcePath );
      _.assert( !was || was === o.module );
      o.module.alias.forEach( ( name ) => _.module.includedModules.set( name, o.module ) );
    }

    return o;
  }
  catch( err )
  {
    console.log( _.err( err, `\nError in _.module._universalFileFrom of ${o.sourcePath}` ) );
    return o;
  }
}

_universalFileFrom.defaults =
{
  sourcePath : null,
  requestedSourcePath : null,
  moduleNativeFile : null,
  returned : null,
  module : null,
  error : null,
  global : null,
  status : null,
}

//

function _nativeFilesRegister( o )
{
  let visited = new Set;
  let stack = [];

  _.routine.options( _nativeFilesRegister, o );
  o.files = _.arrayAs( o.files );
  stack.push( ... o.files );

  while( stack.length )
  register( stack.pop() );

  function register( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    stack.push( ... file.children );

    if( !file.moduleUniveralFile )
    _.module._universalFileFrom
    ({
      sourcePath : file.filename,
      requestedSourcePath : null,
      returned : file.exports,
      moduleNativeFile : file,
      status : 2,
    });

  }

}

_nativeFilesRegister.defaults =
{
  files : null,
}

//

function fileGet( sourcePath )
{
  var result = _.module.includedSourceFiles.get( _.path.normalize( sourcePath ) );
  return result;
}

// --
//
// --

function _resolve( moduleName )
{
  if( arguments.length > 1 )
  {
    let result = [];
    let basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );
    /* qqq xxx : optimize for relase build */

    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let moduleName = arguments[ a ];

      if( moduleName === _.optional )
      continue;

      debugger;
      let r = _.module._resolveFirst
      ({
        moduleNames : [ moduleName ],
        // basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
        basePath,
        throwing : 0,
      });
      if( r !== undefined )
      result.push( r );
    }

    return result;
  }

  return _.module._resolveFirst
  ({
    moduleNames : moduleName,
    // basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
    basePath,
    throwing : 0,
  });
}

//

function resolve( moduleName )
{
  if( arguments.length > 1 )
  {
    let result = [];

    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let moduleName = arguments[ a ];

      if( moduleName === _.optional )
      continue;

      let r = _.module._resolveFirst
      ({
        moduleNames : [ moduleName ],
        basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
        throwing : 1,
      });
      if( r !== undefined )
      result.push( r );
    }

    return result;
  }

  return _.module._resolveFirst
  ({
    moduleNames : [ moduleName ],
    basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
    throwing : 1,
  });
}

//

function _resolveFirst( o )
{

  if( !_.mapIs( o ) )
  o = { moduleNames : arguments }
  _.routine.options( _resolveFirst, o );

  if( o.basePath === null )
  o.basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );

  let sourcePaths = this._modulesToSourcePaths( o.moduleNames );
  let resolved = this._sourceFileResolve({ sourcePaths, basePath : o.basePath });

  if( o.throwing )
  if( resolved === undefined && !_.longHas( o.moduleNames, _.optional ) )
  {
    debugger;
    throw _.err
    (
      `Cant resolve module::${_.longSlice( o.moduleNames ).join( ' module' )}.`
      + `\nLooked at:\n - ${sourcePaths.join( '\n - ' )}`
    );
  }

  return resolved;
}

_resolveFirst.defaults =
{
  moduleNames : null,
  basePath : null,
  throwing : 0,
}

//

function resolveFirst()
{
  return _.module._resolveFirst
  ({
    moduleNames : arguments,
    basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
  });
}

//

function _modulesToSourcePaths( names )
{
  let result = [];

  _.assert( arguments.length === 1 );
  _.assert( _.longIs( names ) );

  for( let a = 0 ; a < names.length ; a++ )
  {
    let src = names[ a ];
    if( src === _.optional )
    continue;
    _.assert( _.strDefined( src ) );
    var descriptor = _.module.predeclaredModulesByName.get( src );
    if( descriptor )
    {
      _.assert( _.longIs( descriptor.entryPath ) );
      _.arrayAppendArray( result, _.arrayAs( descriptor.entryPath ) );
    }
    else
    {
      result.push( src );
    }
  }

  return result;
}

//

function _sourceFileResolve( o )
{
  let result = [];

  if( !_.mapIs( arguments[ 0 ] ) )
  o = { sourcePaths : arguments[ 0 ] }

  _.routine.options( _sourceFileResolve, o );
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( o.sourcePaths ) );

  for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  {
    let sourcePath = o.sourcePaths[ a ];
    let resolved;

    try
    {
      resolved = _.module.__nativeInclude.resolve( _.path.nativize( sourcePath ) );
    }
    catch( err )
    {
      continue;
    }

    result.push( resolved );
    if( !o.all )
    return result[ 0 ];
  }

  if( o.basePath )
  {
    o.basePath = _.path.normalize( o.basePath );
    let index = o.basePath.indexOf( '/wtools/' );
    if( index >= 0 )
    o.basePath = o.basePath.substring( 0, index+8 );
  }

  if( o.basePath )
  for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  {
    let sourcePath = o.sourcePaths[ a ];
    let resolved;

    if( _.path.isAbsolute( sourcePath ) )
    continue;

    try
    {
      let filePath = _.path.nativize( _.path.normalize( o.basePath + '/' + sourcePath ) );
      resolved = _.module.__nativeInclude.resolve( filePath );
    }
    catch( err )
    {
      continue;
    }

    result.push( resolved );
    if( !o.all )
    return result[ 0 ];
  }

  if( o.all )
  return result;
  else
  return undefined;
}

_sourceFileResolve.defaults =
{
  sourcePaths : null,
  basePath : null,
  all : 0,
}

//

function toolsPathGet()
{
  return _.path.normalize( __dirname + '/../../../../wtools/Tools.s' );
}

// --
// meta
// --

function _Setup()
{

  if( _.module._modulesToRegister )
  _.module.predeclareAll( _.module._modulesToRegister );

  if( typeof require === 'undefined' )
  return;

  _.module.rootFile = module;
  while( _.module.rootFile.parent )
  _.module.rootFile = _.module.rootFile.parent; /* xxx : introduce source file adapter */

  if( !Module )
  Module = require( 'module' );

  _.module.moduleNativeFilesMap = Module._cache;

  if( _.module._setupRequireDone )
  return;
  _.module._setupRequireDone = 1;

  /* qqq xxx : remove that if-return branch */
  if( _global_.Config.interpreter === 'browser' )
  return;

  _.module._trackingEnable();
  _.module._nativeFilesRegister({ files : [ _.module.rootFile ] });

}

// --
// declare
// --

var ToolsExtension =
{
  include,
  includeFirst,
}

var ModuleExtension =
{

  // use

  pathAmend,
  pathRemove,
  pathGet,

  // predeclare

  predeclare,
  predeclareAll,

  // include

  _sourceFileIncludeSingle,

  include,
  includeFirst,

  isIncluded,
  _trackingEnable,

  // file

  nativeFileIs,
  universalFileIs,
  fileIs : universalFileIs,
  _universalFileFrom,
  _nativeFilesRegister,
  fileGet,

  // resolve

  _resolve,
  _resolveFirst,
  resolve,
  resolveFirst,
  _modulesToSourcePaths,
  _sourceFileResolve,

  toolsPathGet,

  // meta

  _Setup,

  // fields

  __nativeInclude,
  _prependPath : null,
  _appendPath : null,
  rootFile : null,
  predeclaredModulesByName : new HashMap,
  predeclaredModulesByPath : new HashMap,
  includedModules : new HashMap,
  includedSourceFiles : new HashMap,
  _setupRequireDone : null,

}

_.mapSupplement( _.module, ModuleExtension );
_.mapSupplement( _, ToolsExtension );

_.module._Setup();

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
