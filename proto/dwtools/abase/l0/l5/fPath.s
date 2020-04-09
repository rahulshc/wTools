( function _fPath_s_() {

'use strict';

/**
 * @summary Collection of routines to operate paths reliably and consistently.
 * @namespace "wTools.path"
 * @extends Tools
 */

//

let _global = _global_;
let _ = _global_.wTools;
let Self = _.path = _.path || Object.create( null );

// --
// meta
// --

function Init()
{
  let self = this;

  _.assert( _.strIs( self._rootStr ) );
  _.assert( _.strIs( self._upStr ) );
  _.assert( _.strIs( self._hereStr ) );
  _.assert( _.strIs( self._downStr ) );

  if( !self._downUpStr )
  self._downUpStr = self._downStr + self._upStr; /* ../ */
  if( !self._hereUpStr )
  self._hereUpStr = self._hereStr + self._upStr; /* ./ */

  self._rootRegSource = _.regexpEscape( self._rootStr );
  self._upRegSource = _.regexpEscape( self._upStr );
  self._downRegSource = _.regexpEscape( self._downStr );
  self._hereRegSource = _.regexpEscape( self._hereStr );
  self._downUpRegSource = _.regexpEscape( self._downUpStr );
  self._hereUpRegSource = _.regexpEscape( self._hereUpStr );

  let root = self._rootRegSource;
  let up = self._upRegSource;
  let down = self._downRegSource;
  let here = self._hereRegSource;

  let beginOrChar = '(?:.|^)';
  let butUp = `(?:(?!${up}).)+`;
  let notDownUp = `(?!${down}(?:${up}|$))`;
  let upOrBegin = `(?:^|${up})`;
  let upOrEnd = `(?:${up}|$)`;
  let splitOrUp = `(?:(?:${up}${up})|((${upOrBegin})${notDownUp}${butUp}${up}))`; /* split or / */

  self._delDownRegexp = new RegExp( `(${beginOrChar})${splitOrUp}${down}(${upOrEnd})`, '' );
  self._delHereRegexp = new RegExp( up + here + '(' + up + '|$)' );
  self._delUpDupRegexp = /\/{2,}/g;

}

//

function CloneExtending( o )
{
  _.assert( arguments.length === 1 );
  let result = Object.create( this )
  _.mapExtend( result, Parameters,o );
  result.Init();
  return result;
}

// --
// checker
// --

function is( path )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.strIs( path );
}

//

/**
 * Checks if string path is refined ( checks that the string doesn´t contain left( \\ ) or double slashes ( // ) ), and it also
 * returns true when the path has slash ( / ) in the end .
 * @param {String} filePath Source path for check
 * @returns {boolean}
 * @function isRefined
 * @namespace Tools.path
 */

function isRefined( path )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( path ), 'Expects string {-path-}, but got', _.strType( path ) );

  if( path[ 1 ] === ':' && path[ 2 ] === '\\' )
  return false;

  let leftSlash = /\\/g;
  let doubleSlash = /\/\//g;

  if( leftSlash.test( path ) )
  return false;

  return true;
}

// //
//
// /**
//  * Checks if string path is refined: checks that the string doesn´t contain left( \\ ) or double slashes ( // ) ), and that it is not trailed
//  * @param {String} filePath Source path for check
//  * @returns {boolean}
//  * @function isRefined
//  * @namespace Tools.path
//  */
//
// function isRefined( path )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.strIs( path ), 'Expects string {-path-}, but got', _.strType( path ) );
//
//   if( !this.isRefined( path ) )
//   return false;
//
//   return true;
// }

//

/**
 * Checks if string path is normalized, and maybe trailed ( ends with a slash ( / ) ).
 * @param {String} filePath Source path for check
 * @returns {boolean}
 * @function isNormalized
 * @namespace Tools.path
 */

function isNormalized( filePath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( filePath ), 'Expects string' );
  let normalizedPath = this.normalize( filePath )
  let trailedPath = this.trail( normalizedPath );
  return normalizedPath === filePath || trailedPath === filePath;
}

// //
//
// /**
//  * Checks if string path is normalized.
//  * @param {String} filePath Source path for check
//  * @returns {boolean}
//  * @function isNormalized
//  * @namespace Tools.path
//  */
//
// function isNormalized( filePath )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.strIs( filePath ), 'Expects string' );
//   let normalizedPath = this.normalize( filePath )
//   return normalizedPath === filePath;
// }

//

function isAbsolute( filePath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( filePath ), 'Expects string {-filePath-}, but got', _.strType( filePath ) );
  filePath = this.refine( filePath );
  return _.strBegins( filePath, this._upStr );
}

//

function isRelative( filePath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( filePath ), 'Expects string {-filePath-}, but got', _.strType( filePath ) );
  return !this.isAbsolute( filePath );
}

//

function isGlobal( filePath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( filePath ), 'Expects string' );
  return _.strHas( filePath, '://' );
}

//

function isRoot( filePath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( filePath ), 'Expects string {-filePath-}, but got', _.strType( filePath ) );
  if( filePath === this._rootStr )
  return true;
  if( this.isRelative( filePath ) )
  return false;
  if( this.normalize( filePath ) === this._rootStr )
  return true;
  return false;
}

//

function _isDotted( srcPath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( srcPath === this._hereStr )
  return true;
  if( srcPath === this._downStr )
  return true;
  if( _.strBegins( srcPath, this._hereStr + this._upStr ) )
  return true;
  if( _.strBegins( srcPath, this._downStr + this._upStr ) )
  return true;
  return false;
}

//

function isDotted( srcPath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( this._isDotted( srcPath ) )
  return true;
  if( _.strBegins( srcPath, this._hereStr + '\\' ) )
  return true;
  if( _.strBegins( srcPath, this._downStr + '\\' ) )
  return true;
  return false;
}

//

function isTrailed( srcPath )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( srcPath === this._rootStr )
  return false;
  return _.strEnds( srcPath,this._upStr );
}

//

function begins( srcPath,beginPath )
{
  _.assert( arguments.length === 2, 'Expects two arguments' );
  _.assert( _.strIs( srcPath ), 'Expects string {-srcPath-}, but got', _.strType( srcPath ) );
  _.assert( _.strIs( beginPath ), 'Expects string {-beginPath-}, but got', _.strType( beginPath ) );
  if( srcPath === beginPath )
  return true;
  return _.strBegins( srcPath,this.trail( beginPath ) );
}

//

function ends( srcPath,endPath )
{
  _.assert( arguments.length === 2, 'Expects two arguments' );
  endPath = this.undot( endPath );

  if( !_.strEnds( srcPath,endPath ) )
  return false;

  let begin = _.strRemoveEnd( srcPath,endPath );
  if( begin === '' || _.strEnds( begin,this._upStr ) || _.strEnds( begin,this._hereStr ) )
  return true;

  return false;
}

// --
// reformer
// --

/**
  * The routine refine() regularize a Windows paths to posix path format by replacing left slashes to slash ( \\ to / ).
  * If the path has a disk label, the routine puts slash '/' before and after the disk label.
  * If the path is an empty string, method returns ''. Otherwise, routine returns original path.
  *
  * @param {string} src - path for refinement.
  *
  * @example
  *  // returns '/foo//bar/../';
  *  let path = '\\foo\\\\bar\\..\\';
  *  path = wTools.refine( path );
  *
  * @example
  *  // returns '/C/temp//foo/bar/../';
  *  let path = 'C:\\temp\\\\foo\\bar\\..\\';
  *  path = wTools.refine( path );
  *
  * @example
  *  // returns '';
  *  let path = '';
  *  path = wTools.refine( path );
  *
  * @example
  *  // returns '/foo/bar/';
  *  let path = '/foo/bar/';
  *  path = wTools.refine( path );
  *
  * @returns {string} Returns refined path.
  * @throws {Error} If {-arguments.length-} is less or more then one.
  * @throws {Error} If passed argument is not a string.
  * @function refine
  * @namespace Tools.path
  */

function refine( src )
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
}

//

function _normalize( o )
{
  // let debug = 0;
  // if( 0 )
  // debug = 1;

  _.assertRoutineOptions( _normalize, arguments );
  _.assert( _.strIs( o.src ), 'Expects string' );

  if( !o.src.length )
  return '';

  let result = o.src;

  result = this.refine( result );

  // if( debug )
  // console.log( 'normalize.refined : ' + result );

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
  result = this._dot( result );

  // if( debug )
  // console.log( 'normalize.result : ' + result );

  return result;
}

_normalize.defaults =
{
  src : null,
  tolerant : false,
  detrailing : false,
  undoting : false,
}

//

/**
 * Regularize a path by collapsing redundant delimeters and resolving '..' and '.' segments,so A//B,A/./B and
    A/foo/../B all become A/B. This string manipulation may change the meaning of a path that contains symbolic links.
    On Windows,it converts forward slashes to backward slashes. If the path is an empty string,method returns '.'
    representing the current working directory.
 * @example
   let path = '/foo/bar//baz1/baz2//some/..'
   path = wTools.normalize( path ); // /foo/bar/baz1/baz2
 * @param {string} src path for normalization
 * @returns {string}
 * @function normalize
 * @namespace Tools.path
 */

function normalize( src )
{
  let result = this._normalize({ src, tolerant : false, detrailing : false, undoting : false });

  _.assert( _.strIs( src ), 'Expects string' );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( result.lastIndexOf( this._upStr + this._hereStr + this._upStr ) === -1 );
  _.assert( !_.strEnds( result, this._upStr + this._hereStr ) );

  if( Config.debug )
  {
    let i = result.lastIndexOf( this._upStr + this._downStr + this._upStr );
    _.assert( i === -1 || !/\w/.test( result.substring( 0, i ) ) );
  }

  return result;
}

//

function normalizeTolerant( src )
{
  _.assert( _.strIs( src ),'Expects string' );

  let result = this._normalize({ src, tolerant : true, detrailing : false, undoting : false });

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( result === this._upStr || _.strEnds( result, this._upStr ) || !_.strEnds( result, this._upStr + this._upStr ) );
  _.assert( result.lastIndexOf( this._upStr + this._hereStr + this._upStr ) === -1 );
  _.assert( !_.strEnds( result, this._upStr + this._hereStr ) );

  if( Config.debug )
  {
    _.assert( !this._delUpDupRegexp.test( result ) );
  }

  return result;
}

//

function canonize( src )
{
  let result = this._normalize({ src, tolerant : false, detrailing : true, undoting : true });

  _.assert( _.strIs( src ), 'Expects string' );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( result === this._upStr || _.strEnds( result, this._upStr + this._upStr ) || !_.strEnds( result, this._upStr ) );
  _.assert( result.lastIndexOf( this._upStr + this._hereStr + this._upStr ) === -1 );
  _.assert( !_.strEnds( result, this._upStr + this._hereStr ) );

  if( Config.debug )
  {
    let i = result.lastIndexOf( this._upStr + this._downStr + this._upStr );
    _.assert( i === -1 || !/\w/.test( result.substring( 0, i ) ) );
  }

  return result;
}

//

function canonizeTolerant( src )
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
}

//

function _nativizeWindows( filePath )
{
  let self = this;
  _.assert( _.strIs( filePath ), 'Expects string' ) ;
  let result = filePath.replace( /\//g, '\\' );

  if( result[ 0 ] === '\\' )
  if( result.length === 2 || result[ 2 ] === ':' || result[ 2 ] === '\\' )
  result = result[ 1 ] + ':' + result.substring( 2 );

  if( result.length === 2 && result[ 1 ] === ':' )
  result = result + '\\';

  return result;
}

//

function _nativizePosix( filePath )
{
  let self = this;
  _.assert( _.strIs( filePath ), 'Expects string' );
  return filePath;
}

//

function nativize()
{
  if( _global.process && _global.process.platform === 'win32' )
  this.nativize = this._nativizeWindows;
  else
  this.nativize = this._nativizePosix;
  return this.nativize.apply( this, arguments );
}

// --
// transformer
// --

function _dot( filePath )
{

  if( !this._isDotted( filePath ) )
  {
    _.assert( !_.strBegins( filePath, this._upStr ) );
    filePath = this._hereUpStr + filePath;
  }

  return filePath;
}

//

function dot( filePath )
{

  /*
    cant use isAbsolute
  */

  _.assert( !_.strBegins( filePath, this._upStr ) );
  _.assert( arguments.length === 1 );

  /*
    not .
    not begins with ./
    not ..
    not begins with ../
  */

  // if( filePath !== this._hereStr && !_.strBegins( filePath, this._hereUpStr ) && filePath !== this._downStr && !_.strBegins( filePath, this._downUpStr ) )
  if( !this.isDotted( filePath ) )
  {
    _.assert( !_.strBegins( filePath, this._upStr ) );
    filePath = this._hereUpStr + filePath;
  }

  return filePath;
}

//

function undot( filePath )
{
  if( filePath === this._hereUpStr )
  return filePath
  return _.strRemoveBegin( filePath, this._hereUpStr );
}

//

function trail( srcPath )
{
  _.assert( this.is( srcPath ) );
  _.assert( arguments.length === 1 );

  if( !_.strEnds( srcPath,this._upStr ) )
  return srcPath + this._upStr;

  return srcPath;
}

//

function detrail( path )
{
  _.assert( this.is( path ) );
  _.assert( arguments.length === 1 );

  if( path !== this._rootStr )
  return _.strRemoveEnd( path,this._upStr );

  return path;
}

//

/**
 * Returns the directory name of `path`.
 * @example
 * let path = '/foo/bar/baz/text.txt'
 * wTools.dir( path ); // '/foo/bar/baz'
 * @param {string} path path string
 * @returns {string}
 * @throws {Error} If argument is not string
 * @function dir
 * @namespace Tools.path
 */

function dir_pre( routine, args )
{
  let o = args[ 0 ];
  if( _.strIs( o ) )
  o = { filePath : args[ 0 ], depth : args[ 1 ] };

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( arguments.length === 2 );
  _.assert( _.intIs( o.depth ) );
  _.assert( _.strDefined( o.filePath ), 'Expects not empty string {- o.filePath -}' );

  return o;
}

function dir_body( o )
{
  let self = this;
  let isTrailed = this.isTrailed( o.filePath );

  _.assertRoutineOptions( dir_body, arguments );

  if( o.first )
  o.filePath = this.normalize( o.filePath );
  else
  o.filePath = this.canonize( o.filePath );

  if( o.depth === 0 )
  {
    return o.filePath;
  }
  else if( o.depth > 1 )
  {
    for( let i = o.depth - 1; i >= 0; i-- )
    {
      if
      (
        o.filePath === this._rootStr || o.filePath === this._hereStr || o.filePath === this._downStr ||
        o.filePath === this._hereStr + this._upStr || o.filePath === this._downStr + this._upStr ||
        ( o.filePath.match( /\W{3}$/ ) && o.filePath.match( /\W{3}$/ )[ 0 ] === '/..' ) ||
        ( o.filePath.match( /\W{4}$/ ) && o.filePath.match( /\W{4}$/ )[ 0 ] === '/../' )
      )
      {
        if( o.filePath[ o.filePath.length - 1 ] === '/' )
        o.filePath = o.filePath + this._downStr + ( o.first ? this._upStr : '' );
        else
        o.filePath = o.filePath + this._upStr + this._downStr + ( o.first ? this._upStr : '' );
      }
      else
      {
        if( o.filePath[ o.filePath.length - 1 ] === '/' )
        {
          o.filePath = o.filePath.substring( 0, o.filePath.length - 1 );
          o.filePath = o.filePath.substring( 0, o.filePath.lastIndexOf( '/' ) + ( o.first ? 1 : 0 ) );
          if( o.filePath.length === 0 )
          o.filePath = '.';
        }
        else
        {
          let indexOfSubstr = o.filePath.lastIndexOf( '/' ) === 0 && !o.first ? 1 : o.filePath.lastIndexOf( '/' );
          o.filePath = o.filePath.substring( 0, indexOfSubstr + ( o.first ? 1 : 0 ) );
          if( o.filePath.length === 0 )
          o.filePath = '.';
        }
      }
    }

    if( !o.first )
    o.filePath = _.path.canonize( o.filePath );

    return o.filePath;
  }
  else
  {
    _.assert( o.depth > 0 );
  }

  if( o.first )
  if( isTrailed )
  return o.filePath;

  if( o.filePath === this._rootStr )
  {
    return o.filePath + this._downStr + ( o.first ? this._upStr : '' );
  }

  if( _.strEnds( o.filePath, this._upStr + this._downStr ) || o.filePath === this._downStr )
  {
    return o.filePath + this._upStr + this._downStr + ( o.first ? this._upStr : '' );
  }

  let i = o.filePath.lastIndexOf( this._upStr );

  if( i === 0 )
  {
    return this._rootStr;
  }

  if( i === -1 )
  {
    if( o.first )
    {
      if( o.filePath === this._hereStr )
      return this._downStr + this._upStr;
      else
      return this._hereStr + this._upStr;
    }
    else
    {
      if( o.filePath === this._hereStr )
      return this._downStr + ( isTrailed ? this._upStr : '' );
      else
      return this._hereStr + ( isTrailed ? this._upStr : '' );
    }
  }

  let result;

  if( o.first )
  result = o.filePath.substr( 0, i + self._upStr.length );
  else
  result = o.filePath.substr( 0, i );

  if( !o.first )
  if( isTrailed )
  result = _.strAppendOnce( result, self._upStr );

  _.assert( !!result.length )

  return result;
}

dir_body.defaults =
{
  filePath : null,
  first : 0,
  depth : 1,
}

let dir = _.routineFromPreAndBody( dir_pre, dir_body );
dir.defaults.first = 0;

let dirFirst = _.routineFromPreAndBody( dir_pre, dir_body );
dirFirst.defaults.first = 1;

// --
// extension
// --

let Parameters =
{

  _rootStr : '/',
  _upStr : '/',
  _hereStr : '.',
  _downStr : '..',
  _hereUpStr : null, /* ./ */
  _downUpStr : null, /* ../ */

  _rootRegSource : null,
  _upRegSource : null,
  _downRegSource : null,
  _hereRegSource : null,
  _downUpRegSource : null,
  _hereUpRegSource : null,

  _delHereRegexp : null,
  _delDownRegexp : null,
  _delUpDupRegexp : null,
  _pathIsGlobRegexp : null,

}

let Fields =
{

  Parameters,

  fileProvider : null,
  path : Self,
  single : Self,
  s : null,

}

let Routines =
{

  // meta

  Init,
  CloneExtending,

  // checker

  is,

  isRefined,
  isNormalized,
  isAbsolute,
  isRelative,
  isGlobal,
  isRoot,
  _isDotted,
  isDotted,
  isTrailed,

  begins,
  ends,

  // reformer

  refine,

  _normalize,
  normalize,
  normalizeTolerant,

  canonize,
  canonizeTolerant,

  _nativizeWindows,
  _nativizePosix,
  nativize,

  // transformer

  _dot,
  dot,
  undot,
  trail,
  detrail,
  dir,
  dirFirst,

}

_.mapSupplement( Self, Parameters );
_.mapSupplement( Self, Fields );
_.mapSupplement( Self, Routines );

Self.Init();

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
