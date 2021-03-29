( function _l8_Module_s_()
{

'use strict';

//

const _global = _global_;
const _ = _global_.wTools;
const __ = _realGlobal_.wTools;
let ModuleFileNative = null;

let __fileNativeInclude;
if( typeof require !== 'undefined' )
__fileNativeInclude = require;
else if( typeof importScripts !== 'undefined' )
__fileNativeInclude = importScripts;
else if( _global._remoteRequire )
__fileNativeInclude = _global._remoteRequire;

const hasModuleFileDescriptor = !( typeof module === 'undefined' );
const Self = _.module = _.module || Object.create( null );
__.module = __.module || Object.create( null );

/* = concepts

Module
ModuleFile
EntryFile

*/

// --
// Module methods
// --

function moduleExportString()
{
  return `{- ${this.constructor.name} ${this.name} -}`;
}

// --
// Module File methods
// --

function moduleFileExportString()
{
  return `{- ${this.constructor.name} ${this.sourcePath} -}`;
}

//

function moduleFileReturnedGet()
{
  if( !this.moduleNativeFile )
  return;
  return this.moduleNativeFile.exports;
}

// xxx : use later
// //
//
// function ModuleFileReturnedSet( val )
// {
//   if( !this.moduleNativeFile )
//   return;
//   return this.moduleNativeFile.exports = val;
// }

// //
//
// function moduleFileNodesGet()
// {
//   if( !this.moduleNativeFile )
//   return;
//   return this.moduleNativeFile.children;
// }
//
// //
//
// function moduleFileDownGet()
// {
//   if( !this.moduleNativeFile )
//   return;
//   if( !this.moduleNativeFile.parent )
//   return this.moduleNativeFile.parent;
//   _.assert( !!this.moduleNativeFile.parent.moduleUniveralFile );
//   return this.moduleNativeFile.parent.moduleUniveralFile;
// }

// --
// module
// --

function is( src )
{
  if( !src )
  return false;
  return src instanceof _.module.Module;
}

//

function predeclare_head( routine, args )
{

  let o = args[ 0 ]
  if( _.strIs( args[ 0 ] ) )
  o = { name : args[ 0 ], entryPath : args[ 1 ] }

  _.routine.options( routine, o );

  if( _.strIs( o.alias ) )
  o.alias = [ o.alias ];
  else if( o.alias === null )
  o.alias = [];

  _.assert( _.arrayIs( o.alias ) );
  _.assert( _.strIs( o.name ) );
  _.assert( _.mapIs( o ) );
  _.assert( o.files === undefined );

  return o;
}

//

function predeclare_body( o )
{

  _.assert( !_.module.predeclaredWithNameMap.has( o.name ), () => `Module ${o.name} was already predeclared` );
  _.arrayPrependOnce( o.alias, o.name );
  o.entryPath = _.arrayAs( o.entryPath );
  o.files = null;

  if( Config.debug )
  for( let i = 0 ; i < o.entryPath.length ; i++ )
  {
    let entryPath = o.entryPath[ i ];
    let was = _.module.predeclaredWithEntryPathMap.get( entryPath );
    _.assert
    (
      !was || was === o, () => `Module ${o.name} is trying to register entry path registered by module ${was.name}\nEntry path : ${entryPath}`
    );
    _.assert( _.strDefined( entryPath ), `Expects string, but got ${_.entity.strType( entryPath )}` ); /* xxx : rename strType() */
  }

  for( let i = 0 ; i < o.entryPath.length ; i++ )
  {
    let entryPath = o.entryPath[ i ];
    if( _.path.isDotted( entryPath ) )
    {
      _.assert( _.strDefined( o.basePath ), '{-o.basePath-} is required if path is relative' );
      entryPath = o.entryPath[ i ] = _.path.canonize( o.basePath + '/' + entryPath );
    }
    else
    {
      let normalized = _.path.canonize( entryPath );
      if( _.path.isAbsolute( normalized ) )
      entryPath = o.entryPath[ i ] = normalized;
    }
    _.module.predeclaredWithEntryPathMap.set( entryPath, o );
  }

  _.assert( o.filePath === null );
  o.filePath = o.filePath || [];
  _.arrayAppendArray( o.filePath, o.entryPath );
  _.assert( o.lookPath === undefined );
  o.lookPath = [ ... o.entryPath, ... o.alias ];
  /* xxx : set? */

  o.alias.forEach( ( name ) => _.module.predeclaredWithNameMap.set( name, o ) );

  delete o.basePath;
  o.status = 0;
  Object.setPrototypeOf( o, _.module.Module.prototype );
  Object.preventExtensions( o );

  for( let i = 0 ; i < o.entryPath.length ; i++ )
  {
    let filePath = o.entryPath[ i ];
    let file = _.module.filesMap.get( filePath );
    if( file )
    _.module._filesUniversalAssociateModule( file, o, true );
  }

  return o;
}

predeclare_body.defaults =
{
  name : null,
  alias : null,
  entryPath : null,
  filePath : null,
  basePath : null,
  isIncluded : null,
}

const predeclare = _.routine.unite( predeclare_head, predeclare_body );

//

/* xxx : cover */
function _with( name )
{
  let module = _.module.withName( name );
  if( module )
  return module;
  module = _.module.withPath( name );
  return module;
}

//

/* xxx : cover */
function withName( name )
{
  let module = _.module.modulesMap.get( name );
  if( !module )
  return null;
  return module;
}

//

/* xxx : cover */
function withPath( filePath )
{
  let normalizedPath = _.path.canonize( filePath );
  let file = _.module.filesMap.get( normalizedPath );
  if( !file )
  return null;
  return file.module;
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
    delete o.modules[ k ];
  }

}

predeclareAll.defaults =
{
  modules : null,
  basePath : null,
}

// --
// file
// --

/* qqq xxx : cover */
function fileIs( src )
{
  if( !src )
  return false;
  if( !src.constructor )
  return false;
  if( src.constructor.name === 'ModuleFile' );
  return true;
  if( src instanceof ModuleFileNative );
  return true;
  return false;
}

//

function _fileUniversalFrom( o )
{
  try
  {

    o.sourcePath = _.path.canonize( o.sourcePath );

    let moduleFile2 = _.module.filesMap.get( o.sourcePath );
    if( moduleFile2 )
    {
      debugger;
      return moduleFile2;
    }

    if( Config.debug )
    verify();

    o.moduleNativeFile.moduleUniveralFile = o;
    Object.setPrototypeOf( o, _.module.File.prototype );
    _.module.filesMap.set( o.sourcePath, o );

    o.moduleNativeFilesMap = o.moduleNativeFilesMap || _.module.nativeFilesMap;
    o.global = o.global || _global;
    o.error = o.error || null;

    pathsAmend();
    modulesAssociate();
    filesAssociate();

    if( Config.debug )
    validate();

    Object.preventExtensions( o );
    return o;
  }
  catch( err )
  {
    err = _.err( err, `\nError in _.module._fileUniversalFrom of ${o.sourcePath}` );
    throw err;
  }

  /* -

  verify,
  pathsAmend,
  filesAssociate,
  modulesAssociate,
  validate,

  */

  function verify()
  {
    _.assert( o.module === undefined );
    _.assert( o.modules === undefined );
    _.assert( o.downFile === undefined );
    _.assert( o.upFiles === undefined );
    _.assert( _.module.fileNativeIs( o.moduleNativeFile ) );
    _.assert( o.moduleNativeFile.moduleUniveralFile === undefined );
    _.assert( !o.moduleNativeFile.moduleUniveralFile );
    _.assert( !o.moduleNativeFile.moduleNativeFilesMap );
    _.assert
    (
      _.module.nativeFilesMap[ _.path.nativize( o.sourcePath ) ] === o.moduleNativeFile,
      `Module file ${o.sourcePath} is not in the current module files list`
    );
  }

  /* - */

  function pathsAmend()
  {
    if( _.module._prependPath || _.module._appendPath )
    debugger;
    if( _.module._prependPath )
    _.arrayPrependArrayOnce( o.moduleNativeFile.paths, _.module._prependPath );
    if( _.module._appendPath )
    _.arrayAppendArrayOnce( o.moduleNativeFile.paths, _.module._appendPath );
  }

  /* - */

  function filesAssociate()
  {
/*
o.moduleNativeFile.id - "/pro/builder/proto/wtools/atop/testing/include/Base.s"
o.moduleNativeFile.parent.id - "/pro/builder/proto/wtools/atop/testing/include/Top.s"
xxx : test to check the parent has the child and the child has the parent
*/

    o.downFiles = new Set;

    if( o.moduleNativeFile.parent && o.moduleNativeFile.parent.moduleUniveralFile )
    {
      _.module._fileUniversalAssociateFile( o, o.moduleNativeFile.parent.moduleUniveralFile );
    }
    else
    {
      o.downFile = null;
    }

    o.upFiles = [];

    // o.moduleNativeFile.id -- "/pro/builder/proto/wtools/atop/testing/include/Top.s"
    // xxx : test to check the module file has universal file for each children
    o.moduleNativeFile.children.forEach( ( file, index ) =>
    {
      if( file.moduleUniveralFile )
      {
        // o.upFiles[ index ] = file.moduleUniveralFile; /* xxx : rename? */
        _.module._fileUniversalAssociateFile( file.moduleUniveralFile, o );
      }
    });

  }

  /* - */

  function modulesAssociate()
  {

    _.assert( o.module === undefined );
    _.assert( o.modules === undefined );

    o.module = null;
    o.modules = new Set();

    let predeclaredModule = _.module.predeclaredWithEntryPathMap.get( o.sourcePath );
    if( predeclaredModule )
    {
      _.module._fileUniversalAssociateModule( o, predeclaredModule );
    }

    if( !predeclaredModule )
    if( o.requestedSourcePath === null || _.path.isRelative( o.requestedSourcePath ) )
    {

      let parentModules;
      if
      (
        o.moduleNativeFile.parent
        && o.moduleNativeFile.parent.moduleUniveralFile
        && o.moduleNativeFilesMap === o.moduleNativeFile.parent.moduleUniveralFile.moduleNativeFilesMap
        && o.moduleNativeFile.parent.moduleUniveralFile.module
      )
      {
        _.assert( !!_.module.is( o.moduleNativeFile.parent.moduleUniveralFile.module ) );
        _.assert( o.moduleNativeFile.parent.moduleUniveralFile.module instanceof _.module.Module );
        _.assert( _.set.is( o.moduleNativeFile.parent.moduleUniveralFile.modules ) );
        parentModules = o.moduleNativeFile.parent.moduleUniveralFile.modules;
        _.assert( parentModules.size > 0 );
        _.module._fileUniversalAssociateModule( o, parentModules );
      }

    }

    /* xxx : non-entry file could be in both modules in case parentModule has the file predefined. cover */

  }

  /* - */

  function validate()
  {
    /* xxx : cover */
    _.assert( o instanceof _.module.File );
    _.assert( _.module.fileIs( o ) );
    _.assert( _.module.fileUniversalIs( o ) );
    _.assert( o.module !== undefined );
  }

  /* - */

}

_fileUniversalFrom.defaults =
{
  sourcePath : null,
  requestedSourcePath : null,
  moduleNativeFile : null,
  moduleNativeFilesMap : null,
  error : null,
  global : null,
  status : null,
}

//

function _filesUniversalFrom( o )
{
  let visited = new Set;
  let stack = [];

  _.routine.options( _filesUniversalFrom, o );
  o.files = _.arrayAs( o.files );
  stack.push( ... o.files );

  for( let i = 0 ; i < stack.length ; i++ )
  up( stack[ i ] );

  while( stack.length )
  down( stack.pop() );

  return visited;

  function up( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    stack.push( ... file.children );

    _.assert( _.module.fileNativeIs( file ) );

    if( !file.moduleUniveralFile && _.module.nativeFilesMap[ file.filename || file.id ] === file )
    _.module._fileUniversalFrom
    ({
      sourcePath : file.filename || file.id,
      requestedSourcePath : null,
      moduleNativeFile : file,
      status : 2,
    });

  }

  function down( file )
  {

    if( file.moduleUniveralFile )
    file.children.forEach( ( file2, index ) =>
    {
      if( file2.moduleUniveralFile )
      {
        _.module._fileUniversalAssociateFile( file2.moduleUniveralFile, file.moduleUniveralFile );
        if( file.moduleUniveralFile.moduleNativeFilesMap === _.module.nativeFilesMap && file.moduleUniveralFile.module )
        _.module._filesUniversalAssociateModule( file2.moduleUniveralFile, file.moduleUniveralFile.module, false );
      }
    });

  }

}

_filesUniversalFrom.defaults =
{
  files : null,
}

//

function _fileUniversalAssociateFile( upFile, downFile )
{

  /*
  files could belong to different environments
  */

  _.assert( _.module.fileUniversalIs( upFile ) );
  _.assert( _.module.fileUniversalIs( downFile) );

  upFile.downFile = upFile.downFile || downFile;
  upFile.downFiles.add( downFile );
  let index = downFile.moduleNativeFile.children.indexOf( upFile.moduleNativeFile );
  _.assert( index >= 0 );
  _.assert( downFile.upFiles[ index ] === undefined || downFile.upFiles[ index ] === upFile );
  downFile.upFiles[ index ] = upFile;

}

//

function _fileUniversalAssociateModule( file, module )
{
  let result = 0;

  if( Config.debug )
  {
    _.assert( arguments.length === 2 );
    let module2 = _.module.predeclaredWithEntryPathMap.get( file.sourcePath );
    _.assert
    (
      module2 === undefined || module2 === module,
      () => `Attempt to associate ${file} with ${module}, but it is entry of ${module2}`
    );
  }

  if( _.set.is( module ) )
  {
    module.forEach( ( module ) => result += _.module._fileUniversalAssociateModule( file, module ) );
    return result;
  }

  _.assert( _.module.fileUniversalIs( file ) );
  _.assert( _.module.is( module ) );

  file.modules.add( module );
  file.module = file.module || module;

  result += 1;

  module.files = module.files || new HashMap();
  module.files.set( file.sourcePath, file );
  module.alias.forEach( ( name ) =>
  {
    if( Config.debug )
    {
      let module2 = _.module.modulesMap.get( name );
      _.assert( module2 === undefined || module2 === module );
    }
    _.module.modulesMap.set( name, module );
  });

  return result;
}

//

function _fileUniversalDisassociateModules( file, reassociating )
{
  let result = 0;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.module.fileUniversalIs( file ) );

  let modules2 = _.module.predeclaredWithEntryPathMap.get( file.sourcePath );
  _.assert
  (
    modules2 === undefined || modules2 !== file.module,
    `Cant disassociate ${modules2} with ${file} because the file is entry of the module.`
  );

  result += file.modules.size;

  if( !file.modules.size )
  return result;

  if( reassociating )
  reassociate();
  else
  deassociate();

  return result;

  function moduleDisassociate( module )
  {
    module.files.delete( file.sourcePath );
    if( module.files.size === 0 )
    debugger;
    if( module.files.size === 0 )
    module.alias.forEach( ( name ) =>
    {
      debugger; /* xxx : cover */
      _.module.modulesMap.delete( name );
    });
  }

  // function moduleReassociate( module, downModules )
  // {
  //
  //   module.files.delete( file.sourcePath );
  //   if( module.files.size === 0 )
  //   debugger;
  //   if( module.files.size === 0 )
  //   module.alias.forEach( ( name ) =>
  //   {
  //     debugger; /* xxx : cover */
  //     _.module.modulesMap.delete( name );
  //   });
  // }

  function deassociate()
  {
    file.modules.forEach( ( module ) => moduleDisassociate( module ) );
    file.modules.clear();
    file.module = null;
  }

  function reassociate()
  {
    let downModules = new Set();

    file.downFiles.forEach( ( file2 ) => downModules.add( ... file2.modules ) );

    file.modules.forEach( ( module ) =>
    {
      if( !downModules.has( module ) )
      {
        moduleDisassociate( module, downModules );
        file.modules.delete( module );
        if( module === file.module )
        file.module = null;
      }
    });

    if( file.module = null && file.modules.size > 0 )
    {
      debugger; /* xxx : cover */
      file.module = [ ... file.modules ][ 0 ];
    }

  }

}

//

function _filesUniversalAssociateModule( files, modules, disassociating )
{
  let visited = new Set;
  let stack = [];

  files = _.arrayAs( files );
  stack.push( ... files );

  // if( files[ 0 ] && _.strEnds( files[ 0 ].sourcePath, '/Tools.s' ) )
  // debugger;

  if( disassociating )
  files.forEach( ( file ) => _.module._fileUniversalDisassociateModules( file, false ) );

  if( Config.debug )
  {
    _.assert( _.module.is( modules ) || _.set.is( modules ) );
    if( _.set.is( modules ) )
    modules.forEach( ( module ) => _.assert( _.module.is( module ) ) );
  }

  if( _.set.is( modules ) )
  {
    while( stack.length )
    modulesAssociate( stack.pop() );
  }
  else
  {
    while( stack.length )
    moduleAssociate( stack.pop() );
  }

  return visited;

  /* - */

  function modulesAssociate( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    _.assert( _.module.fileUniversalIs( file ) );
    _.assert( _.arrayIs( file.upFiles ) );
    _.assert( file.moduleNativeFilesMap === _.module.nativeFilesMap );

    if( file.moduleNativeFilesMap !== _.module.nativeFilesMap )
    {
      _.assert( 0, 'not tested' ); /* xxx */
      return;
    }

    let module2 = _.module.predeclaredWithEntryPathMap.get( file.sourcePath );
    if( module2 && !modules.has( module2 ) )
    return;
    if( module2 && modules.size > 1 )
    _.assert( 0, 'not tested' ); /* xxx qqq : cover and fix */

    if( _.set.identicalShallow( file.modules, modules ) )
    return;

    if( disassociating )
    _.module._fileUniversalDisassociateModules( file, true );

    modules.forEach( ( module ) => singleAssociate( file, module ) );
  }

  /* - */

  function moduleAssociate( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    let module = modules;

    _.assert( _.module.fileUniversalIs( file ) );
    _.assert( _.arrayIs( file.upFiles ) );

    if( file.moduleNativeFilesMap !== _.module.nativeFilesMap )
    return;

    let module2 = _.module.predeclaredWithEntryPathMap.get( file.sourcePath );
    if( module2 && module2 !== module )
    return;

    if( file.modules.has( module ) )
    {
      if( file.modules.size === 1 || !disassociating )
      return;
    }

    if( disassociating )
    _.module._fileUniversalDisassociateModules( file, true );

    singleAssociate( file, module );
  }

  /* - */

  function singleAssociate( file, module )
  {

    for( let i = file.upFiles.length-1 ; i >= 0 ; i-- )
    {
      let file2 = file.upFiles[ i ];
      if( file2 === undefined )
      continue;
      stack.push( file2 );
    }

    _.module._fileUniversalAssociateModule( file, module );
  }

  /* - */

}

//

function _fileWithResolvedPath( caninicalSourcePath )
{
  var result = _.module.filesMap.get( caninicalSourcePath );
  return result;
}

//

function fileWithResolvedPath( sourcePath )
{
  var result = _.module.filesMap.get( _.path.canonize( sourcePath ) );
  return result;
}

//

function fileWith( relativeSourcePath )
{

  let absoluteSourcePath = relativeSourcePath;
  if( _.path.isDotted( relativeSourcePath ) )
  {
    /* xxx : qqq : optimize _.introspector.location({ level : 1 }).filePath */
    /* xxx : qqq : optimize _.path.dir( _.introspector.location({ level : 1 }).filePath ) */
    let basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );
    absoluteSourcePath = _.path.canonize( basePath + '/' + absoluteSourcePath );
  }
  else
  {
    absoluteSourcePath = _.path.canonize( absoluteSourcePath );
  }

  let moduleFile = _.module._fileWithResolvedPath( absoluteSourcePath );
  return moduleFile;
}

// --
// file path
// --

/* xxx : qqq : for Yevhen : introduce and cover _.module.fileNativeIs() */
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
  _.routine.options( filePathAmend, o );

  if( _.path.nativize && _.path.canonize )
  {
    for( var p = 0 ; p < o.paths.length ; p++ )
    {
      o.paths[ p ] = _.path.nativize( _.path.canonize( o.paths[ p ] ) );
      console.log( 'usePathGlobally', o.paths[ p ] );
    }
  }

  return o;
}

//

function pathAmend_body( o )
{
  const ModuleFileNative = require( 'module' );

  if( o.moduleFile )
  if( typeof _ !== 'undefined' )
  o.moduleFile = _.module.fileNativeFrom( o.moduleFile );

  let filePathAmend = o.amending === 'prepend' ? pathsPrependOnce : pathsAppendOnce;

  if( o.globally )
  filePathAmend( ModuleFileNative.globalPaths, o.paths );

  if( o.locally && o.moduleFile )
  filePathAmend( o.moduleFile.paths, o.paths );

  if( o.locally && o.permanent )
  {
    if( o.amending === 'prepend' )
    _.module._prependPath = _.arrayPrependArray( _.module._prependPath, o.paths );
    if( o.amending === 'append' )
    _.module._appendPath = _.arrayAppendArray( _.module._appendPath, o.paths );
  }

  if( o.locally && o.recursive && o.moduleFile )
  return _root( o.moduleFile, o.paths, new Set );

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

    filePathAmend( _module.paths, paths );

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

    filePathAmend( _module.paths, paths );

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

let filePathAmend = _.routine.unite( path_head, pathAmend_body );

//

function pathRemove_body( o )
{
  const ModuleFileNative = require( 'module' );

  if( o.moduleFile )
  o.moduleFile = _.module.fileNativeFrom( o.moduleFile );

  if( o.globally )
  remove( ModuleFileNative.globalPaths, o.paths );

  if( o.locally && o.moduleFile )
  remove( o.moduleFile.paths, o.paths );

  if( o.locally && o.permanent )
  {
    if( _.module._prependPath )
    remove( _.module._prependPath, o.paths );
    if( _.module._appendPath )
    remove( _.module._appendPath, o.paths );
  }

  if( o.locally && o.recursive && o.moduleFile )
  return _root( o.moduleFile, o.paths, new Set );

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
  moduleFile : null,
  paths : null,
  permanent : 0,
  globally : 1,
  locally : 0,
  recursive : 2,
  amending : 'append',
}

let filePathRemove = _.routine.unite( path_head, pathRemove_body );

//

function filePathGet( o )
{
  const ModuleFileNative = require( 'module' );
  let result = [];

  if( o.moduleFile )
  o.moduleFile = _.module.fileNativeFrom( o.moduleFile );

  _.assert( arguments.length === 0 || arguments.length === 1 );
  o = _.routine.options( filePathGet, o );
  o.moduleFile = o.moduleFile || module;

  if( o.globally )
  {
    _.assert( _.arrayIs( ModuleFileNative.globalPaths ) );
    result.push( ... ModuleFileNative.globalPaths );
  }

  if( o.locally )
  {
    _.assert( _.arrayIs( o.moduleFile.paths ) );
    result.push( ... o.moduleFile.paths );
  }

  return result;
}

filePathGet.defaults =
{
  moduleFile : null,
  globally : 1,
  locally : 0,
}

// --
//
// --

// function _resolve( moduleName )
// {
//   let basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );
//
//   if( arguments.length > 1 )
//   {
//     let result = [];
//     /* qqq xxx : optimize for relase build */
//
//     for( let a = 0 ; a < arguments.length ; a++ )
//     {
//       let moduleName = arguments[ a ];
//
//       if( moduleName === _.optional )
//       continue;
//
//       debugger;
//       let r = _.module._resolveFirst
//       ({
//         moduleNames : [ moduleName ],
//         basePath,
//         throwing : 0,
//       });
//       if( r !== undefined )
//       result.push( r );
//     }
//
//     return result;
//   }
//
//   return _.module._resolveFirst
//   ({
//     moduleNames : moduleName,
//     basePath,
//     throwing : 0,
//   });
// }

//

function _resolve( basePath, downPath, moduleName )
{

  if( _.arrayLike( moduleName ) )
  {
    // if( moduleName.length === 1 )
    // {
    //   moduleName = moduleName[ 0 ];
    // }
    // else
    {
      let result = [];
      for( let a = 0 ; a < moduleName.length ; a++ )
      {
        let r = _.module._resolve( basePath, downPath, moduleName[ a ] );
        if( r !== undefined )
        result[ a ] = r;
      }
      return result;
    }
  }

  if( moduleName === _.optional )
  return;

  let r = _.module._resolveFirst
  ({
    moduleNames : [ moduleName ],
    downPath,
    basePath,
    throwing : 1,
  });

  return r;
}

//

function resolve( moduleName )
{
  let downPath = _.introspector.location({ level : 1 }).filePath;
  let basePath = _.path.dir( downPath );
  /* qqq zzz : optimize for relase build for utility::starter */
  let result = _.module._resolve( basePath, downPath, arguments );
  _.assert( _.arrayIs( result ) );
  if( result.length === 1 )
  return result[ 0 ];
  return result;
}

//

function _resolveFirst( o )
{

  if( !_.mapIs( o ) )
  o = { moduleNames : arguments }
  _.routine.options( _resolveFirst, o );

  _.assert( _.strDefined( o.downPath ) );
  _.assert( _.strDefined( o.basePath ) );
  // if( o.basePath === null )
  // o.basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );

  let sourcePaths = this._moduleNamesToPaths( o.moduleNames );
  let resolved = this._fileResolve({ sourcePaths, basePath : o.basePath, downPath : o.downPath });

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
  downPath : null,
  basePath : null,
  throwing : 0,
}

//

function resolveFirst()
{
  let downPath = _.introspector.location({ level : 1 }).filePath;
  let basePath = _.path.dir( downPath );
  return _.module._resolveFirst
  ({
    moduleNames : arguments,
    basePath,
    downPath,
  });
}

//

function _fileResolve( o )
{
  let result = [];

  if( !_.mapIs( arguments[ 0 ] ) )
  o = { sourcePaths : arguments[ 0 ] }

  // let moduleNativeFile = ModuleFileNative._cache[ _.path.nativize( o.downPath ) ]; /* xxx : use file map */
  let moduleNativeFile = _.module.nativeFilesMap[ _.path.nativize( o.downPath ) ];

  _.routine.options( _fileResolve, o );
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( o.sourcePaths ) );
  _.strDefined( o.downPath );
  _.strDefined( o.basePath );
  _.assert( !!moduleNativeFile );

  for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  {
    let sourcePath = o.sourcePaths[ a ];
    let resolved;

    /* xxx : not optimal */
    try
    {
      if( sourcePath === 'module1' )
      debugger;
      // resolved = _.module.__fileNativeInclude.resolve( _.path.nativize( sourcePath ) );
      resolved = ModuleFileNative._resolveFilename( _.path.nativize( sourcePath ), moduleNativeFile, false, undefined );
    }
    catch( err )
    {
      continue;
    }

    result.push( resolved );
    if( !o.all )
    return result[ 0 ];
  }

  /* xxx : remove later */
  if( o.basePath )
  {
    o.basePath = _.path.canonize( o.basePath );
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
      let filePath = _.path.nativize( _.path.canonize( o.basePath + '/' + sourcePath ) );
      // resolved = _.module.__fileNativeInclude.resolve( filePath );
      resolved = ModuleFileNative._resolveFilename( filePath, moduleNativeFile, false, undefined );
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

_fileResolve.defaults =
{
  sourcePaths : null,
  downPath : null,
  basePath : null,
  all : 0,
}

//

function _moduleNamesToPaths( names )
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
    var descriptor = _.module.predeclaredWithNameMap.get( src );
    if( descriptor )
    {
      _.assert( _.longIs( descriptor.lookPath ) );
      _.arrayAppendArray( result, descriptor.lookPath );
    }
    else
    {
      result.push( src );
    }
  }

  return result;
}

//

function toolsPathGet()
{
  return _.path.canonize( __dirname + '/../../../../wtools/Tools.s' );
}

// --
// include
// --

function _fileIncludeSingle( downPath, filePath )
{
  _.assert( arguments.length === 2 );
  _.assert( _.strIs( filePath ), 'Expects string' );

  if( !hasModuleFileDescriptor )
  throw _.err( 'Cant include, routine "require" does not exist.' );

  let normalizedPath = _.path.nativize( filePath );
  // let downPath = _.introspector.location({ level : 2 }).filePath;
  let moduleFile = _.module._fileWithResolvedPath( downPath );
  if( moduleFile )
  return moduleFile.moduleNativeFile.require( normalizedPath );
  return _.module.__fileNativeInclude( normalizedPath );

  // if( typeof module !== 'undefined' )
  // return _.module.__fileNativeInclude( _.path.nativize( src ) );
  // else
  // throw _.err( 'Cant include, routine "require" does not exist.' );

}

//

/* xxx : implement _.path._dir */
/* xxx : qqq : optimize _.path.dir */

function include()
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( arguments[ 0 ] ) );

  let downPath = _.introspector.location({ level : 1 }).filePath;
  let basePath = _.path.dir( downPath );
  let resolved = _.module._resolve( basePath, downPath, arguments );
  if( resolved.length === 1 )
  {
    return _.module._fileIncludeSingle( downPath, resolved[ 0 ] );
  }
  else
  {
    debugger;
    let result = [];
    for( let i = 0 ; i < resolved.length ; i++ )
    result[ i ] = _.module._fileIncludeSingle( downPath, resolved[ i ] );
    return result;
  }

}

//

function includeFirst()
{
  // let basePath = _.introspector.location({ level : 1 }).filePath;
  let downPath = _.introspector.location({ level : 1 }).filePath;
  let basePath = _.path.dir( downPath );
  let resolved = _.module._resolveFirst
  ({
    basePath,
    downPath,
    moduleNames : arguments,
  });
  if( resolved )
  {
    return _.module._fileIncludeSingle( downPath, resolved );
  }
}

//

/* zzz : reimplement */
function isIncluded( src )
{
  if( _.module.modulesMap.has( src ) )
  return true;
  return false;
}

// function isIncluded( src )
// {
//   var descriptor = _.module.predeclaredWithNameMap.get( src );
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

// --
// setup
// --

function _trackingEnable()
{

  const ModuleFileNative = require( 'module' );
  const NjsResolveFilename = ModuleFileNative._resolveFilename;
  const NjsLoad1 = ModuleFileNative._load;
  const NjsLoad2 = ModuleFileNative.prototype.load;

  const resolving = Object.create( null );
  resolving.request = null;
  resolving.parent = null;
  resolving.resolvedPath = null;

  const loading = Object.create( null );
  loading.request = null;
  loading.parent = null;
  loading.childrenLength = null;
  loading.counter = 0;

  _.assert( _.routineIs( NjsResolveFilename ) );
  _.assert( _.routineIs( NjsLoad1 ) );
  _.assert( _.routineIs( NjsLoad2 ) );

  ModuleFileNative._resolveFilename = _resolveFilename;

  if( _global === _realGlobal_ )
  ModuleFileNative._load = _loadEnvironment;

  ModuleFileNative.prototype.load = moduleFileLoad;

  /* */

  function _resolveFilename( /* request, parent, isMain, options */ )
  {
    let request = arguments[ 0 ];
    let parent = arguments[ 1 ];
    let isMain = arguments[ 2 ];
    let options = arguments[ 3 ];
    if( resolving.parent === parent && resolving.request === request )
    return resolving.resolvedPath;
    resolving.resolvedPath = NjsResolveFilename.apply( this, arguments );
    resolving.request = request;
    resolving.parent = parent;
    return resolving.resolvedPath;
  }

  /* - */

  function _loadModuling( request, parent, isMain )
  {
    let result;
    const counter = loading.counter;

    loading.request = request;
    loading.parent = parent;
    loading.childrenLength = parent.children.length;

    try
    {
      result = NjsLoad1.apply( this, arguments );
    }
    finally
    {
      try
      {
        if( loading.counter === counter )
        second( request, parent );
      }
      finally
      {
        loading.request = null;
        loading.parent = null;
      }
    }

    return result;
  }

  /* - */

  function second( request, parent )
  {

    if( !parent.moduleUniveralFile )
    return;
    if( parent.moduleUniveralFile.moduleNativeFilesMap !== _.module.nativeFilesMap )
    return;
    if( parent.moduleUniveralFile.moduleNativeFilesMap !== ModuleFileNative._cache )
    return;
    if( !_.path.isDotted( request ) )
    return;

    let moduleNativeFile;
    if( loading.request === request && loading.parent === parent )
    {
      _.assert( loading.childrenLength === parent.children.length || loading.childrenLength + 1 === parent.children.length );
      if( loading.childrenLength === parent.children.length )
      return;
      else
      moduleNativeFile = parent.children[ parent.children.length - 1 ];
    }
    else
    {
      debugger; /* xxx : cover */
      let resolvedPath = _resolveFilename( request, parent, false );
      moduleNativeFile = ModuleFileNative._cache[ resolvedPath ];
      _.assert( !!moduleNativeFile.parent );
    }

    if( moduleNativeFile.parent !== parent )
    {
      _.module._fileUniversalAssociateFile( moduleNativeFile.moduleUniveralFile, parent.moduleUniveralFile );
      _.module._filesUniversalAssociateModule( moduleNativeFile.moduleUniveralFile, parent.moduleUniveralFile.modules );
    }
  }

  /* - */

  function _loadEnvironment( request, parent, isMain )
  {
    let result;
    const originalModuleNativeFiles = ModuleFileNative._cache;
    const originalGlobal = _realGlobal_._global_;

    if( parent._virtualEnvironment )
    {
      if( parent._virtualEnvironment.moduleNativeFilesMap )
      ModuleFileNative._cache = parent._virtualEnvironment.moduleNativeFilesMap;
      if( parent._virtualEnvironment.global )
      _realGlobal_._global_ = parent._virtualEnvironment.global;
    }
    else if( parent.moduleUniveralFile )
    {
      if( parent.moduleUniveralFile.moduleNativeFilesMap )
      ModuleFileNative._cache = parent.moduleUniveralFile.moduleNativeFilesMap;
      if( parent.moduleUniveralFile.global )
      _realGlobal_._global_ = parent.moduleUniveralFile.global;
    }

    try
    {
      result = _loadModuling.apply( this, arguments );
    }
    catch( err )
    {
      let error;
      if( parent && parent.filename )
      error = _.err( err, `\nModule file "${parent.filename}" failed to include "${request}"` );
      else
      error = _.err( err, `\nFailed to include "${request}"` );
      throw error;
    }
    finally
    {
      ModuleFileNative._cache = originalModuleNativeFiles;
      _realGlobal_._global_ = originalGlobal;
    }

    return result;
  }

  /* - */

  function moduleFileLoad( sourcePath )
  {

    loading.counter += 1;

    /*
    ignore includes of other global namespaces
    */
    if( _.module.nativeFilesMap !== ModuleFileNative._cache )
    {
      return NjsLoad2.apply( this, arguments );
    }

    let result;
    let moduleNativeFile = this
    let moduleFile = _.module._fileUniversalFrom
    ({
      sourcePath,
      requestedSourcePath : resolving.request,
      moduleNativeFile,
      status : 1,
    });

    _.assert( moduleNativeFile === moduleFile.moduleNativeFile );
    _.assert( moduleNativeFile === ModuleFileNative._cache[ moduleFile.sourcePath ] ); /* xxx : introduce nativeSourcePath */
    _.assert( resolving.resolvedPath === sourcePath );

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
      _.assert( Object.is( moduleFile.returned, moduleNativeFile.exports ) );
    }

    return result;
  }

}

//

function _Setup()
{

  if( _.module._modulesToPredeclare )
  _.module.predeclareAll({ modules : _.module._modulesToPredeclare, basePath : __dirname });

  if( typeof require === 'undefined' )
  return;

  _.module.rootFile = module;
  while( _.module.rootFile.parent )
  _.module.rootFile = _.module.rootFile.parent; /* xxx : use universal file? */

  if( !ModuleFileNative )
  ModuleFileNative = require( 'module' );

  _.module.nativeFilesMap = ModuleFileNative._cache;

  if( _.module._setupRequireDone )
  return;
  _.module._setupRequireDone = 1;

  // /* qqq xxx : remove that if-return branch */
  // if( _global_.Config.interpreter === 'browser' )
  // return;

  _.module._trackingEnable();
  _.module._filesUniversalFrom({ files : [ _.module.rootFile ] });

}

// --
// Module
// --

function Module()
{
  _.assert( 0, 'not implemented' );
  if( arguments.length !== 0 )
  throw new Error( 'Expects no arguments' );
  _.assert( this instanceof Module );
  return this;
}

_.class.declareBasic
({
  constructor : Module,
  exportString : moduleExportString,
});

// --
// Module File
// --

function ModuleFile()
{
  _.assert( 0, 'not implemented' );
  if( arguments.length !== 0 )
  throw new Error( 'Expects no arguments' );
  _.assert( this instanceof ModuleFile );
  return this;
}

_.class.declareBasic
({
  constructor : ModuleFile,
  exportString : moduleFileExportString,
});

/* xxx : qqq : for Yevhen : cover */
Object.defineProperty( ModuleFile.prototype, 'returned',
{
  enumerable : true,
  configurable : true,
  get : moduleFileReturnedGet,
  // set : _returnedSet, /* zzz : uncomment later */
});

// Object.defineProperty( ModuleFile.prototype, 'upFiles',
// {
//   enumerable : true,
//   configurable : true,
//   get : moduleFileNodesGet,
// });
//
// Object.defineProperty( ModuleFile.prototype, 'downFile',
// {
//   enumerable : true,
//   configurable : true,
//   get : moduleFileDownGet,
// });

// --
// extend namespaces
// --

var ToolsExtension =
{
  include,
  includeFirst,
}

/* xxx : move to l3 and l5 */
var ModuleExtension =
{

  // module

  is,
  with : _with,
  withName,
  withPath,
  predeclare,
  predeclareAll,

  // file

  fileIs,
  fileNativeIs : __.module.fileNativeIs,
  fileUniversalIs : __.module.fileUniversalIs,
  fileNativeFrom : __.module.fileNativeFrom,
  _fileUniversalFrom,
  _filesUniversalFrom,
  _fileUniversalAssociateFile,
  _fileUniversalAssociateModule,
  _fileUniversalDisassociateModules,
  _filesUniversalAssociateModule,
  _fileWithResolvedPath,
  fileWithResolvedPath,
  fileWith,

  // file path

  filePathAmend,
  filePathRemove,
  filePathGet,

  // resolve

  _resolve,
  resolve,
  _resolveFirst,
  resolveFirst,
  _fileResolve,

  _moduleNamesToPaths,
  toolsPathGet,

  // include

  _fileIncludeSingle,

  include,
  includeFirst,

  isIncluded,

  // setup

  _trackingEnable,
  /* qqq : implement and cover routine _trackingDisable */
  _Setup,

  // fields

  Module,
  File : ModuleFile,
  __fileNativeInclude,
  _prependPath : null,
  _appendPath : null,
  rootFile : null,
  predeclaredWithNameMap : new HashMap,
  predeclaredWithEntryPathMap : new HashMap,
  modulesMap : new HashMap,
  filesMap : new HashMap,
  _setupRequireDone : null,

}

_.mapSupplement( _.module, ModuleExtension );
_.mapSupplement( _, ToolsExtension );
_.module._Setup();

})();
