
( function _library_() { // begin of library

( function _StarterWare_() { // begin of starterware

  // --
  // own
  // --

  

  let _global = undefined;
  if( !_global && typeof Global !== 'undefined' && Global.Global === Global ) _global = Global;
  if( !_global && typeof global !== 'undefined' && global.global === global ) _global = global;
  if( !_global && typeof window !== 'undefined' && window.window === window ) _global = window;
  if( !_global && typeof self   !== 'undefined' && self.self === self ) _global = self;
  let _realGlobal = _global._realGlobal_ = _global;
  let _wasGlobal = _global._global_ || _global;
  _global = _wasGlobal;
  _global._global_ = _wasGlobal;

  if( !_global_.Config )
  _global_.Config = {}
  if( _global_.Config.platform === undefined )
  _global_.Config.platform = ( ( typeof module !== 'undefined' ) && ( typeof process !== 'undefined' ) ) ? 'nodejs' : 'browser';
  if( _global_.Config.isWorker === undefined )
  _global_.Config.isWorker = !!( typeof self !== 'undefined' && self.self === self && typeof importScripts !== 'undefined' );

  if( _global._starter_ )
  return;

  let _nodejsInclude = require;
  let _nodejsResolve = require.resolve;
  let _starter_ = _global._starter_ = _global._starter_ || Object.create( null );
  let _ = _starter_;
  let preloadedFilesMap = _starter_.preloadedFilesMap = _starter_.preloadedFilesMap || Object.create( null );
  let openedFilesMap = _starter_.openedFilesMap = _starter_.openedFilesMap || Object.create( null );
  let path = _starter_.path = _starter_.path || Object.create( null );

  //

  function ScriptFile( o )
  {
    if( !( this instanceof ScriptFile ) )
    return new ScriptFile( o );

    if( o.isScript === undefined )
    o.isScript = true;

    // o.filePath = _starter_._pathResolve( null, o.filePath );
    o.filePath = _starter_.path.canonizeTolerant( o.filePath );

    this.filePath = o.filePath;
    this.dirPath = o.dirPath;
    this.nakedCall = o.nakedCall;
    this.isScript = o.isScript;

    this.filename = o.filePath;
    this.exports = undefined;
    this.parent = null;
    this.error = null;
    this.state = o.nakedCall ? 'preloaded' : 'created';

    this.starter = _starter_;
    this.include = _starter_._fileInclude.bind( _starter_, this );
    this.resolve = _starter_._fileResolve.bind( _starter_, this );
    this.include.resolve = this.resolve;
    this.include.scriptFile = this;

    this._nodejsInclude = _nodejsInclude;
    this._nodejsResolve = _nodejsResolve;

    /* nodejs compatibility */

    this.path = [ '/' ];
    this.loaded = false;
    this.id = o.filePath;

    Object.preventExtensions( this );

    _starter_.preloadedFilesMap[ o.filePath ] = this;

    return this;
  }

  //

  function _pathResolve( scriptFile, filePath )
  {
    let basePath = null;
    if( _starter_.strIs( scriptFile ) )
    {
      basePath = scriptFile;
    }
    else if( scriptFile )
    {
      basePath = scriptFile.dirPath;
    }

    if( !basePath )
    {
      debugger;
      throw 'Base path is not specified';
    }

    filePath = _starter_.path.canonizeTolerant( filePath );
    if( filePath[ 0 ] !== '/' )
    filePath = _starter_.path.canonizeTolerant( basePath + '/' + filePath );
    return filePath;
  }

  //

  function _fileIncludeAct( parentScriptFile, childScriptFile )
  {
    try
    {

      if( childScriptFile.state === 'opened' )
      return childScriptFile.exports;

      childScriptFile.parent = parentScriptFile || null;
      childScriptFile.nakedCall.call( childScriptFile );
      childScriptFile.loaded = true;
      childScriptFile.state = 'opened';
      _starter_.openedFilesMap[ childScriptFile.filePath ] = childScriptFile;
    }
    catch( err )
    {
      err.message += '\nError including ' + childScriptFile.filePath;
      childScriptFile.error = err;
      childScriptFile.state = 'errored';
      throw err;
    }
    return childScriptFile.exports;
  }

  //

  function _fileInclude( parentScriptFile, filePath )
  {
    let childScriptFile = _starter_._fileGet.apply( this, arguments );

    let _nodejsInclude;
    if( _starter_.strIs( parentScriptFile ) )
    {
      _nodejsInclude = _starter_._nodejsInclude;
      parentScriptFile = null;
    }
    else if( parentScriptFile )
    {
      _nodejsInclude = parentScriptFile._nodejsInclude;
    }
    else
    {
      _nodejsInclude = _starter_._nodejsInclude;
    }

    if( !childScriptFile )
    return _nodejsInclude( filePath );
    if( _starter_.strIs( parentScriptFile ) )
    parentScriptFile = null;
    return _starter_._fileIncludeAct( parentScriptFile, childScriptFile );
  }

  //

  function _fileResolve( parentScriptFile, filePath )
  {
    let childScriptFile = _starter_._fileGet.apply( this, arguments );

    let _nodejsResolve;
    if( _starter_.strIs( parentScriptFile ) )
    {
      _nodejsResolve = _starter_._nodejsResolve;
      parentScriptFile = null;
    }
    else if( parentScriptFile )
    {
      _nodejsResolve = parentScriptFile._nodejsResolve;
    }
    else
    {
      _nodejsResolve = _starter_._nodejsResolve;
    }

    if( !childScriptFile )
    return _nodejsResolve( filePath );
    return childScriptFile.filePath;
  }

  //

  function _fileGet( parentScriptFile, filePath )
  {

    let basePath = null;
    if( _starter_.strIs( parentScriptFile ) )
    {
      basePath = parentScriptFile;
    }
    else if( parentScriptFile )
    {
      basePath = parentScriptFile.dirPath;
    }

    if( filePath[ 0 ] !== '.' )
    return null;

    resolvedFilePath = _starter_._pathResolve( basePath, filePath );
    let childScriptFile = _starter_.preloadedFilesMap[ resolvedFilePath ];
    if( childScriptFile )
    return childScriptFile;

    return null;
  }

  //

  function _fileCreate( filePath, dirPath, nakedCall )
  {
    let r = ScriptFile({ filePath, dirPath, nakedCall });
    return r;
  }

  //

  function assert()
  {
  }

  //

  function assertRoutineOptions()
  {
  }

;

  // --
  // imported
  // --

  _.strIs = function strIs( src )
  {
    let result = Object.prototype.toString.call( src ) === '[object String]';
    return result;
  };

//

  _._strBeginOf = function _strBeginOf( src, begin )
  {
  
    _.assert( _.strIs( src ), 'Expects string' );
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  
    if( _.strIs( begin ) )
    {
      if( src.lastIndexOf( begin, 0 ) === 0 )
      return begin;
    }
    else if( _.regexpIs( begin ) )
    {
      let matched = begin.exec( src );
      if( matched && matched.index === 0 )
      return matched[ 0 ];
    }
    else _.assert( 0, 'Expects string-like ( string or regexp )' );
  
    return false;
  };

//

  _._strEndOf = function _strEndOf( src, end )
  {
  
    _.assert( _.strIs( src ), 'Expects string' );
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  
    if( _.strIs( end ) )
    {
      if( src.indexOf( end, src.length - end.length ) !== -1 )
      return end;
    }
    else if( _.regexpIs( end ) )
    {
      // let matched = end.exec( src );
      let newEnd = RegExp( end.toString().slice(1, -1) + '$' );
      let matched = newEnd.exec( src );
      debugger;
      //if( matched && matched.index === 0 )
      if( matched && matched.index + matched[ 0 ].length === src.length )
      return matched[ 0 ];
    }
    else _.assert( 0, 'Expects string-like ( string or regexp )' );
  
    return false;
  };

//

  _._strRemovedBegin = function _strRemovedBegin( src, begin )
  {
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    _.assert( _.strIs( src ), 'Expects string {-src-}' );
  
    let result = src;
    let beginOf = _._strBeginOf( result, begin );
    if( beginOf !== false )
    result = result.substr( beginOf.length, result.length );
  
    return result;
  };

//

  _._strRemovedEnd = function _strRemovedEnd( src, end )
  {
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    _.assert( _.strIs( src ), 'Expects string {-src-}' );
  
    let result = src;
    let endOf = _._strEndOf( result, end );
    if( endOf !== false )
    result = result.substr( 0, result.length - endOf.length );
  
    return result;
  };

//

  _.strBegins = function strBegins( src, begin )
  {
  
    _.assert( _.strIs( src ), 'Expects string {-src-}' );
    _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  
    if( !_.longIs( begin ) )
    {
      let result = _._strBeginOf( src, begin );
      return result === false ? result : true;
    }
  
    for( let b = 0, blen = begin.length ; b < blen; b++ )
    {
      let result = _._strBeginOf( src, begin[ b ] );
      if( result !== false )
      return true;
    }
  
    return false;
  };

//

  _.strEnds = function strEnds( src, end )
  {
  
    _.assert( _.strIs( src ), 'Expects string {-src-}' );
    _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  
    if( !_.longIs( end ) )
    {
      let result = _._strEndOf( src, end );
      return result === false ? result : true;
    }
  
    for( let b = 0, blen = end.length ; b < blen; b++ )
    {
      let result = _._strEndOf( src, end[ b ] );
      if( result !== false )
      return true;
    }
  
    return false;
  };

//

  _.strRemoveBegin = function strRemoveBegin( src, begin )
  {
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
    _.assert( _.longIs( begin ) || _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  
    let result = [];
    let srcIsArray = _.longIs( src );
  
    if( _.strIs( src ) && !_.longIs( begin ) )
    return _._strRemovedBegin( src, begin );
  
    src = _.arrayAs( src );
    begin = _.arrayAs( begin );
    for( let s = 0, slen = src.length ; s < slen ; s++ )
    {
      let beginOf = false;
      let src1 = src[ s ]
      for( let b = 0, blen = begin.length ; b < blen ; b++ )
      {
        beginOf = _._strBeginOf( src1, begin[ b ] );
        if( beginOf !== false )
        break;
      }
      if( beginOf !== false )
      src1 = src1.substr( beginOf.length, src1.length );
      result[ s ] = src1;
    }
  
    if( !srcIsArray )
    return result[ 0 ];
  
    return result;
  };

//

  _.strRemoveEnd = function strRemoveEnd( src, end )
  {
    _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
    _.assert( _.longIs( end ) || _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  
    let result = [];
    let srcIsArray = _.longIs( src );
  
    if( _.strIs( src ) && !_.longIs( end ) )
    return _._strRemovedEnd( src, end );
  
    src = _.arrayAs( src );
    end = _.arrayAs( end );
  
    for( let s = 0, slen = src.length ; s < slen ; s++ )
    {
      let endOf = false;
      let src1 = src[ s ]
      for( let b = 0, blen = end.length ; b < blen ; b++ )
      {
        endOf = _._strEndOf( src1, end[ b ] );
        if( endOf !== false )
        break;
      }
      if( endOf !== false )
      src1 = src1.substr( 0, src1.length - endOf.length );
      result[ s ] = src1;
    }
  
    if( !srcIsArray )
    return result[ 0 ];
  
    return result;
  };

//

  _.regexpIs = function regexpIs( src )
  {
    return Object.prototype.toString.call( src ) === '[object RegExp]';
  };

//

  _.longIs = function longIs( src )
  {
    if( _.primitiveIs( src ) )
    return false;
    if( _.routineIs( src ) )
    return false;
    if( _.objectIs( src ) )
    return false;
    if( _.strIs( src ) )
    return false;
  
    if( Object.propertyIsEnumerable.call( src, 'length' ) )
    return false;
    if( !_.numberIs( src.length ) )
    return false;
  
    return true;
  };

//

  _.primitiveIs = function primitiveIs( src )
  {
    if( !src )
    return true;
    let t = Object.prototype.toString.call( src );
    return t === '[object Symbol]' || t === '[object Number]' || t === '[object BigInt]' || t === '[object Boolean]' || t === '[object String]';
  };

//

  path.refine = function refine( src )
  {
  
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( _.strIs( src ) );
  
    let result = src;
  
    if( result[ 1 ] === ':' )
    {
      if( result[ 2 ] === '\\' || result[ 2 ] === '/' )
      {
        if( result.length > 3 )
        result = '/' + result[ 0 ] + '/' + result.substring( 3 );
        else
        result = '/' + result[ 0 ]
      }
      else if( result.length === 2 )
      {
        result = '/' + result[ 0 ];
      }
    }
  
    result = result.replace( /\\/g, '/' );
  
    return result;
  };

//

  path._normalize = function _normalize( o )
  {
    let debug = 0;
    if( 0 )
    debug = 1;
  
    _.assertRoutineOptions( _normalize, arguments );
    _.assert( _.strIs( o.src ), 'Expects string' );
  
    if( !o.src.length )
    return '';
  
    let result = o.src;
  
    result = this.refine( result );
  
    if( debug )
    console.log( 'normalize.refined : ' + result );
  
    /* detrailing */
  
    if( o.tolerant )
    {
      /* remove "/" duplicates */
      result = result.replace( this._delUpDupRegexp, this._upStr );
    }
  
    let endsWithUp = false;
    let beginsWithHere = false;
  
    /* remove right "/" */
  
    if( result !== this._upStr && !_.strEnds( result, this._upStr + this._upStr ) && _.strEnds( result, this._upStr ) )
    {
      endsWithUp = true;
      result = _.strRemoveEnd( result, this._upStr );
    }
  
    /* undoting */
  
    while( !_.strBegins( result, this._hereUpStr + this._upStr ) && _.strBegins( result, this._hereUpStr ) )
    {
      beginsWithHere = true;
      result = _.strRemoveBegin( result, this._hereUpStr );
    }
  
    /* remove second "." */
  
    if( result.indexOf( this._hereStr ) !== -1 )
    {
  
      while( this._delHereRegexp.test( result ) )
      result = result.replace( this._delHereRegexp, function( match, postSlash )
      {
        return postSlash || '';
      });
      if( result === '' )
      result = this._upStr;
  
    }
  
    /* remove .. */
  
    if( result.indexOf( this._downStr ) !== -1 )
    {
  
      while( this._delDownRegexp.test( result ) )
      result = result.replace( this._delDownRegexp, ( match, notBegin, split, preSlash, postSlash ) =>
      {
        if( preSlash === '' )
        return notBegin;
        if( !notBegin )
        return notBegin + preSlash;
        else
        return notBegin + ( postSlash || '' );
      });
  
    }
  
    /* nothing left */
  
    if( !result.length )
    result = '.';
  
    /* dot and trail */
  
    if( o.detrailing )
    if( result !== this._upStr && !_.strEnds( result, this._upStr + this._upStr ) )
    result = _.strRemoveEnd( result, this._upStr );
  
    if( !o.detrailing && endsWithUp )
    if( result !== this._rootStr )
    result = result + this._upStr;
  
    if( !o.undoting && beginsWithHere )
    result = this.dot( result );
  
    if( debug )
    console.log( 'normalize.result : ' + result );
  
    return result;
  };

//

  path.canonizeTolerant = function canonizeTolerant( src )
  {
    _.assert( _.strIs( src ),'Expects string' );
  
    let result = this._normalize({ src, tolerant : true, detrailing : true, undoting : true });
  
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( result === this._upStr || _.strEnds( result, this._upStr ) || !_.strEnds( result, this._upStr + this._upStr ) );
    _.assert( result.lastIndexOf( this._upStr + this._hereStr + this._upStr ) === -1 );
    _.assert( !_.strEnds( result, this._upStr + this._hereStr ) );
  
    if( Config.debug )
    {
      _.assert( !this._delUpDupRegexp.test( result ) );
    }
  
    return result;
  };

//


  path._rootStr = `/`;

//
  path._upStr = `/`;

//
  path._hereStr = `.`;

//
  path._downStr = `..`;

//
  path._hereUpStr = `./`;

//
  path._downUpStr = `../`;

//
  path._delHereRegexp = /\/\.(\/|$)/;

//
  path._delDownRegexp = /((?:.|^))(?:(?:\/\/)|(((?:^|\/))(?!\.\.(?:\/|$))(?:(?!\/).)+\/))\.\.((?:\/|$))/;

//
  path._delUpDupRegexp = /\/{2,}/g;

//
  path.currentAtBegin = `/C/pro/web/Port/package/wTools`;

//


  // --
  // declare
  // --

  

  //

  let Extend =
  {

    ScriptFile,

    _pathResolve,
    _nodejsInclude,

    _fileIncludeAct,
    _fileInclude,
    _fileResolve,
    _fileGet,
    _fileCreate,

    assert,
    assertRoutineOptions,

    path,

  }

  Object.assign( _starter_, Extend );

;

})(); // end of starterware

let _libraryFilePath_ = _starter_.path.canonizeTolerant( __filename );
let _libraryDirPath_ = _starter_.path.canonizeTolerant( __dirname );

( function Tools_s() { // == begin of file Tools_s
function Tools_s_naked() {

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = './Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  module[ 'exports' ] = _global_.wTools;

}
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/Tools.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, Tools_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file Tools_s

( function Layer0_s() { // == begin of file Layer0_s
function Layer0_s_naked() {
//#! /usr/bin/env node
(function _wToolsLayer0_s_(){

'use strict';

if( typeof module !== 'undefined' && module !== null )
{

  require( './l0/aPredefined.s' );
  require( './l0/aSetup.s' );
  require( './l0/bPremature.s' );

  require( './l0/fBool.s' );
  require( './l0/fChecker.s' );
  require( './l0/fEntity.s' );
  require( './l0/fErr.s' );
  require( './l0/fLong.s' );
  require( './l0/fMap.s' );
  require( './l0/fNumber.s' );
  require( './l0/fRange.s' );
  require( './l0/fRegexp.s' );
  require( './l0/fRoutine.s' );
  require( './l0/fString.s' );
  require( './l0/fTime.s' );

  require( './l0/iArrayDescriptor.s' );
  require( './l0/iCompose.s' );
  require( './l0/iField.s' );

  let _global = _global_;
  let _ = _global_.wTools;
  let Self = _global_.wTools;

}

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/Layer0.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, Layer0_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file Layer0_s

( function Layer1_s() { // == begin of file Layer1_s
function Layer1_s_naked() {
//#! /usr/bin/env node
(function _wToolsLayer1_s_(){

'use strict';

if( typeof module !== 'undefined' && module !== null )
{

  require( './Layer0.s' );

  require( './l1/cErr.s' );

  require( './l1/gBool.s' );
  require( './l1/gEntity.s' );
  require( './l1/gLong.s' );
  require( './l1/gMap.s' );
  require( './l1/gNumber.s' );
  require( './l1/gRange.s' );
  require( './l1/gRegexp.s' );
  require( './l1/gRoutine.s' );
  require( './l1/gString.s' );
  require( './l1/gTime.s' );

  require( './l1/zSetup.s' );

  let _global = _global_;
  let _ = _global_.wTools;
  let Self = _global_.wTools;

}

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/Layer1.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, Layer1_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file Layer1_s

( function Layer2_s() { // == begin of file Layer2_s
function Layer2_s_naked() {
(function _wToolsLayer2_s_(){

'use strict';

if( typeof module !== 'undefined' && module !== null )
{

  require( './Layer1.s' );

  require( './l2/IncludeTools.s' );
  require( './l2/NameTools.s' );
  require( './l2/StringTools.s' );
  require( './l2/ModulesRegistry.s' );

}

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/Layer2.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, Layer2_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file Layer2_s

( function aPredefined_s() { // == begin of file aPredefined_s
function aPredefined_s_naked() {
( function _aPredefined_s_() {

'use strict';

/**
 * @file aPredefined.s.
 */

// /**
//   @module Tools/base/Fundamental - Collection of general purpose tools for solving problems. Fundamentally extend JavaScript without corrupting it, so may be used solely or in conjunction with another module of such kind. Tools contain hundreds of routines to operate effectively with Array, SortedArray, Map, RegExp, Buffer, Time, String, Number, Routine, Error and other fundamental types. The module provides advanced tools for diagnostics and errors handling. Use it to have a stronger foundation for the application.
// */

/**
 * wTools - Generic purpose tools of base level for solving problems in Java Script.
 * @namespace wTools
 */

// global

let _global = undefined;
if( !_global && typeof Global !== 'undefined' && Global.Global === Global ) _global = Global;
if( !_global && typeof global !== 'undefined' && global.global === global ) _global = global;
if( !_global && typeof window !== 'undefined' && window.window === window ) _global = window;
if( !_global && typeof self   !== 'undefined' && self.self === self ) _global = self;
let _realGlobal = _global._realGlobal_ = _global;
let _wasGlobal = _global._global_ || _global;
_global = _wasGlobal;
_global._global_ = _wasGlobal;


// verification

// if( !_global_.WTOOLS_PRIVATE )
if( _global_.__GLOBAL_WHICH__ === 'real' )
{

  if( _global_.wBase )
  {
    if( _global_.wTools.usePath )
    _global_.wTools.usePath( __dirname + '/../..' ); /* xxx : remove later */
    module[ 'exports' ] = _global_.wBase;
    return;
  }

  if( _global_.wBase )
  {
    throw new Error( 'wTools was included several times' );
  }

}

// config

if( _realGlobal.__GLOBAL_WHICH__ === undefined )
_realGlobal.__GLOBAL_WHICH__ = 'real';

if( !_realGlobal.Config )
_realGlobal.Config = { debug : true }
if( _realGlobal.Config.debug === undefined )
_realGlobal.Config.debug = true;
if( _realGlobal.Config.platform === undefined )
_realGlobal.Config.platform = ( ( typeof module !== 'undefined' ) && ( typeof process !== 'undefined' ) ) ? 'nodejs' : 'browser';
if( _realGlobal.Config.isWorker === undefined )
_realGlobal.Config.isWorker = !!( typeof self !== 'undefined' && self.self === self && typeof importScripts !== 'undefined' );

if( !_global_.Config )
_global_.Config = { debug : true }
if( _global_.Config.debug === undefined )
_global_.Config.debug = true;
if( _global_.Config.platform === undefined )
_global_.Config.platform = ( ( typeof module !== 'undefined' ) && ( typeof process !== 'undefined' ) ) ? 'nodejs' : 'browser';
if( _global_.Config.isWorker === undefined )
_global_.Config.isWorker = !!( typeof self !== 'undefined' && self.self === self && typeof importScripts !== 'undefined' );

// if( !_global_.WTOOLS_PRIVATE  )
if( _global_.__GLOBAL_WHICH__ === 'real' )
// if( !_global_.Underscore && _global_._ )
if( _global_._ )
{
  _global_.Underscore = _global_._;
  delete _global_._;
}

if( Object.hasOwnProperty.call( _global, 'wTools' ) && _global !== _realGlobal_ )
throw Error( 'wTools was already defined' );

//

_global.wTools = Object.create( null );
_realGlobal_.wTools = _realGlobal_.wTools || Object.create( null );
let Self = _global.wTools;
let _ = Self;

Self.__GLOBAL_WHICH__ = _global.__GLOBAL_WHICH__;

// special globals

Self.def = Symbol.for( 'def' );
Self.nothing = Symbol.for( 'nothing' );
Self.maybe = Symbol.for( 'maybe' );
Self.dont = Symbol.for( 'dont' );
Self.unroll = Symbol.for( 'unroll' );
// Self.hold = Symbol.for( 'hold' );

// type aliases

_global_.U32x = Uint32Array;
_global_.U16x = Uint16Array;
_global_.U8x = Uint8Array;
_global_.Ux = _global_.U32x;

_global_.I32x = Int32Array;
_global_.I16x = Int16Array;
_global_.I8x = Int8Array;
_global_.Ix = _global_.I32x;

_global_.F64x = Float64Array;
_global_.F32x = Float32Array;
_global_.Fx = _global_.F32x;

// --
// export
// --

_global[ 'wTools' ] = Self;
_global.wTools = Self;
_global.wBase = Self;

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/aPredefined.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, aPredefined_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file aPredefined_s

( function aSetup_s() { // == begin of file aSetup_s
function aSetup_s_naked() {
(function _aSetup_s_() {

'use strict';

let _global = _global_;
let _realGlobal = _global._realGlobal_
let _ = _global.wTools;
let Self = _global.wTools;;

// --
// setup
// --

function _setupUnhandledErrorHandler0()
{

  if( _global._setupUnhandledErrorHandlerDone )
  return;

  _global._setupUnhandledErrorHandlerDone = 1;

  let handlerWas = null;
  if( _global.process && typeof _global.process.on === 'function' )
  {
    handlerWas = _global.process.onUncaughtException;
    _global.process.on( 'uncaughtException', handleNodeError );
    Self._handleUnhandledError0 = handleNodeError;
    if( handlerWas )
    throw Error( 'not tested' );
  }
  else if( Object.hasOwnProperty.call( _global, 'onerror' ) )
  {
    handlerWas = _global.onerror;
    _global.onerror = handleBrowserError;
    Self._handleUnhandledError0 = handleBrowserError;
  }

  /* */

  function handleBrowserError( message, sourcePath, lineno, colno, error )
  {
    let result;

    if( Self._handleUnhandledError1 )
    result = Self._handleUnhandledError1.apply( this, arguments );
    else
    result = handleError( new Error( message ) );

    if( handlerWas )
    handlerWas.apply( this, arguments );

    return result;
  }

  /* */

  function handleNodeError( err )
  {
    let result;

    if( Self._handleUnhandledError1 )
    result = Self._handleUnhandledError1.apply( this, arguments );
    else
    result = handleError( err );

    if( handlerWas )
    handlerWas.apply( this, arguments );

    if( _appExitError )
    _appExitError( -1 );

    if( Self._handleUnhandledError1 )
    return result;
  }

  /* */

  function handleError( err )
  {
    let prefix = '------------------------------- unhandled errorr ------------------------------->\n';
    let postfix = '------------------------------- unhandled errorr -------------------------------<\n';
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

  }

  /* */

  function _appExitError()
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

  _handleUnhandledError0 : null,
  _handleUnhandledError1 : null,
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
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/aSetup.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, aSetup_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file aSetup_s

( function bPremature_s() { // == begin of file bPremature_s
function bPremature_s_naked() {
( function _bPremature_s_() {

'use strict';

let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// routine
// --


/**
 * Returns true if entity ( src ) is a String.
 * @function strIs
 * @param {} src - entity to check
 * @memberof wTools
 */

function strIs( src )
{
  let result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

/**
 * Returns true if entity ( src ) is a Function.
 * @function routineIs
 * @param {} src - entity to check
 * @memberof wTools
 */

function routineIs( src )
{
  return _ObjectToString.call( src ) === '[object Function]';
}

//

/**
 * Returns true if entity ( src ) is an Object.
 * @function objectIs
 * @param {} src - entity to check
 * @memberof wTools
 */

function objectIs( src )
{
  return _ObjectToString.call( src ) === '[object Object]';
}

//

/**
 * Returns true if entity ( src ) is an Arguments object.
 * @function argumentsArrayIs
 * @param {} src - entity to check
 * @memberof wTools
 */

function argumentsArrayIs( src )
{
  return _ObjectToString.call( src ) === '[object Arguments]';
}

//

/**
 * @summary Tests if provided condidion is true.
 *
 * @description
 *
 * * If ( msg ) is a Function - overrides ( msg ) with result of execution.
 * * If ( msg ) is a String - uses it as message.
 * * If ( msg ) is not defined - uses default message: 'Assertion fails'.
 * * If ( msg ) has any other type - uses it as argument for 'throw' statement
 *
 * @example
 * _.assert( _.strIs( src ), 'Src is not a string' );
 *
 * @function assert
 * @param {} condition - condition to check
 * @param {} msg - error message
 * @throws {Error} If condition fails. Uses second argument ( msg ) as error message.
 * @memberof wTools
 */

function assert( condition, msg )
{

  if( Config.debug === false )
  return true;

  if( arguments.length !== 1 && arguments.length !== 2 )
  {
    debugger;
    throw Error( 'Premature version of assert expects one or two arguments' );
  }

  if( !condition )
  {
    debugger;
    if( routineIs( msg ) )
    msg = msg();
    if( strIs( msg ) )
    throw Error( msg );
    else if( msg === undefined )
    throw Error( 'Assertion fails' );
    else
    throw msg;

  }

  return true;
}

//

/**
 * @summary Supplements source options map with defaults of current function( routine ) and checks if all options are known.
 *
 * @description
 *
 * * If ( args ) is an Arguments array, first argument should be a source options map;
 * * If ( args ) is not defined, creates a copy of default options;
 * * If ( defaults ) is not defined, uses defaults map from 'routine.defaults' property;
 *
 * @example
 *
 * function add( o )
 * {
 *  _.routineOptions( add, o );
 *  return o.a + o.b;
 * }
 *
 * add.defaults =
 * {
 *  a : 0,
 *  b : 0
 * }
 *
 * add({ a : 1, b : 1 }) // 2
 * add({ b : 1 }) // 1
 * add({ a : 1, c : 3 }) // throws an error, option "c" is unknown
 *
 * @function routineOptions
 * @param {Function} routine - target routine
 * @param {Arguments|Object} args - arguments array or options map
 * @param {Object} defaults - map with default options
 * @throws {Error} If first argument( routine ) is not a Function.
 * @throws {Error} If second argument( args ) is not an Arguments array or Map.
 * @throws {Error} If third argument( defaults ) is not an Object.
 * @throws {Error} If source options map has unknown properties.
 * @memberof wTools
 */

function routineOptions( routine, args, defaults )
{

  if( !argumentsArrayIs( args ) )
  args = [ args ];

  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  assert( routineIs( routine ), 'Expects routine' );
  assert( objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  assert( objectIs( options ), 'Expects object' );
  assert( args.length === 0 || args.length === 1, () => 'Expects single options map, but got ' + args.length + ' arguments' );

  mapSupplementStructureless( options, defaults ); /* xxx qqq : use instead of mapComplement */

  // _.mapComplement( options, defaults );
  // _.assertMapHasNoUndefine( options );

  for( let k in options )
  {
    assert( defaults[ k ] !== undefined, () => 'Unknown option ' + k )
  }

  return options;
}

//

function mapSupplementStructureless( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );

  if( dstMap === null )
  dstMap = Object.create( null );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    for( let s in srcMap )
    {
      if( dstMap[ s ] !== undefined )
      continue;
      if( _.objectLike( srcMap[ s ] ) || _.arrayLike( srcMap[ s ] ) )
      {
        debugger;
        throw Error( 'Source map should have only primitive elements, but ' + s + ' is ' + srcMap[ s ] );
      }
      dstMap[ s ] = srcMap[ s ];
    }
  }

  return dstMap
}

//

function vectorize_pre( routine, args )
{
  let o = args[ 0 ];

  if( args.length === 2 )
  o = { routine : args[ 0 ], select : args[ 1 ] }
  else if( routineIs( o ) || strIs( o ) )
  o = { routine : args[ 0 ] }

  routineOptions( routine, o );
  assert( arguments.length === 2, 'Expects exactly two arguments' );
  assert( routineIs( o.routine ) || strIs( o.routine ) || _.strsAreAll( o.routine ), () => 'Expects routine {-o.routine-}, but got ' + o.routine );
  assert( args.length === 1 || args.length === 2 );
  assert( o.select >= 1 || strIs( o.select ) || _.arrayIs( o.select ), () => 'Expects {-o.select-} as number >= 1, string or array, but got ' + o.select );

  return o;
}

//

function vectorize_body( o )
{

  _.assertRoutineOptions( vectorize_body, arguments );

  if( _.arrayIs( o.routine ) && o.routine.length === 1 )
  o.routine = o.routine[ 0 ];

  let routine = o.routine;
  let fieldFilter = o.fieldFilter;
  let bypassingFilteredOut = o.bypassingFilteredOut;
  let bypassingEmpty = o.bypassingEmpty;
  let vectorizingArray = o.vectorizingArray;
  let vectorizingMapVals = o.vectorizingMapVals;
  let vectorizingMapKeys = o.vectorizingMapKeys;
  let pre = null;
  let select = o.select === null ? 1 : o.select;
  let selectAll = o.select === Infinity;
  let multiply = select > 1 ? multiplyReally : multiplyNo;

  routine = routineNormalize( routine );

  assert( routineIs( routine ), () => 'Expects routine {-o.routine-}, but got ' + routine );

  /* */

  let resultRoutine = vectorizeArray;

  if( _.numberIs( select ) )
  {
    if( !vectorizingArray && !vectorizingMapVals && !vectorizingMapKeys )
    resultRoutine = routine;
    else if( fieldFilter )
    resultRoutine = vectorizeWithFilters;
    else if( vectorizingMapKeys )
    {
      // assert( !vectorizingMapVals, '{-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} should not be enabled at the same time' );

      if( vectorizingMapVals )
      {
        assert( select === 1, 'Only single argument is allowed if {-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} are enabled.' );
        resultRoutine = vectorizeMapWithKeysOrArray;
      }
      else
      {
        resultRoutine = vectorizeKeysOrArray;
      }
    }
    else if( !vectorizingArray || vectorizingMapVals )
    resultRoutine = vectorizeMapOrArray;
    else if( multiply === multiplyNo )
    resultRoutine = vectorizeArray;
    else
    resultRoutine = vectorizeArrayMultiplying;

    /*
      vectorizeWithFilters : multiply + array/map vectorizing + filter
      vectorizeArray : array vectorizing
      vectorizeArrayMultiplying :  multiply + array vectorizing
      vectorizeMapOrArray :  multiply +  array/map vectorizing
    */

  }
  else
  {
    assert( multiply === multiplyNo, 'not implemented' );
    if( routine.pre )
    {
      pre = routine.pre;
      routine = routine.body;
    }
    if( fieldFilter )
    assert( 0, 'not implemented' );
    else if( vectorizingArray || !vectorizingMapVals )
    {
      if( strIs( select ) )
      resultRoutine = vectorizeForOptionsMap;
      else
      resultRoutine = vectorizeForOptionsMapForKeys;
    }
    else
    assert( 0, 'not implemented' );
  }

  /* */

  _.routineExtend( resultRoutine, routine );

  /* */

  return resultRoutine;

  /* - */

  function routineNormalize( routine )
  {

    if( strIs( routine ) )
    {
      return function methodCall()
      {
        assert( routineIs( this[ routine ] ), () => 'Context ' + _.toStrShort( this ) + ' does not have routine ' + routine );
        return this[ routine ].apply( this, arguments );
      }
    }
    else if( _.arrayIs( routine ) )
    {
      assert( routine.length === 2 );
      return function methodCall()
      {
        let c = this[ routine[ 0 ] ];
        assert( routineIs( c[ routine[ 1 ] ] ), () => 'Context ' + _.toStrShort( c ) + ' does not have routine ' + routine );
        return c[ routine[ 1 ] ].apply( c, arguments );
      }
    }

    return routine;
  }

  /* - */

  function multiplyNo( args )
  {
    return args;
  }

  /* - */

  function multiplyReally( args )
  {
    let length;
    let keys;

    args = _.longSlice( args );

    if( selectAll )
    select = args.length;

    assert( args.length === select, () => 'Expects ' + select + ' arguments, but got ' + args.length );

    for( let d = 0 ; d < select ; d++ )
    {
      if( vectorizingArray && _.arrayIs( args[ d ] ) )
      {
        length = args[ d ].length;
        break;
      }
      if( vectorizingMapVals && _.mapIs( args[ d ] ) )
      {
        keys = _.mapOwnKeys( args[ d ] );
        break;
      }
    }

    if( length !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      {
        if( vectorizingMapVals )
        assert( !_.mapIs( args[ d ] ), () => 'Arguments should have only arrays or only maps, but not both. Incorrect argument : ' + args[ d ] );
        else if( vectorizingMapKeys && _.mapIs( args[ d ] ) )
        continue;

        args[ d ] = _.multiple( args[ d ], length );
      }

    }
    else if( keys !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      if( _.mapIs( args[ d ] ) )
      assert( _.arraySetIdentical( _.mapOwnKeys( args[ d ] ), keys ), () => 'Maps should have same keys : ' + keys );
      else
      {
        if( vectorizingArray )
        assert( !_.longIs( args[ d ] ), () => 'Arguments should have only arrays or only maps, but not both. Incorrect argument : ' + args[ d ] );

        let arg = Object.create( null );
        _.mapSetWithKeys( arg, keys, args[ d ] );
        args[ d ] = arg;
      }
    }

    return args;
  }

  /* - */

  function vectorizeArray()
  {  
    if( bypassingEmpty && !arguments.length )
    return [];
    
    let args = arguments;
    let src = args[ 0 ];

    if( _.longIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        args2[ 0 ] = src[ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeArrayMultiplying()
  {
    if( bypassingEmpty && !arguments.length )
    return [];
    
    let args = multiply( arguments );
    let src = args[ 0 ];

    if( _.longIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeForOptionsMap( srcMap )
  { 
    if( bypassingEmpty && !arguments.length )
    return [];
    
    let src = srcMap[ select ];

    assert( arguments.length === 1, 'Expects single argument' );

    if( _.longIs( src ) )
    {
      let args = _.longSlice( arguments );
      if( pre )
      {
        args = pre( routine, args );
        assert( _.arrayLikeResizable( args ) );
      }
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = src[ r ];
        result[ r ] = routine.apply( this, args );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeForOptionsMapForKeys()
  { 
    let result = [];
    
    if( bypassingEmpty && !arguments.length )
    return result;

    for( let i = 0; i < o.select.length; i++ )
    {
      select = o.select[ i ];
      result[ i ] = vectorizeForOptionsMap.apply( this, arguments );
    }
    return result;
  }

  /* - */

  function vectorizeMapOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return []; 
    
    let args = multiply( arguments );
    let src = args[ 0 ];

    if( vectorizingArray && _.longIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }
    else if( vectorizingMapVals && _.mapIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = Object.create( null );
      for( let r in src )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];

        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeMapWithKeysOrArray()
  { 
    if( bypassingEmpty && !arguments.length )
    return [];
    
    let args = multiply( arguments );
    let srcs = args[ 0 ];

    assert( args.length === select, () => 'Expects ' + select + ' arguments but got : ' + args.length );

    if( vectorizingMapKeys && vectorizingMapVals &&_.mapIs( srcs ) )
    {
      let result = Object.create( null );
      for( let s in srcs )
      {
        let val = routine.call( this, srcs[ s ] );
        let key = routine.call( this, s );
        result[ key ] = val;
      }
      return result;
    }
    else if( vectorizingArray && _.arrayIs( srcs ) )
    {
      let result = [];
      for( let s = 0 ; s < srcs.length ; s++ )
      result[ s ] = routine.call( this, srcs[ s ] );
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeWithFilters( src )
  {

    assert( 0, 'not tested' );
    assert( arguments.length === 1, 'Expects single argument' );

    let args = multiply( arguments );

    if( vectorizingArray && _.longIs( src ) )
    {
      args = _.longSlice( args );
      let result = [];
      throw _.err( 'not tested' );
      for( let r = 0 ; r < src.length ; r++ )
      {
        if( fieldFilter( src[ r ], r, src ) )
        {
          args[ 0 ] = src[ r ];
          result.push( routine.apply( this, args ) );
        }
        else if( bypassingFilteredOut )
        {
          result.push( src[ r ] );
        }
      }
      return result;
    }
    else if( vectorizingMapVals && _.mapIs( src ) )
    {
      args = _.longSlice( args );
      let result = Object.create( null );
      throw _.err( 'not tested' );
      for( let r in src )
      {
        if( fieldFilter( src[ r ], r, src ) )
        {
          args[ 0 ] = src[ r ];
          result[ r ] = routine.apply( this, args );
        }
        else if( bypassingFilteredOut )
        {
          result[ r ] = src[ r ];
        }
      }
      return result;
    }

    return routine.call( this, src );
  }

  /* - */

  function vectorizeKeysOrArray()
  { 
    // yyy
    if( bypassingEmpty && !arguments.length )
    return [];
    // yyy
    
    let args = multiply( arguments );
    let src = args[ 0 ];
    let args2;
    let result;
    let map;
    let mapIndex;
    let arr;

    assert( args.length === select, () => 'Expects ' + select + ' arguments but got : ' + args.length );

    if( vectorizingMapKeys )
    {
      for( let d = 0; d < select; d++ )
      {
        if( vectorizingArray && _.arrayIs( args[ d ] ) )
        arr = args[ d ];
        else if( _.mapIs( args[ d ] ) )
        {
          assert( map === undefined, () => 'Arguments should have only single map. Incorrect argument : ' + args[ d ] );
          map = args[ d ];
          mapIndex = d;
        }
      }
    }

    if( map )
    {
      result = Object.create( null );
      args2 = _.longSlice( args );

      if( vectorizingArray && _.arrayIs( arr ) )
      {
        for( let i = 0; i < arr.length; i++ )
        {
          for( let m = 0 ; m < select ; m++ )
          args2[ m ] = args[ m ][ i ];

          for( let k in map )
          {
            args2[ mapIndex ] = k;
            let key = routine.apply( this, args2 );
            result[ key ] = map[ k ];
          }
        }
      }
      else
      {
        for( let k in map )
        {
          args2[ mapIndex ] = k;
          let key = routine.apply( this, args2 );
          result[ key ] = map[ k ];
        }
      }

      return result;
    }
    else if( vectorizingArray && _.longIs( src ) )
    {
      args2 = _.longSlice( args );
      result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

}

/* qqq : implement options combination vectorizingMapVals : 1, vectorizingMapKeys : 1, vectorizingArray : [ 0, 1 ] */
/* qqq : cover it */

/* qqq : implement bypassingEmpty for all combinations of options */
/* qqq : options bypassingEmpty of routine _.vectorize requires good coverage */

vectorize_body.defaults =
{
  routine : null,
  fieldFilter : null,
  bypassingFilteredOut : 1,
  bypassingEmpty : 0,
  vectorizingArray : 1,
  vectorizingMapVals : 0,
  vectorizingMapKeys : 0,
  select : 1,
}

//

function vectorize()
{
  let o = vectorize.pre.call( this, vectorize, arguments );
  let result = vectorize.body.call( this, o );
  return result;
}

vectorize.pre = vectorize_pre;
vectorize.body = vectorize_body;
vectorize.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeAll_body( o )
{
  _.assertRoutineOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );

  return all;

  function all()
  {
    let result = routine1.apply( this, arguments );
    return _.all( result );
  }

}

vectorizeAll_body.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeAll()
{
  let o = vectorizeAll.pre.call( this, vectorizeAll, arguments );
  let result = vectorizeAll.body.call( this, o );
  return result;
}

vectorizeAll.pre = vectorize_pre;
vectorizeAll.body = vectorizeAll_body;
vectorizeAll.defaults = Object.create( vectorizeAll_body.defaults );

//

function vectorizeAny_body( o )
{
  _.assertRoutineOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );

  return any;

  function any()
  {
    let result = routine1.apply( this, arguments );
    return _.any( result );
  }

}

vectorizeAny_body.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeAny()
{
  let o = vectorizeAny.pre.call( this, vectorizeAny, arguments );
  let result = vectorizeAny.body.call( this, o );
  return result;
}

vectorizeAny.pre = vectorize_pre;
vectorizeAny.body = vectorizeAny_body;
vectorizeAny.defaults = Object.create( vectorizeAny_body.defaults );

//

function vectorizeNone_body( o )
{
  _.assertRoutineOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );

  return none;

  function none()
  {
    let result = routine1.apply( this, arguments );
    return _.none( result );
  }

}

vectorizeNone_body.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeNone()
{
  let o = vectorizeNone.pre.call( this, vectorizeNone, arguments );
  let result = vectorizeNone.body.call( this, o );
  return result;
}

vectorizeNone.pre = vectorize_pre;
vectorizeNone.body = vectorizeNone_body;
vectorizeNone.defaults = Object.create( vectorizeNone_body.defaults );

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  strIs,
  routineIs,
  objectIs,
  argumentsArrayIs,

  assert,
  routineOptions,

  routineVectorize_functor : vectorize,
  vectorize,
  vectorizeAll,
  vectorizeAny,
  vectorizeNone,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

// if( typeof module !== 'undefined' )
// if( _global.WTOOLS_PRIVATE )
// { /* delete require.cache[ module.id ]; */ }

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/bPremature.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, bPremature_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file bPremature_s

( function fBool_s() { // == begin of file fBool_s
function fBool_s_naked() {
( function _fBool_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// bool
// --

/**
 * Returns true if entity ( src ) is a Boolean.
 * @function boolIs
 * @param {} src - entity to check
 * @memberof wTools
 */

function boolIs( src )
{
  return src === true || src === false;
}

//

/**
 * Returns true if entity ( src ) is a Boolean or Number.
 * @function boolLike
 * @param {} src - entity to check
 * @memberof wTools
 */

function boolLike( src )
{
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || type === '[object Number]';
}

//

// function boolFrom( src )
// {
//   if( _.strIs( src ) )
//   {
//     src = src.toLowerCase();
//     if( src == '0' ) return false;
//     if( src == 'false' ) return false;
//     if( src == 'null' ) return false;
//     if( src == 'undefined' ) return false;
//     if( src == '' ) return false;
//     return true;
//   }
//   return Boolean( src );
// }

//

/**
 * @summary Returns copy of array( src ) with only boolean elements.
 * @description
 * Returns false if ( src ) is not ArrayLike object.
 * @function boolsAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayLike( src ) )
  return false;
  return src.filter( ( e ) => _.boolIs( e ) );
}

//

/**
 * @summary Checks if all elements of array( src ) are booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAllAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsAllAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.boolIs( src );
  return _.all( src.filter( ( e ) => _.boolIs( e ) ) );
}

//

/**
 * @summary Checks if at least one element from array( src ) is a boolean.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsAnyAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.boolIs( src );
  return _.any( src.filter( ( e ) => _.boolIs( e ) ) );
}

//

/**
 * @summary Checks if array( src ) doesn't have booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is not a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */

function boolsNoneAre( src )
{
  _.assert( arguments.length === 1 );
  if( !_.arrayIs( src ) )
  return _.boolIs( src );
  return _.none( src.filter( ( e ) => _.boolIs( e ) ) );
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  boolIs,
  boolLike,
  // boolFrom,

  boolsAre,
  boolsAllAre,
  boolsAnyAre,
  boolsNoneAre,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fBool.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fBool_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fBool_s

( function fChecker_s() { // == begin of file fChecker_s
function fChecker_s_naked() {
( function _fChecker_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// type test
// --

function nothingIs( src )
{
  if( src === null )
  return true;
  if( src === undefined )
  return true;
  if( src === _.nothing )
  return true;
  return false;
}

//

function definedIs( src )
{
  return src !== undefined && src !== null && src !== NaN && src !== _.nothing;
}

//

function primitiveIs( src )
{
  if( !src )
  return true;
  let t = Object.prototype.toString.call( src );
  return t === '[object Symbol]' || t === '[object Number]' || t === '[object BigInt]' || t === '[object Boolean]' || t === '[object String]';
}

//

function containerIs( src )
{
  if( _.arrayLike( src ) )
  return true;
  if( _.objectIs( src ) )
  return true;
  return false;
}

//

function containerLike( src )
{
  if( _.longIs( src ) )
  return true;
  if( _.objectLike( src ) )
  return true;
  return false;
}

//

function symbolIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object Symbol]';
  return result;
}

//

function bigIntIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object BigInt]';
  return result;
}

//

function vectorIs( src )
{
  if( !_.objectIs( src ) )
  return false;
  if( !( '_vectorBuffer' in src ) )
  return false;

  if( _ObjectHasOwnProperty.call( src, 'constructor' ) )
  {
    debugger;
    return false;
  }

  return true;
}

//

function constructorIsVector( src )
{
  if( !src )
  return false;
  return '_vectorBuffer' in src.prototype;
}

//

function spaceIs( src )
{
  if( !src )
  return false;
  if( !_.Space )
  return false;
  if( src instanceof _.Space )
  return true;
}

//

function constructorIsSpace( src )
{
  if( !_.Space )
  return false;
  if( src === _.Space )
  return true;
  return false;
}

//

function consequenceIs( src )
{
  if( !src )
  return false;

  let prototype = Object.getPrototypeOf( src );
  if( !prototype )
  return false;

  return prototype.shortName === 'Consequence';
}

//

function consequenceLike( src )
{
  if( _.consequenceIs( src ) )
  return true;

  if( _.promiseIs( src ) )
  return true;

  return false;
}

//

function promiseIs( src )
{
  if( !src )
  return false;
  return src instanceof Promise;
}

//

function promiseLike( src )
{
  if( !src )
  return false;
  return _.routineIs( src.then ) && _.routineIs( src.catch ) && ( src.constructor ) && ( src.constructor.name === 'Promise' );
  // return _.routineIs( src.then ) && _.routineIs( src.catch ) && _.routineIs( src.reject ) &&  _.routineIs( src.resolve );
}

//

function typeOf( src, constructor )
{
  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single argument' );

  if( arguments.length === 2 )
  {
    return _.typeOf( src ) === constructor;
  }

  if( src === null || src === undefined )
  return null
  else if( _.numberIs( src ) || _.boolIs( src ) || _.strIs( src ) )
  {
    return src.constructor;
  }
  else if( src.constructor )
  {
    _.assert( _.routineIs( src.constructor ) && src instanceof src.constructor );
    return src.constructor;
  }
  else
  {
    return null;
  }
}

//

function prototypeOf( subPrototype, superPrototype )
{
  _.assert( arguments.length === 2, 'Expects single argument' );
  if( subPrototype === superPrototype )
  return true;
  if( !subPrototype )
  return false;
  if( !superPrototype )
  return false;
  return Object.isPrototypeOf.call( subPrototype, superPrototype );
}

//

function prototypeHas( superPrototype, subPrototype )
{
  _.assert( arguments.length === 2, 'Expects single argument' );
  return _.prototypeOf( subPrototype, superPrototype );
}

//

/**
 * Is prototype.
 * @function prototypeIs
 * @param {object} src - entity to check
 * @memberof wTools
 */

function prototypeIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.primitiveIs( src ) )
  return false;
  return _ObjectHasOwnProperty.call( src, 'constructor' );
}

//

function prototypeIsStandard( src )
{

  if( !_.prototypeIs( src ) )
  return false;

  if( !_ObjectHasOwnProperty.call( src, 'Composes' ) )
  return false;

  return true;
}

//

/**
 * Checks if argument( cls ) is a constructor.
 * @function constructorIs
 * @param {Object} cls - entity to check
 * @memberof wTools
 */

function constructorIs( cls )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.routineIs( cls ) && !instanceIs( cls );
}

//

function constructorIsStandard( cls )
{

  _.assert( _.constructorIs( cls ) );

  let prototype = _.prototypeGet( cls );

  return _.prototypeIsStandard( prototype );
}

//

/**
 * Is instance of a class.
 * @function instanceIs
 * @param {object} src - entity to check
 * @memberof wTools
 */

function instanceIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.primitiveIs( src ) )
  return false;

  if( _ObjectHasOwnProperty.call( src, 'constructor' ) )
  return false;
  else if( _ObjectHasOwnProperty.call( src, 'prototype' ) && src.prototype )
  return false;

  if( Object.getPrototypeOf( src ) === Object.prototype )
  return false;
  if( Object.getPrototypeOf( src ) === null )
  return false;

  return true;
}

//

function instanceIsStandard( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.instanceIs( src ) )
  return false;

  let proto = _.prototypeGet( src );

  if( !proto )
  return false;

  return _.prototypeIsStandard( proto );
}

//

function instanceLike( src )
{
  if( _.primitiveIs( src ) )
  return false;
  if( src.Composes )
  return true;
  return false;
}

//

function workerIs( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    if( typeof WorkerGlobalScope !== 'undefined' && src instanceof WorkerGlobalScope )
    return true;
    if( typeof Worker !== 'undefined' && src instanceof Worker )
    return true;
    return false;
  }
  else
  {
    return typeof WorkerGlobalScope !== 'undefined';
  }
}

//

function streamIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.objectIs( src ) && _.routineIs( src.pipe )
}

//

function consoleIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( console.Console )
  if( src && src instanceof console.Console )
  return true;

  if( src !== console )
  return false;

  let result = Object.prototype.toString.call( src );
  if( result === '[object Console]' || result === '[object Object]' )
  return true;

  return false;
}

//

function printerLike( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( printerIs( src ) )
  return true;

  if( consoleIs( src ) )
  return true;

  return false;
}


//

function printerIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !src )
  return false;

  let prototype = Object.getPrototypeOf( src );
  if( !prototype )
  return false;

  if( src.MetaType === 'Printer' )
  return true;

  return false;
}

//

function loggerIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.Logger )
  return false;

  if( src instanceof _.Logger )
  return true;

  return false;
}

//

function processIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  let typeOf = _.strType( src );
  if( typeOf === 'ChildProcess' || typeOf === 'process' )
  return true;

  return false;
}

//

let Inspector = null;

function processIsDebugged()
{
  _.assert( arguments.length === 0 );

  if( typeof process === 'undefined' )
  return false;

  if( Inspector === null )
  try
  {
    Inspector = require( 'inspector' );
  }
  catch( err )
  {
    Inspector = false;
  }

  if( Inspector )
  return _.strIs( Inspector.url() );

  if( !process.execArgv.length )
  return false;

  let execArgvString = process.execArgv.join();
  return _.strHasAny( execArgvString, [ '--inspect', '--inspect-brk', '--debug-brk' ] );
}

//

function definitionIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !src )
  return false;

  if( !_.define )
  return false;

  return src instanceof _.define.Definition;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  /* qqq : requires good tests */

  nothingIs,
  definedIs,
  primitiveIs,
  containerIs,
  containerLike,

  symbolIs,
  bigIntIs,

  vectorIs,
  constructorIsVector,
  spaceIs,
  constructorIsSpace,

  consequenceIs,
  consequenceLike,
  promiseIs,
  promiseLike,

  typeOf,
  prototypeOf,
  prototypeHas,
  prototypeIs,
  prototypeIsStandard,
  constructorIs,
  constructorIsStandard,
  instanceIs,
  instanceIsStandard,
  instanceLike,

  workerIs,
  streamIs,
  consoleIs,
  printerLike,
  printerIs,
  loggerIs,
  processIs,
  processIsDebugged,
  definitionIs,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fChecker.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fChecker_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fChecker_s

( function fEntity_s() { // == begin of file fEntity_s
function fEntity_s_naked() {
( function _fEntity_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// multiplier
// --

function dup( ins, times, result )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.numberIs( times ) || _.longIs( times ), 'dup expects times as number or array' );

  if( _.numberIs( times ) )
  {
    if( !result )
    result = new Array( times );
    for( let t = 0 ; t < times ; t++ )
    result[ t ] = ins;
    return result;
  }
  else if( _.longIs( times ) )
  {
    _.assert( times.length === 2 );
    let l = times[ 1 ] - times[ 0 ];
    if( !result )
    result = new Array( times[ 1 ] );
    for( let t = 0 ; t < l ; t++ )
    result[ times[ 0 ] + t ] = ins;
    return result;
  }
  else _.assert( 0, 'unexpected' );

}

//

function multiple( src, times )
{
  _.assert( arguments.length === 2 );
  if( _.arrayLike( src ) )
  _.assert( src.length === times, () => 'Vector should have ' + times + ' elements, but have ' + src.length );
  else
  src = _.dup( src, times );
  return src;
}

//

function multipleAll( dsts )
{
  let length = undefined;

  _.assert( arguments.length === 1 );

  for( let d = 0 ; d < dsts.length ; d++ )
  if( _.arrayIs( dsts[ d ] ) )
  {
    length = dsts[ d ].length;
    break;
  }

  if( length === undefined )
  return dsts;

  for( let d = 0 ; d < dsts.length ; d++ )
  dsts[ d ] = _.multiple( dsts[ d ], length );

  return dsts;
}

// --
// entity iterator
// --

/**
 * Routine eachSample() accepts the container {-o.sets-} with scalar or vector elements.
 * Routine returns an array of vectors. Each vector is a unique combination of elements of vectors
 * that is passed in option {-o.sets-}.
 *
 * Routine eachSample() accepts the options map {-o-} or two arguments. If options map
 * is used, all parameters can be set. If passed two arguments, first of them is ( sets )
 * and second is ( onEach ).
 *
 * @param {Array|Map} sets - Container with vector and scalar elements to combine new vectors.
 * @param {Routine|Null} onEach - Callback. Should not change elements of {-sample-}.
 * @param {Array|Map} sample - Container for new vectors. If not passed, routine create empty container.
 * @param {boolean} leftToRight - Sets the direction of combining. 1 - left to rigth, 0 - rigth to left. By default is 1.
 * @param {boolean} result - Sets retuned value. 1 - array with verctors, 0 - index of last element. By default is 1.
 *
 * @example
 * //returns  [ [ 0, 2 ], [ 1, 2 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], 2 ] });
 *
 * @example
 * //returns  [ [ 0, 2 ], [ 1, 2 ],
 *              [ 0, 3 ], [ 1, 3 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ] });
 *
 * @example
 * //returns  [ { a : 0, b : 2}, { a : 1, b : 2},
 *              { a : 0, b : 3}, { a : 1, b : 3} ]
 * var got = _.eachSample( { sets : { a : [ 0, 1 ], b : [ 2, 3 ] } });
 *
 * @example
 * //returns  [ [ 3, 0 ], [ 2, 0 ],
 *              [ 3, 1 ], [ 2, 1 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], leftToRight : 0 });
 *
 * @example
 * //returns  3
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], result : 0 });
 *
 * @function eachSample
 * @returns {Array} Returns array contained  check function.
 * @throws {exception} If ( arguments.length ) is less then one or more then two.
 * @throws {exception} If( onEach ) is not a Routine or null.
 * @throws {exception} If( o.sets ) is not array or objectLike.
 * @throws {exception} If ( sets ) is mapLike and ( onEach ) not passed.
 * @throws {exception} If( o.base ) or ( o.add) is undefined.
 * @memberof wTools
 */

function eachSample( o )
{

  if( arguments.length === 2 || _.arrayLike( arguments[ 0 ] ) )
  {
    o =
    {
      sets : arguments[ 0 ],
      onEach : arguments[ 1 ],
    }
  }

  _.routineOptions( eachSample, o );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( o.onEach ) || o.onEach === null );
  _.assert( _.arrayIs( o.sets ) || _.mapLike( o.sets ) );
  _.assert( o.base === undefined && o.add === undefined );

  /* sample */

  if( !o.sample )
  // Dmytro:
  // qqq: I think entityMakeTivial should be entityMakeTrivial. 7 missprints founded in wTools. Maybe, willbe contains this also.
  o.sample = _.entityMakeTivial( o.sets );

  /* */

  let keys = _.longIs( o.sets ) ? _.arrayFromRange([ 0, o.sets.length ]) : _.mapKeys( o.sets );
  if( o.result && !_.arrayIs( o.result ) )
  o.result = [];
  let len = [];
  let indexnd = [];
  let index = 0;
  let l = _.entityLength( o.sets );

  /* sets */

  let sindex = 0;

  // _.each( o.sets, function( e, k )
  // {
  //   let set = o.sets[ k ];
  //   _.assert( _.longIs( set ) || _.primitiveIs( set ) );
  //
  //   if( _.primitiveIs( set ) )
  //   o.sets[ k ] = [ set ]; /* qqq : should not change input data */
  //
  //   len[ sindex ] = _.entityLength( o.sets[ k ] );
  //   indexnd[ sindex ] = 0;
  //   sindex += 1;
  // });

  /* qqq : add tests */

  o.sets = _.filter( o.sets, function( set, k )
  {
    _.assert( _.longIs( set ) || _.primitiveIs( set ) );

    if( _.primitiveIs( set ) )
    set = [ set ]; /* qqq : should not change input data */

    len[ sindex ] = _.entityLength( o.sets[ k ] );
    indexnd[ sindex ] = 0;
    sindex += 1;

    return set;
  });

  /* */

  if( !firstSample() )
  return o.result;

  do
  {
    if( o.onEach )
    o.onEach.call( o.sample, o.sample, index );
  }
  while( iterate() );

  if( o.result )
  return o.result;
  else
  return index;

  /* */

  function firstSample()
  {
    let sindex = 0;

    _.each( o.sets, function( e, k )
    {
      o.sample[ k ] = o.sets[ k ][ indexnd[ sindex ] ];
      sindex += 1;
      if( !len[ k ] )
      return 0;
    });

    if( o.result )
    if( _.mapLike( o.sample ) )
    o.result.push( _.mapExtend( null, o.sample ) );
    else
    o.result.push( o.sample.slice() );

    return 1;
  }

  /* */

  function nextSample( i )
  {

    let k = keys[ i ];
    indexnd[ i ]++;

    if( indexnd[ i ] >= len[ i ] )
    {
      indexnd[ i ] = 0;
      o.sample[ k ] = o.sets[ k ][ indexnd[ i ] ];
    }
    else
    {
      o.sample[ k ] = o.sets[ k ][ indexnd[ i ] ];
      index += 1;

      if( o.result )
      if( _.mapLike( o.sample ) )
      o.result.push( _.mapExtend( null, o.sample ) );
      else
      o.result.push( o.sample.slice() );

      return 1;
    }

    return 0;
  }

  /* */

  function iterate()
  {

    if( o.leftToRight )
    for( let i = 0 ; i < l ; i++ )
    {
      if( nextSample( i ) )
      return 1;
    }
    else for( let i = l - 1 ; i >= 0 ; i-- )
    {
      if( nextSample( i ) )
      return 1;
    }

    return 0;
  }

}

eachSample.defaults =
{

  leftToRight : 1,
  onEach : null,

  sets : null,
  sample : null,

  result : 1,

}

//

function entityEach( src, onEach )
{

  _.assert( arguments.length === 2 );
  _.assert( onEach.length <= 3 );
  // _.assert( onEach.length <= 2 );
  _.assert( _.routineIs( onEach ) );

  /* */

  if( _.longIs( src ) )
  {

    for( let k = 0 ; k < src.length ; k++ )
    {
      onEach( src[ k ], k, src );
    }

  }
  else if( _.objectLike( src ) )
  {

    for( let k in src )
    {
      onEach( src[ k ], k, src );
    }

  }
  else
  {
    onEach( src, undefined, undefined );
  }

  /* */

  return src;
}

//

function entityEachKey( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( onEach.length <= 3 );
  // _.assert( onEach.length <= 2 );
  _.assert( _.routineIs( onEach ) );

  /* */

  if( _.longIs( src ) )
  {

    for( let index = 0 ; index < src.length ; index++ )
    {
      onEach( src[ index ], undefined, index, src );
    }

  }
  else if( _.objectLike( src ) )
  {

    let index = 0;
    for( let k in src )
    {
      onEach( k, src[ k ], index, src );
      index += 1;
    }

  }
  else
  {
    onEach( src, undefined, undefined, undefined );
  }

  /* */

  return src;

  // if( arguments.length === 2 )
  // o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }
  //
  // _.routineOptions( eachKey, o );
  // _.assert( arguments.length === 1 || arguments.length === 2 );
  // _.assert( o.onUp && o.onUp.length <= 3 );
  //
  // /* */
  //
  // if( _.longIs( o.src ) )
  // {
  //
  //   for( let index = 0 ; index < o.src.length ; index++ )
  //   {
  //     o.onUp.call( o, o.src[ index ], undefined, index );
  //   }
  //
  // }
  // else if( _.objectLike( o.src ) )
  // {
  //
  //   let index = 0;
  //   for( let k in o.src )
  //   {
  //     o.onUp.call( o, k, o.src[ k ], index );
  //     index += 1;
  //   }
  //
  // }
  // else _.assert( 0, 'not container' );
  //
  // /* */
  //
  // return src;
}

var defaults = entityEachKey.defaults = Object.create( null );

defaults.src = null;
defaults.onUp = function( e, k ){};

//

function entityEachOwn( src, onEach )
{

  _.assert( arguments.length === 2 );
  _.assert( onEach.length <= 3 );
  // _.assert( onEach.length <= 2 );
  _.assert( _.routineIs( onEach ) );

  /* */

  if( _.longIs( src ) )
  {

    for( let k = 0 ; k < src.length ; k++ )
    {
      onEach( src[ k ], k, src );
    }

  }
  else if( _.objectLike( src ) )
  {

    for( let k in src )
    {
      if( !_ObjectHasOwnProperty.call( src, k ) )
      continue;
      onEach( src[ k ], k, src );
    }

  }
  else
  {
    onEach( src, undefined, undefined );
  }

  /* */

  return src;
}

//

function entityAll( src, onEach )
{
  let result = true;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ) );
  // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );

  /* */

  if( _.routineIs( onEach ) )
  {

    if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = onEach( src[ k ], k, src );
        if( !result )
        return result;
      }

    }
    else if( _.objectLike( src ) )
    {

      for( let k in src )
      {
        result = onEach( src[ k ], k, src );
        if( !result )
        return result;
      }

    }
    else
    {
      result = onEach( src, undefined, undefined );
      if( !result )
      return result;
    }

  }
  else
  {

    if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = src[ k ];
        if( !result )
        return result;
      }

    }
    else if( _.objectLike( src ) )
    {

      for( let k in src )
      {
        result = src[ k ];
        if( !result )
        return result;
      }

    }
    else
    {
      result = src;
      if( !result )
      return result;
    }

  }

  /* */

  return true;
}

//

function entityAny( src, onEach )
{
  let result = false;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ) );
  // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );

  /* */

  if( _.routineIs( onEach ) )
  {

    if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = onEach( src[ k ], k, undefined );
        if( result )
        return result;
      }

    }
    else if( _.objectLike( src ) )
    {

      for( let k in src )
      {
        result = onEach( src[ k ], k, undefined );
        if( result )
        return result;
      }

    }
    else
    {
      result = onEach( src, undefined, undefined );
      if( result )
      return result;
    }

  }
  else
  {

    if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = src[ k ];
        if( result )
        return result;
      }

    }
    else if( _.objectLike( src ) )
    {

      for( let k in src )
      {
        result = src[ k ];
        if( result )
        return result;
      }

    }
    else
    {
      result = src;
      if( result )
      return result;
    }

  }

  /* */

  return false;
}

//

function entityNone( src, onEach )
{
  let result = true;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ) );
  // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );

  /* */

  if( _.routineIs( onEach ) )
  {

    if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = onEach( src[ k ], k, src );
        if( result )
        return !result;
      }

    }
    else if( _.objectLike( src ) )
    {

      for( let k in src )
      {
        result = onEach( src[ k ], k, src );
        if( result )
        return !result;
      }

    }
    else
    {
      result = onEach( src, undefined, undefined );
      if( result )
      return !result;
    }

  }
  else
  {

    if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = src[ k ];
        if( result )
        return !result;
      }

    }
    else if( _.objectLike( src ) )
    {

      for( let k in src )
      {
        result = src[ k ];
        if( result )
        return !result;
      }

    }
    else
    {
      result = src;
      if( result )
      return !result;
    }

  }

  /* */

  return true;
}

//

/**
 * Returns generated function that takes single argument( e ) and can be called to check if object( e )
 * has at least one key/value pair that is represented in( condition ).
 * If( condition ) is provided as routine, routine uses it to check condition.
 * Generated function returns origin( e ) if conditions is true, else undefined.
 *
 * @param {object|function} condition - Map to compare with( e ) or custom function.
 * @returns {function} Returns condition check function.
 *
 * @example
 * //returns Object {a: 1}
 * let check = _._filter_functor( { a : 1, b : 1, c : 1 } );
 * check( { a : 1 } );
 *
 * @example
 * //returns false
 * function condition( src ){ return src.y === 1 }
 * let check = _._filter_functor( condition );
 * check( { a : 2 } );
 *
 * @function _filter_functor
 * @throws {exception} If no argument provided.
 * @throws {exception} If( condition ) is not a Routine or Object.
 * @memberof wTools
 */

function _filter_functor( condition, levels )
{
  let result;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.routineIs( condition ) || _.objectIs( condition ) );

  if( _.objectIs( condition ) )
  {
    let template = condition;
    condition = function selector( e, k, src )
    {
      _.assert( arguments.length === 3 );
      if( e === template )
      return e;
      if( !_.objectLike( e ) )
      return;
      let satisfied = _.mapSatisfy
      ({
        /*ttt*/template,
        src : e,
        /*ttt*/levels
      });
      if( satisfied )
      return e;
    };
  }

  return condition;
}

//

/**
 * Function that produces an elements for entityMap result
 * @callback wTools.onEach
 * @param {*} val - The current element being processed in the entity.
 * @param {string|number} key - The index (if entity is array) or key of processed element.
 * @param {Array|Object} src - The src passed to entityMap.
 */

/**
 * Creates new instance with same as( src ) type. Elements of new instance results of calling a provided ( onEach )
 * function on every element of src. If entity is array, the new array has the same length as source.
 *
 * @example
  let numbers = [ 3, 4, 6 ];

  function sqr( v )
  {
    return v * v
  };

  let res = wTools.entityMap(numbers, sqr);
  // [ 9, 16, 36 ]
  // numbers is still [ 3, 4, 6 ]

  function checkSidesOfTriangle( v, i, src )
  {
    let sumOthers = 0,
      l = src.length,
      j;

    for ( j = 0; j < l; j++ )
    {
      if ( i === j ) continue;
      sumOthers += src[ j ];
    }
    return v < sumOthers;
  }

  let res = wTools.entityMap( numbers, checkSidesOfTriangle );
 // [ true, true, true ]
 *
 * @param {ArrayLike|ObjectLike} src - Entity, on each elements of which will be called ( onEach ) function.
 * @param {wTools.onEach} onEach - Function that produces an element of the new entity.
 * @returns {ArrayLike|ObjectLike} New entity.
 * @thorws {Error} If number of arguments less or more than 2.
 * @thorws {Error} If( src ) is not Array or ObjectLike.
 * @thorws {Error} If( onEach ) is not function.
 * @function entityMap
 * @memberof wTools
 */

function entityMap( src, onEach )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.routineIs( onEach ) );

  let result;

  if( _.longIs( src ) )
  {
    result = _.entityMakeTivial( src );
    for( let s = 0 ; s < src.length ; s++ )
    {
      result[ s ] = onEach( src[ s ], s, src );
      _.assert( result[ s ] !== undefined, '{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )' )
    }
  }
  else if( _.objectLike( src ) )
  {
    result = _.entityMakeTivial( src );
    for( let s in src )
    {
      result[ s ] = onEach( src[ s ], s, src );
      _.assert( result[ s ] !== undefined, '{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )' )
    }
  }
  else
  {
    result = onEach( src, undefined, undefined );
    _.assert( result !== undefined, '{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )' )

  }

  return result;
}

//

/* qqq :
cover entityFilter and entityFilterDeep
take into account unroll cases
*/

function entityFilter( src, onEach )
{
  let result;

  onEach = _._filter_functor( onEach, 1 );

  _.assert( arguments.length === 2 );
  // _.assert( _.objectLike( src ) || _.longIs( src ), () => 'Expects objectLike or longIs src, but got ' + _.strType( src ) );
  _.assert( _.routineIs( onEach ) );
  _.assert( src !== undefined, 'Expects src' );

  /* */

  if( _.longIs( src ) )
  {

    result = _.longMake( src, 0 );
    let s, d;
    for( s = 0, d = 0 ; s < src.length ; s++ )
    {
      let r = onEach.call( src, src[ s ], s, src );
      if( _.unrollIs( r ) )
      {
        _.arrayAppendArray( result, r );
        d += r.length;
      }
      else if( r !== undefined )
      {
        result[ d ] = r;
        d += 1;
      }
    }
    if( d < src.length )
    result = _.arraySlice( result, 0, d );

  }
  // else if( _.objectLike( src ) )
  else if( _.mapLike( src ) )
  {

    result = _.entityMakeTivial( src );
    for( let s in src )
    {
      let r = onEach.call( src, src[ s ], s, src );
      if( r !== undefined )
      result[ s ] = r;
    }

  }
  else
  {

    result = onEach.call( null, src, null, null );

  }

  /* */

  return result;
}

//

function _entityFilterDeep( o )
{

  let result;
  let onEach = _._filter_functor( o.onEach, o.conditionLevels );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectLike( o.src ) || _.longIs( o.src ), 'entityFilter : expects objectLike or longIs src, but got', _.strType( o.src ) );
  _.assert( _.routineIs( onEach ) );

  /* */

  if( _.longIs( o.src ) )
  {
    result = _.longMake( o.src, 0 );
    let s, d;
    for( s = 0, d = 0 ; s < o.src.length ; s++ )
    // for( let s = 0, d = 0 ; s < o.src.length ; s++, d++ )
    {
      let r = onEach.call( o.src, o.src[ s ], s, o.src );

      if( _.unrollIs( r ) )
      {
        _.arrayAppendArray( result, r );
        d += r.length;
      }
      else if( r !== undefined )
      {
        result[ d ] = r;
        d += 1;
      }

      // if( r === undefined )
      // d--;
      // else
      // result[ d ] = r;

    }
    debugger;
    if( d < o.src.length )
    result = _.arraySlice( result, 0, d );
  }
  else
  {
    result = _.entityMakeTivial( o.src );
    for( let s in o.src )
    {
      let r = onEach.call( o.src, o.src[ s ], s, o.src );
      // r = onEach.call( o.src, o.src[ s ], s, o.src );
      if( r !== undefined )
      result[ s ] = r;
    }
  }

  /* */

  return result;
}

_entityFilterDeep.defaults =
{
  src : null,
  onEach : null,
  conditionLevels : 1,
}

//

function entityFilterDeep( src, onEach )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _entityFilterDeep
  ({
    /*ttt*/src,
    /*ttt*/onEach,
    conditionLevels : 1024,
  });
}

// --
// entity modifier
// --

function enityExtend( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.objectIs( src ) || _.longIs( src ) )
  {

    _.each( src, function( e, k )
    {
      dst[ k ] = e;
    });

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

function enityExtendAppending( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.objectIs( src ) )
  {

    _.each( src, function( e, k )
    {
      dst[ k ] = e;
    });

  }
  else if( _.longIs( src ) )
  {

    if( dst === null || dst === undefined )
    dst = _.longSlice( src );
    else
    _.arrayAppendArray( dst, src );

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

function entityMake( src, length )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( src ) )
  {
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.longIs( src ) )
  {
    if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
    return new src.constructor( length !== undefined ? length : src.length );
    else
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.mapIs( src ) )
  {
    return Object.create( null );
  }
  else if( _.objectIs( src ) )
  {
    return new src.constructor();
  }
  else _.assert( 0, 'unexpected' );

}

//

function entityMakeTivial( src, length )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( src ) )
  {
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.longIs( src ) )
  {
    if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
    return new src.constructor( length !== undefined ? length : src.length );
    else
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.objectIs( src ) )
  {
    return Object.create( null );
  }
  else _.assert( 0, 'unexpected' );

}

//

function entityShallowClone( src )
{

  if( _.primitiveIs( src ) )
  return src;
  else if( _.mapIs( src ) )
  return _.mapShallowClone( src )
  else if( _.longIs( src ) )
  return _.longShallowClone( src );
  else _.assert( 0, 'Not clear how to shallow clone', _.strType( src ) );

}

//

/**
 * Copies entity( src ) into( dst ) or returns own copy of( src ).Result depends on several moments:
 * -If( src ) is a Object - returns clone of( src ) using ( onRecursive ) callback function if its provided;
 * -If( dst ) has own 'copy' routine - copies( src ) into( dst ) using this routine;
 * -If( dst ) has own 'set' routine - sets the fields of( dst ) using( src ) passed to( dst.set );
 * -If( src ) has own 'clone' routine - returns clone of( src ) using ( src.clone ) routine;
 * -If( src ) has own 'slice' routine - returns result of( src.slice ) call;
 * -Else returns a copy of entity( src ).
 *
 * @param {object} dst - Destination object.
 * @param {object} src - Source object.
 * @param {routine} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = { set : function( src ) { this.str = src.src } };
 * let src = { src : 'string' };
 *  _.entityAssign( dst, src );
 * console.log( dst.str )
 * //returns "string"
 *
 * @example
 * let dst = { copy : function( src ) { for( let i in src ) this[ i ] = src[ i ] } }
 * let src = { src : 'string', num : 123 }
 *  _.entityAssign( dst, src );
 * console.log( dst )
 * //returns Object {src: "string", num: 123}
 *
 * @example
 * //returns 'string'
 *  _.entityAssign( null, new String( 'string' ) );
 *
 * @function entityAssign
 * @throws {exception} If( arguments.length ) is not equal to 3 or 2.
 * @throws {exception} If( onRecursive ) is not a Routine.
 * @memberof wTools
 *
 */

function entityAssign( dst, src, onRecursive )
{
  let result;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( arguments.length < 3 || _.routineIs( onRecursive ) );

  if( src === null )
  {

    result = src;

  }
  else if( dst && _.routineIs( dst.copy ) )
  {

    dst.copy( src );

  }
  else if( src && _.routineIs( src.clone ) )
  {

    if( dst instanceof src.constructor )
    {
      throw _.err( 'not tested' );
      result = src.clone( dst );
    }
    else if( _.primitiveIs( dst ) || _.longIs( dst ) )
    {
      result = src.clone();
    }
    else _.assert( 0, 'unknown' );

  }
  else if( src && _.routineIs( src.slice ) )
  {

    result = src.slice();

  }
  else if( dst && _.routineIs( dst.set ) )
  {

    dst.set( src );

  }
  else if( _.objectIs( src ) )
  {

    if( onRecursive )
    result = _.mapCloneAssigning({ srcMap : src, dstMap : _.primitiveIs( dst ) ? Object.create( null ) : dst, onField : onRecursive } );
    else
    result = _.mapCloneAssigning({ srcMap : src });

  }
  else
  {

    result = src;

  }

  return result;
}

//

/**
 * Short-cut for entityAssign function. Copies specified( name ) field from
 * source container( srcContainer ) into( dstContainer ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcContainer - Source object.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * _.entityAssignFieldFromContainer(dst, src, name );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * function onRecursive( dstContainer, srcContainer, key )
 * {
 *   _.assert( _.strIs( key ) );
 *   dstContainer[ key ] = srcContainer[ key ];
 * };
 * _.entityAssignFieldFromContainer(dst, src, name, onRecursive );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @function entityAssignFieldFromContainer
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */

function entityAssignFieldFromContainer( dstContainer, srcContainer, name, onRecursive )
{
  let result;

  _.assert( _.strIs( name ) || _.symbolIs( name ) );
  _.assert( arguments.length === 3 || arguments.length === 4 );

  let dstValue = _ObjectHasOwnProperty.call( dstContainer, name ) ? dstContainer[ name ] : undefined;
  let srcValue = srcContainer[ name ];

  if( onRecursive )
  result = entityAssign( dstValue, srcValue, onRecursive );
  else
  result = entityAssign( dstValue, srcValue );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

/**
 * Short-cut for entityAssign function. Assigns value of( srcValue ) to container( dstContainer ) field specified by( name ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcValue - Source value.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entity field assignment operation.
 *
 * @example
 * let dstContainer = { a : 1 };
 * let srcValue = 15;
 * let name = 'a';
 * _.entityAssignField( dstContainer, srcValue, name );
 * console.log( dstContainer.a );
 * //returns 15
 *
 * @function entityAssignField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */

function entityAssignField( dstContainer, srcValue, name, onRecursive )
{
  let result;

  _.assert( _.strIs( name ) || _.symbolIs( name ) );
  _.assert( arguments.length === 3 || arguments.length === 4 );

  let dstValue = dstContainer[ name ];

  if( onRecursive )
  {
    throw _.err( 'not tested' );
    result = entityAssign( dstValue, srcValue, onRecursive );
  }
  else
  {
    result = entityAssign( dstValue, srcValue );
  }

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

/**
 * The result of _entityMost routine object.
 * @typedef {Object} wTools.entityMostResult
 * @property {Number} index - Index of found element.
 * @property {String|Number} key - If the search was on map, the value of this property sets to key of found element.
 * Else if search was on array - to index of found element.
 * @property {Number} value - The found result of onEvaluate, if onEvaluate don't set, this value will be same as element.
 * @property {Number} element - The appropriate element for found value.
 */

/**
 * Returns object( wTools.entityMostResult ) that contains min or max element of entity, it depends on( returnMax ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @param {Boolean} returnMax  - If true - routine returns maximum, else routine returns minimum value from entity.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 * //returns { index: 0, key: 0, value: 1, element: 1 }
 * _._entityMost([ 1, 3, 3, 9, 10 ], undefined, 0 );
 *
 * @example
 * //returns { index: 4, key: 4, value: 10, element: 10 }
 * _._entityMost( [ 1, 3, 3, 9, 10 ], undefined, 1 );
 *
 * @example
 * //returns { index: 4, key: 4, value: 10, element: 10 }
 * _._entityMost( { a : 1, b : 2, c : 3 }, undefined, 0 );
 *
 * @private
 * @function _entityMost
 * @throws {Exception} If( arguments.length ) is not equal 3.
 * @throws {Exception} If( onEvaluate ) function is not implemented.
 * @memberof wTools
 */

function _entityMost( src, onEvaluate, returnMax )
{

  if( onEvaluate === undefined )
  onEvaluate = function( element ){ return element; }

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( onEvaluate.length === 1, 'not mplemented' );

  let onCompare = null;

  if( returnMax )
  onCompare = function( a, b )
  {
    return a-b;
  }
  else
  onCompare = function( a, b )
  {
    return b-a;
  }

  _.assert( onEvaluate.length === 1 );
  _.assert( onCompare.length === 2 );

  let result = { index : -1, key : undefined, value : undefined, element : undefined };

  if( _.longIs( src ) )
  {

    if( src.length === 0 )
    return result;
    result.key = 0;
    result.value = onEvaluate( src[ 0 ] );
    result.element = src[ 0 ];

    for( let s = 0 ; s < src.length ; s++ )
    {
      let value = onEvaluate( src[ s ] );
      if( onCompare( value, result.value ) > 0 )
      {
        result.key = s;
        result.value = value;
        result.element = src[ s ];
      }
    }
    result.index = result.key;

  }
  else
  {

    debugger;
    for( let s in src )
    {
      result.index = 0;
      result.key = s;
      result.value = onEvaluate( src[ s ] );
      result.element = src[ s ]
      break;
    }

    let index = 0;
    for( let s in src )
    {
      let value = onEvaluate( src[ s ] );
      if( onCompare( value, result.value ) > 0 )
      {
        result.index = index;
        result.key = s;
        result.value = value;
        result.element = src[ s ];
      }
      index += 1;
    }

  }

  return result;
}

//

/**
 * Short-cut for _entityMost() routine. Returns object( wTools.entityMostResult ) with smallest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index : 2, key : 'c', value 3: , element : 9  };
 *  let obj = { a : 25, b : 16, c : 9 };
 *  let min = wTools.entityMin( obj, Math.sqrt );
 *
 * @see wTools.onEach
 * @see wTools.entityMostResult
 * @function entityMin
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */

function entityMin( src, onEvaluate )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return _entityMost( src, onEvaluate, 0 );
}

//

/**
 * Short-cut for _entityMost() routine. Returns object( wTools.entityMostResult ) with biggest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index: 0, key: "a", value: 25, element: 25 };
 *  let obj = { a: 25, b: 16, c: 9 };
 *  let max = wTools.entityMax( obj );
 *
 * @see wTools.onEach
 * @see wTools.entityMostResult
 * @function entityMax
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */

function entityMax( src, onEvaluate )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return _entityMost( src, onEvaluate, 1 );
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  // multiplier

  dup,
  multiple,
  multipleAll,

  // entity iterator

  eachSample,

  entityEach,
  each : entityEach,
  entityEachKey,
  eachKey : entityEachKey,
  entityEachOwn,
  eachOwn : entityEachOwn,

  entityAll,
  all : entityAll,
  entityAny,
  any : entityAny,
  entityNone,
  none : entityNone,

  _filter_functor,
  entityMap,
  map : entityMap,
  entityFilter,
  filter : entityFilter,
  _entityFilterDeep,
  entityFilterDeep,
  filterDeep : entityFilterDeep,

  // entity modifier

  enityExtend,
  enityExtendAppending,

  entityMake,
  entityMakeTivial,
  entityShallowClone,

  entityAssign, /* refactor!!! */
  entityAssignFieldFromContainer, /* dubious */
  entityAssignField, /* dubious */

  _entityMost,
  entityMin,
  entityMax,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

// if( typeof module !== 'undefined' )
// if( _global.WTOOLS_PRIVATE )
// { /* delete require.cache[ module.id ]; */ }

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fEntity.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fEntity_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fEntity_s

( function fErr_s() { // == begin of file fErr_s
function fErr_s_naked() {
( function _fErr_s_() {

'use strict';

/*

!!! implemen error's collectors

*/

// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// stub
// --

function diagnosticStack( stack )
{
  if( _.errIs( stack ) )
  return stack.stack || stack;
  return new Error().stack;
}

//

function diagnosticStackCondense( stack )
{
  if( _.errIs( stack ) )
  return stack.stack || stack;
  return new Error().stack;
}

//

function diagnosticLocation()
{
  return Object.create( null );
}

//

function diagnosticCode()
{
  return undefined;
}

// --
// error
// --

function errIs( src )
{
  return src instanceof Error || Object.prototype.toString.call( src ) === '[object Error]';
}

//

function errIsRefined( src )
{
  if( _.errIs( src ) === false )
  return false;
  return src.originalMessage !== undefined;
}

//

function errIsAttended( src )
{
  if( _.errIs( src ) === false )
  return false;
  return !!src.attended;
}

//

function errIsAttentionRequested( src )
{
  if( _.errIs( src ) === false )
  return false;
  return src.attentionRequested;
}

//

function errAttentionRequest( err )
{

  if( arguments.length !== 1 )
  throw Error( 'errAttentionRequest : Expects one argument' );
  if( !_.errIs( err ) )
  throw Error( 'errAttentionRequest : Expects error as the first argument' );

  Object.defineProperty( err, 'attended',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : 0,
  });

  Object.defineProperty( err, 'attentionRequested',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : 1,
  });

  return err;
}

//

/**
 * Creates Error object based on passed options.
 * Result error contains in message detailed stack trace and error description.
 * @param {Object} o Options for creating error.
 * @param {String[]|Error[]} o.args array with messages or errors objects, from which will be created Error obj.
 * @param {number} [o.level] using for specifying in error message on which level of stack trace was caught error.
 * @returns {Error} Result Error. If in `o.args` passed Error object, result will be reference to it.
 * @private
 * @throws {Error} Expects single argument if pass les or more than one argument
 * @throws {Error} o.args should be array like, if o.args is not array.
 * @function _err
 * @memberof wTools
 */

function _err( o )
{
  let result;

  if( arguments.length !== 1 )
  throw Error( '_err : expects single argument' );

  if( !_.longIs( o.args ) )
  throw Error( '_err : o.args should be array like' );

  if( o.usingSourceCode === undefined )
  o.usingSourceCode = _err.defaults.usingSourceCode;

  if( o.condensingStack === undefined )
  o.condensingStack = _err.defaults.condensingStack;

  if( o.args[ 0 ] === 'not implemented' || o.args[ 0 ] === 'not tested' || o.args[ 0 ] === 'unexpected' )
  if( _.debuggerEnabled )
  debugger;

  /* let */

  let originalMessage = '';
  let catches = '';
  let sourceCode = '';
  let errors = [];
  let attended = 0;

  /* Error.stackTraceLimit = 99; */

  /* find error in arguments */

  for( let a = 0 ; a < o.args.length ; a++ )
  {
    let arg = o.args[ a ];

    if( !_.errIs( arg ) && _.routineIs( arg ) )
    {
      if( arg.length === 0 )
      {}
      else
      debugger;
      if( arg.length === 0 )
      arg = o.args[ a ] = arg();
      if( _.unrollIs( arg ) )
      {
        o.args = _.longButRange( o.args, [ a, a+1 ], arg );
        a -= 1;
        continue;
      }
    }

    if( _.errIs( arg ) )
    {

      if( !result )
      {
        result = arg;
        catches = result.catches || '';
        sourceCode = result.sourceCode || '';
        // if( o.args.length === 1 )
        attended = result.attended;
      }

      if( arg.attentionRequested === undefined )
      {
        Object.defineProperty( arg, 'attentionRequested',
        {
          enumerable : false,
          configurable : true,
          writable : true,
          value : 0,
        });
      }

      if( arg.originalMessage !== undefined )
      {
        o.args[ a ] = arg.originalMessage;
      }
      else
      {
        o.args[ a ] = arg.message || arg.msg || arg.constructor.name || 'unknown error';
        let fields = _.mapFields( arg );
        if( Object.keys( fields ).length )
        o.args[ a ] += '\n' + _.toStr( fields,{ wrap : 0, multiline : 1, levels : 2 } );
      }

      if( errors.length > 0 )
      o.args[ a ] = '\n' + o.args[ a ];
      errors.push( arg );

      o.location = _.diagnosticLocation({ error : arg, location : o.location });

    }

  }

  /* look into non-error arguments to find location */

  if( !result )
  for( let a = 0 ; a < o.args.length ; a++ )
  {
    let arg = o.args[ a ];

    if( !_.primitiveIs( arg ) && _.objectLike( arg ) )
    {
      o.location = _.diagnosticLocation({ error : arg, location : o.location });
    }

  }

  o.location = o.location || Object.create( null );

  /* level */

  if( !_.numberIs( o.level ) )
  o.level = _err.defaults.level;

  /* make new one if no error in arguments */

  let stack = o.stack;
  let stackCondensed = '';

  if( !result )
  {
    if( !stack )
    stack = o.fallBackStack;
    result = new Error( originalMessage + '\n' );
    if( !stack )
    {
      stack = _.diagnosticStack( result, [ o.level, -1 ] );
      if( o.location.full && stack.indexOf( '\n' ) === -1 )
      stack = o.location.full;
    }
  }
  else
  {
    if( result.stack !== undefined )
    {
      if( result.originalMessage !== undefined )
      {
        stack = result.stack;
        stackCondensed = result.stackCondensed;
      }
      else
      {
        stack = _.diagnosticStack( result );
      }
    }
    else
    {
      stack = _.diagnosticStack([ o.level, Infinity ]);
    }
  }

  if( !stack )
  stack = o.fallBackStack;

  if( _.strIs( stack ) && !_.strEnds( stack, '\n' ) )
  stack = stack + '\n';

  if( stack && !stackCondensed )
  {
    stackCondensed = _.diagnosticStackCondense( stack );
  }

  /* collect data */

  for( let a = 0 ; a < o.args.length ; a++ )
  {
    let argument = o.args[ a ];
    let str;

    if( argument && !_.primitiveIs( argument ) )
    {

      if( _.primitiveIs( argument ) )
      str = String( argument );
      else if( _.routineIs( argument.toStr ) )
      str = argument.toStr();
      else if( _.errIs( argument ) || _.strIs( argument.message ) )
      {
        if( _.strIs( argument.originalMessage ) ) str = argument.originalMessage;
        else if( _.strIs( argument.message ) ) str = argument.message;
        else str = _.toStr( argument );
      }
      else str = _.toStr( argument,{ levels : 2 } );

    }
    else if( argument === undefined )
    {
      str = '\n' + String( argument ) + '\n';
    }
    else
    {
      str = String( argument );
    }

    if( _.strIs( str ) && str[ str.length-1 ] === '\n' )
    originalMessage += str;
    else
    originalMessage += str + ' ';

  }

  /* source code */

  if( o.usingSourceCode )
  if( result.sourceCode === undefined )
  {
    let c = '';
    o.location = _.diagnosticLocation
    ({
      error : result,
      stack,
      location : o.location,
    });
    c = _.diagnosticCode
    ({
      location : o.location,
      sourceCode : o.sourceCode,
    });
    if( c && c.length < 400 )
    {
      sourceCode += c;
    }
  }

  /* where it was caught */

  let floc = _.diagnosticLocation( o.level );
  if( !floc.service || floc.service === 1 )
  catches = '    caught at ' + floc.fullWithRoutine + '\n' + catches;
  else
  debugger;

  /* message */

  let briefly = result.briefly || o.briefly;
  let message = messageForm();

  /* fields */

  if( o.location.line !== undefined )
  nonenurable( 'lineNumber', o.location.line );
  nonenurable( 'toString', function() { return this.message } );
  nonenurable( 'message', message );
  nonenurable( 'originalMessage', originalMessage );
  nonenurable( 'level', o.level );
  nonenurable( 'stack', stack );
  nonenurable( 'stackCondensed', stackCondensed );
  if( o.briefly )
  nonenurable( 'briefly', o.briefly );
  nonenurable( 'sourceCode', sourceCode || null );
  if( result.location === undefined )
  nonenurable( 'location', o.location );
  nonenurable( 'attended', attended );
  nonenurable( 'catches', catches );
  nonenurable( 'catchCounter', result.catchCounter ? result.catchCounter+1 : 1 );

  return result;

  /* */

  function nonenurable( fieldName, value )
  {
    try
    {
      Object.defineProperty( result, fieldName,
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value : value,
      });
    }
    catch( err )
    {
      console.error( err );
      debugger;
      if( _.debuggerEnabled )
      debugger;
    }
  }

  /* */

  function messageForm()
  {
    let message = '';
    if( briefly )
    {
      message += originalMessage;
    }
    else
    {
      message += ' = Message\n' + originalMessage + '\n';
      if( o.condensingStack )
      message += '\n = Condensed calls stack\n' + stackCondensed + '';
      else
      message += '\n = Functions stack\n' + stack + '';
      message += '\n = Catches stack\n' + catches + '\n';

      if( sourceCode )
      message += ' = Source code from ' + sourceCode + '\n';
    }
    return message;
  }

}

_err.defaults =
{
  /* to make catch stack work properly it should be 1 */
  level : 1,
  usingSourceCode : 1,
  condensingStack : 1,
  location : null,
  sourceCode : null,
  briefly : null,
  args : null,
  stack : null,
  fallBackStack : null,
}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them.
 *
 * @example
  function divide( x, y )
  {
    if( y == 0 )
      throw wTools.err( 'divide by zero' )
    return x / y;
  }
  divide( 3, 0 );

 // Error:
 // caught     at divide (<anonymous>:2:29)
 // divide by zero
 // Error
 //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 //   at wTools.err (file:///.../wTools/staging/Base.s:1449:10)
 //   at divide (<anonymous>:2:29)
 //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * reference.
 * @function err
 * @memberof wTools
 */

function err()
{
  return _err
  ({
    args : arguments,
    level : 2,
  });
}

//

function errBriefly()
{
  return _err
  ({
    args : arguments,
    level : 2,
    briefly : 1,
  });
}

//

function errAttend( err, val )
{

  if( arguments.length !== 1 || !_.errIsRefined( err ) )
  err = _err
  ({
    args : arguments,
    level : 2,
  });

  /* */

  try
  {

    if( val )
    Object.defineProperty( err, 'attentionRequested',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : 0,
    });

    Object.defineProperty( err, 'attended',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : Config.debug ? _.diagnosticStack([ 1, Infinity ]) : 1,
    });

  }
  catch( err )
  {
    logger.warn( 'Cant assign attentionRequested and attended properties to error ' + err.toString() );
  }

  /* */

  return err;
}

//

function errRestack( err,level )
{
  if( level === undefined )
  level = 1;

  let err2 = _._err
  ({
    args : [],
    level : level+1,
  });

  return _.err( err2,err );
}

//

function error_functor( name, onMake )
{

  if( _.strIs( onMake ) || _.arrayIs( onMake ) )
  {
    let prepend = onMake;
    onMake = function onErrorMake()
    {
      debugger;
      let arg = _.arrayAppendArrays( [], [ prepend, arguments ] );
      return args;
    }
  }
  else if( !onMake )
  onMake = function onErrorMake()
  {
    return arguments;
  }

  let Error =
  {
    [ name ] : function()
    {

      if( !( this instanceof ErrorConstructor ) )
      {
        let err1 = new ErrorConstructor();
        let args1 = onMake.apply( err1, arguments );
        _.assert( _.arrayLike( args1 ) );
        let args2 = _.arrayAppendArrays( [], [ [ err1, ( arguments.length ? '\n' : '' ) ], args1 ] );
        let err2 = _._err({ args : args2, level : 3 });

        _.assert( err1 === err2 );
        _.assert( err2 instanceof _global.Error );
        _.assert( err2 instanceof ErrorConstructor );
        _.assert( !!err2.stack );

        return err2;
      }
      else
      {
        _.assert( arguments.length === 0 );
        return this;
      }
    }
  }

  let ErrorConstructor = Error[ name ];

  _.assert( ErrorConstructor.name === name, 'Looks like your interpreter does not support dynamice naming of functions. Please use ES2015 or later interpreter.' );

  ErrorConstructor.prototype = Object.create( _global.Error.prototype );
  ErrorConstructor.prototype.constructor = ErrorConstructor;
  ErrorConstructor.constructor = ErrorConstructor;

  return ErrorConstructor;
}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them. Prints the created error.
 * If _global_.logger defined, routine will use it to print error, else uses console
 *
 * @see {@link wTools.err See err}
 *
 * @example
   function divide( x, y )
   {
      if( y == 0 )
        throw wTools.errLog( 'divide by zero' )
      return x / y;
   }
   divide( 3, 0 );

   // Error:
   // caught     at divide (<anonymous>:2:29)
   // divide by zero
   // Error
   //   at _err (file:///.../wTools/staging/Base.s:1418:13)
   //   at wTools.errLog (file:///.../wTools/staging/Base.s:1462:13)
   //   at divide (<anonymous>:2:29)
   //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * @function errLog
 * @memberof wTools
 */

function errLog()
{

  let c = _global.logger || _global.console;
  let err = _err
  ({
    args : arguments,
    level : 2,
  });

  return _._errLog( err );
}

//

function errLogOnce( err )
{

  err = _err
  ({
    args : arguments,
    level : 2,
  });

  if( err.attended )
  return err;

  return _._errLog( err );
}

//

function _errLog( err )
{
  let c = _global.logger || _global.console;

  debugger;

  /* */

  if( _.routineIs( err.toString ) )
  {
    let str = err.toString();
    if( _.loggerIs( c ) )
    c.error( str )
    // c.error( '#inputRaw : 1#' + str + '#inputRaw : 0#' )
    else
    c.error( str );
  }
  else
  {
    debugger;
    c.error( 'Error does not have toString' );
    c.error( err );
  }

  /* */

  _.errAttend( err );

  /* */

  return err;
}

//

function errOnce( err )
{

  err = _err
  ({
    args : arguments,
    level : 2,
  });

  if( err.attended )
  return undefined;

  _.errAttend( err );

  return err;
}

// --
// checker
// --

function checkInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  debugger;
  let result =
  (
    _this === _constructor ||
    _this instanceof _constructor ||
    Object.isPrototypeOf.call( _constructor,_this ) ||
    Object.isPrototypeOf.call( _constructor,_this.prototype )
  );
  return result;
}

//

function checkOwnNoConstructor( ins )
{
  _.assert( _.objectLikeOrRoutine( ins ) );
  _.assert( arguments.length === 1 );
  let result = !_ObjectHasOwnProperty.call( ins,'constructor' );
  return result;
}

// --
// sure
// --

function _sureDebugger( condition )
{
  if( _.debuggerEnabled )
  debugger;
}

//

function sure( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    _sureDebugger( condition );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : _.longSlice( arguments,1 ),
      level : 2,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureBriefly( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    _sureDebugger( condition );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
      briefly : 1,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
      briefly : 1,
    });
    else
    throw _err
    ({
      args : _.longSlice( arguments,1 ),
      level : 2,
      briefly : 1,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureWithoutDebugger( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : _.longSlice( arguments,1 ),
      level : 2,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureInstanceOrClass( _constructor, _this )
{
  _.sure( arguments.length === 2, 'Expects exactly two arguments' );
  _.sure( _.checkInstanceOrClass( _constructor, _this ) );
}

//

function sureOwnNoConstructor( ins )
{
  _.sure( _.objectLikeOrRoutine( ins ) );
  let args = _.longSlice( arguments );
  args[ 0 ] = _.checkOwnNoConstructor( ins );
  _.sure.apply( _, args );
}

// --
// assert
// --

/**
 * Checks condition passed by argument( condition ). Works only in debug mode. Uses StackTrace level 2.
 *
 * @see {@link wTools.err err}
 *
 * If condition is true routine returns without exceptions, otherwise routine generates and throws exception. By default generates error with message 'Assertion fails'.
 * Also generates error using message(s) or existing error object(s) passed after first argument.
 *
 * @param {*} condition - condition to check.
 * @param {String|Error} [ msgs ] - error messages for generated exception.
 *
 * @example
 * let x = 1;
 * wTools.assert( wTools.strIs( x ), 'incorrect variable type->', typeof x, 'Expects string' );
 *
 * // caught eval (<anonymous>:2:8)
 * // incorrect variable type-> number expects string
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4041)
 * //   at add (<anonymous>:2)
 * //   at <anonymous>:1
 *
 * @example
 * function add( x, y )
 * {
 *   wTools.assert( arguments.length === 2, 'incorrect arguments count' );
 *   return x + y;
 * }
 * add();
 *
 * // caught add (<anonymous>:3:14)
 * // incorrect arguments count
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4035)
 * //   at add (<anonymous>:3:14)
 * //   at <anonymous>:6
 *
 * @example
 *   function divide ( x, y )
 *   {
 *      wTools.assert( y != 0, 'divide by zero' );
 *      return x / y;
 *   }
 *   divide( 3, 0 );
 *
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.errLog (file://.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 * @throws {Error} If passed condition( condition ) fails.
 * @function assert
 * @memberof wTools
 */

function _assertDebugger( condition, args )
{
  if( !_.debuggerEnabled )
  return;
  let err = _err
  ({
    args : _.longSlice( args, 1 ),
    level : 3,
  });
  // console.error( 'Assertion failed' );
  debugger;
}

//

function assert( condition )
{

  if( Config.debug === false )
  return true;

  if( !condition )
  {
    _assertDebugger( condition, arguments );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : _.longSlice( arguments,1 ),
      level : 2,
    });
  }

  return true;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function assertWithoutBreakpoint( condition )
{

  /*return;*/

  if( Config.debug === false )
  return true;

  if( !condition || !_.boolLike( condition ) )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : _.longSlice( arguments,1 ),
      level : 2,
    });
  }

  return;
}

//

function assertNotTested( src )
{

  if( _.debuggerEnabled )
  debugger;
  _.assert( false,'not tested : ' + stack( 1 ) );

}

//

/**
 * If condition failed, routine prints warning messages passed after condition argument
 * @example
  function checkAngles( a, b, c )
  {
     wTools.assertWarn( (a + b + c) === 180, 'triangle with that angles does not exists' );
  };
  checkAngles( 120, 23, 130 );

 // triangle with that angles does not exists
 * @param condition Condition to check.
 * @param messages messages to print.
 * @function assertWarn
 * @memberof wTools
 */

function assertWarn( condition )
{

  if( Config.debug )
  return;

  if( !condition || !_.boolLike( condition ) )
  {
    console.warn.apply( console,[].slice.call( arguments,1 ) );
  }

}

//

function assertInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.checkInstanceOrClass( _constructor, _this ) );
}

//

function assertOwnNoConstructor( ins )
{
  _.assert( _.objectLikeOrRoutine( ins ) );
  let args = _.longSlice( arguments );
  args[ 0 ] = _.checkOwnNoConstructor( ins );

  if( args.length === 1 )
  args.push( () => 'Entity should not own constructor, but own ' + _.toStrShort( ins ) );

  _.assert.apply( _, args );
}

// --
// let
// --

/**
 * Throwen to indicate that operation was aborted by user or other subject.
 *
 * @error ErrorAbort
 * @memberof wTools
 */

// function ErrorAbort()
// {
//   this.message = arguments.length ? _.arrayFrom( arguments ) : 'Aborted';
// }
//
// ErrorAbort.prototype = Object.create( Error.prototype );

// let ErrorAbort = error_functor( 'ErrorAbort' );
//
// let error =
// {
//   ErrorAbort,
// }

// --
// fields
// --

// let error = Object.create( null );

/**
 * @property {Object} error={}
 * @property {Boolean} debuggerEnabled=!!Config.debug
 * @name ErrFields
 * @memberof wTools
 */

let Fields =
{
  // error,
  error : Object.create( null ),
  debuggerEnabled : !!Config.debug,
}

// --
// routines
// --

let Routines =
{

  // stub

  diagnosticStack,
  diagnosticStackCondense,
  diagnosticLocation,
  diagnosticCode,

  // error

  errIs,
  errIsRefined,
  errIsAttended,
  errIsAttentionRequested,
  errAttentionRequest,

  _err,
  err,
  errBriefly,
  errAttend,
  errRestack,
  error_functor,

  errLog,
  errLogOnce,
  _errLog,

  errOnce,

  // checker

  checkInstanceOrClass,
  checkOwnNoConstructor,

  // sure

  sure,
  sureBriefly,
  sureWithoutDebugger,
  sureInstanceOrClass,
  sureOwnNoConstructor,

  // assert

  assert,
  assertWithoutBreakpoint,
  assertNotTested,
  assertWarn,

  assertInstanceOrClass,
  assertOwnNoConstructor,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

Error.stackTraceLimit = Infinity;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fErr.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fErr_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fErr_s

( function fLong_s() { // == begin of file fLong_s
function fLong_s_naked() {
( function _fLong_s_() {

'use strict';

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
// let Object.prototype.toString = Object.prototype.toString;

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// arguments array
// --

function argumentsArrayIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Arguments]';
}

//

function argumentsArrayMake( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.numberIs( src ) || _.longIs( src ) );
  if( _.numberIs( src ) )
  return _argumentsArrayMake.apply( _, Array( src ) );
  else
  return _argumentsArrayMake.apply( _, src );
}

//

function _argumentsArrayMake()
{
  return arguments;
}

//

function argumentsArrayFrom( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.argumentsArrayIs( src ) )
  return src;
  return _.argumentsArrayMake( src );
}

// --
// unroll
// --

/**
 * The routine unrollIs() determines whether the passed value is an instance of type unroll ( unroll-array ).
 *
 * If {-src-} is an unroll, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( [] );
 *
 * @example
 * // returns false
 * _.unrollIs( 1 );
 *
 * @returns { boolean } Returns true if {-src-} is an unroll.
 * @function unrollIs
 * @memberof wTools
 */

function unrollIs( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return !!src[ _.unroll ];
}

//

/**
 * The routine unrollIsPopulated() determines whether the unroll-array has elements (length).
 *
 * If {-src-} is an unroll-array and has one or more elements, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( _.unrollMake( [] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( 1 );
 *
 * @returns { boolean } Returns true if argument ( src ) is an unroll-array and has one or more elements ( length ).
 * @function unrollIsPopulated
 * @memberof wTools
 */

function unrollIsPopulated( src )
{
  if( !_.unrollIs( src ) )
  return false;
  return src.length > 0;
}

//

/**
 * The routine unrollMake() returns a new unroll-array maked from {-src-}.
 *
 * Unroll constructed by attaching symbol _.unroll Symbol to ordinary array.
 * Making an unroll normalizes its content.
 *
 * @param { * } src - The number or array-like object to make unroll-array. Passing null returns an empty unroll.
 *
 * @example
 * // returns true  & false
 * let unroll = _.unrollMake( null );
 * _.unrollIs( unroll );
 * _.unrollIsPopulated( unroll );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * _.unrollIs( unroll );
 *
 * @example
 * //returns false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns a new unroll-array maked from {-src-}.
 * Otherwise, it returns the empty unroll.
 * @function unrollMake
 * @throws { Error } If ( arguments.length ) is less or more then one.
 * @throws { Error } If argument ( src ) is not number, not array, not null.
 * @memberof wTools
 */

function unrollMake( src )
{
  let result = _.arrayMake( src );
  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( result ) );
  result[ _.unroll ] = true;
  if( !_.unrollIs( src ) )
  result = _.unrollNormalize( result );
  return result;
}

//

/**
 * The routine unrollFrom() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFrom() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 *
 * @param { * } src - The number, array-like object or unroll-array. Passing null returns an empty unroll.
 *
 * @example
 * // returns true, false
 * let unroll = _.unrollFrom( null );
 * _.unrollIs( unroll );
 * _.unrollIsPopulated( unroll );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFrom( unroll );
 * console.log ( unroll === result );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns unroll-array converted from {-src-}.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * @function unrollFrom
 * @throws { Error } If (arguments.length) is less or more then one.
 * @throws { Error } If argument {-src-} is not number, not long-like, not null.
 * @memberof wTools
 */

function unrollFrom( src )
{
  _.assert( arguments.length === 1 );
  if( _.unrollIs( src ) )
  return src;
  return _.unrollMake( src );
}

//

/**
 * The routine unrollsFrom() performs conversion of each argument to unroll-array.
 * The routine returns unroll-array contained unroll-arrays converted from arguments.
 *
 * @param { * } srcs - The objects to be converted into unrolls.
 *
 * @example
 * // returns [ [] ], true, true
 * let unroll = _.unrollsFrom( null );
 * console.log( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIsPopulated( unroll ) );
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], true, true
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log ( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @example
 * // returns [ [], [ undefined ], [], [ 1, [] ] ], true, true, true, true, true
 * let unroll = _.unrollsFrom( [], 1, null, [ 1, [] ] );
 * console.log( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 * console.log( _.unrollIs( unroll[ 1 ] ) );
 * console.log( _.unrollIs( unroll[ 2 ] ) );
 * console.log( _.unrollIs( unroll[ 3 ] ) );
 *
 * @returns { Unroll } Returns unroll-array contained unroll-arrays converted from arguments.
 * @function unrollsFrom
 * @throws { Error } If (arguments.length) is less then one.
 * @throws { Error } If any of the arguments is not number, not long-like, not null.
 * @memberof wTools
 */

function unrollsFrom( srcs )
{
  _.assert( arguments.length >= 1 );

  let dst = _.unrollMake( null );

  for( let i = 0; i < arguments.length; i ++ )
  {
    if( _.unrollIs( arguments[ i ] ) )
    dst.push( arguments[ i ] );
    else
    dst.push( _.unrollMake( arguments[ i ] ) );
  }

  return dst;
}

/**
 * The routine unrollFromMaybe() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFromMaybe() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * If {-src-} has incompatible type, then routine returns {-src-}.
 *
 * @param { * } src - The object to make unroll-array.
 *
 * @example
 * // returns false, true
 * var src = 'str';
 * let got = _.unrollFromMaybe( src );
 * console.log( _.unrollIs( got ) );
 * console.log( got === src );
 *
 * @example
 * // returns true, false
 * let unroll = _.unrollFromMaybe( null );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIsPopulated( unroll ) );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFromMaybe( unroll );
 * console.log ( unroll === result );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFromMaybe( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns unroll-array converted from {-src-}.
 * If {-src-} is unroll-array or incompatible type, then routine returns {-src-}.
 * @function unrollFromMaybe
 * @throws { Error } If (arguments.length) is less or more then one.
 * @memberof wTools
 */

function unrollFromMaybe( src )
{
  _.assert( arguments.length === 1 );
  if( _.unrollIs( src ) || _.strIs( src ) || _.boolIs( src ) || _.mapIs( src ) || src === undefined )
  return src;
  return _.unrollMake( src );
}

//

/**
 * The routine unrollNormalize() performs normalization of {-dstArray-}.
 * Normalization is unrolling of unroll-arrays, which is elements of {-dstArray-}.
 *
 * If {-dstArray-} is unroll-array, routine unrollNormalize() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollNormalize() returns array with unrolled elements.
 *
 * @param { arrayIs|Unroll } dstArray - The array to be unrolled (normalized).
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ], true
 * let unroll = _.unrollFrom( [ 1, 2, _.unrollMake( [ 3, 'str' ] ) ] );
 * let result = _.unrollNormalize( unroll )
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 1, 'str', [ 1, 'str' ] ], false
 * let unroll = _.unrollFrom( [ 1,'str' ] );
 * let result = _.unrollNormalize( [ 1, unroll, [ unroll ] ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Array } If {-dstArray-} is array, routine returns an array with normalized elements.
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns an unroll-array with normalized elements.
 * @function unrollNormalize
 * @throws { Error } If ( arguments.length ) is not equal to one.
 * @throws { Error } If argument ( dstArray ) is not arrayLike.
 * @memberof wTools
 */

function unrollNormalize( dstArray )
{

  _.assert( _.arrayIs( dstArray ) );
  _.assert( arguments.length === 1 );

  for( let a = 0 ; a < dstArray.length ; a++ )
  {
    if( _.unrollIs( dstArray[ a ] ) )
    {
      let args = [ a, 1 ];
      args.push.apply( args, dstArray[ a ] );
      dstArray.splice.apply( dstArray, args );
      // a -= 1; // yyy
      a += args.length - 2 - 1;
      /* no normalization of ready unrolls, them should be normal */
    }
    else if( _.arrayIs( dstArray[ a ] ) )
    {
      _.unrollNormalize( dstArray[ a ] );
    }
  }

  return dstArray;
}

//

/*
qqq : в unrollPrepend, unrollAppend бракує прикладів
коли src unroll і dst не null
із виводом результату
і більше ніж одним елементом

Dmytro: correct JSdoc in unrollFrom, unrollNormalize.
Improve examples in unrollPrepend, unrollAppend.
*/

/**
 * The routine unrollPrepend() returns an array with elements added to the begin of destination array {-dstArray-}.
 * During the operation unrolling of unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollPrepend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollPrepend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], false
 * let result = _.unrollPrepend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, str ], false
 * let result = _.unrollPrepend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ [ 1, 2 ], 1, 'str' ], true
 * let result = _.unrollPrepend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3, 1, 'str' ], false
 * let result = _.unrollPrepend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3, 1, 'str' ], true
 * let result = _.unrollPrepend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns updated unroll-array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollPrepend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */

function unrollPrepend( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.longIs( dstArray ) || dstArray === null, 'Expects long or unroll' );

  dstArray = dstArray || [];

  _unrollPrepend( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;

  function _unrollPrepend( dstArray, srcArray )
  {
    _.assert( arguments.length === 2 );

    for( let a = srcArray.length - 1 ; a >= 0 ; a-- )
    {
      if( _.unrollIs( srcArray[ a ] ) )
      {
        _unrollPrepend( dstArray, srcArray[ a ] );
      }
      else
      {
        if( _.arrayIs( srcArray[ a ] ) )
        _.unrollNormalize( srcArray[ a ] )
        dstArray.unshift( srcArray[ a ] );
      }
    }

    return dstArray;
  }

}

//

/**
 * The routine unrollAppend() returns an array with elements added to the end of destination array {-dstArray-}.
 * During the operation unrolling of unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollAppend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollAppend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], false
 * let result = _.unrollAppend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, str ], false
 * let result = _.unrollAppend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', [ 1, 2 ] ], true
 * let result = _.unrollAppend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', 2, 3 ], false
 * let result = _.unrollAppend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', 2, 3 ], true
 * let result = _.unrollAppend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns updated unroll-array
 * with normalized elements that are added to the end of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the end of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */

function unrollAppend( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.longIs( dstArray ) || dstArray === null, 'Expects long or unroll' );

  dstArray = dstArray || [];

  _unrollAppend( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;

  function _unrollAppend( dstArray, srcArray )
  {
    _.assert( arguments.length === 2 );

    for( let a = 0, len = srcArray.length ; a < len; a++ )
    {
      if( _.unrollIs( srcArray[ a ] ) )
      {
        _unrollAppend( dstArray, srcArray[ a ] );
      }
      else
      {
        if( _.arrayIs( srcArray[ a ] ) )
        _.unrollNormalize( srcArray[ a ] )
        dstArray.push( srcArray[ a ] );
      }
    }

    return dstArray;
  }

}

/*

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

*/

// //
//
// function unrollPrepend( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.unshift.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.unshift( arguments[ a ] );
//     }
//   }
//
//   dstArray[ _.unroll ] = true;
//
//   return dstArray;
// }
//
// //
//
// function unrollAppend( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = 1, len = arguments.length ; a < len; a++ )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.push.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.push( arguments[ a ] );
//     }
//   }
//
//   dstArray[ _.unroll ] = true;
//
//   return dstArray;
// }

//

/**
 * The routine unrollRemove() removes all matching elements in destination array {-dstArray-}
 * and returns a modified {-dstArray-}. During the operation unrolling of unrolls happens.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be removed.
 *
 * @example
 * // returns [], false
 * let result = _.unrollRemove( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [], true
 * let result = _.unrollRemove( _.unrollMake( null ), [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, 1, 3, 'str' ], false
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], _.unrollFrom( [ 1, 'str', 0, 5 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, 1, 3, 'str' ], true
 * let result = _.unrollRemove( _.unrollFrom( [ 1, 2, 1, 3, 'str' ] ), [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, 'str', 0, 5 ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, _.unrollMake( [ 'str', 0, 5 ] ) ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine removes all matching elements
 * and returns updated unroll-array.
 * @returns { Array } If {-dstArray-} is array, routine removes all matching elements
 * and returns updated array. If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */

function unrollRemove( dstArray )
{
  _.assert( arguments.length >= 2 );
  _.assert( _.longIs( dstArray ) || dstArray === null, 'Expects long or unroll' );

  dstArray = dstArray || [];

  _unrollRemove( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;

  function _unrollRemove( dstArray, srcArray )
  {
    _.assert( arguments.length === 2 );

    for( let a = 0, len = srcArray.length ; a < len; a++ )
    {
      if( _.unrollIs( srcArray[ a ] ) )
      {
        _unrollRemove( dstArray, srcArray[ a ] );
      }
      else
      {
        if( _.arrayIs( srcArray[ a ] ) )
        _.unrollNormalize( srcArray[ a ] );
        while( dstArray.indexOf( srcArray[ a ] ) >= 0 )
        dstArray.splice( dstArray.indexOf( srcArray[ a ] ), 1 );
      }
    }

    return dstArray;
  }

}

//

// --
// long
// --

/**
 * The longIs() routine determines whether the passed value is an array-like or an Array.
 * Imortant : longIs returns false for Object, even if the object has length field.
 *
 * If {-srcMap-} is an array-like or an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * longIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * longIs( 10 );
 *
 * @example
 * // returns true
 * let isArr = ( function() {
 *   return _.longIs( arguments );
 * } )( 'Hello there!' );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
 * @function longIs.
 * @memberof wTools
 */

function longIs( src )
{
  if( _.primitiveIs( src ) )
  return false;
  if( _.routineIs( src ) )
  return false;
  if( _.objectIs( src ) )
  return false;
  if( _.strIs( src ) )
  return false;

  if( Object.propertyIsEnumerable.call( src, 'length' ) )
  return false;
  if( !_.numberIs( src.length ) )
  return false;

  return true;
}

//

function longIsPopulated( src )
{
  if( !_.longIs( src ) )
  return false;
  return src.length > 0;
}

//

/**
 * The longMake() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.longMake( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.longMake( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function longMake
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */

function longMake( ins, src )
{
  let result, length;

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = ins.length;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.strType( ins ) );

  if( _.longIs( src ) )
  {

    if( ins.constructor === Array )
    result = new( _.constructorJoin( ins.constructor, src ) );
    else if( _.routineIs( ins ) )
    {
      if( ins.prototype.constructor.name === 'Array' )
      result = _ArraySlice.call( src );
      else
      result = new ins( src );
    }
    else
    result = new ins.constructor( src );

  }
  else
  {
    if( _.routineIs( ins ) )
    result = new ins( length );
    else
    result = new ins.constructor( length );
  }

  return result;
}

//

function longMakeZeroed( ins, src )
{
  let result, length;

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = ins.length;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0, 'Expects long or number as the second argument, got', _.strType( src ) );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIs( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.strType( ins ) );

  if( _.routineIs( ins ) )
  {
    result = new ins( length );
  }
  else
  {
    result = new ins.constructor( length );
  }

  if( !_.bufferTypedIs( result ) && !_.bufferRawIs( result )  )
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = 0;

  return result;
}

//

function _longClone( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) || _.bufferAnyIs( src ) );
  _.assert( !_.bufferNodeIs( src ), 'not tested' );

  if( _.bufferViewIs( src ) )
  debugger;

  if( _.bufferRawIs( src ) )
  return new Uint8Array( new Uint8Array( src ) ).buffer;
  else if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
  return new src.constructor( src );
  else if( _.arrayIs( src ) )
  return src.slice();
  else if( _.bufferViewIs( src ) )
  return new src.constructor( src.buffer, src.byteOffset, src.byteLength );

  _.assert( 0, 'unknown kind of buffer', _.strType( src ) );
}

//

function longShallowClone()
{
  let result;
  let length = 0;

  if( arguments.length === 1 )
  {
    return _._longClone( arguments[ 0 ] );
  }

  /* eval length */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'argument is not defined' );

    if( _.longIs( argument ) ) length += argument.length;
    else if( _.bufferRawIs( argument ) ) length += argument.byteLength;
    else length += 1;
  }

  /* make result */

  if( _.arrayIs( arguments[ 0 ] ) || _.bufferTypedIs( arguments[ 0 ] ) )
  result = _.longMake( arguments[ 0 ], length );
  else if( _.bufferRawIs( arguments[ 0 ] ) )
  result = new ArrayBuffer( length );

  let bufferDst;
  let offset = 0;
  if( _.bufferRawIs( arguments[ 0 ] ) )
  {
    bufferDst = new Uint8Array( result );
  }

  /* copy */

  for( let a = 0, c = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];
    if( _.bufferRawIs( argument ) )
    {
      bufferDst.set( new Uint8Array( argument ), offset );
      offset += argument.byteLength;
    }
    else if( _.bufferTypedIs( arguments[ 0 ] ) )
    {
      result.set( argument, offset );
      offset += argument.length;
    }
    else if( _.longIs( argument ) )
    for( let i = 0 ; i < argument.length ; i++ )
    {
      result[ c ] = argument[ i ];
      c += 1;
    }
    else
    {
      result[ c ] = argument;
      c += 1;
    }
  }

  return result;
}

//

/**
 * Returns a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 *
 * If ( l ) is omitted or ( l ) > ( array.length ), longSlice extracts through the end of the sequence ( array.length ).
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( f ) < 0, zero is assigned to begin index( f ).

 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 *
 * @example
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array.
 * @function longSlice
 * @throws { Error } Will throw an Error if ( array ) is not an Array or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/

function longSlice( array, f, l )
{
  let result;

  if( _.argumentsArrayIs( array ) )
  if( f === undefined && l === undefined )
  {
    if( array.length === 2 )
    return [ array[ 0 ], array[ 1 ] ];
    else if( array.length === 1 )
    return [ array[ 0 ] ];
    else if( array.length === 0 )
    return [];
  }

  _.assert( _.longIs( array ) );
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  {
    _.assert( f === undefined || _.numberIs( f ) );
    _.assert( l === undefined || _.numberIs( l ) );
    result = array.slice( f, l );
    return result;
  }

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );

  if( f < 0 )
  f = array.length + f;
  if( l < 0 )
  l = array.length + l;

  if( f < 0 )
  f = 0;
  if( l > array.length )
  l = array.length;
  if( l < f )
  l = f;

  if( _.bufferTypedIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  for( let r = f ; r < l ; r++ )
  result[ r-f ] = array[ r ];

  return result;
}

//

function longButRange( src, range, ins )
{

  _.assert( _.longIs( src ) );
  _.assert( ins === undefined || _.longIs( ins ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( _.arrayIs( src ) )
  return _.arrayButRange( src, range, ins );

  let result;
  range = _.rangeFrom( range );

  _.rangeClamp( range, [ 0, src.length ] );
  let d = range[ 1 ] - range[ 0 ];
  let l = src.length - d + ( ins ? ins.length : 0 );

  result = _.longMake( src, l );

  debugger;
  _.assert( 0, 'not tested' )

  for( let i = 0 ; i < range[ 0 ] ; i++ )
  result[ i ] = src[ i ];

  for( let i = range[ 1 ] ; i < l ; i++ )
  result[ i-d ] = src[ i ];

  return result;
}

//

/**
 * The longRemoveDuplicates( dstLong, onEvaluator ) routine returns the dstlong with the duplicated elements removed.
 * The dstLong instance will be returned when possible, if not a new instance of the same type is created.
 *
 * @param { longIs } dstLong - The source and destination long.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.longRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.longRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source long without the duplicated elements.
 * @function longRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an long.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

// function longRemoveDuplicates( dstLong, onEvaluate )
// {
//   _.assert( 1 <= arguments.length || arguments.length <= 3 );
//   _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );

//   if( _.arrayIs( dstLong ) )
//   {
//     _.arrayRemoveDuplicates( dstLong, onEvaluate );
//   }
//   else if( Object.prototype.toString.call( dstLong ) === "[object Arguments]")
//   {
//     let newElement;
//     for( let i = 0; i < dstLong.length; i++ )
//     {
//       newElement = dstLong[ i ];
//       for( let j = i + 1; j < dstLong.length; j++ )
//       {
//         if( newElement === dstLong[ j ] )
//         {
//           let array = Array.from( dstLong );
//           _.arrayRemoveDuplicates( array, onEvaluate );
//           dstLong = new dstLong.constructor( array );
//         }
//       }
//     }
//   }
//   else
//   {
//     if( !onEvaluate )
//     {
//       for( let i = 0 ; i < dstLong.length ; i++ )
//       {
//         function isDuplicated( element, index, array )
//         {
//           return ( element !== dstLong[ i ] || index === i );
//         }
//         dstLong = dstLong.filter( isDuplicated );
//       }
//     }
//     else
//     {
//       if( onEvaluate.length === 2 )
//       {
//         for( let i = 0 ; i < dstLong.length ; i++ )
//         {
//           function isDuplicated( element, index, array )
//           {
//             return ( !onEvaluate( element, dstLong[ i ] ) || index === i );
//           }
//           dstLong = dstLong.filter( isDuplicated );
//         }
//       }
//       else
//       {
//         for( let i = 0 ; i < dstLong.length ; i++ )
//         {
//           function isDuplicated( element, index, array )
//           {
//             return ( onEvaluate( element ) !== onEvaluate( dstLong[ i ] ) || index === i );
//           }
//           dstLong = dstLong.filter( isDuplicated );
//         }
//       }
//     }
//   }

//   return dstLong;
// }

function longRemoveDuplicates( dstLong, onEvaluate )
{
  _.assert( 1 <= arguments.length || arguments.length <= 3 );
  _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );

  if( _.arrayIs( dstLong ) )
  return _.arrayRemoveDuplicates( dstLong, onEvaluate );

  if( !dstLong.length )
  return dstLong;

  let length = dstLong.length;

  for( let i = 0; i < dstLong.length; i++ )
  if( _.arrayLeftIndex( dstLong, dstLong[ i ], i+1, onEvaluate ) !== -1 )
  length--;

  if( length === dstLong.length )
  return dstLong;

  let result = _.longMake( dstLong, length );
  result[ 0 ] = dstLong[ 0 ];

  let j = 1;
  for( let i = 1; i < dstLong.length && j < length; i++ )
  if( _.arrayRightIndex( result, dstLong[ i ], j-1, onEvaluate ) === -1 )
  result[ j++ ] = dstLong[ i ];

  _.assert( j === length );

  return result;
}

/* qqq : not optimal, no redundant copy */
/*
function longRemoveDuplicates( dstLong, onEvaluate )
{
  _.assert( 1 <= arguments.length || arguments.length <= 3 );
  _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );

  if( _.arrayIs( dstLong ) )
  {
    _.arrayRemoveDuplicates( dstLong, onEvaluate )
    return dstLong;
  }

  let array = Array.from( dstLong );
  _.arrayRemoveDuplicates( array, onEvaluate )

  if( array.length === dstLong.length )
  {
    return dstLong;
  }
  else
  {
    return new dstLong.constructor( array );
  }

}
*/

//

function longAreRepeatedProbe( srcArray, onEvaluate )
{
  let isUnique = _.longMake( srcArray );
  let result = Object.create( null );
  result.array = _.arrayMake( srcArray.length );
  result.uniques = srcArray.length;
  result.condensed = srcArray.length;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( srcArray ) );

  for( let i = 0 ; i < srcArray.length ; i++ )
  {
    let element = srcArray[ i ];

    if( result.array[ i ] > 0 )
    continue;

    result.array[ i ] = 0;

    let left = _.arrayLeftIndex( srcArray, element, i+1, onEvaluate );
    if( left >= 0 )
    {
      result.array[ i ] = 1;
      result.uniques -= 1;
      do
      {
        result.uniques -= 1;
        result.condensed -= 1;
        result.array[ left ] = 1;
        left = _.arrayLeftIndex( srcArray, element, left+1, onEvaluate );
      }
      while( left >= 0 );
    }

  }

  return result;

}

//

function longAllAreRepeated( src, onEvalutate )
{
  let areRepated = _.longAreRepeatedProbe.apply( this, arguments );
  return !areRepated.uniques;
}

//

function longAnyAreRepeated( src, onEvalutate )
{
  let areRepated = _.longAreRepeatedProbe.apply( this, arguments );
  return areRepated.uniques !== src.length;
}

//

function longNoneAreRepeated( src, onEvalutate )
{
  let areRepated = _.longAreRepeatedProbe.apply( this, arguments );
  return areRepated.uniques === src.length;
}

// --
// buffer checker
// --

function bufferRawIs( src )
{
  let type = Object.prototype.toString.call( src );
  let result = type === '[object ArrayBuffer]';
  return result;
}

//

function bufferTypedIs( src )
{
  let type = Object.prototype.toString.call( src );
  if( !/\wArray/.test( type ) )
  return false;
  if( _.bufferNodeIs( src ) )
  return false;
  return true;
}

//

function bufferViewIs( src )
{
  let type = Object.prototype.toString.call( src );
  let result = type === '[object DataView]';
  return result;
}

//

function bufferNodeIs( src )
{
  if( typeof Buffer !== 'undefined' )
  return src instanceof Buffer;
  return false;
}

//

function bufferAnyIs( src )
{
  if( !src )
  return false;
  if( typeof src !== 'object' )
  return false;
  if( !Reflect.has( src, 'byteLength' ) )
  return false;
  // return src.byteLength >= 0;
  // return bufferTypedIs( src ) || bufferViewIs( src )  || bufferRawIs( src ) || bufferNodeIs( src );
  return true;
}

//

function bufferBytesIs( src )
{
  if( _.bufferNodeIs( src ) )
  return false;
  return src instanceof Uint8Array;
}

//

function constructorIsBuffer( src )
{
  if( !src )
  return false;
  if( !_.numberIs( src.BYTES_PER_ELEMENT ) )
  return false;
  if( !_.strIs( src.name ) )
  return false;
  return src.name.indexOf( 'Array' ) !== -1;
}

//

/**
 * The arrayIs() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * arrayIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * arrayIs( 10 );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function arrayIs
 * @memberof wTools
 */

function arrayIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Array]';
}

//

function arrayIsPopulated( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return src.length > 0;
}

//

function arrayLikeResizable( src )
{
  if( Object.prototype.toString.call( src ) === '[object Array]' )
  return true;
  return false;
}

//

function arrayLike( src )
{
  if( _.arrayIs( src ) )
  return true;
  if( _.argumentsArrayIs( src ) )
  return true;
  return false;
}

//

function constructorLikeArray( src )
{
  if( !src )
  return false;

  if( src === Function )
  return false;
  if( src === Object )
  return false;
  if( src === String )
  return false;

  if( _.primitiveIs( src ) )
  return false;

  if( !( 'length' in src.prototype ) )
  return false;
  if( Object.propertyIsEnumerable.call( src.prototype, 'length' ) )
  return false;

  return true;
}

//

/**
 * The hasLength() routine determines whether the passed value has the property (length).
 *
 * If {-srcMap-} is equal to the (undefined) or (null) false is returned.
 * If {-srcMap-} has the property (length) true is returned.
 * Otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * hasLength( [ 1, 2 ] );
 *
 * @example
 * // returns true
 * hasLength( 'Hello there!' );
 *
 * @example
 * // returns true
 * let isLength = ( function() {
 *   return _.hasLength( arguments );
 * } )( 'Hello there!' );
 *
 * @example
 * // returns false
 * hasLength( 10 );
 *
 * @example
 * // returns false
 * hasLength( { } );
 *
 * @returns { boolean } Returns true if {-srcMap-} has the property (length).
 * @function hasLength
 * @memberof wTools
 */

function hasLength( src )
{
  if( src === undefined || src === null )
  return false;
  if( _.numberIs( src.length ) )
  return true;
  return false;
}

//

function arrayHasArray( arr )
{

  if( !_.arrayLike( arr ) )
  return false;

  for( let a = 0 ; a < arr.length ; a += 1 )
  if( _.arrayLike( arr[ a ] ) )
  return true;

  return false;
}

//

/**
 * The arrayCompare() routine returns the first difference between the values of the first array from the second.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns 3
 * let arr = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @function arrayCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */

function arrayCompare( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) && _.longIs( src2 ) );
  _.assert( src2.length >= src1.length );

  let result = 0;

  for( let s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] - src2[ s ];
    if( result !== 0 )
    return result;

  }

  return result;
}

//

/**
 * The arraysAreIdentical() routine checks the equality of two arrays.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns true
 * let arr = _.arraysAreIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function arraysAreIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function arraysAreIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) );
  _.assert( _.longIs( src2 ) );

  let result = true;

  if( src1.length !== src2.length )
  return false;

  for( let s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] === src2[ s ];

    if( result === false )
    return false;

  }

  return result;
}

//

function arrayHas( array, value, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayLike( array ) );

  if( evaluator1 === undefined )
  {
    return _ArrayIndexOf.call( array, value ) !== -1;
  }
  else
  {
    if( _.arrayLeftIndex( array, value, evaluator1, evaluator2 ) >= 0 )
    return true;
    return false;
  }

}

//

/**
 * The arrayHasAny() routine checks if the {-srcMap-} array has at least one value of the following arguments.
 *
 * It iterates over array-like (arguments[]) copies each argument to the array (ins) by the routine
 * [arrayAs()]{@link wTools.arrayAs}
 * Checks, if {-srcMap-} array has at least one value of the (ins) array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayAs} - See for more information.
 *
 * @param { longIs } src - The source array.
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns true
 * let arr = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
 *
 * @returns { Boolean } - Returns true, if {-srcMap-} has at least one value of the following argument(s), otherwise false is returned.
 * @function arrayHasAny
 * @throws { Error } If the first argument in not an array.
 * @memberof wTools
 */

function arrayHasAny( src )
{
  let empty = true;
  empty = false;

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ), 'arrayHasAny :', 'array expected' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    empty = false;

    let ins = _.arrayAs( arguments[ a ] );
    for( let i = 0 ; i < ins.length ; i++ )
    {
      if( src.indexOf( ins[ i ] ) !== -1 )
      return true;
    }

  }

  return empty;
}

//

function arrayHasAll( src )
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ), 'arrayHasAll :', 'array expected' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    let ins = _.arrayAs( arguments[ a ] );
    for( let i = 0 ; i < ins.length ; i++ )
    if( src.indexOf( ins[ i ] ) === -1 )
    return false;

  }

  return true;
}

//

function arrayHasNone( src )
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ), 'arrayHasNone :', 'array expected' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    let ins = _.arrayAs( arguments[ a ] );
    for( let i = 0 ; i < ins.length ; i++ )
    if( src.indexOf( ins[ i ] ) !== -1 )
    return false;

  }

  return true;
}

//

function arrayAll( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  {
    if( !src[ s ] )
    return false;
  }

  return true;
}

//

function arrayAny( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  debugger;
  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return true;

  debugger;
  return false;
}

//

function arrayNone( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return false;

  return true;
}

// --
// scalar
// --

/**
 * Produce a single array from all arguments if cant return single argument as a scalar.
 * If {-scalarAppend-} gets a single argument it returns the argument as is.
 * If {-scalarAppend-} gets an argument and one or more undefined it returns the argument as is.
 * If {-scalarAppend-} gets more than one or less than one defined arguments then it returns array having all defined arguments.
 * If some argument is a long ( for example array ) then each element of the long is treated as an argument, not recursively.
 *
 * @function scalarAppend.
 * @memberof wTools
 */

function scalarAppend( dst, src )
{

  if( arguments.length > 2 )
  {
    for( let a = 1 ; a < arguments.length ; a++ )
    dst = _.scalarAppend( dst, arguments[ a ] );
    return dst;
  }

  _.assert( arguments.length <= 2 );

  if( dst === undefined )
  {
    if( _.longIs( src ) )
    {
      dst = [];
    }
    else
    {
      if( src === undefined )
      return [];
      else
      return src;
    }
  }

  if( _.longIs( dst ) )
  {

    if( !_.arrayIs( dst ) )
    dst = _.arrayFrom( dst );

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    _.arrayAppendArray( dst, src );
    else
    dst.push( src );

  }
  else
  {

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    dst = _.arrayAppendArray( [ dst ], src );
    else
    dst = [ dst, src ];

  }

  return dst;
}

//

/**
 * The scalarToVector() routine returns a new array
 * which containing the static elements only type of Number.
 *
 * It takes two arguments (dst) and (length)
 * checks if the (dst) is a Number, If the (length) is greater than or equal to zero.
 * If true, it returns the new array of static (dst) numbers.
 * Otherwise, if the first argument (dst) is an Array,
 * and its (dst.length) is equal to the (length),
 * it returns the original (dst) Array.
 * Otherwise, it throws an Error.
 *
 * @param { ( Number | Array ) } dst - A number or an Array.
 * @param { Number } length - The length of the new array.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3, 3, 3 ]
 * let arr = _.scalarToVector( 3, 7 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let arr = _.scalarToVector( [ 3, 7, 13 ], 3 );
 *
 * @returns { Number[] | Array } - Returns the new array of static numbers or the original array.
 * @function scalarToVector
 * @throws { Error } If missed argument, or got less or more than two arguments.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less than 0.
 * @throws { Error } If (dst.length) is not equal to the (length).
 * @memberof wTools
 */

// function arrayFromNumber( dst, length )
function scalarToVector( dst, length )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( dst ) || _.arrayIs( dst ), 'Expects array of number as argument' );
  _.assert( length >= 0 );

  if( _.numberIs( dst ) )
  {
    dst = _.arrayFillTimes( [], length, dst );
  }
  else
  {
    _.assert( dst.length === length, () => 'Expects array of length ' + length + ' but got ' + dst.length );
  }

  return dst;
}

//

function scalarFrom( src )
{
  if( _.longIs( src ) && src.length === 1 )
  return src[ 0 ];
  return src;
}

//

function scalarFromOrNull( src )
{
  if( _.longIs( src ) )
  {
    if( src.length === 1 )
    return src[ 0 ];
    else if( src.length === 0 )
    return null;
  }
  return src;
}

// --
// array producer
// --

/* qqq
add good coverage for arrayMake
take into account unroll cases
*/

function arrayMake( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.numberIs( src ) || _.longIs( src ) || src === null );

  if( src === null )
  return Array();

  if( _.numberIs( src ) )
  return Array( src );

  if( src.length === 1 )
  return [ src[ 0 ] ];
  else
  return Array.apply( Array, src );
}

//

/* qqq
add good coverage for arrayFrom
take into account unroll cases
*/

function arrayFrom( src )
{
  _.assert( arguments.length === 1 );
  if( _.arrayIs( src ) && !_.unrollIs( src ) )
  return src;
  return _.arrayMake.call( _, src );
}

//

/**
 * The arrayAs() routine copies passed argument to the array.
 *
 * @param { * } src - The source value.
 *
 * @example
 * // returns [ false ]
 * let arr = _.arrayAs( false );
 *
 * @example
 * // returns [ { a : 1, b : 2 } ]
 * let arr = _.arrayAs( { a : 1, b : 2 } );
 *
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
 * Otherwise return an array which contains the element from argument.
 * @function arrayAs
 * @memberof wTools
 */

function arrayAs( src )
{
  _.assert( arguments.length === 1 );
  _.assert( src !== undefined );

  if( src === null )
  return [];
  else if( _.longIs( src ) )
  return src;
  else
  return [ src ];

}

//

function arrayAsShallowing( src )
{
  _.assert( arguments.length === 1 );
  _.assert( src !== undefined );

  if( src === null )
  return [];
  else if( _.longIs( src ) )
  return _.arraySlice( src );
  else
  return [ src ];

}

// --
// array sequential search
// --

function arrayLeftIndex( arr, ins, evaluator1, evaluator2 )
{
  let fromIndex = 0;

  if( _.numberIs( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( arr ) );
  _.assert( _.numberIs( fromIndex ) );
  _.assert( evaluator1 === undefined || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( evaluator1 === undefined || _.routineIs( evaluator1 ) );
  _.assert( evaluator2 === undefined || evaluator2.length === 1 );
  _.assert( evaluator2 === undefined || _.routineIs( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    return _ArrayIndexOf.call( arr, ins, fromIndex );
  }
  else if( evaluator1.length === 2 ) /* equalizer */
  {
    _.assert( !evaluator2 );
    for( let a = fromIndex ; a < arr.length ; a++ )
    {
      if( evaluator1( arr[ a ], ins ) )
      return a;
    }
  }
  else
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    for( let a = fromIndex; a < arr.length ; a++ )
    {
      if( evaluator1( arr[ a ] ) === ins )
      return a;
    }

  }

  return -1;
}

//

function arrayRightIndex( arr, ins, evaluator1, evaluator2 )
{

  let fromIndex = arr.length-1;

  if( _.numberIs( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5 );
  _.assert( _.numberIs( fromIndex ) );
  _.assert( evaluator1 === undefined || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( evaluator1 === undefined || _.routineIs( evaluator1 ) );
  _.assert( evaluator2 === undefined || evaluator2.length === 1 );
  _.assert( evaluator2 === undefined || _.routineIs( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    if( !_.arrayIs( arr ) )
    debugger;
    return _ArrayLastIndexOf.call( arr, ins, fromIndex );
  }
  else if( evaluator1.length === 2 ) /* equalizer */
  {
    _.assert( !evaluator2 );
    for( let a = fromIndex ; a >= 0 ; a-- )
    {
      if( evaluator1( arr[ a ], ins ) )
      return a;
    }
  }
  else
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    for( let a = fromIndex ; a >= 0 ; a-- )
    {
      if( evaluator1( arr[ a ] ) === ins )
      return a;
    }

  }

  return -1;
}

//

/**
 * The arrayLeft() routine returns a new object containing the properties, (index, element),
 * corresponding to a found value (ins) from an array (arr).
 *
 * It creates the variable (i), assigns and calls to it the function( _.arrayLeftIndex( arr, ins, evaluator1 ) ),
 * that returns the index of the value (ins) in the array (arr).
 * [wTools.arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
 * Otherwise, it returns the empty object.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { longIs } arr - Entity to check.
 * @param { * } ins - Element to locate in the array.
 * @param { wTools~compareCallback } evaluator1 - A callback function.
 *
 * @example
 * // returns { index : 3, element : 'str' }
 * _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
 *
 * @example
 * // returns {  }
 * _.arrayLeft( [ 1, 2, 3, 4, 5 ], 6 );
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value (ins) from the array (arr).
 * Otherwise, it returns the empty object.
 * @function arrayLeft
 * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
 * @memberof wTools
 */

function arrayLeft( arr, ins, evaluator1, evaluator2 )
{
  let result = Object.create( null );
  let i = _.arrayLeftIndex( arr, ins, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( i >= 0 )
  {
    result.index = i;
    result.element = arr[ i ];
  }

  return result;
}

//

function arrayRight( arr, ins, evaluator1, evaluator2 )
{
  let result = Object.create( null );
  let i = _.arrayRightIndex( arr, ins, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( i >= 0 )
  {
    result.index = i;
    result.element = arr[ i ];
  }

  return result;
}

//

function arrayLeftDefined( arr )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.arrayLeft( arr, true, function( e ){ return e !== undefined; } );
}

//

function arrayRightDefined( arr )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.arrayRight( arr, true, function( e ){ return e !== undefined; } );
}

//

/**
 * The arrayCountElement() routine returns the count of matched elements in the {-srcArray-} array with the input { element }.
 * Returns 0 if no { element } is provided. It can take equalizer or evaluators for the routine equalities.
 *
 * @param { Array } src - The source array.
 * @param { * } element - The value to search.
 * @param { * } [ onEvaluate1 ] - It's a routine. If the routine has two parameters, it is used as an equalizer, and if it has only one, then routine used as the first part of the evaluator.
 * @param { * } [ onEvaluate2 ] - The second part of evaluator. Change the value to search.
 *
 * @example
 * // Simple exapmle. Returns 2
 * let arr = _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10 );
 *
 * @example
 * // With equalizer. Returns 4
 * let arr = _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10, ( a, b ) => _.typeOf( a ) === _.typeOf( b ) );
 *
 * @example
 * // With evaluator. Returns 4
 * let arr = _.arrayCountElement( [ [ 10, 2 ], [ 10, 2 ], [ 'str', 10 ], [ 10, true ], [ false, 10 ] ], 10, ( e ) => e[ 0 ], ( e ) => e );
 *
 * @returns { Number } - Returns the count of matched elements in the {-srcArray-} with the { element } element.
 * @function arrayCountElement
 * @throws { Error } If passed arguments is less than two or more than four.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the third or fourth argument is not a routine.
 * @throws { Error } If the routine in third argument has less than one or more than two arguments.
 * @throws { Error } If the routine in third argument has two arguments and fourth argument is passed into routine arrayCountElement.
 * @throws { Error } If the routine in fourth argument has less than one or more than one arguments.
 * @memberof wTools
 */

function arrayCountElement( srcArray, element, onEvaluate1, onEvaluate2 )
{
  let result = 0;

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.longIs( srcArray ), 'Expects long' );

  let left = _.arrayLeftIndex( srcArray, element, onEvaluate1, onEvaluate2 );
  // let index = srcArray.indexOf( element );

  while( left >= 0 )
  {
    result += 1;
    left = _.arrayLeftIndex( srcArray, element, left+1, onEvaluate1, onEvaluate2 );
    // index = srcArray.indexOf( element, index+1 );
  }

  return result;
}

//

/**
 * The arrayCountTotal() adds all the elements in { -srcArray- }, elements can be numbers or booleans ( it considers them 0 or 1 ).
 *
 * @param { Array } srcArray - The source array.
 *
 * @example
 * // returns 23;
 * let arr = _.arrayCountTotal( [ 1, 2, 10, 10 ] );
 *
 * @example
 * // returns 1;
 * let arr = _.arrayCountTotal( [ true, false, false ] );
 *
 * @returns { Number } - Returns the sum of the elements in { srcArray }.
 * @function arrayCountTotal
 * @throws { Error } If passed arguments is different than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If { srcArray} doesn´t contain number-like elements.
 * @memberof wTools
 */

function arrayCountTotal( srcArray )
{
  let result = 0;

  _.assert( arguments.length === 1 );
  _.assert( _.longIs( srcArray ), 'Expects long' );

  for( let i = 0 ; i < srcArray.length ; i++ )
  {
    _.assert( _.boolIs( srcArray[ i ] ) || _.numberIs( srcArray[ i ] )|| srcArray[ i ] === null );
    result += srcArray[ i ];
  }

  return result;
}

//

/**
 * The arrayCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 3
 * _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // returns 0
 * _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 * @function arrayCountUnique
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arrayCountUnique( src, onEvaluate )
{
  let found = [];
  onEvaluate = onEvaluate || function( e ){ return e };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( src ), 'arrayCountUnique :', 'Expects ArrayLike' );
  _.assert( _.routineIs( onEvaluate ) );
  _.assert( onEvaluate.length === 1 );

  for( let i1 = 0 ; i1 < src.length ; i1++ )
  {
    let element1 = onEvaluate( src[ i1 ] );
    if( found.indexOf( element1 ) !== -1 )
    continue;

    for( let i2 = i1+1 ; i2 < src.length ; i2++ )
    {

      let element2 = onEvaluate( src[ i2 ] );
      if( found.indexOf( element2 ) !== -1 )
      continue;

      if( element1 === element2 )
      found.push( element1 );

    }

  }

  return found.length;
}

// --
// array prepend
// --

/*

qqq : optimize *OnlyStrict* routines
qqq : use for documentation

alteration Routines :

- array { Op } { Tense } { Second } { How }

alteration Op : [ Append , Prepend , Remove, Flatten ]        // operation
alteration Tense : [ - , ed ]                                 // what to return
alteration Second : [ -, element, array, array ]              // how to treat src arguments
alteration How : [ - , Once , OnceStrictly ]                  // how to treat repeats

~ 60 routines

*/

//

function arrayPrepend_( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  for( let a = arguments.length - 1 ; a >= 1 ; a-- )
  {
    if( _.longIs( arguments[ a ] ) )
    {
      dstArray.unshift.apply( dstArray, arguments[ a ] );
    }
    else
    {
      dstArray.unshift( arguments[ a ] );
    }
  }

  return dstArray;
}

//

function arrayPrepend( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrepended.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it returns the original array ( dstArray ).
 * @function arrayPrependOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedOnce.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if( ins ) was added, otherwise throws an Error.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 0 }, onEqualize );
 * // returns [ { value : 0 }, { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it throws an Error.
 * @function arrayPrependOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @throws { Error } An Error if ( ins ) already exists on( dstArray ).
 * @memberof wTools
 */

function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
  }
  else
  {
    result = arrayPrepended.apply( this, [ dstArray, ins ] );
  }

  return dstArray;
}

//

function arrayPrepended( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ) );

  dstArray.unshift( ins );
  return 0;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns -1
 *
 * @returns { Array } Returns zero if elements was succesfully added, otherwise returns -1.
 *
 * @function arrayPrependedOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return 0;
  }
  return -1;
}

//

function arrayPrependedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
  }
  else
  {
    result = arrayPrepended.apply( this, [ dstArray, ins ] );
  }

  return result;
}

//

/**
 * Routine adds a value of argument( ins ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */

function arrayPrependElement( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedElement.apply( this, arguments );
  return dstArray;
}

//

function arrayPrependElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayPrependElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedElementOnce.apply( this, arguments );
    _.assert( result !== undefined, 'Array should have only unique elements, but has several', ins );
  }
  else
  {
    result = arrayPrependedElement.apply( this, [ dstArray, ins ] );
  }

  return dstArray;
}

/*
function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result = arrayPrependedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );

  return dstArray;
}
*/

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * and returns zero if value was succesfully added.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns 0
 * _.arrayPrependedElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependedElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is not equal to two.
 * @memberof wTools
 */

function arrayPrependedElement( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ) );

  dstArray.unshift( ins );

  /* xxx qqq : should return element, not index */
  // return 0;
  return ins;
}

//

function arrayPrependedElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return dstArray[ 0 ];
  }
  return undefined;
}

//

function arrayPrependedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedElementOnce.apply( this, arguments );
    _.assert( result !== undefined, 'Array should have only unique elements, but has several', ins );
  }
  else
  {
    result = arrayPrependedElement.apply( this, [ dstArray, ins ] );
  }

  return result;
}

//

/**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4 ], [ 5 ] );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4, 5 ], [ 5 ] );
 *
 * @returns { Array } Returns updated array, that contains elements from( insArray ).
 * @function arrayPrependArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */

function arrayPrependArray( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedArray.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnce( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } Returns updated array( dstArray ) or original if nothing added.
 * @function arrayPrependArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if all elements from( insArray ) was added, otherwise throws error.
 * Even error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnceStrictly( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * * @example
 * let dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 * _.arrayPrependArrayOnceStrictly( dst, [ 'Antony', 'Dmitry' ] );
 * // throws error, but dstArray was updated by one element from insArray
 *
 * @returns { Array } Returns updated array( dstArray ) or throws an error if not all elements from source
 * array( insArray ) was added.
 * @function arrayPrependArrayOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayPrependedArrayOnce.apply( this, arguments );
    _.assert( result === insArray.length );
  }
  else
  {
    result = arrayPrependedArray.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

/**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArray( dst, [ 5, 6, 7 ] );
 * // returns 3
 * console.log( dst );
 * //returns [ 5, 6, 7, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */

function arrayPrependedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArray :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArray :', 'Expects longIs' );

  dstArray.unshift.apply( dstArray, insArray );
  return insArray.length;
}

//

/**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrayOnce( [ 1, 2, 3 ], [ 4, 5, 6] );
 *
 * @example
 * // returns 1
 * _.arrayPrependedArrayOnce( [ 0, 2, 3, 4 ], [ 1, 1, 1 ] );
 *
 * @example
 * // returns 0
 * _.arrayPrependedArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns 0
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.unshift( insArray[ i ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayPrependedArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
 let result;
 if( Config.debug )
 {
   result = arrayPrependedArrayOnce.apply( this, arguments );
   _.assert( result === insArray.length );
 }
 else
 {
   result = arrayPrependedArray.apply( this, [ dstArray, insArray ] );
 }

 return result;
}

//

/**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */

function arrayPrependArrays( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedArrays.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArraysOnce( dst, [ 5 ], 5, [ 6 ], 6, undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */

function arrayPrependArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * Throws an error if one of arguments is undefined.
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArraysOnce( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * After copying checks if all elements( from first two levels ) was copied, if true returns updated array( dstArray ), otherwise throws an error.
 * Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param { longIs | * } arguments[...] - Source arguments.
 * @param { wTools~compareCallback } onEqualize - A callback function that can be provided through routine`s context. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 8, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], 5, [ 6, [ 7 ] ], 8 );
 *
 * @example
 * // throws error
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a === b;
 * };
 * let dst = [];
 * let arguments = [ dst, [ 1, [ 2 ], [ [ 3 ] ] ], 4 ];
 * _.arrayPrependArraysOnceStrictly.apply( { onEqualize }, arguments );
 * //returns [ 1, 2, [ 3 ], 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @throws { Error } An Error if count of added elements is not equal to count of elements from( arguments )( only first two levels inside of array are counted ).
 * @memberof wTools
 */

function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayPrependedArraysOnce.apply( this, arguments );
    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }
    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
  }
  else
  {
    result = arrayPrependedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArraysOnce.apply( this, arguments );
  let expected = 0;

  if( Config.debug )
  {

    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );

  }

  return dstArray;
}
*/

//

/**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */

function arrayPrependedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArrays :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArrays :', 'Expects longIs entity' );

  let result = 0;

  for( let a = insArray.length - 1 ; a >= 0 ; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      dstArray.unshift.apply( dstArray, insArray[ a ] );
      result += insArray[ a ].length;
    }
    else
    {
      dstArray.unshift( insArray[ a ] );
      result += 1;
    }
  }

  return result;
}

//

/**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4, 5, 6, 7 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * // returns 3
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArraysOnce( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */

function arrayPrependedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArraysOnce :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArraysOnce :', 'Expects longIs entity' );

  let result = 0;

  function _prependOnce( element )
  {
    let index = _.arrayLeftIndex( dstArray, element, evaluator1, evaluator2 );
    if( index === -1 )
    {
      // dstArray.unshift( argument );
      dstArray.splice( result, 0, element );
      result += 1;
    }
  }

  // for( let ii = insArray.length - 1; ii >= 0; ii-- )
  for( let ii = 0 ; ii < insArray.length ; ii++ )
  {
    if( _.longIs( insArray[ ii ] ) )
    {
      let array = insArray[ ii ];
      // for( let a = array.length - 1; a >= 0; a-- )
      for( let a = 0 ; a < array.length ; a++ )
      _prependOnce( array[ a ] );
    }
    else
    {
      _prependOnce( insArray[ ii ] );
    }
  }

  return result;
}

//

function arrayPrependedArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
 let result;
 if( Config.debug )
 {
   result = arrayPrependedArraysOnce.apply( this, arguments );
   let expected = 0;
   for( let i = insArray.length - 1; i >= 0; i-- )
   {
     if( _.longIs( insArray[ i ] ) )
     expected += insArray[ i ].length;
     else
     expected += 1;
   }
   _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
 }
 else
 {
   result = arrayPrependedArrays.apply( this, [ dstArray, insArray ] );
 }

 return result;
}

// --
// array append
// --

function arrayAppend_( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  for( let a = 1, len = arguments.length ; a < len; a++ )
  {
    if( _.longIs( arguments[ a ] ) )
    {
      dstArray.push.apply( dstArray, arguments[ a ] );
    }
    else
    {
      dstArray.push( arguments[ a ] );
    }
  }

  return dstArray;
}

//

function arrayAppend( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppended.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayAppendOnce() routine adds at the end of an array (dst) a value {-srcMap-},
 * if the array (dst) doesn't have the value {-srcMap-}.
 *
 * @param { Array } dst - The source array.
 * @param { * } src - The value to add.
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @returns { Array } If an array (dst) doesn't have a value {-srcMap-} it returns the updated array (dst) with the new length,
 * otherwise, it returns the original array (dst).
 * @function arrayAppendOnce
 * @throws { Error } Will throw an Error if (dst) is not an Array.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function arrayAppendOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
  }
  else
  {
    result = arrayAppended.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

//

function arrayAppended( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ) );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.push( ins );
    return dstArray.length - 1;
  }

  return -1;
}


function arrayAppendedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
  }
  else
  {
    result = arrayAppended.apply( this, [ dstArray, ins ] );
  }
  return result;
}


//

function arrayAppendElement( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedElement.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendElementOnce( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendElementOnceStrictly( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayAppendedElementOnce.apply( this, arguments );
    _.assert( result !== false, 'Array should have only unique elements, but has several', ins );
  }
  else
  {
    result = arrayAppendedElement.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

//

function arrayAppendedElement( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ) );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedElementOnce( dstArray, ins )
{
  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.push( ins );
    return dstArray[ dstArray.length - 1 ];
  }

  return false;
  // return -1;
}

//

function arrayAppendedElementOnceStrictly( dstArray, ins )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedElementOnce.apply( this, arguments );
    _.assert( result !== false, 'Array should have only unique elements, but has several', ins );
  }
  else
  {
    result = arrayAppendedElement.apply( this, [ dstArray, ins ] );
  }
  return result;
}

//

/**
* The arrayAppendArray() routine adds one or more elements to the end of the (dst) array
* and returns the new length of the array.
*
* It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
* iterate over array-like object (arguments[]) and assigns to the (argument) each element,
* checks, if (argument) is equal to the 'undefined'.
* If true, it throws an Error.
* If (argument) is an array-like.
* If true, it merges the (argument) into the (result) array.
* Otherwise, it adds element to the result.
*
* @param { Array } dst - Initial array.
* @param {*} arguments[] - One or more argument(s) to add to the end of the (dst) array.
*
* @example
* // returns [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
* let arr = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
*
* @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
* @function arrayAppendArray
* @throws { Error } If the first argument is not an array.
* @throws { Error } If type of the argument is equal undefined.
* @memberof wTools
*/

function arrayAppendArray( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedArray.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayAppendArrayOnce() routine returns an array of elements from (dst)
 * and appending only unique following arguments to the end.
 *
 * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the (argument) each element,
 * checks, if (argument) is equal to the 'undefined'.
 * If true, it throws an Error.
 * if (argument) is an array-like.
 * If true, it iterate over array (argument) and checks if (result) has the same values as the (argument).
 * If false, it adds elements of (argument) to the end of the (result) array.
 * Otherwise, it checks if (result) has not the same values as the (argument).
 * If true, it adds elements to the end of the (result) array.
 *
 * @param { Array } dst - Initial array.
 * @param {*} arguments[] - One or more argument(s).
 *
 * @example
 * // returns [ 1, 2, 'str', {}, 5 ]
 * let arr = _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
 * @function arrayAppendArrayOnce
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */

function arrayAppendArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedArrayOnce.apply( this, arguments )
  return dstArray;
}

//

function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayAppendedArrayOnce.apply( this, arguments )
    _.assert( result === insArray.length );
  }
  else
  {
    result = arrayAppendedArray.apply( this, [ dstArray, insArray ] )
  }
  return dstArray;
}

/*
function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayAppendedArrayOnce.apply( this, arguments )
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

function arrayAppendedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2 )
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArray :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArray :', 'Expects longIs' );

  dstArray.push.apply( dstArray, insArray );
  return insArray.length;
}

//

function arrayAppendedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  for( let i = 0 ; i < insArray.length ; i++ )
  {
    if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.push( insArray[ i ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayAppendedArrayOnceStrictly( dstArray, ins )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedArrayOnce.apply( this, arguments );
    _.assert( result === ins.length , 'Array should have only unique elements, but has several', ins );
  }
  else
  {
    result = arrayAppendedElement.apply( this, [ dstArray, ins ] );
  }
  return result;
}

//

function arrayAppendArrays( dstArray, insArray )
{

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  if( dstArray === undefined )
  {
    _.assert( arguments.length === 2 );
    return insArray;
  }

  _.arrayAppendedArrays.apply( this, arguments );

  return dstArray;
}

//

function arrayAppendArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }
  else if( dstArray === undefined )
  {
    if( _.arrayIs( insArray ) )
    {
      dstArray = [];
      arguments[ 0 ] = dstArray;
    }
    else
    {
      _.assert( 2 <= arguments.length && arguments.length <= 4 );
      return insArray;
    }
  }

  arrayAppendedArraysOnce.apply( this, arguments );

  return dstArray;
}

//

function arrayAppendArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {

    result = arrayAppendedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }
    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
  }
  else
  {
    result = arrayAppendedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

//

function arrayAppendedArrays( dstArray, insArray )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( insArray ) && insArray !== undefined )
  insArray = [ insArray ];

  // if( !_.longIs( insArray ) )
  // {
  //   if( !_.arrayIs( dstArray ) )
  //   return [ dstArray, insArray ];
  //   else
  //   dstArray.push( insArray );
  //   return 1;
  // }

  // if( !_.arrayIs( insArray ) && insArray !== undefined )
  // insArray = [ insArray ];
  // if( !_.arrayIs( insArray ) && insArray !== undefined )
  // insArray = [ insArray ];

  _.assert( _.arrayIs( dstArray ), 'Expects array' );
  _.assert( _.longIs( insArray ), 'Expects longIs entity' );

  let result = 0;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      dstArray.push.apply( dstArray, insArray[ a ] );
      result += insArray[ a ].length;
    }
    else
    {
      dstArray.push( insArray[ a ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayAppendedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( dstArray === undefined )
  return insArray;

  if( !_.arrayIs( insArray ) && insArray !== undefined )
  insArray = [ insArray ];

  _.assert( _.arrayIs( dstArray ), 'Expects array' );
  _.assert( _.longIs( insArray ), 'Expects longIs entity' );

  let result = 0;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = 0, alen = array.length; i < alen; i++ )
      _appendOnce( array[ i ] );
    }
    else
    {
      _appendOnce( insArray[ a ] );
    }
  }

  return result;

  function _appendOnce( argument )
  {
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
    if( index === -1 )
    {
      dstArray.push( argument );
      result += 1;
    }
  }

}

//

function arrayAppendedArraysOnceStrictly( dstArray, ins )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedArraysOnce.apply( this, arguments );
    let expected = 0;
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longIs( ins[ i ] ) )
      expected += ins[ i ].length;
      else
      expected += 1;
    }
    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
  }
  else
  {
    result = arrayAppendedArrays.apply( this, [ dstArray, ins ] );
  }

  return result;
}

// --
// array remove
// --

/**
 * ArrayRemove, arrayRemoveOnce, arrayRemoveOnceStrictly and arrayRemoved behave just like
 * arrayRemoveElement, arrayRemoveElementOnce, arrayRemoveElementOnceStrictly and arrayRemovedElement.
 */

function arrayRemove( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemoved.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemoveElementOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoved( dstArray, ins, evaluator1, evaluator2 )
{
  let removedElements = arrayRemovedElement.apply( this, arguments );
  return removedElements;
}

//

/**
 * ArrayRemovedOnce and arrayRemovedOnceStrictly behave just like arrayRemovedElementOnce and arrayRemovedElementOnceStrictly,
 * but return the index of the removed element, instead of the removed element
 */

function arrayRemovedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  dstArray.splice( index, 1 );

  return index;
}

//

function arrayRemovedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  let newIndex = _.arrayLeftIndex.apply( _, arguments );
  _.assert( newIndex < 0, () => 'The element ' + _.toStrShort( ins ) + ' is several times in dstArray' );

  return index;
}

//

function arrayRemoveElement( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedElement.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayRemoveElementOnce() routine removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins )]{@link wTools.arrayRemovedElementOnce}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElementOnce}
 * @see  wTools.arrayRemovedElementOnce
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ]
 * let arr = _.arrayRemoveElementOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
 *
 * @example
 * // returns [ 3, 7, 13, 33 ]
 * let arr = _.arrayRemoveElementOnce( [ 3, 7, 33, 13, 33 ], 13, function( el, ins ) {
 *   return el > ins;
 * });
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveElementOnce
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemoveElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let result = arrayRemovedElementOnce.apply( this, arguments );
    let index = _.arrayLeftIndex.apply( _, arguments );
    _.assert( index < 0 );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  }
  else
  {
    let result = arrayRemovedElement.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

/*
function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result = arrayRemovedElementOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/

//

function arrayRemovedElement( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( this, arguments );
  let removedElements = 0;

  for( let i = 0; i < dstArray.length; i++ )
  {
    if( index !== -1 )
    {
      dstArray.splice( index, 1 );
      removedElements = removedElements + 1;
      i = i - 1 ;
    }
    index = _.arrayLeftIndex.apply( this, arguments );
  }

  return removedElements;
}

//

/**
 * The callback function to compare two values.
 *
 * @callback wTools~compareCallback
 * @param { * } el - The element of the array.
 * @param { * } ins - The value to compare.
 */

/**
 * The arrayRemovedElementOnce() routine returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls built in function(dstArray.indexOf(ins))
 * that looking for the value of the (ins) in the (dstArray).
 * If true, it removes the value (ins) from (dstArray) array by corresponding index.
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayLeftIndex( dstArray, ins, onEvaluate )]{@link wTools.arrayLeftIndex}
 * If callback function(onEvaluate) returns true, it returns the index that will be removed from (dstArray).
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 1
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 4, function( el ) {
 *   return el;
 * });
 *
 * @example
 * // returns 0
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 2 );
 *
 * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
 * @function arrayRemovedElementOnce
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemovedElementOnce( dstArray, ins, evaluator1, evaluator2 )
{

  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  dstArray.splice( index, 1 );

  return index;
  /* "!!! : breaking" */
  /* // arrayRemovedElementOnce should return the removed element
  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );

  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }

  return result;
  */
}

//

function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  index = _.arrayLeftIndex.apply( _, arguments );
  _.assert( index < 0, () => 'The element ' + _.toStrShort( ins ) + ' is several times in dstArray' );

  return result;
}

/*
function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  return result;
}
*/

//

function arrayRemoveArray( dstArray, insArray )
{
  arrayRemovedArray.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayRemovedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArrayOnce.apply( this, arguments );
    let index = - 1;
    for( let i = 0, len = insArray.length; i < len ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      _.assert( index < 0 );
    }
    _.assert( result === insArray.length );

  }
  else
  {
    result = arrayRemovedArray.apply( this, [ dstArray, insArray ] );
  }
  return dstArray;
}

/*
function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

function arrayRemovedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2 )
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );

  let result = 0;
  let index = -1;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    index = dstArray.indexOf( insArray[ i ] );
    while( index !== -1 )
    {
      dstArray.splice( index, 1 );
      result += 1;
      index = dstArray.indexOf( insArray[ i ], index );
    }
  }

  return result;
}

//

/**
 * The callback function to compare two values.
 *
 * @callback arrayRemovedArrayOnce~onEvaluate
 * @param { * } el - The element of the (dstArray[n]) array.
 * @param { * } ins - The value to compare (insArray[n]).
 */

/**
 * The arrayRemovedArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
 * and returns amount of the deleted elements from the (dstArray).
 *
 * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqualize) arguments, creates variable (let result = 0),
 * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function(dstArray.indexOf(insArray[i])).
 * that looking for the value of the (insArray[i]) array in the (dstArray) array.
 * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
 * and incrementing the variable (result++).
 * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the routine
 *
 * If callback function(onEqualize) returns true, it returns the index that will be removed from (dstArray),
 * and then incrementing the variable (result++).
 *
 * @see wTools.arrayLeftIndex
 *
 * @param { longIs } dstArray - The target array.
 * @param { longIs } insArray - The source array.
 * @param { function } onEqualize - The callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayRemovedArrayOnce( [  ], [  ] );
 *
 * @example
 * // returns 2
 * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
 *
 * @example
 * // returns 4
 * let got = _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
 *   return a < b;
 * } );
 *
 * @returns { number }  Returns amount of the deleted elements from the (dstArray).
 * @function arrayRemovedArrayOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (insArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
 * @memberof wTools
 */

function arrayRemovedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;
  let index = -1;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );

    if( index >= 0 )
    {
      dstArray.splice( index, 1 );
      result += 1;
    }
  }

  return result;
}

//

function arrayRemovedArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArrayOnce.apply( this, arguments );
    let index = - 1;
    for( let i = 0, len = insArray.length; i < len ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      _.assert( index < 0 );
    }
    _.assert( result === insArray.length );

  }
  else
  {
    result = arrayRemovedArray.apply( this, [ dstArray, insArray ] );
  }
  return result;
}

//

function arrayRemoveArrays( dstArray, insArray )
{
  arrayRemovedArrays.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayRemovedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected );
    _.assert( arrayRemovedArraysOnce.apply( this, arguments ) === 0 );
  }
  else
  {
    result = arrayRemovedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArraysOnce.apply( this, arguments );

  let expected = 0;
  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.longIs( insArray[ i ] ) )
    expected += insArray[ i ].length;
    else
    expected += 1;
  }

  _.assert( result === expected );

  return dstArray;
}
*/

//

function arrayRemovedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayRemovedArrays :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayRemovedArrays :', 'Expects longIs entity' );

  let result = 0;

  function _remove( argument )
  {
    let index = dstArray.indexOf( argument );
    while( index !== -1 )
    {
      dstArray.splice( index, 1 );
      result += 1;
      index = dstArray.indexOf( argument, index );
    }
  }

  for( let a = insArray.length - 1; a >= 0; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = array.length - 1; i >= 0; i-- )
      _remove( array[ i ] );
    }
    else
    {
      _remove( insArray[ a ] );
    }
  }

  return result;
}

//

function arrayRemovedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), 'arrayRemovedArraysOnce :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayRemovedArraysOnce :', 'Expects longIs entity' );

  let result = 0;

  function _removeOnce( argument )
  {
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
    if( index >= 0 )
    {
      dstArray.splice( index, 1 );
      result += 1;
    }
  }

  for( let a = insArray.length - 1; a >= 0; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = array.length - 1; i >= 0; i-- )
      _removeOnce( array[ i ] );
    }
    else
    {
      _removeOnce( insArray[ a ] );
    }
  }

  return result;
}

//

function arrayRemovedArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected );
    _.assert( arrayRemovedArraysOnce.apply( this, arguments ) === 0 );
  }
  else
  {
    result = arrayRemovedArrays.apply( this, [ dstArray, insArray ] );
  }

  return result;
}

//

/**
 * Callback for compare two value.
 *
 * @callback arrayRemoveAll~compareCallback
 * @param { * } el - Element of the array.
 * @param { * } ins - Value to compare.
 */

/**
 * The arrayRemoveAll() routine removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElement( dstArray, ins )]{@link wTools.arrayRemovedElement}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElement( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElement}
 *
 * @see wTools.arrayRemovedElement
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 2, 2, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2, function( el, ins ) {
 *   return el < ins;
 * });
 *
 * @example
 * // returns [ 1, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2 );
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveAll
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

// function arrayRemoveAll( dstArray, ins, evaluator1, evaluator2 )
// {
//   arrayRemovedAll.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayRemovedAll( dstArray, ins, evaluator1, evaluator2  )
// {
//   let index = _.arrayLeftIndex.apply( _, arguments );
//   let result = 0;
//
//   while( index >= 0 )
//   {
//     dstArray.splice( index, 1 );
//     result += 1;
//     index = _.arrayLeftIndex.apply( _, arguments );
//   }
//
//   return result;
// }

//

/**
 * The arrayRemoveDuplicates( dstArray, evaluator ) routine returns the dstArray with the duplicated elements removed.
 *
 * @param { ArrayIs } dstArray - The source and destination array.
 * @param { Function } [ evaluator = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.arrayRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.arrayRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source array without the duplicated elements.
 * @function arrayRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'Expects Array' );

  for( let i = 0 ; i < dstArray.length ; i++ )
  {
    let index;
    do
    {
      index = _.arrayRightIndex( dstArray, dstArray[ i ], evaluator );
      if( index !== i )
      {
        dstArray.splice( index, 1 );
      }
    }
    while( index !== i );
  }

  return dstArray;
}

/* qqq : use do .. while instead */
/*
function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'arrayRemoveDuplicates :', 'Expects Array' );

  for( let i1 = 0 ; i1 < dstArray.length ; i1++ )
  {
    let element1 = dstArray[ i1 ];
    let index = _.arrayRightIndex( dstArray, element1, evaluator );

    while ( index !== i1 )
    {
      dstArray.splice( index, 1 );
      index = _.arrayRightIndex( dstArray, element1, evaluator );
    }
  }

  return dstArray;
}
*/

// --
// array flatten
// --

/**
 * The arrayFlatten() routine returns an array that contains all the passed arguments.
 *
 * It creates two variables the (result) - array and the {-srcMap-} - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the {-srcMap-} each element,
 * checks if {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds element to the result.
 * If {-srcMap-} is an Array and if element(s) of the {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds to the (result) each element of the {-srcMap-} array.
 * Otherwise, if {-srcMap-} is an Array and if element(s) of the {-srcMap-} is equal to the 'undefined' it throws an Error.
 *
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns [ 'str', {}, 1, 2, 5, true ]
 * let arr = _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
 *
 * @returns { Array } - Returns an array of the passed argument(s).
 * @function arrayFlatten
 * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
 * @memberof wTools
 */

function arrayFlatten( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattened.apply( this, arguments );

  return dstArray;
}

//

function arrayFlattenOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattenedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayFlattenedOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattened( dstArray, insArray )
{

  _.assert( arguments.length >= 1 );
  _.assert( _.objectIs( this ) );
  _.assert( _.arrayIs( dstArray ) );

  if( arguments.length === 1 )
  {
    for( let i = dstArray.length-1; i >= 0; --i )
    if( _.longIs( dstArray[ i ] ) )
    {
      let insArray = dstArray[ i ];
      dstArray.splice( i, 1 );
      onLong( insArray, i );
    }
    return dstArray;
  }

  let result = 0;

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let insArray = arguments[ a ];

    if( _.longIs( insArray ) )
    {
      for( let i = 0, len = insArray.length; i < len; i++ )
      {
        if( _.longIs( insArray[ i ] ) )
        {
          let c = _.arrayFlattened( dstArray, insArray[ i ] );
          result += c;
        }
        else
        {
          _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
    else
    {
      _.assert( insArray !== undefined, 'The Array should have no undefined' );
      dstArray.push( insArray );
      result += 1;
    }

  }

  return result;

  /* */

  function onLong( insArray, insIndex )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      if( _.longIs( insArray[ i ] ) )
      onLong( insArray[ i ], insIndex )
      else
      dstArray.splice( insIndex++, 0, insArray[ i ] );
    }
  }

}

//

function arrayFlattenedOnce( dstArray, insArray, evaluator1, evaluator2 )
{

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ) );

  if( arguments.length === 1 )
  {
    _.arrayRemoveDuplicates( dstArray );

    for( let i = dstArray.length-1; i >= 0; --i )
    if( _.longIs( dstArray[ i ] ) )
    {
      let insArray = dstArray[ i ];
      dstArray.splice( i, 1 );
      onLongOnce( insArray, i );
    }
    return dstArray;
  }

  let result = 0;

  if( _.longIs( insArray ) )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
      if( _.longIs( insArray[ i ] ) )
      {
        let c = _.arrayFlattenedOnce( dstArray, insArray[ i ], evaluator1, evaluator2 );
        result += c;
      }
      else
      {
        let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
        if( index === -1 )
        {
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
  }
  else
  {

    _.assert( insArray !== undefined, 'The Array should have no undefined' );

    let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
    if( index === -1 )
    {
      dstArray.push( insArray );
      result += 1;
    }
  }

  return result;

  /* */

  function onLongOnce( insArray, insIndex )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      if( _.longIs( insArray[ i ] ) )
      onLongOnce( insArray[ i ], insIndex )
      else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
      dstArray.splice( insIndex++, 0, insArray[ i ] );
    }
  }
}

//

function arrayFlattenedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ) );

  let oldLength = dstArray.length;
  _.arrayRemoveDuplicates( dstArray );
  let newLength = dstArray.length;
  if( Config.debug )
  _.assert( oldLength === newLength, 'Elements in dstArray must not be repeated' );


  if( arguments.length === 1 )
  {
    for( let i = dstArray.length-1; i >= 0; --i )
    if( _.longIs( dstArray[ i ] ) )
    {
      let insArray = dstArray[ i ];
      dstArray.splice( i, 1 );
      onLongOnce( insArray, i );
    }
    return dstArray;
  }

  let result = 0;

  if( _.longIs( insArray ) )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
      if( _.longIs( insArray[ i ] ) )
      {
        let c = _.arrayFlattenedOnceStrictly( dstArray, insArray[ i ], evaluator1, evaluator2 );
        result += c;
      }
      else
      {
        let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
        if( Config.debug )
        _.assert( index === -1, 'Elements must not be repeated' );

        if( index === -1 )
        {
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
  }
  else
  {
    _.assert( insArray !== undefined, 'The Array should have no undefined' );
    let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
    if( Config.debug )
    _.assert( index === -1, 'Elements must not be repeated' );

    if( index === -1 )
    {
      dstArray.push( insArray );
      result += 1;
    }
  }

  return result;

  /* */

  function onLongOnce( insArray, insIndex )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      if( _.longIs( insArray[ i ] ) )
      onLongOnce( insArray[ i ], insIndex )
      else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
      dstArray.splice( insIndex++, 0, insArray[ i ] );
      else if( Config.debug )
      _.assert( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1, 'Elements must not be repeated' );
    }
  }
}

//

function arrayFlattenDefined( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattenedDefined.apply( this, arguments );

  return dstArray;
}

//

function arrayFlattenDefinedOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattenedDefinedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenDefinedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayFlattenedDefinedOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenedDefined( dstArray, insArray )
{

  _.assert( arguments.length >= 1 );
  _.assert( _.objectIs( this ) );
  _.assert( _.arrayIs( dstArray ) );

  if( arguments.length === 1 )
  {
    for( let i = dstArray.length-1; i >= 0; --i )
    if( _.longIs( dstArray[ i ] ) )
    {
      let insArray = dstArray[ i ];
      dstArray.splice( i, 1 );
      onLong( insArray, i );
    }
    return dstArray;
  }

  let result = 0;

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let insArray = arguments[ a ];

    if( _.longIs( insArray ) )
    {
      for( let i = 0, len = insArray.length; i < len; i++ )
      {
        if( _.longIs( insArray[ i ] ) )
        {
          let c = _.arrayFlattenedDefined( dstArray, insArray[ i ] );
          result += c;
        }
        else
        {
          // _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
          if( insArray[ i ] !== undefined )
          {
            dstArray.push( insArray[ i ] );
            result += 1;
          }
        }
      }
    }
    else
    {
      _.assert( insArray !== undefined, 'The Array should have no undefined' );
      if( insArray !== undefined )
      {
        dstArray.push( insArray );
        result += 1;
      }
    }

  }

  return result;

  /* */

  function onLong( insArray, insIndex )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      if( _.longIs( insArray[ i ] ) )
      onLong( insArray[ i ], insIndex )
      else
      dstArray.splice( insIndex++, 0, insArray[ i ] );
    }
  }

}

//

function arrayFlattenedDefinedOnce( dstArray, insArray, evaluator1, evaluator2 )
{

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ) );

  if( arguments.length === 1 )
  {
    _.arrayRemoveDuplicates( dstArray );

    for( let i = dstArray.length-1; i >= 0; --i )
    if( _.longIs( dstArray[ i ] ) )
    {
      let insArray = dstArray[ i ];
      dstArray.splice( i, 1 );
      onLongOnce( insArray, i );
    }
    return dstArray;
  }

  let result = 0;

  if( _.longIs( insArray ) )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      _.assert( insArray[ i ] !== undefined );
      if( _.longIs( insArray[ i ] ) )
      {
        let c = _.arrayFlattenedDefinedOnce( dstArray, insArray[ i ], evaluator1, evaluator2 );
        result += c;
      }
      else
      {
        let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
        if( index === -1 )
        {
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
  }
  else if( insArray !== undefined )
  {

    let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
    if( index === -1 )
    {
      dstArray.push( insArray );
      result += 1;
    }
  }

  return result;

  /* */

  function onLongOnce( insArray, insIndex )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      if( _.longIs( insArray[ i ] ) )
      onLongOnce( insArray[ i ], insIndex )
      else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
      dstArray.splice( insIndex++, 0, insArray[ i ] );
    }
  }

}

//

function arrayFlattenedDefinedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ) );

  let oldLength = dstArray.length;
  _.arrayRemoveDuplicates( dstArray );
  let newLength = dstArray.length;
  if( Config.debug )
  _.assert( oldLength === newLength, 'Elements in dstArray must not be repeated' );


  if( arguments.length === 1 )
  {
    for( let i = dstArray.length-1; i >= 0; --i )
    if( _.longIs( dstArray[ i ] ) )
    {
      let insArray = dstArray[ i ];
      dstArray.splice( i, 1 );
      onLongOnce( insArray, i );
    }
    return dstArray;
  }

  let result = 0;

  if( _.longIs( insArray ) )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      // _.assert( insArray[ i ] !== undefined );
      if( insArray[ i ] === undefined )
      {
      }
      else if( _.longIs( insArray[ i ] ) )
      {
        let c = _.arrayFlattenedDefinedOnceStrictly( dstArray, insArray[ i ], evaluator1, evaluator2 );
        result += c;
      }
      else
      {
        let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
        if( Config.debug )
        _.assert( index === -1, 'Elements must not be repeated' );
        if( index === -1 )
        {
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
  }
  else if( insArray !== undefined )
  {

    let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
    if( Config.debug )
    _.assert( index === -1, 'Elements must not be repeated' );

    if( index === -1 )
    {
      dstArray.push( insArray );
      result += 1;
    }
  }

  return result;

  /* */

  function onLongOnce( insArray, insIndex )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      if( _.longIs( insArray[ i ] ) )
      onLongOnce( insArray[ i ], insIndex )
      else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
      dstArray.splice( insIndex++, 0, insArray[ i ] );
      else if( Config.debug )
      _.assert( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1, 'Elements must not be repeated' );
    }
  }
}

// --
// array replace
// --

//

function arrayReplace( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return dstArray;
}

/**
 * The arrayReplaceOnce() routine returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 *
 * It takes three arguments (dstArray, ins, sub), calls built in function(dstArray.indexOf(ins)),
 * that looking for value (ins) in the (dstArray).
 * If true, it replaces (ins) value of (dstArray) by (sub) and returns the index of the (ins).
 * Otherwise, it returns (-1) index.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to find.
 * @param { * } sub - The value to replace.
 *
 * @example
 * // returns -1
 * _.arrayReplaceOnce( [ 2, 4, 6, 8, 10 ], 12, 14 );
 *
 * @example
 * // returns 1
 * _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
 *
 * @example
 * // returns 3
 * _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
 *
 * @example
 * // returns 4
 * _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
 *
 * @returns { number }  Returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 * @function arrayReplaceOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array.
 * @throws { Error } Will throw an Error if (arguments.length) is less than three.
 * @memberof wTools
 */

function arrayReplaceOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  arrayReplacedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result < 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedOnce.apply( this, arguments );
  }
  return dstArray;
}

/*
function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/

//

function arrayReplaced( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return result;
}

//

function arrayReplacedOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  if( _.longIs( ins ) )
  {
    _.assert( _.longIs( sub ) );
    _.assert( ins.length === sub.length );
  }

  let index = -1;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  if( index >= 0 )
  dstArray.splice( index, 1, sub );

  return index;
}

//

function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;

  if( Config.debug )
  {
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
    let newResult = arrayReplacedOnce.apply( this, arguments );
    _.assert( newResult < 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedOnce.apply( this, arguments );
  }

  return result;
}

//

function arrayReplaceElement( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return dstArray;
}

//

function arrayReplaceElementOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  arrayReplacedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceElementOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( result !== undefined, () => 'Array does not have element ' + _.toStrShort( ins ) );
    result = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( result === undefined, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
  }
  return dstArray;
}

//

function arrayReplacedElement( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return result;
}

//

function arrayReplacedElementOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  if( _.longIs( ins ) )
  {
    _.assert( _.longIs( sub ) );
    _.assert( ins.length === sub.length );
  }

  let index = -1;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  if( index >= 0 )
  dstArray.splice( index, 1, sub );
  else
  return undefined;

  return ins;
}

//

function arrayReplacedElementOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( result !== undefined, () => 'Array does not have element ' + _.toStrShort( ins ) );
    let newResult = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( newResult === undefined, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
  }

  return result;
}

/*
function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return result;
}
*/

//

function arrayReplaceArray( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArray.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArrayOnce( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );

    let newResult = arrayReplacedArrayOnce.apply( this, arguments );

    _.assert( newResult === 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
  }

  return dstArray;
}

/*
function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result = arrayReplacedArrayOnce.apply( this, arguments );
  _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
  return dstArray;
}
*/

//

function arrayReplacedArray( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( ins ) );
  _.assert( _.longIs( sub ) );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );

  let index = -1;
  let result = 0;
  let oldDstArray = dstArray.slice();  // Array with src values stored
  for( let i = 0, len = ins.length; i < len; i++ )
  {
    let dstArray2 = oldDstArray.slice(); // Array modified for each ins element
    index = _.arrayLeftIndex( dstArray2, ins[ i ], evaluator1, evaluator2 );
    while( index !== -1 )
    {
      let subValue = sub[ i ];
      if( subValue === undefined )
      {
        dstArray.splice( index, 1 );
        dstArray2.splice( index, 1 );
      }
      else
      {
        dstArray.splice( index, 1, subValue );
        dstArray2.splice( index, 1, subValue );
      }

      result += 1;
      index = _.arrayLeftIndex( dstArray2, ins[ i ], evaluator1, evaluator2 );
    }
  }

  return result;
}

//

function arrayReplacedArrayOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( _.longIs( ins ) );
  _.assert( _.longIs( sub ) );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;
  //let oldDstArray = dstArray.slice();  // Array with src values stored
  for( let i = 0, len = ins.length; i < len; i++ )
  {
    index = _.arrayLeftIndex( dstArray, ins[ i ], evaluator1, evaluator2 );
    if( index >= 0 )
    {
      let subValue = sub[ i ];
      if( subValue === undefined )
      dstArray.splice( index, 1 );
      else
      dstArray.splice( index, 1, subValue );
      result += 1;
    }
  }

  return result;
}

//

function arrayReplacedArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'One element of ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
  }

  return result;
}

//

function arrayReplaceArrays( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArrays.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArraysOnce( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArraysOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longIs( ins[ i ] ) )
      expected += ins[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'One element of ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
  }

  return dstArray;

}

//

function arrayReplacedArrays( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );
  _.assert( _.arrayIs( dstArray ), 'arrayReplacedArrays :', 'Expects array' );
  _.assert( _.longIs( sub ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( _.longIs( ins ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );

  let result = 0;
  let oldDstArray = dstArray.slice();  // Array with src values stored

  function _replace( dstArray, argument, subValue, evaluator1, evaluator2  )
  {
    let dstArray2 = oldDstArray.slice();
    //let index = dstArray.indexOf( argument );
    let index = _.arrayLeftIndex( dstArray2, argument, evaluator1, evaluator2 );

    while( index !== -1 )
    {
      dstArray2.splice( index, 1, subValue );
      dstArray.splice( index, 1, subValue );
      result += 1;
      index = _.arrayLeftIndex( dstArray2, argument, evaluator1, evaluator2 );
    }
  }

  for( let a = ins.length - 1; a >= 0; a-- )
  {
    if( _.longIs( ins[ a ] ) )
    {
      let insArray = ins[ a ];
      let subArray = sub[ a ];

      for( let i = insArray.length - 1; i >= 0; i-- )
      _replace( dstArray, insArray[ i ], subArray[ i ], evaluator1, evaluator2   );
    }
    else
    {
      _replace( dstArray, ins[ a ], sub[ a ], evaluator1, evaluator2 );
    }
  }

  return result;
}

//

function arrayReplacedArraysOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );
  _.assert( _.arrayIs( dstArray ), 'arrayReplacedArrays :', 'Expects array' );
  _.assert( _.longIs( sub ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( _.longIs( ins ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );

  let result = 0;
  let oldDstArray = dstArray.slice();  // Array with src values stored

  function _replace( dstArray, argument, subValue, evaluator1, evaluator2  )
  {
    let dstArray2 = oldDstArray.slice();
    //let index = dstArray.indexOf( argument );
    let index = _.arrayLeftIndex( dstArray2, argument, evaluator1, evaluator2 );

    if( index !== -1 )
    {
      dstArray2.splice( index, 1, subValue );
      dstArray.splice( index, 1, subValue );
      result += 1;
    }
  }

  for( let a = ins.length - 1; a >= 0; a-- )
  {
    if( _.longIs( ins[ a ] ) )
    {
      let insArray = ins[ a ];
      let subArray = sub[ a ];

      for( let i = insArray.length - 1; i >= 0; i-- )
      _replace( dstArray, insArray[ i ], subArray[ i ], evaluator1, evaluator2   );
    }
    else
    {
      _replace( dstArray, ins[ a ], sub[ a ], evaluator1, evaluator2 );
    }
  }

  return result;
}

//

function arrayReplacedArraysOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longIs( ins[ i ] ) )
      expected += ins[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
  }

  return result;

}

// //
//
// function arrayReplaceAll( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   arrayReplacedAll.apply( this, arguments );
//   return dstArray;
// }
//
// //
//
// function arrayReplacedAll( dstArray, ins, sub, evaluator1, evaluator2 )
// {
//   _.assert( 3 <= arguments.length && arguments.length <= 5 );
//
//   let index = -1;
//   let result = 0;
//
//   index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
//
//   while( index !== -1 )
//   {
//     dstArray.splice( index, 1, sub );
//     result += 1;
//     index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
//   }
//
//   return result;
// }

//

/**
 * The arrayUpdate() routine adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
 * and returns the last added index or the last replaced index of the array (dstArray).
 *
 * It creates the variable (index) assigns and calls to it the function(arrayReplaceOnce( dstArray, ins, sub ).
 * [arrayReplaceOnce( dstArray, ins, sub )]{@link wTools.arrayReplaceOnce}.
 * Checks if (index) equal to the -1.
 * If true, it adds to an array (dstArray) a value (sub), and returns the last added index of the array (dstArray).
 * Otherwise, it returns the replaced (index).
 *
 * @see wTools.arrayReplaceOnce
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to change.
 * @param { * } sub - The value to add or replace.
 *
 * @example
 * // returns 3
 * let add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
 * console.log( add ) = > [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 *
 * @example
 * // returns 5
 * let add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
 * console.log( add ) => [ 1, 2, 3, 4, 5, 6 ];
 *
 * @example
 * // returns 4
 * let replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
 * console.log( replace ) => [ true, true true, true, true ];
 *
 * @returns { number } Returns the last added or the last replaced index.
 * @function arrayUpdate
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
 * @memberof wTools
 */

function arrayUpdate( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let index = arrayReplacedOnce.apply( this, arguments );

  if( index === -1 )
  {
    dstArray.push( sub );
    index = dstArray.length - 1;
  }

  return index;
}

// --
// fields
// --

// let unrollSymbol = Symbol.for( 'unroll' );

let Fields =
{

  ArrayType : Array,

  accuracy : 1e-7,
  accuracySqrt : 1e-4,
  accuracySqr : 1e-14,

}

// --
// routines
// --

let Routines =
{

  // arguments array

  argumentsArrayIs,
  argumentsArrayMake,
  _argumentsArrayMake,
  argumentsArrayFrom,

  // unroll

  unrollIs,
  unrollIsPopulated,

  unrollMake,
  unrollFrom,
  unrollsFrom,
  unrollFromMaybe,
  unrollNormalize,

  unrollPrepend,
  unrollAppend,
  unrollRemove,

  // long

  longIs,
  longIsPopulated,

  longMake,
  longMakeZeroed,

  _longClone,
  longShallowClone,

  longSlice,
  longButRange,

  longRemoveDuplicates,

  longAreRepeatedProbe,
  longAllAreRepeated,
  longAnyAreRepeated,
  longNoneAreRepeated,

  // buffer checker

  bufferRawIs,
  bufferTypedIs,
  bufferViewIs,
  bufferNodeIs,
  bufferAnyIs,
  bufferBytesIs,
  bufferBytesIs,
  constructorIsBuffer,

  // array checker

  arrayIs,
  arrayIsPopulated,
  arrayLikeResizable,
  arrayLike,

  constructorLikeArray,
  hasLength,
  arrayHasArray,

  arrayCompare,
  arraysAreIdentical,

  arrayHas,
  arrayHasAny, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
  arrayHasAll, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
  arrayHasNone, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */

  arrayAll,
  arrayAny,
  arrayNone,

  // scalar

  scalarAppend,
  scalarToVector,
  scalarFrom,
  scalarFromOrNull,

  // array producer

  arrayMake,
  arrayFrom,
  arrayAs,
  arrayAsShallowing,

  // array sequential search

  arrayLeftIndex,
  arrayRightIndex,

  arrayLeft,
  arrayRight,

  arrayLeftDefined,
  arrayRightDefined,

  arrayCountElement, /* qqq : cover by tests */
  arrayCountTotal, /* qqq : cover by tests */
  arrayCountUnique,

  // array prepend

  arrayPrepend_,

  arrayPrepend,
  arrayPrependOnce,
  arrayPrependOnceStrictly,
  arrayPrepended,
  arrayPrependedOnce,
  arrayPrependedOnceStrictly,

  arrayPrependElement,
  arrayPrependElementOnce,
  arrayPrependElementOnceStrictly,
  arrayPrependedElement,
  arrayPrependedElementOnce,
  arrayPrependedElementOnceStrictly,

  arrayPrependArray,
  arrayPrependArrayOnce,
  arrayPrependArrayOnceStrictly,
  arrayPrependedArray,
  arrayPrependedArrayOnce,
  arrayPrependedArrayOnceStrictly,

  arrayPrependArrays,
  arrayPrependArraysOnce,
  arrayPrependArraysOnceStrictly,
  arrayPrependedArrays,
  arrayPrependedArraysOnce,
  arrayPrependedArraysOnceStrictly,

  // array append

  arrayAppend_,

  arrayAppend,
  arrayAppendOnce,
  arrayAppendOnceStrictly,
  arrayAppended,
  arrayAppendedOnce,
  arrayAppendedOnceStrictly,

  arrayAppendElement, /* qqq : fill gaps */
  arrayAppendElementOnce,
  arrayAppendElementOnceStrictly,
  arrayAppendedElement,
  arrayAppendedElementOnce,
  arrayAppendedElementOnceStrictly,

  arrayAppendArray,
  arrayAppendArrayOnce,
  arrayAppendArrayOnceStrictly,
  arrayAppendedArray,
  arrayAppendedArrayOnce,
  arrayAppendedArrayOnceStrictly,

  arrayAppendArrays,
  arrayAppendArraysOnce,
  arrayAppendArraysOnceStrictly,
  arrayAppendedArrays,
  arrayAppendedArraysOnce,
  arrayAppendedArraysOnceStrictly,

  // array remove

  arrayRemove,
  arrayRemoveOnce,
  arrayRemoveOnceStrictly,
  arrayRemoved,
  arrayRemovedOnce,
  arrayRemovedOnceStrictly,

  arrayRemoveElement, /* should remove all */
  arrayRemoveElementOnce,
  arrayRemoveElementOnceStrictly,
  arrayRemovedElement,
  arrayRemovedElementOnce,
  arrayRemovedElementOnceStrictly,

  arrayRemoveArray,
  arrayRemoveArrayOnce,
  arrayRemoveArrayOnceStrictly,
  arrayRemovedArray,
  arrayRemovedArrayOnce,
  arrayRemovedArrayOnceStrictly,

  arrayRemoveArrays,
  arrayRemoveArraysOnce,
  arrayRemoveArraysOnceStrictly,
  arrayRemovedArrays,
  arrayRemovedArraysOnce,
  arrayRemovedArraysOnceStrictly,

  // arrayRemoveAll,
  // arrayRemovedAll,

  arrayRemoveDuplicates,

  // array flatten

  arrayFlatten,
  arrayFlattenOnce,
  arrayFlattenOnceStrictly,
  arrayFlattened,
  arrayFlattenedOnce,
  arrayFlattenedOnceStrictly,

  arrayFlattenDefined,
  arrayFlattenDefinedOnce,
  arrayFlattenDefinedOnceStrictly,
  arrayFlattenedDefined,
  arrayFlattenedDefinedOnce,
  arrayFlattenedDefinedOnceStrictly,

  // array replace

  arrayReplace,
  arrayReplaceOnce,
  arrayReplaceOnceStrictly,
  arrayReplaced,
  arrayReplacedOnce,
  arrayReplacedOnceStrictly, /* qqq implement */

  arrayReplaceElement,
  arrayReplaceElementOnce,
  arrayReplaceElementOnceStrictly,
  arrayReplacedElement,
  arrayReplacedElementOnce,
  arrayReplacedElementOnceStrictly,

  arrayReplaceArray,
  arrayReplaceArrayOnce,
  arrayReplaceArrayOnceStrictly,
  arrayReplacedArray,
  arrayReplacedArrayOnce,
  arrayReplacedArrayOnceStrictly,

  arrayReplaceArrays,
  arrayReplaceArraysOnce,
  arrayReplaceArraysOnceStrictly,
  arrayReplacedArrays,
  arrayReplacedArraysOnce,
  arrayReplacedArraysOnceStrictly,

  // arrayReplaceAll, // use arrayReplaceElement instead
  // arrayReplacedAll, // use arrayReplacedElement instead

  arrayUpdate,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fLong.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fLong_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fLong_s

( function fMap_s() { // == begin of file fMap_s
function fMap_s_naked() {
( function _fMap_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// map checker
// --

/**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * // returns true
 * let obj = { x : 100 };
 * objectIs(obj);
 * @example
 * // returns false
 * objectIs( 10 );
 *
 * @param { * } src.
 * @return { Boolean }.
 * @function objectIs
 * @memberof wTools
 */

function objectIs( src )
{
  // if( !src )
  // return false;
  // if( _ObjectHasOwnProperty.call( src, 'callee' ) )
  // return false;
  // if( src instanceof Array )
  // return true;
  // if( src instanceof Object )
  // return true;
  // let prototype = Object.getPrototypeOf( src );
  // return prototype === null;
  return Object.prototype.toString.call( src ) === '[object Object]';
}

//

function objectLike( src )
{

  if( _.objectIs( src ) )
  return true;
  if( _.primitiveIs( src ) )
  return false;
  if( _.longIs( src ) )
  return false;
  if( _.routineIsPure( src ) )
  return false;
  if( _.strIs( src ) )
  return false;

  for( let k in src )
  return true;

  return false;
}

//

function objectLikeOrRoutine( src )
{
  if( _.routineIs( src ) )
  return true;
  return _.objectLike( src );
}

//

/**
 * The mapIs() routine determines whether the passed value is an Object,
 * and not inherits through the prototype chain.
 *
 * If the {-srcMap-} is an Object, true is returned,
 * otherwise false is.
 *
 * @param { * } src - Entity to check.
 *
 * @example
 * // returns true
 * mapIs( { a : 7, b : 13 } );
 *
 * @example
 * // returns false
 * mapIs( 13 );
 *
 * @example
 * // returns false
 * mapIs( [ 3, 7, 13 ] );
 *
 * @returns { Boolean } Returns true if {-srcMap-} is an Object, and not inherits through the prototype chain.
 * @function mapIs
 * @memberof wTools
 */

function mapIs( src )
{

  if( !_.objectIs( src ) )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto.constructor && proto.constructor.name !== 'Object' )
  return false;

  if( Object.getPrototypeOf( proto ) === null )
  return true;

  _.assert( proto === null || !!proto, 'unexpected' );

  return false;
}

//

function mapIsEmpty( src )
{
  if( !_.mapIs( src ) )
  return false;
  return Object.keys( src ).length === 0;
}

//

function mapIsPure( src )
{
  if( !src )
  return;

  if( Object.getPrototypeOf( src ) === null )
  return true;

  return false;
}

//

function mapIsPopulated( src )
{
  if( !_.mapIs( src ) )
  return false;
  return Object.keys( src ).length > 0;
}

//

function mapLike( src )
{

  if( mapIs( src ) )
  return true;

  if( !src )
  return false;

  if( src.constructor === Object || src.constructor === null )
  return true;

  if( !_.objectLike( src ) )
  return false;

  if( _.instanceIs( src ) )
  return false;

  return true;
}

//

/**
 * The mapsAreIdentical() returns true, if the second object (src2)
 * has the same values as the first object(src1).
 *
 * It takes two objects (scr1, src2), checks
 * if both object have the same length and [key, value] return true
 * otherwise it returns undefined.
 *
 * @param { objectLike } src1 - First object.
 * @param { objectLike } src2 - Target object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapsAreIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * _.mapsAreIdentical( { a : 7, b : 13 }, { a : 33, b : 13 } );
 *
 * @example
 * returns false
 * _.mapsAreIdentical( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 *
 * @returns { boolean } Returns true, if the second object (src2)
 * has the same values as the first object(src1).
 * @function mapsAreIdentical
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

function mapsAreIdentical( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src1 ) );
  _.assert( _.objectLike( src2 ) );

  if( Object.keys( src1 ).length !== Object.keys( src2 ).length )
  return false;

  for( let s in src1 )
  {
    if( src1[ s ] !== src2[ s ] )
    return false;
  }

  return true;
}

//

/**
 * The mapContain() returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 *
 * It takes two objects (scr, ins),
 * checks if the first object {-srcMap-} has the same [key, value] as
 * the second object (ins).
 * If true, it returns true,
 * otherwise it returns false.
 *
 * @param { objectLike } src - Target object.
 * @param { objectLike } ins - Second object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * mapContain( { a : 7, b : 13 }, { a : 7, b : 13, c : 15 } );
 *
 * @returns { boolean } Returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 * @function mapContain
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

function mapContain( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

/*
  if( Object.keys( src ).length < Object.keys( ins ).length )
  return false;
*/

  for( let s in ins )
  {

    if( ins[ s ] === undefined )
    continue;

    if( src[ s ] !== ins[ s ] )
    return false;

  }

  return true;
}

//

/**
 * Short-cut for _mapSatisfy() routine.
 * Checks if object( o.src ) has at least one key/value pair that is represented in( o.template ).
 * Also works with ( o.template ) as routine that check( o.src ) with own rules.
 * @param {wTools.mapSatisfyOptions} o - Default options {@link wTools.mapSatisfyOptions}.
 * @returns { boolean } Returns true if( o.src ) has same key/value pair(s) with( o.template )
 * or result if ( o.template ) routine call is true.
 *
 * @example
 * //returns true
 * _.mapSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 *
 * @example
 * //returns true
 * _.mapSatisfy( { template : {a : 1, b : 1, c : 1 }, src : { a : 1, b : 2 } } );
 *
 * @example
 * //returns false
 * function routine( src ){ return src.a === 12 }
 * _.mapSatisfy( { template : routine, src : { a : 1, b : 2 } } );
 *
 * @function mapSatisfy
 * @throws {exception} If( arguments.length ) is not equal to 1 or 2.
 * @throws {exception} If( o.template ) is not a Object.
 * @throws {exception} If( o.template ) is not a Routine.
 * @throws {exception} If( o.src ) is undefined.
 * @memberof wTools
*/

function mapSatisfy( o )
{

  if( arguments.length === 2 )
  o = { template : arguments[ 0 ], src : arguments[ 1 ] };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectIs( o.template ) || _.routineIs( o.template ) );
  _.assert( o.src !== undefined );

  _.routineOptions( mapSatisfy, o );

  return _mapSatisfy( o.template, o.src, o.src, o.levels );
}

mapSatisfy.defaults =
{
  template : null,
  src : null,
  levels : 1,
}

//

/**
 * Default options for _mapSatisfy() routine.
 * @typedef {object} wTools.mapSatisfyOptions
 * @property {object|function} [ template=null ] - Map to compare with( src ) or routine that checks each value of( src ).
 * @property {object} [ src=null ] - Source map.
 * @property {number} [ levels=256 ] - Number of levels in map structure.
 *
*/

/**
 * Checks if object( src ) has at least one key/value pair that is represented in( template ).
 * Returns true if( template ) has one or more indentical key/value pair with( src ).
 * If( template ) is provided as routine, routine uses it to check( src ).
 * @param {wTools.mapSatisfyOptions} args - Arguments list {@link wTools.mapSatisfyOptions}.
 * @returns { boolean } Returns true if( src ) has same key/value pair(s) with( template ).
 *
 * @example
 * //returns true
 * _._mapSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 *
 * @example
 * //returns false
 * _._mapSatisfy( {a : 1, b : 1, c : 1 }, { y : 1 , j : 1 } );
 *
 * @example
 * //returns true
 * function template( src ){ return src.y === 1 }
 * _._mapSatisfy( template, { y : 1 , j : 1 } );
 *
 * @function _mapSatisfy
 * @memberof wTools
*/

function _mapSatisfy( template, src, root, levels )
{

  if( template === src )
  return true;

  if( levels === 0 )
  {
    if( _.objectIs( template ) && _.objectIs( src ) && _.routineIs( template.identicalWith ) && src.identicalWith === template.identicalWith )
    return template.identicalWith( src );
    else
    return template === src;
  }
  else if( levels < 0 )
  {
    return false;
  }

  if( _.routineIs( template ) )
  return template( src );

  if( !_.objectIs( src ) )
  return false;

  if( _.objectIs( template ) )
  {
    for( let t in template )
    {
      let satisfy = false;
      satisfy = _mapSatisfy( template[ t ], src[ t ], root, levels-1 );
      if( !satisfy )
      return false;
    }
    return true;
  }

  debugger;

  return false;
}

//

function mapHasKey( srcMap, key )
{

  if( !srcMap )
  return false;

  if( typeof srcMap !== 'object' )
  return false;

  if( !Reflect.has( srcMap, key ) )
  return false;

  return true;
}

// //
//
// function mapHasKey( object, key )
// {
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( _.strIs( key ) )
//   return ( key in object );
//   else if( _.mapIs( key ) )
//   return ( _.nameUnfielded( key ).coded in object );
//   else if( _.symbolIs( key ) )
//   return ( key in object );
//
//   _.assert( 0, 'mapHasKey :', 'unknown type of key :', _.strType( key ) );
// }

//

/**
 * The mapOwnKey() returns true if (object) has own property.
 *
 * It takes (name) checks if (name) is a String,
 * if (object) has own property with the (name).
 * If true, it returns true.
 *
 * @param { Object } object - Object that will be check.
 * @param { name } name - Target property.
 *
 * @example
 * // returns true
 * _.mapOwnKey( { a : 7, b : 13 }, 'a' );
 *
 * @example
 * // returns false
 * _.mapOwnKey( { a : 7, b : 13 }, 'c' );
 *
 * @returns { boolean } Returns true if (object) has own property.
 * @function mapOwnKey
 * @throws { mapOwnKey } Will throw an error if the (name) is unknown.
 * @memberof wTools
 */

//

function mapOwnKey( object, key )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( key ) )
  return _ObjectHasOwnProperty.call( object, key );
  else if( _.mapIs( key ) )
  return _ObjectHasOwnProperty.call( object, _.nameUnfielded( key ).coded );
  else if( _.symbolIs( key ) )
  return _ObjectHasOwnProperty.call( object, key );

  _.assert( 0, 'mapOwnKey :', 'unknown type of key :', _.strType( key ) );
}

//

function mapHasVal( object, val )
{
  let vals = _.mapVals( object );
  return vals.indexOf( val ) !== -1;
}

//

function mapOwnVal( object, val )
{
  let vals = _.mapOwnVals( object );
  return vals.indexOf( val ) !== -1;
}

//

/**
 * The mapHasAll() returns true if object( src ) has all enumerable keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has property with same name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapHasAll( {}, {} );
 *
 * // returns false
 * _.mapHasAll( {}, { a : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has all enumerable keys from( screen ).
 * @function mapHasAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */

function mapHasAll( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src ) );
  _.assert( _.objectLike( screen ) );

  for( let k in screen )
  {
    if( !( k in src ) )
    return false;
  }

  return true;
}

//

/**
 * The mapHasAny() returns true if object( src ) has at least one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has at least one property with same name.
 * Returns true if any key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns false
 * _.mapHasAny( {}, {} );
 *
 * // returns true
 * _.mapHasAny( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapHasAny( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasAny
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */

function mapHasAny( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src ) );
  _.assert( _.objectLike( screen ) );

  for( let k in screen )
  {
    if( k in src )
    debugger;
    if( k in src )
    return true;
  }

  debugger;
  return false;
}

//

/**
 * The mapHasAny() returns true if object( src ) has no one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has no one property with same name.
 * Returns true if all keys from( screen ) not exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapHasNone( {}, {} );
 *
 * // returns false
 * _.mapHasNone( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns true
 * _.mapHasNone( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasNone
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */

function mapHasNone( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src ) );
  _.assert( _.objectLike( screen ) );

  for( let k in screen )
  {
    if( k in src )
    return false;
  }

  return true;
}

//

/**
 * The mapOwnAll() returns true if object( src ) has all own keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapOwnAll( {}, {} );
 *
 * // returns true
 * _.mapOwnAll( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapOwnAll( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */

function mapOwnAll( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.mapIs( src ) );
  _.assert( _.mapIs( screen ) );

  for( let k in screen )
  {
    if( !_ObjectHasOwnProperty.call( src, k ) )
    debugger;
    if( !_ObjectHasOwnProperty.call( src, k ) )
    return false;
  }

  debugger;
  return true;
}

//

/**
 * The mapOwnAny() returns true if map( src ) has at least one own property from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from map( screen ) and checks if source( src ) has at least one property with that key name.
 * Returns true if one of keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns false
 * _.mapOwnAny( {}, {} );
 *
 * // returns true
 * _.mapOwnAny( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapOwnAny( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAny
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @memberof wTools
 */

function mapOwnAny( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.mapIs( src ) );
  _.assert( _.mapIs( screen ) );

  for( let k in screen )
  {
    if( _ObjectHasOwnProperty.call( src, k ) )
    debugger;
    if( _ObjectHasOwnProperty.call( src, k ) )
    return true;
  }

  debugger;
  return false;
}

//

/**
 * The mapOwnNone() returns true if map( src ) not owns properties from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if no one key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapOwnNone( {}, {} );
 *
 * // returns false
 * _.mapOwnNone( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns true
 * _.mapOwnNone( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if map( src ) not owns properties from( screen ).
 * @function mapOwnNone
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @memberof wTools
 */

function mapOwnNone( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.mapIs( src ) );
  _.assert( _.mapIs( screen ) );

  for( let k in screen )
  {
    if( _ObjectHasOwnProperty.call( src, k ) )
    debugger;
    if( _ObjectHasOwnProperty.call( src, k ) )
    return false;
  }

  debugger;
  return true;
}

//

function mapHasExactly( srcMap, screenMaps )
{
  let result = true;

  _.assert( arguments.length === 2 );

  result = result && _.mapHasOnly( srcMap, screenMaps );
  result = result && _.mapHasAll( srcMap, screenMaps );

  return true;
}

//

function mapOwnExactly( srcMap, screenMaps )
{
  let result = true;

  _.assert( arguments.length === 2 );

  result = result && _.mapOwnOnly( srcMap, screenMaps );
  result = result && _.mapOwnAll( srcMap, screenMaps );

  return true;
}

//

function mapHasOnly( srcMap, screenMaps )
{

  _.assert( arguments.length === 2 );

  let l = arguments.length;
  let but = Object.keys( _.mapBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  return false;

  return true;
}

//

function mapOwnOnly( srcMap, screenMaps )
{

  _.assert( arguments.length === 2 );

  let l = arguments.length;
  let but = Object.keys( _.mapOwnBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  return false;

  return true;
}

// //
//
// function mapHasAll( srcMap, all )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = Object.keys( _.mapBut( all, srcMap ) );
//
//   if( but.length > 0 )
//   return false;
//
//   return true;
// }
//
//
//
// function mapOwnAll( srcMap, all )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = Object.keys( _.mapOwnBut( all, srcMap ) );
//
//   if( but.length > 0 )
//   return false;
//
//   return true;
// }
//
// //
//
// function mapHasNone( srcMap, screenMaps )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = _.mapOnly( srcMap, screenMaps );
//   let keys = Object.keys( but );
//   if( keys.length )
//   return false;
//
//   return true;
// }
//
// //
//
// function mapOwnNone( srcMap, screenMaps )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = Object.keys( _.mapOnlyOwn( srcMap, screenMaps ) );
//
//   if( but.length )
//   return false;
//
//   return true;
// }

//

function mapHasNoUndefine( srcMap )
{

  _.assert( arguments.length === 1 );

  let but = [];
  let l = arguments.length;

  for( let s in srcMap )
  if( srcMap[ s ] === undefined )
  return false;

  return true;
}

// --
// map move
// --

/**
 * The mapMake() routine is used to copy the values of all properties
 * from one or more source objects to the new object.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * _.mapMake( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the new object filled by [ key, value ]
 * from one or more source objects.
 * @function mapMake
 * @memberof wTools
 */

function mapMake()
{
  if( arguments.length <= 1 )
  if( arguments[ 0 ] === undefined || arguments[ 0 ] === null )
  return Object.create( null );
  let args = _.longSlice( arguments );
  args.unshift( Object.create( null ) );
  _.assert( !_.primitiveIs( arguments[ 0 ] ) || arguments[ 0 ] === null );
  return _.mapExtend.apply( _, args );
}

//

function mapShallowClone( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( src ) );
  return _.mapExtend( null, src );
}

//

/**
 * @callback mapCloneAssigning.onField
 * @param { objectLike } dstContainer - destination object.
 * @param { objectLike } srcContainer - source object.
 * @param { string } key - key to coping from one object to another.
 * @param { function } onField - handler of fields.
 */

/**
 * The mapCloneAssigning() routine is used to clone the values of all
 * enumerable own properties from {-srcMap-} object to an (options.dst) object.
 *
 * It creates two variables:
 * let options = options || {}, result = options.dst || {}.
 * Iterate over {-srcMap-} object, checks if {-srcMap-} object has own properties.
 * If true, it calls the provided callback function( options.onField( result, srcMap, k ) ) for each key (k),
 * and copies each [ key, value ] of the {-srcMap-} to the (result),
 * and after cycle, returns clone with prototype of srcMap.
 *
 * @param { objectLike } srcMap - The source object.
 * @param { Object } o - The options.
 * @param { objectLike } [options.dst = Object.create( null )] - The target object.
 * @param { mapCloneAssigning.onField } [options.onField()] - The callback function to copy each [ key, value ]
 * of the {-srcMap-} to the (result).
 *
 * @example
 * // returns Example { sex : 'Male', name : 'Peter', age : 27 }
 * function Example() {
 *   this.name = 'Peter';
 *   this.age = 27;
 * }
 * mapCloneAssigning( new Example(), { dst : { sex : 'Male' } } );
 *
 * @returns { objectLike }  The (result) object gets returned.
 * @function mapCloneAssigning
 * @throws { Error } Will throw an Error if ( o ) is not an Object,
 * if ( arguments.length > 2 ), if (key) is not a String or
 * if {-srcMap-} has not own properties.
 * @memberof wTools
 */

function mapCloneAssigning( o )
{
  o.dstMap = o.dstMap || Object.create( null );

  _.assert( _.mapIs( o ) );
  _.assert( arguments.length === 1, 'mapCloneAssigning :', 'Expects {-srcMap-} as argument' );
  _.assert( _.objectLike( o.srcMap ), 'mapCloneAssigning :', 'Expects {-srcMap-} as argument' );
  _.routineOptions( mapCloneAssigning, o );

  if( !o.onField )
  o.onField = function onField( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  }

  for( let k in o.srcMap )
  {
    if( _ObjectHasOwnProperty.call( o.srcMap, k ) )
    o.onField( o.dstMap, o.srcMap, k, o.onField );
  }

  Object.setPrototypeOf( o.dstMap, Object.getPrototypeOf( o.srcMap ) );

  return o.dstMap;
}

mapCloneAssigning.defaults =
{
  srcMap : null,
  dstMap : null,
  onField : null,
}

//

/**
 * The mapExtend() is used to copy the values of all properties
 * from one or more source objects to a target object.
 *
 * It takes first object (dstMap)
 * creates variable (result) and assign first object.
 * Checks if arguments equal two or more and if (result) is an object.
 * If true,
 * it extends (result) from the next objects.
 *
 * @param{ objectLike } dstMap - The target object.
 * @param{ ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the target object.
 * @function mapExtend
 * @throws { Error } Will throw an error if ( arguments.length < 2 ),
 * if the (dstMap) is not an Object.
 * @memberof wTools
 */

function mapExtend( dstMap, srcMap )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  if( arguments.length === 2 && Object.getPrototypeOf( srcMap ) === null )
  return Object.assign( dstMap, srcMap );

  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as the first argument' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let srcMap = arguments[ a ];

    _.assert( !_.primitiveIs( srcMap ), 'Expects non primitive' );

    if( Object.getPrototypeOf( srcMap ) === null )
    Object.assign( dstMap, srcMap );
    else
    for( let k in srcMap )
    {
      dstMap[ k ] = srcMap[ k ];
    }

  }

  return dstMap;
}

//

function mapsExtend( dstMap, srcMaps )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  if( srcMaps.length === 1 && Object.getPrototypeOf( srcMaps[ 0 ] ) === null )
  return Object.assign( dstMap, srcMaps[ 0 ] );

  if( !_.arrayLike( srcMaps ) )
  srcMaps = [ srcMaps ];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayLike( srcMaps ) );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as the first argument' );

  for( let a = 0 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];

    _.assert( !_.primitiveIs( srcMap ), 'Expects non primitive' );

    if( Object.getPrototypeOf( srcMap ) === null )
    Object.assign( dstMap, srcMap );
    else for( let k in srcMap )
    {
      dstMap[ k ] = srcMap[ k ];
    }

  }

  return dstMap;
}

//

/**
 * The mapExtendConditional() creates a new [ key, value ]
 * from the next objects if callback function(filter) returns true.
 *
 * It calls a provided callback function(filter) once for each key in an (argument),
 * and adds to the {-srcMap-} all the [ key, value ] for which callback
 * function(filter) returns true.
 *
 * @param { function } filter - The callback function to test each [ key, value ]
 * of the (dstMap) object.
 * @param { objectLike } dstMap - The target object.
 * @param { ...objectLike } arguments[] - The next object.
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * _.mapExtendConditional( _.field.mapper.dstNotHas, { a : 1, b : 2 }, { a : 1 , c : 3 } );
 *
 * @returns { objectLike } Returns the unique [ key, value ].
 * @function mapExtendConditional
 * @throws { Error } Will throw an Error if ( arguments.length < 3 ), (filter)
 * is not a Function, (result) and (argument) are not the objects.
 * @memberof wTools
 */

function mapExtendConditional( filter, dstMap )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( !!filter );
  _.assert( filter.functionFamily === 'field-mapper' );
  _.assert( arguments.length >= 3, 'Expects more arguments' );
  _.assert( _.routineIs( filter ), 'Expects filter' );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as argument' );

  for( let a = 2 ; a < arguments.length ; a++ )
  {
    let srcMap = arguments[ a ];

    _.assert( !_.primitiveIs( srcMap ), () => 'Expects object-like entity to extend, but got : ' + _.strType( srcMap ) );

    for( let k in srcMap )
    {

      filter.call( this, dstMap, srcMap, k );

    }

  }

  return dstMap;
}

//

function mapsExtendConditional( filter, dstMap, srcMaps )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( !!filter );
  _.assert( filter.functionFamily === 'field-mapper' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.routineIs( filter ), 'Expects filter' );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as argument' );

  for( let a = 0 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];

    _.assert( !_.primitiveIs( srcMap ), () => 'Expects object-like entity to extend, but got : ' + _.strType( srcMap ) );

    for( let k in srcMap )
    {

      filter.call( this, dstMap, srcMap, k );

    }

  }

  return dstMap;
}

//

function mapExtendHiding( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.hiding );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendHiding( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.hiding, dstMap, srcMaps );
}

//

function mapExtendAppendingAnything( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.appendingAnything );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendAppendingAnything( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.appendingAnything, dstMap, srcMaps );
}

//

function mapExtendAppendingArrays( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.appendingArrays );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendAppendingArrays( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.appendingArrays, dstMap, srcMaps );
}

//

function mapExtendByDefined( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.srcDefined );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendByDefined( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.srcDefined, dstMap, srcMaps );
}

//

function mapExtendNulls( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.srcNull );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendNulls( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.srcNull, dstMap, srcMaps );
}

//

/**
 * The mapSupplement() supplement destination map by source maps.
 * Pairs of destination map are not overwritten by pairs of source maps if any overlap.
 * Routine rewrite pairs of destination map which has key === undefined.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * let r = mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
 *
 * @returns { objectLike } Returns an object with unique [ key, value ].
 * @function mapSupplement
 * @memberof wTools
 */

function mapSupplement( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( !_.primitiveIs( dstMap ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    for( let s in srcMap )
    {
      if( s in dstMap )
      continue;
      dstMap[ s ] = srcMap[ s ];
    }
  }

  return dstMap
}

//

function mapSupplementStructureless( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );

  if( dstMap === null )
  dstMap = Object.create( null );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    for( let s in srcMap )
    {
      if( dstMap[ s ] !== undefined )
      continue;
      if( _.objectLike( srcMap[ s ] ) || _.arrayLike( srcMap[ s ] ) )
      {
        debugger;
        throw Error( 'Source map should have only primitive elements, but have ' + _.strType( srcMap ) );
      }
      dstMap[ s ] = srcMap[ s ];
    }
  }

  return dstMap
}

//

function mapSupplementByMaps( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.dstNotHas, dstMap, srcMaps );
}

//

function mapSupplementNulls( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotHasOrHasNull );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementNils( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotHasOrHasNil );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementAssigning( dstMap )
{
  let args = _.longSlice( arguments );
  // args.unshift( _.field.mapper.dstNotOwnAssigning );
  args.unshift( _.field.mapper.dstNotHasAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementAppending( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotHasAppending );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsSupplementAppending( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotHasAppending, dstMap, srcMaps );
}

//

// function mapStretch( dstMap )
function mapSupplementOwn( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return _.mapExtend( dstMap, srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwn );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsSupplementOwn( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwn, dstMap, srcMaps );
}

//

function mapSupplementOwnAssigning( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementOwnFromDefinition( dstMap, srcMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnFromDefinition );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementOwnFromDefinitionStrictlyPrimitives( dstMap, srcMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnFromDefinitionStrictlyPrimitive );
  return _.mapExtendConditional.apply( this, args );
}

//

/**
 * The mapComplement() complement ( dstMap ) by one or several ( srcMap ).
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 'ab', c : 3 };
 * _.mapComplement( { a : 1, b : 'ab' }, { a : 12 , c : 3 } );
 *
 * @returns { objectLike } Returns an object filled by all unique, clone [ key, value ].
 * @function mapComplement
 * @memberof wTools
 */

/* qqq : need to explain how undefined handled and write good documentation */

function mapComplement( dstMap, srcMap )
{

  function dstNotOwnOrUndefinedAssigning( dstContainer, srcContainer, key )
  {
    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    {
      if( dstContainer[ key ] !== undefined )
      return;
    }
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  dstNotOwnOrUndefinedAssigning.functionFamily = 'field-mapper';

  // _.assert( !!_.field.mapper );
  if( arguments.length === 2 )
  return _.mapExtendConditional( dstNotOwnOrUndefinedAssigning, dstMap, srcMap );

  let args = _.longSlice( arguments );
  args.unshift( dstNotOwnOrUndefinedAssigning );
  return _.mapExtendConditional.apply( this, args );

  /*
    filter should be defined explicitly instead of using _.field.mapper.dstNotOwnOrUndefinedAssigning
    to have mapComplement available as soon as possible
  */

}

//

function mapsComplement( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwnOrUndefinedAssigning, dstMap, srcMaps );
}

//

function mapComplementReplacingUndefines( dstMap, srcMap )
{
  _.assert( !!_.field.mapper );
  if( arguments.length === 2 )
  return _.mapExtendConditional( _.field.mapper.dstNotOwnOrUndefinedAssigning, dstMap, srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnOrUndefinedAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsComplementReplacingUndefines( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwnOrUndefinedAssigning, dstMap, srcMaps );
}

//

function mapComplementPreservingUndefines( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsComplementPreservingUndefines( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwnAssigning, dstMap, srcMaps );
}

//

function mapDelete( dstMap, ins )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( dstMap ) );

  if( ins !== undefined )
  {
    _.assert( _.objectLike( ins ) );
    for( let i in ins )
    {
      delete dstMap[ i ];
    }
  }
  else
  {
    for( let i in dstMap )
    {
      delete dstMap[ i ];
    }
  }

  return dstMap;
}

// --
// map recursive
// --

function mapExtendRecursiveConditional( filters, dstMap, srcMap )
{
  _.assert( arguments.length >= 3, 'Expects at least three arguments' );
  _.assert( this === Self );
  let srcMaps = _.longSlice( arguments, 2 );
  return _.mapsExtendRecursiveConditional( filters, dstMap, srcMaps );
}

//

function _filterTrue(){ return true };
_filterTrue.functionFamily = 'field-filter';
function _filterFalse(){ return true };
_filterFalse.functionFamily = 'field-filter';

function mapsExtendRecursiveConditional( filters, dstMap, srcMaps )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( this === Self );

  if( _.routineIs( filters ) )
  filters = { onUpFilter : filters, onField : filters }

  if( filters.onUpFilter === undefined )
  filters.onUpFilter = filters.onField;
  else if( filters.onUpFilter === true )
  filters.onUpFilter = _filterTrue;
  else if( filters.onUpFilter === false )
  filters.onUpFilter = _filterFalse;

  if( filters.onField === true )
  filters.onField = _filterTrue;
  else if( filters.onField === false )
  filters.onField = _filterFalse;

  _.assert( _.routineIs( filters.onUpFilter ) );
  _.assert( _.routineIs( filters.onField ) );
  _.assert( filters.onUpFilter.functionFamily === 'field-filter' );
  _.assert( filters.onField.functionFamily === 'field-filter' || filters.onField.functionFamily === 'field-mapper' );

  for( let a = 0 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];
    _mapExtendRecursiveConditional( filters, dstMap, srcMap );
  }

  return dstMap;
}

//

function _mapExtendRecursiveConditional( filters, dstMap, srcMap )
{

  _.assert( _.mapIs( srcMap ) );

  for( let s in srcMap )
  {

    if( _.mapIs( srcMap[ s ] ) )
    {

      if( filters.onUpFilter( dstMap, srcMap, s ) === true )
      {
        if( !_.objectIs( dstMap[ s ] ) )
        dstMap[ s ] = Object.create( null );
        _mapExtendRecursiveConditional( filters, dstMap[ s ], srcMap[ s ] );
      }

    }
    else
    {

      if( filters.onField( dstMap, srcMap, s ) === true )
      dstMap[ s ] = srcMap[ s ];

    }

  }

}

//

function mapExtendRecursive( dstMap, srcMap )
{

  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  _.assert( this === Self );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    _mapExtendRecursive( dstMap, srcMap );
  }

  return dstMap;
}

//

function mapsExtendRecursive( dstMap, srcMaps )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( this === Self );

  for( let a = 1 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];
    _mapExtendRecursive( dstMap, srcMap );
  }

  return dstMap;
}

//

function _mapExtendRecursive( dstMap, srcMap )
{

  _.assert( _.objectIs( srcMap ) );

  for( let s in srcMap )
  {

    if( _.objectIs( srcMap[ s ] ) )
    {

      if( !_.objectIs( dstMap[ s ] ) )
      dstMap[ s ] = Object.create( null );
      _mapExtendRecursive( dstMap[ s ], srcMap[ s ] );

    }
    else
    {

      dstMap[ s ] = srcMap[ s ];

    }

  }

}

//

function mapExtendAppendingAnythingRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.appendingAnything, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsExtendAppendingAnythingRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.appendingAnything, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapExtendAppendingArraysRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.appendingArrays, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsExtendAppendingArraysRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.appendingArrays, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapExtendAppendingOnceRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.appendingOnce, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsExtendAppendingOnceRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.appendingOnce, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapSupplementRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.dstNotHas, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapSupplementByMapsRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.dstNotHas, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapSupplementOwnRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.dstNotOwn, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsSupplementOwnRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.dstNotOwn, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapSupplementRemovingRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.removing, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapSupplementByMapsRemovingRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.removing, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

// --
// map manipulator
// --

/*
  qqq : add test
  Dmytro : tests is added
  qqq : reflect update in tests
*/

function mapSetWithKeys( dstMap, key, val )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( _.objectIs( dstMap ) );
  _.assert( _.arrayIs( key ) || _.strIs( key ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  if( _.arrayIs( key ) )
  {
    for( let s = 0 ; s < key.length ; s++ )
    set( dstMap, key[ s ], val );
  }
  else
  {
    set( dstMap, key, val );
  }

  return dstMap;

  function set( dstMap, key, val )
  {

    if( val === undefined )
    delete dstMap[ key ];
    else
    dstMap[ key ] = val;

  }

}

//

/* qqq : add test */

function mapSetStrictly( dstMap, key, val )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( _.objectIs( dstMap ) );
  _.assert( _.arrayIs( key ) || _.strIs( key ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  if( _.arrayIs( key ) )
  {
    for( let s = 0 ; s < key.length ; s++ )
    set( dstMap, key[ s ], val );
  }
  else
  {
    set( dstMap, key, val );
  }

  return dstMap;

  function set( dstMap, key, val )
  {

    if( val === undefined )
    {
      delete dstMap[ key ];
    }
    else
    {
      _.assert( dstMap[ key ] === undefined || dstMap[ key ] === val );
      dstMap[ key ] = val;
    }

  }

}

// --
// map getter
// --

function mapInvert( src, dst )
{
  let o = this === Self ? Object.create( null ) : this;

  if( src )
  o.src = src;

  if( dst )
  o.dst = dst;

  _.routineOptions( mapInvert, o );

  o.dst = o.dst || Object.create( null );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.src ) );

  let del
  if( o.duplicate === 'delete' )
  del = Object.create( null );

  /* */

  for( let k in o.src )
  {
    let e = o.src[ k ];
    if( o.duplicate === 'delete' )
    if( o.dst[ e ] !== undefined )
    {
      del[ e ] = k;
      continue;
    }
    if( o.duplicate === 'array' || o.duplicate === 'array-with-value' )
    {
      if( o.dst[ e ] === undefined )
      o.dst[ e ] = o.duplicate === 'array-with-value' ? [ e ] : [];
      o.dst[ e ].push( k );
    }
    else
    {
      _.assert( o.dst[ e ] === undefined, 'Cant invert the map, it has several keys with value', o.src[ k ] );
      o.dst[ e ] = k;
    }
  }

  /* */

  if( o.duplicate === 'delete' )
  _.mapDelete( o.dst, del );

  return o.dst;
}

mapInvert.defaults =
{
  src : null,
  dst : null,
  duplicate : 'error',
}

//

function mapInvertDroppingDuplicates( src, dst )
{
  dst = dst || Object.create( null );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( src ) );

  let drop;

  for( let s in src )
  {
    if( dst[ src[ s ] ] !== undefined )
    {
      drop = drop || Object.create( null );
      drop[ src[ s ] ] = true;
    }
    dst[ src[ s ] ] = s;
  }

  if( drop )
  for( let d in drop )
  {
    delete dst[ d ];
  }

  return dst;
}

//

function mapsFlatten( o )
{

  if( _.arrayIs( o ) )
  o = { src : o }

  _.routineOptions( mapsFlatten, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.delimeter === false || o.delimeter === 0 || _.strIs( o.delimeter ) );
  _.assert( _.arrayLike( o.src ) || _.mapLike( o.src ) )

  o.dst = o.dst || Object.create( null );
  extend( o.src, '' );

  return o.dst;

  /* */

  function extend( src, prefix )
  {

    if( _.arrayLike( src ) )
    {
      for( let s = 0 ; s < src.length ; s++ )
      extend( src[ s ], prefix );

    }
    else if( _.mapLike( src ) )
    {

      for( let k in src )
      {
        let key = k;
        if( _.strIs( o.delimeter ) )
        key = ( prefix ? prefix + o.delimeter : '' ) + k;
        if( _.mapIs( src[ k ] ) )
        {
          extend( src[ k ], key );
        }
        else
        {
          _.assert( !!o.allowingCollision || o.dst[ key ] === undefined );
          o.dst[ key ] = src[ k ];
        }
      }

    }
    else _.assert( 0, 'Expects map or array of maps, but got ' + _.strType( src ) );

  }

}

mapsFlatten.defaults =
{
  src : null,
  dst : null,
  allowingCollision : 0,
  delimeter : '/',
}

//

/**
 * The mapToArray() converts an object {-srcMap-} into array [ [ key, value ] ... ].
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if ( arguments.length === 1 ) and {-srcMap-} is an object.
 * If true, it returns a list of [ [ key, value ] ... ] pairs.
 * Otherwise it throws an Error.
 *
 * @param { objectLike } src - object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ]
 * _.mapToArray( { a : 3, b : 13, c : 7 } );
 *
 * @returns { array } Returns a list of [ [ key, value ] ... ] pairs.
 * @function mapToArray
 * @throws { Error } Will throw an Error if( arguments.length !== 1 ) or {-srcMap-} is not an object.
 * @memberof wTools
 */

function mapToArray( src )
{
  return _.mapPairs( src );
}

//

/**
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 *
 * It takes an object and two strings (keyValSep) and (tupleSep),
 * checks if (keyValSep and tupleSep) are strings.
 * If false, it assigns them defaults ( ' : ' ) to the (keyValSep) and
 * ( '; ' ) to the tupleSep.
 * Otherwise, it returns a string representing the passed object {-srcMap-}.
 *
 * @param { objectLike } src - The object to convert to the string.
 * @param { string } [ keyValSep = ' : ' ] keyValSep - colon.
 * @param { string } [ tupleSep = '; ' ] tupleSep - semicolon.
 *
 * @example
 * // returns 'a : 1; b : 2; c : 3; d : 4'
 * _.mapToStr( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
 *
 * @example
 * // returns '0 : 1; 1 : 2; 2 : 3';
 * _.mapToStr( [ 1, 2, 3 ], ' : ', '; ' );
 *
 * @example
 * // returns '0 : a; 1 : b; 2 : c';
 * _.mapToStr( 'abc', ' : ', '; ' );
 *
 * @returns { string } Returns a string (result) representing the passed object {-srcMap-}.
 * @function mapToStr
 * @memberof wTools
 */

function mapToStr( o )
{

  if( _.strIs( o ) )
  o = { src : o }

  _.routineOptions( mapToStr, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = '';
  for( let s in o.src )
  {
    result += s + o.keyValDelimeter + o.src[ s ] + o.entryDelimeter;
  }

  result = result.substr( 0, result.length-o.entryDelimeter.length );

  return result
}

mapToStr.defaults =
{
  src : null,
  keyValDelimeter : ':',
  entryDelimeter : ';',
}

// --
// map selector
// --

function _mapEnumerableKeys( srcMap, own )
{
  let result = [];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  if( own )
  {
    for( let k in srcMap )
    if( _ObjectHasOwnProperty.call( srcMap, k ) )
    result.push( k );
  }
  else
  {
    for( let k in srcMap )
    result.push( k );
  }

  return result;
}


//

function _mapKeys( o )
{
  let result = [];

  _.routineOptions( _mapKeys, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectLike( o ) );
  _.assert( !( o.srcMap instanceof Map ), 'not implemented' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );

  /* */

  function filter( srcMap, keys )
  {

    if( !o.selectFilter )
    {
      _.arrayAppendArrayOnce( result, keys );
    }
    else for( let k = 0 ; k < keys.length ; k++ )
    {
      let e = o.selectFilter( srcMap, keys[ k ] );
      if( e !== undefined )
      _.arrayAppendOnce( result, e );
    }
  }

  /* */

  if( o.enumerable )
  {

    filter( o.srcMap, _._mapEnumerableKeys( o.srcMap, o.own ) );

  }
  else
  {

    if( o.own  )
    {
      filter( o.srcMap, Object.getOwnPropertyNames( o.srcMap ) );
    }
    else
    {
      let proto = o.srcMap;
      result = [];
      do
      {
        filter( proto, Object.getOwnPropertyNames( proto ) );
        proto = Object.getPrototypeOf( proto );
      }
      while( proto );
    }

  }

  /* */

  return result;
}

_mapKeys.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * This routine returns an array of a given objects enumerable properties,
 * in the same order as that provided by a for...in loop.
 * Accept single object. Each element of result array is unique.
 * Unlike standard [Object.keys]{@https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/keys}
 * which accept object only mapKeys accept any object-like entity.
 *
 * @see {@link wTools.mapOwnKeys} - Similar routine taking into account own elements only.
 * @see {@link wTools.mapVals} - Similar routine returning values.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapKeys({ a : 7, b : 13 });
 *
 * @example
 * // returns [ "a" ]
 * let o = { own : 1, enumerable : 0 };
 * _.mapKeys.call( o, { a : 1 } );
 *
 * @param { objectLike } srcMap - object of interest to extract keys.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 * @return { array } Returns an array with unique string elements.
 * corresponding to the enumerable properties found directly upon object or empty array
 * if nothing found.
 * @function mapKeys
 * @throws { Exception } Throw an exception if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapKeys( srcMap )
{
  let result;
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapKeys, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;

  if( o.enumerable )
  result = _._mapEnumerableKeys( o.srcMap, o.own );
  else
  result = _._mapKeys( o );

  return result;
}

mapKeys.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnKeys() returns an array of a given object`s own enumerable properties,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapOwnKeys({ a : 7, b : 13 });
 *
 * * @example
 * // returns [ "a" ]
 * let o = { enumerable : 0 };
 * _.mapOwnKeys.call( o, { a : 1 } );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the own enumerable properties found directly upon object or empty
 * array if nothing found.
 * @function mapOwnKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
*/

function mapOwnKeys( srcMap )
{
  let result;
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapOwnKeys.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 1;

  if( o.enumerable )
  result = _._mapEnumerableKeys( o.srcMap, o.own );
  else
  result = _._mapKeys( o );

  if( !o.enumerable )
  debugger;

  return result;
}

mapOwnKeys.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllKeys() returns all properties of provided object as array,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 *
 * @example
 * // returns [ "a", "b", "__defineGetter__", ... "isPrototypeOf" ]
 * let x = { a : 1 };
 * let y = { b : 2 };
 * Object.setPrototypeOf( x, y );
 * _.mapAllKeys( x );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the all properties found on the object.
 * @function mapAllKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
*/

function mapAllKeys( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapAllKeys.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapKeys( o );

  debugger;
  return result;
}

mapAllKeys.defaults =
{
}

//

function _mapVals( o )
{

  _.routineOptions( _mapVals, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );
  _.assert( o.selectFilter === null );

  // let selectFilter = o.selectFilter;
  //
  // if( o.selectFilter )
  // debugger;
  //
  // if( !o.selectFilter )
  // o.selectFilter = function getVal( srcMap, k )
  // {
  //   return srcMap[ k ]
  // }

  let result = _._mapKeys( o );

  for( let k = 0 ; k < result.length ; k++ )
  {
    result[ k ] = o.srcMap[ result[ k ] ];
  }

  return result;
}

_mapVals.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapVals() routine returns an array of a given object's
 * enumerable property values, in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapVals( { a : 7, b : 13 } );
 *
 * @example
 * let o = { own : 1 };
 * let a = { a : 7 };
 * let b = { b : 13 };
 * Object.setPrototypeOf( a, b );
 * _.mapVals.call( o, a )
 * // returns [ 7 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapVals( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapVals, o );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;

  let result = _._mapVals( o );

  return result;
}

mapVals.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnVals() routine returns an array of a given object's
 * own enumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapOwnVals( { a : 7, b : 13 } );
 *
 * @example
 * let o = { enumerable : 0 };
 * let a = { a : 7 };
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 1 } )
 * _.mapOwnVals.call( o, a )
 * // returns [ 7, 1 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapOwnVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnVals( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapVals.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 1;

  let result = _._mapVals( o );

  debugger;
  return result;
}

mapOwnVals.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllVals() returns values of all properties of provided object as array,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 *
 * @example
 * // returns [ "7", "13", function __defineGetter__(), ... function isPrototypeOf() ]
 * _.mapAllVals( { a : 7, b : 13 } );
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapAllVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */

function mapAllVals( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapAllVals.defaults );
  _.assert( !_.primitiveIs( srcMap ) );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapVals( o );

  debugger;
  return result;
}

mapAllVals.defaults =
{
}

//

function _mapPairs( o )
{

  _.routineOptions( _mapPairs, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.selectFilter === null || _.routineIs( o.selectFilter ) );
  _.assert( !_.primitiveIs( o.srcMap ) );

  let selectFilter = o.selectFilter;

  if( o.selectFilter )
  debugger;

  if( !o.selectFilter )
  o.selectFilter = function getVal( srcMap, k )
  {
    return [ k, srcMap[ k ] ];
  }

  let result = _._mapKeys( o );

  return result;
}

_mapPairs.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapPairs() converts an object into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapPairs.call( { own : 1 }, a );
 * //returns [ [ "a", 1 ] ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapPairs( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapPairs.defaults );

  o.srcMap = srcMap;

  let result = _._mapPairs( o );

  return result;
}

mapPairs.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnPairs() converts an object's own properties into a list of [ key, value ] pairs.
 *
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs of object`s own properties if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapOwnPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnPairs( a );
 * //returns [ [ "a", 1 ] ]
 *
 * @example
 * let a = { a : 1 };
 * _.mapOwnPairs.call( { enumerable : 0 }, a );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapOwnPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnPairs( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapPairs.defaults );

  o.srcMap = srcMap;
  o.own = 1;

  let result = _._mapPairs( o );

  debugger;
  return result;
}

mapOwnPairs.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllPairs() converts all properties of the object {-srcMap-} into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs that repesents all properties of provided object{-srcMap-},
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ], ... [ "isPrototypeOf", function isPrototypeOf() ] ]
 * _.mapAllPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllPairs( a );
 * //returns [ [ "a", 1 ], [ "b", 2 ], ... [ "isPrototypeOf", function isPrototypeOf() ]  ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapAllPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */

function mapAllPairs( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assertMapHasOnly( o, mapAllPairs.defaults );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapPairs( o );

  debugger;
  return result;
}

mapAllPairs.defaults =
{
}

//

function _mapProperties( o )
{
  let result = Object.create( null );

  _.routineOptions( _mapProperties, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( o.srcMap ) );

  let keys = _._mapKeys( o );

  for( let k = 0 ; k < keys.length ; k++ )
  {
    result[ keys[ k ] ] = o.srcMap[ keys[ k ] ];
  }

  return result;
}

_mapProperties.defaults =
{
  srcMap : null,
  own : 0,
  enumerable : 1,
  selectFilter : null,
}

//

/**
 * The mapProperties() gets enumerable properties of the object{-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties( a );
 * //returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties.call( { own : 1 }, a )
 * //returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable properties from source{-srcMap-}.
 * @function mapProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapProperties( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapProperties, o );

  o.srcMap = srcMap;

  let result = _._mapProperties( o );
  return result;
}

mapProperties.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnProperties() gets the object's {-srcMap-} own enumerable properties and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object's own enumerable properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s own enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapOwnProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnProperties( a );
 * //returns { a : 1 }
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } );
 * _.mapOwnProperties.call( { enumerable : 0 }, a )
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with source {-srcMap-} own enumerable properties.
 * @function mapOwnProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnProperties( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapOwnProperties, o );

  o.srcMap = srcMap;
  o.own = 1;

  let result = _._mapProperties( o );
  return result;
}

mapOwnProperties.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllProperties() gets all properties from provided object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique object's properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of all object`s properties.
 *
 * @example
 * // returns { a : 7, b : 13, __defineGetter__ : function...}
 * _.mapAllProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllProperties( a );
 * //returns { a : 1, b : 2, __defineGetter__ : function...}
 *
 * @returns { object } A new map with all unique properties from source {-srcMap-}.
 * @function mapAllProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapAllProperties( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapAllProperties, o );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;

  let result = _._mapProperties( o );
  return result;
}

mapAllProperties.defaults =
{
}

//

/**
 * The mapRoutines() gets enumerable properties that contains routines as value from the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties that holds routines from source {-srcMap-} to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { f : function(){} }
 * _.mapRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines( a )
 * //returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines.call( { own : 1 }, a )
 * //returns {}
 *
 * @returns { object } A new map with unique enumerable routine properties from source {-srcMap-}.
 * @function mapRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */


function mapRoutines( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapRoutines, o );

  o.srcMap = srcMap;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
    debugger;
  }

  debugger;
  let result = _._mapProperties( o );
  return result;
}

mapRoutines.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnRoutines() gets object`s {-srcMap-} own enumerable properties that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} own unique enumerable properties that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { f : function(){} }
 * _.mapOwnRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnRoutines( a )
 * //returns {}
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : function(){} } );
 * _.mapOwnRoutines.call( { enumerable : 0 }, a )
 * //returns { b : function(){} }
 *
 * @returns { object } A new map with unique object`s own enumerable routine properties from source {-srcMap-}.
 * @function mapOwnRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnRoutines( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapOwnRoutines, o );

  o.srcMap = srcMap;
  o.own = 1;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
    debugger;
  }

  debugger;
  let result = _._mapProperties( o );
  return result;
}

mapOwnRoutines.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllRoutines() gets all properties of object {-srcMap-} that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique properties of source {-srcMap-} that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 *
 * @example
 * // returns { f : function, __defineGetter__ : function...}
 * _.mapAllRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllRoutines( a )
 * // returns { f : function, __defineGetter__ : function...}
 *
 *
 * @returns { object } A new map with all unique object`s {-srcMap-} properties that are routines.
 * @function mapAllRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapAllRoutines( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapAllRoutines, o );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    debugger;
    if( _.routineIs( srcMap[ k ] ) )
    return k;
  }

  debugger;
  let result = _._mapProperties( o );
  return result;
}

mapAllRoutines.defaults =
{
}

//

/**
 * The mapFields() gets enumerable fields( all properties except routines ) of the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object {-srcMap-} that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapFields( a );
 * //returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapFields.call( { own : 1 }, a )
 * //returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable fields( all properties except routines ) from source {-srcMap-}.
 * @function mapFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapFields( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapFields, o );

  o.srcMap = srcMap;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _._mapProperties( o );
  return result;
}

mapFields.defaults =
{
  own : 0,
  enumerable : 1,
}

//

/**
 * The mapOwnFields() gets object`s {-srcMap-} own enumerable fields( all properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s own enumerable properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapOwnFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnFields( a );
 * //returns { a : 1 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapFields.call( { enumerable : 0 }, a )
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with object`s {-srcMap-} own enumerable fields( all properties except routines ).
 * @function mapOwnFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapOwnFields( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapOwnFields, o );

  o.srcMap = srcMap;
  o.own = 1;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _._mapProperties( o );
  return result;
}

mapOwnFields.defaults =
{
  enumerable : 1,
}

//

/**
 * The mapAllFields() gets all object`s {-srcMap-} fields( properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all object`s properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of all properties.
 *
 * @example
 * // returns { a : 7, b : 13, __proto__ : Object }
 * _.mapAllFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllFields( a );
 * //returns { a : 1, b : 2, __proto__ : Object }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapAllFields( a );
 * //returns { a : 1, b : 2, __proto__ : Object }
 *
 * @returns { object } A new map with all fields( properties except routines ) from source {-srcMap-}.
 * @function mapAllFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */

function mapAllFields( srcMap )
{
  let o = this === Self ? Object.create( null ) : this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( mapAllFields, o );

  o.srcMap = srcMap;
  o.own = 0;
  o.enumerable = 0;
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  if( _.routineIs( srcMap ) )
  o.selectFilter = function selectRoutine( srcMap, k )
  {
    if( _.arrayHas( [ 'arguments', 'caller' ], k ) )
    return;
    if( !_.routineIs( srcMap[ k ] ) )
    return k;
  }

  let result = _._mapProperties( o );
  return result;
}

mapAllFields.defaults =
{
}

//

/**
 * The mapOnlyPrimitives() gets all object`s {-srcMap-} enumerable atomic fields( null, undef, number, string, symbol ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} enumerable atomic properties to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of atomic properties.
 *
 * @example
 * let a = {};
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 3 } )
 * _.mapOnlyPrimitives( a );
 * // returns { }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOnlyPrimitives( a );
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with all atomic fields from source {-srcMap-}.
 * @function mapOnlyPrimitives
 * @throws { Error } Will throw an Error if {-srcMap-} is not an Object.
 * @memberof wTools
 */

function mapOnlyPrimitives( srcMap )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( srcMap ) );

  let result = _.mapExtendConditional( _.field.mapper.primitive, Object.create( null ), srcMap );
  return result;
}

//

/**
 * The mapFirstPair() routine returns first pair [ key, value ] as array.
 *
 * @param { objectLike } srcMap - An object like entity of get first pair.
 *
 * @example
 * // returns [ 'a', 3 ]
 * _.mapFirstPair( { a : 3, b : 13 } );
 *
 * @example
 * // returns 'undefined'
 * _.mapFirstPair( {  } );
 *
 * @example
 * // returns [ '0', [ 'a', 7 ] ]
 * _.mapFirstPair( [ [ 'a', 7 ] ] );
 *
 * @returns { Array } Returns pair [ key, value ] as array if {-srcMap-} has fields, otherwise, undefined.
 * @function mapFirstPair
 * @throws { Error } Will throw an Error if (arguments.length) less than one, if {-srcMap-} is not an object-like.
 * @memberof wTools
 */

function mapFirstPair( srcMap )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectLike( srcMap ) );

  for( let s in srcMap )
  {
    return [ s, srcMap[ s ] ];
  }

  return [];
}

//

function mapValsSet( dstMap, val )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  for( let k in dstMap )
  {
    dstMap[ k ] = val;
  }

  return dstMap;
}

//

function mapSelect( srcMap, keys )
{
  let result = Object.create( null );

  _.assert( _.arrayLike( keys ) );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let k = 0 ; k < keys.length ; k++ )
  {
    let key = keys[ k ];
    _.assert( _.strIs( key ) || _.numberIs( key ) );
    result[ key ] = srcMap[ key ];
  }

  return result;
}

//

/**
 * The mapValWithIndex() returns value of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * // returns 7
 * _.mapValWithIndex( [ 3, 13, 'c', 7 ], 3 );
 *
 * @returns { * } Returns value of {-srcMap-} by corresponding (index).
 * @function mapValWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @memberof wTools
 */

function mapValWithIndex( srcMap, index )
{

 _.assert( arguments.length === 2, 'Expects exactly two arguments' );
 _.assert( !_.primitiveIs( srcMap ) );

  if( index < 0 ) return;

  let i = 0;
  for( let s in srcMap )
  {
    if( i == index ) return srcMap[s];
    i++;
  }
}

//

/**
 * The mapKeyWithIndex() returns key of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * // returns '1'
 * _.mapKeyWithIndex( [ 'a', 'b', 'c', 'd' ], 1 );
 *
 * @returns { string } Returns key of {-srcMap-} by corresponding (index).
 * @function mapKeyWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @memberof wTools
 */

function mapKeyWithIndex( srcMap, index )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  if( index < 0 )
  return;

  let i = 0;
  for( let s in srcMap )
  {
    if( i == index ) return s;
    i++;
  }

}

//

function mapKeyWithValue( srcMap, value )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );



}

//

function mapIndexWithKey( srcMap, key )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( s === key )
    return s;
  }

  return;
}

//

function mapIndexWithValue( srcMap, value )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( srcMap[ s ] === value )
    return s;
  }

  return;
}

//

function mapNulls( srcMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( srcMap[ s ] === null )
    result[ s ] = null;
  }

  return result;
}

//

function mapButNulls( srcMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( !_.primitiveIs( srcMap ) );

  for( let s in srcMap )
  {
    if( srcMap[ s ] !== null )
    result[ s ] = srcMap[ s ];
  }

  return result;
}
// --
// map logic operator
// --

/**
 * The mapButConditional() routine returns a new object (result)
 * whose (values) are not equal to the arrays or objects.
 *
 * Takes any number of objects.
 * If the first object has same key any other object has
 * then this pair [ key, value ] will not be included into (result) object.
 * Otherwise,
 * it calls a provided callback function( _.field.mapper.primitive )
 * once for each key in the {-srcMap-}, and adds to the (result) object
 * all the [ key, value ],
 * if values are not equal to the array or object.
 *
 * @param { function } filter.primitive() - Callback function to test each [ key, value ] of the {-srcMap-} object.
 * @param { objectLike } srcMap - The target object.
 * @param { ...objectLike } arguments[] - The next objects.
 *
 * @example
 * // returns { a : 1, b : "b" }
 * mapButConditional( _.field.mapper.primitive, { a : 1, b : 'b', c : [ 1, 2, 3 ] } );
 *
 * @returns { object } Returns an object whose (values) are not equal to the arrays or objects.
 * @function mapButConditional
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @memberof wTools
 */

function mapButConditional( fieldFilter, srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
  _.assert( !_.primitiveIs( srcMap ) && !_.longIs( srcMap ), 'Expects map {-srcMap-}' );
  _.assert( fieldFilter && fieldFilter.length === 3 && fieldFilter.functionFamily === 'field-filter', 'Expects field-filter {-fieldFilter-}' );

  if( _.arrayLike( butMap ) )
  {

    for( let s in srcMap )
    {

      let m;
      for( m = 0 ; m < butMap.length ; m++ )
      {
        if( !fieldFilter( butMap[ m ], srcMap, s ) )
        break;
      }

      if( m === butMap.length )
      result[ s ] = srcMap[ s ];

    }

  }
  else
  {

    for( let s in srcMap )
    {

      if( fieldFilter( butMap, srcMap, s ) )
      {
        result[ s ] = srcMap[ s ];
      }

    }

  }

  return result;
}

//

/**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * // returns { c : 3 }
 * mapBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapBut
 * @memberof wTools
 */

function mapBut( srcMap, butMap )
{
  let result = Object.create( null );

  if( _.arrayLike( srcMap ) )
  srcMap = _.mapMake.apply( this, srcMap );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
  _.assert( !_.primitiveIs( srcMap ) && !_.arrayLike( srcMap ), 'Expects map {-srcMap-}' );

  if( _.arrayLike( butMap ) )
  {

    for( let s in srcMap )
    {
      let m;
      for( m = 0 ; m < butMap.length ; m++ )
      {
        if( ( s in butMap[ m ] ) )
        break;
      }

      if( m === butMap.length )
      result[ s ] = srcMap[ s ];

    }

  }
  else
  {

    for( let s in srcMap )
    {

      if( !( s in butMap ) )
      {
        result[ s ] = srcMap[ s ];
      }

    }

  }

  return result;
}

//

/**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * // returns { c : 3 }
 * mapButIgnoringUndefines( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapButIgnoringUndefines
 * @memberof wTools
 */

function mapButIgnoringUndefines( srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  return _.mapButConditional( _.field.filter.dstUndefinedSrcNotUndefined, srcMap, butMap );
  // return _.mapButConditional( _.field.filter.dstHasButUndefined, butMap, srcMap );
}

// function mapButIgnoringUndefines( srcMap, butMap )
// {
//   let result = Object.create( null );
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
//   _.assert( !_.primitiveIs( srcMap ) && !_.longIs( srcMap ), 'Expects map {-srcMap-}' );
//
//   if( _.arrayLike( butMap ) )
//   {
//
//     for( let s in srcMap )
//     {
//
//       if( srcMap[ k ] === undefined )
//       continue;
//
//       for( let m = 0 ; m < butMap.length ; m++ )
//       {
//         if( butMap[ m ][ s ] === undefined )
//         break;
//       }
//
//       if( m === butMap.length )
//       result[ s ] = srcMap[ s ];
//
//     }
//
//   }
//   else
//   {
//
//     for( let s in srcMap )
//     {
//
//       if( srcMap[ k ] === undefined )
//       continue;
//
//       if( butMap[ s ] === undefined )
//       {
//         result[ s ] = srcMap[ s ];
//       }
//
//     }
//
//   }
//
//   return result;
// }
//
//
//
// function mapButIgnoringUndefines( srcMap )
// {
//   let result = Object.create( null );
//   let a, k;
//
//   _.assert( arguments.length >= 2 );
//   _.assert( !_.primitiveIs( srcMap ), 'Expects object as argument' );
//
//   for( k in srcMap )
//   {
//
//     for( a = 1 ; a < arguments.length ; a++ )
//     {
//       let argument = arguments[ a ];
//
//       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
//
//       if( k in argument )
//       if( argument[ k ] !== undefined )
//       break;
//
//     }
//     if( a === arguments.length )
//     {
//       result[ k ] = srcMap[ k ];
//     }
//   }
//
//   return result;
// }
//
// //
//
// function mapBut( srcMap )
// {
//   let result = Object.create( null );
//   let a, k;
//
//   _.assert( arguments.length >= 2 );
//   _.assert( !_.primitiveIs( srcMap ), 'mapBut :', 'Expects object as argument' );
//
//   for( k in srcMap )
//   {
//     for( a = 1 ; a < arguments.length ; a++ )
//     {
//       let argument = arguments[ a ];
//
//       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
//
//       if( k in argument )
//       break;
//
//     }
//     if( a === arguments.length )
//     {
//       result[ k ] = srcMap[ k ];
//     }
//   }
//
//   return result;
// }
//
//

/**
 * The mapOwnBut() returns new object with unique own keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique own keys
 * from the first {-srcMap-} original object.
 * Values for (result) object come from original object {-srcMap-}
 * not from second or other one.
 * If {-srcMap-} does not have own properties it skips rest of code and checks another properties.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param { objectLike } srcMap - The original object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : 7 }
 * mapBut( { a : 7, 'toString' : 5 }, { b : 33, c : 77 } );
 *
 * @returns { object } Returns new (result) object with unique own keys.
 * @function mapOwnBut
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @memberof wTools
 */

function mapOwnBut( srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  return _.mapButConditional( _.field.filter.dstNotHasSrcOwn, srcMap, butMap );
}

//

/**
 * @namespace
 * @property { objectLike } screenMaps.screenMap - The first object.
 * @property { ...objectLike } srcMap.arguments[1, ...] -
 * The pseudo array (arguments[]) from the first [1] index to the end.
 * @property { object } dstMap - The empty object.
 */

/**
 * The mapOnly() returns an object filled by unique [ key, value ]
 * from others objects.
 *
 * It takes number of objects, creates a new object by three properties
 * and calls the _mapOnly( {} ) with created object.
 *
 * @see  {@link wTools._mapOnly} - See for more information.
 *
 * @param { objectLike } screenMap - The first object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * _.mapOnly( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
 *
 * @returns { Object } Returns the object filled by unique [ key, value ]
 * from others objects.
 * @function mapOnly
 * @throws { Error } Will throw an Error if (arguments.length < 2) or (arguments.length !== 2).
 * @memberof wTools
 */

function mapOnly( srcMaps, screenMaps )
{

  if( arguments.length === 1 )
  return _.mapsExtend( null, srcMaps );

  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single or two arguments' );

  return _mapOnly
  ({
    srcMaps,
    screenMaps,
    dstMap : Object.create( null ),
  });

}

//

function mapOnlyOwn( srcMaps, screenMaps )
{

  if( arguments.length === 1 )
  return _.mapsExtendConditional( _.field.mapper.srcOwn, null, srcMaps );

  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single or two arguments' );

  return _mapOnly
  ({
    filter : _.field.mapper.srcOwn,
    srcMaps,
    screenMaps,
    dstMap : Object.create( null ),
  });

}

//

function mapOnlyComplementing( srcMaps, screenMaps )
{

  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single or two arguments' );

  return _mapOnly
  ({
    filter : _.field.mapper.dstNotOwnOrUndefinedAssigning,
    srcMaps,
    screenMaps,
    dstMap : Object.create( null ),
  });

}

//

/**
 * @callback  options.filter
 * @param { objectLike } dstMap - An empty object.
 * @param { objectLike } srcMaps - The target object.
 * @param { string } - The key of the (screenMap).
 */

/**
 * The _mapOnly() returns an object filled by unique [ key, value]
 * from others objects.
 *
 * The _mapOnly() checks whether there are the keys of
 * the (screenMap) in the list of (srcMaps).
 * If true, it calls a provided callback function(filter)
 * and adds to the (dstMap) all the [ key, value ]
 * for which callback function returns true.
 *
 * @param { function } [options.filter = filter.bypass()] options.filter - The callback function.
 * @param { objectLike } options.srcMaps - The target object.
 * @param { objectLike } options.screenMaps - The source object.
 * @param { Object } [options.dstMap = Object.create( null )] options.dstMap - The empty object.
 *
 * @example
 * // returns { a : 33, c : 33, name : "Mikle" };
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
 * options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
 * _mapOnly( options );
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
 * options.srcMaps = { d : 'name', c : 33, a : 'abc' };
 * _mapOnly( options );
 *
 * @returns { Object } Returns an object filled by unique [ key, value ]
 * from others objects.
 * @function _mapOnly
 * @throws { Error } Will throw an Error if (options.dstMap or screenMap) are not objects,
 * or if (srcMaps) is not an array
 * @memberof wTools
 */

function _mapOnly( o )
{

  let dstMap = o.dstMap || Object.create( null );
  let screenMap = o.screenMaps;
  let srcMaps = o.srcMaps;

  if( _.arrayIs( screenMap ) )
  screenMap = _.mapMake.apply( this, screenMap );

  if( !_.arrayIs( srcMaps ) )
  srcMaps = [ srcMaps ];

  if( !o.filter )
  o.filter = _.field.mapper.bypass;

  if( Config.debug )
  {

    _.assert( o.filter.functionFamily === 'field-mapper' );
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( _.objectLike( dstMap ), 'Expects object-like {-dstMap-}' );
    _.assert( !_.primitiveIs( screenMap ), 'Expects not primitive {-screenMap-}' );
    _.assert( _.arrayIs( srcMaps ), 'Expects array {-srcMaps-}' );
    _.assertMapHasOnly( o, _mapOnly.defaults );

    for( let s = srcMaps.length-1 ; s >= 0 ; s-- )
    _.assert( !_.primitiveIs( srcMaps[ s ] ), 'Expects {-srcMaps-}' );

  }

  for( let k in screenMap )
  {

    if( screenMap[ k ] === undefined )
    continue;

    let s;
    for( s = srcMaps.length-1 ; s >= 0 ; s-- )
    if( k in srcMaps[ s ] )
    // if( k in srcMaps[ s ][ k ] !== undefined ) /* xxx */
    break;

    if( s === -1 )
    continue;

    o.filter.call( this, dstMap, srcMaps[ s ], k );

  }

  return dstMap;
}

_mapOnly.defaults =
{
  dstMap : null,
  srcMaps : null,
  screenMaps : null,
  filter : null,
}

// --
// map sure
// --

function sureMapHasExactly( srcMap, screenMaps, msg )
{
  let result = true;

  result = result && _.sureMapHasOnly.apply( this, arguments );
  result = result && _.sureMapHasAll.apply( this, arguments );

  return true;
}

//

function sureMapOwnExactly( srcMap, screenMaps, msg )
{
  let result = true;

  result = result && _.sureMapOwnOnly.apply( this, arguments );
  result = result && _.sureMapOwnAll.apply( this, arguments );

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.sureMapHasOnly( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.sureMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.sureMapHasOnly( a, b, 'message' )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.sureMapHasOnly( a, b, () => 'message, ' + 'map`, ' should have no fields :'  )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function sureMapHasOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */

function sureMapHasOnly( srcMap, screenMaps, msg )
{
  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should have no fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * wTools.sureMapOwnOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.sureMapOwnOnly( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:8
 * // error msg Object should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.sureMapOwnOnly( a, b, () => 'error, ' + 'map should', ' no own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @function sureMapOwnOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */

function sureMapOwnOnly( srcMap, screenMaps, msg )
{
  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOwnBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should own no fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * wTools.sureMapHasAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.sureMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.sureMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapHasAll( a, b, () => 'error, ' + 'map should', ' have fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should have fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function sureMapHasAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function sureMapHasAll( srcMap, all, msg )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapBut( all, srcMap ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should have fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * wTools.sureMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapOwnAll( a, b, 'error, should own fields' );
 *
 * // caught <anonymous>:4:9
 * // error, should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapOwnAll( a, b, () => 'error, ' + 'map should', ' own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function sureMapOwnAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function sureMapOwnAll( srcMap, all, msg )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOwnBut( all, srcMap ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should own fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param {...Object} screenMaps - object(s) to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * wTools.sureMapHasNone( a, b );
 *
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * wTools.sureMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.sureMapHasNone( a, b, 'error, map should have no fields' );
 *
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.sureMapHasNone( a, b, () => 'error, ' + 'map should have', 'no fields :' );
 *
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function sureMapHasNone
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @memberof wTools
 *
 */

function sureMapHasNone( srcMap, screenMaps, msg )
{

 _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOnly( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should have no fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

function sureMapOwnNone( srcMap, screenMaps, msg )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOnlyOwn( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should own no fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * wTools.sureMapHasNoUndefine( map );
 *
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * wTools.sureMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object  should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.sureMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.sureMapHasNoUndefine( map, '"map"', () => 'should have ' + 'no undefines, but has :' );
 *
 * // caught <anonymous>:2:8
 * // "map" should have no undefines, but has : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function sureMapHasNoUndefine
 * @throws {Exception} If no arguments passed or than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @memberof wTools
 *
 */

function sureMapHasNoUndefine( srcMap, msg )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3, 'Expects one, two or three arguments' )

  let but = [];

  for( let s in srcMap )
  if( srcMap[ s ] === undefined )
  but.push( s );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 1 )
    throw _._err
    ({
      args : [ _.strType( srcMap ) + ' should have no undefines, but has :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 1; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr[ i ] = arguments[ i ];
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

// --
// map assert
// --

function assertMapHasFields( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasExactly.apply( this, arguments );
}

//

function assertMapOwnFields( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnExactly.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'map should have no fields :' )
 *
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'map', () => ' should' + ' have no fields :' )
 *
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function assertMapHasOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */

function assertMapHasOnly( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasOnly.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, 'error, map should have no own fields :' );
 *
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, () => 'error, ' + 'map', ' should have no own fields :' );
 *
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @function assertMapOwnOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */

function assertMapOwnOnly( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnOnly.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * wTools.assertMapHasNone( a, b );
 *
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * wTools.assertMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, 'map should have no fields :' );
 *
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, () => 'map ' + 'should ', 'have no fields :' );
 *
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function assertMapHasNone
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @memberof wTools
 *
 */

function assertMapHasNone( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasNone.apply( this, arguments );
}

//

function assertMapOwnNone( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnNone.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, 'map should have fields :' );
 *
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, () => 'map' + ' should', ' have fields :' );
 *
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function assertMapHasAll
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function assertMapHasAll( srcMap, all, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasAll.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.assertMapOwnAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * wTools.assertMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.assertMapOwnAll( a, b, 'error msg, map should own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.assertMapOwnAll( a, b, 'error msg, ', () => 'map' + ' should own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function assertMapOwnAll
 * @throws {Exception} If no arguments passed or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function assertMapOwnAll( srcMap, all, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnAll.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in second argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, 'map', () => ' has ' + 'undefines :');
 *
 * // caught <anonymous>:2:8
 * // map has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function assertMapHasNoUndefine
 * @throws {Exception} If no arguments provided or more than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @memberof wTools
 *
 */

function assertMapHasNoUndefine( srcMap, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasNoUndefine.apply( this, arguments );
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  // map checker

  objectIs,
  objectLike,
  objectLikeOrRoutine,

  mapIs,
  mapIsEmpty,
  mapIsPure,
  mapIsPopulated,
  mapLike,

  mapsAreIdentical,
  mapContain,

  mapSatisfy,
  _mapSatisfy,

  mapHas : mapHasKey,
  mapHasKey,
  mapOwnKey,
  mapHasVal,
  mapOwnVal,

  mapHasAll,
  mapHasAny,
  mapHasNone,

  mapOwnAll,
  mapOwnAny,
  mapOwnNone,

  mapHasExactly,
  mapOwnExactly,

  mapHasOnly,
  mapOwnOnly,

  mapHasNoUndefine,

  // map extend

  mapMake,
  mapShallowClone,
  mapCloneAssigning, /* dubious */

  mapExtend,
  mapsExtend,
  mapExtendConditional,
  mapsExtendConditional,

  mapExtendHiding,
  mapsExtendHiding,
  mapExtendAppendingAnything,
  mapsExtendAppendingAnything,
  mapExtendAppendingArrays,
  mapsExtendAppendingArrays,
  mapExtendByDefined,
  mapsExtendByDefined,
  mapExtendNulls,
  mapsExtendNulls,

  mapSupplement,
  mapSupplementStructureless,
  mapSupplementNulls,
  mapSupplementNils,
  mapSupplementAssigning,
  mapSupplementAppending,
  mapsSupplementAppending,

  mapSupplementOwn,
  mapsSupplementOwn,
  mapSupplementOwnAssigning,
  mapSupplementOwnFromDefinition,
  mapSupplementOwnFromDefinitionStrictlyPrimitives,

  mapComplement,
  mapsComplement,
  mapComplementReplacingUndefines,
  mapsComplementReplacingUndefines,
  mapComplementPreservingUndefines,
  mapsComplementPreservingUndefines,

  // map extend recursive

  mapExtendRecursiveConditional,
  mapsExtendRecursiveConditional,
  _mapExtendRecursiveConditional,

  mapExtendRecursive,
  mapsExtendRecursive,
  _mapExtendRecursive,

  mapExtendAppendingAnythingRecursive,
  mapsExtendAppendingAnythingRecursive,
  mapExtendAppendingArraysRecursive,
  mapsExtendAppendingArraysRecursive,
  mapExtendAppendingOnceRecursive,
  mapsExtendAppendingOnceRecursive,

  mapSupplementRecursive,
  mapSupplementByMapsRecursive,
  mapSupplementOwnRecursive,
  mapsSupplementOwnRecursive,
  mapSupplementRemovingRecursive,
  mapSupplementByMapsRemovingRecursive,

  // map manipulator

  mapSetWithKeys,
  mapSet : mapSetWithKeys,
  mapSetStrictly,
  mapDelete,

  // map transformer

  mapInvert,
  mapInvertDroppingDuplicates,
  mapsFlatten,

  mapToArray, /* qqq : test required */
  mapToStr, /* experimental */

  // map selector

  _mapEnumerableKeys,

  _mapKeys,
  mapKeys,
  mapOwnKeys,
  mapAllKeys,

  _mapVals,
  mapVals,
  mapOwnVals,
  mapAllVals,

  _mapPairs,
  mapPairs,
  mapOwnPairs,
  mapAllPairs,

  _mapProperties,

  mapProperties,
  mapProperties,
  mapOwnProperties,
  mapAllProperties,

  mapRoutines,
  mapRoutines,
  mapOwnRoutines,
  mapAllRoutines,

  mapFields,
  mapFields,
  mapOwnFields,
  mapAllFields,

  mapOnlyPrimitives,
  mapFirstPair,
  mapValsSet,
  mapSelect,

  mapValWithIndex,
  mapKeyWithIndex,
  mapKeyWithValue,
  mapIndexWithKey,
  mapIndexWithValue,

  mapNulls,
  mapButNulls,

  // map logic operator

  mapButConditional,
  mapBut,
  mapButIgnoringUndefines,
  mapOwnBut,

  mapOnly,
  mapOnlyOwn,
  mapOnlyComplementing,
  _mapOnly,

  // map surer

  sureMapHasExactly,
  sureMapOwnExactly,

  sureMapHasOnly,
  sureMapOwnOnly,

  sureMapHasAll,
  sureMapOwnAll,

  sureMapHasNone,
  sureMapOwnNone,

  sureMapHasNoUndefine,

  // map assert

  assertMapHasFields,
  assertMapOwnFields,

  assertMapHasOnly,
  assertMapOwnOnly,

  assertMapHasNone,
  assertMapOwnNone,

  assertMapHasAll,
  assertMapOwnAll,

  assertMapHasNoUndefine,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fMap.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fMap_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fMap_s

( function fNumber_s() { // == begin of file fNumber_s
function fNumber_s_naked() {
( function _fNumbers_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

// --
// number
// --

/**
 * @summary Checks if argument( src ) is a Number.
 * @returns Returns true if ( src ) is a Number, otherwise returns false.
 *
 * @example
 * //returns true
 * numberIs( 5 );
 * @example
 * // returns false
 * numberIs( 'song' );
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function numberIs
 * @memberof wTools
 */

function numberIs( src )
{
  return typeof src === 'number';
  return Object.prototype.toString.call( src ) === '[object Number]';
}

//

function numberIsNotNan( src )
{
  return _.numberIs( src ) && !isNaN( src );
}

//

function numberIsFinite( src )
{

  if( !_.numberIs( src ) )
  return false;

  return isFinite( src );
}

//

function numberIsInfinite( src )
{

  if( !_.numberIs( src ) )
  return false;

  return src === +Infinity || src === -Infinity;
}

//

function numberIsInt( src )
{

  if( !_.numberIs( src ) )
  return false;

  return Math.floor( src ) === src;
}

//

function numbersAre( src )
{
  _.assert( arguments.length === 1 );

  if( _.bufferTypedIs( src ) )
  return true;

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.numberIs( src[ s ] ) )
    return false;
    return true;
  }

  return false;
}

//

function numbersAreIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return Object.is( src1, src2 );
}

//

function numbersAreEquivalent( src1, src2, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  if( accuracy === undefined )
  accuracy = _.accuracy;
  return Math.abs( src1-src2 ) <= accuracy;
}

//

function numbersAreFinite( src )
{

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !numbersAreFinite( src[ s ] ) )
    return false;
    return true;
  }

  if( !_.numberIs( src ) )
  return false;

  return isFinite( src );
}

//

function numbersArePositive( src )
{

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !numbersArePositive( src[ s ] ) )
    return false;
    return true;
  }

  if( !_.numberIs( src ) )
  return false;

  return src >= 0;
}

//

function numbersAreInt( src )
{

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !numbersAreInt( src[ s ] ) )
    return false;
    return true;
  }

  if( !_.numberIs( src ) )
  return false;

  return Math.floor( src ) === src;
}

//

function numberInRange( n,range )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( range.length === 2 );
  _.assert( _.numberIs( range[ 0 ] ) );
  _.assert( _.numberIs( range[ 1 ] ) );
  if( !_.numberIs( n ) )
  return false;
  return range[ 0 ] <= n && n <= range[ 1 ];
}

//

function numberClamp( src,low,high )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( arguments.length === 2 )
  {
    _.assert( arguments[ 1 ].length === 2 );
    low = arguments[ 1 ][ 0 ];
    high = arguments[ 1 ][ 1 ];
  }

  if( src > high )
  return high;

  if( src < low )
  return low;

  return src;
}

//

function numberMix( ins1, ins2, progress )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  return ins1*( 1-progress ) + ins2*( progress );
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  numberIs,
  numberIsNotNan,
  numberIsFinite,
  numberIsInfinite,
  numberIsInt,

  numbersAre,
  numbersAreIdentical,
  numbersAreEquivalent,
  numbersAreFinite,
  numbersArePositive,
  numbersAreInt,

  numberInRange,
  numberClamp,
  numberMix,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fNumber.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fNumber_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fNumber_s

( function fRange_s() { // == begin of file fRange_s
function fRange_s_naked() {
( function _fRange_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// range
// --

function rangeIs( range )
{
  _.assert( arguments.length === 1 );
  if( !_.numbersAre( range ) )
  return false;
  if( range.length !== 2 )
  return false;
  return true;
}

//

function rangeFrom( range )
{
  _.assert( arguments.length === 1 );
  if( _.numberIs( range ) )
  return [ range, Infinity ];
  _.assert( _.longIs( range ) );
  _.assert( range.length === 1 || range.length === 2 );
  _.assert( range[ 0 ] === undefined || _.numberIs( range[ 0 ] ) );
  _.assert( range[ 1 ] === undefined || _.numberIs( range[ 1 ] ) );
  if( range[ 0 ] === undefined )
  return [ 0, range[ 1 ] ];
  if( range[ 1 ] === undefined )
  return [ range[ 0 ], Infinity ];
  return range;
}

//

function rangeClamp( dstRange, clampRange )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.rangeIs( dstRange ) );
  _.assert( _.rangeIs( clampRange ) );

  if( dstRange[ 0 ] < clampRange[ 0 ] )
  dstRange[ 0 ] = clampRange[ 0 ];
  else if( dstRange[ 0 ] > clampRange[ 1 ] )
  dstRange[ 0 ] = clampRange[ 1 ];

  if( dstRange[ 1 ] < clampRange[ 0 ] )
  dstRange[ 1 ] = clampRange[ 0 ];
  else if( dstRange[ 1 ] > clampRange[ 1 ] )
  dstRange[ 1 ] = clampRange[ 1 ];

  return dstRange;
}

//

function rangeNumberElements( range, increment )
{

  _.assert( _.rangeIs( range ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( increment === undefined )
  increment = 1;

  return increment ? ( range[ 1 ]-range[ 0 ] ) / increment : 0;

}

//

function rangeFirstGet( range,options )
{

  var options = options || Object.create( null );
  if( options.increment === undefined )
  options.increment = 1;

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( range ) )
  {
    return range[ 0 ];
  }
  else if( _.mapIs( range ) )
  {
    return range.first
  }
  _.assert( 0, 'unexpected type of range',_.strType( range ) );

}

//

function rangeLastGet( range,options )
{

  var options = options || Object.create( null );
  if( options.increment === undefined )
  options.increment = 1;

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( range ) )
  {
    return range[ 1 ];
  }
  else if( _.mapIs( range ) )
  {
    return range.last
  }
  _.assert( 0, 'unexpected type of range',_.strType( range ) );

}

//

function rangeToStr( range )
{
  _.assert( _.rangeIs( range ) );
  _.assert( arguments.length === 1 );
  return range[ 0 ] + '..' + range[ 1 ];
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  // range

  rangeIs,
  rangeFrom,
  rangeClamp,
  rangeNumberElements,
  rangeFirstGet,
  rangeLastGet,

  rangeToStr,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fRange.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fRange_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fRange_s

( function fRegexp_s() { // == begin of file fRegexp_s
function fRegexp_s_naked() {
( function _fRegexp_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// // let Object.prototype.toString = Object.prototype.toString;
let _ceil = Math.ceil;
let _floor = Math.floor;

// --
// regexp
// --

function regexpIs( src )
{
  return Object.prototype.toString.call( src ) === '[object RegExp]';
}

//

function regexpObjectIs( src )
{
  if( !_.RegexpObject )
  return false;
  return src instanceof _.RegexpObject;
}

//

function regexpLike( src )
{
  if( _.regexpIs( src ) || _.strIs( src ) )
  return true;
  return false;
}

//

function regexpsLike( srcs )
{
  if( !_.arrayIs( srcs ) )
  return false;
  for( let s = 0 ; s < srcs.length ; s++ )
  if( !_.regexpLike( srcs[ s ] ) )
  return false;
  return true;
}

//

function regexpIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  return false;

  return src1.source === src2.source && src1.flags === src2.flags;
}

//

function regexpEquivalent( src1, src2 )
{
  return _.strEquivalent( src1, src2 );
}

//

function _regexpTest( regexp, str )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );
  _.assert( _.strIs( str ) );

  if( _.strIs( regexp ) )
  return regexp === str;
  else
  return regexp.test( str );

}

//

function regexpTest( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return strs.map( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpTestAll( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return strs.every( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpTestAny( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return strs.some( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpTestNone( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return !_._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return !strs.some( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpsTestAll( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestAll( regexps, strs );

  _.assert( _.regexpsLike( regexps ) );

  return regexps.every( ( regexp ) => _.regexpTestAll( regexp, strs ) );
}

//

function regexpsTestAny( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestAny( regexps, strs );

  _.assert( _.regexpsLike( regexps ) );

  return regexps.some( ( regexp ) => _.regexpTestAny( regexp, strs ) );
}

//

function regexpsTestNone( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestNone( regexps, strs );

  _.assert( _.regexpsLike( regexps ) );

  return regexps.every( ( regexp ) => _.regexpTestNone( regexp, strs ) );
}

// --
// fields
// --

let Fields =
{

  // regexpIdentationRegexp : /(\s*\n(\s*))/g,

}

// --
// routines
// --

let Routines =
{

  // regexp

  regexpIs,
  regexpObjectIs,
  regexpLike,
  regexpsLike,
  regexpIdentical,
  regexpEquivalent,

  _regexpTest,
  regexpTest,

  regexpTestAll,
  regexpTestAny,
  regexpTestNone,

  regexpsTestAll,
  regexpsTestAny,
  regexpsTestNone,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fRegexp.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fRegexp_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fRegexp_s

( function fRoutine_s() { // == begin of file fRoutine_s
function fRoutine_s_naked() {
( function _fRoutine_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// routine
// --

function routineIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Function]';
}

//

function routinesAre( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.routineIs( src[ s ] ) )
    return false;
    return true;
  }

  return _.routineIs( src );
}

//

function routineIsPure( src )
{
  if( !src )
  return false;
  if( !( Object.getPrototypeOf( src ) === Function.__proto__ ) )
  return false;
  return true;
}

//

function routineHasName( src )
{
  if( !routineIs( src ) )
  return false;
  if( !src.name )
  return false;
  return true;
}

//

/**
 * Internal implementation.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @function _routineJoin
 * @memberof wTools
 */

function _routineJoin( o )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.boolIs( o.sealing ) );
  _.assert( _.boolIs( o.extending ) );
  _.assert( _.routineIs( o.routine ), 'Expects routine' );
  _.assert( _.longIs( o.args ) || o.args === undefined );

  let routine = o.routine;
  let args = o.args;
  let context = o.context;
  let result = act();

  if( o.extending )
  {
    _.mapExtend( result, routine );

    Object.defineProperty( result, 'originalRoutine',
    {
      value : routine,
      enumerable : false,
    });

    if( context !== undefined )
    Object.defineProperty( result, 'boundContext',
    {
      value : context,
      enumerable : false,
    });

    if( args !== undefined )
    Object.defineProperty( result, 'boundArguments',
    {
      value : args,
      enumerable : false,
    });

  }

  return result;

  function act()
  {

    if( context !== undefined && args !== undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedContextAndArguments';
        _.assert( _.strIs( name ) );
        let __sealedContextAndArguments =
        {
          [ name ] : function()
          {
            return routine.apply( context, args );
          }
        }
        return __sealedContextAndArguments[ name ];
      }
      else
      {
        let a = _.arrayAppendArray( [ context ], args );
        return Function.prototype.bind.apply( routine, a );
      }
    }
    else if( context !== undefined && args === undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedContext';
        let __sealedContext =
        {
          [ name ] : function()
          {
            return routine.call( context );
          }
        }
        return __sealedContext[ name ];
      }
      else
      {
        return Function.prototype.bind.call( routine, context );
      }
    }
    else if( context === undefined && args !== undefined ) // xxx
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedArguments';
        _.assert( _.strIs( name ) );
        let __sealedContextAndArguments =
        {
          [ name ] : function()
          {
            return routine.apply( this, args );
          }
        }
        return __sealedContextAndArguments[ name ];
      }
      else
      {
        let name = routine.name || '__joinedArguments';
        let __joinedArguments =
        {
          [ name ] : function()
          {
            let args2 = _.arrayAppendArrays( null, [ args, arguments ] );
            return routine.apply( this, args2 );
          }
        }
        return __joinedArguments[ name ];
      }
    }
    else if( context === undefined && args === undefined ) // xxx
    {
      return routine;
      // if( !o.sealing )
      // {
      //   return routine;
      // }
      // else
      // {
      //   if( !args )
      //   args = [];
      //
      //   let name = routine.name || '__sealedArguments';
      //   let __sealedArguments =
      //   {
      //     [ name ] : function()
      //     {
      //       return routine.apply( undefined, args );
      //     }
      //   }
      //   return __sealedArguments[ name ];
      //
      // }
    }
    else _.assert( 0 );
  }

}

//

function constructorJoin( routine, args )
{

  _.assert( _.routineIs( routine ), 'Expects routine in the first argument' );
  _.assert( _.longIs( args ), 'Expects array-like in the second argument' );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  return _routineJoin
  ({
    routine,
    context : routine,
    args : args || [],
    sealing : false,
    extending : false,
  });

}

//

/**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 value. Argumetns `args` of target function which are passed before arguments of binded function during
 calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 * @example
   let o = {
        z: 5
    };

   let y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   function f1(){ console.log( this ) };
   let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   let f3 = _.routineJoin( undefined, f1 ); // new function.
   f3.call( o ) // print  { z: 5 }

 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @memberof wTools
 */

function routineJoin( context, routine, args )
{

  _.assert( _.routineIs( routine ), 'routineJoin :', 'Second argument must be a routine' );
  _.assert( arguments.length <= 3, 'routineJoin :', 'Expects 3 or less arguments' );

  return _routineJoin
  ({
    routine,
    context,
    args,
    sealing : false,
    extending : true,
  });

}

//

/**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 value. Argumetns `args` of target function which are passed before arguments of binded function during
 calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 * @example
   let o = {
        z: 5
    };

   let y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   function f1(){ console.log( this ) };
   let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   let f3 = _.routineJoin( undefined, f1 ); // new function.
   f3.call( o ) // print  { z: 5 }

 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @memberof wTools
 */

function routineJoin( context, routine, args )
{

  _.assert( _.routineIs( routine ), 'routineJoin :', 'second argument must be a routine' );
  _.assert( arguments.length <= 3, 'routineJoin :', 'Expects 3 or less arguments' );

  return _routineJoin
  ({
    routine,
    context,
    args,
    sealing : false,
    extending : true,
  });

}

//

  /**
   * Return new function with sealed context and arguments.
   *
   * @example
   let o = {
        z: 5
    };

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineSeal(o, sum, [3, 4]);
   newSum(y); // 12
   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Array<*>} args Arguments wrapped into array. Will be used as argument to `routine` function
   * @returns {Function} Result function with sealed context and arguments.
   * @function routineJoin
   * @memberof wTools
   */

function routineSeal( context, routine, args )
{

  _.assert( _.routineIs( routine ), 'routineSeal :', 'second argument must be a routine' );
  _.assert( arguments.length <= 3, 'routineSeal :', 'Expects 3 or less arguments' );

  return _routineJoin
  ({
    routine,
    context,
    args,
    sealing : true,
    extending : true,
  });

}

//

function routineOptions( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || ( routine ? routine.defaults : null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ) || routine === null, 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  // _.mapSupplementStructureless( options, defaults ); /* xxx qqq : use instead of mapComplement */
  _.mapComplement( options, defaults );
  _.assertMapHasNoUndefine( options );

  return options;
}

//

function assertRoutineOptions( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || ( routine ? routine.defaults : null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ) || routine === null, 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.assertMapHasAll( options, defaults );
  _.assertMapHasNoUndefine( options );

  return options;
}

//

function routineOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'routineOptions : expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.mapComplementPreservingUndefines( options, defaults );

  return options;
}

//

function routineOptionsReplacingUndefines( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.mapComplementReplacingUndefines( options, defaults );

  return options;
}

//

function assertRoutineOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.assertMapHasAll( options, defaults );

  return options;
}

//

function routineOptionsFromThis( routine, _this, constructor )
{

  _.assert( arguments.length === 3, 'routineOptionsFromThis : expects 3 arguments' );

  let options = _this || Object.create( null );
  if( Object.isPrototypeOf.call( constructor, _this ) || constructor === _this )
  options = Object.create( null );

  return _.routineOptions( routine, options );
}

//

function _routinesCompose_pre( routine, args )
{
  let o = args[ 0 ];

  if( !_.mapIs( o ) )
  o = { elements : args[ 0 ] }
  if( args[ 1 ] !== undefined )
  o.chainer = args[ 1 ];

  o.elements = _.arrayAppendArrays( [], [ o.elements ] );
  o.elements = o.elements.filter( ( e ) => e === null ? false : e );

  _.routineOptions( routine, o );
  _.assert( _.routinesAre( o.elements ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( args.length === 1 || !_.objectIs( args[ 0 ] ) );
  _.assert( _.arrayIs( o.elements ) || _.routineIs( o.elements ) );
  _.assert( _.routineIs( args[ 1 ] ) || args[ 1 ] === undefined || args[ 1 ] === null );
  _.assert( o.chainer === null || _.routineIs( o.chainer ) );
  _.assert( o.supervisor === null || _.routineIs( o.supervisor ) );

  return o;
}

//

function _routinesCompose_body( o )
{

  if( o.chainer === null )
  o.chainer = _.compose.chainer.original;

  o.elements = _.arrayFlatten( null, o.elements ); /* qqq xxx : single argument call should be ( no-copy call ) */
  let elements = [];
  for( let s = 0 ; s < o.elements.length ; s++ )
  {
    let src = o.elements[ s ];
    _.assert( _.routineIs( src ) );
    if( src.composed )
    {
      if( src.composed.chainer === o.chainer && src.composed.supervisor === o.supervisor )
      {
        _.arrayAppendArray( elements, src.composed.elements );
      }
      else
      {
        debugger;
        _.arrayAppendElement( elements, src );
      }
    }
    else
    _.arrayAppendElement( elements, src );
  }

  o.elements = elements;

  let supervisor = o.supervisor;
  let chainer = o.chainer;
  let act;

  _.assert( _.routineIs( chainer ) );
  _.assert( supervisor === null || _.routineIs( supervisor ) );

  /* */

  if( elements.length === 0 )
  act = function empty()
  {
    return [];
  }
  // else if( elements.length === 1 ) /* xxx : optimize the case */
  // {
  //   act = elements[ 0 ];
  // }
  else act = function composition()
  {
    let result = [];
    // let args = _.unrollAppend( _.unrollFrom( null ), arguments );
    // debugger;
    let args = _.unrollFrom( arguments );
    for( let k = 0 ; k < elements.length ; k++ )
    {
      _.assert( _.unrollIs( args ), () => 'Expects unroll, but got', _.strType( args ) );
      let routine = elements[ k ];
      let r = routine.apply( this, args );
      _.assert( r !== false /* && r !== undefined */, 'Temporally forbidden type of result', r );
      _.assert( !_.argumentsArrayIs( r ) );
      if( r !== undefined )
      _.unrollAppend( result, r );
      // args = chainer( r, k, args, o );
      args = chainer( args, r, o, k );
      _.assert( args !== undefined && args !== false );
      // if( args === undefined )
      if( args === _.dont )
      break;
      args = _.unrollFrom( args );
    }
    return result;
  }

  o.act = act;
  act.composed = o;

  if( supervisor )
  {
    function compositionSupervise()
    {
      let result = supervisor( this, arguments, act, o );
      return result;
    }
    _.routineExtend( compositionSupervise, act );
    return compositionSupervise;
  }

  return act;
}

_routinesCompose_body.defaults =
{
  elements : null,
  chainer : null,
  supervisor : null,
}

//

function routinesCompose()
{
  let o = _.routinesCompose.pre( routinesCompose, arguments );
  let result = _.routinesCompose.body( o );
  return result;
}

routinesCompose.pre = _routinesCompose_pre;
routinesCompose.body = _routinesCompose_body;
routinesCompose.defaults = Object.create( routinesCompose.body.defaults );

//

/**
 * The routineExtend() is used to copy the values of all properties
 * from source routine to a target routine.
 *
 * It takes first routine (dst), and shallow clone each destination property of type map.
 * Then it checks properties of source routine (src) and extends dst by source properties.
 * The dst properties can be owerwriten by values of source routine
 * if descriptor (writable) of dst property is set.
 *
 * If the first routine (dst) is null then
 * routine routineExtend() makes a routine from routines pre and body
 * @see {@link wTools.routineFromPreAndBody} - Automatic routine generating
 * from preparation routine and main routine (body).
 *
 * @param{ routine } dst - The target routine or null.
 * @param{ * } src - The source routine or object to copy.
 *
 * @example
 * // returns [ routine routinesCompose ], got.option === 1
 * var src =
 * {
 *   pre : _.routinesCompose.pre,
 *   body : _.routinesCompose.body,
 *   someOption : 1,
 * }
 * var got = _.routineExtend( null, src );
 *
 * @example
 * // returns [ routine routinesCompose ]
 * _.routineExtend( null, _.routinesCompose );
 *
 * @example
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 * _.routineExtend( _.routinesCompose, { someOption : 1 } );
 *
 * @example
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 * _.routinesComposes.someOption = 22;
 * _.routineExtend( _.routinesCompose, { someOption : 1 } );
 *
 * @returns { routine } It will return the target routine with extended properties.
 * @function routineExtend
 * @throws { Error } Throw an error if arguments.length < 1 or arguments.length > 2.
 * @throws { Error } Throw an error if dst is not routine or not null.
 * @throws { Error } Throw an error if dst is null and src has not pre and body properties.
 * @throws { Error } Throw an error if src is primitive value.
 * @memberof wTools
 */

function routineExtend( dst )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( dst ) || dst === null );

  /* generate dst routine */

  if( dst === null )
  {

    let dstMap = Object.create( null );
    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let src = arguments[ a ];
      if( src === null )
      continue
      _.mapExtend( dstMap, src )
    }

    if( dstMap.pre && dstMap.body )
    dst = _.routineFromPreAndBody( dstMap.pre, dstMap.body );
    else
    _.assert( 0, 'Not clear how to construct the routine' );
  }

  /* shallow clone properties of dst routine */

  for( let s in dst )
  {
    let property = dst[ s ];
    if( _.mapIs( property ) )
    {
      property = _.mapExtend( null, property );
      dst[ s ] = property;
    }
  }

  /* extend dst routine */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src === null )
    continue;
    _.assert( !_.primitiveIs( src ) );
    for( let s in src )
    {
      let property = src[ s ];
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.writable )
      continue;
      if( _.objectIs( property ) )
      {
        _.assert( !_.mapHas( dst, s ) || _.mapIs( dst[ s ] ) );
        property = Object.create( property );
        if( dst[ s ] )
        _.mapSupplement( property, dst[ s ] );
      }
      dst[ s ] = property;
    }
  }

  return dst;
}

//

function routineFromPreAndBody_pre( routine, args )
{
  let o = args[ 0 ];

  if( args[ 1 ] !== undefined )
  {
    o = { pre : args[ 0 ], body : args[ 1 ], name : args[ 2 ] };
  }

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( o.pre ) || _.routinesAre( o.pre ), 'Expects routine or routines {-o.pre-}' );
  _.assert( _.routineIs( o.body ), 'Expects routine {-o.body-}' );
  _.assert( o.body.defaults !== undefined, 'Body should have defaults' );

  return o;
}

//

function routineFromPreAndBody_body( o )
{

  _.assert( arguments.length === 1 ); // args, r, o, k

  if( !_.routineIs( o.pre ) )
  {
    let _pre = _.routinesCompose( o.pre, function( args, result, op, k )
    {
      _.assert( arguments.length === 4 );
      _.assert( !_.unrollIs( result ) );
      _.assert( _.objectIs( result ) );
      return _.unrollAppend([ callPreAndBody, [ result ] ]);
    });
    _.assert( _.routineIs( _pre ) );
    o.pre = function pre()
    {

      let result = _pre.apply( this, arguments );
      return result[ result.length-1 ];
    }
  }

  let pre = o.pre;
  let body = o.body;

  if( !o.name )
  {
    _.assert( _.strDefined( o.body.name ), 'Body routine should have name' );
    o.name = o.body.name;
    if( o.name.indexOf( '_body' ) === o.name.length-5 && o.name.length > 5 )
    o.name = o.name.substring( 0, o.name.length-5 );
  }

  let r =
  {
    [ o.name ] : function()
    {
      let result;
      let o = pre.call( this, callPreAndBody, arguments );
      _.assert( !_.argumentsArrayIs( o ), 'does not expect arguments array' );
      if( _.unrollIs( o ) )
      result = body.apply( this, o );
      else
      result = body.call( this, o );
      return result;
    }
  }

  let callPreAndBody = r[ o.name ];

  _.assert( _.strDefined( callPreAndBody.name ), 'Looks like your interpreter does not support dynamic naming of functions. Please use ES2015 or later interpreter.' );

  _.routineExtend( callPreAndBody, o.body );

  callPreAndBody.pre = o.pre;
  callPreAndBody.body = o.body;

  return callPreAndBody;
}

routineFromPreAndBody_body.defaults =
{
  pre : null,
  body : null,
  name : null,
}

//

function routineFromPreAndBody()
{
  let o = routineFromPreAndBody.pre.call( this, routineFromPreAndBody, arguments );
  let result = routineFromPreAndBody.body.call( this, o );
  return result;
}

routineFromPreAndBody.pre = routineFromPreAndBody_pre;
routineFromPreAndBody.body = routineFromPreAndBody_body;
routineFromPreAndBody.defaults = Object.create( routineFromPreAndBody_body.defaults );

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  routineIs,
  routinesAre,
  routineIsPure,
  routineHasName,

  _routineJoin,
  constructorJoin,
  routineJoin,
  routineSeal,

  routineOptions,
  assertRoutineOptions,
  routineOptionsPreservingUndefines,
  assertRoutineOptionsPreservingUndefines,
  routineOptionsFromThis,

  routinesCompose,
  routineExtend,
  routineFromPreAndBody,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fRoutine.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fRoutine_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fRoutine_s

( function fString_s() { // == begin of file fString_s
function fString_s_naked() {
( function _fString_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// let _ArraySlice = Array.prototype.slice;
// let _FunctionBind = Function.prototype.bind;
// // let Object.prototype.toString = Object.prototype.toString;
// let Object.hasOwnProperty = Object.hasOwnProperty;

// --
// str
// --

/**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * //returns true
 * strIsIs( 'song' );
 * @example
 * // returns false
 * strIs( 5 );
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function strIs.
 * @memberof wTools
 */

function strIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object String]';
  return result;
}

//

function strsAreAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strIs( src[ s ] ) )
    return false;
    return true;
  }

  return strIs( src );
}

//

function strLike( src )
{
  if( _.strIs( src ) )
  return true;
  if( _.regexpIs( src ) )
  return true;
  return false
}

//

function strsLikeAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strLike( src[ s ] ) )
    return false;
    return true;
  }

  return strLike( src );
}

//

function strDefined( src )
{
  if( !src )
  return false;
  let result = Object.prototype.toString.call( src ) === '[object String]';
  return result;
}

//

function strsAreNotEmpty( src )
{
  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strDefined( src[ s ] ) )
    return false;
    return true;
  }
  return false;
}

// --
// converter
// --

function toStr( src, opts )
{
  let result = '';

  _.assert( arguments.length === 1 || arguments.length === 2 );

  result = _.str( src );

  return result;
}

toStr.fields = toStr;
toStr.routines = toStr;

//

/**
  * Return in one string value of all arguments.
  * @example
   let args = _.str( 'test2' );
  * @return {string}
  * If no arguments return empty string
  * @function str
  * @memberof wTools
  */

function str()
{
  let result = '';
  let line;

  if( !arguments.length )
  return result;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];

    if( src && src.toStr && !Object.hasOwnProperty.call( src, 'constructor' ) )
    line = src.toStr();
    else try
    {
      line = String( src );
    }
    catch( err )
    {
      line = _.strType( src );
    }

    result += line + ' ';
  }

  return result;
}

//

function strShort( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  try
  {

    if( _.primitiveIs( src ) )
    {
      return String( src );
    }
    else if( _.vectorIs( src ) )
    {
      result += '[ Vector with ' + src.length + ' elements' + ' ]';
    }
    else if( src && !_.objectIs( src ) && _.numberIs( src.length ) )
    {
      result += '[ ' + _.strType( src ) + ' with ' + src.length + ' elements ]';
    }
    else if( _.objectIs( src ) || _.objectLike( src ) )
    {
      result += '[ ' + _.strType( src ) + ' with ' + _.entityLength( src ) + ' elements' + ' ]';
    }
    else if( src instanceof Date )
    {
      result += src.toISOString();
    }
    else
    {
      result += String( src );
    }

  }
  catch( err )
  {
    throw err;
  }

  return result;
}

//

function strPrimitive( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( src === null || src === undefined )
  return;

  if( _.primitiveIs( src ) )
  return String( src );

  return;
}

//

/**
  * Return type of src.
  * @example
      let str = _.strType( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strType
  * @memberof wTools
  */

function strType( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.primitiveIs( src ) )
  if( src.constructor && src.constructor.name )
  return src.constructor.name;

  let result = _.strPrimitiveType( src );

  if( result === 'Object' )
  {
    if( Object.getPrototypeOf( src ) === null )
    result = 'Map:Pure';
    else if( src.__proto__ !== Object.__proto__ )
    result = 'Object:Special';
  }

  return result;
}

//

/**
  * Return primitive type of src.
  * @example
      let str = _.strPrimitiveType( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strPrimitiveType
  * @memberof wTools
  */

function strPrimitiveType( src )
{

  let name = Object.prototype.toString.call( src );
  let result = /\[(\w+) (\w+)\]/.exec( name );

  if( !result )
  throw _.err( 'strType :', 'unknown type', name );
  return result[ 2 ];
}

// --
// decorator
// --

function strQuote( o )
{

  if( !_.mapIs( o ) )
  o = { src : o };

  if( o.quote === undefined || o.quote === null )
  o.quote = strQuote.defaults.quote;

  _.assertMapHasOnly( o, strQuote.defaults );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( o.src ) )
  {
    let result = [];
    for( let s = 0 ; s < o.src.length ; s++ )
    result.push( _.strQuote({ src : o.src[ s ], quote : o.quote }) );
    return result;
  }

  let src = o.src;

  if( !_.primitiveIs( src ) )
  src = _.toStr( src );

  _.assert( _.primitiveIs( src ) );

  let result = o.quote + String( src ) + o.quote;

  return result;
}

strQuote.defaults =
{
  src : null,
  quote : '"',
}

// --
//
// --

function _strLeftSingle( src, ins, first, last )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
  _.assert( _.strIs( src ) );
  _.assert( first === undefined || _.numberIs( first ) );
  _.assert( last === undefined || _.numberIs( last ) );

  ins = _.arrayAs( ins );

  let olength = src.length;
  let result = Object.create( null );
  result.index = olength;
  result.entry = undefined;

  if( first !== undefined || last !== undefined )
  {
    if( first === undefined )
    first = 0;
    if( last === undefined )
    last = src.length;
    if( first < 0 )
    first = src.length + first;
    if( last < 0 )
    last = src.length + last;
    _.assert( 0 <= first && first <= src.length );
    _.assert( 0 <= last && last <= src.length );
    src = src.substring( first, last );
  }

  for( let k = 0, len = ins.length ; k < len ; k++ )
  {
    let entry = ins[ k ];
    if( _.strIs( entry ) )
    {
      let found = src.indexOf( entry );
      if( found >= 0 && ( found < result.index || result.entry === undefined ) )
      {
        result.index = found;
        result.entry = entry;
      }
    }
    else if( _.regexpIs( entry ) )
    {
      let found = src.match( entry );
      if( found && ( found.index < result.index || result.entry === undefined ) )
      {
        result.index = found.index;
        result.entry = found[ 0 ];
      }
    }
    else _.assert( 0, 'Expects string-like ( string or regexp )' );
  }

  if( first !== undefined && result.index !== olength )
  result.index += first;

  return result;
}

//

function strLeft( src, ins, first, last )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _._strLeftSingle( src[ s ], ins, first, last );
    return result;
  }
  else
  {
    return _._strLeftSingle( src, ins, first, last );
  }

}

//

/*

(bb)(?!(?=.).*(?:bb))
aaa_bbb_|bb|b_ccc_ccc

.*(bb)
aaa_bbb_b|bb|_ccc_ccc

(b+)(?!(?=.).*(?:b+))
aaa_bbb_|bbb|_ccc_ccc

.*(b+)
aaa_bbb_bb|b|_ccc_ccc

*/

function _strRightSingle( src, ins, first, last )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
  _.assert( _.strIs( src ) );
  _.assert( first === undefined || _.numberIs( first ) );
  _.assert( last === undefined || _.numberIs( last ) );

  ins = _.arrayAs( ins );

  let olength = src.length;
  let result = Object.create( null );
  result.index = -1;
  result.entry = undefined;

  if( first !== undefined || last !== undefined )
  {
    if( first === undefined )
    first = 0;
    if( last === undefined )
    last = src.length;
    if( first < 0 )
    first = src.length + first;
    if( last < 0 )
    last = src.length + last;
    _.assert( 0 <= first && first <= src.length );
    _.assert( 0 <= last && last <= src.length );
    src = src.substring( first, last );
  }

  for( let k = 0, len = ins.length ; k < len ; k++ )
  {
    let entry = ins[ k ];
    if( _.strIs( entry ) )
    {
      let found = src.lastIndexOf( entry );
      if( found >= 0 && found > result.index )
      {
        result.index = found;
        result.entry = entry;
      }
    }
    else if( _.regexpIs( entry ) )
    {

      // entry = _.regexpsJoin([ entry, '(?!(?=.).*(?:))' ]);
      // debugger;

      let regexp1 = _.regexpsJoin([ '.*', '(', entry, ')' ]); // xxx
      let match1 = src.match( regexp1 );
      if( !match1 )
      continue;

      let regexp2 = _.regexpsJoin([ entry, '(?!(?=.).*', entry, ')' ]);
      let match2 = src.match( regexp2 );
      _.assert( !!match2 );

      let found;
      let found1 = match1[ 1 ];
      let found2 = match2[ 0 ];
      let index;
      let index1 = match1.index + match1[ 0 ].length;
      let index2 = match2.index + match2[ 0 ].length;

      if( index1 === index2 )
      {
        if( found1.length < found2.length )
        {
          debugger;
          found = found2;
          index = index2 - found.length;
        }
        else
        {
          found = found1;
          index = index1 - found.length;
        }
      }
      else if( index1 < index2 )
      {
        found = found2;
        index = index2 - found.length;
      }
      else
      {
        debugger;
        found = found1;
        index = index1 - found.length;
      }

      if( index > result.index )
      {
        result.index = index;
        result.entry = found;
      }

    }
    else _.assert( 0, 'Expects string-like ( string or regexp )' );
  }

  if( first !== undefined && result.index !== -1 )
  result.index += first;

  return result;
}

//

function strRight( src, ins, first, last )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _._strRightSingle( src[ s ], ins, first, last );
    return result;
  }
  else
  {
    return _._strRightSingle( src, ins, first, last );
  }

}

// //
//
// function _strCutOff_pre( routine, args )
// {
//   let o;
//
//   if( args.length > 1 )
//   {
//     o = { src : args[ 0 ], delimeter : args[ 1 ], number : args[ 2 ] };
//   }
//   else
//   {
//     o = args[ 0 ];
//     _.assert( args.length === 1, 'Expects single argument' );
//   }
//
//   _.routineOptions( routine, o );
//   _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( o.src ) );
//   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
//
//   return o;
// }

//

function strEquivalent( src1, src2 )
{
  let strIs1 = _.strIs( src1 );
  let strIs2 = _.strIs( src2 );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !strIs1 && strIs2 )
  return _.strEquivalent( src2, src1 );

  _.assert( _.strLike( src1 ), 'Expects string-like ( string or regexp )' );
  _.assert( _.strLike( src1 ), 'Expects string-like ( string or regexp )' );

  if( strIs1 && strIs2 )
  {
    return src1 === src2;
  }
  else if( strIs1 )
  {
    debugger;
    let matched = src2.exec( src1 );
    debugger;
    if( !matched )
    return false;
    if( matched[ 0 ].length !== src1.length )
    return false;
    return true;
  }
  else
  {
    return _.regexpIdentical( src1, src2 );
  }

  return false;
}

//

function strsEquivalent( src1, src2 )
{

  _.assert( _.strIs( src1 ) || _.regexpIs( src1 ) || _.longIs( src1 ), 'Expects string/regexp or array of strings/regexps {-src1-}' );
  _.assert( _.strIs( src2 ) || _.regexpIs( src2 ) || _.longIs( src2 ), 'Expects string/regexp or array of strings/regexps {-src2-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let isLong1 = _.longIs( src1 );
  let isLong2 = _.longIs( src2 );

  if( isLong1 && isLong2 )
  {
    _.assert( src1.length === src2.length );
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      let result = [];
      result[ i ] = _.strEquivalent( src1[ i ], src2[ i ] );
      return result;
    }
  }
  else if( !isLong1 && isLong2 )
  {
    for( let i = 0, len = src2.length ; i < len; i++ )
    {
      let result = [];
      result[ i ] = _.strEquivalent( src1, src2[ i ] );
      return result;
    }
  }
  else if( isLong1 && !isLong2 )
  {
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      let result = [];
      result[ i ] = _.strEquivalent( src1[ i ], src2 );
      return result;
    }
  }
  else
  {
    return _.strEquivalent( src1[ i ], src2 );
  }

}

//

function _strBeginOf( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( begin ) )
  {
    if( src.lastIndexOf( begin, 0 ) === 0 )
    return begin;
  }
  else if( _.regexpIs( begin ) )
  {
    let matched = begin.exec( src );
    if( matched && matched.index === 0 )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return false;
}

//

function _strEndOf( src, end )
{

  _.assert( _.strIs( src ), 'Expects string' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( end ) )
  {
    if( src.indexOf( end, src.length - end.length ) !== -1 )
    return end;
  }
  else if( _.regexpIs( end ) )
  {
    // let matched = end.exec( src );
    let newEnd = RegExp( end.toString().slice(1, -1) + '$' );
    let matched = newEnd.exec( src );
    debugger;
    //if( matched && matched.index === 0 )
    if( matched && matched.index + matched[ 0 ].length === src.length )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return false;
}

//

/**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } begin - String to find at begin of source.
  *
  * @example
  * let scr = _.strBegins( "abc", "a" );
  * // returns true
  *
  * @example
  * let scr = _.strBegins( "abc", "b" );
  * // returns false
  *
  * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
  * @function strBegins
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */

function strBegins( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    return result === false ? result : true;
  }

  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== false )
    return true;
  }

  return false;
}

//

/**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } end - String to find at end of source.
  *
  * @example
  * let scr = _.strEnds( "abc", "c" );
  * // returns true
  *
  * @example
  * let scr = _.strEnds( "abc", "b" );
  * // returns false
  *
  * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
  * @function strEnds
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */

function strEnds( src, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result === false ? result : true;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== false )
    return true;
  }

  return false;
}

//

/**
  * Finds occurrence of( end ) at the end of source( src ) and removes it if exists.
  * Returns begin part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } end - String to find.
  *
  * @example
  * _.strBeginOf( 'abc', 'c' );
  * //returns 'ab'
  *
  * @example
  * _.strBeginOf( 'abc', 'x' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without tail( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strBeginOf
  * @memberof wTools
  */

function strBeginOf( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );


  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    if( result )
    debugger;
    return result;
  }

  debugger;
  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== false )
    return result;
  }

  return false;
}

//

/**
  * Finds occurrence of( begin ) at the begining of source( src ) and removes it if exists.
  * Returns end part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
  * otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find.
  *
  * @example
  * _.strEndOf( 'abc', 'a' );
  * //returns 'bc'
  *
  * @example
  * _.strEndOf( 'abc', 'c' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without head( begin ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strEndOf
  * @memberof wTools
  */

function strEndOf( src, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  debugger;

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== false )
    return result;
  }

  return false;
}

//

/**
  * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
  * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
  * Otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find from begin of source.
  * @param { String } end - String to find from end source.
  *
  * @example
  * _.strInsideOf( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strInsideOf( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strInsideOf( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strInsideOf( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strInsideOf
  * @memberof wTools
  */

function strInsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let beginOf, endOf;

  beginOf = _.strBeginOf( src, begin );
  if( beginOf === false )
  return false;

  debugger;

  endOf = _.strEndOf( src, end );
  if( endOf === false )
  return false;

  debugger;

  let result = src.substring( beginOf.length, src.length - endOf.length );

  return result;
}

//

function strOutsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let beginOf, endOf;

  beginOf = _.strBeginOf( src, begin );
  if( beginOf === false )
  return false;

  endOf = _.strEndOf( src, end );
  if( endOf === false )
  return false;

  let result = beginOf + endOf;

  return result;
}

//

/**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * //returns mple
 * _.strRemoveBegin( 'example', 'exa' );
 *
 * @example
 * //returns example
 * _.strRemoveBegin( 'example', 'abc' );
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveBegin( src, begin )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp {-begin-}'  );

  let result = src;
  let beginOf = _._strBeginOf( result, begin );
  if( beginOf !== false )
  result = result.substr( beginOf.length, result.length );
  return result;
}

//

/**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * //returns examp
 * _.strRemoveEnd( 'example', 'le' );
 *
 * @example
 * //returns example
 * _.strRemoveEnd( 'example', 'abc' );
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveEnd( src, end )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp {-end-}' );

  let result = src;
  let endOf = _._strEndOf( result, end );
  if( endOf !== false )
  result = result.substr( 0, result.length - endOf.length );

  return result;
}

//

/**
* Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be dropped.
* @returns { String } Returns string with result of substring removement.
*
* @example
* //returns ource tring
* _.strRemove( 'source string', 's' );
*
* @example
* //returns example
* _.strRemove( 'example', 's' );
*
* @function strRemove
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
* @memberof wTools
*
*/

function strRemove( srcStr, insStr )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );
  _.assert( _.strIs( srcStr ), 'expects string {-src-}' );
  _.assert( _.strIs( insStr ) || _.regexpIs( insStr ), 'expects string/regexp {-begin-}' );

  let result = srcStr;
  debugger;

  result = result.replace( insStr, '' );

  return result;
}

//

function strReplaceBegin( src, begin, ins )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( ins ), 'Expects {-ins-} as string' );
  _.assert( _.strIs( src ) );

  let result = src;
  if( _.strBegins( result , begin ) )
  {
    let prefix = ins;
    result = prefix + _.strRemoveBegin( result, begin );
  }

  return result;
}

//

function strReplaceEnd( src, end, ins )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( ins ), 'Expects {-ins-} as string' );
  _.assert( _.strIs( src ) );

  let result = src;
  if( _.strEnds( result, end ) )
  {
    let postfix = ins;
    result = _.strRemoveEnd( result , end ) + postfix;
  }

  return result;
}

//

function strReplace( srcStr, insStr, subStr )
{
  _.assert( arguments.length === 3, 'expects exactly three arguments' );
  _.assert( _.strIs( srcStr ), 'expects string {-src-}' );
  _.assert( _.strIs( subStr ), 'expects string {-sub-}' );

  let result = srcStr;
  debugger;

  result = result.replace( insStr, subStr );

  return result;
}


// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  strIs,
  strsAreAll,
  strLike,
  strsLikeAll,
  strDefined,
  strsAreNotEmpty,

  // converter

  toStr,
  toStrShort : toStr,
  strFrom : toStr,

  str,
  strShort,
  strPrimitive,
  strType,
  strPrimitiveType,

  // decorator

  strQuote,

  //

  _strLeftSingle,
  strLeft,
  _strRightSingle,
  strRight,

  strEquivalent,
  strsEquivalent : _.vectorize( strEquivalent, 2 ),
  strsEquivalentAll : _.vectorizeAll( strEquivalent, 2 ),
  strsEquivalentAny : _.vectorizeAny( strEquivalent, 2 ),
  strsEquivalentNone : _.vectorizeNone( strEquivalent, 2 ),

  _strBeginOf,
  _strEndOf,

  strBegins,
  strEnds,

  strBeginOf,
  strEndOf,

  strInsideOf,
  strOutsideOf,

  strRemoveBegin,
  strRemoveEnd,
  strRemove,

  strReplaceBegin,
  strReplaceEnd,
  strReplace,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fString.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fString_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fString_s

( function fTime_s() { // == begin of file fTime_s
function fTime_s_naked() {
( function _fTime_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

// --
// time
// --

function dateIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Date]';
}

//

function datesAreIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.dateIs( src1 ) )
  return false;
  if( !_.dateIs( src2 ) )
  return false;

  src1 = src1.getTime();
  src2 = src2.getTime();

  return src1 === src2;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  dateIs,
  datesAreIdentical,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/fTime.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, fTime_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file fTime_s

( function iArrayDescriptor_s() { // == begin of file iArrayDescriptor_s
function iArrayDescriptor_s_naked() {
(function _kArrayDescriptor_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools;
let Self = _global.wTools;

_.assert( !_.Array );
_.assert( !_.array );
_.assert( !_.withArray );

//

function _arrayNameSpaceApplyTo( dst,def )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.mapOwnKey( dst,'withArray' ) );
  _.assert( !_.mapOwnKey( dst,'array' ) );
  _.assert( !!ArrayNameSpaces[ def ] );

  dst.withArray = Object.create( null );

  for( let d in ArrayNameSpaces )
  {
    dst.withArray[ d ] = Object.create( dst );
    _.mapExtend( dst.withArray[ d ], ArrayNameSpaces[ d ] );
  }

  dst.array = dst.withArray[ def ];
  dst.ArrayNameSpaces = ArrayNameSpaces;

}

// --
// delcare
// --

function _declare( nameSpace )
{

let ArrayType = nameSpace.ArrayType;
let ArrayName = nameSpace.ArrayName;

nameSpace = _.mapExtend( null,nameSpace );

//

/**
 * @summary Creates new array based on type of `src` array. Takes length of new array from second argument `length`.
 * @param {} src Source array
 * @param {Number} [ length ] Lengthof target array.
 * @function makeSimilar
 * @memberof wTools."wTools.array"
 */

function makeSimilar( src,length )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  let result = _.longMake( src,length );

  return result;
}

//

/**
 * @summary Creates new array of length( length ).
 * @description Type of array depends on `ArrayType`( see examples ).
 * @param {Number} length Lengthof new array.
 *
 * @example
 * _.array.makeArrayOfLength(1);// return instance of Array
 *
 * @example
 * _.withArray.Float32.makeArrayOfLength(1);// return instance of Float32Array
 *
 * @function makeArrayOfLength
 * @memberof wTools."wTools.array"
 */

function makeArrayOfLength( length )
{

  if( length === undefined )
  length = 0;

  _.assert( length === undefined || length >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  let result = new this.array.ArrayType( length );

  return result;
}

//

/**
 * @summary Creates new array of length( length ) filled with zeroes.
 * @description Type of array depends on `ArrayType`( see examples ).
 * @param {Number} length Lengthof new array.
 *
 * @example
 * _.array.makeArrayOfLengthZeroed( 2 );//Array [ 0,0 ]
 *
 * @example
 * _.withArray.Float32.makeArrayOfLength( 2 );// Float32Array [ 0,0 ]
 *
 * @function makeArrayOfLengthZeroed
 * @memberof wTools."wTools.array"
 */


function makeArrayOfLengthZeroed( length )
{
  if( length === undefined )
  length = 0;

  _.assert( length === undefined || length >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  let result = new this.array.ArrayType( length );

  if( this.array.ArrayType === Array )
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = 0;

  return result;
}

//

/**
 * @summary Creates new array taking elements from source array `src`.
 * @description Type of new array depends on `ArrayType`( see examples ).
 * Returns new array of type `ArrayType` or src if types are same.
 * @param {} src Source array.
 *
 * @example
 * let src =  _.withArray.Float32.makeArrayOfLength( 2 );
 * _.array.arrayFromCoercing( src );//Array [ 0,0 ]
 *
 * @example
 * let src =  _.array.makeArrayOfLength( 2 );
 * _.withArray.Float32.arrayFromCoercing( src );// Float32Array [ 0,0 ]
 *
 * @example
 * let src =  _.array.makeArrayOfLength( 2 );
 * _.array.arrayFromCoercing( src );// returns src
 *
 * @function arrayFromCoercing
 * @memberof wTools."wTools.array"
 */

function arrayFromCoercing( src )
{
  _.assert( _.longIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( src.constructor === this.array.ArrayType )
  return src;

  let result;

  if( this.array.ArrayType === Array )
  result = new( _.constructorJoin( this.array.ArrayType, src ) );
  else
  result = new this.array.ArrayType( src );

  return result;
}

// --
//
// --

let Extend =
{

  makeSimilar,
  makeArrayOfLength,
  makeArrayOfLengthZeroed,

  arrayFrom : arrayFromCoercing,
  arrayFromCoercing,

  array : nameSpace,

}

_.mapExtend( nameSpace, Extend );
_.assert( !ArrayNameSpaces[ ArrayName ] );

ArrayNameSpaces[ ArrayName ] = nameSpace;

return nameSpace;

}

// --
//
// --

function makeFor_functor( cls )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ cls.name ] : function( src )
    {
      debugger;
      _.assert( arguments.length === 1 );
      return new cls( src );
    }
  }
  return r[ cls.name ];
}

//

function fromFor_functor( cls )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ cls.name ] : function()
    {
      debugger;
      _.assert( arguments.length === 1 );
      if( this instanceof cls )
      return this;
      return new cls( src );
    }
  }
  return r[ cls.name ];
}

//

function isFor_functor( cls )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ cls.name ] : function( src )
    {
      debugger; xxx
      _.assert( arguments.length === 1 );
      return src instanceof cls;
    }
  }
  return r[ cls.name ];
}

//

function longDeclare( o )
{
  _.routineOptions( longDeclare, o );
  _.assert( _.strDefined( o.name ) );
  _.assert( _.strDefined( o.secondName ) || o.secondName === null );
  _.assert( _.strDefined( o.aliasName ) || o.aliasName === null );
  _.assert( _.routineIs( o.type ) );
  _.assert( _.routineIs( o.make ) || o.make === null );
  _.assert( _.routineIs( o.from ) || o.from === null );
  _.assert( _.routineIs( o.is ) || o.make === null );
  _.assert( _.boolIs( o.isTyped ) );
  _.assert( LongDescriptor[ o.name ] === undefined );

  if( !o.make )
  o.make = makeFor_functor( o.type );

  if( !o.from )
  o.from = fromFor_functor( o.type );

  if( !o.is )
  o.is = isFor_functor( o.type );

  Object.freeze( o );
  LongDescriptor[ o.name ] = o;

  return o;
}

longDeclare.defaults =
{
  name : null,
  secondName : null,
  aliasName : null,
  type : null,
  make : null,
  from : null,
  is : null,
  isTyped : null,
}

//

let LongDescriptor =
{
}

longDeclare({ name : 'Array', type : Array, make : _.arrayMake, from : _.arrayMake, is : _.arrayIs, isTyped : false });
longDeclare({ name : 'Unroll', type : Array, make : _.unrollMake, from : _.unrollFrom, is : _.unrollIs, isTyped : false });
longDeclare({ name : 'ArgumentsArray', secondName : 'Arguments', type : _._argumentsArrayMake().constructor, make : _.argumentsArrayFrom, from : _.argumentsArrayFrom, is : _.argumentsArrayIs, isTyped : false });

longDeclare({ name : 'U32x', secondName : 'Uint32', type : _global.U32x, isTyped : true });
longDeclare({ name : 'U16x', secondName : 'Uint16', type : _global.U16x, isTyped : true });
longDeclare({ name : 'U8x', secondName : 'Uint8', type : _global.U8x, isTyped : true });
longDeclare({ name : 'Ux', secondName : 'Uint32', aliasName : 'U32x', type : _global.Ux, isTyped : true });

longDeclare({ name : 'I32x', secondName : 'Int32', type : _global.I32x, isTyped : true });
longDeclare({ name : 'I16x', secondName : 'Int16', type : _global.I16x, isTyped : true });
longDeclare({ name : 'I8x', secondName : 'Int8', type : _global.I8x, isTyped : true });
longDeclare({ name : 'Ix', secondName : 'Int32', aliasName : 'I32x', type :_global.Ix, isTyped : true });

longDeclare({ name : 'F32x', secondName : 'Float32', type : _global.F32x, isTyped : true });
longDeclare({ name : 'F64x', secondName : 'Float64', type : _global.F64x, isTyped : true });
longDeclare({ name : 'Fx', secondName : 'Float32', aliasName : 'F32x', type : _global.Fx, isTyped : true });

//

let Extend =
{
  makeFor_functor,
  fromFor_functor,
  isFor_functor,
  longDeclare,
  LongDescriptor,
}

Object.assign( wTools, Extend );

// --
//
// --

let _ArrayNameSpaces =
[
  { ArrayType : Float32Array, ArrayName : 'Float32' },
  { ArrayType : Uint32Array, ArrayName : 'Wrd32' },
  { ArrayType : Int32Array, ArrayName : 'Int32' },
  { ArrayType : Array, ArrayName : 'Array' },
]

// if( _.Array )
// debugger;
// if( _.Array )
// return;

_.assert( !_.Array );
_.assert( !_.array );
_.assert( !_.withArray );

// debugger;

/**
 * @summary Array namespace
 * @namespace "wTools.array"
 * @memberof wTools
 */

let ArrayNameSpaces = Object.create( null );

_._arrayNameSpaceApplyTo = _arrayNameSpaceApplyTo;

for( let d = 0 ; d < _ArrayNameSpaces.length ; d++ )
_declare( _ArrayNameSpaces[ d ] );

_arrayNameSpaceApplyTo( _,'Array' );

// debugger;

_.assert( !_.Array );

_.assert( _.mapOwnKey( _,'withArray' ) );
_.assert( _.mapOwnKey( _,'array' ) );
_.assert( _.mapOwnKey( _.array,'array' ) );
_.assert( !_.mapOwnKey( _.array,'withArray' ) );
_.assert( !!_.array.withArray );

_.assert( _.objectIs( _.withArray ) );
_.assert( _.objectIs( _.array ) );
_.assert( _.routineIs( _.array.makeArrayOfLength ) );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/iArrayDescriptor.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, iArrayDescriptor_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file iArrayDescriptor_s

( function iCompose_s() { // == begin of file iCompose_s
function iCompose_s_naked() {
( function _iCompose_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.compose = _global_.wTools.compose || Object.create( null );

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// chainer
// --

function originaChainer( args, result, op, k )
{
  _.assert( result !== false );
  return args;
}

//

function originalWithDontChainer( args, result, op, k )
{
  _.assert( result !== false );
  // _.assert( result !== false && result !== undefined );
  if( result === _.dont )
  return _.dont;
  // return undefined;
  return args;
}

//

function composeAllChainer( args, result, op, k )
{
  _.assert( result !== false );
  // if( result === undefined )
  // return args;
  if( result === _.dont )
  return _.dont;
  // return undefined;
  // return _.unrollFrom( result );
  return args;
}

//

function chainingChainer( args, result, op, k )
{
  _.assert( result !== false );
  if( result === undefined )
  return args;
  if( result === _.dont )
  return _.dont;
  // return undefined;
  return _.unrollFrom( result );
  // return args;
}

// --
// supervisor
// --

function returningLastSupervisor( self, args, act, op )
{
  let result = act.apply( self, args );
  return result[ result.length-1 ];
}

//

function composeAllSupervisor( self, args, act, op )
{
  let result = act.apply( self, args );
  _.assert( !!result );
  if( !result.length )
  return result;
  if( result[ result.length-1 ] === _.dont )
  return false;
  if( !_.all( result ) )
  return false;
  return result;
}

//

function chainingSupervisor( self, args, act, op )
{
  let result = act.apply( self, args );
  if( result[ result.length-1 ] === _.dont )
  result.pop();
  return result;
}

// --
// declare
// --

let chainer =
{
  original : originaChainer,
  originalWithDont : originalWithDontChainer,
  composeAll : composeAllChainer,
  chaining : chainingChainer,
}

let supervisor =
{
  returningLast : returningLastSupervisor,
  composeAll : composeAllSupervisor,
  chaining : chainingSupervisor,
}

// --
// extend
// --

let Extend =
{

  chainer,
  supervisor

}

Object.assign( Self, Extend );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/iCompose.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, iCompose_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file iCompose_s

( function iField_s() { // == begin of file iField_s
function iField_s_naked() {
( function _Field_s_() {

'use strict';

let Self = _global_.wTools.field = _global_.wTools.field || Object.create( null );
let _global = _global_;
let _ = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
// let Object.prototype.toString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
//
// --

function bypass()
{

  let routine = function bypass( dstContainer, srcContainer, key )
  {
    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

bypass.functionFamily = 'field-filter';

//

function assigning()
{

  let routine = function assigning( dstContainer, srcContainer, key )
  {
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

assigning.functionFamily = 'field-mapper';

//

function primitive()
{

  let routine = function primitive( dstContainer, srcContainer, key )
  {
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

primitive.functionFamily = 'field-filter';

//

function hiding()
{

  let routine = function hiding( dstContainer, srcContainer, key )
  {
    Object.defineProperty( dstContainer, key,
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    });
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

hiding.functionFamily = 'field-mapper';

//

function appendingAnything()
{

  let routine = function appendingAnything( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] === undefined )
    dstContainer[ key ] = srcContainer[ key ];
    else
    dstContainer[ key ] = _.arrayAppendArrays( [], [ dstContainer[ key ], srcContainer[ key ] ] );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

appendingAnything.functionFamily = 'field-mapper';

//

function appendingArrays()
{

  let routine = function appendingArrays( dstContainer, srcContainer, key )
  {
    if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
    _.arrayAppendArray( dstContainer[ key ], srcContainer[ key ] );
    else
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

appendingArrays.functionFamily = 'field-mapper';

//

function appendingOnce()
{

  let routine = function appendingOnce( dstContainer, srcContainer, key )
  {
    if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
    _.arrayAppendArrayOnce( dstContainer[ key ], srcContainer[ key ] );
    else
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

appendingOnce.functionFamily = 'field-mapper';

//

function removing()
{

  let routine = function removing( dstContainer, srcContainer, key )
  {
    let dstElement = dstContainer[ key ];
    let srcElement = srcContainer[ key ];
    if( _.arrayIs( dstElement ) && _.arrayIs( srcElement ) )
    {
      if( dstElement === srcElement )
      dstContainer[ key ] = [];
      else
      _.arrayRemoveArrayOnce( dstElement, srcElement );
    }
    else if( dstElement === srcElement )
    {
      delete dstContainer[ key ];
    }
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

removing.functionFamily = 'field-mapper';

//

function notPrimitiveAssigning()
{

  let routine = function notPrimitiveAssigning( dstContainer, srcContainer, key )
  {
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

notPrimitiveAssigning.functionFamily = 'field-mapper';

//

function assigningRecursive()
{

  let routine = function assigningRecursive( dstContainer, srcContainer, key )
  {
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

assigningRecursive.functionFamily = 'field-mapper';

//

function drop( dropContainer )
{

  debugger;

  _.assert( _.objectIs( dropContainer ) );

  let routine = function drop( dstContainer, srcContainer, key )
  {
    if( dropContainer[ key ] !== undefined )
    return false

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

drop.functionFamily = 'field-filter';

// --
// src
// --

function srcDefined()
{

  let routine = function srcDefined( dstContainer, srcContainer, key )
  {
    if( srcContainer[ key ] === undefined )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter'; ;
  return routine;
}

srcDefined.functionFamily = 'field-filter';

//

function srcNull()
{

  let routine = function srcNull( dstContainer, srcContainer, key )
  {
    if( srcContainer[ key ] !== null )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter'; ;
  return routine;
}

srcNull.functionFamily = 'field-filter';

// --
// dst
// --

function dstNotConstant()
{

  let routine = function dstNotConstant( dstContainer, srcContainer, key )
  {
    let d = Object.getOwnPropertyDescriptor( dstContainer, key );
    if( !d )
    return true;
    if( !d.writable )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstAndSrcOwn.functionFamily = 'field-filter';

//

function dstAndSrcOwn()
{

  let routine = function dstAndSrcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstAndSrcOwn.functionFamily = 'field-filter';

//

function dstUndefinedSrcNotUndefined()
{

  let routine = function dstUndefinedSrcNotUndefined( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] !== undefined )
    return false;
    if( srcContainer[ key ] === undefined )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstUndefinedSrcNotUndefined.functionFamily = 'field-filter';

// --
// dstNotHas
// --

function dstNotHas()
{

  let routine = function dstNotHas( dstContainer, srcContainer, key )
  {

    // if( dstContainer[ key ] !== undefined )
    // return false;

    if( key in dstContainer )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHas.functionFamily = 'field-filter';

//

function dstNotHasOrHasNull()
{

  let routine = function dstNotHasOrHasNull( dstContainer, srcContainer, key )
  {

    if( key in dstContainer && dstContainer[ key ] !== null )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasOrHasNull.functionFamily = 'field-filter';

//

function dstNotHasOrHasNil()
{

  let routine = function dstNotHasOrHasNil( dstContainer, srcContainer, key )
  {

    if( key in dstContainer && dstContainer[ key ] !== _.nothing )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasOrHasNil.functionFamily = 'field-filter';

//

function dstNotHasAssigning()
{

  let routine = function dstNotHasAssigning( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasAssigning.functionFamily = 'field-mapper';

//

function dstNotHasAppending()
{

  let routine = function dstNotHasAppending( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    {
      debugger;
      if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
      _.arrayAppendArray( dstContainer, srcContainer, key );
      return;
    }
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasAppending.functionFamily = 'field-mapper';

//

function dstNotHasSrcPrimitive()
{

  let routine = function dstNotHasSrcPrimitive( dstContainer, srcContainer, key )
  {
    debugger;
    if( key in dstContainer )
    return false;

    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';

  return routine;
}

dstNotHasSrcPrimitive.functionFamily = 'field-filter';

//

function dstNotHasSrcOwn()
{

  let routine = function dstNotHasSrcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( key in dstContainer )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasSrcOwn.functionFamily = 'field-filter';

//

function dstNotHasSrcOwnAssigning()
{

  let routine = function dstNotHasSrcOwnAssigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( key in dstContainer )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasSrcOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotHasSrcOwnRoutines()
{

  let routine = function dstNotHasSrcOwnRoutines( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;
    if( key in dstContainer )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasSrcOwnRoutines.functionFamily = 'field-filter';

//

function dstNotHasAssigningRecursive()
{

  let routine = function dstNotHasAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasAssigningRecursive.functionFamily = 'field-mapper';

// --
// dstNotOwn
// --

function dstNotOwn()
{

  let routine = function dstNotOwn( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotOwn.functionFamily = 'field-filter';

//

function dstNotOwnSrcOwn()
{

  let routine = function dstNotOwnSrcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotOwnSrcOwn.functionFamily = 'field-filter';

//

function dstNotOwnSrcOwnAssigning()
{

  let routine = function dstNotOwnSrcOwnAssigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnSrcOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnOrUndefinedAssigning()
{

  let routine = function dstNotOwnOrUndefinedAssigning( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    {

      if( dstContainer[ key ] !== undefined )
      return;

    }

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnOrUndefinedAssigning.functionFamily = 'field-mapper';

// //
//
// function dstNotOwnAssigning()
// {
//
//   let routine = function dstNotOwnAssigning( dstContainer, srcContainer, key )
//   {
//
//     if( _ObjectHasOwnProperty.call( dstContainer, key ) )
//     {
//
//       if( key in dstContainer )
//       return;
//
//     }
//
//     _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
//   }
//
//   routine.functionFamily = 'field-mapper';
//   return routine;
// }

//

function dstNotOwnAssigning()
{

  let routine = function dstNotOwnAssigning( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    let srcElement = srcContainer[ key ];
    if( _.mapIs( srcElement ) || _.arrayIs( srcElement ) )
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
    else
    dstContainer[ key ] = srcContainer[ key ];

  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnAppending()
{

  let routine = function dstNotOwnAppending( dstContainer, srcContainer, key )
  {
    debugger;
    if( dstContainer[ key ] !== undefined )
    {
      debugger;
      if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
      _.arrayAppendArray( dstContainer, srcContainer, key );
    }
    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnAppending.functionFamily = 'field-mapper';

//

function dstNotOwnFromDefinition()
{

  let routine = function dstNotOwnFromDefinition( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    if( _ObjectHasOwnProperty.call( dstContainer, Symbol.for( key ) ) )
    return;

    let srcElement = srcContainer[ key ];
    if( _.definitionIs( srcElement ) )
    dstContainer[ key ] = srcElement.valueGet();
    else
    dstContainer[ key ] = srcElement;

  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

//

function dstNotOwnFromDefinitionStrictlyPrimitive()
{

  let routine = function dstNotOwnFromDefinitionStrictlyPrimitive( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    if( _ObjectHasOwnProperty.call( dstContainer, Symbol.for( key ) ) )
    return;

    let srcElement = srcContainer[ key ];
    if( _.definitionIs( srcElement ) )
    {
      dstContainer[ key ] = srcElement.valueGet();
    }
    else
    {
      _.assert( !_.consequenceIs( srcElement ) && ( _.primitiveIs( srcElement ) || _.routineIs( srcElement ) ), () => _.toStrShort( dstContainer ) + ' has non-primitive element ' + _.strQuote( key ) + ' use _.define.own instead' );
      dstContainer[ key ] = srcElement;
    }

  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

// --
// dstHas
// --

function dstHasMaybeUndefined()
{

  let routine = function dstHasMaybeUndefined( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    return true;
    return false;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasMaybeUndefined.functionFamily = 'field-filter';

//

function dstHasButUndefined()
{

  let routine = function dstHasButUndefined( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] === undefined )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasButUndefined.functionFamily = 'field-filter';

//

function dstHasSrcOwn()
{

  let routine = function dstHasSrcOwn( dstContainer, srcContainer, key )
  {
    if( !( key in dstContainer ) )
    return false;
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasSrcOwn.functionFamily = 'field-filter';

//

function dstHasSrcNotOwn()
{

  let routine = function dstHasSrcNotOwn( dstContainer, srcContainer, key )
  {
    if( !( key in dstContainer ) )
    return false;
    if( _ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasSrcNotOwn.functionFamily = 'field-filter';

// --
// srcOwn
// --

function srcOwn()
{

  let routine = function srcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

srcOwn.functionFamily = 'field-filter';

//

function srcOwnRoutines()
{

  let routine = function srcOwnRoutines( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter'; ;
  return routine;
}

srcOwnRoutines.functionFamily = 'field-filter';

//

function srcOwnAssigning()
{

  let routine = function assigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnAssigning.functionFamily = 'field-mapper';

//

function srcOwnPrimitive()
{

  let routine = function srcOwnPrimitive( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

srcOwnPrimitive.functionFamily = 'field-filter';

//

function srcOwnNotPrimitiveAssigning()
{

  let routine = function srcOwnNotPrimitiveAssigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnNotPrimitiveAssigning.functionFamily = 'field-mapper';

//

function srcOwnNotPrimitiveAssigningRecursive()
{

  let routine = function srcOwnNotPrimitiveAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnNotPrimitiveAssigningRecursive.functionFamily = 'field-mapper';

//

function srcOwnAssigningRecursive()
{

  let routine = function srcOwnAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnAssigningRecursive.functionFamily = 'field-mapper';

// --
//
// --

function and()
{

  let filters = [];
  let mappers = [];
  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let routine = arguments[ a ];
    _.assert( _.routineIs( routine ) );
    _.assert( _.strIs( routine.functionFamily ) );
    if( routine.functionFamily === 'field-filter' )
    filters.push( routine );
    else if( routine.functionFamily === 'field-mapper' )
    mappers.push( routine );
    else throw _.err( 'Expects routine.functionFamily' );
  }

  if( mappers.length > 1 )
  throw _.err( 'can combineMethodUniform only one mapper with any number of filters' );

  let routine = function and( dstContainer, srcContainer, key )
  {

    for( let f = 0 ; f < filters.length ; f++ )
    {
      let filter = filters[ f ];

      let result = filter( dstContainer, srcContainer, key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return mappers.length ? undefined : false;
    }

    for( let m = 0 ; m < mappers.length ; m++ )
    {
      let mapper = mappers[ m ];

      let result = mapper( dstContainer, srcContainer, key );
      _.assert( result === undefined );
      return;
    }

    return mappers.length ? undefined : true;
  }

  routine.functionFamily = mappers.length ? 'field-mapper' : 'field-filter';
  return routine;
}

//

function mapperFromFilter( routine )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.routineIs( routine ), 'Expects routine but got', _.strType( routine ) );
  _.assert( _.strIs( routine.functionFamily ) );

  if( routine.functionFamily === 'field-filter' )
  {
    function r( dstContainer, srcContainer, key )
    {
      let result = routine( dstContainer, srcContainer, key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return;
      dstContainer[ key ] = srcContainer[ key ];
    }
    r.functionFamily = 'field-mapper';
    return r;
  }
  else if( routine.functionFamily === 'field-mapper' )
  {
    return routine;
  }
  else _.assert( 0,'Expects routine.functionFamily' );

}

//
//
// function mapperFromFilterRecursive( routine )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.routineIs( routine ) );
//   _.assert( _.strIs( routine.functionFamily ) );
//
//   debugger;
//
//   if( routine.functionFamily === 'field-filter' )
//   {
//     function r( dstContainer, srcContainer, key )
//     {
//       debugger;
//       let result = routine( dstContainer, srcContainer, key );
//       _.assert( _.boolIs( result ) );
//       if( result === false )
//       return;
//       dstContainer[ key ] = srcContainer[ key ];
//     }
//     r.functionFamily = 'field-mapper';
//     return r;
//   }
//   else if( routine.functionFamily === 'field-mapper' )
//   {
//     return routine;
//   }
//   else throw _.err( 'Expects routine.functionFamily' );
//
// }

// --
// setup
// --

function setup()
{

  for( let f in make )
  {
    let fi = make[ f ];

    if( fi.length )
    continue;

    fi = fi();

    if( fi.functionFamily === 'field-mapper' )
    {
      Extend.mapper[ f ] = fi;
    }
    else if( fi.functionFamily === 'field-filter' )
    {
      Extend.filter[ f ] = fi;
      Extend.mapper[ f ] = mapperFromFilter( fi );
    }
    else _.assert( 0,'unexpected' );

  }

}

// --
// make
// --

let make =
{

  //

  bypass,
  assigning,
  primitive,
  hiding,
  appendingAnything,
  appendingArrays,
  appendingOnce,
  removing,
  notPrimitiveAssigning,
  assigningRecursive,
  drop,

  // src

  srcDefined,
  srcNull,

  // dst

  dstNotConstant,
  dstAndSrcOwn,
  dstUndefinedSrcNotUndefined,

  // dstNotHas

  dstNotHas,
  dstNotHasOrHasNull,
  dstNotHasOrHasNil,

  dstNotHasAssigning,
  dstNotHasAppending,
  dstNotHasSrcPrimitive,

  dstNotHasSrcOwn,
  dstNotHasSrcOwnAssigning,
  dstNotHasSrcOwnRoutines,
  dstNotHasAssigningRecursive,

  // dstNotOwn

  dstNotOwn,
  dstNotOwnSrcOwn,
  dstNotOwnSrcOwnAssigning,
  dstNotOwnOrUndefinedAssigning,
  dstNotOwnAssigning,
  dstNotOwnAppending,
  dstNotOwnFromDefinition,
  dstNotOwnFromDefinitionStrictlyPrimitive,

  // dstHas

  dstHasMaybeUndefined,
  dstHasButUndefined,
  dstHasSrcOwn,
  dstHasSrcNotOwn,

  // srcOwn

  srcOwn,
  srcOwnRoutines,
  srcOwnAssigning,
  srcOwnPrimitive,
  srcOwnNotPrimitiveAssigning,
  srcOwnNotPrimitiveAssigningRecursive,
  srcOwnAssigningRecursive,

}

// --
// extend
// --

let Extend =
{

  make,
  mapper : Object.create( null ),
  filter : Object.create( null ),
  and,
  mapperFromFilter,

}

setup();

Object.assign( Self, Extend );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/iField.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l0/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, iField_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file iField_s

( function cErr_s() { // == begin of file cErr_s
function cErr_s_naked() {
(function _cErr_s_() {

'use strict';

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

let _global = _global_;
let _ = _global.wTools;
let _err = _._err;
let Self = _;

//

// function diagnosticVariate( o )
// {
//   _.routineOptions( diagnosticVariate,o );
//
//   if( _.arrayIs( o.routine ) )
//   {
//     _.assert( _.routineIs( o.routine[ 1 ] ) );
//     if( !o.variates && o.routine[ 1 ].variates )
//     o.variates = o.routine[ 1 ].variates;
//     o.routine = _.routineJoin.apply( _,o.routine );
//   }
//
//   _.assert( _.routineIs( o.routine ) );
//   _.assert( _.objectIs( o.variates ) );
//
//   let vals = _.mapExtend( null,o.variates );
//   vals = _.proxyNoUndefined( vals );
//
//   if( o.test === null )
//   o.test = function vtest( got,o )
//   {
//     return _.entityEquivalent( got,o.expected,{ /*eps*/accuracy : o./*eps*/accuracy } );
//   }
//
//   let found = 0;
//   let nsamples = _.eachSample
//   ({
//
//     onEach : function( sample,i )
//     {
//       let got = o.routine( sample );
//       let res = o.test( got,o );
//       if( res )
//       found += 1;
//       if( res || !o.printingValidOnly )
//       {
//         logger.log( 'routine',o.routine.name,'gave',got,'expected',o.expected,'#',i );
//         if( res )
//         {
//           logger.log( 'sample :',sample );
//           logger.log( got );
//         }
//       }
//     },
//
//     sets : o.variates,
//     sample : vals,
//     result : null,
//
//   });
//
//   logger.log( 'Found',found,'/',nsamples );
//
// }
//
// diagnosticVariate.defaults =
// {
//   routine : null,
//   test : null,
//
//   expected : null,
//   variates : null,
//   accuracy : 1e-3,
//   printingValidOnly : 1,
// }

// --
// diagnostics
// --

// function _diagnosticStripPath( src )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   if( _.strIs( src ) )
//   {
//     src = src.replace( /^\s+/,'' );
//     // src = src.replace( /^at/,'' );
//     // src = src.replace( /^\s+/,'' );
//   }
//
//   return src;
// }

//

// function diagnosticScript( path )
// {
//
//   if( typeof document !== 'undefined' && document.scripts )
//   {
//     let scripts = document.scripts;
//     for( let s = 0 ; s < scripts.length ; s++ )
//     if( scripts[ s ].src === path )
//     return scripts[ s ];
//   }
//   else
//   {
//     debugger;
//   }
//
// }

//

function diagnosticLocation( o )
{

  if( _.numberIs( o ) )
  o = { level : o }
  else if( _.strIs( o ) )
  o = { stack : o, level : 0 }
  else if( _.errIs( o ) )
  o = { error : o, level : 0 }
  else if( o === undefined )
  o = { stack : _.diagnosticStack([ 1, Infinity ]) };

  /* */

  for( let e in o )
  {
    if( diagnosticLocation.defaults[ e ] === undefined )
    throw Error( 'Unknown option ' + e );
  }

  for( let e in diagnosticLocation.defaults )
  {
    if( o[ e ] === undefined )
    o[ e ] = diagnosticLocation.defaults[ e ];
  }

  if( !( arguments.length === 0 || arguments.length === 1 ) )
  throw Error( 'Expects single argument or none' );

  if( !( _.objectIs( o ) ) )
  throw Error( 'Expects options map' );

  // _.routineOptions( diagnosticLocation,o );
  // _.assert( arguments.length === 0 || arguments.length === 1 );
  // _.assert( _.objectIs( o ),'diagnosticLocation expects integer {-level-} or string ( stack ) or object ( options )' );

  /* */

  if( !o.location )
  o.location = Object.create( null );

  /* */

  if( o.error )
  {
    let location2 = o.error.location || Object.create( null );

    o.location.path = _.arrayLeftDefined([ location2.path, o.location.path, o.error.filename, o.error.fileName ]).element;
    o.location.line = _.arrayLeftDefined([ location2.line, o.location.line, o.error.line, o.error.linenumber, o.error.lineNumber, o.error.lineNo, o.error.lineno ]).element;
    o.location.col = _.arrayLeftDefined([ location2.col, o.location.col, o.error.col, o.error.colnumber, o.error.colNumber, o.error.colNo, o.error.colno ]).element;

    if( o.location.path && _.numberIs( o.location.line ) )
    return end();
  }

  /* */

  if( !o.stack )
  {
    if( o.error )
    {
      o.stack = _.diagnosticStack( o.error, undefined );
    }
    else
    {
      o.stack = _.diagnosticStack();
      o.level += 1;
    }
  }

  routineFromStack( o.stack );

  let had = !!o.location.path;
  if( !had )
  o.location.path = fromStack( o.stack );

  if( !_.strIs( o.location.path ) )
  return end();

  if( !_.numberIs( o.location.line ) )
  o.location.path = lineColFromPath( o.location.path );

  if( !_.numberIs( o.location.line ) && had )
  {
    let path = fromStack( o.stack );
    if( path )
    lineColFromPath( path );
  }

  return end();

  /* end */

  function end()
  {

    let path = o.location.path;

    /* full */

    // if( path )
    {
      o.location.full = path || '';
      if( o.location.line !== undefined )
      o.location.full += ':' + o.location.line;
    }

    /* name long */

    if( o.location.full )
    {
      o.location.fullWithRoutine = o.location.routine + ' @ ' + o.location.full;
    }

    /* name */

    if( path )
    {
      let name = path;
      let i = name.lastIndexOf( '/' );
      if( i !== -1 )
      name = name.substr( i+1 );
      o.location.name = name;
    }

    /* name long */

    if( path )
    {
      let nameLong = o.location.name;
      if( o.location.line !== undefined )
      {
        nameLong += ':' + o.location.line;
        if( o.location.col !== undefined )
        nameLong += ':' + o.location.col;
      }
      o.location.nameLong = nameLong;
    }

    return o.location;
  }

  /* routine from stack */

  function routineFromStack( stack )
  {
    let path;

    if( !stack )
    return;

    if( _.strIs( stack ) )
    stack = stack.split( '\n' );

    path = stack[ o.level ];

    if( !_.strIs( path ) )
    return '(-routine anonymous-)';

    // debugger;

    let t = /^\s*(at\s+)?([\w\.]+)\s*.+/;
    let executed = t.exec( path );
    if( executed )
    path = executed[ 2 ] || '';

    if( _.strEnds( path, '.' ) )
    path += '?';

    o.location.routine = path;
    o.location.service = 0;
    if( o.location.service === 0 )
    if( _.strBegins( path , '__' ) || path.indexOf( '.__' ) !== -1 )
    o.location.service = 2;
    if( o.location.service === 0 )
    if( _.strBegins( path , '_' ) || path.indexOf( '._' ) !== -1 )
    o.location.service = 1;

    return path;
  }

  /* path from stack */

  function fromStack( stack )
  {
    let path;

    if( !stack )
    return;

    if( _.strIs( stack ) )
    stack = stack.split( '\n' );

    path = stack[ o.level ];

    if( !_.strIs( path ) )
    return end();

    path = path.replace( /^\s+/,'' );
    path = path.replace( /^\w+@/,'' );
    path = path.replace( /^at/,'' );
    path = path.replace( /^\s+/,'' );
    path = path.replace( /\s+$/,'' );

    let regexp = /^.*\((.*)\)$/;
    var parsed = regexp.exec( path );
    if( parsed )
    path = parsed[ 1 ];

    // if( _.strEnds( path,')' ) )
    // path = _.strIsolateInsideOrAll( path,'(',')' )[ 2 ];

    return path;
  }

  /* line / col number from path */

  function lineColFromPath( path )
  {

    let lineNumber,colNumber;
    let postfix = /(.+?):(\d+)(?::(\d+))?[^:/]*$/;
    let parsed = postfix.exec( path );

    if( parsed )
    {
      path = parsed[ 1 ];
      lineNumber = parsed[ 2 ];
      colNumber = parsed[ 3 ];
    }

    // let postfix = /:(\d+)$/;
    // colNumber = postfix.exec( o.location.path );
    // if( colNumber )
    // {
    //   o.location.path = _.strRemoveEnd( o.location.path,colNumber[ 0 ] );
    //   colNumber = colNumber[ 1 ];
    //   lineNumber = postfix.exec( o.location.path );
    //   if( lineNumber )
    //   {
    //     o.location.path = _.strRemoveEnd( o.location.path,lineNumber[ 0 ] );
    //     lineNumber = lineNumber[ 1 ];
    //   }
    //   else
    //   {
    //     lineNumber = colNumber;
    //     colNumber = undefined;
    //   }
    // }

    lineNumber = parseInt( lineNumber );
    colNumber = parseInt( colNumber );

    if( isNaN( o.location.line ) && !isNaN( lineNumber ) )
    o.location.line = lineNumber;

    if( isNaN( o.location.col ) && !isNaN( colNumber ) )
    o.location.col = colNumber;

    return path;
  }

}

diagnosticLocation.defaults =
{
  level : 0,
  stack : null,
  error : null,
  location : null,
}

//

let _diagnosticCodeExecuting = 0;
function diagnosticCode( o )
{

  _.routineOptions( diagnosticCode,o );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  if( _diagnosticCodeExecuting )
  return;
  _diagnosticCodeExecuting += 1;

  try
  {

    if( !o.location )
    {
      if( o.error )
      o.location = _.diagnosticLocation({ error : o.error, level : o.level });
      else
      o.location = _.diagnosticLocation({ stack : o.stack, level : o.stack ? o.level : o.level+1 });
    }

    if( !_.numberIs( o.location.line ) )
    return end();

    /* */

    if( !o.sourceCode )
    {

      if( !o.location.path )
      return end();

      let codeProvider = _.codeProvider || _.fileProvider;

      if( !codeProvider )
      return end();

      try
      {

        // if( _global._starter_ )
        // debugger;
        // if( _global._starter_ )
        // _global._starter_.fileProvider.fileRead( _.weburi.parse( o.location.path ).localWebPath );
        // o.location.path = codeProvider.path.normalize( o.location.path );
        if( codeProvider.path.isAbsolute( codeProvider.path.normalize( o.location.path ) ) )
        o.sourceCode = codeProvider.fileRead
        ({
          filePath : o.location.path,
          sync : 1,
          throwing : 0,
        })

      }
      catch( err )
      {
        o.sourceCode = 'CANT LOAD SOURCE CODE ' + _.strQuote( o.location.path );
      }

      if( !o.sourceCode )
      return end();

    }

    /* */

    let result = _.strLinesSelect
    ({
      src : o.sourceCode,
      line : o.location.line,
      numberOfLines : o.numberOfLines,
      selectMode : o.selectMode,
      zero : 1,
      number : 1,
    });

    if( result && _.strIndentation )
    result = o.identation + _.strIndentation( result, o.identation );

    if( o.withPath )
    result = o.location.full + '\n' + result;

    return end( result );

  }
  catch( err )
  {
    console.log( err.toString() );
    return;
  }

  /* */

  function end( result )
  {
    _diagnosticCodeExecuting -= 1;
    return result;
  }

}

diagnosticCode.defaults =
{
  level : 0,
  numberOfLines : 3,
  withPath : 1,
  selectMode : 'center',
  identation : '    ',
  stack : null,
  error : null,
  location : null,
  sourceCode : null,
}

//

/**
 * Return stack trace as string.
 * @example
  let stack;
  function function1()
  {
    function2();
  }

  function function2()
  {
    function3();
  }

  function function3()
  {
    stack = wTools.diagnosticStack();
  }

  function1();
  console.log( stack );
 //"    at function3 (<anonymous>:10:17)
 // at function2 (<anonymous>:6:2)
 // at function1 (<anonymous>:2:2)
 // at <anonymous>:1:1"
 *
 * @returns {String} Return stack trace from call point.
 * @function stack
 * @memberof wTools
 */

// function diagnosticStack( stack, first, last )
function diagnosticStack( stack, range )
{

  if( arguments.length === 1 )
  {
    if( !_.errIs( stack ) )
    {
      range = arguments[ 0 ];
      stack = undefined;
    }
  }

  if( stack === undefined )
  {
    stack = new Error();
    if( range === undefined )
    range = [ 1, Infinity ];
  }

  if( range === undefined )
  range = [ 0, Infinity ];

  // if( last-first === 1 )
  // debugger;

  // if( _.numberIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined )
  // {
  //
  //   first = arguments[ 0 ] ? arguments[ 0 ] + 1 : 1;
  //   last = arguments[ 1 ] >= 0 ? arguments[ 1 ] + 1 : arguments[ 1 ];
  //
  //   return diagnosticStack( new Error(), first, last );
  // }

  if( arguments.length !== 0 && arguments.length !== 1 && arguments.length !== 2 )
  {
    debugger;
    throw Error( 'diagnosticStack : expects one or two or none arguments' );
  }

  // if( !_.numberIs( first ) && first !== undefined )
  // {
  //   debugger;
  //   throw Error( 'diagnosticStack : expects number {-first-}, got ' + _.strType( first ) );
  // }
  //
  // if( !_.numberIs( last ) && last !== undefined )
  // {
  //   debugger;
  //   throw Error( 'diagnosticStack : expects number {-last-}, got ' + _.strType( last ) );
  // }

  if( !_.rangeIs( range ) )
  {
    debugger;
    throw Error( 'diagnosticStack : expects range but, got ' + _.strType( range ) );
  }

  let first = range[ 0 ];
  let last = range[ 1 ];

  if( !_.numberIs( first ) )
  {
    debugger;
    throw Error( 'diagnosticStack : expects number range[ 0 ], but got ' + _.strType( first ) );
  }

  if( !_.numberIs( last ) )
  {
    debugger;
    throw Error( 'diagnosticStack : expects number range[ 0 ], but got ' + _.strType( last ) );
  }

  let errIs = 0;
  if( _.errIs( stack ) )
  {
    stack = stack.stack;
    errIs = 1;
  }

  if( !stack )
  return '';

  if( !_.arrayIs( stack ) && !_.strIs( stack ) )
  return;

  if( !_.arrayIs( stack ) && !_.strIs( stack ) )
  {
    debugger;
    throw Error( 'diagnosticStack expects array or string' );
  }

  // debugger;

  if( !_.arrayIs( stack ) )
  stack = stack.split( '\n' );

  /* remove redundant lines */

  if( !errIs )
  console.debug( 'REMINDER : problem here if !errIs' ); /* xxx */
  if( !errIs )
  debugger;

  if( errIs )
  {
    while( stack.length )
    {
      let splice = 0;
      splice |= ( stack[ 0 ].indexOf( '  at ' ) === -1 && stack[ 0 ].indexOf( '@' ) === -1 );
      splice |= stack[ 0 ].indexOf( '(vm.js:' ) !== -1;
      splice |= stack[ 0 ].indexOf( '(module.js:' ) !== -1;
      splice |= stack[ 0 ].indexOf( '(internal/module.js:' ) !== -1;
      if( splice )
      stack.splice( 0,1 );
      else break;
    }
  }

  // if( stack[ 0 ].indexOf( '@' ) === -1 )
  // stack[ 0 ] = _.strIsolateLeftOrNone( stack[ 0 ],'@' )[ 1 ];

  // if( !stack[ 0 ] )
  // return '... stack is empty ...';

  // debugger;
  if( stack[ 0 ] )
  if( stack[ 0 ].indexOf( 'at ' ) === -1 && stack[ 0 ].indexOf( '@' ) === -1 )
  {
    debugger;
    console.error( 'diagnosticStack : cant parse stack\n' + stack );
  }

  /* */

  first = first === undefined ? 0 : first;
  last = last === undefined ? stack.length : last;

  if( _.numberIs( first ) )
  if( first < 0 )
  first = stack.length + first;

  if( _.numberIs( last ) )
  if( last < 0 )
  last = stack.length + last + 1;

  /* */

  // if( last-first === 1 )
  // {
  //   debugger;
  //   // stack = stack[ first ];
  //   //
  //   // if( _.strIs( stack ) )
  //   // {
  //   //   stack = _._diagnosticStripPath( stack );
  //   // }
  //   //
  //   // return stack;
  // }

  if( first !== 0 || last !== stack.length )
  {
    stack = stack.slice( first || 0,last );
  }

  /* */

  stack = String( stack.join( '\n' ) );

  return stack;
}

//

function diagnosticStackCondense( stack )
{

  if( arguments.length !== 1 )
  throw Error( 'Expects single arguments' );

  if( !_.strIs( stack ) )
  throw Error( 'Expects string' );

  stack = stack.split( '\n' );

  for( let s = 1 ; s < stack.length ; s++ )
  if( /(\w)_entry(\W|$)/.test( stack[ s ] ) )
  {
    stack.splice( s+1,stack.length );
    break;
  }

  for( let s = stack.length-1 ; s >= 1 ; s-- )
  {
    if( /(\W|^)__\w+/.test( stack[ s ] ) )
    stack.splice( s,1 )
  }

  return stack.join( '\n' );
}

//

function diagnosticBeep()
{
  console.log( '\x07' );
}

//

function diagnosticApplicationEntryPointData()
{
  let result = Object.create( null );
  if( _global.process !== undefined )
  {
    if( _global.process.argv )
    result.execPath = _global.process.argv.join( ' ' );
    if( _.routineIs( _global.process.cwd ) )
    result.currentPath = _global.process.cwd();
  }
  return result;
}

//

function diagnosticApplicationEntryPointInfo()
{
  let data = _.diagnosticApplicationEntryPointData();
  let result = '';

  if( data.currentPath )
  result = join( 'Current path', data.currentPath );
  if( data.execPath )
  result = join( 'Exec path', data.execPath );

  return result;

  /* */

  function join( left, right )
  {
    if( result )
    result += '\n';
    result += left + ' : ' + right;
    return result;
  }
}

//

/*

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Uniforms',
});

_.diagnosticWatchFields
({
  target : state,
  names : 'filterColor',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Config',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'logger',
});

_.diagnosticWatchFields
({
  target : self,
  names : 'catalogPath',
});

*/

function diagnosticWatchFields( o )
{

  if( arguments[ 1 ] !== undefined )
  o = { target : arguments[ 0 ], names : arguments[ 1 ] }
  o = _.routineOptions( diagnosticWatchFields,o );

  if( o.names )
  o.names = o.names;
  // o.names = _.nameFielded( o.names );
  else
  o.names = o.target;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.target ) );
  _.assert( _.objectLike( o.names ) );

  for( let f in o.names ) ( function()
  {

    let fieldName = f;
    let fieldSymbol = Symbol.for( f );
    //o.target[ fieldSymbol ] = o.target[ f ];
    let val = o.target[ f ];

    /* */

    function read()
    {
      //let result = o.target[ fieldSymbol ];
      let result = val;
      if( o.verbosity > 1 )
      console.log( 'reading ' + fieldName + ' ' + _.toStr( result ) );
      else
      console.log( 'reading ' + fieldName );
      if( o.debugging > 1 )
      debugger;
      return result;
    }

    /* */

    function write( src )
    {
      if( o.verbosity > 1 )
      console.log( 'writing ' + fieldName + ' ' + _.toStr( o.target[ fieldName ] ) + ' -> ' + _.toStr( src ) );
      else
      console.log( 'writing ' + fieldName );
      if( o.debugging )
      debugger;
      //o.target[ fieldSymbol ] = src;
      val = src;
    }

    /* */

    if( o.debugging > 1 )
    debugger;

    if( o.verbosity > 1 )
    console.log( 'watching for',fieldName,'in',o.target );
    Object.defineProperty( o.target, fieldName,
    {
      enumerable : true,
      configurable : true,
      get : read,
      set : write,
    });

  })();

}

diagnosticWatchFields.defaults =
{
  target : null,
  names : null,
  verbosity : 2,
  debugging : 1,
}

//

/*

_.diagnosticProxyFields
({
  target : _.field,
});

_.diagnosticWatchFields
({
  target : _,
  names : 'field',
});

*/

function diagnosticProxyFields( o )
{

  if( arguments[ 1 ] !== undefined )
  o = { target : arguments[ 0 ], names : arguments[ 1 ] }
  o = _.routineOptions( diagnosticWatchFields,o );

  // if( o.names )
  // o.names = _.nameFielded( o.names );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.target ) );
  _.assert( _.objectLike( o.names ) || o.names === null );

  let handler =
  {
    set : function( obj, k, e )
    {
      if( o.names && !( k in o.names ) )
      return;
      if( o.verbosity > 1 )
      console.log( 'writing ' + k + ' ' + _.toStr( o.target[ k ] ) + ' -> ' + _.toStr( e ) );
      else
      console.log( 'writing ' + k );
      if( o.debug )
      debugger;
      obj[ k ] = e;
      return true;
    }
  }

  let result = new Proxy( o.target, handler );
  if( o.verbosity > 1 )
  console.log( 'watching for',o.target );

  if( o.debug )
  debugger;

  return result;
}

diagnosticProxyFields.defaults =
{
}

diagnosticProxyFields.defaults.__proto__ == diagnosticWatchFields.defaults

//

function diagnosticEachLongType( o )
{
  let result = Object.create( null );

  if( _.routineIs( o ) )
  o = { onEach : o }
  o = _.routineOptions( diagnosticEachLongType, o );

  if( o.onEach === null )
  o.onEach = function onEach( make, descriptor )
  {
    return make;
  }

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( _.routineIs( o.onEach ) )

  // debugger;

  for( let l in _.LongDescriptor )
  {
    let Long = _.LongDescriptor[ l ];
    result[ Long.name ] = o.onEach( Long.make, Long );
  }

  // debugger;

  return result;
}

diagnosticEachLongType.defaults =
{
  onEach : null,
}

//

function diagnosticEachElementComparator( o )
{
  let result = [];

  if( arguments[ 1 ] !== undefined )
  o = { onMake : arguments[ 0 ], onEach : arguments[ 1 ] }
  else if( _.routineIs( arguments[ 0 ] ) )
  o = { onEach : arguments[ 1 ] }

  o = _.routineOptions( diagnosticEachElementComparator, o );

  if( o.onEach === null )
  o.onEach = function onEach( make, evaluate, description )
  {
    return evaluate;
  }

  if( o.onMake === null )
  o.onMake = function onMake( src )
  {
    return src;
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( o.onEach ) );
  _.assert( _.routineIs( o.onMake ) );

  result.push( o.onEach( o.onMake, undefined, 'no evaluator' ) );
  result.push( o.onEach( make, evaluator, 'evaluator' ) );
  result.push( o.onEach( make, [ evaluator, evaluator ], 'tandem of evaluators' ) );
  result.push( o.onEach( make, equalizer, 'equalizer' ) );

  return result;

  /* */

  function evaluator( e )
  {
    _.assert( e.length === 1 );
    return e[ 0 ];
  }

  /* */

  function equalizer( e1, e2 )
  {
    _.assert( e1.length === 1 );
    _.assert( e2.length === 1 );
    return e1[ 0 ] === e2[ 0 ];
  }

  /* */

  function make( long )
  {
    _.assert( _.longIs( long ) );
    let result = [];
    for( let l = 0 ; l < long.length ; l++ )
    result[ l ] = [ long[ l ] ];
    return o.onMake( result );
  }

}

diagnosticEachElementComparator.defaults =
{
  onMake : null,
  onEach : null,
}

//

function diagnosticsStructureGenerate( o )
{
  _.assert( arguments.length === 1 )
  _.routineOptions( diagnosticsStructureGenerate, o );
  _.assert( _.numberIs( o.breadth ) );
  _.assert( _.numberIs( o.depth ) );
  _.assert( o._pre === null || _.routineIs( o._pre ) );

  /* qqq: pre */

  /**/

  let depth = 0;

  o.structure = structureMake();
  o.size = _.entitySize( o.structure );

  // console.log( 'entitySize:', _.strMetricFormatBytes( o.size ) );

  return o;

  /*  */

  function structureMake()
  {
    let currentLevel = Object.create( null );

    let string = _.strDup( 'a', o.stringSize || o.fieldSize );

    if( o.boolean || o.primitive )
    currentLevel[ 'boolean' ] = true;

    if( o.number || o.primitive )
    currentLevel[ 'number' ] = 0;

    if( o.signedNumber || o.primitive > 2 )
    {
      currentLevel[ '-0' ] = -0;
      currentLevel[ '+0' ] = +0;
    }

    if( o.string || o.primitive )
    currentLevel[ 'string' ] = string;

    if( o.null || o.primitive > 1 )
    currentLevel[ 'null' ] = null;

    if( o.infinity || o.primitive > 1 )
    {
      currentLevel[ '+infinity' ] = +Infinity;
      currentLevel[ '-infinity' ] = -Infinity;
    }

    if( o.nan || o.primitive > 1 )
    currentLevel[ 'nan' ] = NaN;

    if( o.undefined || o.primitive > 2 )
    currentLevel[ 'undefined' ] = undefined;

    if( o.date || o.primitive > 2 )
    currentLevel[ 'date' ] = new Date();

    if( o.bigInt || o.primitive > 2 )
    if( typeof BigInt !== 'undefined' )
    currentLevel[ 'bigInt' ] = BigInt( 1 );

    if( o.regexp )
    {
      currentLevel[ 'regexp1'] = /ab|cd/,
      currentLevel[ 'regexp2'] = /a[bc]d/,
      currentLevel[ 'regexp3'] = /ab{1,}bc/,
      currentLevel[ 'regexp4'] = /\.js$/,
      currentLevel[ 'regexp5'] = /.regexp/
    }

    if( o.regexpComplex || o.regexp > 1 )
    {
      currentLevel[ 'complexRegexp0' ] = /^(?:(?!ab|cd).)+$/gm,
      currentLevel[ 'complexRegexp1' ] = /\/\*[\s\S]*?\*\/|\/\/.*/g,
      currentLevel[ 'complexRegexp2' ] = /^[1-9]+[0-9]*$/gm,
      currentLevel[ 'complexRegexp3' ] = /aBc/i,
      currentLevel[ 'complexRegexp4' ] = /^\d+/gm,
      currentLevel[ 'complexRegexp5' ] = /^a.*c$/g,
      currentLevel[ 'complexRegexp6' ] = /[a-z]/m,
      currentLevel[ 'complexRegexp7' ] = /^[A-Za-z0-9]$/
    }

    let bufferSrc = _.arrayFillTimes( [], o.bufferSize || o.fieldSize, 0 );

    if( o.bufferNode || o.buffer && o.buffer !== 2 )
    if( typeof Buffer !== 'undefined' )
    currentLevel[ 'bufferNode'] = Buffer.from( bufferSrc );

    if( o.bufferRaw || o.buffer )
    currentLevel[ 'bufferRaw'] = new ArrayBuffer( bufferSrc );

    if( o.bufferBytes || o.buffer && o.buffer !== 2)
    currentLevel[ 'bufferBytes'] = new Uint8Array( bufferSrc );

    if( o.map || o.structure )
    {
      let map = currentLevel[ 'map' ] = { 0 : string, 1 : 1, 2 : true  };
      if( o.mapSize )
      currentLevel[ 'map' ] = mapForSize( map, [ 0, 3 ] );
    }

    if( o.mapComplex || o.structure > 1 )
    {
      let map = currentLevel[ 'mapComplex' ] = { 0 : '1', 1 : { b : 2 }, 2 : [ 1,2,3 ] };
      if( o.mapSize )
      currentLevel[ 'mapComplex' ] = mapForSize( map, [ 0, 3 ] );
    }

    if( o.array || o.structure )
    currentLevel[ 'array' ] = _.arrayFillTimes( [], o.arraySize || o.fieldSize, 0 )

    if( o.arrayComplex || o.structure > 1 )
    {
      let src = { a : '1', dir : { b : 2 }, c : [ 1,2,3 ] }
      currentLevel[ 'arrayComplex' ] = _.arrayFillTimes( [], o.arraySize || o.fieldSize, src )
    }

    if( o.recursion || o.structure > 2 )
    {
      currentLevel.recursion = currentLevel;
    }

    var srcMap = _.mapExtend( null, currentLevel );

    /**/

    for( var b = 0; b < o.breadth; b++ )
    {
      currentLevel[ 'breadth' + b ] = _.mapExtend( null, srcMap );
    }

    /*  */

    if( depth < o.depth - 1 )
    {
      depth += 1;
      currentLevel[ 'depth' + depth ] = structureMake();
    }

    return currentLevel;

    /*  */

    function mapForSize( src, range )
    {
      let map = {};
      for( var i = 0; i < o.mapSize; i++ )
      {
        let k = _.numberRandomInt( range );
        map[ i ] = src[ k ];
      }
      return map;
    }
  }

}

diagnosticsStructureGenerate.defaults =
{
  _pre : null,
  depth : null,
  breadth : null,

  /**/

  boolean : null,
  number : null,
  signedNumber : null,
  string : null,
  null : null,
  infinity : null,
  nan : null,
  undefined : null,
  date : null,
  bigInt : null,

  regexp : null,
  regexpComplex : null,

  bufferNode : null,
  bufferRaw : null,
  bufferBytes : null,

  array : null,
  arrayComplex : null,
  map : null,
  mapComplex : null,

  /*  */

  primitive : null,
  buffer : null,
  structure : null,

  /* */

  stringSize : null,
  bufferSize : null,
  regexpSize : null,
  arraySize : null,
  mapSize : null,

  fieldSize : 50

}

// --
// errrors
// --

let ErrorAbort = _.error_functor( 'ErrorAbort' );

// --
// declare
// --

let error =
{
  ErrorAbort,
}

let Extend =
{

  // _diagnosticStripPath,
  diagnosticLocation,
  diagnosticCode,
  diagnosticStack,
  diagnosticStackCondense,
  diagnosticBeep,

  diagnosticApplicationEntryPointData,
  diagnosticApplicationEntryPointInfo,

  diagnosticWatchFields, /* experimental */
  diagnosticProxyFields, /* experimental */
  diagnosticEachLongType,
  diagnosticEachElementComparator,

  diagnosticsStructureGenerate

}

Object.assign( Self, Extend );
Object.assign( Self.error, error );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/cErr.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, cErr_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file cErr_s

( function gBool_s() { // == begin of file gBool_s
function gBool_s_naked() {
( function _gBool_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// bool
// --

/**
 * @summary Converts argument( src ) to boolean.
 * @function boolFrom
 * @param {*} src - entity to convert
 * @memberof wTools
 */

function boolFrom( src )
{
  if( _.strIs( src ) )
  {
    src = src.toLowerCase();
    if( src == '0' ) return false;
    if( src == 'false' ) return false;
    if( src == 'null' ) return false;
    if( src == 'undefined' ) return false;
    if( src == '' ) return false;
    return true;
  }
  return Boolean( src );
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  boolFrom,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gBool.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gBool_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gBool_s

( function gEntity_s() { // == begin of file gEntity_s
function gEntity_s_naked() {
( function _gEntity_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// entity getter
// --

/**
 * Returns "length" of entity( src ). Representation of "length" depends on type of( src ):
 *  - For object returns number of it own enumerable properties;
 *  - For array or array-like object returns value of length property;
 *  - For undefined returns 0;
 *  - In other cases returns 1.
 *
 * @param {*} src - Source entity.
 * @returns {number} Returns "length" of entity.
 *
 * @example
 * //returns 3
 * _.entityLength( [ 1, 2, 3 ] );
 *
 * @example
 * //returns 1
 * _.entityLength( 'string' );
 *
 * @example
 * //returns 2
 * _.entityLength( { a : 1, b : 2 } );
 *
 * @example
 * //returns 0
 * let src = undefined;
 * _.entityLength( src );
 *
 * @function entityLength
 * @memberof wTools
*/

function entityLength( src )
{
  if( src === undefined ) return 0;
  if( _.longIs( src ) )
  return src.length;
  else if( _.objectLike( src ) )
  return _.mapOwnKeys( src ).length;
  else return 1;
}

//

/**
 * Returns "size" of entity( src ). Representation of "size" depends on type of( src ):
 *  - For string returns value of it own length property;
 *  - For array-like entity returns value of it own byteLength property for( ArrayBuffer, TypedArray, etc )
 *    or length property for other;
 *  - In other cases returns null.
 *
 * @param {*} src - Source entity.
 * @returns {number} Returns "size" of entity.
 *
 * @example
 * //returns 6
 * _.entitySize( 'string' );
 *
 * @example
 * //returns 3
 * _.entitySize( [ 1, 2, 3 ] );
 *
 * @example
 * //returns 8
 * _.entitySize( new ArrayBuffer( 8 ) );
 *
 * @example
 * //returns null
 * _.entitySize( 123 );
 *
 * @function entitySize
 * @memberof wTools
*/

function entitySize( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.strIs( src ) )
  {
    if( src.length )
    return _.bufferBytesFrom( src ).byteLength;
    return src.length;
  }

  if( _.numberIs( src ) )
  return 8;

  if( !_.definedIs( src ) )
  return 8;

  if( _.boolIs( src ) || _.dateIs( src ) )
  return 8;

  if( _.numberIs( src.byteLength ) )
  return src.byteLength;

  if( _.regexpIs( src ) )
  return entitySize( src.source ) + src.flags.length * 2;

  if( _.longIs( src ) )
  {
    let result = 0;
    for( let i = 0; i < src.length; i++ )
    {
      result += _.entitySize( src[ i ] );
      if( isNaN( result ) )
      break;
    }
    return result;
  }

  if( _.mapIs( src ) )
  {
    let result = 0;
    for( let k in src )
    {
      result += _.entitySize( k );
      result += _.entitySize( src[ k ] );
      if( isNaN( result ) )
      break;
    }
    return result;
  }

  return NaN;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  entityLength,
  entitySize,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gEntity.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gEntity_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gEntity_s

( function gLong_s() { // == begin of file gLong_s
function gLong_s_naked() {
( function _gLong_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

//

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;

// --
// buffer
// --

function buffersTypedAreEquivalent( src1, src2, accuracy )
{

  if( !_.bufferTypedIs( src1 ) )
  return false;
  if( !_.bufferTypedIs( src2 ) )
  return false;

  if( src1.length !== src2.length )
  debugger;
  if( src1.length !== src2.length )
  return false;

  debugger;
  if( accuracy === null || accuracy === undefined )
  accuracy = _.accuracy;

  for( let i = 0 ; i < src1.length ; i++ )
  if( Math.abs( src1[ i ] - src2[ i ] ) > accuracy )
  return false;

  return true;
}

//

function buffersTypedAreIdentical( src1, src2 )
{

  if( !_.bufferTypedIs( src1 ) )
  return false;
  if( !_.bufferTypedIs( src2 ) )
  return false;

  let t1 = _ObjectToString.call( src1 );
  let t2 = _ObjectToString.call( src2 );
  if( t1 !== t2 )
  return false;

  if( src1.length !== src2.length )
  debugger;
  if( src1.length !== src2.length )
  return false;

  for( let i = 0 ; i < src1.length ; i++ )
  if( !Object.is( src1[ i ], src2[ i ] ) )
  return false;

  return true;
}

//

function buffersRawAreIdentical( src1, src2 )
{

  if( !_.bufferRawIs( src1 ) )
  return false;
  if( !_.bufferRawIs( src2 ) )
  return false;

  if( src1.byteLength !== src2.byteLength )
  debugger;
  if( src1.byteLength !== src2.byteLength )
  return false;

  src1 = new Uint8Array( src1 );
  src2 = new Uint8Array( src2 );

  for( let i = 0 ; i < src1.length ; i++ )
  if( src1[ i ] !== src2[ i ] )
  return false;

  return true;
}

//

function buffersViewAreIdentical( src1, src2 )
{

  debugger;

  if( !_.bufferViewIs( src1 ) )
  return false;
  if( !_.bufferViewIs( src2 ) )
  return false;

  if( src1.byteLength !== src2.byteLength )
  debugger;
  if( src1.byteLength !== src2.byteLength )
  return false;

  for( let i = 0 ; i < src1.byteLength ; i++ )
  if( src1.getUint8( i ) !== src2.getUint8( i ) )
  return false;

  return true;
}

//

function buffersNodeAreIdentical( src1, src2 )
{

  debugger;

  if( !_.bufferNodeIs( src1 ) )
  return false;
  if( !_.bufferNodeIs( src2 ) )
  return false;

  return src1.equals( src2 );
}

//

function buffersAreEquivalent( src1, src2, accuracy )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( _.bufferTypedIs( src1 ) )
  return _.buffersTypedAreEquivalent( src1 , src2, accuracy );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
  return _.buffersNodeAreIdentica( src1, src2 );
  else return false;

}

//

function buffersAreIdentical( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let t1 = _ObjectToString.call( src1 );
  let t2 = _ObjectToString.call( src2 );
  if( t1 !== t2 )
  return false;

  if( _.bufferTypedIs( src1 ) )
  return _.buffersTypedAreIdentical( src1, src2 );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
  return _.buffersNodeAreIdentical( src1, src2 );
  else return false;

}

//

/**
 * The bufferMakeSimilar() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function bufferMakeSimilar
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */

/* qqq : implement */

function bufferMakeSimilar( ins, src )
{
  let result, length;

  throw _.err( 'not tested' );

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.bufferRawIs( src ) )
    length = src.byteLength;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.strType( ins ) );

  if( _.longIs( src ) || _.bufferAnyIs( src ) )
  {

    if( ins.constructor === Array )
    {
      result = new( _.constructorJoin( ins.constructor, src ) );
    }
    else if( _.routineIs( ins ) )
    {
      if( ins.prototype.constructor.name === 'Array' )
      result = _ArraySlice.call( src );
      else
      result = new ins( src );
    }
    else
    result = new ins.constructor( src );

  }
  else
  {
    if( _.routineIs( ins ) )
    result = new ins( length );
    else
    result = new ins.constructor( length );
  }

  return result;
}

//

/* qqq : implement */

function bufferButRange( src, range, ins )
{
  let result;
  range = _.rangeFrom( range );

  _.assert( _.bufferTypedIs( src ) );
  _.assert( ins === undefined || _.longIs( ins ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  throw _.err( 'not implemented' )

  if( range[ 1 ] - range[ 0 ] <= 0 )
  return _.bufferSlice( src );

  // if( size > src.byteLength )
  // {
  //   result = longMake( src, size );
  //   let resultTyped = new Uint8Array( result, 0, result.byteLength );
  //   let srcTyped = new Uint8Array( src, 0, src.byteLength );
  //   resultTyped.set( srcTyped );
  // }
  // else if( size < src.byteLength )
  // {
  //   result = src.slice( 0, size );
  // }

  return result;
}

//

/**
 * The bufferRelen() routine returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 *
 * It creates the variable (result) checks, if (len) is more than (src.length),
 * if true, it creates and assigns to (result) a new typed array with the new length (len) by call the function(longMake(src, len))
 * and copies each element from the {-srcMap-} into the (result) array while ensuring only valid data types, if data types are invalid they are replaced with zero.
 * Otherwise, if (len) is less than (src.length) it returns a new typed array from 0 to the (len) indexes, but not including (len).
 * Otherwise, it returns an initial typed array.
 *
 * @see {@link wTools.longMake} - See for more information.
 *
 * @param { typedArray } src - The source typed array.
 * @param { Number } len - The length of a typed array.
 *
 * @example
 * // returns [ 3, 7, 13, 0 ]
 * let ints = new Int8Array( [ 3, 7, 13 ] );
 * _.bufferRelen( ints, 4 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints2, 3 );
 *
 * @example
 * // returns [ 3, 0, 13, 0, 77, 0 ]
 * let ints3 = new Int32Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints3, 6 );
 *
 * @returns { typedArray } - Returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 * @function bufferRelen
 * @memberof wTools
 */

function bufferRelen( src, len )
{

  _.assert( _.bufferTypedIs( src ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( len ) );

  let result = src;

  if( len > src.length )
  {
    result = _.longMake( src, len );
    result.set( src );
  }
  else if( len < src.length )
  {
    result = src.subarray( 0, len );
  }

  return result;
}

//

/* qqq : implement for 2 other types of buffer and do code test coverage */

function bufferResize( srcBuffer, size )
{
  let result = srcBuffer;

  _.assert( _.bufferRawIs( srcBuffer ) || _.bufferTypedIs( srcBuffer ) );
  _.assert( srcBuffer.byteLength >= 0 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( size > srcBuffer.byteLength )
  {
    result = _.longMake( srcBuffer, size );
    let resultTyped = new Uint8Array( result, 0, result.byteLength );
    let srcTyped = new Uint8Array( srcBuffer, 0, srcBuffer.byteLength );
    resultTyped.set( srcTyped );
  }
  else if( size < srcBuffer.byteLength )
  {
    result = srcBuffer.slice( 0, size );
  }

  return result;
}

//

function bufferBytesGet( src )
{

  if( src instanceof ArrayBuffer )
  {
    return new Uint8Array( src );
  }
  else if( typeof Buffer !== 'undefined' && src instanceof Buffer )
  {
    return new Uint8Array( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.bufferTypedIs( src ) )
  {
    return new Uint8Array( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.strIs( src ) )
  {
    if( _global_.Buffer )
    return new Uint8Array( _.bufferRawFrom( Buffer.from( src, 'utf8' ) ) );
    else
    return new Uint8Array( _.encode.utf8ToBuffer( src ) );
  }
  else _.assert( 0, 'wrong argument' );

}

//

  /**
   * The bufferRetype() routine converts and returns a new instance of (bufferType) constructor.
   *
   * @param { typedArray } src - The typed array.
   * @param { typedArray } bufferType - The type of typed array.
   *
   * @example
   * // returns [ 513, 1027, 1541 ]
   * let view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
   * _.bufferRetype(view1, Int16Array);
   *
   * @example
   * // returns [ 1, 2, 3, 4, 5, 6 ]
   * let view2 = new Int16Array( [ 513, 1027, 1541 ] );
   * _.bufferRetype(view2, Int8Array);
   *
   * @returns { typedArray } Returns a new instance of (bufferType) constructor.
   * @function bufferRetype
   * @throws { Error } Will throw an Error if {-srcMap-} is not a typed array object.
   * @throws { Error } Will throw an Error if (bufferType) is not a type of the typed array.
   * @memberof wTools
   */

function bufferRetype( src, bufferType )
{

  _.assert( _.bufferTypedIs( src ) );
  _.assert( _.constructorIsBuffer( bufferType ) );

  let o = src.byteOffset;
  let l = Math.floor( src.byteLength / bufferType.BYTES_PER_ELEMENT );
  let result = new bufferType( src.buffer, o, l );

  return result;
}

//

function bufferJoin()
{

  if( arguments.length < 2 )
  return arguments[ 0 ] || null;

  let srcs = [];
  let size = 0;
  let firstSrc;
  for( let s = 0 ; s < arguments.length ; s++ )
  {
    let src = arguments[ s ];

    if( src === null )
    continue;

    if( !firstSrc )
    firstSrc = src;

    if( _.bufferRawIs( src ) )
    {
      srcs.push( new Uint8Array( src ) );
    }
    else if( src instanceof Uint8Array )
    {
      srcs.push( src );
    }
    else
    {
      srcs.push( new Uint8Array( src.buffer, src.byteOffset, src.byteLength ) );
    }

    _.assert( src.byteLength >= 0, 'Expects buffers, but got', _.strType( src ) );

    size += src.byteLength;
  }

  if( srcs.length === 0 )
  return null;

  // if( srcs.length < 2 )
  // return firstSrc || null;

  /* */

  let resultBuffer = new ArrayBuffer( size );
  let result = _.bufferRawIs( firstSrc ) ? resultBuffer : new firstSrc.constructor( resultBuffer );
  let resultBytes = result.constructor === Uint8Array ? result : new Uint8Array( resultBuffer );

  /* */

  let offset = 0;
  for( let s = 0 ; s < srcs.length ; s++ )
  {
    let src = srcs[ s ];
    if( resultBytes.set )
    resultBytes.set( src , offset );
    else
    for( let i = 0 ; i < src.length ; i++ )
    resultBytes[ offset+i ] = src[ i ];
    offset += src.byteLength;
  }

  return result;
}

//

function bufferMove( dst, src )
{

  if( arguments.length === 2 )
  {

    _.assert( _.longIs( dst ) );
    _.assert( _.longIs( src ) );

    if( dst.length !== src.length )
    throw _.err( '_.bufferMove :', '"dst" and "src" must have same length' );

    if( dst.set )
    {
      dst.set( src );
      return dst;
    }

    for( let s = 0 ; s < src.length ; s++ )
    dst[ s ] = src[ s ];

  }
  else if( arguments.length === 1 )
  {

    let options = arguments[ 0 ];
    _.assertMapHasOnly( options, bufferMove.defaults );

    let src = options.src;
    let dst = options.dst;

    if( _.bufferRawIs( dst ) )
    {
      dst = new Uint8Array( dst );
      if( _.bufferTypedIs( src ) && !( src instanceof Uint8Array ) )
      src = new Uint8Array( src.buffer, src.byteOffset, src.byteLength );
    }

    _.assert( _.longIs( dst ) );
    _.assert( _.longIs( src ) );

    options.dstOffset = options.dstOffset || 0;

    if( dst.set )
    {
      dst.set( src, options.dstOffset );
      return dst;
    }

    for( let s = 0, d = options.dstOffset ; s < src.length ; s++, d++ )
    dst[ d ] = src[ s ];

  }
  else _.assert( 0, 'unexpected' );

  return dst;
}

bufferMove.defaults =
{
  dst : null,
  src : null,
  dstOffset : null,
}

//

function bufferToStr( src )
{
  let result = '';

  if( src instanceof ArrayBuffer )
  src = new Uint8Array( src, 0, src.byteLength );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferAnyIs( src ) );

  if( _.bufferNodeIs( src ) )
  return src.toString( 'utf8' );

  try
  {
    result = String.fromCharCode.apply( null, src );
  }
  catch( e )
  {
    for( let i = 0 ; i < src.byteLength ; i++ )
    {
      result += String.fromCharCode( src[i] );
    }
  }

  return result;
}

//

function bufferToDom( xmlBuffer ) {

  let result;

  if( typeof DOMParser !== 'undefined' && DOMParser.prototype.parseFromBuffer )
  {

    let parser = new DOMParser();
    result = parser.parseFromBuffer( xmlBuffer, xmlBuffer.byteLength, 'text/xml' );
    throw _.err( 'not tested' );

  }
  else
  {

    let xmlStr = _.bufferToStr( xmlBuffer );
    result = this.strToDom( xmlStr );

  }

  return result;
}

//

function bufferLeft( src, del )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( del ) )
  del = _.bufferBytesGet( del );

  _.assert( src.indexOf );
  _.assert( del.indexOf );

  let index = src.indexOf( del[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < del.length ; i++ )
    if( src[ index+i ] !== del[ i ] )
    break;

    if( i === del.length )
    return index;

    index += 1;
    index = src.indexOf( del[ 0 ], index );

  }

  return -1;
}

//

function bufferSplit( src, del )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( del ) )
  del = _.bufferBytesGet( del );

  _.assert( src.indexOf );
  _.assert( del.indexOf );

  let result = [];
  let begin = 0;
  let index = src.indexOf( del[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < del.length ; i++ )
    if( src[ index+i ] !== del[ i ] )
    break;

    if( i === del.length )
    {
      result.push( src.slice( begin, index ) );
      index += i;
      begin = index;
    }
    else
    {
      index += 1;
    }

    index = src.indexOf( del[ 0 ], index );

  }

  if( begin === 0 )
  result.push( src );
  else
  result.push( src.slice( begin, src.length ) );

  return result;
}

//

function bufferCutOffLeft( src, del )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( del ) )
  del = _.bufferBytesGet( del );

  _.assert( src.indexOf );
  _.assert( del.indexOf );

  let result = [];
  let index = src.indexOf( del[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < del.length ; i++ )
    if( src[ index+i ] !== del[ i ] )
    break;

    if( i === del.length )
    {
      result.push( src.slice( 0, index ) );
      result.push( src.slice( index, index+i ) );
      result.push( src.slice( index+i, src.length ) );
      return result;
    }
    else
    {
      index += 1;
    }

    index = src.indexOf( del[ 0 ], index );

  }

  result.push( null );
  result.push( null );
  result.push( src );

  return result;
}

//

function bufferFromArrayOfArray( array, options )
{

  if( _.objectIs( array ) )
  {
    options = array;
    array = options.buffer;
  }

  options = options || Object.create( null );
  array = options.buffer = array || options.buffer;

  //

  if( options.BufferType === undefined ) options.BufferType = Float32Array;
  if( options.sameLength === undefined ) options.sameLength = 1;
  if( !options.sameLength ) throw _.err( '_.bufferFromArrayOfArray :', 'differemt length of arrays is not implemented' );

  if( !array.length ) return new options.BufferType();

  let atomsPerElement = _.numberIs( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.numberIs( atomsPerElement ) ) throw _.err( '_.bufferFromArrayOfArray :', 'cant find out element length' );

  let length = array.length * atomsPerElement;
  let result = new options.BufferType( length );
  let i = 0;

  for( let a = 0 ; a < array.length ; a++ )
  {

    let element = array[ a ];

    for( let e = 0 ; e < atomsPerElement ; e++ )
    {

      result[ i ] = element[ e ];
      i += 1;

    }

  }

  return result;
}

//

function bufferFrom( o )
{
  let result;

  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( o ) );
  _.assert( _.routineIs( o.bufferConstructor ), 'Expects bufferConstructor' );
  _.assertMapHasOnly( o, bufferFrom.defaults );

  /* same */

  if( o.src.constructor )
  if( o.src.constructor === o.bufferConstructor  )
  return o.src;

  /* number */

  if( _.numberIs( o.src ) )
  o.src = [ o.src ];

  if( o.bufferConstructor.name === 'ArrayBuffer' )
  return _.bufferRawFrom( o.src );

  if( o.bufferConstructor.name === 'Buffer' )
  return _.bufferNodeFrom( o.src );

  /* str / buffer.node / buffer.raw */

  if( _.strIs( o.src ) || _.bufferNodeIs( o.src ) || _.bufferRawIs( o.src ) )
  o.src = _.bufferBytesFrom( o.src );

  /* buffer.typed */

  if( _.bufferTypedIs( o.src ) )
  {
    if( o.src.constructor === o.bufferConstructor  )
    return o.src;

    result = new o.bufferConstructor( o.src );
    return result;
  }

  /* verification */

  _.assert( _.objectLike( o.src ) || _.longIs( o.src ), 'bufferFrom expects object-like or array-like as o.src' );

  /* length */

  let length = o.src.length;
  if( !_.numberIs( length ) )
  {

    let length = 0;
    while( o.src[ length ] !== undefined )
    length += 1;

  }

  /* make */

  if( _.arrayIs( o.src ) )
  {
    result = new o.bufferConstructor( o.src );
  }
  else if ( _.longIs( o.src ) )
  {
    result = new o.bufferConstructor( o.src );
    throw _.err( 'not tested' );
  }
  else
  {
    result = new o.bufferConstructor( length );
    for( let i = 0 ; i < length ; i++ )
    result[ i ] = o.src[ i ];
  }

  return result;
}

bufferFrom.defaults =
{
  src : null,
  bufferConstructor : null,
}

//

/**
 * The bufferRawFromTyped() routine returns a new ArrayBuffer from (buffer.byteOffset) to the end of an ArrayBuffer of a typed array (buffer)
 * or returns the same ArrayBuffer of the (buffer), if (buffer.byteOffset) is not provided.
 *
 * @param { typedArray } buffer - Entity to check.
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
 * let buffer1 = new ArrayBuffer( 10 );
 * let view1 = new Int8Array( buffer1 );
 * _.bufferRawFromTyped( view1 );
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0 ]
 * let buffer2 = new ArrayBuffer( 10 );
 * let view2 = new Int8Array( buffer2, 2 );
 * _.bufferRawFromTyped( view2 );
 *
 * @returns { ArrayBuffer } Returns a new or the same ArrayBuffer.
 * If (buffer) is instance of '[object ArrayBuffer]', it returns buffer.
 * @function bufferRawFromTyped
 * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 1.
 * @throws { Error } Will throw an Error if (buffer) is not a typed array.
 * @memberof wTools
 */

function bufferRawFromTyped( buffer )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferTypedIs( buffer ) || _.bufferRawIs( buffer ) );

  if( _.bufferRawIs( buffer ) )
  return buffer;

  let result = buffer.buffer;

  if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
  result = result.slice( buffer.byteOffset || 0, buffer.byteLength );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferRawFrom( buffer )
{
  let result;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( buffer instanceof ArrayBuffer )
  return buffer;

  if( _.bufferNodeIs( buffer ) || _.arrayIs( buffer ) )
  {

    // result = buffer.buffer;
    result = new Uint8Array( buffer ).buffer;

  }
  else if( _.bufferTypedIs( buffer ) || _.bufferViewIs( buffer ) )
  {

    debugger;
    // _.assert( 0, 'not implemented' );
    result = buffer.buffer;
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    result = result.slice( buffer.byteOffset || 0, buffer.byteLength );

  }
  else if( _.strIs( buffer ) )
  {

    if( _global_.Buffer )
    {
      result = _.bufferRawFrom( Buffer.from( buffer, 'utf8' ) );
    }
    else
    {
      result = _.encode.utf8ToBuffer( buffer ).buffer;
    }

  }
  else if( _global.File && buffer instanceof File )
  {
    let fileReader = new FileReaderSync();
    result = fileReader.readAsArrayBuffer( buffer );
    _.assert( 0, 'not tested' );
  }
  else _.assert( 0, () => 'Unknown type of source ' + _.strType( buffer ) );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferBytesFrom( buffer )
{
  let result;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.bufferNodeIs( buffer ) )
  {

    _.assert( _.bufferRawIs( buffer.buffer ) )
    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else if( _.bufferRawIs( buffer ) )
  {

    result = new U8x( buffer, 0, buffer.byteLength );

  }
  else if( _.bufferTypedIs( buffer ) )
  {

    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else if( _.bufferViewIs( buffer ) )
  {

    debugger;
    // _.assert( 0, 'not tested' );
    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else
  {

    return _.bufferBytesFrom( _.bufferRawFrom( buffer ) );

  }

  _.assert( _.bufferBytesIs( result ) );

  return result;
}

//

function bufferBytesFromNode( src )
{
  _.assert( _.bufferNodeIs( src ) );
  let result = new Uint8Array( buffer );
  return result;
}

//

/*
qqq : cover it
*/

function bufferNodeFrom( buffer )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferViewIs( buffer ) || _.bufferTypedIs( buffer ) || _.bufferRawIs( buffer ) || _.bufferNodeIs( buffer ) || _.strIs( buffer ) || _.arrayIs( buffer ), 'Expects typed or raw buffer, but got', _.strType( buffer ) );

  if( _.bufferNodeIs( buffer ) )
  return buffer;

  /* */

  // if( toBuffer === null )
  // try
  // {
  //   toBuffer = require( 'typedarray-to-buffer' );
  // }
  // catch( err )
  // {
  //   toBuffer = false;
  // }

  /* */

  let result;

  if( buffer.length === 0 || buffer.byteLength === 0 )
  {
    // _.assert( 0, 'not tested' );
    // result = new Buffer([]);
    result = Buffer.from([]);
  }
  else if( _.strIs( buffer ) )
  {
    debugger;
    result = _.bufferNodeFrom( _.bufferRawFrom( buffer ) );
  }
  else if( buffer.buffer )
  {
    result = Buffer.from( buffer.buffer, buffer.byteOffset, buffer.byteLength );
  }
  else
  {
    // _.assert( 0, 'not tested' );
    result = Buffer.from( buffer );
  }

  // if( !buffer.length && !buffer.byteLength )
  // {
  //   buffer = new Buffer([]);
  // }
  // else if( toBuffer )
  // try
  // {
  //   buffer = toBuffer( buffer );
  // }
  // catch( err )
  // {
  //   debugger;
  //   buffer = toBuffer( buffer );
  // }
  // else
  // {
  //   if( _.bufferTypedIs( buffer ) )
  //   buffer = Buffer.from( buffer.buffer );
  //   else
  //   buffer = Buffer.from( buffer );
  // }

  _.assert( _.bufferNodeIs( result ) );

  return result;
}

//

function buffersSerialize( o )
{
  let self = this;
  let size = 0;
  o = o || Object.create( null );

  _.assertMapHasNoUndefine( o );
  _.assertMapHasOnly( o, buffersSerialize.defaults );
  _.mapComplement( o, buffersSerialize.defaults );
  _.assert( _.objectIs( o.store ) );

  let store = o.store;
  let storeAttributes = store[ 'attributes' ] = store[ 'attributes' ] || Object.create( null );
  let attributes = o.onAttributesGet.call( o.context );
  let buffers = [];

  /* eval size */

  for( let a = 0 ; a < attributes.length ; a++ )
  {

    let name = attributes[ a ][ 0 ];
    let attribute = attributes[ a ][ 1 ];
    let buffer = o.onBufferGet.call( o.context, attribute );

    _.assert( _.bufferTypedIs( buffer ) || buffer === null, 'Expects buffer or null, got : ' + _.strType( buffer ) );

    let bufferSize = buffer ? buffer.length*buffer.BYTES_PER_ELEMENT : 0;

    if( o.dropAttribute && o.dropAttribute[ name ] )
    continue;

    let descriptor = Object.create( null );
    descriptor.attribute = attribute;
    descriptor.name = name;
    descriptor.buffer = buffer;
    descriptor.bufferSize = bufferSize;
    descriptor.sizeOfAtom = buffer ? buffer.BYTES_PER_ELEMENT : 0;
    buffers.push( descriptor );

    size += bufferSize;

  }

  /* make buffer */

  if( !store[ 'buffer' ] )
  store[ 'buffer' ] = new ArrayBuffer( size );

  let dstBuffer = _.bufferBytesGet( store[ 'buffer' ] );

  _.assert( store[ 'buffer' ].byteLength === size );
  if( store[ 'buffer' ].byteLength < size )
  throw _.err( 'buffersSerialize :', 'buffer does not have enough space' );

  /* sort by atom size */

  buffers.sort( function( a, b )
  {
    return b.sizeOfAtom - a.sizeOfAtom;
  });

  /* store into single buffer */

  let offset = 0;
  for( let b = 0 ; b < buffers.length ; b++ )
  {

    let name = buffers[ b ].name;
    let attribute = buffers[ b ].attribute;
    let buffer = buffers[ b ].buffer;
    let bytes = buffer ? _.bufferBytesGet( buffer ) : new Uint8Array();
    let bufferSize = buffers[ b ].bufferSize;

    if( o.dropAttribute && o.dropAttribute[ name ] )
    continue;

    _.bufferMove( dstBuffer.subarray( offset, offset+bufferSize ), bytes );

    let serialized = store[ 'attributes' ][ name ] =
    {
      'bufferConstructorName' : buffer ? buffer.constructor.name : 'null',
      'sizeOfAtom' : buffer ? buffer.BYTES_PER_ELEMENT : 0,
      'offsetInCommonBuffer' : offset,
      'size' : bytes.length,
    }

    if( attribute.copyCustom )
    serialized[ 'fields' ] = attribute.copyCustom
    ({

      dst : Object.create( null ),
      src : attribute,

      copyingComposes : 3,
      copyingAggregates : 3,
      copyingAssociates : 1,

      technique : 'data',

    });

    offset += bufferSize;

  }

  /* return */

  return store;
}

buffersSerialize.defaults =
{

  context : null,
  store : null,

  dropAttribute : {},

  onAttributesGet : function()
  {
    return _.mapPairs( this.attributes );
  },
  onBufferGet : function( attribute )
  {
    return attribute.buffer;
  },

}

//

function buffersDeserialize( o )
{
  o = o || Object.create( null );
  let store = o.store;
  let commonBuffer = store[ 'buffer' ];

  _.assertMapHasNoUndefine( o );
  _.assertMapHasOnly( o, buffersDeserialize.defaults );
  _.mapComplement( o, buffersDeserialize.defaults );
  _.assert( _.objectIs( o.store ) );
  _.assert( _.bufferRawIs( commonBuffer ) || _.bufferTypedIs( commonBuffer ) );

  commonBuffer = _.bufferRawFromTyped( commonBuffer );

  for( let a in store[ 'attributes' ] )
  {
    let attribute = store[ 'attributes' ][ a ];

    let bufferConstructor = attribute[ 'bufferConstructorName' ] === 'null' ? null : _global[ attribute[ 'bufferConstructorName' ] ];
    let offset = attribute[ 'offsetInCommonBuffer' ];
    let size = attribute[ 'size' ];
    let sizeOfAtom = attribute[ 'sizeOfAtom' ];
    let fields = attribute[ 'fields' ];

    _.assert( _.routineIs( bufferConstructor ) || bufferConstructor === null, 'unknown attribute\' constructor :', attribute[ 'bufferConstructorName' ] )
    _.assert( _.numberIs( offset ), 'unknown attribute\' offset in common buffer :', offset )
    _.assert( _.numberIs( size ), 'unknown attribute\' size of buffer :', size )
    _.assert( _.numberIs( sizeOfAtom ), 'unknown attribute\' sizeOfAtom of buffer :', sizeOfAtom )

    if( attribute.offset+size > commonBuffer.byteLength )
    throw _.err( 'cant deserialize attribute', '"'+a+'"', 'it is out of common buffer' );

    /* logger.log( 'bufferConstructor( ' + commonBuffer + ', ' + offset + ', ' + size / sizeOfAtom + ' )' ); */

    let buffer = bufferConstructor ? new bufferConstructor( commonBuffer, offset, size / sizeOfAtom ) : null;

    o.onAttribute.call( o.context, fields, buffer, a );

  }

}

buffersDeserialize.defaults =
{
  store : null,
  context : null,
  onAttribute : function( attributeOptions, buffer )
  {
    attributeOptions.buffer = buffer;
    new this.AttributeOfGeometry( attributeOptions ).addTo( this );
  },
}

// --
// array maker
// --

/**
 * The arrayMakeRandom() routine returns an array which contains random numbers.
 *
 * @param { Object } o - The options for getting random numbers.
 * @param { Number } o.length - The length of an array.
 * @param { Array } [ o.range = [ 0, 1 ] ] - The range of numbers.
 * @param { Boolean } [ o.int = false ] - Floating point numbers or not.
 *
 * @example
 * // returns [ 6, 2, 4, 7, 8 ]
 * let arr = _.arrayMakeRandom
 * ({
 *   length : 5,
 *   range : [ 1, 9 ],
 *   int : true,
 * });
 *
 * @returns { Array } - Returns an array of random numbers.
 * @function arrayMakeRandom
 * @memberof wTools
 */

function arrayMakeRandom( o )
{
  let result = [];

  if( _.numberIs( o ) )
  {
    o = { length : o };
  }

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( arrayMakeRandom, o );

  debugger;

  for( let i = 0 ; i < o.length ; i++ )
  {
    result[ i ] = o.range[ 0 ] + Math.random()*( o.range[ 1 ] - o.range[ 0 ] );
    if( o.int )
    result[ i ] = Math.floor( result[ i ] );
  }

  return result;
}

arrayMakeRandom.defaults =
{
  int : 0,
  range : [ 0, 1 ],
  length : 1,
}

//

/**
 * The arrayFromCoercing() routine converts an object-like {-srcMap-} into Array.
 *
 * @param { * } src - To convert into Array.
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * _.arrayFromCoercing( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 * _.arrayFromCoercing( { a : 3, b : 7, c : 13 } );
 *
 * @example
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 * _.arrayFromCoercing( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ]
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayFromCoercing( args );
 *
 * @returns { Array } Returns an Array.
 * @function arrayFromCoercing
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object-like.
 * @memberof wTools
 */

function arrayFromCoercing( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( src ) )
  return src;

  if( _.objectIs( src ) )
  return _.mapToArray( src );

  if( _.longIs( src ) )
  return _ArraySlice.call( src );

  if( _.strIs( src ) )
  return src.split(/[, ]+/).map( function( s ){ if( s.length ) return parseFloat(s); } );

  if( _.argumentsArrayIs( src ) )
  return _ArraySlice.call( src );

  _.assert( 0, 'Unknown data type : ' + _.strType( src ) );
}

//

/**
 * The arrayFromRange() routine generate array of arithmetic progression series,
 * from the range[ 0 ] to the range[ 1 ] with increment 1.
 *
 * It iterates over loop from (range[0]) to the (range[ 1 ] - range[ 0 ]),
 * and assigns to the each index of the (result) array (range[ 0 ] + 1).
 *
 * @param { longIs } range - The first (range[ 0 ]) and the last (range[ 1 ] - range[ 0 ]) elements of the progression.
 *
 * @example
 * // returns [ 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( [ 1, 5 ] );
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( 5 );
 *
 * @returns { array } Returns an array of numbers for the requested range with increment 1.
 * May be an empty array if adding the step would not converge toward the end value.
 * @function arrayFromRange
 * @throws { Error } If passed arguments is less than one or more than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the length of the (range) is not equal to the two.
 * @memberof wTools
 */

function arrayFromRange( range )
{

  if( _.numberIs( range ) )
  range = [ 0, range ];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( range.length === 2 );
  _.assert( _.longIs( range ) );

  let step = range[ 0 ] <= range[ 1 ] ? +1 : -1;

  return this.arrayFromRangeWithStep( range, step );
}

//

function arrayFromProgressionArithmetic( progression, numberOfSteps )
{
  let result;

  debugger;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( progression ) )
  _.assert( isFinite( progression[ 0 ] ) );
  _.assert( isFinite( progression[ 1 ] ) );
  _.assert( isFinite( numberOfSteps ) );
  _.assert( _.routineIs( this.ArrayType ) );

  debugger;

  if( numberOfSteps === 0 )
  return new this.ArrayType();

  if( numberOfSteps === 1 )
  return new this.ArrayType([ progression[ 0 ] ]);

  let range = [ progression[ 0 ], progression[ 0 ]+progression[ 1 ]*(numberOfSteps+1) ];
  let step = ( range[ 1 ]-range[ 0 ] ) / ( numberOfSteps-1 );

  return this.arrayFromRangeWithStep( range, step );
}

//

function arrayFromRangeWithStep( range, step )
{
  let result;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( isFinite( range[ 0 ] ) );
  _.assert( isFinite( range[ 1 ] ) );
  _.assert( step === undefined || step < 0 || step > 0 );
  _.assert( _.routineIs( this.ArrayType ) );

  if( range[ 0 ] === range[ 1 ] )
  return new this.ArrayType();

  if( range[ 0 ] < range[ 1 ] )
  {

    if( step === undefined )
    step = 1;

    _.assert( step > 0 );

    result = new this.ArrayType( Math.round( ( range[ 1 ]-range[ 0 ] ) / step ) );

    let i = 0;
    while( range[ 0 ] < range[ 1 ] )
    {
      result[ i ] = range[ 0 ];
      range[ 0 ] += step;
      i += 1;
    }

  }
  else
  {

    debugger;

    if( step === undefined )
    step = -1;

    _.assert( step < 0 );

    result = new this.ArrayType( Math.round( range[ 0 ]-range[ 1 ] / step ) );

    let i = 0;
    while( range[ 0 ] > range[ 1 ] )
    {
      result[ i ] = range[ 0 ];
      range[ 0 ] += step;
      i += 1;
    }

  }

  return result;
}

//

function arrayFromRangeWithNumberOfSteps( range , numberOfSteps )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( isFinite( range[ 0 ] ) );
  _.assert( isFinite( range[ 1 ] ) );
  _.assert( numberOfSteps >= 0 );
  _.assert( _.routineIs( this.ArrayType ) );

  if( numberOfSteps === 0 )
  return new this.ArrayType();

  if( numberOfSteps === 1 )
  return new this.ArrayType( range[ 0 ] );

  let step;

  if( range[ 0 ] < range[ 1 ] )
  step = ( range[ 1 ]-range[ 0 ] ) / (numberOfSteps-1);
  else
  step = ( range[ 0 ]-range[ 1 ] ) / (numberOfSteps-1);

  return this.arrayFromRangeWithStep( range , step );
}

// --
// array converter
// --

/**
 * The arrayToMap() converts an (array) into Object.
 *
 * @param { longIs } array - To convert into Object.
 *
 * @example
 * // returns {  }
 * _.arrayToMap( [  ] );
 *
 * @example
 * // returns { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} }
 * _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } }
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayToMap( args );
 *
 * @returns { Object } Returns an Object.
 * @function arrayToMap
 * @throws { Error } Will throw an Error if (array) is not an array-like.
 * @memberof wTools
 */

function arrayToMap( array )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( array ) );

  for( let a = 0 ; a < array.length ; a++ )
  result[ a ] = array[ a ];
  return result;
}

//

/**
 * The arrayToStr() routine joins an array {-srcMap-} and returns one string containing each array element separated by space,
 * only types of integer or floating point.
 *
 * @param { longIs } src - The source array.
 * @param { objectLike } [ options = {  } ] options - The options.
 * @param { Number } [ options.precision = 5 ] - The precision of numbers.
 * @param { String } [ options.type = 'mixed' ] - The type of elements.
 *
 * @example
 * // returns "1 2 3 "
 * _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
 *
 * @example
 * // returns "3.500 13.77 7.330"
 * _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
 *
 * @returns { String } Returns one string containing each array element separated by space,
 * only types of integer or floating point.
 * If (src.length) is empty, it returns the empty string.
 * @function arrayToStr
 * @throws { Error } Will throw an Error If (options.type) is not the number or float.
 * @memberof wTools
 */

function arrayToStr( src, options )
{

  let result = '';
  options = options || Object.create( null );

  if( options.precission === undefined ) options.precission = 5;
  if( options.type === undefined ) options.type = 'mixed';

  if( !src.length ) return result;

  if( options.type === 'float' )
  {
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += src[ s ].toPrecision( options.precission ) + ' ';
    }
    result += src[ s ].toPrecision( options.precission );
  }
  else if( options.type === 'int' )
  {
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }
  else
  {
    throw _.err( 'not tested' );
    for( let s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }

  return result;
}

// --
// array transformer
// --

/**
 * The arraySub() routine returns a shallow copy of a portion of an array
 * or a new TypedArray that contains
 * the elements from (begin) index to the (end) index,
 * but not including (end).
 *
 * @param { Array } src - Source array.
 * @param { Number } begin - Index at which to begin extraction.
 * @param { Number } end - Index at which to end extraction.
 *
 * @example
 * // returns [ 3, 4 ]
 * let arr = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
 *
 * @example
 * // returns [ 2, 3 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Array } - Returns a shallow copy of a portion of an array into a new Array.
 * @function arraySub
 * @throws { Error } If the passed arguments is more than three.
 * @throws { Error } If the first argument is not an array.
 * @memberof wTools
 */

/* xxx : not array */
function arraySub( src, begin, end )
{

  _.assert( arguments.length <= 3 );
  _.assert( _.longIs( src ), 'unknown type of (-src-) argument' );
  _.assert( _.routineIs( src.slice ) || _.routineIs( src.subarray ) );

  if( _.routineIs( src.subarray ) )
  return src.subarray( begin, end );

  return src.slice( begin, end );
}

//

function arrayButRange( src, range, ins )
{
  _.assert( _.arrayLikeResizable( src ) );
  _.assert( ins === undefined || _.longIs( ins ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  let args = [ range[ 0 ], range[ 1 ]-range[ 0 ] ];

  if( ins )
  _.arrayAppendArray( args, ins );

  let result = src.slice();
  result.splice.apply( result, args );
  return result;
}

//

/* qqq : requires good test coverage */

function arraySlice( srcArray, f, l )
{

  _.assert( _.arrayLikeResizable( srcArray ) );
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  return srcArray.slice( f, l );
}

//

/**
 * Changes length of provided array( array ) by copying it elements to newly created array using begin( f ),
 * end( l ) positions of the original array and value to fill free space after copy( val ). Length of new array is equal to ( l ) - ( f ).
 * If ( l ) < ( f ) - value of index ( f ) will be assigned to ( l ).
 * If ( l ) === ( f ) - returns empty array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ).
 * If ( l ) < 0 and ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 * If ( f ) < 0 - prepends some number of elements with value of argument( let ) to the result array.
 * @param { Array/Buffer } array - source array or buffer;
 * @param { Number } [ f = 0 ] - index of a first element to copy into new array;
 * @param { Number } [ l = array.length ] - index of a last element to copy into new array;
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * //Just partial copy of origin array
 * let arr = [ 1, 2, 3, 4 ]
 * let result = _.arrayGrow( arr, 0, 2 );
 * console.log( result );
 * //[ 1, 2 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayGrow( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayGrow( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns resized copy of a part of an original array.
 * @function arrayGrow
 * @throws { Error } Will throw an Error if( array ) is not a Array or Buffer.
 * @throws { Error } Will throw an Error if( f ) or ( l ) is not a Number.
 * @throws { Error } Will throw an Error if not enough arguments provided.
 * @memberof wTools
 */

function arrayGrow( array, f, l, val )
{

  let result;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.longIs( array ) );
  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( l < f )
  l = f;

  if( _.bufferTypedIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  /* */

  let lsrc = Math.min( array.length, l );
  for( let r = Math.max( f, 0 ) ; r < lsrc ; r++ )
  result[ r-f ] = array[ r ];

  /* */

  if( val !== undefined )
  {
    for( let r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    for( let r = lsrc - f; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  return result;
}

//

/**
 * Routine performs two operations: slice and grow.
 * "Slice" means returning a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 * "Grow" means returning a bigger copy of original array( array ) with free space supplemented by elements with value of ( val )
 * argument.
 *
 * Returns result of operation as new array with same type as original array, original array is not modified.
 *
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( l ) === ( f ) - returns empty array.
 *
 * To run "Slice", first ( f ) and last ( l ) indexes must be in range [ 0, array.length ], otherwise routine will run "Grow" operation.
 *
 * Rules for "Slice":
 * If ( f ) >= 0  and ( l ) <= ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ) but not including ( l ).
 *
 * Rules for "Grow":
 *
 * If ( f ) < 0 - prepends some number of elements with value of argument( val ) to the result array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < 0, ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 *
 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayResize( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayResize( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array supplemented with value of( val ) if needed.
 * @function arrayResize
 * @throws { Error } Will throw an Error if ( array ) is not an Array-like or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/

function arrayResize( array, f, l, val )
{
  _.assert( _.longIs( array ) );

  let result;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( l < f )
  l = f;
  let lsrc = Math.min( array.length, l );

  if( _.bufferTypedIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  for( let r = Math.max( f, 0 ) ; r < lsrc ; r++ )
  result[ r-f ] = array[ r ];

  if( val !== undefined )
  if( f < 0 || l > array.length )
  {
    for( let r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    let r = Math.max( lsrc-f, 0 );
    for( ; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  return result;
}

//

/* srcBuffer = _.arrayMultislice( [ originalBuffer, f ], [ originalBuffer, 0, srcAttribute.atomsPerElement ] ); */

function arrayMultislice()
{
  let length = 0;

  if( arguments.length === 0 )
  return [];

  for( let a = 0 ; a < arguments.length ; a++ )
  {

    let src = arguments[ a ];
    let f = src[ 1 ];
    let l = src[ 2 ];

    _.assert( _.longIs( src ) && _.longIs( src[ 0 ] ), 'Expects array of array' );
    f = f !== undefined ? f : 0;
    l = l !== undefined ? l : src[ 0 ].length;
    if( l < f )
    l = f;

    _.assert( _.numberIs( f ) );
    _.assert( _.numberIs( l ) );

    src[ 1 ] = f;
    src[ 2 ] = l;

    length += l-f;

  }

  let result = new arguments[ 0 ][ 0 ].constructor( length );
  let r = 0;

  for( let a = 0 ; a < arguments.length ; a++ )
  {

    let src = arguments[ a ];
    let f = src[ 1 ];
    let l = src[ 2 ];

    for( let i = f ; i < l ; i++, r++ )
    result[ r ] = src[ 0 ][ i ];

  }

  return result;
}

//

/**
 * The arrayDuplicate() routine returns an array with duplicate values of a certain number of times.
 *
 * @param { objectLike } [ o = {  } ] o - The set of arguments.
 * @param { longIs } o.src - The given initial array.
 * @param { longIs } o.result - To collect all data.
 * @param { Number } [ o.numberOfAtomsPerElement = 1 ] o.numberOfAtomsPerElement - The certain number of times
 * to append the next value from (srcArray or o.src) to the (o.result).
 * If (o.numberOfAtomsPerElement) is greater that length of a (srcArray or o.src) it appends the 'undefined'.
 * @param { Number } [ o.numberOfDuplicatesPerElement = 2 ] o.numberOfDuplicatesPerElement = 2 - The number of duplicates per element.
 *
 * @example
 * // returns [ 'a', 'a', 'b', 'b', 'c', 'c' ]
 * _.arrayDuplicate( [ 'a', 'b', 'c' ] );
 *
 * @example
 * // returns [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 2,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, {} );
 *
 * @example
 * // returns [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 3,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, { a : 7, b : 13 } );
 *
 * @returns { Array } Returns an array with duplicate values of a certain number of times.
 * @function arrayDuplicate
 * @throws { Error } Will throw an Error if ( o ) is not an objectLike.
 * @memberof wTools
 */

function arrayDuplicate( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  {
    o = { src : arguments[ 0 ], numberOfDuplicatesPerElement : arguments[ 1 ] };
  }
  else
  {
    if( !_.objectIs( o ) )
    o = { src : o };
  }

  _.assert( _.numberIs( o.numberOfDuplicatesPerElement ) || o.numberOfDuplicatesPerElement === undefined );
  _.routineOptions( arrayDuplicate, o );
  _.assert( _.longIs( o.src ), 'arrayDuplicate expects o.src as longIs entity' );
  _.assert( _.numberIsInt( o.src.length / o.numberOfAtomsPerElement ) );

  if( o.numberOfDuplicatesPerElement === 1 )
  {
    if( o.result )
    {
      _.assert( _.longIs( o.result ) || _.bufferTypedIs( o.result ), 'Expects o.result as longIs or TypedArray if numberOfDuplicatesPerElement equals 1' );

      if( _.bufferTypedIs( o.result ) )
      o.result = _.longShallowClone( o.result, o.src );
      else if( _.longIs( o.result ) )
      o.result.push.apply( o.result, o.src );
    }
    else
    {
      o.result = o.src;
    }
    return o.result;
  }

  let length = o.src.length * o.numberOfDuplicatesPerElement;
  let numberOfElements = o.src.length / o.numberOfAtomsPerElement;

  if( o.result )
  _.assert( o.result.length >= length );

  o.result = o.result || _.longMake( o.src, length );

  let rlength = o.result.length;

  for( let c = 0, cl = numberOfElements ; c < cl ; c++ )
  {

    for( let d = 0, dl = o.numberOfDuplicatesPerElement ; d < dl ; d++ )
    {

      for( let e = 0, el = o.numberOfAtomsPerElement ; e < el ; e++ )
      {
        let indexDst = c*o.numberOfAtomsPerElement*o.numberOfDuplicatesPerElement + d*o.numberOfAtomsPerElement + e;
        let indexSrc = c*o.numberOfAtomsPerElement+e;
        o.result[ indexDst ] = o.src[ indexSrc ];
      }

    }

  }

  _.assert( o.result.length === rlength );

  return o.result;
}

arrayDuplicate.defaults =
{
  src : null,
  result : null,
  numberOfAtomsPerElement : 1,
  numberOfDuplicatesPerElement : 2,
}

//

/**
 * The arrayMask() routine returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 *
 * The arrayMask() routine checks, how much an array (mask) contain the truth value(s),
 * and from that amount of truth values it builds a new array, that contains the certain value(s) of an array (srcArray),
 * by corresponding index(es) (the truth value(s)) of the array (mask).
 * If amount is equal 0, it returns an empty array.
 *
 * @param { longIs } srcArray - The source array.
 * @param { longIs } mask - The target array.
 *
 * @example
 * // returns [  ]
 * _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
 *
 * @example
 * // returns [ "c", 4, 5 ]
 * _arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
 *
 * @example
 * // returns [ 'a', 'b', 5, 'd' ]
 * _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
 *
 * @returns { longIs } Returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 * If (mask) contains all falsy values, it returns an empty array.
 * Otherwise, it returns a new array with certain value(s) of an array (srcArray).
 * @function arrayMask
 * @throws { Error } Will throw an Error if (arguments.length) is less or more that two.
 * @throws { Error } Will throw an Error if (srcArray) is not an array-like.
 * @throws { Error } Will throw an Error if (mask) is not an array-like.
 * @throws { Error } Will throw an Error if length of both (srcArray and mask) is not equal.
 * @memberof wTools
 */

function arrayMask( srcArray, mask )
{

  let atomsPerElement = mask.length;
  let length = srcArray.length / atomsPerElement;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( srcArray ), 'arrayMask :', 'Expects array-like as srcArray' );
  _.assert( _.longIs( mask ), 'arrayMask :', 'Expects array-like as mask' );
  _.assert
  (
    _.numberIsInt( length ),
    'arrayMask :', 'Expects mask that has component for each atom of srcArray',
    _.toStr
    ({
      'atomsPerElement' : atomsPerElement,
      'srcArray.length' : srcArray.length,
    })
  );

  let preserve = 0;
  for( let m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  preserve += 1;

  let dstArray = new srcArray.constructor( length*preserve );

  if( !preserve )
  return dstArray;

  let c = 0;
  for( let i = 0 ; i < length ; i++ )
  for( let m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  {
    dstArray[ c ] = srcArray[ i*atomsPerElement + m ];
    c += 1;
  }

  return dstArray;
}

//

function arrayUnmask( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o =
  {
    src : arguments[ 0 ],
    mask : arguments[ 1 ],
  }

  _.assertMapHasOnly( o, arrayUnmask.defaults );
  _.assert( _.longIs( o.src ), 'arrayUnmask : expects o.src as ArrayLike' );

  let atomsPerElement = o.mask.length;

  let atomsPerElementPreserved = 0;
  for( let m = 0 ; m < o.mask.length ; m++ )
  if( o.mask[ m ] )
  atomsPerElementPreserved += 1;

  let length = o.src.length / atomsPerElementPreserved;
  if( Math.floor( length ) !== length )
  throw _.err( 'arrayMask :', 'Expects mask that has component for each atom of o.src', _.toStr({ 'atomsPerElementPreserved' : atomsPerElementPreserved, 'o.src.length' : o.src.length  }) );

  let dstArray = new o.src.constructor( atomsPerElement*length );

  let e = [];
  for( let i = 0 ; i < length ; i++ )
  {

    for( let m = 0, p = 0 ; m < o.mask.length ; m++ )
    if( o.mask[ m ] )
    {
      e[ m ] = o.src[ i*atomsPerElementPreserved + p ];
      p += 1;
    }
    else
    {
      e[ m ] = 0;
    }

    if( o.onEach )
    o.onEach( e, i );

    for( let m = 0 ; m < o.mask.length ; m++ )
    dstArray[ i*atomsPerElement + m ] = e[ m ];

  }

  return dstArray;
}

arrayUnmask.defaults =
{
  src : null,
  mask : null,
  onEach : null,
}

//

function longUniqueAre( o )
{

  if( _.longIs( o ) )
  o = { src : o };

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( o.src ) );
  _.assertMapHasOnly( o, longUniqueAre.defaults );

  /* */

  // if( o.onEvaluate )
  // {
  //   o.src = _.entityMap( o.src, ( e ) => o.onEvaluate( e ) );
  // }

  /* */

  let number = o.src.length;
  let isUnique = [];
  let index;

  for( let i = 0 ; i < o.src.length ; i++ )
  isUnique[ i ] = 1;

  for( let i = 0 ; i < o.src.length ; i++ )
  {
    index = i;

    if( !isUnique[ i ] )
    continue;

    let currentUnique = 1;
    index = _.arrayLeftIndex( o.src, o.src[ i ], index+1, o.onEvaluate );
    if( index >= 0 )
    do
    {
      isUnique[ index ] = 0;
      number -= 1;
      currentUnique = 0;
      index = _.arrayLeftIndex( o.src, o.src[ i ], index+1, o.onEvaluate );
    }
    while( index >= 0 );

    // if( currentUnique && o.src2 )
    // do
    // {
    //   index = o.src2.indexOf( o.src2[ i ], index+1 );
    //   if( index !== -1 )
    //   currentUnique = 0;
    // }
    // while( index !== -1 );

    if( !o.includeFirst )
    if( !currentUnique )
    {
      isUnique[ i ] = 0;
      number -= 1;
    }

  }

  return { number, is : isUnique };
}

longUniqueAre.defaults =
{
  src : null,
  // src2 : null,
  onEvaluate : null,
  includeFirst : 0,
}

//

function longUnduplicate( dst, src, onEvaluate )
{

  if( _.routineIs( arguments[ 1 ] ) && arguments[ 2 ] === undefined )
  {
    onEvaluate = arguments[ 1 ];
    src = undefined;
  }

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( dst === null || _.arrayIs( dst ) );
  _.assert( src === undefined || _.longIs( src ) );
  _.assert( onEvaluate === undefined || _.routineIs( onEvaluate ) );

  if( src && dst )
  {
    dst = _.arrayAppendArraysOnce( dst, src );
    src = undefined;
  }

  if( src )
  {
    _.assert( dst === null );
    let unique = _.longUniqueAre
    ({
      src,
      onEvaluate : onEvaluate,
      includeFirst : 1,
    });

    let result = _.longMake( src, unique.number );

    let c = 0;
    for( let i = 0 ; i < src.length ; i++ )
    if( unique.is[ i ] )
    {
      result[ c ] = src[ i ];
      c += 1;
    }

    return result;
  }
  else if( dst )
  {
    let unique = _.longUniqueAre
    ({
      src : dst,
      onEvaluate : onEvaluate,
      includeFirst : 1,
    });

    for( let i = dst.length-1 ; i >= 0 ; i-- )
    if( !unique.is[ i ] )
    {
      dst.splice( i, 1 );
    }

    return dst;
  }
  else _.assert( 0 );

}

//
// function longUnduplicate( dst, src, onEvaluate )
// {
//
//   _.assert( arguments.length === 2 || arguments.length === 3 );
//   _.assert( dst === null || _.arrayIs( dst ) );
//   _.assert( src === null || _.longIs( src ) );
//
//   let dstUnique;
//
//   if( src && dst )
//   {
//     dst = _.arrayAppendArraysOnce( dst, src );
//   }
//
//   x
//
//   let srcUnique = _.longUniqueAre
//   ({
//     src,
//     onEvaluate,
//     includeFirst : 1,
//   });
//
//   let result = _.longMake( src, dstUnique.number + srcUnique.number );
//
//   let c = 0;
//   for( let i = 0 ; i < src.length ; i++ )
//   if( srcUnique.is[ i ] )
//   {
//     result[ c ] = src[ i ];
//     c += 1;
//   }
//
//   return result;
// }

/*

*/


//

/**
 * The arraySelect() routine selects elements from (srcArray) by indexes of (indicesArray).
 *
 * @param { longIs } srcArray - Values for the new array.
 * @param { ( longIs | object ) } [ indicesArray = indicesArray.indices ] - Indexes of elements from the (srcArray) or options object.
 *
 * @example
 * // returns [ 3, 4, 5 ]
 * let arr = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
 *
 * @example
 * // returns [ undefined, undefined ]
 * let arr = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
 *
 * @returns { longIs } - Returns a new array with the length equal (indicesArray.length) and elements from (srcArray).
   If there is no element with necessary index than the value will be undefined.
 * @function arraySelect
 * @throws { Error } If passed arguments is not array like object.
 * @throws { Error } If the atomsPerElement property is not equal to 1.
 * @memberof wTools
 */

function arraySelect( srcArray, indicesArray )
{
  let atomsPerElement = 1;

  if( _.objectIs( indicesArray ) )
  {
    atomsPerElement = indicesArray.atomsPerElement || 1;
    indicesArray = indicesArray.indices;
  }

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.bufferTypedIs( srcArray ) || _.arrayIs( srcArray ) );
  _.assert( _.bufferTypedIs( indicesArray ) || _.arrayIs( indicesArray ) );

  let result = new srcArray.constructor( indicesArray.length );

  if( atomsPerElement === 1 )
  for( let i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    result[ i ] = srcArray[ indicesArray[ i ] ];
  }
  else
  for( let i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    // throw _.err( 'not tested' );
    for( let a = 0 ; a < atomsPerElement ; a += 1 )
    result[ i*atomsPerElement+a ] = srcArray[ indicesArray[ i ]*atomsPerElement+a ];
  }

  return result;
}

// --
// array mutator
// --

function arraySet( dst, index, value )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( dst.length > index );
  dst[ index ] = value;
  return dst;
}

//

/**
 * The arraySwap() routine reverses the elements by indices (index1) and (index2) in the (dst) array.
 *
 * @param { Array } dst - The initial array.
 * @param { Number } index1 - The first index.
 * @param { Number } index2 - The second index.
 *
 * @example
 * // returns [ 5, 2, 3, 4, 1 ]
 * let arr = _.arraySwap( [ 1, 2, 3, 4, 5 ], 0, 4 );
 *
 * @returns { Array } - Returns the (dst) array that has been modified in place by indexes (index1) and (index2).
 * @function arraySwap
 * @throws { Error } If the first argument in not an array.
 * @throws { Error } If the second argument is less than 0 and more than a length initial array.
 * @throws { Error } If the third argument is less than 0 and more than a length initial array.
 * @memberof wTools
 */

function arraySwap( dst, index1, index2 )
{

  if( arguments.length === 1 )
  {
    index1 = 0;
    index2 = 1;
  }

  _.assert( arguments.length === 1 || arguments.length === 3 );
  _.assert( _.longIs( dst ), 'arraySwap :', 'argument must be array' );
  _.assert( 0 <= index1 && index1 < dst.length, 'arraySwap :', 'index1 is out of bound' );
  _.assert( 0 <= index2 && index2 < dst.length, 'arraySwap :', 'index2 is out of bound' );

  let e = dst[ index1 ];
  dst[ index1 ] = dst[ index2 ];
  dst[ index2 ] = e;

  return dst;
}

//

/**
 * Removes range( range ) of elements from provided array( dstArray ) and adds elements from array( srcArray )
 * at the start position of provided range( range ) if( srcArray ) was provided.
 * On success returns array with deleted element(s), otherwise returns empty array.
 * For TypedArray's and buffers returns modified copy of ( dstArray ) or original array if nothing changed.
 *
 * @param { Array|TypedArray|Buffer } dstArray - The target array, TypedArray( Int8Array, Int16Array, Uint8Array ... etc ) or Buffer( ArrayBuffer, Buffer ).
 * @param { Array|Number } range - The range of elements or index of single element to remove from ( dstArray ).
 * @param { Array } srcArray - The array of elements to add to( dstArray ) at the start position of provided range( range ).
 * If one of ( range ) indexies is not specified it will be setted to zero.
 * If ( range ) start index is greater than the length of the array ( dstArray ), actual starting index will be set to the length of the array ( dstArray ).
 * If ( range ) start index is negative, will be setted to zero.
 * If ( range ) start index is greater than end index, the last will be setted to value of start index.
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], 2 );
 * // returns [ 3 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 1, 2 ] );
 * // returns [ 2 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 0, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ -1, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayCutin( dst, [ 0, 3 ], [ 0, 0, 0 ] );
 * console.log( dst );
 * // returns [ 0, 0, 0, 4 ]
 *
 * @example
 * let dst = new Int32Array( 4 );
 * dst.set( [ 1, 2, 3, 4 ] )
 * _.arrayCutin( dst, 0 );
 * // returns [ 2, 3, 4 ]
 *
 * @returns { Array|TypedArray|Buffer } For array returns array with deleted element(s), otherwise returns empty array.
 * For other types returns modified copy or origin( dstArray ).
 * @function arrayCutin
 * @throws { Error } If ( arguments.length ) is not equal to two or three.
 * @throws { Error } If ( dstArray ) is not an Array.
 * @throws { Error } If ( srcArray ) is not an Array.
 * @throws { Error } If ( range ) is not an Array.
 * @memberof wTools
 */

function arrayCutin( dstArray, range, srcArray )
{

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.arrayIs( range ) );
  _.assert( srcArray === undefined || _.arrayIs( srcArray ) );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
  let result;

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  if( _.bufferAnyIs( dstArray ) )
  {
    if( first === last )
    return dstArray;

    let newLength = length - last + first;
    let srcArrayLength = 0;

    if( srcArray )
    {
      srcArrayLength = _.definedIs( srcArray.length ) ? srcArray.length : srcArray.byteLength;
      newLength += srcArrayLength;
    }

    if( _.bufferRawIs( dstArray ) )
    {
      result = new ArrayBuffer( newLength );
    }
    else if( _.bufferNodeIs( dstArray ) )
    {
      result = Buffer.alloc( newLength );
    }
    else
    {
      result = _.longMake( dstArray, newLength );
    }

    if( first > 0 )
    for( let i = 0; i < first; ++i )
    result[ i ] = dstArray[ i ];

    if( srcArray )
    for( let i = first, j = 0; j < srcArrayLength; )
    result[ i++ ] = srcArray[ j++ ];

    for( let j = last, i = first + srcArrayLength; j < length; )
    result[ i++ ] = dstArray[ j++ ];

    return result;
  }
  else
  {

    let args = srcArray ? srcArray.slice() : [];
    args.unshift( last-first );
    args.unshift( first );

    result = dstArray.splice.apply( dstArray, args );
  }

  return result;
}

//

/**
 * The arrayPut() routine puts all values of (arguments[]) after the second argument to the (dstArray)
 * in the position (dstOffset) and changes values of the following index.
 *
 * @param { longIs } dstArray - The source array.
 * @param { Number } [ dstOffset = 0 ] dstOffset - The index of element where need to put the new values.
 * @param {*} arguments[] - One or more argument(s).
 * If the (argument) is an array it iterates over array and adds each element to the next (dstOffset++) index of the (dstArray).
 * Otherwise, it adds each (argument) to the next (dstOffset++) index of the (dstArray).
 *
 * @example
 * // returns [ 1, 2, 'str', true, 7, 8, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
 *
 * @example
 * // returns [ 'str', true, 7, 8, 5, 6, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
 *
 * @returns { longIs } - Returns an array containing the changed values.
 * @function arrayPut
 * @throws { Error } Will throw an Error if (arguments.length) is less than one.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstOffset) is not a Number.
 * @memberof wTools
 */

function arrayPut( dstArray, dstOffset )
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.longIs( dstArray ) );
  _.assert( _.numberIs( dstOffset ) );

  dstOffset = dstOffset || 0;

  for( let a = 2 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];
    let aIs = _.arrayIs( argument ) || _.bufferTypedIs( argument );

    if( aIs && _.bufferTypedIs( dstArray ) )
    {
      dstArray.set( argument, dstOffset );
      dstOffset += argument.length;
    }
    else if( aIs )
    for( let i = 0 ; i < argument.length ; i++ )
    {
      dstArray[ dstOffset ] = argument[ i ];
      dstOffset += 1;
    }
    else
    {
      dstArray[ dstOffset ] = argument;
      dstOffset += 1;
    }

  }

  return dstArray;
}

//

/**
 * The arrayFill() routine fills all the elements of the given or a new array from the 0 index to an (options.times) index
 * with a static value.
 *
 * @param { ( Object | Number | Array ) } o - The options to fill the array.
 * @param { Number } [ o.times = result.length ] o.times - The count of repeats.
   If in the function passed an Array, the times will be equal the length of the array. If Number than this value.
 * @param { Number } [ o.value = 0 ] - The value for the filling.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3 ]
 * let arr = _.arrayFill( { times : 5, value : 3 } );
 *
 * @example
 * // returns [ 0, 0, 0, 0 ]
 * let arr = _.arrayFill( 4 );
 *
 * @example
 * // returns [ 0, 0, 0 ]
 * let arr = _.arrayFill( [ 1, 2, 3 ] );
 *
 * @returns { Array } - Returns an array filled with a static value.
 * @function arrayFill
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If passed argument is not an object.
 * @throws { Error } If the last element of the (o.result) is not equal to the (o.value).
 * @memberof wTools
 */

function arrayFillTimes( result, times, value )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.longIs( result ) );

  if( value === undefined )
  value = 0;

  if( result.length < times )
  result = _.arrayGrow( result , 0 , times );

  if( _.routineIs( result.fill ) )
  {
    result.fill( value, 0, times );
  }
  else
  {
    debugger;
    if( times < 0 )
    times = result.length + times;

    for( let t = 0 ; t < times ; t++ )
    result[ t ] = value;
  }

  _.assert( times <= 0 || result[ times-1 ] === value );

  return result;
}

//

function arrayFillWhole( result, value )
{
  _.assert( _.longIs( result ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = 0;
  return _.arrayFillTimes( result, result.length, value );
}

// {
//   _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
//   _.assert( _.objectIs( o ) || _.numberIs( o ) || _.arrayIs( o ), 'arrayFill :', '"o" must be object' );
//
//   if( arguments.length === 1 )
//   {
//     if( _.numberIs( o ) )
//     o = { times : o };
//     else if( _.arrayIs( o ) )
//     o = { result : o };
//   }
//   else
//   {
//     o = { result : arguments[ 0 ], value : arguments[ 1 ] };
//   }
//
//   _.assertMapHasOnly( o, arrayFill.defaults );
//   if( o.result )
//   _.assert( _.longIs( o.result ) );
//
//   let result = o.result || [];
//   let times = o.times !== undefined ? o.times : result.length;
//   let value = o.value !== undefined ? o.value : 0;
//
//   if( _.routineIs( result.fill ) )
//   {
//     if( result.length < times )
//     result.length = times;
//     result.fill( value, 0, times );
//   }
//   else
//   {
//     for( let t = 0 ; t < times ; t++ )
//     result[ t ] = value;
//   }
//
//   _.assert( result[ times-1 ] === value );
//   return result;
// }
//
// arrayFill.defaults =
// {
//   result : null,
//   times : null,
//   value : null,
// }

//

/**
 * The arraySupplement() routine returns an array (dstArray), that contains values from following arrays only type of numbers.
 * If the initial (dstArray) isn't contain numbers, they are replaced.
 *
 * It finds among the arrays the biggest array, and assigns to the variable (length), iterates over from 0 to the (length),
 * creates inner loop that iterates over (arguments[...]) from the right (arguments.length - 1) to the (arguments[0]) left,
 * checks each element of the arrays, if it contains only type of number.
 * If true, it adds element to the array (dstArray) by corresponding index.
 * Otherwise, it skips and checks following array from the last executable index, previous array.
 * If the last executable index doesn't exist, it adds 'undefined' to the array (dstArray).
 * After that it returns to the previous array, and executes again, until (length).
 *
 * @param { longIs } dstArray - The initial array.
 * @param { ...longIs } arguments[...] - The following array(s).
 *
 * @example
 * // returns ?
 * _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
 * @returns { longIs } - Returns an array that contains values only type of numbers.
 * @function arraySupplement
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not the array-like.
 * @memberof wTools
 */

function arraySupplement( dstArray )
{
  let result = dstArray;
  if( result === null )
  result = [];

  let length = result.length;
  _.assert( _.longIs( result ) || _.numberIs( result ), 'Expects object as argument' );

  for( let a = arguments.length-1 ; a >= 1 ; a-- )
  {
    _.assert( _.longIs( arguments[ a ] ), 'argument is not defined :', a );
    length = Math.max( length, arguments[ a ].length );
  }

  if( _.numberIs( result ) )
  result = arrayFill
  ({
    value : result,
    times : length,
  });

  for( let k = 0 ; k < length ; k++ )
  {

    if( k in dstArray && isFinite( dstArray[ k ] ) )
    continue;

    let a;
    for( a = arguments.length-1 ; a >= 1 ; a-- )
    if( k in arguments[ a ] && !isNaN( arguments[ a ][ k ] ) )
    break;

    if( a === 0 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

/**
 * The arrayExtendScreening() routine iterates over (arguments[...]) from the right to the left (arguments[1]),
 * and returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 *
 * @param { longIs } screenArray - The source array.
 * @param { longIs } dstArray - To add the values from the following arrays,
 * if the following arrays contains indexes of the (screenArray).
 * If (dstArray) contains values, the certain values will be replaced.
 * @param { ...longIs } arguments[...] - The following arrays.
 *
 * @example
 * // returns [ 5, 6, 2 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
 *
 * @example
 * // returns [ 'a', 6, 2, 13 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
 *
 * @example
 * // returns [ 3, 'abc', 7, 13 ]
 * _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] )
 *
 * @returns { longIs } Returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 * If (screenArray) is empty, it returns a (dstArray).
 * If (dstArray) is equal to the null, it creates a new array,
 * and returns the corresponding values of the following arrays by the indexes of a (screenArray).
 * @function arrayExtendScreening
 * @throws { Error } Will throw an Error if (screenArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not an array-like.
 * @memberof wTools
 */

function arrayExtendScreening( screenArray, dstArray )
{
  let result = dstArray;
  if( result === null ) result = [];

  _.assert( _.longIs( screenArray ), 'Expects object as screenArray' );
  _.assert( _.longIs( result ), 'Expects object as argument' );
  for( let a = arguments.length-1 ; a >= 2 ; a-- )
  _.assert( arguments[ a ], 'argument is not defined :', a );

  for( let k = 0 ; k < screenArray.length ; k++ )
  {

    if( screenArray[ k ] === undefined )
    continue;

    let a;
    for( a = arguments.length-1 ; a >= 2 ; a-- )
    if( k in arguments[ a ] ) break;
    if( a === 1 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

function arrayShuffle( dst, times )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( dst ) );

  if( times === undefined )
  times = dst.length;

  let l = dst.length;
  let e1, e2;
  for( let t1 = 0 ; t1 < times ; t1++ )
  {
    let t2 = Math.floor( Math.random() * l );
    e1 = dst[ t1 ];
    e2 = dst[ t2 ];
    dst[ t1 ] = e2;
    dst[ t2 ] = e1;
  }

  return dst;
}

//

function arraySort( srcArray, onEvaluate )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( onEvaluate === undefined || _.routineIs( onEvaluate ) );

  if( onEvaluate === undefined )
  {
    debugger;
    srcArray.sort();
  }
  else if( onEvaluate.length === 2 )
  {
    srcArray.sort( onEvaluate );
  }
  else if( onEvaluate.length === 1 )
  {
    srcArray.sort( function( a, b )
    {
      a = onEvaluate( a );
      b = onEvaluate( b );
      if( a > b ) return +1;
      else if( a < b ) return -1;
      else return 0;
    });
  }
  else _.assert( 0, 'Expects signle-arguments evaluator or two-argument comparator' );

  return srcArray;
}

// --
// array etc
// --

function arrayIndicesOfGreatest( srcArray, numberOfElements, comparator )
{
  let result = [];
  let l = srcArray.length;

  debugger;
  throw _.err( 'not tested' );

  comparator = _._comparatorFromEvaluator( comparator );

  function rcomparator( a, b )
  {
    return comparator( srcArray[ a ], srcArray[ b ] );
  };

  for( let i = 0 ; i < l ; i += 1 )
  {

    if( result.length < numberOfElements )
    {
      _.sorted.add( result, i, rcomparator );
      continue;
    }

    _.sorted.add( result, i, rcomparator );
    result.splice( result.length-1, 1 );

  }

  return result;
}

//

/**
 * The arraySum() routine returns the sum of an array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 15
 * _.arraySum( [ 1, 2, 3, 4, 5 ] );
 *
 * @example
 * // returns 29
 * _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
 *
 * @example
 * // returns 94
 * _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
 *
 * @returns { Number } - Returns the sum of an array {-srcMap-}.
 * @function arraySum
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arraySum( src, onEvaluate )
{
  let result = 0;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( src ), 'arraySum :', 'Expects ArrayLike' );

  if( onEvaluate === undefined )
  onEvaluate = function( e ){ return e; };

  _.assert( _.routineIs( onEvaluate ) );

  for( let i = 0 ; i < src.length ; i++ )
  {
    result += onEvaluate( src[ i ], i, src );
  }

  return result;
}

// --
// array set
// --

/**
 * Returns new array that contains difference between two arrays: ( src1 ) and ( src2 ).
 * If some element is present in both arrays, this element and all copies of it are ignored.
 * @param { longIs } src1 - source array;
 * @param { longIs} src2 - array to compare with ( src1 ).
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5, 6 ]
 * _.arraySetDiff( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns [ 2, 4, 3, 5 ]
 * _.arraySetDiff( [ 1, 2, 4 ], [ 1, 3, 5 ] );
 *
 * @returns { Array } Array with unique elements from both arrays.
 * @function arraySetDiff
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */

function arraySetDiff( src1, src2 )
{
  let result = [];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) );
  _.assert( _.longIs( src2 ) );

  for( let i = 0 ; i < src1.length ; i++ )
  {
    if( src2.indexOf( src1[ i ] ) === -1 )
    result.push( src1[ i ] );
  }

  for( let i = 0 ; i < src2.length ; i++ )
  {
    if( src1.indexOf( src2[ i ] ) === -1 )
    result.push( src2[ i ] );
  }

  return result;
}

//

/**
 * Returns new array that contains elements from ( src ) that are not present in ( but ).
 * All copies of ignored element are ignored too.
 * @param { longIs } src - source array;
 * @param { longIs} but - array of elements to ignore.
 *
 * @example
 * // returns []
 * _.arraySetBut( [ 1, 1, 1 ], [ 1 ] );
 *
 * @example
 * // returns [ 2, 2 ]
 * _.arraySetBut( [ 1, 1, 2, 2, 3, 3 ], [ 1, 3 ] );
 *
 * @returns { Array } Source array without elements from ( but ).
 * @function arraySetBut
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */

function arraySetBut( dst )
{
  let args = _.longSlice( arguments );

  if( dst === null )
  if( args.length > 1 )
  {
    dst = _.longSlice( args[ 1 ] );
    args.splice( 1, 1 );
  }
  else
  {
    return [];
  }

  args[ 0 ] = dst;

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  for( let a = 0 ; a < args.length ; a++ )
  _.assert( _.longIs( args[ a ] ) );

  for( let i = dst.length-1 ; i >= 0 ; i-- )
  {
    for( let a = 1 ; a < args.length ; a++ )
    {
      let but = args[ a ];
      if( but.indexOf( dst[ i ] ) !== -1 )
      {
        dst.splice( i, 1 );
        break;
      }
    }
  }

  return dst;
}

//

/**
 * Returns array that contains elements from ( src ) that exists at least in one of arrays provided after first argument.
 * If element exists and it has copies, all copies of that element will be included into result array.
 * @param { longIs } src - source array;
 * @param { ...longIs } - sequence of arrays to compare with ( src ).
 *
 * @example
 * // returns [ 1, 3 ]
 * _.arraySetIntersection( [ 1, 2, 3 ], [ 1 ], [ 3 ] );
 *
 * @example
 * // returns [ 1, 1, 2, 2, 3, 3 ]
 * _.arraySetIntersection( [ 1, 1, 2, 2, 3, 3 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ] );
 *
 * @returns { Array } Array with elements that are a part of at least one of the provided arrays.
 * @function arraySetIntersection
 * @throws { Error } If one of arguments is not an longIs entity.
 * @memberof wTools
 */

function arraySetIntersection( dst )
{

  let first = 1;
  if( dst === null )
  if( arguments.length > 1 )
  {
    dst = _.longSlice( arguments[ 1 ] );
    first = 2;
  }
  else
  {
    return [];
  }

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.longIs( dst ) );
  for( let a = 1 ; a < arguments.length ; a++ )
  _.assert( _.longIs( arguments[ a ] ) );

  for( let i = dst.length-1 ; i >= 0 ; i-- )
  {

    for( let a = first ; a < arguments.length ; a++ )
    {
      let ins = arguments[ a ];
      if( ins.indexOf( dst[ i ] ) === -1 )
      {
        dst.splice( i, 1 );
        break;
      }
    }

  }

  return dst;
}

//

function arraySetUnion( dst )
{
  let args = _.longSlice( arguments );

  if( dst === null )
  if( arguments.length > 1 )
  {
    dst = [];
    // dst = _.longSlice( args[ 1 ] );
    // args.splice( 1, 1 );
  }
  else
  {
    return [];
  }

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.longIs( dst ) );
  for( let a = 1 ; a < args.length ; a++ )
  _.assert( _.longIs( args[ a ] ) );

  for( let a = 1 ; a < args.length ; a++ )
  {
    let ins = args[ a ];
    for( let i = 0 ; i < ins.length ; i++ )
    {
      if( dst.indexOf( ins[ i ] ) === -1 )
      dst.push( ins[ i ] )
    }
  }

  return dst;
}

//

/*
function arraySetContainAll( src )
{
  let result = [];

  _.assert( _.longIs( src ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.longIs( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( let i = 0 ; i < src.length ; i++ )
    {

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        return false;
      }

    }

  }

  return true;
}
*/
//
  /**
   * The arraySetContainAll() routine returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   *
   * @param { longIs } src - The source array.
   * @param { ...longIs } arguments[...] - The target array.
   *
   * @example
   * // returns true
   * _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
   *
   * @example
   * // returns false
   * _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
   *
   * @returns { boolean } Returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   * If length of the {-srcMap-} is more than the next argument, it returns false.
   * Otherwise, it returns false.
   * @function arraySetContainAll
   * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
   * @memberof wTools
   */

function arraySetContainAll( src )
{
  _.assert( _.longIs( src ) );
  for( let a = 1 ; a < arguments.length ; a++ )
  _.assert( _.longIs( arguments[ a ] ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let ins = arguments[ a ];

    for( let i = 0 ; i < ins.length ; i++ )
    {
      if( src.indexOf( ins[ i ] ) === -1 )
      return false;
    }

  }

  return true;
}

//

/**
 * The arraySetContainAny() routine returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { ...longIs } arguments[...] - The target array.
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
 *
 * @example
 * // returns false
 * _.arraySetContainAny( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
 *
 * @returns { Boolean } Returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 * Otherwise, it returns false.
 * @function arraySetContainAny
 * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
 * @memberof wTools
 */

function arraySetContainAny( src )
{
  _.assert( _.longIs( src ) );
  for( let a = 1 ; a < arguments.length ; a++ )
  _.assert( _.longIs( arguments[ a ] ) );

  if( src.length === 0 )
  return true;

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let ins = arguments[ a ];

    let i;
    for( i = 0 ; i < ins.length ; i++ )
    {
      if( src.indexOf( ins[ i ] ) !== -1 )
      break;
    }

    if( i === ins.length )
    return false;

  }

  return true;
}

//

function arraySetContainNone( src )
{
  _.assert( _.longIs( src ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.longIs( arguments[ a ] ) );

    for( let i = 0 ; i < src.length ; i++ )
    {

      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        return false;
      }

    }

  }

  return true;
}

//

/**
 * Returns true if ( ins1 ) and ( ins2) arrays have same length and elements, elements order doesn't matter.
 * Inner arrays of arguments are not compared and result of such combination will be false.
 * @param { longIs } ins1 - source array;
 * @param { longIs} ins2 - array to compare with.
 *
 * @example
 * // returns false
 * _.arraySetIdentical( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns true
 * _.arraySetIdentical( [ 1, 2, 4 ], [ 4, 2, 1 ] );
 *
 * @returns { Boolean } Result of comparison as boolean.
 * @function arraySetIdentical
 * @throws { Error } If one of arguments is not an ArrayLike entity.
 * @throws { Error } If arguments length is not 2.
 * @memberof wTools
 */

function arraySetIdentical( ins1, ins2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( ins1 ) );
  _.assert( _.longIs( ins2 ) );

  if( ins1.length !== ins2.length )
  return false;

  let result = _.arraySetDiff( ins1, ins2 );

  return result.length === 0;
}

// --
// fields
// --

// let unrollSymbol = Symbol.for( 'unroll' );

let Fields =
{

  // ArrayType : Array,
  //
  // accuracy : 1e-7,
  // accuracySqrt : 1e-4,
  // accuracySqr : 1e-14,

}

// --
// routines
// --

let Routines =
{

  // buffer

  buffersTypedAreEquivalent,
  buffersTypedAreIdentical,
  buffersRawAreIdentical,
  buffersViewAreIdentical,
  buffersNodeAreIdentical,
  buffersAreEquivalent,
  buffersAreIdentical,

  bufferMakeSimilar,
  bufferButRange,
  bufferRelen,
  bufferResize,
  bufferBytesGet,
  bufferRetype,

  bufferJoin,

  bufferMove,
  bufferToStr,
  bufferToDom,

  bufferLeft,
  bufferSplit,
  bufferCutOffLeft,

  bufferFromArrayOfArray,
  bufferFrom,
  bufferRawFromTyped,
  bufferRawFrom,
  bufferBytesFrom,
  bufferBytesFromNode,
  bufferNodeFrom,

  buffersSerialize, /* deprecated */
  buffersDeserialize, /* deprecated */

  // array maker

  arrayMakeRandom,
  // scalarToVector,
  arrayFromCoercing,
  // arrayAs,

  arrayFromRange,
  arrayFromProgressionArithmetic,
  arrayFromRangeWithStep,
  arrayFromRangeWithNumberOfSteps,

  // array converter

  arrayToMap, /* dubious */
  arrayToStr, /* dubious */

  // array transformer

  arraySub,
  arrayButRange,

  arraySlice,
  arrayGrow,
  arrayResize,
  arrayMultislice,
  arrayDuplicate,

  arrayMask, /* dubious */
  arrayUnmask, /* dubious */

  longUniqueAre,
  longUnduplicate,
  arraySelect,

  // array mutator

  arraySet,
  arraySwap,

  arrayCutin,
  arrayPut,
  arrayFillTimes,
  arrayFillWhole,

  arraySupplement, /* experimental */
  arrayExtendScreening, /* experimental */

  arrayShuffle,
  arraySort,

  // array etc

  arrayIndicesOfGreatest, /* dubious */
  arraySum, /* dubious */

  // array set

  arraySetDiff,

  arraySetBut,
  arraySetIntersection,
  arraySetUnion,

  arraySetContainAll,
  arraySetContainAny,
  arraySetContainNone,
  arraySetIdentical,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gLong.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gLong_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gLong_s

( function gMap_s() { // == begin of file gMap_s
function gMap_s_naked() {
( function _gMap_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// routines
// --

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gMap.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gMap_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gMap_s

( function gNumber_s() { // == begin of file gNumber_s
function gNumber_s_naked() {
( function _gNumber_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

// --
// number
// --

function numbersTotal( numbers )
{
  let result = 0;
  _.assert( _.longIs( numbers ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  for( let n = 0 ; n < numbers.length ; n++ )
  {
    let number = numbers[ n ];
    _.assert( _.numberIs( number ) )
    result += number;
  }
  return result;
}

//

function numberFrom( src )
{
  _.assert( arguments.length === 1 );
  if( _.strIs( src ) )
  {
    return parseFloat( src );
  }
  return Number( src );
}

//

function numbersFrom( src )
{
  if( _.strIs( src ) )
  return _.numberFrom( src );

  let result;

  if( _.longIs( src ) )
  {
    result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _.numberFrom( src[ s ] );
  }
  else if( _.objectIs( src ) )
  {
    result = Object.create( null );
    for( let s in src )
    result[ s ] = _.numberFrom( src[ s ] );
  }

  return result;
}

//

function numberFromStr( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) )
  let result = parseFloat( src );
  return result;
}

//

function numbersSlice( src,f,l )
{
  if( _.numberIs( src ) )
  return src;
  return _.longSlice( src,f,l );
}

//

function numberRandomInRange( range )
{

  _.assert( arguments.length === 1 && _.arrayIs( range ),'numberRandomInRange :','Expects range( array ) as argument' );
  _.assert( range.length === 2 );

  return _random()*( range[ 1 ] - range[ 0 ] ) + range[ 0 ];

}

//

function numberRandomInt( range )
{

  if( _.numberIs( range ) )
  range = range >= 0 ? [ 0,range ] : [ range,0 ];
  else if( _.arrayIs( range ) )
  range = range;
  else _.assert( 0,'numberRandomInt','Expects range' );

  _.assert( _.arrayIs( range ) || _.numberIs( range ) );
  _.assert( range.length === 2 );

  let result = Math.floor( range[ 0 ] + Math.random()*( range[ 1 ] - range[ 0 ] ) );

  return result;
}

//

function numberRandomIntBut( range )
{
  let result;
  let attempts = 50;

  if( _.numberIs( range ) )
  range = [ 0,range ];
  else if( _.arrayIs( range ) )
  range = range;
  else throw _.err( 'numberRandomInt','unexpected argument' );

  for( let attempt = 0 ; attempt < attempts ; attempt++ )
  {
    // if( attempt === attempts-2 )
    // debugger;
    // if( attempt === attempts-1 )
    // debugger;

    /*result = _.numberRandomInt( range ); */
    let result = Math.floor( range[ 0 ] + Math.random()*( range[ 1 ] - range[ 0 ] ) );

    let bad = false;
    for( let a = 1 ; a < arguments.length ; a++ )
    if( _.routineIs( arguments[ a ] ) )
    {
      if( !arguments[ a ]( result ) )
      bad = true;
    }
    else
    {
      if( result === arguments[ a ] )
      bad = true;
    }

    if( bad )
    continue;
    return result;
  }

  result = NaN;
  return result;
}

//

function numbersMake( src,length )
{
  let result;

  if( _.vectorIs( src ) )
  src = _.vector.slice( src );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( src ) || _.arrayLike( src ) );

  if( _.arrayLike( src ) )
  {
    _.assert( src.length === length );
    result = _.array.makeArrayOfLength( length );
    for( let i = 0 ; i < length ; i++ )
    result[ i ] = src[ i ];
  }
  else
  {
    result = _.array.makeArrayOfLength( length );
    for( let i = 0 ; i < length ; i++ )
    result[ i ] = src;
  }

  return result;
}

//

function numbersFromNumber( src,length )
{

  if( _.vectorIs( src ) )
  src = _.vector.slice( src );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( src ) || _.arrayLike( src ) );

  if( _.arrayLike( src ) )
  {
    _.assert( src.length === length );
    return src;
  }

  let result = _.array.makeArrayOfLength( length );
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = src;

  return result;
}

//

function numbersFromInt( dst,length )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIsInt( dst ) || _.arrayIs( dst ),'Expects array of number as argument' );
  _.assert( length >= 0 );

  if( _.numberIs( dst ) )
  {
    dst = _.arrayFillTimes( [], length , dst );
  }
  else
  {
    for( let i = 0 ; i < dst.length ; i++ )
    _.assert( _.numberIsInt( dst[ i ] ),'Expects integer, but got',dst[ i ] );
    _.assert( dst.length === length,'Expects array of length',length,'but got',dst );
  }

  return dst;
}

//

function numbersMake_functor( length )
{
  let _ = this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.numberIs( length ) );

  function numbersMake( src )
  {
    return _.numbersMake( src,length );
  }

  return numbersMake;
}

//

function numbersFrom_functor( length )
{
  let _ = this;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.numberIs( length ) );

  function numbersFromNumber( src )
  {
    return _.numbersFromNumber( src,length );
  }

  return numbersFrom;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  numbersTotal,

  numberFrom,
  numbersFrom, /* qqq : add test coverage */
  numberFromStr,

  numbersSlice,

  numberRandomInRange,
  numberRandomInt,
  numberRandomIntBut, /* dubious */

  numbersMake,
  numbersFromNumber,
  numbersFromInt,

  numbersMake_functor,
  numbersFrom_functor,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gNumber.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gNumber_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gNumber_s

( function gRange_s() { // == begin of file gRange_s
function gRange_s_naked() {
( function _gRange_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// range
// --

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gRange.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gRange_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gRange_s

( function gRegexp_s() { // == begin of file gRegexp_s
function gRegexp_s_naked() {
( function _gRegexp_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

// --
// regexp
// --

// function regexpIs( src )
// {
//   return _ObjectToString.call( src ) === '[object RegExp]';
// }
//
// //
//
// function regexpObjectIs( src )
// {
//   if( !_.RegexpObject )
//   return false;
//   return src instanceof _.RegexpObject;
// }
//
// //
//
// function regexpLike( src )
// {
//   if( _.regexpIs( src ) || _.strIs( src ) )
//   return true;
//   return false;
// }
//
// //
//
// function regexpsLike( srcs )
// {
//   if( !_.arrayIs( srcs ) )
//   return false;
//   for( let s = 0 ; s < srcs.length ; s++ )
//   if( !_.regexpLike( srcs[ s ] ) )
//   return false;
//   return true;
// }
//
// //
//
// function regexpIdentical( src1,src2 )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
//   return false;
//
//   return src1.source === src2.source && src1.flags === src2.flags;
// }
//
// //
//
// function _regexpTest( regexp, str )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.regexpLike( regexp ) );
//   _.assert( _.strIs( str ) );
//
//   if( _.strIs( regexp ) )
//   return regexp === str;
//   else
//   return regexp.test( str );
//
// }
//
// //
//
// function regexpTest( regexp, strs )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.regexpLike( regexp ) );
//
//   if( _.strIs( strs ) )
//   return _._regexpTest( regexp, strs );
//   else if( _.arrayLike( strs ) )
//   return strs.map( ( str ) => _._regexpTest( regexp, str ) )
//   else _.assert( 0 );
//
// }
//
// //
//
// function regexpTestAll( regexp, strs )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.regexpLike( regexp ) );
//
//   if( _.strIs( strs ) )
//   return _._regexpTest( regexp, strs );
//   else if( _.arrayLike( strs ) )
//   return strs.every( ( str ) => _._regexpTest( regexp, str ) )
//   else _.assert( 0 );
//
// }
//
// //
//
// function regexpTestAny( regexp, strs )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.regexpLike( regexp ) );
//
//   if( _.strIs( strs ) )
//   return _._regexpTest( regexp, strs );
//   else if( _.arrayLike( strs ) )
//   return strs.some( ( str ) => _._regexpTest( regexp, str ) )
//   else _.assert( 0 );
//
// }
//
// //
//
// function regexpTestNone( regexp, strs )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.regexpLike( regexp ) );
//
//   if( _.strIs( strs ) )
//   return !_._regexpTest( regexp, strs );
//   else if( _.arrayLike( strs ) )
//   return !strs.some( ( str ) => _._regexpTest( regexp, str ) )
//   else _.assert( 0 );
//
// }
//
// //
//
// function regexpsTestAll( regexps, strs )
// {
//   _.assert( arguments.length === 2 );
//
//   if( !_.arrayIs( regexps ) )
//   return _.regexpTestAll( regexps, strs );
//
//   _.assert( _.regexpsLike( regexps ) );
//
//   return regexps.every( ( regexp ) => _.regexpTestAll( regexp, strs ) );
// }
//
// //
//
// function regexpsTestAny( regexps, strs )
// {
//   _.assert( arguments.length === 2 );
//
//   if( !_.arrayIs( regexps ) )
//   return _.regexpTestAny( regexps, strs );
//
//   _.assert( _.regexpsLike( regexps ) );
//
//   return regexps.some( ( regexp ) => _.regexpTestAny( regexp, strs ) );
// }
//
// //
//
// function regexpsTestNone( regexps, strs )
// {
//   _.assert( arguments.length === 2 );
//
//   if( !_.arrayIs( regexps ) )
//   return _.regexpTestNone( regexps, strs );
//
//   _.assert( _.regexpsLike( regexps ) );
//
//   return regexps.every( ( regexp ) => _.regexpTestNone( regexp, strs ) );
// }

//

/**
 * Escapes special characters with a slash ( \ ). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * wTools.regexpEscape( 'Hello. How are you?' ); // "Hello\. How are you\?"
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @function regexpEscape
 * @memberof wTools
 */

function regexpEscape( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  return src.replace( /([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1" );
}

//

let regexpsEscape = null;

//

/**
 * Make regexp from string.
 *
 * @example
 * wTools.regexpFrom( 'Hello. How are you?' ); // /Hello\. How are you\?/
 * @param {RegexpLike} src - string or regexp
 * @returns {String} Regexp
 * @throws {Error} Throw error with message 'unknown type of expression, expects regexp or string, but got' error
 if src not string-like ( string or regexp )
 * @function regexpFrom
 * @memberof wTools
 */

function regexpFrom( src, flags )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( flags === undefined || _.strIs( flags ) );

  if( _.regexpIs( src ) )
  return src;

  _.assert( _.strIs( src ) );

  return new RegExp( _.regexpEscape( src ),flags );
}

//

function regexpMaybeFrom( o )
{
  if( !_.objectIs( o ) )
  o = { srcStr : arguments[ 0 ] }

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( o.srcStr ) || _.regexpIs( o.srcStr ) );
  _.routineOptions( regexpMaybeFrom, o );

  let result = o.srcStr;

  if( _.strIs( result ) )
  {

    // let optionsExtract =
    // {
    //   prefix : '//',
    //   postfix : '//',
    //   src : result,
    // }
    // let strips = _.strExtractInlinedStereo( optionsExtract );

    if( o.stringWithRegexp )
    {

      let optionsExtract =
      {
        delimeter : '//',
        src : result,
      }
      let strips = _.strExtractInlined( optionsExtract );

      // if( strips.length > 1 )
      // debugger;

    }
    else
    {
      let strips = [ result ];
    }

    for( let s = 0 ; s < strips.length ; s++ )
    {
      let strip = strips[ s ];

      if( s % 2 === 0 )
      {
        strip = _.regexpEscape( strip );
        if( o.toleratingSpaces )
        strip = strip.replace( /\s+/g,'\\s*' );
      }

      strips[ s ] = strip;
    }

    result = RegExp( strips.join( '' ), o.flags );
  }

  return result;
}

regexpMaybeFrom.defaults =
{
  srcStr : null,
  stringWithRegexp : 1,
  toleratingSpaces : 1,
  flags : 'g',
}

//

let regexpsMaybeFrom = null;

//

function regexpsSources( o )
{
  if( _.arrayIs( arguments[ 0 ] ) )
  {
    o = Object.create( null );
    o.sources = arguments[ 0 ];
  }

  // o.sources = o.sources ? _.longSlice( o.sources ) : [];
  o.sources = _.longSlice( o.sources );
  if( o.flags === undefined )
  o.flags = null;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( regexpsSources, o );

  /* */

  for( let s = 0 ; s < o.sources.length ; s++ )
  {
    let src = o.sources[ s ];
    if( _.regexpIs( src ) )
    {
      o.sources[ s ] = src.source;
      _.assert( o.flags === null || src.flags === o.flags, () => 'All RegExps should have flags field with the same value ' + _.strQuote( src.flags ) + ' != ' + _.strQuote( o.flags ) );
      if( o.flags === null )
      o.flags = src.flags;
    }
    else
    {
      if( o.escaping )
      o.sources[ s ] = _.regexpEscape( src );
    }
    _.assert( _.strIs( o.sources[ s ] ) );
  }

  /* */

  return o;
}

regexpsSources.defaults =
{
  sources : null,
  flags : null,
  escaping : 0,
}

//

function regexpsJoin( o )
{
  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsJoin, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let src = o.sources[ 0 ];
  o = _.regexpsSources( o );
  if( o.sources.length === 1 && _.regexpIs( src ) )
  return src;

  let result = o.sources.join( '' );

  return new RegExp( result, o.flags || '' );
}

regexpsJoin.defaults =
{
  flags : null,
  sources : null,
  escaping : 0,
}

//

function regexpsJoinEscaping( o )
{
  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsJoinEscaping, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !!o.escaping );

  return _.regexpsJoin( o );
}

var defaults = regexpsJoinEscaping.defaults = Object.create( regexpsJoin.defaults );

defaults.escaping = 1;

//

function regexpsAtLeastFirst( o )
{

  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsAtLeastFirst, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let src = o.sources[ 0 ];
  o = _.regexpsSources( o );
  if( o.sources.length === 1 && _.regexpIs( src ) )
  return src;

  let result = '';
  let prefix = '';
  let postfix = '';

  for( let s = 0 ; s < o.sources.length ; s++ )
  {
    let src = o.sources[ s ];

    if( s === 0 )
    {
      prefix = prefix + src;
    }
    else
    {
      prefix = prefix + '(?:' + src;
      postfix =  ')?' + postfix
    }

  }

  result = prefix + postfix;
  return new RegExp( result, o.flags || '' );
}

regexpsAtLeastFirst.defaults =
{
  flags : null,
  sources : null,
  escaping : 0,
}

//

function regexpsAtLeastFirstOnly( o )
{

  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsAtLeastFirst, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let src = o.sources[ 0 ];
  o = _.regexpsSources( o );
  if( o.sources.length === 1 && _.regexpIs( src ) )
  return src;

  let result = '';

  if( o.sources.length === 1 )
  {
    result = o.sources[ 0 ]
  }
  else for( let s = 0 ; s < o.sources.length ; s++ )
  {
    let src = o.sources[ s ];
    if( s < o.sources.length-1 )
    result += '(?:' + o.sources.slice( 0, s+1 ).join( '' ) + '$)|';
    else
    result += '(?:' + o.sources.slice( 0, s+1 ).join( '' ) + ')';
  }

  return new RegExp( result, o.flags || '' );
}

regexpsAtLeastFirst.defaults =
{
  flags : null,
  sources : null,
  escaping : 0,
}

//

/**
 *  Generates "but" regular expression pattern. Accepts a list of words, which will be used in regexp.
 *  The result regexp matches the strings that do not contain any of those words.
 *
 * @example
 * wTools.regexpsNone( 'yellow', 'red', 'green' ); //   /^(?:(?!yellow|red|green).)+$/
 *
 * let options =
 * {
 *    but : [ 'yellow', 'red', 'green' ],
 *    atLeastOnce : false
 * };
 * wTools.regexpsNone(options); // /^(?:(?!yellow|red|green).)*$/
 *
 * @param {Object} [options] options for generate regexp. If this argument omitted then default options will be used
 * @param {String[]} [options.but=null] a list of words,from each will consist regexp
 * @param {boolean} [options.atLeastOne=true] indicates whether search matches at least once
 * @param {...String} [words] a list of words, from each will consist regexp. This arguments can be used instead
 * options object.
 * @returns {RegExp} Result regexp
 * @throws {Error} If passed arguments are not strings or options object.
 * @throws {Error} If options contains any different from 'but' or 'atLeastOnce' properties.
 * @function regexpsNone
 * @memberof wTools
 */

function regexpsNone( o )
{
  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsNone, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  o = _.regexpsSources( o );

  /* ^(?:(?!(?:abc)).)+$ */

  let result = '^(?:(?!(?:';
  result += o.sources.join( ')|(?:' );
  result += ')).)+$';

  return new RegExp( result, o.flags || '' );
}

regexpsNone.defaults =
{
  flags : null,
  sources : null,
  escaping : 0,
}

//

function regexpsAny( o )
{
  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsAny, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.regexpIs( o.sources ) )
  {
    _.assert( o.sources.flags === o.flags || o.flags === null );
    return o.sources;
  }

  _.assert( !!o.sources );
  let src = o.sources[ 0 ];
  o = _.regexpsSources( o );
  if( o.sources.length === 1 && _.regexpIs( src ) )
  return src;

  let result = '(?:';
  result += o.sources.join( ')|(?:' );
  result += ')';

  return new RegExp( result, o.flags || '' );
}

regexpsAny.defaults =
{
  flags : null,
  sources : null,
  escaping : 0,
}

//

function regexpsAll( o )
{
  if( !_.objectIs( o ) )
  o = { sources : o }

  _.routineOptions( regexpsAll, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.regexpIs( o.sources ) )
  {
    _.assert( o.sources.flags === o.flags || o.flags === null );
    return o.sources;
  }

  let src = o.sources[ 0 ];
  o = _.regexpsSources( o );
  if( o.sources.length === 1 && _.regexpIs( src ) )
  return src;

  let result = ''

  if( o.sources.length > 0 )
  {

    if( o.sources.length > 1 )
    {
      result += '(?=';
      result += o.sources.slice( 0, o.sources.length-1 ).join( ')(?=' );
      result += ')';
    }

    result += '(?:';
    result += o.sources[ o.sources.length-1 ];
    result += ')';

  }

  return new RegExp( result, o.flags || '' );
}

regexpsAll.defaults =
{
  flags : null,
  sources : null,
  escaping : 0,
}

//

/**
 * Wraps regexp(s) into array and returns it. If in `src` passed string - turn it into regexp
 *
 * @example
 * wTools.regexpArrayMake( ['red', 'white', /[a-z]/] ); // [ /red/, /white/, /[a-z]/ ]
 * @param {String[]|String} src - array of strings/regexps or single string/regexp
 * @returns {RegExp[]} Array of regexps
 * @throw {Error} if `src` in not string, regexp, or array
 * @function regexpArrayMake
 * @memberof wTools
 */

function regexpArrayMake( src )
{

  _.assert( _.regexpLike( src ) || _.arrayLike( src ), 'Expects array/regexp/string, got ' + _.strType( src ) );

  src = _.arrayFlatten( [], _.arrayAs( src ) );

  for( let k = src.length-1 ; k >= 0 ; k-- )
  {
    let e = src[ k ]

    if( e === null )
    {
      src.splice( k,1 );
      continue;
    }

    src[ k ] = _.regexpFrom( e );

  }

  return src;
}

//

/**
 * regexpArrayIndex() returns the index of the first regular expression that matches substring
  Otherwise, it returns -1.
 * @example
 *
   let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
   let regArr1 = [/white/, /green/, /blue/];
   wTools.regexpArrayIndex(regArr1, str); // 1

 * @param {RegExp[]} arr Array for regular expressions.
 * @param {String} ins String, inside which will be execute search
 * @returns {number} Index of first matching or -1.
 * @throws {Error} If first argument is not array.
 * @throws {Error} If second argument is not string.
 * @throws {Error} If element of array is not RegExp.
 * @function regexpArrayIndex
 * @memberof wTools
 */

function regexpArrayIndex( arr,ins )
{
  _.assert( _.arrayIs( arr ) );
  _.assert( _.strIs( ins ) );

  for( let a = 0 ; a < arr.length ; a++ )
  {
    let regexp = arr[ a ];
    _.assert( _.regexpIs( regexp ) );
    if( regexp.test( ins ) )
    return a;
  }

  return -1;
}

//

/**
 * Checks if any regexp passed in `arr` is found in string `ins`
 * If match was found - returns match index
 * If no matches found and regexp array is not empty - returns false
 * If regexp array is empty - returns some default value passed in the `ifEmpty` input param
 *
 * @example
 * let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * let regArr2 = [/yellow/, /blue/, /red/];
 * wTools.regexpArrayAny(regArr2, str, false); // 1
 *
 * let regArr3 = [/yellow/, /white/, /greey/]
 * wTools.regexpArrayAny(regArr3, str, false); // false
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @function regexpArrayAny
 * @memberof wTools
 */

function regexpArrayAny( arr, ins, ifEmpty )
{

  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  arr = _.arrayAs( arr );
  for( let m = 0 ; m < arr.length ; m++ )
  {
    _.assert( _.routineIs( arr[ m ].test ) );
    if( arr[ m ].test( ins ) )
    return m;
  }

  return arr.length ? false : ifEmpty;
}

//

/**
 * Checks if all regexps passed in `arr` are found in string `ins`
 * If any of regex was not found - returns match index
 * If regexp array is not empty and all regexps passed test - returns true
 * If regexp array is empty - returns some default value passed in the `ifEmpty` input param
 *
 * @example
 * let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * let regArr1 = [/red/, /green/, /blue/];
 * wTools.regexpArrayAll(regArr1, str, false); // true
 *
 * let regArr2 = [/yellow/, /blue/, /red/];
 * wTools.regexpArrayAll(regArr2, str, false); // 0
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @function regexpArrayAll
 * @memberof wTools
 */

function regexpArrayAll( arr, ins, ifEmpty )
{
  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  arr = _.arrayAs( arr );
  for( let m = 0 ; m < arr.length ; m++ )
  {
    if( !arr[ m ].test( ins ) )
    return m;
  }

  return arr.length ? true : ifEmpty;
}

//

function regexpArrayNone( arr, ins, ifEmpty )
{

  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  arr = _.arrayAs( arr );
  for( let m = 0 ; m < arr.length ; m++ )
  {
    _.assert( _.routineIs( arr[ m ].test ) );
    if( arr[ m ].test( ins ) )
    return false;
  }

  return arr.length ? true : ifEmpty;
}

// --
// fields
// --

let Fields =
{

  // regexpIdentationRegexp : /(\s*\n(\s*))/g,

}

// --
// routines
// --

let Routines =
{

  // regexp

  regexpEscape,
  regexpsEscape : _.routineVectorize_functor( regexpEscape ),

  regexpArrayMake,
  regexpFrom,

  regexpMaybeFrom,
  regexpsMaybeFrom : _.routineVectorize_functor({ routine : regexpMaybeFrom, select : 'srcStr' }),

  regexpsSources,
  regexpsJoin,
  regexpsJoinEscaping,
  regexpsAtLeastFirst,
  regexpsAtLeastFirstOnly,

  regexpsNone,
  regexpsAny,
  regexpsAll,

  regexpArrayMake,
  regexpArrayIndex,
  regexpArrayAny,
  regexpArrayAll,
  regexpArrayNone,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gRegexp.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gRegexp_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gRegexp_s

( function gRoutine_s() { // == begin of file gRoutine_s
function gRoutine_s_naked() {
( function _gRoutine_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// routine
// --

function _routinesComposeWithSingleArgument_pre( routine, args )
{
  let o = _.routinesCompose.pre.call( this, routine, args );

  _.assert( args.length === 1 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  return o;
}

//

function routinesComposeReturningLast()
{
  let o = _.routinesComposeReturningLast.pre( routinesComposeReturningLast, arguments );
  let result = _.routinesComposeReturningLast.body( o );
  return result;
}

routinesComposeReturningLast.pre = _.routinesCompose.pre;
routinesComposeReturningLast.body = _.routinesCompose.body;
routinesComposeReturningLast.defaults = Object.create( _.routinesCompose.defaults );

routinesComposeReturningLast.defaults.supervisor = _.compose.supervisor.returningLast;

function routinesComposeAll()
{
  let o = _.routinesComposeAll.pre( routinesComposeAll, arguments );
  let result = _.routinesComposeAll.body( o );
  return result;
}

routinesComposeAll.pre = _routinesComposeWithSingleArgument_pre;
routinesComposeAll.body = _.routinesCompose.body;

var defaults = routinesComposeAll.defaults = Object.create( _.routinesCompose.defaults );
defaults.chainer = _.compose.chainer.composeAll;
defaults.supervisor = _.compose.supervisor.composeAll;

_.assert( _.routineIs( _.compose.chainer.originalWithDont ) );
_.assert( _.routineIs( _.compose.supervisor.composeAll ) );

//

function routinesComposeAllReturningLast()
{
  let o = _.routinesComposeAllReturningLast.pre( routinesComposeAllReturningLast, arguments );
  let result = _.routinesComposeAllReturningLast.body( o );
  return result;
}

routinesComposeAllReturningLast.pre = _routinesComposeWithSingleArgument_pre;
routinesComposeAllReturningLast.body = _.routinesCompose.body;

var defaults = routinesComposeAllReturningLast.defaults = Object.create( _.routinesCompose.defaults );
defaults.chainer = _.compose.chainer.originalWithDont;
defaults.supervisor = _.compose.supervisor.returningLast;

//

function routinesChain()
{
  let o = _.routinesChain.pre( routinesChain, arguments );
  let result = _.routinesChain.body( o );
  return result;
}

routinesChain.pre = _routinesComposeWithSingleArgument_pre;
routinesChain.body = _.routinesCompose.body;

var defaults = routinesChain.defaults = Object.create( _.routinesCompose.defaults );
defaults.chainer = _.compose.chainer.chaining;
defaults.supervisor = _.compose.supervisor.chaining;

//

function _equalizerFromMapper( mapper )
{

  if( mapper === undefined )
  mapper = function mapper( a, b ){ return a === b };

  _.assert( 0, 'not tested' )
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( mapper.length === 1 || mapper.length === 2 );

  if( mapper.length === 1 )
  {
    let equalizer = function equalizerFromMapper( a, b )
    {
      return mapper( a ) === mapper( b );
    }
    return equalizer;
  }

  return mapper;
}

//

function _comparatorFromEvaluator( evaluator )
{

  if( evaluator === undefined )
  evaluator = function comparator( a, b ){ return a-b };

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( evaluator.length === 1 || evaluator.length === 2 );

  if( evaluator.length === 1 )
  {
    let comparator = function comparatorFromEvaluator( a, b )
    {
      return evaluator( a ) - evaluator( b );
    }
    return comparator;
  }

  return evaluator;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  routinesComposeReturningLast,
  routinesComposeAll,
  routinesComposeAllReturningLast, /* !!! */
  routinesChain,

  _equalizerFromMapper,
  _comparatorFromEvaluator,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gRoutine.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gRoutine_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gRoutine_s

( function gString_s() { // == begin of file gString_s
function gString_s_naked() {
( function _gString_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// str
// --

function strIsolate_pre( routine, args )
{
  let o;

  if( args.length > 1 )
  {
    o = { src : args[ 0 ], delimeter : args[ 1 ], times : args[ 2 ] };
  }
  else
  {
    o = args[ 0 ];
    _.assert( args.length === 1, 'Expects single argument' );
  }

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strsLikeAll( o.delimeter ) )
  _.assert( _.numberIs( o.times ) );

  return o;
}

//

/**
* @typedef {object} wTools.toStrInhalfOptions
* @property {string} [ o.src=null ] - Source string.
* @property {string | array} [ o.delimeter=' ' ] - Splitter of the string.
* @property {boolean} [ o.left=1 ] - Finds occurrence from begining of the string.
*/

/**
 * Finds occurrence of delimeter( o.delimeter ) in source( o.src ) and splits string in finded position by half.
 * If function finds  more then one occurrence, it separates string in the position of the last.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolate( { src : 'sample, string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolate( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ 'sample string, name', 'string' ]
 * _.strIsolate( { src : 'sample string, name string', delimeter : [ ',', ' ' ] } )
 *
 * @method strIsolate
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a Array or String.
 * @throws { Exception } Throw an exception if( o ) is extended by uknown property.
 * @memberof wTools
 *
 */

// function strIsolate( o )
// {
//   let result = [];
//   let times = o.times;
//   let delimeter
//   let index = o.left ? -1 : o.src.length;
//
//   _.assertRoutineOptions( strIsolate, o );
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.strIs( o.src ), 'Expects string {-o.src-}, got', _.strType( o.src ) );
//   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
//   _.assert( _.numberIs( o.times ) );
//
//   /* */
//
//   if( !( times >= 1 ) )
//   {
//     return everything( o.left ^ o.none );
//   }
//
//   if( _.arrayIs( o.delimeter ) && o.delimeter.length === 1 )
//   o.delimeter = o.delimeter[ 0 ];
//
//   let closest = o.left ? strLeft : strRight;
//
//   /* */
//
//   while( times > 0 )
//   {
//
//     index += o.left ? +1 : -1;
//
//     if( _.arrayIs( o.delimeter ) )
//     {
//
//       if( !o.delimeter.length )
//       {
//         return everything( o.left ^ o.none );
//       }
//
//       let c = closest( index );
//
//       delimeter = c.element;
//       index = c.value;
//
//       if( o.times === 1 && index === o.src.length && o.left )
//       index = -1;
//
//     }
//     else
//     {
//
//       delimeter = o.delimeter;
//       index = o.left ? o.src.indexOf( delimeter, index ) : o.src.lastIndexOf( delimeter, index );
//
//       if( o.left && !( index >= 0 ) && o.times > 1 )
//       {
//         index = o.src.length;
//         break;
//       }
//
//     }
//
//     /* */
//
//     if( !o.left && times > 1 && index === 0  )
//     {
//       return everything( !o.none )
//     }
//
//     if( !( index >= 0 ) && o.times === 1 )
//     {
//       return everything( o.left ^ o.none )
//     }
//
//     times -= 1;
//
//   }
//
//   /* */
//
//   result.push( o.src.substring( 0, index ) );
//   result.push( delimeter );
//   result.push( o.src.substring( index + delimeter.length ) );
//
//   return result;
//
//   /* */
//
//   function everything( side )
//   {
//     return ( side ) ? [ o.src, '', '' ] : [ '', '', o.src ];
//   }
//
//   /* */
//
//   function strLeft( index )
//   {
//     return _.entityMin( o.delimeter, function( a )
//     {
//       let i = o.src.indexOf( a, index );
//       if( i === -1 )
//       return o.src.length;
//       return i;
//     });
//   }
//
//   /* */
//
//   function strRight( index )
//   {
//     return _.entityMax( o.delimeter, function( a )
//     {
//       let i = o.src.lastIndexOf( a, index );
//       return i;
//     });
//   }
//
// }
//
// strIsolate.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   quoting : null,
//   left : 1,
//   times : 1,
//   none : 1,
// }

function strIsolate_body( o )
{
  let result = [];
  let times = o.times;
  let delimeter
  let index = o.left ? 0 : o.src.length;
  let more = o.left ? strLeft : strRight;
  let delta = ( o.left ? +1 : -1 );

  _.assertRoutineOptions( strIsolate_body, arguments );

  /* */

  if( _.arrayIs( o.delimeter ) && o.delimeter.length === 1 )
  o.delimeter = o.delimeter[ 0 ];

  /* */

  while( times > 0 )
  {
    let found = more( index );

    if( found.entry === undefined )
    break;

    times -= 1;

    if( o.left )
    index = found.index + delta;
    else
    index = found.index + found.entry.length + delta;

    if( times === 0 )
    {
      result.push( o.src.substring( 0, found.index ) );
      result.push( found.entry );
      result.push( o.src.substring( found.index + found.entry.length ) );
      return result;
    }

    /* */

    if( o.left )
    {
      if( index >= o.src.length )
      break;
    }
    else
    {
      if( index <= 0 )
      break;
    }

  }

  /* */

  if( !result.length )
  {

    if( o.times === 0 )
    return everything( !o.left );
    else if( times === o.times )
    return everything( o.left ^ o.none );
    else
    return everything( o.left );

  }

  return result;

  /* */

  function everything( side )
  {
    return ( side ) ? [ o.src, undefined, '' ] : [ '', undefined, o.src ];
  }

  /* */

  function strLeft( index )
  {
    return _._strLeftSingle( o.src, o.delimeter, index, undefined );
  }

  /* */

  function strRight( index )
  {
    return _._strRightSingle( o.src, o.delimeter, undefined, index );
  }

}

strIsolate_body.defaults =
{
  src : null,
  delimeter : ' ',
  quoting : null,
  left : 1,
  times : 1,
  none : 1,
}

//

/**
 * Short-cut for strIsolate function.
 * Finds occurrence of delimeter( o.delimeter ) from begining of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolateLeftOrNone( { src : 'sample, string', delimeter : [ ', ' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolateLeftOrNone( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ 'sample string, name', 'string' ]
 * _.strIsolateLeftOrNone( 'sample string, name string', ',' )
 *
 * @method strIsolateLeftOrNone
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */

function strIsolateLeftOrNone_body( o )
{
  o.left = 1;
  o.none = 1;
  let result = _.strIsolate.body( o );
  return result;
}

strIsolateLeftOrNone_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
  quoting : null,
}

//

function strIsolateLeftOrAll_body( o )
{
  o.left = 1;
  o.none = 0;
  let result = _.strIsolate.body( o );
  return result;
}

strIsolateLeftOrAll_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
  quoting : null,
}

//

/**
 * Short-cut for strIsolate function.
 * Finds occurrence of delimeter( o.delimeter ) from end of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolateRightOrNone( { src : 'sample, string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolateRightOrNone( { src : 'sample string', delimeter : ' ' } )
 *
 * @method strIsolateRightOrNone
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */

function strIsolateRightOrNone_body( o )
{
  o.left = 0;
  o.none = 1;
  let result = _.strIsolate.body( o );
  return result;
}

strIsolateRightOrNone_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
  quoting : null,
}

//

function strIsolateRightOrAll_body( o )
{
  o.left = 0;
  o.none = 0;
  let result = _.strIsolate.body( o );
  return result;
}

strIsolateRightOrAll_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
  quoting : null,
}

//

/**
  * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
  * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
  * Otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find from begin of source.
  * @param { String } end - String to find from end source.
  *
  * @example
  * _.strIsolateInsideOrNone( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strIsolateInsideOrNone( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strIsolateInsideOrNone( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strIsolateInsideOrNone( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strIsolateInsideOrNone( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strIsolateInsideOrNone( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strIsolateInsideOrNone
  * @memberof wTools
  */

function strIsolateInsideOrNoneSingle( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let b = _.strLeft( src, begin );

  if( b.entry === undefined )
  return;

  let e = _.strRight( src, end );

  if( e.entry === undefined )
  return;

  if( e.index < b.index + b.entry.length )
  return;

  let result = [ src.substring( 0, b.index ), b.entry, src.substring( b.index + b.entry.length, e.index ), e.entry, src.substring( e.index+e.entry.length, src.length ) ];

  return result;
}

//

function strIsolateInsideOrNone( src, begin, end )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _.strIsolateInsideOrNoneSingle( src[ s ], begin, end );
    return result;
  }
  else
  {
    return _.strIsolateInsideOrNoneSingle( src, begin, end );
  }

}

//

function strIsolateInsideOrAllSignle( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let b = _.strLeft( src, begin );

  if( b.entry === undefined )
  b = { entry : '', index : 0 }

  let e = _.strRight( src, end );

  if( e.entry === undefined )
  e = { entry : '', index : src.length }

  if( e.index < b.index + b.entry.length )
  {
    e.index = src.length;
    e.entry = '';
  }

  let result = [ src.substring( 0, b.index ), b.entry, src.substring( b.index + b.entry.length, e.index ), e.entry, src.substring( e.index+e.entry.length, src.length ) ];

  return result;
}

//

function strIsolateInsideOrAll( src, begin, end )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _.strIsolateInsideOrAllSignle( src[ s ], begin, end );
    return result;
  }
  else
  {
    return _.strIsolateInsideOrAllSignle( src, begin, end );
  }

}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --


let Routines =
{

  strIsolate : _.routineFromPreAndBody( strIsolate_pre, strIsolate_body ),
  strIsolateLeftOrNone : _.routineFromPreAndBody( strIsolate_pre, strIsolateLeftOrNone_body ),
  strIsolateLeftOrAll : _.routineFromPreAndBody( strIsolate_pre, strIsolateLeftOrAll_body ),
  strIsolateRightOrNone : _.routineFromPreAndBody( strIsolate_pre, strIsolateRightOrNone_body ),
  strIsolateRightOrAll : _.routineFromPreAndBody( strIsolate_pre, strIsolateRightOrAll_body ),

  strIsolateInsideOrNoneSingle,
  strIsolateInsideOrNone,
  strIsolateInsideOrAllSignle,
  strIsolateInsideOrAll,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gString.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gString_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gString_s

( function gTime_s() { // == begin of file gTime_s
function gTime_s_naked() {
( function _gTime_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

// --
// time
// --

let _TimeInfinity = Math.pow( 2, 31 )-1;
function timeBegin( delay, onEnd )
{
  let timer = null;

  if( delay === undefined )
  delay = Infinity;

  if( delay >= _TimeInfinity )
  delay = _TimeInfinity;

  _.assert( arguments.length <= 4 );
  _.assert( _.numberIs( delay ) );

  if( arguments[ 2 ] !== undefined || arguments[ 3 ] !== undefined )
  onEnd = _.routineJoin.call( _, arguments[ 1 ], arguments[ 2 ], arguments[ 3 ] );

  if( delay > 0 )
  timer = setTimeout( out, delay );
  else
  timer = timeSoon( out );

  return timer;

  /* */

  function out()
  {
    if( onEnd )
    onEnd( timer );
  }

}

//

function timeEnd( timer )
{
  clearTimeout( timer );
  return timer;
}

//

function timeReady( onReady )
{

  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIs( arguments[ 0 ] ) || _.routineIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined );

  let time = 0;
  if( _.numberIs( arguments[ 0 ] ) )
  {
    time = arguments[ 0 ];
    onReady = arguments[ 1 ];
  }

  if( typeof window !== 'undefined' && typeof document !== 'undefined' && document.readyState != 'complete' )
  {
    let con = _.Consequence ? new _.Consequence({ tag : 'timeReady' }) : null;

    function handleReady()
    {
      if( _.Consequence )
      return _.timeOut( time, onReady ).finally( con );
      else if( onReady )
      _.timeBegin( time, onReady );
      else _.assert( 0 );
    }

    window.addEventListener( 'load', handleReady );
    return con;
  }
  else
  {
    if( _.Consequence )
    return _.timeOut( time, onReady );
    else if( onReady )
    _.timeBegin( time, onReady );
    else _.assert( 0 );
  }

}

//

function timeReadyJoin( context, routine, args )
{
  let joinedRoutine = _.routineJoin( context, routine, args );
  return _timeReady;
  function _timeReady()
  {
    let args = arguments;
    let joinedRoutine2 = _.routineSeal( this, joinedRoutine, args );
    return _.timeReady( joinedRoutine2 );
  }
}

//

function timeOnce( delay, onBegin, onEnd )
{
  let con = _.Consequence ? new _.Consequence() : undefined;
  let taken = false;
  let options;
  let optionsDefault =
  {
    delay : null,
    onBegin : null,
    onEnd : null,
  }

  if( _.objectIs( delay ) )
  {
    options = delay;
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assertMapHasOnly( options, optionsDefault );
    delay = options.delay;
    onBegin = options.onBegin;
    onEnd = options.onEnd;
  }
  else
  {
    _.assert( 2 <= arguments.length && arguments.length <= 3 );
  }

  _.assert( delay >= 0 );
  _.assert( _.primitiveIs( onBegin ) || _.routineIs( onBegin ) || _.objectIs( onBegin ) );
  _.assert( _.primitiveIs( onEnd ) || _.routineIs( onEnd ) || _.objectIs( onEnd ) );

  return function timeOnce()
  {

    if( taken )
    {
      /*console.log( 'timeOnce :', 'was taken' );*/
      return;
    }
    taken = true;

    if( onBegin )
    {
      if( _.routineIs( onBegin ) ) onBegin.apply( this, arguments );
      else if( _.objectIs( onBegin ) ) onBegin.take( arguments );
      if( con )
      con.take( null );
    }

    _.timeOut( delay, function()
    {

      if( onEnd )
      {
        if( _.routineIs( onEnd ) ) onEnd.apply( this, arguments );
        else if( _.objectIs( onEnd ) ) onEnd.take( arguments );
        if( con )
        con.take( null );
      }
      taken = false;

    });

    return con;
  }

}

//

/**
 * Routine creates timer that executes provided routine( onReady ) after some amout of time( delay ).
 * Returns wConsequence instance. {@link module:Tools/base/Consequence.wConsequence wConsequence}
 *
 * If ( onReady ) is not provided, timeOut returns consequence that gives empty message after ( delay ).
 * If ( onReady ) is a routine, timeOut returns consequence that gives message with value returned or error throwed by ( onReady ).
 * If ( onReady ) is a consequence or routine that returns it, timeOut returns consequence and waits until consequence from ( onReady ) resolves the message, then
 * timeOut gives that resolved message throught own consequence.
 * If ( delay ) <= 0 timeOut performs all operations on nextTick in node
 * @see {@link https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/#the-node-js-event-loop-timers-and-process-nexttick }
 * or after 1 ms delay in browser.
 * Returned consequence controls the timer. Timer can be easly stopped by giving an error from than consequence( see examples below ).
 * Important - Error that stops timer is returned back as regular message inside consequence returned by timeOut.
 * Also timeOut can run routine with different context and arguments( see example below ).
 *
 * @param {Number} delay - Delay in ms before ( onReady ) is fired.
 * @param {Function|wConsequence} onReady - Routine that will be executed with delay.
 *
 * @example
 * // Simplest, just timer
 * let t = _.timeOut( 1000 );
 * t.give( () => console.log( 'Message with 1000ms delay' ) )
 * console.log( 'Normal message' )
 *
 * @example
 * // Run routine with delay
 * let routine = () => console.log( 'Message with 1000ms delay' );
 * let t = _.timeOut( 1000, routine );
 * t.give( () => console.log( 'Routine finished work' ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // Routine returns consequence
 * let routine = () => new _.Consequence().take( 'msg' );
 * let t = _.timeOut( 1000, routine );
 * t.give( ( err, got ) => console.log( 'Message from routine : ', got ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // timeOut waits for long time routine
 * let routine = () => _.timeOut( 1500, () => 'work done' ) ;
 * let t = _.timeOut( 1000, routine );
 * t.give( ( err, got ) => console.log( 'Message from routine : ', got ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // how to stop timer
 * let routine = () => console.log( 'This message never appears' );
 * let t = _.timeOut( 5000, routine );
 * t.error( 'stop' );
 * t.give( ( err, got ) => console.log( 'Error returned as regular message : ', got ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // running routine with different context and arguments
 * function routine( y )
 * {
 *   let self = this;
 *   return self.x * y;
 * }
 * let context = { x : 5 };
 * let arguments = [ 6 ];
 * let t = _.timeOut( 100, context, routine, arguments );
 * t.give( ( err, got ) => console.log( 'Result of routine execution : ', got ) );
 *
 * @returns {wConsequence} Returns wConsequence instance that resolves message when work is done.
 * @throws {Error} If ( delay ) is not a Number.
 * @throws {Error} If ( onEnd ) is not a routine or wConsequence instance.
 * @function timeOut
 * @memberof wTools
 */

function timeOut_pre( routine, args )
{
  let o;

  _.assert( arguments.length === 2 );
  _.assert( args );

  // debugger;

  if( !_.mapIs( args[ 0 ] ) || args.length !== 1 )
  {
    let delay = args[ 0 ];
    let onEnd = args[ 1 ];

    if( onEnd !== undefined && !_.routineIs( onEnd ) && !_.consequenceIs( onEnd ) )
    {
      _.assert( args.length === 2, 'Expects two arguments if second one is not callable' );
      let returnOnEnd = onEnd;
      onEnd = function onEnd()
      {
        return returnOnEnd;
      }
    }
    else if( _.routineIs( onEnd ) && !_.consequenceIs( onEnd ) )
    {
      let _onEnd = onEnd;
      onEnd = function timeOutEnd()
      {
        let result = _onEnd.apply( this, arguments );
        return result === undefined ? null : result;
      }
    }

    _.assert( args.length <= 4 );

    if( args[ 1 ] !== undefined && args[ 2 ] === undefined && args[ 3 ] === undefined )
    _.assert( _.routineIs( onEnd ) || _.consequenceIs( onEnd ) );
    else if( args[ 2 ] !== undefined || args[ 3 ] !== undefined )
    _.assert( _.routineIs( args[ 2 ] ) );

    // if( args[ 2 ] !== undefined || args[ 3 ] !== undefined )
    // debugger;
    if( args[ 2 ] !== undefined || args[ 3 ] !== undefined )
    onEnd = _.routineJoin.call( _, args[ 1 ], args[ 2 ], args[ 3 ] );

    o = { delay, onEnd }

  }
  else
  {
    o = args[ 0 ];
  }

  // debugger;

  _.routineOptions( routine, o );
  _.assert( _.numberIs( o.delay ) );
  _.assert( o.onEnd === null || _.routineIs( o.onEnd ) );

  return o;
}

//

function timeOut_body( o )
{
  let con = _.Consequence ? new _.Consequence() : undefined;
  let timer = null;
  let handleCalled = false;

  _.assertRoutineOptions( timeOut_body, arguments );

  /* */

  if( con )
  {
    // debugger;
    con.procedure( 'timeOut' ).sourcePath( o.stackLevel + 2 );
    // debugger;
    con.give( function timeGot( err, arg )
    {
      if( err )
      clearTimeout( timer );
      con.take( err, arg );
    });
  }

  /* */

  timer = _.timeBegin( o.delay, timeEnd );

  // if( o.delay > 0 )
  // timer = _.timeBegin( o.delay, timeEnd );
  // else
  // timeSoon( timeEnd );

  return con;

  /* */

  function timeEnd()
  {
    let result;

    handleCalled = true;

    if( con )
    {
      if( o.onEnd )
      con.first( o.onEnd );
      else
      con.take( timeOut );
    }
    else
    {
      o.onEnd();
    }

  }

}

timeOut_body.defaults =
{
  delay : null,
  onEnd : null,
  stackLevel : 1,
}

let timeOut = _.routineFromPreAndBody( timeOut_pre, timeOut_body );

//

let timeSoon = typeof process === 'undefined' ? function( h ){ return setTimeout( h, 0 ) } : process.nextTick;

//

/**
 * Routine works moslty same like {@link wTools.timeOut} but has own small features:
 *  Is used to set execution time limit for async routines that can run forever or run too long.
 *  wConsequence instance returned by timeOutError always give an error:
 *  - Own 'timeOut' error message if ( onReady ) was not provided or it execution dont give any error.
 *  - Error throwed or returned in consequence by ( onRead ) routine.
 *
 * @param {Number} delay - Delay in ms before ( onReady ) is fired.
 * @param {Function|wConsequence} onReady - Routine that will be executed with delay.
 *
 * @example
 * // timeOut error after delay
 * let t = _.timeOutError( 1000 );
 * t.give( ( err, got ) => { throw err; } )
 *
 * @example
 * // using timeOutError with long time routine
 * let time = 5000;
 * let timeOut = time / 2;
 * function routine()
 * {
 *   return _.timeOut( time );
 * }
 * // orKeepingSplit waits until one of provided consequences will resolve the message.
 * // In our example single timeOutError consequence was added, so orKeepingSplit adds own context consequence to the queue.
 * // Consequence returned by 'routine' resolves message in 5000 ms, but timeOutError will do the same in 2500 ms and 'timeOut'.
 * routine()
 * .orKeepingSplit( _.timeOutError( timeOut ) )
 * .give( function( err, got )
 * {
 *   if( err )
 *   throw err;
 *   console.log( got );
 * })
 *
 * @returns {wConsequence} Returns wConsequence instance that resolves error message when work is done.
 * @throws {Error} If ( delay ) is not a Number.
 * @throws {Error} If ( onReady ) is not a routine or wConsequence instance.
 * @function timeOutError
 * @memberof wTools
 */

function timeOutError_body( o )
{
  _.assert( _.routineIs( _.Consequence ) );
  _.assertRoutineOptions( timeOutError_body, arguments );

  let stackLevel = o.stackLevel;

  o.stackLevel += 1;
  let con = _.timeOut.body.call( _, o );

  con.tag = 'TimeOutError';
  con.procedure( 'timeOutError' ).sourcePath( stackLevel + 2 );
  con.finally( function( err, arg )
  {
    if( err )
    return _.Consequence().error( err );

    err = _.err( 'Time out!' );

    Object.defineProperty( err, 'timeOut',
    {
      enumerable : false,
      configurable : false,
      writable : false,
      value : 1,
    });

    return _.Consequence().error( err );
  });

  return con;
}

timeOutError_body.defaults = Object.create( timeOut_body.defaults );

let timeOutError = _.routineFromPreAndBody( timeOut_pre, timeOutError_body );

//

function timePeriodic( delay, onReady )
{
  _.assert( _.routineIs( _.Consequence ) );
  let con = new _.Consequence();
  let id;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  // if( arguments.length > 2 )
  // {
  //   throw _.err( 'Not tested' );
  //   _.assert( arguments.length <= 4 );
  //   onReady = _.routineJoin( arguments[ 2 ], onReady[ 3 ], arguments[ 4 ] );
  // }

  _.assert( _.numberIs( delay ) );

  function handlePeriodicCon( err )
  {
    if( err ) clearInterval( id );
  }

  let _onReady = null;

  if( _.routineIs( onReady ) )
  _onReady = function()
  {
    let result = onReady.call();
    if( result === false )
    clearInterval( id );
    _.Consequence.take( con, undefined );
    con.finally( handlePeriodicCon );
  }
  else if( onReady instanceof wConsquence )
  _onReady = function()
  {
    let result = onReady.ping();
    if( result === false )
    clearInterval( id );
    _.Consequence.take( con, undefined );
    con.finally( handlePeriodicCon );
  }
  else if( onReady === undefined )
  _onReady = function()
  {
    _.Consequence.take( con, undefined );
    con.finally( handlePeriodicCon );
  }
  else throw _.err( 'unexpected type of onReady' );

  id = setInterval( _onReady, delay );

  return con;
}

//

function _timeNow_functor()
{
  let now;

  // _.assert( arguments.length === 0 );

  if( typeof performance !== 'undefined' && performance.now !== undefined )
  now = _.routineJoin( performance, performance.now );
  else if( Date.now )
  now = _.routineJoin( Date, Date.now );
  else
  now = function(){ return Date().getTime() };

  return now;
}

//

function timeFewer_functor( perTime, routine )
{
  let lastTime = _.timeNow() - perTime;

  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( perTime ) );
  _.assert( _.routineIs( routine ) );

  return function fewer()
  {
    let now = _.timeNow();
    let elapsed = now - lastTime;
    if( elapsed < perTime )
    return;
    lastTime = now;
    return routine.apply( this, arguments );
  }

}

//

function timeFrom( time )
{
  _.assert( arguments.length === 1 );
  if( _.numberIs( time ) )
  return time;
  if( _.dateIs( time ) )
  return time.getTime()
  _.assert( 0, 'Not clear how to coerce to time', _.strType( time ) );
}

//

function timeSpent( description, time )
{
  let now = _.timeNow();

  if( arguments.length === 1 )
  {
    time = arguments[ 0 ];
    description = '';
  }

  _.assert( 1 <= arguments.length && arguments.length <= 2 );
  _.assert( _.numberIs( time ) );
  _.assert( _.strIs( description ) );

  // if( description && description !== ' ' )
  // description = description;

  let result = description + _.timeSpentFormat( now-time );

  return result;
}

//

function timeSpentFormat( spent )
{
  let now = _.timeNow();

  _.assert( 1 === arguments.length );
  _.assert( _.numberIs( spent ) );

  let result = ( 0.001*( spent ) ).toFixed( 3 ) + 's';

  return result;
}

//

function dateToStr( date )
{
  let y = date.getFullYear();
  let m = date.getMonth() + 1;
  let d = date.getDate();
  if( m < 10 ) m = '0' + m;
  if( d < 10 ) d = '0' + d;
  let result = [ y, m, d ].join( '.' );
  return result;
}

//

// let _timeSleepBuffer = new Int32Array( new SharedArrayBuffer( 4 ) );
// function timeSleep( time )
// {
//   _.assert( time >= 0 );
//   Atomics.wait( _timeSleepBuffer, 0, 1, time );
// }
//
// //
//
// function timeSleepUntil( o )
// {
//   if( _.routineIs( o ) )
//   o = { onCondition : o }
//
//   if( o.periodicity === undefined )
//   o.periodicity = timeSleepUntil.defaults.periodicity;
//
//   let i = 0;
//   while( !o.onCondition() )
//   {
//     _.timeSleep( o.periodicity );
//   }
//
//   return true;
// }
//
// timeSleepUntil.defaults =
// {
//   onCondition : null,
//   periodicity : 100,
// }

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  timeBegin,
  timeEnd,

  timeReady,
  timeReadyJoin,
  timeOnce,
  timeOut,
  timeSoon,
  timeOutError,

  timePeriodic, /* dubious */

  _timeNow_functor,
  timeNow : _timeNow_functor(),

  timeFewer_functor,

  timeFrom,
  timeSpent,
  timeSpentFormat,
  dateToStr,

  // timeSleep, /* experimental */
  // timeSleepUntil, /* experimental */

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/gTime.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, gTime_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file gTime_s

( function rFundamental_s() { // == begin of file rFundamental_s
function rFundamental_s_naked() {
// ( function _aFundamental_s_() {
//
// 'use strict';
//
// // fast access
//
// let _global = _global_;
// let _ = _global_.wTools;
// let Self = _global_.wTools;
//
// let _ArrayIndexOf = Array.prototype.indexOf;
// let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
// let _ArraySlice = Array.prototype.slice;
// let _ArraySplice = Array.prototype.splice;
// let _FunctionBind = Function.prototype.bind;
// let _ObjectToString = Object.prototype.toString;
// let _ObjectHasOwnProperty = Object.hasOwnProperty;
// let _propertyIsEumerable = Object.propertyIsEnumerable;
// let _ceil = Math.ceil;
// let _floor = Math.floor;
//
// // --
// // meta
// // --
//
// _.Later = function Later()
// {
//   let d = Object.create( null );
//   d.args = arguments;
//   _.Later._lates.push( d );
//   return d;
// }
//
// //
//
// _.Later.replace = function replace( container )
// {
//   if( arguments.length !== 1 || !container )
//   throw Error( 'Expects single argument {-container-}' );
//   if( !_.Later._lates.length )
//   throw Error( 'No late was done' );
//
//   // debugger;
//   let descriptors = _.Later._associatedMap.get( container ) || [];
//   _.Later._associatedMap.set( container, descriptors );
//   _.Later._lates.forEach( ( d ) =>
//   {
//     d.container = container;
//     // _.Later._associatedLates.push( d );
//     descriptors.push( d );
//   });
//   _.Later._lates = [];
//   // debugger;
//
// }
//
// //
//
// _.Later.for = function for_( container )
// {
//   if( arguments.length !== 1 || !container )
//   throw Error( 'Expects single argument {-container-}' );
//
//   let descriptors = _.Later._associatedMap.get( container );
//   _.Later._associatedMap.delete( container );
//
//   if( !descriptors )
//   throw Error( 'No laters for {-container-} was made' );
//
//   // debugger;
//
//   for( let k in container )
//   {
//     let d = container[ k ];
//     let i = descriptors.indexOf( d );
//     if( i !== -1 )
//     {
//       descriptors.splice( i,1 );
//       _.Later._for( k,d );
//     }
//   }
//
//   // debugger;
//
//   if( descriptors.length )
//   throw Error( 'Some laters was not found in the {-container-}' );
//
// }
//
// //
//
// _.Later._for = function _for( key, descriptor )
// {
//
//   if( descriptor.args.length === 3 )
//   if( !_.arrayIs( descriptor.args[ 2 ] ) )
//   descriptor.args[ 2 ] = [ descriptor.args[ 2 ] ];
//
//   // debugger;
//   descriptor.container[ key ] = _.routineCall.apply( _, descriptor.args );
//   // debugger;
//
// }
//
// //
//
// _.Later._lates = [];
// _.Later._associatedMap = new Map();
//
// // --
// // fields
// // --
//
// let Fields =
// {
// }
//
// // --
// // routines
// // --
//
// let Routines =
// {
//
// }
//
// //
//
// Object.assign( Self, Routines );
// Object.assign( Self, Fields );
//
// _.assert( !Self.Array );
//
// // _.assert( !Self.array );
// // _.assert( !Self.withArray );
// // _.assert( _.objectIs( _.strIsolateBeginOrAll ) )
// // _.assert( _.objectIs( _.regexpsEscape ) );
//
// // _.Later.replace( Self );
//
// // --
// // export
// // --
//
// if( typeof module !== 'undefined' )
// if( _global.WTOOLS_PRIVATE )
// { /* delete require.cache[ module.id ]; */ }
//
// if( typeof module !== 'undefined' && module !== null )
// module[ 'exports' ] = Self;
//
// })();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/rFundamental.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, rFundamental_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file rFundamental_s

( function zSetup_s() { // == begin of file zSetup_s
function zSetup_s_naked() {
(function _zSetup_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools;
let Self = _global.wTools;

// --
// setup
// --

function _setupUnhandledErrorHandler1()
{

  if( !_global._setupUnhandledErrorHandlerDone )
  {
    debugger;
    throw Error( 'setup0 should be called first' );
  }

  if( _global._setupUnhandledErrorHandlerDone > 1 )
  return;

  _global._setupUnhandledErrorHandlerDone = 2;

  /* */

  if( _global.process && _.routineIs( _global.process.on ) )
  {
    Self._handleUnhandledError1 = handleNodeError;
  }
  else if( Object.hasOwnProperty.call( _global,'onerror' ) )
  {
    Self._handleUnhandledError1 = handleBrowserError;
  }

  /* */

  function handleBrowserError( message, sourcePath, lineno, colno, error )
  {

    let err = error;
    if( _._err )
    err = _._err
    ({
      args : [ error ],
      level : 1,
      fallBackStack : 'at handleError @ ' + sourcePath + ':' + lineno,
      location :
      {
        path : sourcePath,
        line : lineno,
        col : colno,
      },
    });

    return handleError( err );
  }

  /* */

  function handleNodeError( err )
  {
    return handleError( err );
  }

  /* */

  function handleError( err )
  {
    let prefix = '------------------------------- unhandled errorr ------------------------------->\n';
    let postfix = '------------------------------- unhandled errorr -------------------------------<\n';

    /* */

    try
    {
      if( _.errIsAttended( err ) )
      return
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }

    /* */

    if( _.appExitCode )
    try
    {
      _.appExitCode( -1 )
    }
    catch( err2 )
    {
      debugger;
      console.log( err2 );
    }

    /* */

    console.error( prefix );

    /* */

    try
    {
      console.error( ' * Application' );
      console.error( _.diagnosticApplicationEntryPointInfo() + '\n' );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }

    /* */

    if( !err.originalMessage && _.objectLike && _.objectLike( err ) )
    try
    {
      let serr = _.toStr && _.field ? _.toStr.fields( err,{ errorAsMap : 1 } ) : err;
      console.error( err );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }

    try
    {
      if( _.errLog )
      _.errLog( err );
      else
      console.error( err );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
      console.error( err );
    }

    console.error( postfix );
    debugger;

  }

}

//

function _setupConfig()
{

  // if( _global.WTOOLS_PRIVATE )
  // return;

  if( _global.__GLOBAL_WHICH__ !== 'real' )
  return;

  if( !_global.Config )
  _global.Config = Object.create( null );

  if( _global.Config.debug === undefined )
  _global.Config.debug = true;

  _global.Config.debug = !!_global.Config.debug;

}

//

function _setupLoggerPlaceholder()
{

  if( !_global.console.debug )
  _global.console.debug = function debug()
  {
    this.log.apply( this,arguments );
  }

  if( !_global.logger )
  _global.logger =
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

  if( !_global.wTestSuite )
  _global.wTestSuite = function wTestSuite( testSuit )
  {

    if( !_realGlobal_.wTests )
    _realGlobal_.wTests = Object.create( null );

    if( !testSuit.suiteFilePath )
    testSuit.suiteFilePath = _.diagnosticLocation( 1 ).path;

    if( !testSuit.suiteFileLocation )
    testSuit.suiteFileLocation = _.diagnosticLocation( 1 ).full;

    _.assert( _.strDefined( testSuit.suiteFileLocation ),'Test suit expects a mandatory option ( suiteFileLocation )' );
    _.assert( _.objectIs( testSuit ) );

    if( !testSuit.abstract )
    _.assert( !_realGlobal_.wTests[ testSuit.name ],'Test suit with name "' + testSuit.name + '" already registered!' );
    _realGlobal_.wTests[ testSuit.name ] = testSuit;

    testSuit.inherit = function inherit()
    {
      this.inherit = _.longSlice( arguments );
    }

    return testSuit;
  }

  /* */

  if( !_realGlobal_.wTester )
  {
    _realGlobal_.wTester = Object.create( null );
    _realGlobal_.wTester.test = function test( testSuitName )
    {
      if( _.workerIs() )
      return;
      _.assert( arguments.length === 0 || arguments.length === 1 );
      _.assert( _.strIs( testSuitName ) || testSuitName === undefined, 'test : expects string {-testSuitName-}' );
      debugger;
      _.timeReady( function()
      {
        debugger;
        if( _realGlobal_.wTester.test === test )
        throw _.err( 'Cant wTesting.test, missing wTesting package' );
        _realGlobal_.wTester.test.call( _realGlobal_.wTester, testSuitName );
      });
    }
  }

}

//

function _setup1()
{

  Self._sourcePath = _.diagnosticStack([ 1, Infinity ]);

  _.assert( _global._WTOOLS_SETUP_EXPECTED_ !== false );

  if( _global._WTOOLS_SETUP_EXPECTED_ !== false )
  {
    _._setupConfig();
    _._setupUnhandledErrorHandler1();
    _._setupLoggerPlaceholder();
    _._setupTesterPlaceholder();
  }

  _.assert( !!Self.timeNow );

}

// --
// routines
// --

let Routines =
{

  _setupUnhandledErrorHandler1,

  _setupConfig,
  _setupLoggerPlaceholder,
  _setupTesterPlaceholder,

  _setup1,

}

Object.assign( Self,Routines );

Self._setup1();

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/zSetup.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l1/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, zSetup_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file zSetup_s

( function IncludeTools_s() { // == begin of file IncludeTools_s
function IncludeTools_s_naked() {
( function _IncludeTools_s_() {

'use strict';

//

var usingSinglePath = 0;
var Self = _global_.wTools;
var _global = _global_;
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

_global.ModulesRegistry = _global.ModulesRegistry || Object.create( null );

// _global.ModulesRegistry.ModulesRegistry =
// {
//   includeAny : [ '../../abase/l3/ModulesRegistry.s','l3/ModulesRegistry.s','wmodulesregistry' ],
//   isIncluded : function(){ return Object.keys( _global.ModulesRegistry ).length > 3 },
// }

// --
// routines
// --

function usePath( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );

  if( _.path && _.path.refine )
  src = _.path.refine( src );

  if( typeof module !== 'undefined' && module.paths )
  if( module.paths.indexOf( src ) === -1 )
  module.paths.push( src );

}

//

function usePathGlobally( paths )
{

  if( _.strIs( paths ) )
  paths = [ paths ];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.arrayIs( paths ) );

  debugger;
  if( _.path.nativize && _.path.refine )
  {
    for( var p = 0 ; p < paths.length ; p++ )
    {
      paths[ p ] = _.path.nativize( _.path.resolve( paths[ p ] ) );
      console.log( 'usePathGlobally',paths[ p ] );
    }
  }

  return _usePathGlobally( module, paths, [] );
}

//

function _usePathGlobally( _module,paths,visited )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.arrayIs( paths ) );

  if( visited.indexOf( _module ) !== -1 )
  return;

  if( !Module )
  Module = require( 'module' );

  for( let p = 0 ; p < paths.length ; p++ )
  if( Module.globalPaths.indexOf( paths[ p ] ) === -1 )
  Module.globalPaths.push( paths[ p ] );

  // [].push.apply( Module.globalPaths, paths );

  /* patch parents */

  while( _module )
  {
    _usePathGloballyChildren( _module, paths, visited );
    _module = _module.parent;
  }

}

//

function _usePathGloballyChildren( _module, paths, visited )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.arrayIs( paths ) );

  if( visited.indexOf( _module ) !== -1 )
  return;

  visited.push( _module );

  for( let p = 0 ; p < paths.length ; p++ )
  if( _module.paths.indexOf( paths[ p ] ) === -1 )
  _module.paths.push( paths[ p ] );

  // [].push.apply( _module.paths, paths );

  /* patch parents */

  if( _module.children )
  for( var c = 0 ; c < _module.children.length ; c++ )
  _usePathGloballyChildren( _module.children[ c ], paths, visited );

}

//

function _includeWithRequireAct( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ),'include expects string' );

  /* console.log( '_includeWithRequireAct', '"' + src + '"' ); */

  if( typeof module !== 'undefined' )
  try
  {
    // if( _.strHas( src, 'Consequence' ) )
    // debugger;
    return __include( src );
  }
  catch( err )
  {
    debugger;
    throw _.err( err, '\n', 'Cant require', src );
  }
  else throw _.err( 'Cant include, no "require".' );

}

//

function _includeAct( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );

  var handler;
  if( _global.ModulesRegistry[ src ] )
  handler = _global.ModulesRegistry[ src ];

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
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( srcs ) );

  /* */

  var paths = [];
  for( var s = 0 ; s < srcs.length ; s++ )
  {
    var src = srcs[ s ];
    var handler = _global.ModulesRegistry[ src ];

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
      paths.push({ path : handler.include, handler }); debugger;
    }
    else if( handler.includeAny )
    {
      _.assert( _.arrayIs( handler.includeAny ),'include handler expect an array ( includeAny ) if present' );
      for( var p = 0 ; p < handler.includeAny.length ; p++ )
      paths.push({ path : handler.includeAny[ p ], handler });
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

  if( _.longIs( src ) )
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

  if( _.longIs( src ) )
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
    var resolved;

    if( src !== '' )
    try
    {
      resolved = __include.resolve( src );
      // src = resolved;
    }
    catch( err )
    {
      if( a !== arguments.length-1 && !usingSinglePath )
      continue;
    }

    if( a === arguments.length-1 && src === '' )
    return;

    var result = _includeWithRequireAct( resolved || arguments[ 0 ] );
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
  if( _global.ModulesRegistry[ src ] )
  handler = _global.ModulesRegistry[ src ];

  if( !handler )
  return false;

  if( !handler.isIncluded )
  return false;

  return handler.isIncluded();
}

// --
// declare
// --

var Proto =
{

  /* xxx qqq : comment out maybe !!! */

  usePath,
  usePathGlobally,
  _usePathGlobally,
  _usePathGloballyChildren,

  //

  _includeWithRequireAct,
  _includeAct,
  _includeAnyAct,

  _includeWithRequire,
  include,

  _includeWithRequireAny,
  includeAny,

  isIncluded,

}

_.mapExtend( Self, Proto );

if( _.usePath && typeof __dirname !== 'undefined' )
_.usePath( __dirname + '/../..' );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/IncludeTools.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, IncludeTools_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file IncludeTools_s

( function ModulesRegistry_s() { // == begin of file ModulesRegistry_s
function ModulesRegistry_s_naked() {
( function _ModulesRegistry_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools;
if( !Object.hasOwnProperty.call( _global, 'ModuleRegistry' ) )
_global.ModulesRegistry = Object.create( null );
let Self = _global.ModulesRegistry;

/**
 * @typedef {Object} ModulesRegistry - Map that contains info about modules, is uses by {@link wTools.include}.
 * @memberof wTools
 */

// --
// helper
// --

function includeAny( filePath, name )
{
  _.assert( arguments.length === 2 );
  return [ '../../' + filePath, filePath, name ];
}

// --
// include map
// --

// base / l3

// let wNameTools =
// {
//   includeAny : includeAny( 'abase/l3/NameTools.s', 'wNameTools' ),
//   isIncluded : function(){ return !!_global.wTools && !!_global.wTools.idWithInt; },
// }

let wEntityBasic =
{
  includeAny : includeAny( 'abase/l3/Entity.s', 'wentitybasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityVals; },
}

let wLooker =
{
  includeAny : includeAny( 'abase/l3/Looker.s', 'wlooker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.look; },
}

let wPathBasic =
{
  includeAny : includeAny( 'abase/l3/Path.s', 'wpathbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.path },
}

let wRoutineBasic =
{
  includeAny : includeAny( 'abase/l3/RoutineFundamentals.s', 'wroutinebasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.exec },
}

let wProto =
{
  includeAny : includeAny( 'abase/l3/Proto.s', 'wProto' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.mixinDelcare },
}

let wStringer =
{
  includeAny : includeAny( 'abase/l3/Stringer.s', 'wstringer' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Stringer; },
}

// base / l4

let wReplicator =
{
  includeAny : includeAny( 'abase/l4/Replicator.s', 'wreplicator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.replicate; },
}

let wLookerExtra =
{
  includeAny : includeAny( 'abase/l4/LookerExtra.s', 'wlookerextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entitySearch },
}

let wArraySorted =
{
  includeAny : includeAny( 'abase/l4/ArraySorted.s', 'warraysorted' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.sorted },
}

let wArraySparse =
{
  includeAny : includeAny( 'abase/l4/ArraySparse.s', 'warraysparse' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.sparse },
}

let wAppBasic =
{
  includeAny : includeAny( 'abase/l4/External.s', 'wappbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.shell },
}

let wUriBasic =
{
  includeAny : includeAny( 'abase/l4/Uri.s', 'wuribasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.uri },
}

let wTraverser =
{
  includeAny : includeAny( 'abase/l4/Traverser.s', 'wtraverser' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._traverse },
}

let wRoutineTransform =
{
  includeAny : includeAny( 'abase/l4/RoutineTransform.s', 'wroutinetransform' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.routineNew },
}

// base / l5

let wSelector =
{
  includeAny : includeAny( 'abase/l5/Selector.s', 'wselector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.select; },
}

let wWebUriBasic =
{
  includeAny : includeAny( 'abase/l5/WebUri.s', 'wweburibasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.weburi },
}

let wCloner =
{
  includeAny : includeAny( 'abase/l5/Cloner.s', 'wcloner' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._clone },
}

let wStringsExtra =
{
  includeAny : includeAny( 'abase/l5/StringTools.s', 'wstringsextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.strSorterParse; },
}

// base / l6

let wEqualer =
{
  includeAny : includeAny( 'abase/l6/LookerComparator.s', 'wequaler' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityIdentical },
}

let wSelectorExtra =
{
  includeAny : includeAny( 'abase/l6/SelectorExtra.s', 'wselectorextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityProbe; },
}

// base / l7_mixin

let wConsequizer =
{
  includeAny : includeAny( 'abase/l7_mixin/Consequizer.', 'wconsequizer' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Consequizer; },
}

let wCopyable =
{
  includeAny : includeAny( 'abase/l7_mixin/Copyable.s', 'wCopyable' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Copyable; },
}

let wInstancing =
{
  includeAny : includeAny( 'abase/l7_mixin/Instancing.s', 'winstancing' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Instancing; },
}

let wEventHandler =
{
  includeAny : includeAny( 'abase/l7_mixin/EventHandler.s', 'wEventHandler' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.EventHandler; },
}

let wFieldsStack =
{
  includeAny : includeAny( 'abase/l7_mixin/FieldsStack.s', 'wfieldsstack' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FieldsStack; },
}

// base / l8

let wProcedure =
{
  includeAny : includeAny( 'abase/l8/Procedure.s', 'wprocedure' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.procedure },
}

let wGdfStrategy =
{
  includeAny : includeAny( 'abase/l8/GdfConverter.s', 'wgdfstrategy' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Gdf },
}

let wBaseEncoder =
{
  includeAny : includeAny( 'abase/l4/Encoder.s', 'wbaseencoder' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.encode },
}

// base / l9

let wLogger =
{
  includeAny : includeAny( 'abase/l9/printer/top/Logger.s', 'wLogger' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Logger; },
}

let wPrinterToFile =
{
  includeAny : includeAny( 'abase/l9/printer/top/ToFile.ss', 'wloggertofile' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PrinterToFile; },
}

let wPrinterToJs =
{
  includeAny : includeAny( 'abase/l9/printer/top/ToJstructure.s', 'wloggertojs' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PrinterToJs; },
}

let wConsequence =
{
  includeAny : includeAny( 'abase/l9/consequence/Consequence.s', 'wConsequence' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Consequence; },
}

// abase_dom

let wDomBaseLayer1 =
{
  includeAny : includeAny( 'abase_dom/l1/Common.js', 'wdombaselayer1' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBaselayer1Loaded },
}

let wDomBaseLayer3 =
{
  includeAny : includeAny( 'abase_dom/l3/Common.js', 'wdombaselayer3' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBaselayer3Loaded },
}

let wDomBaseLayer5 =
{
  includeAny : includeAny( 'abase_dom/l5/Common.js', 'wdombasel5' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBasel5Loaded },
}

// amid

let wRegexpObject =
{
  includeAny : includeAny( 'amid/bclass/RegexpObject.s', 'wRegexpObject' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.RegexpObject; },
}

let wColor =
{
  includeAny : includeAny( 'amid/color/Color.s', 'wColor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ColorMap },
}

let wColor256 =
{
  includeAny : includeAny( 'amid/color/Color256.s', 'wColor256' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ColorMap && Object.keys( _global.wTools.ColorMap ).length > 100 },
}

let wChangeTransactor =
{
  includeAny : includeAny( 'amid/changes/ChangeTransactor.s', 'wChangeTransactor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ChangeTransactor },
}

let wVocabulary =
{
  includeAny : includeAny( 'amid/bclass/Vocabulary.s', 'wvocabulary' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Vocabulary },
}

let wCommandsAggregator =
{
  includeAny : includeAny( 'amid/l7/Commands/CommandsAggregator.s', 'wcommandsaggregator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CommandsAggregator },
}

let wCommandsConfig =
{
  includeAny : includeAny( 'amid/l7/commands/mixin/CommandsConfig.s', 'wcommandsconfig' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CommandsConfig },
}

let wFiles =
{
  includeAny : includeAny( 'amid/files/UseTop.s', 'wFiles' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider },
}

let wFilesArchive =
{
  includeAny : includeAny( 'amid/files/IncludeArchive.s', 'wfilesarchive' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesArchive },
}

let wFilesEncoders =
{
  includeAny : includeAny( 'amid/files/l1/EncodersExtended.s', 'wfilesencoders' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FileReadEncoders && !!_global.wTools.FileReadEncoders.yml },
}

let wFilesSvn =
{
  includeAny : includeAny( 'amid/files/fprovider/pSvn.ss', 'wFilesSvn' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Svn },
}

let wTimeMarker =
{
  includeAny : includeAny( 'amid/amixin/TimeMarker.s', 'wtimemarker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TimeMarker },
}

let wVerbal =
{
  includeAny : includeAny( 'amid/amixin/Verbal.s', 'wverbal' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Verbal },
}

let wStateStorage =
{
  includeAny : includeAny( 'amid/amixin/aStateStorage.s', 'wstatestorage' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StateStorage },
}

let wStateSession =
{
  includeAny : includeAny( 'amid/amixin/StateSession.s', 'wstatesession' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StateSession },
}

let wStager =
{
  includeAny : includeAny( 'amid/l3/stager/Stager.s', 'wstager' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Stager },
}

let wFileExecutor =
{
  includeAny : includeAny( 'amid/l7/executor/FileExecutor.s', 'wFileExecutor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.wFileExecutor },
}

let wFileExecutorHtmlFormatters =
{
  includeAny : includeAny( 'amid/l7/executor/HtmlFormatters.s', 'wFileExecutorHtmlFormatters' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FileExecutorHtmlFormatters },
}

let wPathTranslator =
{
  includeAny : includeAny( 'amid/l5_mapper/PathTranslator.s', 'wpathtranslator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PathTranslator },
}

let wNameMapper =
{
  includeAny : includeAny( 'amid/l5_mapper/NameMapper.s', 'wnamemapper' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.NameMapper },
}

let wTemplateTreeResolver =
{
  includeAny : includeAny( 'amid/l5_mapper/TemplateTreeAresolver.s', 'wtemplatetreeresolver' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeResolver },
}

let wTemplateTreeEnvironment =
{
  includeAny : includeAny( 'amid/l5_mapper/TemplateTreeEnvironment.s', 'wtemplatetreeenvironment' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeEnvironment },
}

let wTemplateFileWriter =
{
  includeAny : includeAny( 'amid/l5_mapper/TemplateFileWriter.s', 'wtemplatefilewriter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateFileWriter },
}

let wGraph =
{
  includeAny : includeAny( 'amid/agraph/UseTop.s', 'wgraphbase' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.graph },
}

let wGraphLive =
{
  includeAny : includeAny( 'amid/agraph/UseLive.s', 'wgraphlive' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.LiveSystem },
}

let wSchema =
{
  includeAny : includeAny( 'amid/schema/Top.s', 'wSchema' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.schema },
}

let wScriptLauncher =
{
  includeAny : includeAny( 'amid/launcher/ScriptLauncher.s', 'wscriptlauncher' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ScriptLauncher },
}

let wExchangePoint =
{
  includeAny : includeAny( 'amid/exchangePoint/ExchangePoint.s', 'wExchangePoint' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ExchangePoint },
}

let wCommunicator =
{
  includeAny : includeAny( 'amid/communicator/Communicator.s', 'wCommunicator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Communicator },
}

let wIncubator =
{
  includeAny : includeAny( 'amid/worker/Incubator.s', 'wIncubator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Incubator },
}

let wCollectionOfInstances =
{
  includeAny : includeAny( 'amid/container/CollectionOfInstances.s', 'wcollectionofinstances' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CollectionOfInstances },
}

let wStarterMaker =
{
  includeAny : includeAny( 'amid/starter/StarterMaker.s', 'wstartermaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StarterMaker },
}

// amid / l5

let wBitmask =
{
  includeAny : includeAny( 'amid/l5_mapper/Bitmask.s', 'wBitmask' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Bitmask },
}

// math

let wMathScalar =
{
  includeAny : includeAny( 'amath/l1/Scalar.s', 'wmathscalar' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.clamp },
}

let wMathVector =
{
  includeAny : includeAny( 'amath/l3_vector/Main.s', 'wmathvector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.vector },
}

let wMathSpace =
{
  includeAny : includeAny( 'amath/l5_space/Main.s', 'wmathspace' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Space },
}

let wMathConcepts =
{
  includeAny : includeAny( 'amath/l8/Concepts.ss', 'wmathconcepts' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.box },
}

// top

let wTesting =
{
  includeAny : includeAny( 'atop/tester/MainTop.s', 'wTesting' ),
  isIncluded : function(){ return _realGlobal_.wTester && _realGlobal_.wTester._isReal_; },
}

let wTranspilationStrategy =
{
  includeAny : includeAny( 'atop/transpilationStrategy/MainBase.s', 'wtranspilationstrategy' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TranspilationStrategy },
}

let wFilesOperationsDirector =
{
  includeAny : includeAny( 'atop/files/OperationsDirector.s', 'wfilesoperationsdirector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesOperationsDirector },
}

let wFilesLinker =
{
  includeAny : includeAny( 'atop/files/Linker.s', 'wfileslinker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesLinker },
}

let wBaker =
{
  includeAny : includeAny( 'atop/baker/Baker.s', 'wBaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Baker },
}

let wBakerWithFileExecutor =
{
  includeAny : includeAny( 'atop/baker/BakerWithFileExecutor.s', 'wBakerWithFileExecutor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.wBakerWithFileExecutor },
}

let wMaker =
{
  includeAny : includeAny( 'atop/maker/Maker.s', 'wMaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Maker },
}

let wServlet =
{
  includeAny : includeAny( 'atop/servlet/Servlet.ss', 'wServlet' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.servlet },
}

// --
// declare
// --

let Extend =
{

  // base / l3

  wLooker,
  wPathBasic,
  wRoutineBasic,
  wProto,

  // base / l4

  wReplicator,
  wLookerExtra,
  wArraySorted,
  wArraySparse,
  wAppBasic,
  wUriBasic,
  wTraverser,
  wStringer,
  wRoutineTransform,

  // base / l5

  wSelector,
  wWebUriBasic,
  wCloner,
  wStringsExtra,

  // base / l6

  wEqualer,
  wSelectorExtra,

  // base / l7_mixin

  wConsequizer,
  wCopyable,
  wInstancing,
  wEventHandler,
  wFieldsStack,

  // base / l8

  wProcedure,
  wGdfStrategy,
  wBaseEncoder,

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

  wRegexpObject,
  wColor,
  wColor256,
  wChangeTransactor,
  wVocabulary,
  wCommandsAggregator,
  wCommandsConfig,
  wFiles,
  wFilesArchive,
  wFilesEncoders,
  wFilesSvn,
  wTimeMarker,
  wVerbal,
  wStateStorage,
  wStateSession,
  wStager,
  wFileExecutor,
  wFileExecutorHtmlFormatters,

  wPathTranslator,
  wNameMapper,
  wTemplateTreeResolver,
  wTemplateTreeEnvironment,
  wTemplateFileWriter,

  wGraph,
  wGraphLive,
  wSchema,
  wScriptLauncher,
  wExchangePoint,
  wCommunicator,
  wIncubator,
  wCollectionOfInstances,
  wStarterMaker,

  // amid / l5

  wBitmask,

  // math

  wMathScalar,
  wMathVector,
  wMathSpace,
  wMathConcepts,

  // top

  wTesting,
  wTranspilationStrategy,
  wFilesOperationsDirector,
  wFilesLinker,
  wBaker,
  wBakerWithFileExecutor,
  wMaker,
  wServlet,

}

Object.assign( Self, Extend );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/ModulesRegistry.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, ModulesRegistry_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file ModulesRegistry_s

( function NameTools_s() { // == begin of file NameTools_s
function NameTools_s_naked() {
( function _NameTools_s_() {

'use strict';

var Self = _global_.wTools;
var _global = _global_;
var _ = _global_.wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

// var __assert = _.assert;
var _arraySlice = _.longSlice;

// --
// name and symbol
// --

/**
 * Produce fielded name from string.
 * @param {string} nameString - object coded name or string.
 * @return {object} nameKeyValue - name in key/value format.
 * @method nameFielded
 * @memberof wTools
 */

function nameFielded( nameString )
{

  if( _.objectIs( nameString ) )
  {
    return nameString;
  }
  else if( _.strIs( nameString ) )
  {
    var name = {};
    name[ nameString ] = nameString;
    return name;
  }
  else _.assert( 0, 'nameFielded :', 'Expects string or ' );

}

//

/**
 * Returns name splitted in coded/raw fields.
 * @param {object} nameObject - fielded name or name as string.
 * @return {object} name splitted in coded/raw fields.
 * @method nameUnfielded
 * @memberof wTools
 */

function nameUnfielded( nameObject )
{
  var name = {};

  if( _.mapIs( nameObject ) )
  {
    var keys = Object.keys( nameObject );
    _.assert( keys.length === 1 );
    name.coded = keys[ 0 ];
    name.raw = nameObject[ name.coded ];
  }
  else if( _.strIs( nameObject ) )
  {
    name.raw = nameObject;
    name.coded = nameObject;
  }
  else if( _.symbolIs( nameObject ) )
  {
    name.raw = nameObject;
    name.coded = nameObject;
  }
  else _.assert( 0, 'nameUnfielded :', 'Unknown arguments' );

  // _.assert( arguments.length === 1 );
  // _.assert( _.strIs( name.raw ) || _.symbolIs( name.raw ), 'nameUnfielded :', 'not a string, something wrong :', nameObject );
  // _.assert( _.strIs( name.coded ) || _.symbolIs( name.coded ), 'nameUnfielded :', 'not a string, something wrong :', nameObject );

  return name;
}

//

/**
 * Returns name splitted in coded/coded fields. Drops raw part replacing it by coded.
 * @param {object} namesMap - fielded names.
 * @return {object} expected map.
 * @method namesCoded
 * @memberof wTools
 */

function namesCoded( namesMap )
{
  var result = {}

  if( _.assert )
  _.assert( arguments.length === 1 );
  if( _.assert )
  _.assert( _.objectIs( namesMap ) );

  for( var n in namesMap )
  result[ n ] = n;

  return result;
}

// --
// id
// --

function idWithDate( prefix, postfix, fast )
{
  var date = new Date;

  prefix = prefix ? prefix : '';
  postfix = postfix ? postfix : '';

  if( fast )
  return prefix + date.valueOf() + postfix;

  var d =
  [
    date.getFullYear(),
    date.getMonth()+1,
    date.getDate(),
    date.getHours(),
    date.getMinutes(),
    date.getSeconds(),
    date.getMilliseconds(),
    Math.floor( Math.random()*0x10000 ).toString( 16 ),
  ].join( '-' );

  return prefix + d + postfix
}

//

function idWithTime( prefix, postfix )
{
  var date = new Date;

  prefix = prefix ? prefix : '';
  postfix = postfix ? postfix : '';

  var d =
  [
    String( date.getHours() ) + String( date.getMinutes() ) + String( date.getSeconds() ),
    String( date.getMilliseconds() ),
    Math.floor( Math.random()*0x10000 ).toString( 16 ),
  ].join( '-' );

  return prefix + d + postfix
}

//

/* qqq : reimplement it more properly */

function idWithGuid()
{

  var result =
  [
    s4() + s4(),
    s4(),
    s4(),
    s4(),
    s4() + s4() + s4(),
  ].join( '-' );

  return result;

  function s4()
  {
    return Math.floor( ( 1 + Math.random() ) * 0x10000 ).toString( 16 ).substring( 1 );
  }

}

//

var idWithInt = (function()
{

  var counter = 0;

  return function()
  {
    _.assert( arguments.length === 0 );
    counter += 1;
    return counter;
  }

})();

// --
// declare
// --

var Proto =
{

  // name and symbol

  nameFielded, /* experimental */
  nameUnfielded, /* experimental */
  namesCoded, /* experimental */

  // id

  idWithDate,
  idWithTime,
  idWithGuid,
  idWithInt,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/NameTools.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, NameTools_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file NameTools_s

( function StringTools_s() { // == begin of file StringTools_s
function StringTools_s_naked() {
(function _StringTools_s_() {

'use strict';

/*

= articles

- strIsolate* difference

*/

//

let Self = _global_.wTools;
let _global = _global_;
let _ = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

let _arraySlice = _.longSlice;
let strType = _.strType;


// --
// checker
// --

function strIsHex( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1 );
  let parsed = parseInt( src, 16 )
  if( isNaN( parsed ) )
  return false;
  return parsed.toString( 16 ).length === src.length;
}

//

function strIsMultilined( src )
{
  if( !_.strIs( src ) )
  return false;
  if( src.indexOf( '\n' ) !== -1 )
  return true;
  return false;
}

//

function strHas( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ) );
  _.assert( _.strLike( ins ) );

  if( _.strIs( ins ) )
  return src.indexOf( ins ) !== -1;
  else
  return ins.test( src );

}

//

function strHasAny( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( strHas( src, ins[ i ] ) )
    return true;
    return false;
  }

  return strHas( src, ins );
}

//

function strHasAll( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( !strHas( src, ins[ i ] ) )
    return false;
    return true;
  }

  return strHas( src, ins );
}

//

function strHasNone( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( strHas( src, ins[ i ] ) )
    return false;
    return true;
  }

  return !strHas( src, ins );
}

//

function strHasSeveral( src, ins )
{
  let result = 0;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( strHas( src, ins[ i ] ) )
    result += 1;
    return result;
  }

  return strHas( src, ins ) ? 1 : 0;
}

//

function strsAnyHas( srcs, ins )
{
  _.assert( _.strIs( srcs ) || _.strsAreAll( srcs ) );
  _.assert( _.strIs( ins ) );

  if( _.strIs( srcs ) )
  return _.strHas( srcs, ins );

  return srcs.some( ( src ) => _.strHas( src, ins ) );
}

//

function strsAllHas( srcs, ins )
{
  _.assert( _.strIs( srcs ) || _.strsAreAll( srcs ) );
  _.assert( _.strIs( ins ) );

  if( _.strIs( srcs ) )
  return _.strHas( srcs, ins );

  return srcs.every( ( src ) => _.strHas( src, ins ) );
}

//

function strsNoneHas( srcs, ins )
{
  _.assert( _.strIs( srcs ) || _.strsAreAll( srcs ) );
  _.assert( _.strIs( ins ) );

  if( _.strIs( srcs ) )
  return !_.strHas( srcs, ins );

  return srcs.every( ( src ) => !_.strHas( src, ins ) );
}

// --
// evaluator
// --

/**
 * Returns number of occurrences of a substring( ins ) in a string( src ),
 * Expects two objects in order: source string, substring.
 * Returns zero if one of arguments is empty string.
 *
 * @param {string} src - Source string.
 * @param {string} ins - Substring.
 * @returns {Number} Returns number of occurrences of a substring in a string.
 *
 * @example
 * //returns 2
 * _.strCount( 'aabab', 'ab' );
 *
 * @example
 * //returns 0
 * _.strCount( 'aabab', '' );
 *
 * @method strCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( ins ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strCount( src, ins )
{
  let result = 0;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ) );
  _.assert( _.strLike( ins ) );

  let i = 0;
  do
  {
    let found = _.strLeft( src, ins, i );
    if( found.entry === undefined )
    break;
    i = found.index + found.entry.length;
    if( !found.entry.length )
    i += 1;
    result += 1;
    _.assert( i !== -1, 'not tested' );
  }
  while( i !== -1 && i < src.length );

  return result;
}

// //
//
// function strCountLeft( src, ins )
// {
//   let result = 0;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( src ) );
//   _.assert( _.strIs( ins ) );
//
//   if( !ins.length )
//   return 0;
//
//   let i = 0;
//   do
//   {
//     if( src.substring( i, i+ins.length ) !== ins )
//     break;
//     result += 1;
//     i += ins.length;
//   }
//   while( i < src.length );
//
//   return result;
// }
//
// //
//
// function strCountRight( src, ins )
// {
//   let result = 0;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( src ) );
//   _.assert( _.strIs( ins ) );
//
//   throw _.err( 'not tested' );
//
//   if( !ins.length )
//   return 0;
//
//   let i = src.length;
//   do
//   {
//     if( src.substring( i-ins.length, i ) !== ins )
//     break;
//     result += 1;
//     i -= ins.length;
//   }
//   while( i > 0 );
//
//   return result;
// }

//

function strsShortest( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) || _.arrayLike( src ) );
  if( _.strIs( src ) )
  return src;
  return src.sort( ( a, b ) => a.length - b.length )[ 0 ];
}

//

function strsLongest()
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) || _.arrayLike( src ) );
  if( _.strIs( src ) )
  return src;
  return src.sort( ( a, b ) => b.length - a.length )[ 0 ];
}

// --
// replacer
// --

function _strRemovedBegin( src, begin )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );

  let result = src;
  let beginOf = _._strBeginOf( result, begin );
  if( beginOf !== false )
  result = result.substr( beginOf.length, result.length );

  return result;
}

//

/**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * //returns mple
 * _.strRemoveBegin( 'example', 'exa' );
 *
 * @example
 * //returns example
 * _.strRemoveBegin( 'example', 'abc' );
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveBegin( src, begin )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
  _.assert( _.longIs( begin ) || _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );

  let result = [];
  let srcIsArray = _.longIs( src );

  if( _.strIs( src ) && !_.longIs( begin ) )
  return _._strRemovedBegin( src, begin );

  src = _.arrayAs( src );
  begin = _.arrayAs( begin );
  for( let s = 0, slen = src.length ; s < slen ; s++ )
  {
    let beginOf = false;
    let src1 = src[ s ]
    for( let b = 0, blen = begin.length ; b < blen ; b++ )
    {
      beginOf = _._strBeginOf( src1, begin[ b ] );
      if( beginOf !== false )
      break;
    }
    if( beginOf !== false )
    src1 = src1.substr( beginOf.length, src1.length );
    result[ s ] = src1;
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}

//

function _strRemovedEnd( src, end )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );

  let result = src;
  let endOf = _._strEndOf( result, end );
  if( endOf !== false )
  result = result.substr( 0, result.length - endOf.length );

  return result;
}

//

/**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * //returns examp
 * _.strRemoveEnd( 'example', 'le' );
 *
 * @example
 * //returns example
 * _.strRemoveEnd( 'example', 'abc' );
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveEnd( src, end )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
  _.assert( _.longIs( end ) || _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );

  let result = [];
  let srcIsArray = _.longIs( src );

  if( _.strIs( src ) && !_.longIs( end ) )
  return _._strRemovedEnd( src, end );

  src = _.arrayAs( src );
  end = _.arrayAs( end );

  for( let s = 0, slen = src.length ; s < slen ; s++ )
  {
    let endOf = false;
    let src1 = src[ s ]
    for( let b = 0, blen = end.length ; b < blen ; b++ )
    {
      endOf = _._strEndOf( src1, end[ b ] );
      if( endOf !== false )
      break;
    }
    if( endOf !== false )
    src1 = src1.substr( 0, src1.length - endOf.length );
    result[ s ] = src1;
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}

//

function _strRemoved( srcStr, insStr )
{
  let result = srcStr;

  _.assert( arguments.length === 2, 'expects exactly two arguments' );
  _.assert( _.strIs( srcStr ), 'expects string {-src-}' );

  if( !_.longIs( insStr ) )
  {
    result = result.replace( insStr, '' );
  }
  else
  {
    for( let i = 0; i < insStr.length; i++ )
    {
      result = result.replace( insStr[ i ], '' );
    }
  }

  return result;
}

//

/**
* Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be dropped.
* @returns { String } Returns string with result of substring removement.
*
* @example
* //returns ource tring
* _.strRemove( 'source string', 's' );
*
* @example
* //returns example
* _.strRemove( 'example', 's' );
*
* @function strRemove
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
* @memberof wTools
*
*/

function strRemove( srcStr, insStr )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );
  _.assert( _.longIs( srcStr ) || _.strIs( srcStr ), 'expects string or array of strings {-src-}' );
  _.assert( _.longIs( insStr ) || _.strIs( insStr ) || _.regexpIs( insStr ), 'expects string/regexp or array of strings/regexps {-begin-}' );

  let result = [];
  let srcIsArray = _.longIs( srcStr );

  if( _.strIs( srcStr ) && !_.longIs( srcStr ) )
  return _._strRemoved( srcStr, insStr );

  srcStr = _.arrayAs( srcStr );

  for( let s = 0; s < srcStr.length; s++ )
  {
    let src = srcStr[ s ];
    result[ s ] = _._strRemoved( src, insStr );
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}

//

function strReplaceBegin( src, begin, ins )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( ins ) || _.longIs( ins ), 'Expects {-ins-} as string/array of strings' );
  if( _.longIs( begin ) && _.longIs( ins ) )
  _.assert( begin.length === ins.length );

  begin = _.arrayAs( begin );
  let result = _.arrayAs( src ).slice();

  for( let k = 0, srcLength = result.length; k < srcLength; k++ )
  for( let j = 0, beginLength = begin.length; j < beginLength; j++ )
  if( _.strBegins( result[ k ], begin[ j ] ) )
  {
    let prefix = _.longIs( ins ) ? ins[ j ] : ins;
    _.assert( _.strIs( prefix ) );
    result[ k ] = prefix + _.strRemoveBegin( result[ k ] , begin[ j ] );
    break;
  }

  if( result.length === 1 && _.strIs( src ) )
  return result[ 0 ];

  return result;
}

//

function strReplaceEnd( src, end, ins )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( ins ) || _.longIs( ins ), 'Expects {-ins-} as string/array of strings' );
  if( _.longIs( end ) && _.longIs( ins ) )
  _.assert( end.length === ins.length );

  end = _.arrayAs( end );
  let result = _.arrayAs( src ).slice();

  for( let k = 0, srcLength = result.length; k < srcLength; k++ )
  for( let j = 0, endLength = end.length; j < endLength; j++ )
  if( _.strEnds( result[ k ], end[ j ] ) )
  {
    let postfix = _.longIs( ins ) ? ins[ j ] : ins;
    _.assert( _.strIs( postfix ) );
    result[ k ] = _.strRemoveEnd( result[ k ] , end[ j ] ) + postfix;
  }

  if( result.length === 1 && _.strIs( src ) )
  return result[ 0 ];

  return result;
}

//

function _strReplaced( srcStr, insStr, subStr )
{
  _.assert( arguments.length === 3, 'expects exactly three arguments' );
  _.assert( _.strIs( srcStr ), 'expects string {-src-}' );

  let result = srcStr;

  if( !_.longIs( insStr ) )
  {
    _.assert( _.strIs( subStr ), 'expects string {-sub-}' );

    result = result.replace( insStr, subStr );
  }
  else
  {
    _.assert( insStr.length === subStr.length, 'Search and replace strings must have same length' );
    for( let i = 0; i < insStr.length; i++ )
    {
      _.assert( _.strIs( subStr[ i ] ), 'expects string {-sub-}' );

      result = result.replace( insStr[ i ], subStr[ i ] );
    }
  }

  return result;
}

//

/**
* Finds substring or regexp ( insStr ) occurrence from the source string ( srcStr ) and replaces them
* with the subStr values.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be replaced.
* @param { String } subStr - Replacement String/RegExp.
* @returns { String } Returns string with result of substring replacement.
*
* @example
* //returns Source string
* _.strReplace( 'source string', 's', 'S' );
*
* @example
* //returns example
* _.strReplace( 'example', 's' );
*
* @function strReplace
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( subStr ) is not a String.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
* @memberof wTools
*
*/

function strReplace( srcStr, insStr, subStr )
{
  _.assert( arguments.length === 3, 'expects exactly three arguments' );
  _.assert( _.longIs( srcStr ) || _.strIs( srcStr ), 'expects string or array of strings {-src-}' );
  _.assert( _.longIs( insStr ) || _.strIs( insStr ) || _.regexpIs( insStr ), 'expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( _.longIs( subStr ) || _.strIs( subStr ), 'expects string or array of strings {-src-}' );

  let result = [];
  let srcIsArray = _.longIs( srcStr );

  if( _.strIs( srcStr ) && !_.longIs( srcStr ) )
  return _._strReplaced( srcStr, insStr, subStr );

  srcStr = _.arrayAs( srcStr );

  for( let s = 0; s < srcStr.length; s++ )
  {
    let src = srcStr[ s ];
    result[ s ] = _._strReplaced( src, insStr, subStr );
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}


//

/**
  * Prepends string( begin ) to the source( src ) if prefix( begin ) is not match with first chars of string( src ),
  * otherwise returns original string.
  * @param { String } src - Source string to parse.
  * @param { String } begin - String to prepend.
  *
  * @example
  * _.strPrependOnce( 'test', 'test' );
  * //returns 'test'
  *
  * @example
  * _.strPrependOnce( 'abc', 'x' );
  * //returns 'xabc'
  *
  * @returns { String } Returns result of prepending string( begin ) to source( src ) or original string.
  * @function strPrependOnce
  * @memberof wTools
  */

function strPrependOnce( src, begin )
{
  _.assert( _.strIs( src ) && _.strIs( begin ), 'Expects {-src-} and {-begin-} as strings' );
  if( src.lastIndexOf( begin, 0 ) === 0 )
  return src;
  else
  return begin + src;
}

//

/**
  * Appends string( end ) to the source( src ) if postfix( end ) is not match with last chars of string( src ),
  * otherwise returns original string.
  * @param {string} src - Source string to parse.
  * @param {string} end - String to append.
  *
  * @example
  * _.strAppendOnce( 'test', 'test' );
  * //returns 'test'
  *
  * @example
  * _.strAppendOnce( 'abc', 'x' );
  * //returns 'abcx'
  *
  * @returns {string} Returns result of appending string( end ) to source( src ) or original string.
  * @function strAppendOnce
  * @memberof wTools
  */

function strAppendOnce( src, end )
{
  _.assert( _.strIs( src ) && _.strIs( end ), 'Expects {-src-} and {-end-} as strings' );
  if( src.indexOf( end, src.length - end.length ) !== -1 )
  return src;
  else
  return src + end;
}

// --
// etc
// --

/**
 * Replaces occurrence of each word from array( ins ) in string( src ) with word
 * from array( sub ) considering it position.
 * @param {string} src - Source string to parse.
 * @param {array} ins - Array with strings to replace.
 * @param {string} sub - Array with new strings.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns ' your cars are'
 * _.strReplaceWords( ' my name is', [ 'my', 'name', 'is' ], [ 'your', 'cars', 'are' ] )
 *
 * @method strReplaceWords
 * @throws { Exception } Throws a exception if( ins ) is not a Array.
 * @throws { Exception } Throws a exception if( sub ) is not a Array.
 * @throws { TypeError } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
 * @memberof wTools
 *
 */

function strReplaceWords( src, ins, sub )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( src ) );
  _.assert( _.arrayIs( ins ) );
  _.assert( _.arrayIs( sub ) );
  _.assert( ins.length === sub.length );

  let result = src;
  for( let i = 0 ; i < ins.length ; i++ )
  {
    _.assert( _.strIs( ins[ i ] ) );
    let r = new RegExp( '(\\W|^)' + ins[ i ] + '(?=\\W|$)', 'gm' );
    result = result.replace( r, function( original )
    {

      if( original[ 0 ] !== sub[ i ][ 0 ] )
      return original[ 0 ] + sub[ i ];
      else
      return sub[ i ];

    });
  }

  return result;
}

// --
// etc
// --

/**
 * Find common symbols from the begining of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have the same first symbols as the pattern ( ins ), the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the start of each string.
 *
 * @param {string} ins - Sequence of possible symbols.
 * @returns {string} Returns found common symbols.
 *
 * @example
 * //returns 'a'
 * _.strCommonLeft( 'abcd', 'ab', 'abc', 'a' );
 *
 * @example
 * //returns 'abc'
 * _.strCommonLeft( 'abcd', 'abc', 'abcd' );
 *
 * @example
 * //returns ''
 * _.strCommonLeft( 'abcd', 'abc', 'd' )
 *
 * @method strCommonLeft
 * @throws {exception} If ( ins ) is not a String.
 * @memberof wTools
 *
 */

function strCommonLeft( ins )
{

  if( arguments.length === 0 )
  return '';
  if( arguments.length === 1 )
  return ins;

  _.assert( _.strIs( ins ) );

  let length = +Infinity;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    length = Math.min( length, src.length );
  }

  let i = 0;
  for( ; i < length ; i++ )
  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src[ i ] !== ins[ i ] )
    return ins.substring( 0, i );
  }

  return ins.substring( 0, i );
}

//

/**
 * Finds common symbols from the end of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have same last symbol with pattern( ins ), the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the end of each string.
 *
 * @param { String } ins - Sequence of possible symbols.
 * @returns { String } Returns found common symbols.
 *
 * @example 'ame'
 * _.strCommonRight( 'ame', 'same', 'name' );
 *
 * @example 'c'
 * _.strCommonRight( 'abc', 'dbc', 'ddc', 'aac' );
 *
 * @example ''
 * _.strCommonRight( 'abc', 'dba', 'abc' );
 *
 * @method strCommonRight
 * @throws {exception} If( ins ) is not a String.
 * @memberof wTools
 *
 */

function strCommonRight( ins )
{

  if( arguments.length === 0 )
  return '';
  if( arguments.length === 1 )
  return ins;

  _.assert( _.strIs( ins ) );

  let length = +Infinity;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    length = Math.min( length, src.length );
  }

  let i = 0;
  for( ; i < length ; i++ )
  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src[ src.length - i - 1 ] !== ins[ ins.length - i - 1 ] )
    return ins.substring( ins.length-i );
  }

  return ins.substring( ins.length-i );
}

// --
// formatter
// --

function strForRange( range )
{
  let result;

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( range ) );

  result = '[ ' + range[ 0 ] + '..' + range[ 1 ] + ' ]';

  return result;
}

//

function strForCall( nameOfRoutine, args, ret, o )
{
  let result = nameOfRoutine + '( ';
  let first = true;

  _.assert( _.arrayIs( args ) || _.objectIs( args ) );
  _.assert( arguments.length <= 4 );

  _.each( args, function( e, k )
  {

    if( first === false )
    result += ', ';

    if( _.objectIs( e ) )
    result += k + ' :' + _.toStr( e, o );
    else
    result += _.toStr( e, o );

    first = false;

  });

  result += ' )';

  if( arguments.length >= 3 )
  result += ' -> ' + _.toStr( ret, o );

  return result;
}

//

/**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> ''st'...'ng''.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ( { src : 'string', limit : 4, wrap : 0, escaping : 0 } ).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 * @returns {string} Returns simplified source string.
 *
 * @example
 * //returns ''st' ... 'ng''
 * _.strStrShort( 'string', 4 );
 *
 * @example
 * //returns ''s' ... 'ng''
 * _.strStrShort( 's\ntring', 4 );
 *
 * @example
 * //returns 'string'
 * _.strStrShort( 'string', 0 );
 *
 * @example
 * //returns ''st' ... 'ng''
 * _.strStrShort( { src : 'string', limit : 4, wrap : '\'' } );
 *
 * @example
 * //returns 'si ... le'
 *  _.strStrShort( { src : 'simple', limit : 4, wrap : 0 } );
 *
 * @example
 * //returns ''si' ... 'le''
 *  _.strStrShort( { src : 'si\x01mple', limit : 5, wrap : '\'' } );
 *
 * @example
 * //returns ''s\u0001' ... ' string''
 *  _.strStrShort( 's\x01t\x01ing string string', 14 );
 *
 * @method strStrShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.wrap ) is not a String.
 *
 * @memberof wTools
 *
 */

function strStrShort( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], limit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.routineOptions( strStrShort, o );
  _.assert( _.strIs( o.src ) );
  _.assert( _.numberIs( o.limit ) );

  let str = o.src;

  if( str.length > o.limit && o.limit > 0  )
  {
    let b = Math.ceil( o.limit / 2 );
    let e = o.limit - b;

    let begin = str.substr( 0, b );
    let end = str.slice( -e );

    if( o.escaping )
    {
      function check( s, l )
      {
        let temp = _.strEscape( s );

        if( temp.length > l )
        for( let i = s.length - 1; i >= 0 ; --i )
        {
          if( temp.length <= l )
          break;
          temp = temp.slice( 0, - ( _.strEscape( s[ i ] ).length ) );
        }

        return temp;
      }

      begin = check( begin, b );
      end = check( end, e );

    }

    if( o.wrap )
    {
      _.assert( _.strIs( o.wrap ) );

      begin = o.wrap + begin + o.wrap;
      end = o.wrap + end + o.wrap;
    }

    if( o.limit === 1 )
    str = begin;
    else
    str = begin + ' ... ' +  end ;

  }
  else
  {
    if( o.escaping )
    str = _.strEscape( str );
  }

  return str;
}

strStrShort.defaults =
{
  src : null,
  limit : 40,
  wrap : '\'',
  escaping : 1
}

//

function strDifference( src1, src2, o )
{
  _.assert( _.strIs( src1 ) );
  _.assert( _.strIs( src2 ) );

  if( src1 === src2 )
  return false;

  for( var i = 0, l = Math.min( src1.length, src2.length ) ; i < l ; i++ )
  if( src1[ i ] !== src2[ i ] )
  return src1.substr( 0, i ) + '*';

  return src1.substr( 0, i ) + '*';
}

// --
// transformer
// --

/**
 * Returns string with first letter converted to upper case.
 * Expects one object: the string to be formatted.
 *
 * @param {string} src - Source string.
 * @returns {String} Returns a string with the first letter capitalized.
 *
 * @example
 * //returns Test string
 * _.strCapitalize( 'test string' );
 *
 * @example
 * //returns Another_test_string
 * _.strCapitalize( 'another_test_string' );
 *
 * @method strCapitalize
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */

function strCapitalize( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  /*_.assert( src.length > 0 );*/
  /*_.assert( src.match(/(^\W)/) === null );*/

  if( src.length === 0 )
  return src;

  return src[ 0 ].toUpperCase() + src.substring( 1 );
}

//

function strDecapitalize( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( src.length === 0 )
  return src;

  return src[ 0 ].toLowerCase() + src.substring( 1 );
}

//

/**
 * Disables escaped characters in source string( src ).
 * Example: '\n' -> '\\n', '\u001b' -> '\\u001b' etc.
 * Returns string with disabled escaped characters, source string if nothing changed or  empty string if source is zero length.
 * @param {string} src - Source string.
 * @returns {string} Returns string with disabled escaped characters.
 *
 * @example
 * //returns '\nhello\u001bworld\n'
 * _.strEscape( '\nhello\u001bworld\n' );
 *
 * @example
 * //returns 'string'
 * _.strEscape( 'string' );
 *
 * @example
 * //returns 'str\''
 * _.strEscape( 'str\'' );
 *
 * @example
 * //returns ''
 * _.strEscape( '' );
 *
 * @method strEscape
 * @throw { Exception } If( src ) is not a String.
 * @memberof wTools
 *
 */

function strEscape( o )
{

    // 007f : ''
    // . . .
    // 009f : ''

    // 00ad : '­'

    // \' 	single quote 	byte 0x27 in ASCII encoding
    // \' 	double quote 	byte 0x22 in ASCII encoding
    // \\ 	backslash 	byte 0x5c in ASCII encoding
    // \b 	backspace 	byte 0x08 in ASCII encoding
    // \f 	form feed - new page 	byte 0x0c in ASCII encoding
    // \n 	line feed - new line 	byte 0x0a in ASCII encoding
    // \r 	carriage return 	byte 0x0d in ASCII encoding
    // \t 	horizontal tab 	byte 0x09 in ASCII encoding
    // \v 	vertical tab 	byte 0x0b in ASCII encoding
    // source : http://en.cppreference.com/w/cpp/language/escape

  // console.log( _.appMemoryUsageInfo(), o.src.length );
  // if( o.src.length === 111691 )
  // debugger;

  if( _.strIs( o ) )
  o = { src : o }

  _.assert( _.strIs( o.src ), 'Expects string {-o.src-}, but got', _.strType( o.src ) );
  _.routineOptions( strEscape, o );

  let result = '';
  // let src = o.src.split( '' );
  // debugger;
  let stringWrapperCode = o.stringWrapper.charCodeAt( 0 );
  for( let s = 0 ; s < o.src.length ; s++ )
  {
    // let c = o.src[ s ];
    // let c = src[ s ];
    // let code = c.charCodeAt( 0 );
    let code = o.src.charCodeAt( s );

    // if( o.stringWrapper === '`' && c === '$' )
    if( o.stringWrapper === '`' && code === 0x24 /* $ */ )
    {
      result += '\\$';
    }
    else if( o.stringWrapper && code === stringWrapperCode )
    {
      result += '\\' + o.stringWrapper;
    }
    else if( 0x007f <= code && code <= 0x009f || code === 0x00ad /*|| code >= 65533*/ )
    {
      // result += _.strUnicodeEscape( c );
      result += _.strCodeUnicodeEscape( code );
    }
    else switch( code )
    {

      case 0x5c /* '\\' */ :
        result += '\\\\';
        break;

      case 0x08 /* '\b' */ :
        result += '\\b';
        break;

      case 0x0c /* '\f' */ :
        result += '\\f';
        break;

      case 0x0a /* '\n' */ :
        result += '\\n';
        break;

      case 0x0d /* '\r' */ :
        result += '\\r';
        break;

      case 0x09 /* '\t' */ :
        result += '\\t';
        break;

      default :

        if( code < 32 )
        {
          result += _.strCodeUnicodeEscape( code );
        }
        else
        {
          result += String.fromCharCode( code );
        }

    }

  }

  return result;
}

strEscape.defaults =
{
  src : null,
  stringWrapper : '\'',
}

//

/**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( 'world' );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */

function strCodeUnicodeEscape( code )
{
  let result = '';

  _.assert( _.numberIs( code ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let h = code.toString( 16 );
  let d = _.strDup( '0', 4-h.length ) + h;

  result += '\\u' + d;

  return result;
}

//

/**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( 'world' );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */

function strUnicodeEscape( src )
{
  let result = '';

  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  for( let i = 0 ; i < src.length ; i++ )
  {
    let code = src.charCodeAt( i );
    result += _.strCodeUnicodeEscape( code );
  }

  return result;
}

//

function strReverse( srcStr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  let result = '';
  for( let i = 0 ; i < srcStr.length ; i++ )
  result = srcStr[ i ] + result;
  return result;
}

// --
// stripper
// --

/**
 * Removes leading and trailing characters occurrences from source string( o.src ) finded by mask( o.stripper ).
 * If( o.stripper ) is not defined function removes leading and trailing whitespaces and escaped characters from( o.src ).
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ({ src : ' acb ', stripper : ' ' }).
 *
 * @param {string|object} o - Source string to parse or map with source( o.src ) and options.
 * @param {string} [ o.src=null ]- Source string to strip.
 * @param {string|array} [ o.stripper=' ' ]- Contains characters to remove.
 * @returns {string} Returns result of removement in a string.
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : 'aabaa', stripper : 'a' } );
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } )
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : '   b  \n' } )
 *
 * @method strStrip
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o ) is not Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.stripper ) is not a String or Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

function strStrip( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStrip, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( o.src ) )
  {
    let result = [];
    for( let s = 0 ; s < o.src.length ; s++ )
    {
      let optionsForStrip = _.mapExtend( null, o );
      optionsForStrip.src = optionsForStrip.src[ s ];
      result[ s ] = strStrip( optionsForStrip );
    }
    return result;
  }

  _.assert( _.strIs( o.src ), 'Expects string or array o.src, got', _.strType( o.src ) );
  _.assert( _.strIs( o.stripper ) || _.arrayIs( o.stripper ) || _.regexpIs( o.stripper ), 'Expects string or array or regexp ( o.stripper )' );

  if( _.strIs( o.stripper ) || _.regexpIs( o.stripper ) )
  {
    let exp = o.stripper;
    if( _.strIs( exp ) )
    {
      exp = _.regexpEscape( exp );
      exp = new RegExp( exp, 'g' );
    }

    return o.src.replace( exp, '' );
  }
  else
  {

    _.assert( _.arrayIs( o.stripper ) );

    if( Config.debug )
    for( let s of o.stripper )
    _.assert( _.strIs( s, 'Expects string {-stripper[ * ]-}' ) );

    let b = 0;
    for( ; b < o.src.length ; b++ )
    if( o.stripper.indexOf( o.src[ b ] ) === -1 )
    break;

    let e = o.src.length-1;
    for( ; e >= 0 ; e-- )
    if( o.stripper.indexOf( o.src[ e ] ) === -1 )
    break;

    if( b >= e )
    return '';

    return o.src.substring( b, e+1 );
  }

}

strStrip.defaults =
{
  src : null,
  stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/gm,
}

//

/**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only leading whitespaces and escaped characters from( o.src ).
 *
 * @example
 * //returns 'a '
 * _.strStripLeft( ' a ' )
 *
 * @method strStripLeft
 * @memberof wTools
 *
 */

function strStripLeft( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStripLeft, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.strStrip( o );
}

strStripLeft.defaults =
{
  stripper : /^(\s|\n|\0)+/gm,
}

strStripLeft.defaults.__proto__ = strStrip.defaults;

//

/**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only trailing whitespaces and escaped characters from( o.src ).
 *
 * @example
 * //returns ' a'
 * _.strStripRight( ' a ' )
 *
 * @method strStripRight
 * @memberof wTools
 *
 */

function strStripRight( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStripRight, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.strStrip( o );
}

strStripRight.defaults =
{
  stripper : /(\s|\n|\0)+$/gm,
}

strStripRight.defaults.__proto__ = strStrip.defaults;

//

/**
 * Removes whitespaces from source( src ).
 * If argument( sub ) is defined, function replaces whitespaces with it.
 *
 * @param {string} src - Source string to parse.
 * @param {string} sub - Substring that replaces whitespaces.
 * @returns {string} Returns a string with removed whitespaces.
 *
 * @example
 * //returns abcde
 * _.strRemoveAllSpaces( 'a b c d e' );
 *
 * @example
 * //returns a*b*c*d*e
 * _.strRemoveAllSpaces( 'a b c d e', '*' );
 *
 * @method strRemoveAllSpaces
 * @memberof wTools
 *
*/

function _strRemoveAllSpaces( src, sub )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( src ) );

  if( sub === undefined )
  sub = '';

  return src.replace( /\s/g, sub );
}

//

/**
 * Removes empty lines from the string passed by argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns a string with empty lines removed.
 *
 * @example
 * //returns
 * //first
 * //second
 * _.strStripEmptyLines( 'first\n\nsecond' );
 *
 * @example
 * //returns
 * //zero
 * //first
 * //second
 * _.strStripEmptyLines( 'zero\n\nfirst\n\nsecond' );
 *
 * @method strStripEmptyLines
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */

function _strStripEmptyLines( srcStr )
{
  let result = '';
  let lines = srcStr.split( '\n' );

  _.assert( _.strIs( srcStr ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  for( let l = 0; l < lines.length; l += 1 )
  {
    let line = lines[ l ];

    if( !_.strStrip( line ) )
    continue;

    result += line + '\n';
  }

  result = result.substring( 0, result.length - 1 );
  return result;
}

// --
// splitter
// --

/**
 * Parses a source string( src ) and separates numbers and string values
 * in to object with two properties: 'str' and 'number', example of result: ( { str: 'bd', number: 1 } ).
 *
 * @param {string} src - Source string.
 * @returns {object} Returns the object with two properties:( str ) and ( number ),
 * with values parsed from source string. If a string( src ) doesn't contain number( s ),
 * function returns the object with value of string( src ).
 *
 * @example
 * //returns { str: 'bd', number: 1 }
 * _.strSplitStrNumber( 'bd1' );
 *
 * @example
 * //returns { str: 'bdxf' }
 * _.strSplitStrNumber( 'bdxf' );
 *
 * @method strSplitStrNumber
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
 */

function strSplitStrNumber( src )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );

  let mnumber = src.match(/\d+/);
  if( mnumber && mnumber.length )
  {
    let mstr = src.match(/[^\d]*/);
    result.str = mstr[ 0 ];
    result.number = _.numberFrom( mnumber[0] );
  }
  else
  {
    result.str = src;
  }

  return result;
}

//

function strSplitChunks( o )
{
  let result = Object.create( null );
  result.chunks = [];

  if( arguments.length === 2 )
  {
    o = arguments[ 1 ] || Object.create( null );
    o.src = arguments[ 0 ];
  }
  else
  {
    _.assert( arguments.length === 1, 'Expects single argument' );
    if( _.strIs( arguments[ 0 ] ) )
    o = { src : arguments[ 0 ] };
  }

  _.routineOptions( strSplitChunks, o );
  _.assert( _.strIs( o.src ), 'Expects string (-o.src-), but got', _.strType( o.src ) );

  if( !_.regexpIs( o.prefix ) )
  o.prefix = RegExp( _.regexpEscape( o.prefix ), 'm' );

  if( !_.regexpIs( o.postfix ) )
  o.postfix = RegExp( _.regexpEscape( o.postfix ), 'm' );

  let src = o.src;

  /* */

  let line = 0;
  let column = 0;
  let chunkIndex = 0;
  let begin = -1;
  let end = -1;
  do
  {

    /* begin */

    begin = src.search( o.prefix );
    if( begin === -1 ) begin = src.length;

    /* text chunk */

    if( begin > 0 )
    makeChunkStatic( begin );

    /* break */

    if( !src )
    {
      if( !result.chunks.length )
      makeChunkStatic( 0 );
      break;
    }

    /* end */

    end = src.search( o.postfix );
    if( end === -1 )
    {
      result.lines = src.split( '\n' ).length;
      result.error = _.err( 'Openning prefix', o.prefix, 'of chunk #' + result.chunks.length, 'at'+line, 'line does not have closing tag :', o.postfix );
      return result;
    }

    /* code chunk */

    let chunk = makeChunkDynamic();

    /* wind */

    chunkIndex += 1;
    line += _.strLinesCount( chunk.prefix + chunk.code + chunk.postfix ) - 1;

  }
  while( src );

  return result;

  /* - */

  function colAccount( text )
  {
    let i = text.lastIndexOf( '\n' );

    if( i === -1 )
    {
      column += text.length;
    }
    else
    {
      column = text.length - i;
    }

    _.assert( column >= 0 );
  }

  /* - */

  function makeChunkStatic( begin )
  {
    let chunk = Object.create( null );
    chunk.line = line;
    chunk.text = src.substring( 0, begin );
    chunk.index = chunkIndex;
    chunk.kind = 'static';
    result.chunks.push( chunk );

    src = src.substring( begin );
    line += _.strLinesCount( chunk.text ) - 1;
    chunkIndex += 1;

    colAccount( chunk.text );
  }

  /* - */

  function makeChunkDynamic()
  {
    let chunk = Object.create( null );
    chunk.line = line;
    chunk.column = column;
    chunk.index = chunkIndex;
    chunk.kind = 'dynamic';
    chunk.prefix = src.match( o.prefix )[ 0 ];
    chunk.code = src.substring( chunk.prefix.length, end );
    if( o.investigate )
    {
      chunk.lines = chunk.code.split( '\n' );
      chunk.tab = /^\s*/.exec( chunk.lines[ chunk.lines.length-1 ] )[ 0 ];
    }

    /* postfix */

    src = src.substring( chunk.prefix.length + chunk.code.length );
    chunk.postfix = src.match( o.postfix )[ 0 ];
    src = src.substring( chunk.postfix.length );

    result.chunks.push( chunk );
    return chunk;
  }

}

strSplitChunks.defaults =
{
  src : null,
  investigate : 1,
  prefix : '//>-' + '->//',
  postfix : '//<-' + '-<//',
}

//

function strSplitsCoupledGroup( o )
{

  if( _.arrayIs( o ) )
  o = { splits : o }

  o = _.routineOptions( strSplitsCoupledGroup, o );

  o.prefix = _.arrayAs( o.prefix );
  o.postfix = _.arrayAs( o.postfix );

  _.assert( arguments.length === 1 );
  _.assert( _.regexpsLike( o.prefix ) );
  _.assert( _.regexpsLike( o.postfix ) );

  let level = 0;
  let begins = [];
  for( let i = 0 ; i < o.splits.length ; i++ )
  {
    let element = o.splits[ i ];

    if( _.regexpsTestAny( o.prefix, element ) )
    {
      begins.push( i );
    }
    else if( _.regexpsTestAny( o.postfix, element ) )
    {
      if( begins.length === 0 && !o.allowingUncoupledPostfix )
      throw _.err( _.strQuote( element ), 'does not have complementing openning\n' );

      if( begins.length === 0 )
      continue;

      let begin = begins.pop();
      let end = i;
      let l = end-begin;

      _.assert( l >= 0 )
      let newElement = o.splits.splice( begin, l+1, null );
      o.splits[ begin ] = newElement;

      i -= l;
    }

  }

  if( begins.length && !o.allowingUncoupledPrefix )
  throw _.err( _.strQuote( begins[ begins.length-1 ] ), 'does not have complementing closing\n' );

  return o.splits;
}

strSplitsCoupledGroup.defaults =
{
  splits : null,
  prefix : '"',
  postfix : '"',
  allowingUncoupledPrefix : 0,
  allowingUncoupledPostfix : 0,
}

//

function strSplitsUngroupedJoin( o )
{

  if( _.arrayIs( o ) )
  o = { splits : o }
  o = _.routineOptions( strSplitsUngroupedJoin, o );

  let s = o.splits.length-1;
  let l = null;

  while( s >= 0 )
  {
    let split = o.splits[ s ];

    if( _.strIs( split ) )
    {
      if( l === null )
      l = s;
    }
    else if( l !== null )
    {
      join();
    }

    s -= 1;
  }

  if( l !== null )
  join();

  return o.splits;

  /* */

  function join()
  {
    if( s+1 < l )
    {
      let element = o.splits.slice( s+1, l+1 ).join( '' );
      o.splits.splice( s+1, l+1, element );
    }
    l = null;
  }

}

strSplitsUngroupedJoin.defaults =
{
  splits : null,
}

//

function strSplitsQuotedRejoin_pre( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1, 'Expects one or two arguments' );
  _.assert( _.objectIs( o ) );

  if( o.quoting )
  {

    if( _.boolLike( o.quoting ) )
    {
      if( !o.quotingPrefixes )
      o.quotingPrefixes = [ '"' ];
      if( !o.quotingPostfixes )
      o.quotingPostfixes = [ '"' ];
    }
    else if( _.strIs( o.quoting ) || _.regexpIs( o.quoting ) || _.arrayIs( o.quoting ) )
    {
      _.assert( !o.quotingPrefixes );
      _.assert( !o.quotingPostfixes );
      o.quoting = _.arrayAs( o.quoting );
      o.quotingPrefixes = o.quoting;
      o.quotingPostfixes = o.quoting;
      o.quoting = true;
    }
    else _.assert( 0, 'unexpected type of {-o.quoting-}' );

    _.assert( o.quotingPrefixes.length === o.quotingPostfixes.length );
    _.assert( _.boolLike( o.quoting ) );

  }

  return o;
}

//

function strSplitsQuotedRejoin_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* quoting */

  if( o.quoting )
  for( let s = 1 ; s < o.splits.length ; s += 1 )
  {
    let split = o.splits[ s ];
    let s2;

    let q = o.quotingPrefixes.indexOf( split );
    if( q >= 0 )
    {
      let postfix = o.quotingPostfixes[ q ];
      for( s2 = s+2 ; s2 < o.splits.length ; s2 += 1 )
      {
        let split2 = o.splits[ s2 ];
        if( split2 === postfix )
        {
          let bextra = 0;
          let eextra = 0;
          if( o.inliningQuoting )
          {
            s -= 1;
            bextra += 1;
            s2 += 1;
            eextra += 1;
          }
          let splitNew = o.splits.splice( s, s2-s+1, null );
          if( !o.preservingQuoting )
          {
            splitNew.splice( bextra, 1 );
            splitNew.splice( splitNew.length-1-eextra, 1 );
          }
          splitNew = splitNew.join( '' );
          o.splits[ s ] = splitNew;
          s2 = s;
          break;
        }
      }
    }

    /* if complementing postfix not found */

    if( s2 >= o.splits.length )
    {
      if( !_.arrayHas( o.delimeter, split ) )
      {
        let splitNew = o.splits.splice( s, 2 ).join( '' );
        o.splits[ s-1 ] = o.splits[ s-1 ] + splitNew;
      }
      else
      {
      }
    }

  }

  return o.splits;
}

strSplitsQuotedRejoin_body.defaults =
{
  quoting : 1,
  quotingPrefixes : null,
  quotingPostfixes : null,
  preservingQuoting : 1,
  inliningQuoting : 1,
  splits : null,
  delimeter : null,
}

//

let strSplitsQuotedRejoin = _.routineFromPreAndBody( strSplitsQuotedRejoin_pre, strSplitsQuotedRejoin_body );

// --
//
// --

function strSplitsDropDelimeters_pre( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );

  if( _.strIs( o.delimeter ) )
  o.delimeter = [ o.delimeter ];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 );
  _.assert( _.objectIs( o ) );

  return o;
}

//

function strSplitsDropDelimeters_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* stripping */

  if( o.delimeter.some( ( d ) => _.regexpIs( d ) ) )
  debugger;

  for( let s = o.splits.length-1 ; s >= 0 ; s-- )
  {
    let split = o.splits[ s ];

    if( _.regexpsTestAny( o.delimeter, split ) )
    o.splits.splice( s, 1 );

    // if( _.arrayHas( o.delimeter, split ) )
    // o.splits.splice( s, 1 );
    //
    // if( s % 2 === 1 )
    // o.splits.splice( s, 1 );

  }

  return o.splits;
}

strSplitsDropDelimeters_body.defaults =
{
  splits : null,
  delimeter : null,
}

//

let strSplitsDropDelimeters = _.routineFromPreAndBody( strSplitsDropDelimeters_pre, strSplitsDropDelimeters_body );

// --
//
// --

function strSplitsStrip_pre( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );

  if( o.stripping && _.boolLike( o.stripping ) )
  o.stripping = _.strStrip.defaults.stripper;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 );
  _.assert( _.objectIs( o ) );
  _.assert( !o.stripping || _.strIs( o.stripping ) || _.regexpIs( o.stripping ) );

  return o;
}

//

function strSplitsStrip_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* stripping */

  for( let s = 0 ; s < o.splits.length ; s++ )
  {
    let split = o.splits[ s ];

    if( o.stripping )
    split = _.strStrip({ src : split, stripper : o.stripping });

    o.splits[ s ] = split;

  }

  return o.splits;
}

strSplitsStrip_body.defaults =
{
  stripping : 1,
  splits : null,
}

//

let strSplitsStrip = _.routineFromPreAndBody( strSplitsStrip_pre, strSplitsStrip_body );

// --
//
// --

function strSplitsDropEmpty_pre( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 );
  _.assert( _.objectIs( o ) );

  return o;
}

//

function strSplitsDropEmpty_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* stripping */

  for( let s = 0 ; s < o.splits.length ; s++ )
  {
    let split = o.splits[ s ];

    if( !split )
    {
      o.splits.splice( s, 1 );
      s -= 1;
    }

  }

  return o.splits;
}

strSplitsDropEmpty_body.defaults =
{
  splits : null,
}

//

let strSplitsDropEmpty = _.routineFromPreAndBody( strSplitsDropEmpty_pre, strSplitsDropEmpty_body );

// --
//
// --

function strSplitFast_pre( routine, args )
{
  let o = args[ 0 ];

  if( args.length === 2 )
  o = { src : args[ 0 ], delimeter : args[ 1 ] }
  else if( _.strIs( args[ 0 ] ) )
  o = { src : args[ 0 ] }

  _.routineOptions( routine, o );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 || args.length === 2, 'Expects one or two arguments' );
  _.assert( _.strIs( o.src ) );
  _.assert( _.objectIs( o ) );

  return o;
}

//

function strSplitFast_body( o )
{
  let result;
  let closests;
  let position;
  let closestPosition;
  let closestIndex;
  let hasEmptyDelimeter;
  let delimeter

  o.delimeter = _.arrayAs( o.delimeter );

  let foundDelimeters = o.delimeter.slice();

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.delimeter ) );
  _.assert( _.boolLike( o.preservingDelimeters ) );

  /* */

  if( !o.preservingDelimeters && o.delimeter.length === 1 )
  {

    result = o.src.split( o.delimeter[ 0 ] );

    if( !o.preservingEmpty )
    result = result.filter( ( e ) => e ? e : false );

  }
  else
  {

    if( !o.delimeter.length )
    {
      result = [ o.src ];
      return result;
    }

    result = [];
    closests = [];
    position = 0;
    closestPosition = 0;
    closestIndex = -1;
    hasEmptyDelimeter = false;

    for( let d = 0 ; d < o.delimeter.length ; d++ )
    {
      let delimeter = o.delimeter[ d ];
      if( _.regexpIs( delimeter ) )
      {
        _.assert( !delimeter.sticky );
        if( delimeter.source === '' || delimeter.source === '()' || delimeter.source === '(?:)' )
        hasEmptyDelimeter = true;
        // debugger;
      }
      else
      {
        if( delimeter.length === 0 )
        hasEmptyDelimeter = true;
      }
      closests[ d ] = delimeterNext( d, position );
    }

    // let delimeter;

    do
    {
      closestWhich();

      if( closestPosition === o.src.length )
      break;

      if( !delimeter.length )
      position += 1;

      ordinaryAdd( o.src.substring( position, closestPosition ) );

      if( delimeter.length > 0 || position < o.src.length )
      delimeterAdd( delimeter );

      position = closests[ closestIndex ] + ( delimeter.length ? delimeter.length : 1 );

      // debugger;
      for( let d = 0 ; d < o.delimeter.length ; d++ )
      if( closests[ d ] < position )
      closests[ d ] = delimeterNext( d, position );
      // debugger;

    }
    while( position < o.src.length );

    if( delimeter || !hasEmptyDelimeter )
    ordinaryAdd( o.src.substring( position, o.src.length ) );

  }

  return result;

  /* */

  function delimeterAdd( delimeter )
  {

    if( o.preservingDelimeters )
    if( o.preservingEmpty || delimeter )
    {
      result.push( delimeter );
      // if( _.regexpIs( delimeter ) )
      // result.push( delimeter );
      // o.src.substring( position, closestPosition )
      // else
      // result.push( delimeter );
    }

  }

  /*  */

  function ordinaryAdd( ordinary )
  {
    if( o.preservingEmpty || ordinary )
    result.push( ordinary );
  }

  /* */

  function closestWhich()
  {

    closestPosition = o.src.length;
    closestIndex = -1;
    for( let d = 0 ; d < o.delimeter.length ; d++ )
    {
      if( closests[ d ] < o.src.length && closests[ d ] < closestPosition )
      {
        closestPosition = closests[ d ];
        closestIndex = d;
      }
    }

    delimeter = foundDelimeters[ closestIndex ];

  }

  /* */

  function delimeterNext( d, position )
  {
    _.assert( position <= o.src.length );
    let delimeter = o.delimeter[ d ];
    let result;

    if( _.strIs( delimeter ) )
    {
      result = o.src.indexOf( delimeter, position );
    }
    else
    {
      let execed = delimeter.exec( o.src.substring( position ) );
      if( execed )
      {
        result = execed.index + position;
        foundDelimeters[ d ] = execed[ 0 ];
      }
    }

    if( result === -1 )
    return o.src.length;
    return result;
  }

}

strSplitFast_body.defaults =
{
  src : null,
  delimeter : ' ',
  preservingEmpty : 1,
  preservingDelimeters : 1,
}

//

/**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplitFast( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : ', '  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplitFast( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplitFast( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplitFast( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplitFast
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

let strSplitFast = _.routineFromPreAndBody( strSplitFast_pre, strSplitFast_body );

_.assert( strSplitFast.pre === strSplitFast_pre );
_.assert( strSplitFast.body === strSplitFast_body );
_.assert( _.objectIs( strSplitFast.defaults ) );

//

function strSplit_body( o )
{

  o.delimeter = _.arrayAs( o.delimeter );

  if( !o.stripping && !o.quoting && !o.onDelimeter )
  {
    return _.strSplitFast.body( _.mapOnly( o, _.strSplitFast.defaults ) );
  }

  /* */

  _.assert( arguments.length === 1 );

  /* */

  let result = [];
  let fastOptions = _.mapOnly( o, _.strSplitFast.defaults );
  fastOptions.preservingEmpty = 1;
  fastOptions.preservingDelimeters = 1;

  if( o.quoting )
  fastOptions.delimeter = _.arrayPrependArraysOnce( [], [ o.quotingPrefixes, o.quotingPostfixes, fastOptions.delimeter ] );

  o.splits = _.strSplitFast.body( fastOptions );

  if( o.quoting )
  _.strSplitsQuotedRejoin.body( o );

  if( !o.preservingDelimeters )
  _.strSplitsDropDelimeters.body( o );

  if( o.stripping )
  _.strSplitsStrip.body( o );

  if( !o.preservingEmpty )
  _.strSplitsDropEmpty.body( o );

  /* */

  return o.splits;
}

var defaults = strSplit_body.defaults = Object.create( strSplitFast_body.defaults );

defaults.preservingEmpty = 1;
defaults.preservingDelimeters = 1;
defaults.preservingQuoting = 1;
defaults.inliningQuoting = 1;

defaults.stripping = 1;
defaults.quoting = 1;
defaults.quotingPrefixes = null;
defaults.quotingPostfixes = null;

defaults.onDelimeter = null;
defaults.onQuote = null;

//

/**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a, b, c, d', delimeter : ', '  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplit( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 * _.strSplit( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplit( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

let pre = [ strSplitFast.pre, strSplitsQuotedRejoin.pre, strSplitsDropDelimeters.pre, strSplitsStrip.pre, strSplitsDropEmpty.pre ];
let strSplit = _.routineFromPreAndBody( pre, strSplit_body );

_.assert( strSplit.pre !== strSplitFast.pre );
_.assert( _.routineIs( strSplit.pre ) );
_.assert( strSplit.body === strSplit_body );
_.assert( _.objectIs( strSplit.defaults ) );

//

let strSplitNonPreserving = _.routineFromPreAndBody( strSplit.pre, strSplit.body );

var defaults = strSplitNonPreserving.defaults;

defaults.preservingEmpty = 0
defaults.preservingDelimeters = 0;

//

/*
qqq : cover it by test
*/

function strSplitCamel( src )
{

  let splits = _.strSplitFast( src, /[A-Z]/ );

  for( let s = splits.length-2 ; s >= 0 ; s-- )
  {
    if( s % 2 === 1 )
    splits.splice( s, 2, splits[ s ].toLowerCase() + splits[ s + 1 ] );
  }

  return splits;
}

// --
// extractor
// --

/**
 * Gets substring out of source string according to a given range.
 * The end value of the range is not included in the substring.
 * Returns result as string.
 *
 * @param {string} srcStr - Source string.
 * @param {range} range - Source range.
 * @returns {string} Returns the corresponding substring.
 *
 * @example
 * //returns [ 'first', [ 0, 2 ] ]
 * _.strSub( 'fi' );
 *
 * @method strSub
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( range ) is not a range.
 * @memberof wTools
 *
 */

function _strSub( srcStr, range )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.rangeIs( range ) );

  return srcStr.substring( range[ 0 ], range[ 1 ] );
}

//

function _strExtractInlined_body( o )
{

  _.assert( arguments.length === 1, 'Expects single options map' );

  if( o.delimeter === null )
  o.delimeter = '#';

  let splitArray = _.strSplit
  ({
    src : o.src,
    delimeter : o.delimeter,
    stripping : o.stripping,
    quoting : o.quoting,
    preservingEmpty : 1,
    preservingDelimeters : 1,
  });

  if( splitArray.length <= 1 )
  {
    if( !o.preservingEmpty )
    if( splitArray[ 0 ] === '' )
    splitArray.splice( 0, 1 );
    return splitArray;
  }

  /*
  first - for tracking index to insert ordinary text
  onInlined should be called first and
  if undefined returned escaped text shoud be treated as ordinary
  so tracking index to insert ordinary text ( in case not undefined returned ) required
  */

  let first = 0;
  let result = [];
  let i = 0;
  for( ; i < splitArray.length ; i += 4 )
  {

    if( splitArray.length-i >= 4 )
    {
      if( handleTriplet() )
      handleOrdinary();
    }
    else
    {
      if( splitArray.length > i+1 )
      {
        splitArray[ i ] = splitArray.slice( i, splitArray.length ).join( '' );
        splitArray.splice( i+1, splitArray.length-i-1 );
      }
      handleOrdinary();
      _.assert( i+1 === splitArray.length, 'Openning delimeter', o.delimeter, 'does not have closing' );
    }

  }

  return result;

  /* */

  function handleTriplet()
  {

    let delimeter1 = splitArray[ i+1 ];
    let escaped = splitArray[ i+2 ];
    let delimeter2 = splitArray[ i+3 ];

    if( o.onInlined )
    escaped = o.onInlined( escaped, o, [ delimeter1, delimeter2 ] );

    if( escaped === undefined )
    {
      _.assert( _.strIs( splitArray[ i+4 ] ) );
      splitArray[ i+2 ] = splitArray[ i+0 ] + splitArray[ i+1 ] + splitArray[ i+2 ];
      splitArray.splice( i, 2 );
      i -= 4;
      return false;
    }

    first = result.length;

    if( o.preservingDelimeters && delimeter1 !== undefined )
    if( o.preservingEmpty || delimeter1 )
    result.push( delimeter1 );

    if( o.preservingInlined && escaped !== undefined )
    if( o.preservingEmpty || escaped )
    result.push( escaped );

    if( o.preservingDelimeters && delimeter2 !== undefined )
    if( o.preservingEmpty || delimeter2 )
    result.push( delimeter2 );

    return true;
  }

  /* */

  function handleOrdinary()
  {
    let ordinary = splitArray[ i+0 ];

    if( o.onOrdinary )
    ordinary = o.onOrdinary( ordinary, o );

    if( o.preservingOrdinary && ordinary !== undefined )
    if( o.preservingEmpty || ordinary )
    result.splice( first, 0, ordinary );

    first = result.length;
  }

}

_strExtractInlined_body.defaults =
{

  src : null,
  delimeter : null,
  // delimeterLeft : null,
  // delimeterRight : null,
  stripping : 0,
  quoting : 0,

  onOrdinary : null,
  onInlined : ( e ) => [ e ],

  preservingEmpty : 1,
  preservingDelimeters : 0,
  preservingOrdinary : 1,
  preservingInlined : 1,

}

//

let strExtractInlined = _.routineFromPreAndBody( strSplitFast_pre, _strExtractInlined_body );

//

function _strExtractInlinedStereo_body( o )
{

  _.assert( arguments.length === 1, 'Expects single options map argument' );

  let splitArray = _.strSplit
  ({
    src : o.src,
    delimeter : o.prefix,
    stripping : o.stripping,
    quoting : o.quoting,
    preservingEmpty : 1,
    preservingDelimeters : 0,
  });

  if( splitArray.length <= 1 )
  {
    if( !o.preservingEmpty )
    if( splitArray[ 0 ] === '' )
    splitArray.splice( 0, 1 );
    return splitArray;
  }

  let result = [];

  /* */

  if( splitArray[ 0 ] )
  result.push( splitArray[ 0 ] );

  /* */

  for( let i = 1; i < splitArray.length; i++ )
  {
    let halfs = _.strIsolateLeftOrNone( splitArray[ i ], o.postfix );

    _.assert( halfs.length === 3 );

    let inlined = halfs[ 2 ];

    inlined = o.onInlined ? o.onInlined( inlined ) : inlined;

    if( inlined !== undefined )
    {
      result.push( halfs[ 0 ] );
      result.push( inlined );
      // if( inlined[ 2 ] )
      // result.push( inlined[ 2 ] );
    }
    else
    {
      if( result.length )
      debugger;
      else
      debugger;
      if( result.length )
      result[ result.length-1 ] += o.prefix + splitArray[ i ];
      else
      result.push( o.prefix + splitArray[ i ] );
    }

  }

  return result;
}

_strExtractInlinedStereo_body.defaults =
{
  src : null,

  prefix : '#',
  postfix : '#',
  stripping : 0,
  quoting : 0,

  onInlined : null,

  preservingEmpty : 1,
  preservingDelimeters : 0,
  preservingOrdinary : 1,
  preservingInlined : 1,

}

//

/**
 * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) delimeters
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
 *
 * Returns result as array of strings.
 *
 * Function extracts words in two attempts:
 * First by splitting source string by ( o.prefix ).
 * Second by splitting each element of the result of first attempt by( o.postfix ).
 * If splitting by ( o.prefix ) gives only single element then second attempt is skipped, otherwise function
 * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onInlined ) function on first half.
 * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
 * with ( o.prefix ) prepended to the last element of result array.
 *
 * @param {string} src - Source string.
 * @param {object} o - Options map.
 * @param {string} [ o.prefix = '#' ] - delimeter that marks begining of enclosed string
 * @param {string} [ o.postfix = '#' ] - delimeter that marks ending of enclosed string
 * @param {string} [ o.onInlined = null ] - function called on each splitted part of a source string
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strExtractInlinedStereo( '#abc#' );
 * //returns [ '', 'abc', '' ]
 *
 * @example
 * _.strExtractInlinedStereo.call( { prefix : '#', postfix : '$' }, '#abc$' );
 * //returns [ 'abc' ]
 *
 * @example
 * function onInlined( strip )
 * {
 *   if( strip.length )
 *   return strip.toUpperCase();
 * }
 * _.strExtractInlinedStereo.call( { postfix : '$', onInlined }, '#abc$' );
 * //returns [ 'ABC' ]
 *
 * @method strExtractInlinedStereo
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

// let strExtractInlinedStereo = _.routineFromPreAndBody( strSplitFast_pre, _strExtractInlinedStereo_body );

function strExtractInlinedStereo( o )
{

  if( _.strIs( o ) )
  o = { src : o }

  _.assert( this === _ );
  _.assert( _.strIs( o.src ) );
  _.assert( _.objectIs( o ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( strExtractInlinedStereo, o );

  let result = [];
  let splitted = o.src.split( o.prefix );

  if( splitted.length === 1 )
  return splitted;

  /* */

  if( splitted[ 0 ] )
  result.push( splitted[ 0 ] );

  /* */

  for( let i = 1; i < splitted.length; i++ )
  {
    let halfs = _.strIsolateLeftOrNone( splitted[ i ], o.postfix );
    let strip = o.onInlined ? o.onInlined( halfs[ 0 ] ) : halfs[ 0 ];

    _.assert( halfs.length === 3 );

    if( strip !== undefined )
    {
      result.push( strip );
      if( halfs[ 2 ] )
      result.push( halfs[ 2 ] );
    }
    else
    {
      if( result.length )
      debugger;
      else
      debugger;
      if( result.length )
      result[ result.length-1 ] += o.prefix + splitted[ i ];
      else
      result.push( o.prefix + splitted[ i ] );
    }

  }

  return result;
}

strExtractInlinedStereo.defaults =
{
  src : null,
  prefix : '#',
  postfix : '#',
  onInlined : null,
}

//

/**
 * Splits string( srcStr ) into parts using array( maskArray ) as mask and returns them as array.
 * Mask( maskArray ) contains string(s) separated by marker( strUnjoin.any ). Mask must starts/ends with first/last letter from source
 * or can be replaced with marker( strUnjoin.any ). Position of( strUnjoin.any ) determines which part of source string will be splited:
 * - If( strUnjoin.any ) is before string it marks everything before that string. Example: ( [ _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is after string it marks everything after that string. Example: ( [ 'prefix', _.strUnjoin.any ] ).
 * - If( strUnjoin.any ) is between two strings it marks everything between them. Example: ( [ 'prefix', _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is before and after string it marks all except that string. Example: ( [ '_.strUnjoin.any', something, '_.strUnjoin.any' ] ).
 *
 * @param {string} srcStr - Source string.
 * @param {array} maskArray - Contains mask for source string.
 * @returns {array} Returns array with unjoined string part.
 *
 * @example
 * //returns [ 'prefix', '_something_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix_', 'something', '_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'something', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix_something_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix', '_something_postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any ] );
 *
 * @example
 * //returns [ 'prefi', 'x', '_something_', 'p', 'ostfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'x', _.strUnjoin.any, 'p', _.strUnjoin.any ] );
 *
 * @method strUnjoin
 * @throws { Exception } If no arguments provided.
 * @throws { Exception } If( srcStr ) is not a String.
 * @throws { Exception } If( maskArray ) is not a Array.
 * @throws { Exception } If( maskArray ) value is not String or strUnjoin.any.
 * @memberof wTools
 *
 */

function strUnjoin( srcStr, maskArray )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.arrayIs( maskArray ) );

  let result = [];
  let index = 0;
  let rindex = -1;

  /**/

  for( let m = 0 ; m < maskArray.length ; m++ )
  {

    let mask = maskArray[ m ];

    if( !checkMask( mask ) )
    return;

  }

  if( rindex !== -1 )
  {
    index = srcStr.length;
    if( !checkToken() )
    return;
  }

  if( index !== srcStr.length )
  return;

  /**/

  return result;

  /**/

  function checkToken()
  {

    if( rindex !== -1 )
    {
      _.assert( rindex <= index );
      result.push( srcStr.substring( rindex, index ) );
      rindex = -1;
      return true;
    }

    return false;
  }

  /**/

  function checkMask( mask )
  {

    _.assert( _.strIs( mask ) || mask === strUnjoin.any , 'Expects string or strUnjoin.any, got' , _.strType( mask ) );

    if( _.strIs( mask ) )
    {
      index = srcStr.indexOf( mask, index );

      if( index === -1 )
      return false;

      if( rindex === -1 && index !== 0 )
      return false;

      checkToken();

      result.push( mask );
      index += mask.length;

    }
    else if( mask === strUnjoin.any )
    {
      rindex = index;
    }
    else _.assert( 0, 'unexpected mask' );

    return true;
  }

}

strUnjoin.any = _.any;
_.assert( _.routineIs( strUnjoin.any ) );

// --
// joiner
// --

/**
 * Returns a string with the source string appended to itself n-times.
 * Expects two objects: source string( s ) ( or array of strings ) and number of concatenations( times ).
 * The string ( s ) and the number ( times ) remain unchanged.
 *
 * @param { Array/String } s - Source array of strings / source string.
 * @param { Number } times - Number of concatenation cycles.
 * @returns { String } - Returns a string containing the src string concatenated n-times.
 *
 * @example
 * //returns WordWordWordWordWord
 * _.strDup( 'Word', 5 );
 *
 * @example
 * //returns 1 21 2
 * _.strDup( '1 '+'2', 2 );
 *
 * @example
 * //returns [ 'abab', 'dd', '3 43 4']
 * _.strDup( [ 'ab', 'd', '3 4'], 2 );
 *
 * @method strDup
 * @throws { Exception } Throw an exception if( s ) is not a String or an array of strings.
 * @throws { Exception } Throw an exception if( times ) is not a Number.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function _strDup( s, times )
{
  let result = '';

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( s ) );
  _.assert( _.numberIs( times ) );

  for( let t = 0 ; t < times ; t++ )
  result += s;

  return result;
}

//

/**
 * Joins objects inside the source array, by concatenating their values in order that they are specified.
 * The source array can contain strings, numbers and arrays. If arrays are provided, they must have same length.
 * Joins arrays by concatenating all elements with same index into one string and puts it into new array at same position.
 * Joins array with other object by concatenating each array element with that object value. Examples: ( [ [ 1, 2 ], 3 ] ) -> ( [ '13', '23' ] ),
 * ( [ [ 1, 2 ], [ 1, 2] ] ) -> ( [ '11', '22' ] ).
 * An optional second string argument can be passed to the function. This argument ( joiner ) defines the string that joins the
 * srcArray objects.  Examples: ( [ [ 1, 2 ], 3 ], '*' ) -> ( [ '1*3', '2*3' ] ),
 * ( [ [ 1, 2 ], [ 1, 2 ] ], ' to ' ) -> ( [ '1 to 1', '2 to 2' ] ).
 *
 * @param { Array-like } srcs - Source array with the provided objects.
 * @param { String } joiner - Optional joiner parameter.
 * @returns { Object } Returns concatenated objects as string or array. Return type depends from arguments type.
 *
 * @example
 * //returns '123'
 * _.strJoin([ 1, 2, 3 ]);
 *
 * @example
 * //returns [ '12', '22', '32' ]
 * _.strJoin([ [ 1, 2, 3 ], 2 ]);
 *
 * @example
 * //returns [ '11', '23' ]
 * _.strJoin([ [ 1, 2 ], [ 1, 3 ] ]);
 *
 * @example
 * //returns [ '1236', '1247', '1258' ]
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ]);
 *
 * @example
 * //returns [ '1 2 3 6', '1 2 4 7', '1 2 5 8' ]
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ], ' ');
 *
 * @method strJoin
 * @throws { Exception } If ( arguments.length ) is not one or two.
 * @throws { Exception } If some object from( srcs ) is not a Array, String or Number.
 * @throws { Exception } If length of arrays in srcs is different.
 * @throws { Exception } If ( joiner ) is not undefined or a string .
 * @memberof wTools
 *
 */

function strJoin_pre( routine, args )
{

  let o = args[ 0 ];
  if( args[ 1 ] !== undefined || _.arrayLike( args[ 0 ] ) )
  o = { srcs : args[ 0 ], join : args[ 1 ] };

  _.routineOptions( routine, o );
  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2, () => 'Expects an array of string and optional join, but got ' + args.length + ' arguments' );
  _.assert( _.arrayLike( o.srcs ), () => 'Expects an array of strings, but got ' + _.strType( o.srcs ) );
  _.assert( o.join === null || _.strIs( o.join ), () => 'Expects optional join, but got ' + _.strType( o.join ) );

  return o;
}

//

// function strJoin_body( srcs, delimeter )
function strJoin_body( o )
{
  // let result = [ '' ];
  // let arrayEncountered = 0;
  let arrayLength;

  _.assertRoutineOptions( strJoin_body, arguments );

  let delimeter = o.join || '';
  if( o.join === null || _.strIs( o.join ) )
  o.join = join;

  // debugger;

  if( !o.srcs.length )
  return [];

  /* */

  for( let a = 0 ; a < o.srcs.length ; a++ )
  {
    let src = o.srcs[ a ];

    if( _.arrayIs( src ) )
    {
      _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
      arrayLength = src.length;
    }

  }

  if( arrayLength === 0 )
  return [];

  /* */

  if( arrayLength === undefined )
  {
    let result = '';

    for( let a = 0 ; a < o.srcs.length ; a++ )
    {
      let src = o.srcs[ a ];
      let srcStr = o.str( src );
      _.assert( _.strIs( srcStr ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
      result = o.join( result, srcStr, a );
    }

    return result;
  }
  else
  {

    let result = [];
    for( let i = 0 ; i < arrayLength ; i++ )
    result[ i ] = '';

    for( let a = 0 ; a < o.srcs.length ; a++ )
    {
      let src = o.srcs[ a ];

      // _.assert( _.strIs( srcStr ) || _.arrayIs( src ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
      // _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );

      if( _.arrayIs( src ) )
      {

        // if( arrayEncountered === 0 )
        // for( let s = 1 ; s < src.length ; s++ )
        // result[ s ] = result[ 0 ];

        // _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
        // arrayLength = src.length;

        // arrayEncountered = 1;
        for( let s = 0 ; s < result.length ; s++ )
        result[ s ] = o.join( result[ s ], src[ s ], a );

      }
      else
      {

        let srcStr = o.str( src );
        _.assert( _.strIs( srcStr ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
        for( let s = 0 ; s < result.length ; s++ )
        result[ s ] = o.join( result[ s ], srcStr, a );

      }

    }

    return result;
  }

  /* */

  if( arrayEncountered )
  return result;
  else
  return result[ 0 ];

  /* */

  function join( result, src, a )
  {
    if( delimeter && a > 0 )
    return result + delimeter + src;
    else
    return result + src;
  }

}

strJoin_body.defaults =
{
  srcs : null,
  join : null,
  str : _.strPrimitive,
}

let strJoin = _.routineFromPreAndBody( strJoin_pre, strJoin_body );

//

function strJoinPath( srcs, joiner )
{
  let result = [ '' ];
  let arrayEncountered = 0;
  let arrayLength;

  _.assert( arguments.length === 2, () => 'Expects an array of string and joiner, but got ' + arguments.length + ' arguments' );
  _.assert( _.arrayLike( srcs ), () => 'Expects an array of strings, but got ' + _.strType( srcs ) );
  _.assert( _.strIs( joiner ), () => 'Expects joiner, but got ' + _.strType( joiner ) );

  /* xxx */

  for( let a = 0 ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];

    _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );

    if( _.arrayIs( src ) )
    {

      if( arrayEncountered === 0 )
      for( let s = 1 ; s < src.length ; s++ )
      result[ s ] = result[ 0 ];

      _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
      arrayLength = src.length;

      arrayEncountered = 1;
      for( let s = 0 ; s < src.length ; s++ )
      join( src[ s ], s, a );

    }
    else
    {

      for( let s = 0 ; s < result.length ; s++ )
      join( src, s, a );

    }

  }

  if( arrayEncountered )
  return result;
  else
  return result[ 0 ];

  /* */

  function join( src, s, a )
  {
    if( _.numberIs( src ) )
    src = src.toString();

    if( a > 0 && joiner )
    {
      let ends = _.strEnds( result[ s ], joiner );
      let begins = _.strBegins( src, joiner );
      if( begins && ends )
      result[ s ] = _.strRemoveEnd( result[ s ], joiner ) + src;
      else if( begins || ends )
      result[ s ] += src;
      else
      result[ s ] += joiner + src;
    }
    else
    {
      result[ s ] += src;
    }
  }
}


//

function strConcat( srcs, o )
{

  o = _.routineOptions( strConcat, o || Object.create( null ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.strConcat === strConcat );

  let defaultOptionsForToStr =
  {
    stringWrapper : '',
  }

  o.optionsForToStr = _.mapSupplement( o.optionsForToStr, defaultOptionsForToStr, strConcat.defaults.optionsForToStr );

  if( _.routineIs( srcs ) )
  return srcs();

  if( !_.arrayLike( srcs ) )
  srcs = [ srcs ];

  let result = '';
  if( !srcs.length )
  return result;

  /* */

  let nl = 1;
  for( let a = 0 ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];
    src = _.toStr( src, o.optionsForToStr );
    if( !nl )
    {
      let i = src.trim().lastIndexOf( o.lineDelimter );
      if( i === -1 )
      {
        if( result[ result.length-1 ] !== ' ' && src[ 0 ] !== ' ' )
        result += o.delimeter;
      }
      else
      {
        if( i !== 0 )
        result += o.lineDelimter;
      }
    }
    if( src.length )
    nl = src[ src.length-1 ] === o.lineDelimter;
    result += src;
  }

  /* */

  if( o.linePrefix || o.linePostfix )
  {
    result = result.split( o.lineDelimter );
    result = o.linePrefix + result.join( o.linePostfix + o.lineDelimter + o.linePrefix ) + o.linePostfix;
  }

  /* */

  return result;
}

strConcat.defaults =
{
  linePrefix : '',
  linePostfix : '',
  lineDelimter : '\n',
  delimeter : ' ',
  optionsForToStr : null,
}

// --
// liner
// --

/**
 * Adds indentation character(s) to passed string.
 * If( src ) is a multiline string, function puts indentation character( tab ) before first
 * and every next new line in a source string( src ).
 * If( src ) represents single line, function puts indentation at the begining of the string.
 * If( src ) is a Array, function prepends indentation character( tab ) to each line( element ) of passed array.
 *
 * @param { String/Array } src - Source string to parse or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strIndentation( array.join( '\n' ), '_' ).
 * @param { String } tab - Indentation character.
 * @returns { String } Returns indented string.
 *
 * @example
 *  _.strIndentation( 'abc', '_' )
 * //returns '_abc'
 *
 * @example
 * _.strIndentation( 'a\nb\nc', '_' )
 * //returns
 * _a
 * _b
 * _c
 *
 * @example
 * _.strIndentation( [ 'a', 'b', 'c' ], '_' )
 * //returns
 * _a
 * _b
 * _c
 *
 * @example
 * let array = [ 'a\nb', 'c\nd' ];
 * _.strIndentation( array.join( '\n' ), '_' )
 * //returns
 * _a
 * _b
 * _c
 * _d
 *
 * @method strIndentation
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @throws { Exception } Throw an exception if( tab ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not a equal 2.
 * @memberof wTools
 *
 */

/*
qqq : extend coverage of strIndentation
*/

function strIndentation( src, tab )
{

  _.assert( _.strIs( src ) || _.arrayIs( src ), 'Expects src as string or array' );
  _.assert( _.strIs( tab ), 'Expects string tab' );
  _.assert( arguments.length === 2, 'Expects two arguments' );

  if( _.strIs( src ) )
  {

    if( src.indexOf( '\n' ) === -1 )
    return src;

    // if( src.indexOf( '\n' ) === -1 )
    // return tab + src;

    src = src.split( '\n' );

  }

/*
  should be no tab in prolog
*/

  let result = src.join( '\n' + tab );
  // let result = tab + src.join( '\n' + tab );

  return result;
}

// //
//
// function strIndentationButFirst( src, tab )
// {
//
//   _.assert( _.strIs( src ) || _.arrayIs( src ), 'Expects src as string or array' );
//   _.assert( _.strIs( tab ), 'Expects string tab' );
//   _.assert( arguments.length === 2, 'Expects two arguments' );
//
//   if( _.strIs( src ) )
//   {
//
//     if( src.indexOf( '\n' ) === -1 )
//     return tab + src;
//
//     src = src.split( '\n' );
//
//   }
//
// /*
//   should be no tab in prolog
// */
//
//   let result = src.join( '\n' + tab );
//
//   return result;
// }

//

function strLinesSplit( src )
{
  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );
  if( _.arrayIs( src ) )
  return src;
  return src.split( '\n' );
}

//

function strLinesJoin( src )
{
  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );
  let result = src;
  if( _.arrayIs( src ) )
  result = src.join( '\n' );
  return result;
}

//

/**
 * Remove espace characters and white spaces at the begin or at the end of each line.
 * Input arguments can be strings or arrays of strings. If input is a string, it splits it in lines and
 * removes the white/escape characters from the beggining and the end of each line. If input is an array,
 * it treats it as a single string split into lines, where each entry corresponds to a line. Therefore,
 * it removes the white/escape characters only from the beggining and the end of the strings in the array.
 *
 * @param { String/Array } [ src ] - Source string or array of strings.
 * @returns { String/Array } Returns string/array with empty lines and spaces removed.
 *
 * @example input string
 * _.strLinesStrip( '  Hello \r\n\t World \n\n ' );
 * //returns 'Hello\nWorld'
 *
 * @example input array
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ] );
 * //returns  [ 'Hello \r\n\t world', '!' ]
 *
 * @example input strings
 * _.strLinesStrip( '  Hello \r\n\t', ' World \n\n  ! \n\n', '\n\n' );
 * //returns [ 'Hello', 'World\n!', '' ]
 *
 * @example input arrays
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ], [ '\n\nHow\n\nAre  ', '  \r\nyou ? \n'], [ '\t\r\n  ' ] );
 * //returns [ [ 'Hello \r\n\t world', '!' ], [ 'How\n\nAre', 'you ?' ], [] ]
 *
 * @method strLinesStrip
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @memberof wTools
 */

function strLinesStrip( src )
{

  if( arguments.length > 1 )
  {
    let result = _.unrollMake( null );
    for( let a = 0 ; a < arguments.length ; a++ )
    result[ a ] = strLinesStrip( arguments[ a ] );
    return result;
  }

  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );

  let lines = _.strLinesSplit( src );
  lines = lines.map( ( line ) => line.trim() ).filter( ( line ) => line );

  if( _.strIs( src ) )
  lines = _.strLinesJoin( lines );
  return lines;
}



//

/**
 * Puts line counter before each line/element of provided source( o.src ).
 * If( o.src ) is a string, function splits it into array using new line as splitter, then puts line counter at the begining of each line( element ).
 * If( o.src ) is a array, function puts line counter at the begining of each line( element ).
 * Initial value of a counter can be changed by defining( o.first ) options( o ) property.
 * Can be called in two ways:
 * - First by passing all options in one object;
 * - Second by passing source only and using default value of( first ).
 *
 * @param { Object } o - options.
 * @param { String/Array } [ o.src=null ] - Source string or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strLinesNumber( array.join( '\n' ) ).
 * @param { Number} [ o.first=1 ] - Sets initial value of a counter.
 * @returns { String } Returns string with line enumeration.
 *
 * @example
 * _.strLinesNumber( 'line' );
 * //returns '1 : line'
 *
 * @example
 * _.strLinesNumber( 'line1\nline2\nline3' );
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( [ 'line', 'line', 'line' ] );
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( { src:'line1\nline2\nline3', first : 2 } );
 * //returns
 * // 2: line1
 * // 3: line2
 * // 4: line3
 *
 * @method strLinesNumber
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String or Array.
 * @memberof wTools
 */

function strLinesNumber( o )
{

  if( !_.objectIs( o ) )
  o = { src : arguments[ 0 ], first : arguments[ 1 ] };

  _.routineOptions( strLinesNumber, o );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( o.src ) || _.strsAreAll( o.src ), 'Expects string or strings {-o.src-}' );

  /* */

  if( o.first === null  )
  {
    if( o.firstChar === null )
    o.first = 1;
    else if( _.numberIs( o.firstChar ) )
    {
      debugger;
      let src = _.arrayIs( o.src ) ? o.src.join( '\n' ) : o.src;
      o.first = _.strLinesCount( src.substring( 0, o.firstChar+1 ) );
    }
  }

  /* */

  let lines = _.strIs( o.src ) ? o.src.split( '\n' ) : o.src;

  /* */

  if( o.onLine ) for( let l = 0; l < lines.length; l += 1 )
  {
    lines[ l ] = o.onLine( [ ( l + o.first ), ' : ', lines[ l ] ], o );
    if( lines[ l ] === undefined )
    {
      lines.splice( l, 1 );
      l -= 1;
    }
    _.assert( _.strIs( lines[ l ] ) );
  }
  else for( let l = 0; l < lines.length; l += 1 )
  {
    lines[ l ] = ( l + o.first ) + ' : ' + lines[ l ];
  }

  return lines.join( '\n' );
}

strLinesNumber.defaults =
{
  src : null,
  first : null,
  firstChar : null,
  onLine : null,
}

//

// function strLinesAt( code, line, radius )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( code ) || _.arrayIs( code ) );
//   _.assert( _.numberIs( line ) );
//
//   if( radius === undefined )
//   radius = 2;
//
//   debugger;
//
//   let lines = code.split( '\n' );
//   let result = lines.slice( line-radius, line+radius-1 );
//   result = _.strLinesNumber( result, line-radius+1 );
//
//   return result;
// }

//

/**
 * Selects range( o.range ) of lines from source string( o.src ).
 * If( o.range ) is not specified and ( o.line ) is provided function uses it with ( o.selectMode ) option to generate new range.
 * If( o.range ) and ( o.line ) are both not provided function generates range by formula: [ 0, n + 1 ], where n: number of ( o.delimteter ) in source( o.src ).
 * Returns selected lines range as string or empty string if nothing selected.
 * Can be called in three ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 * - Third by passing source string( o.src ), range start and end position.
 *
 * @param {Object} o - Options.
 * @param {String} [ o.src=null ] - Source string.
 * @param {Array|Number} [ o.range=null ] - Sets range of lines to select from( o.src ) or single line number.
 * @param {Number} [ o.zero=1 ] - Sets base value for a line counter.
 * @param {Number} [ o.number=0 ] - If true, puts line counter before each line by using o.range[ 0 ] as initial value of a counter.
 * @param {String} [ o.delimteter='\n' ] - Sets new line character.
 * @param {String} [ o.line=null ] - Sets line number from which to start selecting, is used only if ( o.range ) is null.
 * @param {Number} [ o.numberOfLines=3 ] - Sets maximal number of lines to select, is used only if ( o.range ) is null and ( o.line ) option is specified.
 * @param {String} [ o.selectMode='center' ] - Determines in what way funtion must select lines, works only if ( o.range ) is null and ( o.line ) option is specified.
 * Possible values:
 * - 'center' - uses ( o.line ) index as center point and selects ( o.numberOfLines ) lines in both directions.
 * - 'begin' - selects ( o.numberOfLines ) lines from start point ( o.line ) in forward direction;
 * - 'end' - selects ( o.numberOfLines ) lines from start point ( o.line ) in backward direction.
 * @returns {string} Returns selected lines as new string or empty if nothing selected.
 *
 * @example
 * //selecting single line
 * _.strLinesSelect( 'a\nb\nc', 1 );
 * //returns 'a'
 *
 * @example
 * //selecting first two lines
 * _.strLinesSelect( 'a\nb\nc', [ 1, 3 ] );
 * //returns
 * 'a
 * b'
 *
 * @example
 * //selecting first two lines, second way
 * _.strLinesSelect( 'a\nb\nc', 1, 3 );
 * //returns
 * 'a
 * b'
 *
 * @example
 * //custom new line character
 * _.strLinesSelect({ src : 'a b c', range : [ 1, 3 ], delimteter : ' ' });
 * //returns 'a b'
 *
 * @example
 * //setting preferred number of lines to select, line option must be specified
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 1 });
 * //returns 'b'
 *
 * @example
 * //selecting 2 two next lines starting from second
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'begin' });
 * //returns
 * 'b
 * c'
 *
 * @example
 * //selecting 2 two lines starting from second in backward direction
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'end' });
 * //returns
 * 'a
 * b'
 *
 * @method strLinesSelect
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.range ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */

function strLinesSelect( o )
{

  if( arguments.length === 2 )
  {

    if( _.arrayIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : arguments[ 1 ] };
    else if( _.numberIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 1 ]+1 ] };
    else _.assert( 0, 'unexpected argument', _.strType( range ) );

  }
  else if( arguments.length === 3 )
  {
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 2 ] ] };
  }

  _.assert( arguments.length <= 3 );
  _.assert( _.strIs( o.src ) );
  _.routineOptions( strLinesSelect, o );

  /* range */

  if( !o.range )
  {
    if( o.line !== null )
    {
      if( o.selectMode === 'center' )
      o.range = [ o.line - Math.ceil( ( o.numberOfLines + 1 ) / 2 ) + 1, o.line + Math.floor( ( o.numberOfLines - 1 ) / 2 ) + 1 ];
      else if( o.selectMode === 'begin' )
      o.range = [ o.line, o.line + o.numberOfLines ];
      else if( o.selectMode === 'end' )
      o.range = [ o.line - o.numberOfLines+1, o.line+1 ];
    }
    else
    {
      o.range = [ 0, _.strCount( o.src, o.delimteter )+1 ];
    }
  }

  _.assert( _.longIs( o.range ) );

  /* */

  let f = 0;
  let counter = o.zero;
  while( counter < o.range[ 0 ] )
  {
    f = o.src.indexOf( o.delimteter, f );
    if( f === -1 )
    return '';
    f += o.delimteter.length;
    counter += 1;
  }

  /* */

  let l = f-1;
  while( counter < o.range[ 1 ] )
  {
    l += 1;
    l = o.src.indexOf( o.delimteter, l );
    if( l === -1 )
    {
      l = o.src.length;
      break;
    }
    counter += 1;
  }

  /* */

  let result = f < l ? o.src.substring( f, l ) : '';

  /* number */

  if( o.number )
  result = _.strLinesNumber( result, o.range[ 0 ] );

  return result;
}

strLinesSelect.defaults =
{
  src : null,
  range : null,

  line : null,
  numberOfLines : 3,
  selectMode : 'center',

  number : 0,
  zero : 1,
  delimteter : '\n',
}

//

/**
 * Get the nearest ( o.numberOfLines ) lines to the range ( o.charsRange ) from source string( o.src ).
 * Returns object with two elements: .
 * Can be called in two ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 *
 * @param { Object } o - Options.
 * @param { String } [ o.src ] - Source string.
 * @param { Array|Number } [ o.range ] - Sets range of lines to select from( o.src ) or single line number.
 * @param { Number } [ o.numberOfLines ] - Sets number of lines to select.
 * @returns { Object } o - Returns object with Options with fields:
 * @returns { Array } [ o.splits ] - Array with three entries:
 * o.splits[ 0 ] and o.splits[ 2 ] contains a string with the nearest lines,
 * and o.splits[ 1 ] contains the substring corresponding to the range.
 * @returns { Array } [ o.spans ] - Array with indexes of begin and end of nearest lines.
 *
 * @example
 * //selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRange : [ 2, 4 ],
 *   numberOfLines : 1,
 * });
 * //returns o.splits = [ 'a', '\nb', 'c' ];
 * //returns o.spans = [ 1, 2, 4, 5 ];
 *
 * @example
 * //selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRange : 3,
 *   numberOfLines : 2,
 * });
 * //returns o.splits = [ 'a\n', 'b', 'c' ];
 * //returns o.spans = [ 1, 3, 4, 5 ];
 *
 * @method strLinesNearest
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.charsRange ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */

function strLinesNearest_pre( routine, args )
{

  let o = args[ 0 ];
  if( args[ 1 ] !== undefined )
  o = { src : args[ 0 ], charsRange : args[ 1 ] };

  _.routineOptions( routine, o );

  if( _.numberIs( o.charsRange ) )
  o.charsRange = [ o.charsRange, o.charsRange+1 ];

  _.assert( _.rangeIs( o.charsRange ) );

  return o;
}

//

function strLinesNearest_body( o )
{
  let result = Object.create( null );
  // let resultCharRange = [];
  let i, numberOfLines;

  result.splits = [];
  result.spans = [ o.charsRange[ 0 ], o.charsRange[ 0 ], o.charsRange[ 1 ], o.charsRange[ 1 ] ];
  logger.log( 'Result', result )
  logger.log( )
  /* */

  if( o.numberOfLines === 0 )
  {
    // result = [];
    result.splits = [];
    result.splits[ 0 ] = '';
    result.splits[ 1 ] = o.src.substring( o.charsRange[ 0 ], o.charsRange[ 1 ] );
    result.splits[ 2 ] = '';
    return result;
  }

  /* */

  let numberOfLinesLeft = Math.ceil( ( o.numberOfLines+1 ) / 2 );
  numberOfLines = numberOfLinesLeft;
  if( numberOfLines > 0 )
  {
    for( i = o.charsRange[ 0 ]-1 ; i >= 0 ; i-- )
    {
      if( o.src[ i ] === '\n' )
      numberOfLines -= 1;
      if( numberOfLines <= 0 )
      break;
    }
    i = i+1;
  }
  result.spans[ 0 ] = i;

  // 0 -> 0 + 0 = 0
  // 1 -> 1 + 1 = 2
  // 2 -> 2 + 1 = 3
  // 3 -> 2 + 2 = 4

  /* */

  let numberOfLinesRight = o.numberOfLines + 1 - numberOfLinesLeft;
  numberOfLines = numberOfLinesRight;
  if( numberOfLines > 0 )
  {
    for( i = o.charsRange[ 1 ] ; i < o.src.length ; i++ )
    {
      if( o.src[ i ] === '\n' )
      numberOfLines -= 1;
      if( numberOfLines <= 0 )
      break;
    }
  }
  result.spans[ 3 ] = i;

  /* */

  result.splits[ 0 ] = o.src.substring( result.spans[ 0 ], result.spans[ 1 ] );
  result.splits[ 1 ] = o.src.substring( result.spans[ 1 ], result.spans[ 2 ] );
  result.splits[ 2 ] = o.src.substring( result.spans[ 2 ], result.spans[ 3 ] );

  // result.splits[ 0 ] = o.src.substring( resultCharRange[ 0 ], o.charsRange[ 0 ] );
  // result.splits[ 1 ] = o.src.substring( o.charsRange[ 0 ], o.charsRange[ 1 ] );
  // result.splits[ 2 ] = o.src.substring( o.charsRange[ 1 ], resultCharRange[ 1 ] );

  return result;
}

strLinesNearest_body.defaults =
{
  src : null,
  charsRange : null,
  numberOfLines : 3,
  // outputFormat : 'map',
}

let strLinesNearest = _.routineFromPreAndBody( strLinesNearest_pre, strLinesNearest_body );

//

function strLinesNearestReport_body( o )
{
  let result = Object.create( null );

  debugger;
  result.nearest = _.strLinesNearest.body( o ).splits;
  // result.linesRange = _.strLinesRangeWithCharRange.body( o );

  result.report = result.nearest.slice();
  if( !o.gray )
  result.report[ 1 ] = _.color.strUnescape( _.color.strFormat( result.report[ 1 ], { fg : 'yellow' } ) );
  result.report = result.report.join( '' );

  result.report = _.strLinesSplit( result.report );
  if( !o.gray )
  result.report = _.color.strEscape( result.report );

  let f = _.strLinesCount( o.src.substring( 0, o.charsRange[ 0 ] ) )-1;
  result.report = _.strLinesNumber
  ({
    src : result.report,
    first : f,
    onLine : ( line ) =>
    {
      if( !o.gray )
      {
        line[ 0 ] = _.color.strFormat( line[ 0 ], { fg : 'bright black' } );
        line[ 1 ] = _.color.strFormat( line[ 1 ], { fg : 'bright black' } );
      }
      return line.join( '' );
    }
  });

  debugger;
  return result;
}

strLinesNearestReport_body.defaults =
{
  src : null,
  charsRange : null,
  numberOfLines : 3,
  gray : 0,
}

let strLinesNearestReport = _.routineFromPreAndBody( strLinesNearest_pre, strLinesNearestReport_body );

//

/**
 * Returns a count of lines in a string.
 * Expects one object: the string( src ) to be processed.
 *
 * @param {string} src - Source string.
 * @returns {number} Returns a number of lines in string.
 *
 * @example
 * //returns 2
 * _.strLinesCount( 'first\nsecond' );
 *
 * @example
 * //returns 4
 * _.strLinesCount( 'first\nsecond\nthird\n' );
 *
 * @method strLinesCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
*/

function strLinesCount( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );
  let result = src.indexOf( '\n' ) !== -1 ? src.split( '\n' ).length : 1;
  return result;
}

//

function strLinesRangeWithCharRange_pre( routine, args )
{

  let o = args[ 0 ];
  if( args[ 1 ] !== undefined )
  o = { src : args[ 0 ], charsRange : args[ 1 ] }

  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( _.rangeIs( o.charsRange ) );
  _.assert( _.strIs( o.src ) );
  _.routineOptions( routine, o );

  return o;
}

//

function strLinesRangeWithCharRange_body( o )
{

  let pre = o.src.substring( 0, o.charsRange[ 0 ] );
  let mid = o.src.substring( o.charsRange[ 0 ], o.charsRange[ 1 ] );
  let result = []

  result[ 0 ] = _.strLinesCount( pre )-1;
  result[ 1 ] = result[ 0 ] + _.strLinesCount( mid );

  return result;
}

strLinesRangeWithCharRange_body.defaults =
{
  src : null,
  charsRange : null,
}

let strLinesRangeWithCharRange = _.routineFromPreAndBody( strLinesRangeWithCharRange_pre, strLinesRangeWithCharRange_body );

// --
// declare
// --

let Proto =
{

  // checker

  strIsHex,
  strIsMultilined,
  strHas,
  strHasAny,
  strHasAll,
  strHasNone,
  strHasSeveral,

  strsAnyHas,
  strsAllHas,
  strsNoneHas,

  // evaluator

  strCount,
  // strCountLeft,
  // strCountRight,
  strsShortest,
  strsLongest,

  // replacer

  _strRemovedBegin,
  strRemoveBegin,
  _strRemovedEnd,
  strRemoveEnd,
  _strRemoved,
  strRemove,

  strReplaceBegin,
  strReplaceEnd,
  _strReplaced,
  strReplace,

  strPrependOnce,
  strAppendOnce,

  strReplaceWords,

  // etc

  strCommonLeft, /* document me */
  strCommonRight, /* document me */

  // formatter

  strForRange, /* experimental */
  strForCall, /* experimental */
  strStrShort,
  strDifference,

  // transformer

  strCapitalize,
  strDecapitalize,
  strEscape,
  strCodeUnicodeEscape,
  strUnicodeEscape, /* document me */
  strReverse,

  // stripper

  strStrip,
  strsStrip : _.routineVectorize_functor( strStrip ),
  strStripLeft,
  strsStripLeft : _.routineVectorize_functor( strStripLeft ),
  strStripRight,
  strsStripRight : _.routineVectorize_functor( strStripRight ),
  strRemoveAllSpaces : _.routineVectorize_functor( _strRemoveAllSpaces ),
  strStripEmptyLines : _.routineVectorize_functor( _strStripEmptyLines ),

  // splitter

  strSplitStrNumber, /* experimental */
  strSplitChunks, /* experimental */

  strSplitsCoupledGroup,
  strSplitsUngroupedJoin,
  strSplitsQuotedRejoin,
  strSplitsDropDelimeters,
  strSplitsStrip,
  strSplitsDropEmpty,

  strSplitFast,
  strSplit,
  strSplitNonPreserving,

  strSplitCamel,

  // strSplitNaive,

  // extractor

  strSub : _.routineVectorize_functor( _strSub ),
  strExtractInlined,
  strExtractInlinedStereo,
  strUnjoin, /* document me */

  // joiner

  strDup : _.routineVectorize_functor( _strDup ), /* document me */
  strJoin,
  strJoinPath, /* qqq : cover and document me */
  strConcat,

  // liner

  strIndentation,
  strLinesSplit,
  strLinesJoin,
  strLinesStrip, /* qqq : test coverage */
  strLinesNumber,
  strLinesSelect,
  strLinesNearest, /* qqq : check coverage */
  strLinesNearestReport,
  strLinesCount,
  strLinesRangeWithCharRange,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
};

  let _filePath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/StringTools.s' );
  let _dirPath_ = _starter_._pathResolve( _libraryDirPath_, 'dwtools/abase/l2/' );
  let __filename = _filePath_;
  let __dirname = _dirPath_;
  let module = _starter_._fileCreate( _filePath_, _dirPath_, StringTools_s_naked );
  let require = module.include;
  let include = module.include;

})(); // == end of file StringTools_s


module.exports = _starter_._fileInclude( _libraryDirPath_, './dwtools/abase/Layer2.s' );


})() // == end of library
