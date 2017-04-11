//#! /usr/bin/env NODE
( function _aKernel_s_() {

'use strict'; // aaa

/**
 * @file wTools.s - Generic purpose tools of base level for solving problems in Java Script.
 */

// global

var _global_ = undefined;

if( !_global_ && typeof Global !== 'undefined' && Global.Global === Global ) _global_ = Global;
if( !_global_ && typeof global !== 'undefined' && global.global === global ) _global_ = global;
if( !_global_ && typeof window !== 'undefined' && window.window === window ) _global_ = window;
if( !_global_ && typeof self   !== 'undefined' && self.self === self ) _global_ = self;

// veification

if( 1 )
if( _global_.wBase )
{
  if( typeof __dirname !== 'undefined' )
  wTools.pathUse( __dirname + '/../..' );
  // if( _global_.wBase !== _global_.wTools )
  // throw new Error( '_global_.wBase !== _global_.wTools' );
  module[ 'exports' ] = _global_.wBase;
  return;
}

if( _global_.wBase )
{
  throw new Error( 'wTools included several times' );
}

// global var

_global_[ '_global_' ] = _global_;
_global_._global_ = _global_;

_global_.DEBUG = true;

// parent

if( typeof module !== 'undefined' && module !== null )
{
  try
  {
    if( !_global_.Underscore )
    _global_.Underscore = require( 'underscore' );
  }
  catch( err )
  {
  }
}

if( !_global_.Underscore && _global_._ )
_global_.Underscore = _global_._;

if( typeof wTools === 'undefined' )
{
  // if( _global_.Underscore !== undefined )
  // _global_.wTools = Object.create( _global_.Underscore );
  // else if( _global_._ !== undefined )
  // _global_.wTools = Object.create( _global_._ );
  // else
  _global_.wTools = Object.create( null );
  // delete _global_.wTools.length;
  // _.assert( _global_.wTools.length === undefined );
}

//

/**
 * wTools - Generic purpose tools of base level for solving problems in Java Script.
 * @class wTools
 */

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;
var _ceil = Math.ceil;
var _floor = Math.floor;

// --
// init
// --

function _initConfig()
{

  // debugger;

  /* config */

  if( !_global_.Config )
  {
    _global_.Config = Object.create( null );
  }

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
  _global_.DEBUG = _global_.Config.debug;

  // debugger;

}

//

function _initUnhandledErrorHandler()
{

  if( _global_._initUnhandledErrorHandlerDone )
  return;

  _global_._initUnhandledErrorHandlerDone = true;

  if( typeof process !== 'undefined' && _.routineIs( process.on ) )
  process.on( 'uncaughtException', function( err )
  {

    console.error( '------------------------------- unhandled errorr -------------------------------' );

    // console.log( err.message );

    if( !err.originalMessage )
    {
      if( _.objectLike( err ) )
      console.error( _.toStr.fields( err,{ errorAsMap : 1 } ) );
      _.errLog( 'Uncaught exception :',err );
    }
    else
    {
      _.errLog( err );
    }

    console.error( '------------------------------- unhandled errorr -------------------------------' );
    debugger;

    if( _global_.process && !process.exitCode )
    process.exitCode = -1;
  });

}

// --
// iterator
// --

function __eachAct( iteration )
{

  var iterator = this;
  var src = iteration.src;
  var i = 0;

  _.assert( Object.keys( iterator ).length === 11 );
  _.assert( Object.keys( iteration ).length === 6 );
  _.assert( iteration.level >= 0 );
  _.assert( arguments.length === 1 );

  /* level */

  if( !( iteration.level < iterator.levelLimit ) )
  {
    debugger;
    return i;
  }

  /* usingVisits */

  if( iterator.usingVisits )
  {
    if( iterator.visited.indexOf( src ) !== -1 )
    return i;
    iterator.visited.push( src );
  }

  /* up */

  iterator.counter += 1;
  var c = true;
  if( iterator.root !== src )
  {
    c = iterator.onUp.call( iterator,src,iteration.key,iteration );
  }
  else if( iterator.usingRootVisit )
  {
    c = iterator.onUp.call( iterator,src,iteration.key,iteration );
  }

  /* down */

  function end()
  {

    if( iterator.root !== src )
    {
      iterator.onDown.call( iterator,src,iteration.key,iteration );
    }
    else if( iterator.usingRootVisit )
    {
      iterator.onDown.call( iterator,src,iteration.key,iteration );
    }

    if( iterator.usingVisits )
    {
      _.assert( Object.is( iterator.visited[ iterator.visited.length-1 ], src ) );
      iterator.visited.pop();
    }

    return i;
  }

  if( c === false )
  return end();

  /* element */

  function __onElement( k )
  {

    i += 1;

    if( iterator.recursive || iterator.root === src )
    {

      var newIteration =
      {
        level : iteration.level+1,
        path : iteration.path !== iterator.pathDelimteter ? iteration.path + iterator.pathDelimteter + k : iteration.path + k,
        key : k,
        index : i,
        down : iteration,
        src : src[ k ],
      }

      __eachAct.call( iterator,newIteration );

    }

  }

  /* iterate */

  if( _.arrayLike( src ) )
  {

    for( var k = 0 ; k < src.length ; k++ )
    {

      __onElement( k );

    }

  }
  else if( _.objectLike( src ) )
  {

    for( var k in src )
    {

      if( iterator.own )
      if( !Object.hasOwnProperty.call( src,k ) )
      continue;

      __onElement( k );

    }

  }
  else
  {
  }

  /* end */

  return end();
}

//

function _each( o )
{

  if( o.root === undefined )
  o.root = o.src;

  _.routineOptions( _each,o );
  _.assert( _.routineIs( o.onUp ) || _.routineIs( o.onDown ),'each : expects routine o.onUp or o.onDown' );
  _.assert( o.onUp.length === 0 || o.onUp.length === 1 || o.onUp.length === 3 );
  _.assert( o.onDown.length === 0 || o.onUp.length === 1 || o.onDown.length === 3 );

  if( o.path === null )
  o.path = o.pathDelimteter;

  var iterator =
  {
    root : o.root,
    onUp : o.onUp,
    onDown : o.onDown,
    own : o.own,
    recursive : o.recursive,
    usingVisits : o.usingVisits,
    usingRootVisit : o.usingRootVisit,
    counter : o.counter,
    visited : o.visited,
    levelLimit : o.levelLimit,
    pathDelimteter : o.pathDelimteter,
  }

  var iteration =
  {
    level : o.level,
    path : o.path,
    key : o.key,
    index : o.index,
    src : o.src,
    down : o.down,
  }

  _.accessorForbid
  ({
    object : iterator,
    prime : 0,
    names :
    {
      levels : 'levels',
      level : 'level',
      path : 'path',
      key : 'key',
      index : 'index',
      src : 'src',
      down : 'down',
    }
  })

  return __eachAct.call( iterator,iteration );
}

_each.defaults =
{

  root : null,
  onUp : function( e,k,iteration ){},
  onDown : function( e,k,iteration ){},
  own : 0,
  recursive : 0,
  usingVisits : 1,
  usingRootVisit : 1,
  counter : 0,
  visited : [],
  levelLimit : 256,
  pathDelimteter : '/',

  //levels : 256,
  level : 0,
  path : null,
  key : null,
  index : 0,
  src : null,
  down : null,

}

//

function each( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }

  _.mapExtendFiltering( _.filter.dstNotHasSrcOwn(),o,each.defaults );

  return _each( o );
}

each.defaults =
{
  own : 0,
  usingVisits : 0,
  recursive : 0,
  usingRootVisit : 0,
}

each.defaults.__proto__ = _each.defaults;

//

function eachOwn( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }
  o.own = 1;

  _.mapExtendFiltering( _.filter.dstNotHasSrcOwn(),o,eachOwn.defaults );

  return _each( o );
}

eachOwn.defaults =
{
  own : 1,
  usingVisits : 0,
  recursive : 0,
  usingRootVisit : 0,
}

eachOwn.defaults.__proto__ = _each.defaults;

//

function eachRecursive( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }

  o.recursive = 1;

  _.mapExtendFiltering( _.filter.dstNotHasSrcOwn(),o,eachRecursive.defaults );

  return _each( o );
}

eachRecursive.defaults =
{
  own : 0,
  recursive : 1,
}

eachRecursive.defaults.__proto__ = _each.defaults;

//

function eachOwnRecursive( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], onEach : arguments[ 1 ] }
  o.own = 1;
  o.recursive = 1;

  return _each( o );
}

eachOwnRecursive.defaults =
{
  own : 1,
  recursive : 1,
}

eachOwnRecursive.defaults.__proto__ = _each.defaults;

//

function eachSample( o )
{

  if( arguments.length === 2 )
  {
    o =
    {
      elementArrays : arguments[ 0 ],
      onEach : arguments[ 1 ],
    }
  }

  _.assertMapHasOnly( o,eachSample.defaults );
  if( o.direct === undefined )
  o.direct = true;

  /**/

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( o.onEach ) || o.onEach === undefined );
  _.assert( _.arrayIs( o.elementArrays ) || o.base !== undefined || o.add !== undefined );

  /**/

  if( o.base !== undefined || o.add !== undefined )
  {

    var l = 1;
    if( _.arrayLike( o.base ) )
    l = o.base.length;
    else if( _.arrayLike( o.add ) )
    l = o.add.length;

    if( !o.base )
    o.base = 0;
    o.base = _.arrayFromNumber( o.base,l );
    o.add = _.arrayFromNumber( o.add,l );

    _.assert( o.base.length === o.add.length );
    _.assert( !o.elementArrays );

    o.elementArrays = [];

    for( var b = 0 ; b < o.base.length ; b++ )
    {
      var e = [ o.base[ b ], o.base[ b ] + o.add[ b ] ];
      o.elementArrays.push( e );
    }

  }

  /* elementArrays */

  if( !o.base )
  for( var i = 0 ; i < o.elementArrays.length ; i++ )
  {
    _.assert( _.arrayLike( o.elementArrays[ i ] ) || _.atomicIs( o.elementArrays[ i ] ) );
    if( _.atomicIs( o.elementArrays[ i ] ) )
    o.elementArrays[ i ] = [ o.elementArrays[ i ] ];
  }

  /**/

  var result = [];
  var sample = [];
  var counter = [];
  var len = [];
  var index = 0;

  /**/

  function firstSample()
  {

    for( var s = 0, l = o.elementArrays.length; s < l ; s++ )
    {
      len[ s ] = o.elementArrays[ s ].length;
      counter[ s ] = 0;
      sample[ s ] = o.elementArrays[ s ][ counter[ s ] ];
      if( !len[ s ] )
      return 0;
    }

    result.push( sample.slice() );

    return 1;
  }

  /**/

  function _nextSample( s )
  {

    counter[ s ]++;
    if( counter[ s ] >= len[ s ] )
    {
      counter[ s ] = 0;
      sample[ s ] = o.elementArrays[ s ][ counter[ s ] ];
    }
    else
    {
      sample[ s ] = o.elementArrays[ s ][ counter[ s ] ];
      index += 1;
      result.push( sample.slice() );
      return 1;
    }

    return 0;
  }

  /**/

  function nextSample()
  {

    if( o.direct ) for( var s = 0, l = o.elementArrays.length; s < l ; s++ )
    {
      if( _nextSample( s ) )
      return 1;
    }
    else for( var s = o.elementArrays.length - 1, l = o.elementArrays.length; s >= 0 ; s-- )
    {
      if( _nextSample( s ) )
      return 1;
    }

    return 0;
  }

  /**/

  if( !_.arrayIs( o.elementArrays ) )
  throw _.err( 'eachSample :','array only supported' );

  if( !firstSample() )
  return result;

  do
  {
    if( o.onEach )
    o.onEach.call( sample,sample,index );
  }
  while( nextSample() );

  return result;
}

eachSample.defaults =
{

  direct : 1,
  onEach : null,

  elementArrays : null,
  base : null,
  add : null,

}

//

function eachInRange( o )
{

  if( _.arrayIs( o ) )
  o = { range : o };

  _.routineOptions( eachInRange,o );
  if( _.numberIs( o.range ) )
  o.range = [ 0,o.range ];

  _.assert( arguments.length === 1 );
  _.assert( o.range.length === 2 );
  _.assert( o.increment >= 0 );

  var increment = o.increment;
  var range = o.range;
  var len = _.rangeLengthGet( range,o.increment );
  var value = range[ 0 ];

  if( o.estimate )
  {
    return { length : len };
  }

  if( o.result === null )
  o.result = new Float32Array( len );

  // if( o.batch === 0 )
  // o.batch = o.range[ 1 ] - o.range[ 0 ];

  /* begin */

  if( o.onBegin )
  o.onBegin.call( o );

  /* exec */

  function exec()
  {

    while( value < range[ 1 ] )
    {

      if( o.onEach )
      o.onEach.call( o,value,o.resultIndex );
      if( o.result )
      o.result[ o.resultIndex ] = value;

      value += increment;
      o.resultIndex += 1;
    }

  }

  if( len )
  exec();

  /* end */

  if( value > range[ 1 ] )
  if( o.onEnd )
  o.onEnd.call( o,o.result );

  /* return */

  if( o.result )
  return o.result;
  else
  return o.resultIndex;
}

eachInRange.defaults =
{
  result : null,
  resultIndex : 0,
  range : null,
  onBegin : null,
  onEnd : null,
  onEach : null,
  increment : 1,
  delay : 0,
  estimate : 0,
}

//

function eachInManyRanges( o )
{

  var len = 0;

  if( _.arrayIs( o ) )
  o = { range : o };

  _.routineOptions( eachInRange,o );
  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.range ) );

  /* estimate */

  for( var r = 0 ; r < o.range.length ; r++ )
  {
    var range = o.range[ r ];
    if( _.numberIs( o.range ) )
    range = o.range[ r ] = [ 0,o.range ];
    len += _.rangeLengthGet( range,o.increment );
  }

  if( o.estimate )
  return { length : len };

  /* exec */

  if( o.result === null )
  o.result = new Float32Array( len );

  var ranges = o.range;
  for( var r = 0 ; r < ranges.length ; r++ )
  {
    o.range = ranges[ r ];
    _.eachInRange( o );
  }

  /* return */

  if( o.result )
  return o.result;
  else
  return o.resultIndex;

}

eachInManyRanges.defaults =
{
}

eachInManyRanges.defaults.__proto__ = eachInRange.defaults;

//

function eachInMultiRange( o )
{

  if( !o.onEach )
  o.onEach = function( e )
  {
    console.log( e );
  }

  _.routineOptions( eachInMultiRange,o );
  _assert( _.objectIs( o ) )
  _assert( _.arrayIs( o.ranges ) || _.objectIs( o.ranges ),'eachInMultiRange :','expects o.ranges as array or object' )
  _assert( _.routineIs( o.onEach ),'eachInMultiRange :','expects o.onEach as routine' )
  _assert( !o.delta || o.delta.length === o.ranges.length,'eachInMultiRange :','o.delta must be same length as ranges' );

  /* */

  var iterationNumber = 1;
  var l = 0;
  var delta = _.objectIs( o.delta ) ? [] : null;
  var ranges = [];
  var names = null;
  if( _.objectIs( o.ranges ) )
  {
    _assert( _.objectIs( o.delta ) || !o.delta );

    names = [];
    var i = 0;
    for( var r in o.ranges )
    {
      names[ i ] = r;
      ranges[ i ] = o.ranges[ r ];
      if( delta )
      {
        if( !o.delta[ r ] )
        throw _.err( 'no delta for',r );
        delta[ i ] = o.delta[ r ];
      }
    }

    l = names.length;

  }
  else
  {
    ranges = o.ranges.slice();
    delta = _.arrayLike( o.delta ) ? o.delta.slice() : null;
    l = o.ranges.length;
  }

  var last = ranges.length-1;

  /* adjust range */

  function adjustRange( r )
  {

    if( _.numberIs( ranges[ r ] ) )
    ranges[ r ] = [ 0,ranges[ r ] ];

    if( !_.arrayLike( ranges[ r ] ) )
    throw _.err( 'expects range as array :',ranges[ r ] );

    _assert( ranges[ r ].length === 2 );
    _assert( _.numberIs( ranges[ r ][ 0 ] ) );
    _assert( _.numberIs( ranges[ r ][ 1 ] ) );

    iterationNumber *= ranges[ r ][ 1 ] - ranges[ r ][ 0 ];

  }

  if( _.objectIs( ranges ) )
  for( var r in ranges )
  adjustRange( r );
  else
  for( var r = 0 ; r < ranges.length ; r++ )
  adjustRange( r );

  /* estimate */

  if( o.estimate )
  {

    if( !ranges.length )
    return 0;

    return { length : iterationNumber };

  }

  /* */

  function getValue( arg ){ return arg.slice(); };
  if( names )
  getValue = function( arg )
  {
    var result = Object.create( null );
    for( var i = 0 ; i < names.length ; i++ )
    result[ names[ i ] ] = arg[ i ];
    return result;
  }

  /* */

  var indexNd = [];
  for( var r = 0 ; r < ranges.length ; r++ )
  indexNd[ r ] = ranges[ r ][ 0 ];

  /* */

  var indexFlat = 0;
  while( indexNd[ last ] < ranges[ last ][ 1 ] )
  {

    var r = getValue( indexNd );
    if( o.result )
    o.result[ indexFlat ] = r;

    var res = o.onEach.call( o,r,indexFlat );

    if( res === false )
    break;

    indexFlat += 1;

    var c = 0;
    do
    {
      if( c >= ranges.length )
      break;
      if( c > 0 )
      indexNd[ c-1 ] = ranges[ c-1 ][ 0 ];
      if( delta )
      indexNd[ c ] += delta[ c ];
      else
      indexNd[ c ] += 1;
      c += 1;
    }
    while( indexNd[ c-1 ] >= ranges[ c-1 ][ 1 ] );

  }

  /* */

  if( o.result )
  return o.result
  else
  return indexFlat;
}

eachInMultiRange.defaults =
{
  result : null,
  ranges : null,
  delta : null,
  onEach : null,
  estimate : 0,
}

//

function dup( ins,times,result )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.numberIs( times ) || _.arrayLike( times ),'dup expects times as number or array' );

  if( _.numberIs( times ) )
  {
    if( !result )
    result = new Array( times );
    for( var t = 0 ; t < times ; t++ )
    result[ t ] = ins;
    return result;
  }
  else if( _.arrayLike( times ) )
  {
    _.assert( times.length === 2 );
    var l = times[ 1 ] - times[ 0 ];
    if( !result )
    result = new Array( times[ 1 ] );
    for( var t = 0 ; t < l ; t++ )
    result[ times[ 0 ] + t ] = ins;
    return result;
  }
  else _.assert( 0,'unexpected' );

}

// --
// range
// --

function rangeLengthGet( range,options )
{

  var options = options || Object.create( null );
  var rangeWithIncrementDefaults =
  {
    first : null,
    last : null,
    increment : null,
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( options.increment === undefined )
  options.increment = 1;

  if( _.arrayIs( range ) )
  {
    _.assert( range.length === 2 );
    return options.increment ? ( range[ 1 ]-range[ 0 ] ) / options.increment : 0;
  }
  else if( _.mapIs( range ) )
  {
    _.assertMapHasAll( range,rangeWithIncrementDefaults );
    return ( range.last - range.first ) / range.increment;
  }
  else throw _.err( 'unexpected type of range',_.strTypeOf( range ) );

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
  else throw _.err( 'unexpected type of range',_.strTypeOf( range ) );

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
  else throw _.err( 'unexpected type of range',_.strTypeOf( range ) );

}

// --
// entity modifier
// --

function enityExtend( dst,src )
{

  if( _.objectIs( src ) || _.arrayLike( src ) )
  {

    _.each( src,function( e,k,iteration )
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

function entityClone( src,options )
{
  var result;

  //throw Error( 'not stable' );

  if( options !== undefined && !_.objectIs( options ) )
  throw _.err( 'wTools.entityClone :','need options' );

  var options = options || Object.create( null );

  if( options.forWorker === undefined ) options.forWorker = 0;

  if( options.depth === undefined ) options.depth = 16;

  if( options.useClone === undefined ) options.useClone = 1;

  if( options.depth < 0 )
  {
    if( options.silent ) console.log( 'wTools.entityClone : overflow' );
    else throw _.err( 'wTools.entityClone :','overflow' );
  }

  _assert( !options.forWorker,'forWorker is deprecated' );

  //

  if( !src ) return src;

  if( options.useClone && _.routineIs( src.clone ) )
  {
    result = src.clone();
  }
  else if( arrayIs( src ) )
  {

    result = [];
    src.forEach(function( child, index, array ) {
      result[index] = entityClone( child,options );
    });

  }
  else if( _.objectIs( src ) )
  {

    result = Object.create( null );
    var proto = Object.getPrototypeOf( src );
    var result = Object.create( proto );
    for( var s in src )
    {
      if( !_ObjectHasOwnProperty.call( src,s ) )
      continue; // xxx
      var c = entityClone( src[ s ],{
        depth : options.depth-1,
        silent :options.silent,
        forWorker : options.forWorker,
      });
      result[s] = c;
    }

  }
  else if( src.constructor )
  {

    if( options.forWorker )
    {
      var good = _.strIs( src ) || _.numberIs( src ) || _.dateIs( src ) || _.boolIs( src ) || _.regexpIs( src ) || _.bufferIs( src );
      if( good )
      {
        return src;
      }
      else
      {
        return;
      }
    }
    else
    {
      if( _.strIs( src ) || _.numberIs( src ) || _.dateIs( src ) || _.boolIs( src ) || _.regexpIs( src ) )
      result = src.constructor( src );
      else if( _.routineIs( src ) )
      result = src;
      else
      result = new src.constructor( src );
    }

  }
  else
  {

    result = src;

  }

  return result;
}

//

function entityNew( src )
{

  if( _.arrayIs( src ) )
  {
    return new src.constructor( src.length );
  }
  else if( _.mapIs( src ) )
  {
    return Object.create( null );
  }
  else if( _.objectIs( src ) )
  {
    return new src.constructor()
  }
  else if( _.arrayLike( src ) )
  {
    if( _.argumentsIs( src ) )
    return new Array( src.length );
    else
    return new src.constructor( src.length );
  }
  else _.assert( 0,'unexpected' );

}

//

function _entityCloneAct( o )
{

  var result;
  var o = o || Object.create( null );

  if( !( o.levels > 0 ) )
  throw _.err
  (
    'failed to clone structure',_.strTypeOf( o.rootSrc ) +
    '\nat ' + o.path +
    '\ntoo deep structure' +
    '\no : ' + _.toStr( o ) +
    '\no.rootSrc : ' + _.toStr( o.rootSrc )
  );

  o.levels -= 1;

  /* routine */

  if( _.routineIs( o.src ) )
  {
    if( o.onRoutine )
    return o.onRoutine( o.src );
    return o.src;
  }

  /* string */

  if( _.strIs( o.src ) )
  {
    if( o.onString )
    return o.onString( o.src );
    return o.src;
  }

  /* atomic */

  if( _.atomicIs( o.src ) )
  {
    return o.src;
  }

  /* class instance */

  if( o.technique === 'data' )
  {
    if( o.src.cloneData )
    {
      return o.src.cloneData( o );
    }
  }
  else if( o.technique === 'object' )
  {
    if( o.src.cloneObject )
    {
      return o.src.cloneObject( o );
    }
  }
  else
  {
    throw _.err( 'unexpected clone technique : ' + o.technique );
  }

  /* map */

  if( _.objectIs( o.src ) )
  {

    var mapIs = _.mapIs( o.src );

    if( !mapIs )
    if( o.src.constructor !== Object && o.src.constructor !== null )
    {
      debugger;
      throw _.err
      (
        'Complex objets should have ' +
        ( o.technique === 'data' ? 'cloneData' : 'cloneObject' ) +
        ', but object ' + _.strTypeOf( o.src ) + 'at ' + ( o.path || '.' ), 'does not have such method','\n',
        o.src,'\n',
        'try to mixin wCopyable'
      );
    }

    if( o.dst )
    result = o.dst;
    else if( o.proto )
    result = new o.proto();
    else
    {
      result = _.entityNew( o.src );
      //result = new o.src.constructor();
    }

    for( var s in o.src )
    {

      if( !mapIs )
      if( !Object.hasOwnProperty.call( o.src,s ) )
      continue;

      var elementOptions = _.mapExtend( Object.create( null ),o );
      elementOptions.src = o.src[ s ];
      elementOptions.path += '.' + s;
      delete elementOptions.dst;
      delete elementOptions.proto;
      result[ s ] = _entityCloneAct( elementOptions );
    }

    return result;
  }

  /* array like */

  if( _.arrayLike( o.src ) )
  {

    if( _.bufferIs( o.src ) )
    {

      if( o.copyBuffers )
      {
        debugger;
        result = new o.src.constructor( o.src );
      }
      else
      {
        result = o.src;
      }

      if( o.onBuffer )
      {
        result = o.onBuffer.call( o,result );
      }

      return result;
    }


    /**/

    if( o.dst )
    result = o.dst;
    else if( o.proto )
    {
      debugger;
      result = new o.proto( o.src.length );
    }
    else
    {
      result = _.arrayNew( o.src );
    }

    /**/

    if( _.bufferRawIs( o.src ) )
    throw _.err( 'not implemented' );

    for( var s = 0 ; s < o.src.length ; s++ )
    {
      var elementOptions = _.mapExtend( Object.create( null ),o );
      elementOptions.src = o.src[ s ];
      elementOptions.path += '.' + s;
      delete elementOptions.dst;
      delete elementOptions.proto;
      result[ s ] = _entityCloneAct( elementOptions );
    }

    return result;
  }

  debugger;
  throw _.err( 'unexpected type of src : ' + _.strTypeOf( o.src ) );
}

//

function _entityClone( o )
{

  if( o.rootSrc === undefined )
  o.rootSrc = o.src;

  if( o.src === undefined )
  {
    console.warn( 'REMINDER:','experimental' );
    o.src = null;
  }

  _.assertMapHasOnly( o,_entityClone.defaults );
  _.mapComplement( o,_entityClone.defaults );

  return _entityCloneAct( o );
}

_entityClone.defaults =
{

  src : null,
  rootSrc : null,
  key : null,

  dst : null,
  proto : null,

  copyComposes : true,
  copyAggregates : true,
  copyAssociates : true,
  copyRestricts : false,
  copyBuffers : false,

  levels : 16,
  path : '',
  technique : null,

  onString : null,
  onRoutine : null,
  onBuffer : null,

}

//

function entityCloneObject( o )
{

  if( o.rootSrc === undefined )
  o.rootSrc = o.src;

  _.assertMapHasOnly( o,entityCloneObject.defaults );
  _.mapSupplement( o,entityCloneObject.defaults );

  var result = _entityClone( o );

  return result;
}

entityCloneObject.defaults =
{
  copyAssociates : true,
  technique : 'object',
}

entityCloneObject.defaults.__proto__ = _entityClone.defaults;

//

function entityCloneObjectMergingBuffers( o )
{
  var result = Object.create( null );
  var src = o.src;
  var descriptorsMap = o.src.descriptorsMap;
  var buffer = o.src.buffer;
  var data = o.src.data;

  if( o.rootSrc === undefined )
  o.rootSrc = o.src;

  _.assertMapHasOnly( o,entityCloneObjectMergingBuffers.defaults );
  _.mapSupplement( o,entityCloneObjectMergingBuffers.defaults );

  _.assert( _.objectIs( o.src.descriptorsMap ) );
  _.assert( _.bufferRawIs( o.src.buffer ) );
  _.assert( o.src.data !== undefined );

  /**/

  var optionsCloneObject = _.mapScreen( _.entityCloneObject.defaults,o );
  optionsCloneObject.src = data;

  /* onString */

  optionsCloneObject.onString = function onString( strString )
  {

    var id = _.strUnjoin( strString,[ '--buffer-->',_.strUnjoin.any,'<--buffer--' ] )

    if( id === undefined )
    return strString;

    var descriptor = o.src.descriptorsMap[ strString ];
    _.assert( descriptor !== undefined );

    var bufferConstructor = _global_[ descriptor[ 'bufferConstructorName' ] ];
    var offset = descriptor[ 'offset' ];
    var size = descriptor[ 'size' ];
    var sizeOfAtom = descriptor[ 'sizeOfAtom' ];
    var result = bufferConstructor ? new bufferConstructor( buffer,offset,size / sizeOfAtom ) : null;

    return result;
  }

  /* clone object */

  var result = _.entityCloneObject( optionsCloneObject );

  // xxx

  return result;
}

entityCloneObjectMergingBuffers.defaults =
{
  copyBuffers : false,
}

entityCloneObjectMergingBuffers.defaults.__proto__ = entityCloneObject.defaults;

//

function entityCloneData( o )
{

  if( o.rootSrc === undefined )
  o.rootSrc = o.src;

  _.assertMapHasOnly( o,entityCloneData.defaults );
  _.mapSupplement( o,entityCloneData.defaults );

  var result = _entityClone( o );

  return result;
}

entityCloneData.defaults =
{
  technique : 'data',
  copyAssociates : false,
}

entityCloneData.defaults.__proto__ = _entityClone.defaults;

//

function entityCloneDataSeparatingBuffers( o )
{
  var result = Object.create( null );
  var buffers = [];
  var descriptorsArray = [];
  var descriptorsMap = Object.create( null );
  var size = 0;
  var offset = 0;

  if( o.rootSrc === undefined )
  o.rootSrc = o.src;

  _.assertMapHasOnly( o,entityCloneDataSeparatingBuffers.defaults );
  _.mapSupplement( o,entityCloneDataSeparatingBuffers.defaults );

  /* onBuffer */

  o.onBuffer = function onBuffer( srcBuffer )
  {

    _.assert( _.bufferIs( srcBuffer ),'not tested' );

    var index = buffers.length;
    var id = _.strJoin( '--buffer-->',index,'<--buffer--' );
    var bufferSize = srcBuffer ? srcBuffer.length*srcBuffer.BYTES_PER_ELEMENT : 0;
    size += bufferSize;

    var descriptor =
    {
      'bufferConstructorName' : srcBuffer ? srcBuffer.constructor.name : 'null',
      'sizeOfAtom' : srcBuffer ? srcBuffer.BYTES_PER_ELEMENT : 0,
      'offset' : -1,
      'size' : bufferSize,
      'index' : index,
      //'id' : id,
    }

    buffers.push( srcBuffer );
    descriptorsArray.push( descriptor );
    descriptorsMap[ id ] = descriptor;

    return id;
  }

  /* clone data */

  result.data = _entityCloneAct( o );
  result.descriptorsMap = descriptorsMap;

  /* sort by atom size */

  descriptorsArray.sort( function( a,b )
  {
    return b[ 'sizeOfAtom' ] - a[ 'sizeOfAtom' ];
  });

  /* alloc */

  result.buffer = new ArrayBuffer( size );
  var dstBuffer = _.bufferBytesGet( result.buffer );

  /* copy buffers */

  for( var b = 0 ; b < descriptorsArray.length ; b++ )
  {

    var descriptor = descriptorsArray[ b ];
    var buffer = buffers[ descriptor.index ];
    var bytes = buffer ? _.bufferBytesGet( buffer ) : new Uint8Array();
    var bufferSize = descriptor[ 'size' ];

    descriptor[ 'offset' ] = offset;

    _.bufferMove( dstBuffer.subarray( offset,offset+bufferSize ),bytes );

    offset += bufferSize;

  }

  /**/ // xxx

  return result;
}

entityCloneDataSeparatingBuffers.defaults =
{
  copyBuffers : false,
}

entityCloneDataSeparatingBuffers.defaults.__proto__ = entityCloneData.defaults;

//

/**
 * Copies entity( src ) into( dst ) or returns own copy of( src ).Result depends on several moments:
 * -If( src ) is a Object - returns clone of( src ) using ( onRecursive ) callback function if its provided;
 * -If( dst ) has own 'copy' method - copies( src ) into( dst ) using this method;
 * -If( dst ) has own 'set' method - sets the fields of( dst ) using( src ) passed to( dst.set );
 * -If( src ) has own 'clone' method - returns clone of( src ) using ( src.clone ) method;
 * -If( src ) has own 'slice' method - returns result of( src.slice ) call;
 * -Else returns a copy of entity( src ).
 *
 * @param {object} dst - Destination object.
 * @param {object} src - Source object.
 * @param {routine} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapClone} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * var dst = { set : function( src ) { this.str = src.src } };
 * var src = { src : 'string' };
 *  _.entityCopy( dst, src );
 * console.log( dst.str )
 * //returns "string"
 *
 * @example
 * var dst = { copy : function( src ) { for( var i in src ) this[ i ] = src[ i ] } }
 * var src = { src : 'string', num : 123 }
 *  _.entityCopy( dst, src );
 * console.log( dst )
 * //returns Object {src: "string", num: 123}
 *
 * @example
 * //returns 'string'
 *  _.entityCopy( null, new String( 'string' ) );
 *
 * @method entityCopy
 * @throws {exception} If( arguments.length ) is not equal to 3 or 2.
 * @throws {exception} If( onRecursive ) is not a Routine.
 * @memberof wTools
 *
 */

function entityCopy( dst,src,onRecursive )
{
  var result;

  _.assert( arguments.length === 2 || arguments.length === 3 );
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
    else if( _.atomicIs( dst ) || _.arrayLike( dst ) )
    {
      result = src.clone();
    }
    else _.assert( 0,'unexpected' );

  }
  else if( src && _.routineIs( src.slice ) )
  {

    result = src.slice( 0 );

  }
  else if( dst && _.routineIs( dst.set ) )
  {

    dst.set( src );

  }
  else if( _.objectIs( src ) )
  {

    if( onRecursive )
    result = _.mapClone( src,{ onCopyField : onRecursive, dst : _.atomicIs( dst ) ? Object.create( null ) : dst } );
    else
    result = _.mapClone( src );

  }
  else
  {

    result = src;

  }

  return result;
}

//

/**
 * Short-cut for entityCopy function. Copies specified( name ) field from
 * source container( srcContainer ) into( dstContainer ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcContainer - Source object.
 * @param {string} name - Field name.
 * @param {mapClone~onCopyField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapClone} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * var dst = {};
 * var src = { a : 'string' };
 * var name = 'a';
 * _.entityCopyField(dst, src, name );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @example
 * var dst = {};
 * var src = { a : 'string' };
 * var name = 'a';
 * function onRecursive( dstContainer,srcContainer,key )
 * {
 *   _.assert( _.strIs( key ) );
 *   dstContainer[ key ] = srcContainer[ key ];
 * };
 * _.entityCopyField(dst, src, name, onRecursive );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @method entityCopyField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */

function entityCopyField( dstContainer,srcContainer,name,onRecursive )
{
  var result;
  var name = _.nameUnfielded( name ).coded;

  _.assert( arguments.length === 3 || arguments.length === 4 );

  var dstValue = Object.hasOwnProperty.call( dstContainer,name ) ? dstContainer[ name ] : undefined;

  if( onRecursive )
  result = entityCopy( dstValue,srcContainer[ name ],onRecursive );
  else
  result = entityCopy( dstValue,srcContainer[ name ] );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

/**
 * Short-cut for entityCopy function. Assigns value of( srcValue ) to container( dstContainer ) field specified by( name ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcValue - Source value.
 * @param {string} name - Field name.
 * @param {mapClone~onCopyField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapClone} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entity field assignment operation.
 *
 * @example
 * var dstContainer = { a : 1 };
 * var srcValue = 15;
 * var name = 'a';
 * _.entityAssignField( dstContainer, srcValue, name );
 * console.log( dstContainer.a );
 * //returns 15
 *
 * @method entityAssignField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */

function entityAssignField( dstContainer,srcValue,name,onRecursive )
{
  var result;
  var name = _.nameUnfielded( name ).coded;

  _.assert( arguments.length === 3 || arguments.length === 4 );

  if( onRecursive )
  {
    throw _.err( 'not tested' );
    result = entityCopy( dstContainer[ name ],srcValue,onRecursive );
  }
  else
  result = entityCopy( dstContainer[ name ],srcValue );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

/**
 * Returns atomic entity( src ) casted into type of entity( ins ) to avoid unexpected implicit type casts.
 *
 * @param {object} src - Source object.
 * @param {object} ins - Type of( src ) depends on type of this object.
 * @returns {object} Returns object( src ) with  type of( ins ).
 *
 * @example
 * //returns "string"
 * typeof _.entityCoerceTo( 1, '1' )
 *
 * @example
 * //returns "number"
 * typeof _.entityCoerceTo( "1" , 1 )
 *
 * @example
 * //returns "boolean"
 * typeof _.entityCoerceTo( "1" , true )
 *
 * @method entityCoerceTo
 * @throws {exception} If only one or no arguments provided.
 * @throws {exception} If type of( ins ) is not supported.
 * @memberof wTools
 *
 */

function entityCoerceTo( src,ins )
{

  _.assert( arguments.length === 2 );

  if( _.numberIs( ins ) )
  {

    return _.numberFrom( src );

  }
  else if( _.strIs( ins ) )
  {

    return _.strFrom( src );

  }
  else if( _.boolIs( ins ) )
  {

    return _.boolFrom( src );

  }
  else throw _.err( 'unknown type to coerce to : ' + _.strTypeOf( ins ) );

}

//

function entityWrap( o )
{
  var result = o.dst;

  debugger;

  _.routineOptions( entityWrap,o );
  _.assert( arguments.length === 1 );

  if( o.onCondition )
  o.onCondition = _entityConditionMake( o.onCondition,1 );

  /* */

  function handleDown( e,k,iteration )
  {

    debugger;

    if( o.onCondition )
    if( !o.onCondition.call( this,e,k,iteration ) )
    return

    if( o.onWrap )
    {
      var newElement = o.onWrap.call( this,e,k,iteration );

      if( newElement !== e )
      {
        if( e === result )
        result = newElement;
        if( iteration.down && iteration.down.src )
        iteration.down.src[ iteration.key ] = newElement;
      }

    }
    else
    {

      var newElement = { _ : e };
      if( e === result )
      result = newElement;
      else
      iteration.down.src[ iteration.key ] = newElement;

    }

  }

  /* */

  _.eachRecursive
  ({
    src : o.dst,
    own : o.own,
    levels : o.levels,
    onDown : handleDown,
  });

  return result;
}

entityWrap.defaults =
{

  onCondition : null,
  onWrap : null,
  dst : null,
  own : 1,
  levels : 256,

}

//

function entityFreeze( src )
{
  var _src = src;

  if( _.bufferIs( src ) )
  {
    src = src.buffer;
  }

  Object.freeze( src );

  return _src;
}

// --
// entity checker
// --

/**
 * Checks if object( src ) has any NaN. Also works with arrays and maps. Works recursively.
 *
 * @param {object} src - Source object.
 * @returns {boolean} Returns result of check for NaN.
 *
 * @example
 * //returns true
 * _.entityHasNan( NaN )
 *
 * @example
 * //returns true
 * var arr = [ NaN, 1, 2 ];
 * _.entityHasNan( arr );
 *
 * @method entityHasNan
 * @throws {exception} If no argument provided.
 * @memberof wTools
 *
 */

function entityHasNan( src )
{
  _.assert( arguments.length === 1 );

  var result = false;
  if( src === undefined )
  {
    return true;
  }
  else if( _.numberIs( src ) )
  {
    return isNaN( src );
  }
  else if( _.arrayIs( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
    if( entityHasNan( src[ s ] ) )
    {
      return true;
    }
  }
  else if( _.objectIs( src ) )
  {
    for( s in src )
    if( entityHasNan( src[ s ] ) )
    {
      return true;
    }
  }

  return result;
}

//

/**
 * Checks if object( src ) or array has any undefined property. Works recursively.
 *
 * @param {object} src - Source object.
 * @returns {boolean} Returns result of check for undefined.
 *
 * @example
 * //returns true
 * _.entityHasUndef( undefined )
 *
 * @example
 * //returns true
 * var arr = [ undefined, 1, 2 ];
 * _.entityHasUndef( arr );
 *
 * @method entityHasUndef
 * @throws {exception} If no argument provided.
 * @memberof wTools
 *
 */

function entityHasUndef( src )
{
  _.assert( arguments.length === 1 );

  var result = false;
  if( src === undefined )
  {
    return true;
  }
  else if( _.arrayIs( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
    if( entityHasUndef( src[ s ] ) )
    {
      return true;
    }
  }
  else if( _.objectIs( src ) )
  {
    for( s in src )
    if( entityHasUndef( src[ s ] ) )
    {
      return true;
    }
  }
  return result;

}

//

 /**
  * Deep comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
  * Returns string refering to first found difference or false if entities are sames.
  *
  * @param {*} src1 - Entity for comparison.
  * @param {*} src2 - Entity for comparison.
  * @param {wTools~entitySameOptions} o - Comparsion options {@link wTools~entitySameOptions}.
  * @returns {boolean} result - Returns false for same entities or difference as a string.
  *
  * @example
  * //returns
  * //"at :
  * //src1 :
  * //1
  * //src2 :
  * //1 "
  * _.entityDiff( '1', 1 );
  *
  * @example
  * //returns
  * //"at : .2
  * //src1 :
  * //3
  * //src2 :
  * //4
  * //difference :
  * //*"
  * _.entityDiff( [ 1, 2, 3 ], [ 1, 2, 4 ] );
  *
  * @method entityDiff
  * @throws {exception} If( arguments.length ) is not equal 2 or 3.
  * @throws {exception} If( o ) is not a Object.
  * @throws {exception} If( o ) is extended by unknown property.
  * @memberof wTools
  */

function entityDiff( src1,src2,o )
{

  var o = o || Object.create( null );
  _assert( arguments.length === 2 || arguments.length === 3 );
  var same = _.entitySame( src1,src2,o );

  if( same )
  return false;

  var result = '';

  if( !_.atomicIs( src1 ) )
  src1 = _.toStr( _.entitySelect( src1,o.path ) );

  if( !_.atomicIs( src2 ) )
  src2 = _.toStr( _.entitySelect( src2,o.path ) );

  result += _.str
  (
    'at : ' + o.path +
    '\nsrc1 :\n' + src1 +
    '\nsrc2 :\n' + src2
  );

  if( _.strIs( src1 ) && _.strIs( src2 ) )
  result += ( '\ndifference :\n' + _.strDifference( src1,src2 ) );

  return result;
}

//

/**
 * Options for _entitySame() function.
 * @typedef {Object} wTools~entitySameOptions
 * @property {routine} [ onSameNumbers ] - Routine to compare two numbers.Returns true if numbers are equal.
 * @property {boolean} [ contain=0 ] - If this parameter sets to true, two entities will be considered the same,
 * if all keys/indexes of `src2`, are in `src1` with same values. Has no effect on comparison entities with primitive
 * types. If `options.contain` set to false, `src1` and `src2` will be considered the same, if and only if they has
 * the same lengths, same keys/indexes and same appropriates values.
 * @property {boolean} [ strict=1 ] - Specify equality comparison. When it set to true, then the Strict equality
 * using (===), else the Loose equality using (==).
 * @property {string} [ lastPath='' ] - This parameters is modified during the execution of method. Specified on path to
 * value, that composite from keys/indexes separated by '.'
 * @property {string} [ path='' ] - For non primitive entities indicates the current path for elements that is compared now.
 */

/**
 * Compares two values. For objects, arrays, array like objects, comparison will be recursive. Comparison criteria set
 * in the `options`. If in some moment method finds different values in two entities, then it returns false.
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entitySameOptions} o - Comparison criteria.
 * @returns {boolean} result - Returns true for same entities.
 *
 * @example
 * //returns false
 * var o = { onSameNumbers : function( a, b ){ return a === b } };
 * _._entitySame( 5, 6, o );
 *
 * @example
 * //returns true
 * _._entitySame( 'a', 'a', {} );
 *
 * @example
 * //returns false
 * var o = { onSameNumbers : function( a, b ){ return a === b } };
 * _._entitySame( [ 1, 2, 3 ], [ 1, 2, 4 ], o );
 *
 * @example
 * //returns false
 * var o = { onSameNumbers : function( a, b ){ return a === b } };
 * _._entitySame( { a : 1, b : 2 }, { a : 1, b : 2, c: 1 }, o );
 *
 * @example
 * //returns true
 * var o = { onSameNumbers : function( a, b ){ return a === b }, strict : 0 };
 * _._entitySame( { a : '1', b : '2' },{ a : 1, b : 2 }, o );
 *
 * @private
 * @method _entitySame
 * @throws {exception} If ( arguments.length ) is not equal 3.
 * @memberof wTools
 */

function _entitySame( src1,src2,o )
{

  var path = o.path;
  o.lastPath = path;

  _.assert( arguments.length === 3 );

  if( src1 === src2 )
  return true;

  if( o.strict )
  {
    if( _ObjectToString.call( src1 ) !== _ObjectToString.call( src2 ) )
    return false;
  }
  else
  {
    if( _ObjectToString.call( src1 ) !== _ObjectToString.call( src2 ) && src1 != src2 )
    return false;
  }

  /**/

  if( _.objectIs( src1 ) && _.routineIs( src1._isSame ) )
  {
    return src1._isSame( src1,src2,o );
  }
  else if( _.arrayLike( src1 ) )
  {

    if( !src2 )
    return false;
    if( src1.constructor !== src2.constructor )
    return false;
    if( !o.contain )
    if( src1.length !== src2.length )
    return false;
    for( var k = 0 ; k < src2.length ; k++ )
    {
      o.path = path + '.' + k;
      if( !_entitySame( src1[ k ], src2[ k ], o ) )
      return false;
      o.path = path;
    }

  }
  else if( _.objectLike( src1 ) )
  {

    if( _.routineIs( src1.isSame ) )
    {
      _.assert( src1.isSame.length === 3 );
      if( !src1.isSame( src1,src2,o ) )
      return false;
    }
    else if( _.regexpIs( src1 ) )
    {
      return _.regexpIdentical( src1,src2 );
    }
    else
    {

      if( !o.contain )
      if( _.entityLength( src1 ) !== _.entityLength( src2 ) )
      return false;
      for( var k in src2 )
      {
        o.path = path + '.' + k;
        if( !_entitySame( src1[ k ], src2[ k ], o ) )
        return false;
        o.path = path;
      }

    }

  }
  else if( _.numberIs( src1 ) )
  {
    return o.onSameNumbers( src1,src2 );
  }
  else
  {
    if( o.strict )
    {
      if( src1 !== src2 )
      return false;
    }
    else
    {
      if( src1 != src2 )
      return false;
    }
  }

  return true;
}

//

function _entitySameOptions( o )
{

  function _sameNumbersStrict( a,b )
  {
    return Object.is( a,b );
  }

  function _sameNumbersNotStrict( a,b )
  {
    if( Object.is( a,b ) )
    return true;
    return Math.abs( a-b ) <= eps;
  }

  _assert( arguments.length === 1 );
  _assert( o === undefined || _.objectIs( o ), '_.toStrFine :','options must be object' );

  var o = o || Object.create( null );

  _.assertMapHasOnly( o,_entitySameOptions.defaults );
  _.mapSupplement( o,_entitySameOptions.defaults );

  if( o.onSameNumbers === null )
  o.onSameNumbers = o.strict ? _sameNumbersStrict : _sameNumbersNotStrict;

  var eps = o.eps;

  return o;
}

_entitySameOptions.defaults =
{
  onSameNumbers : null,
  contain : 0,
  strict : 1,
  lastPath : '',
  path : '',
  eps : 1e-7,
}

//

/**
 * Deep comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * Returns false if finds difference in two entities, else returns true. By default method uses it own
 * ( onSameNumbers ) routine to compare numbers.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entitySameOptions} o - comparsion options {@link wTools~entitySameOptions}.
 * @returns {boolean} result - Returns true for same entities.
 *
 * @example
 * //returns false
 * _.entitySame( '1', 1 );
 *
 * @example
 * //returns true
 * _.entitySame( '1', 1, { strict : 0 } );
 *
 * @example
 * //returns true
 * _.entitySame( { a : { b : 1 }, b : 1 } , { a : { b : 1 } }, { contain : 1 } );
 *
 * @example
 * //returns ".a.b"
 * var o = { contain : 1 };
 * _.entitySame( { a : { b : 1 }, b : 1 } , { a : { b : 1 } }, o );
 * console.log( o.lastPath );
 *
 * @method entitySame
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( o ) is not a Object.
 * @throws {exception} If( o ) is extended by unknown property.
 * @memberof wTools
 */

function entitySame( src1,src2,o )
{

  _assert( arguments.length === 2 || arguments.length === 3 );

  var o = _entitySameOptions( o );

  return _entitySame( src1,src2,o );
}

entitySame.defaults =
{
}

entitySame.defaults.__proto__ = _entitySameOptions.defaults;

//

/**
 * Deep strict comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * Returns true if entities are identical.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entitySameOptions} options - Comparsion options {@link wTools~entitySameOptions}.
 * @param {boolean} [ options.strict = true ] - Method uses strict equality mode( '===' ).
 * @returns {boolean} result - Returns true for identical entities.
 *
 * @example
 * //returns true
 * var src1 = { a : 1, b : { a : 1, b : 2 } };
 * var src2 = { a : 1, b : { a : 1, b : 2 } };
 * _.entityIdentical( src1, src2 ) ;
 *
 * @example
 * //returns false
 * var src1 = { a : '1', b : { a : 1, b : '2' } };
 * var src2 = { a : 1, b : { a : 1, b : 2 } };
 * _.entityIdentical( src1, src2 ) ;
 *
 * @method entityIdentical
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( options ) is extended by unknown property.
 * @memberof wTools
*/

function entityIdentical( src1,src2,options )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  function sameNumbers( a,b )
  {
    return Object.is( a,b );
  }

  var options = _.mapSupplement( options || Object.create( null ),
  {
    strict : 1,
    onSameNumbers : sameNumbers,
  });

  return _.entitySame( src1,src2,options );
}

//

/**
 * Deep soft comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * By default uses own( onSameNumbers ) routine to compare numbers using( options.eps ). Returns true if two numbers are NaN, strict equal or
 * ( a - b ) <= ( options.eps ). For example: '_.entityEquivalent( 1, 1.5, { eps : .5 } )' returns true.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entitySameOptions} options - Comparsion options {@link wTools~entitySameOptions}.
 * @param {boolean} [ options.strict = false ] - Method uses( '==' ) equality mode .
 * @param {number} [ options.eps = 1e-5 ] - Maximal distance between two numbers.
 * Example: If( options.eps ) is '1e-5' then 0.99999 and 1.0 are equivalent.
 * @returns {boolean} Returns true if entities are equivalent.
 *
 * @example
 * //returns true
 * _.entityEquivalent( 2, 2.1, { eps : .2 } );
 *
 * @example
 * //returns true
 * _.entityEquivalent( [ 1, 2, 3 ], [ 1.9, 2.9, 3.9 ], { eps : 0.9 } );
 *
 * @method entityEquivalent
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( options ) is extended by unknown property.
 * @memberof wTools
*/

function entityEquivalent( src1,src2,options )
{
  var options = options || Object.create( null );
  var eps = options.eps;
  if( eps === undefined )
  eps = 1e-5;
  delete options.eps;

  _.assert( arguments.length === 2 || arguments.length === 3 );

  function _sameNumbers( a,b )
  {
    if( Object.is( a,b ) )
    return true;
    return Math.abs( a-b ) <= eps;
  }

  var options = _.mapSupplement( options || Object.create( null ),
  {
    strict : 0,
    onSameNumbers : _sameNumbers,
  });

  return _.entitySame( src1,src2,options );
}

//

/**
 * Deep contain comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * Returns true if entity( src1 ) contains keys/values from entity( src2 ) or they are indentical.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entitySameOptions} options - Comparsion options {@link wTools~entitySameOptions}.
 * @param {boolean} [ options.strict = true ] - Method uses strict( '===' ) equality mode .
 * @param {boolean} [ options.contain = true ] - Check if( src1 ) contains  keys/indexes and same appropriates values from( src2 ).
 * @returns {boolean} Returns boolean result of comparison.
 *
 * @example
 * //returns true
 * _.entityContain( [ 1, 2, 3 ], [ 1 ] );
 *
 * @example
 * //returns false
 * _.entityContain( [ 1, 2, 3 ], [ 1, 4 ] );
 *
 * @example
 * //returns true
 * _.entityContain( { a : 1, b : 2 }, { a : 1 , b : 2 }  );
 *
 * @method entityContain
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( options ) is extended by unknown property.
 * @memberof wTools
*/

function entityContain( src1,src2,options )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  var options = _.mapSupplement( options || Object.create( null ),
  {
    strict : 1,
    contain : 1,
  });

  return _.entitySame( src1,src2,options );
}

// --
// entity selector
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
 * var src = undefined;
 * _.entityLength( src );
 *
 * @method entityLength
 * @memberof wTools
*/

function entityLength( src )
{
  if( src === undefined ) return 0;
  if( _.arrayLike( src ) )
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
 * _.entitySize( "string" );
 *
 * @example
 * //returns 3
 * _.entitySize( [ 1, 2, 3 ] );
 *
 * @example
 * //returns 8
 * _.entitySize( new ArrayBuffer(8) );
 *
 * @example
 * //returns null
 * _.entitySize( 123 );
 *
 * @method entitySize
 * @memberof wTools
*/

function entitySize( src )
{
  if( _.strIs( src ) )
  return src.length;
  if( _.atomicIs( src ) )
  return null;

  if( _.numberIs( src.byteLength ) )
  return src.byteLength;

  if( _.arrayLike( src ) )
  return src.length;

  return null;
}

//

// function entityWithKeyRecursive( src,key,onEach )
// {
//   var i = 0;
//
//   debugger;
//   throw _.err( 'deprecated' );
//
//   if( key in src )
//   {
//     if( onEach )
//     onEach.call( src,src[ key ],key,i );
//     return src[ key ];
//   }
//
//   debugger;
//   _.eachRecursive( src,function( e,iteration )
//   {
//
//     debugger;
//     if( k === key )
//     {
//       if( onEach ) onEach( e,iteration );
//       return { value : src[ key ], key : key, index : iteration.index, container : src };
//     }
//
//   });
// }

//

/**
 * Returns value from entity( src ) using position provided by argument( index ).
 * For object method iterates over all properties and returns value when counter reaches( index ).
 *
 * @param {*} src - Source entity.
 * @param {number} index - Specifies position of needed value.
 * @returns {*} Returns value at specified position.
 *
 * @example
 * //returns 1
 * _.entityValueWithIndex( [ 1, 2, 3 ], 0);
 *
 * @example
 * //returns 123
 * _.entityValueWithIndex( { a : 'str', b : 123 }, 1 )
 *
 * @example
 * //returns undefined
 * _.entityValueWithIndex( { a : 'str', b : 123 }, 2 )
 *
 * @method entityValueWithIndex
 * @memberof wTools
*/

function entityValueWithIndex( src,index )
{

  if( _.arrayIs( src ) )
  {
    return src[ index ];
  }
  else if( _.objectIs( src ) )
  {
    var i = 0;
    for( var s in src )
    {
      if( i === index ) return src[ s ];
      i++;
    }
  }
  else if( _.strIs( src ) )
  {
    return src[ index ];
  }

}

//

/**
 * Searchs value( value ) in entity( src ) and returns index/key that represent that value or
 * null if nothing finded.
 *
 * @param {*} src - Source entity.
 * @param {*} value - Specifies value to search.
 * @returns {*} Returns specific index/key or null.
 *
 * @example
 * //returns 2
 * _.entityKeyWithValue( [ 1, 2, 3 ], 3);
 *
 * @example
 * //returns null
 * _.entityKeyWithValue( { a : 'str', b : 123 }, 1 )
 *
 * @example
 * //returns "b"
 * _.entityKeyWithValue( { a : 'str', b : 123 }, 123 )
 *
 * @method entityKeyWithValue
 * @memberof wTools
*/

function entityKeyWithValue( src,value )
{

  var result = null;

  if( _.arrayIs( src ) )
  {
    result = src.indexOf( value );
  }
  else if( _.objectIs( src ) )
  {
    var i = 0;
    for( var s in src )
    {
      if( src[ s ] == value ) return s;
    }
  }
  else if( _.strIs( src ) )
  {
    result = src.indexOf( value );
  }

  if( result === -1 ) result = null;
  return result;
}

//

/**
 * Returns generated options object( o ) for ( entitySelect ) routine.
 * Query( o.query ) can be represented as string or array of strings divided by one of( o.delimeter ).
 * Function parses( o.query ) in to array( o.qarrey ) by splitting string using( o.delimeter ).
 *
 * @param {Object|Array} [ o.container=null ] - Source entity.
 * @param {Array|String} [ o.query=null ] - Source query.
 * @param {*} [ o.set=null ] - Specifies value that replaces selected.
 * @param {Array} [ o.delimeter=[ '.','[',']' ] ] - Specifies array of delimeters for( o.query ) values.
 * @param {Boolean} [ o.usingUndefinedForMissing=false ] - If true returns undefined for Atomic type of( o.container ).
 * @returns {Object} Returns generated options object.
 *
 * @example
 * //returns { container: [ 0, 1, 2, 3 ], qarrey : [ '0', '1', '2' ], query: "0.1.2", set: 1, delimeter: [ '.','[',']' ], usingUndefinedForMissing: 1 }
 * _._entitySelectOptions( { container : [ 0, 1, 2, 3 ], query : '0.1.2', set : 1 } );
 *
 * @method _entitySelectOptions
 * @throws {Exception} If( arguments.length ) is not equal 1 or 2.
 * @throws {Exception} If( o.query ) is not a String or Array.
 * @memberof wTools
*/

function _entitySelectOptions( o )
{

  if( arguments[ 1 ] !== undefined )
  {
    var o = Object.create( null );
    o.container = arguments[ 0 ];
    o.query = arguments[ 1 ];
  }

  if( o.usingSet === undefined && o.set )
  o.usingSet = 1;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.routineOptions( _entitySelectOptions,o );
  _.assert( _.strIs( o.query ) || _.numberIs( o.query ) || _.arrayIs( o.query ) );

  /* makeQarrey */

  function makeQarrey( query )
  {
    var qarrey;

    if( _.numberIs( query ) )
    qarrey = [ query ];
    else
    qarrey = _.strSplit
    ({
      src : query,
      delimeter : o.delimeter,
      stripping : 1,
    });

    if( qarrey[ 0 ] === '' )
    qarrey.splice( 0,1 );

    return qarrey;
  }

  /* */

  if( _.arrayIs( o.query ) )
  {
    o.qarrey = [];
    for( var i = 0 ; i < o.query.length ; i++ )
    o.qarrey[ i ] = makeQarrey( o.query[ i ] );
  }
  else
  {
    o.qarrey = makeQarrey( o.query );
  }

  return o;
}

_entitySelectOptions.defaults =
{
  container : null,
  query : null,
  set : null,
  delimeter : [ '.','/','[',']' ],
  usingUndefinedForMissing : 1,
  usingMapIndexedAccess : 1,
  usingSet : 0,
}

//

function _entitySelect( o )
{
  var result;

  if( _.arrayIs( o.query ) )
  {
    debugger;

    result = Object.create( null );
    for( var i = 0 ; i < o.query.length ; i++ )
    {

      // var iteration = Object.create( null );
      // iteration.qarrey = o.qarrey[ i ];
      // iteration.container = o.container;
      // iterator.query = o.query[ i ];

      var optionsForSelect = _.mapExtend( Object.create( null ),o );
      optionsForSelect.query = optionsForSelect.query[ i ];

      // iteration.qarrey = o.qarrey[ i ];
      // iteration.container = o.container;
      // iterator.query = o.query[ i ];

      result[ iterator.query ] = _entitySelectAct( iteration,iterator );
    }

    return result;
  }

  // debugger;
  o = _entitySelectOptions( o );

  var iterator = Object.create( null );
  iterator.set = o.set;
  iterator.delimeter = o.delimeter;
  iterator.usingUndefinedForMissing = o.usingUndefinedForMissing;
  iterator.usingMapIndexedAccess = o.usingMapIndexedAccess;
  iterator.usingSet = o.usingSet;

  iterator.query = o.query;

  var iteration = Object.create( null );
  iteration.qarrey = o.qarrey;
  iteration.container = o.container;

  result = _entitySelectAct( iteration,iterator );

  return result;
}

//

/**
 * Returns value from entity that corresponds to index / key or path provided by( o.qarrey ) from entity( o.container ).
 *
 * @param {Object|Array} [ o.container=null ] - Source entity.
 * @param {Array} [ o.qarrey=null ] - Specifies key/index to select or path to element. If has '*' method processes each element of container.
 * Example process each element at [ 0 ]: { container : [ [ 1, 2, 3 ] ], qarrey : [ 0, '*' ] }.
 * Example path to element [ 1 ][ 1 ]: { container : [ 0, [ 1, 2 ] ],qarrey : [ 1, 1 ] }.
 * @param {*} [ o.set=null ] - Replaces selected index/key value with this. If defined and specified index/key not exists, method inserts it.
 * @param {Boolean} [ o.usingUndefinedForMissing=false ] - If true returns undefined for Atomic type of( o.container ).
 * @returns {*} Returns value finded by index/key or path.
 *
 * @method _entitySelectAct
 * @throws {Exception} If container is Atomic type.
 * @memberof wTools
*/

function _entitySelectAct( iteration,iterator )
{

  var result;
  var container = iteration.container;

  var key = iteration.qarrey[ 0 ];
  var key2 = iteration.qarrey[ 1 ];

  if( !iteration.qarrey.length )
  return container;

  _.assert( Object.keys( iterator ).length === 6 );
  _.assert( Object.keys( iteration ).length === 2 );
  _.assert( arguments.length === 2 );

  if( _.atomicIs( container ) )
  {
    if( iterator.usingUndefinedForMissing )
    return undefined;
    else
    throw _.err( 'cant select',iteration.qarrey.join( '.' ),'from atomic',_.strTypeOf( container ) );
  }

  var qarrey = iteration.qarrey.slice( 1 );

  /* */

  function _select( key )
  {

    if( !qarrey.length && iterator.usingSet )
    {
      if( iterator.set === undefined )
      delete container[ key ];
      else
      container[ key ] = iterator.set;
    }

    var field;
    if( iterator.usingMapIndexedAccess && _.numberIs( key ) && _.objectIs( container ) )
    field = _.mapValWithIndex( container, key );
    else
    field = container[ key ];

    if( field === undefined && iterator.usingSet )
    {
      debugger;
      if( !isNaN( key2 ) )
      {
        container[ key ] = field = [];
      }
      else
      {
        container[ key ] = field = Object.create( null );
      }
    }

    if( field === undefined )
    return;

    var newIteration = Object.create( null );
    newIteration.container = field;
    newIteration.qarrey = qarrey;

    return _entitySelectAct( newIteration,iterator );
  }

  /* */

  if( key === '*' )
  {

    //result = new container.constructor();
    result = _.entityNew( container );
    _.each( container,function( e,k,iteration )
    {
      result[ k ] = _select( k );
    });

  }
  else
  {
    result = _select( key );
  }

  return result;
}

//

function entitySelect( o )
{

  // o = _entitySelectOptions( arguments[ 0 ],arguments[ 1 ] );

  if( arguments[ 1 ] !== undefined )
  {
    var o = Object.create( null );
    o.container = arguments[ 0 ];
    o.query = arguments[ 1 ];
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );

  var result = _entitySelect( o );

  return result;
}

entitySelect.defaults =
{
}

entitySelect.defaults.__proto__ = _entitySelectOptions.defaults;

//

function entitySelectSet( container,query,value )
{

  _.assert( arguments.length === 1 || arguments.length === 3 );

  if( query !== undefined || value !== undefined )
  {
    var o = Object.create( null );
    o.container = arguments[ 0 ];
    o.query = arguments[ 1 ];
    o.set = arguments[ 2 ];
    // var o = _entitySelectOptions( arguments[ 0 ],arguments[ 1 ] );
    // o.set = value;
  }
  else
  {
    // var o = _entitySelectOptions( arguments[ 0 ] );
    _.assert( _.mapOwn( o,{ set : 'set' } ) );
  }

  o.usingSet = 1;

  var result = _entitySelect( o );

  return result;
}

entitySelectSet.defaults =
{
  set : null,
  usingSet : 1,
}

entitySelectSet.defaults.__proto__ = _entitySelectOptions.defaults;

//

function entitySelectUnique( o )
{

  if( arguments[ 1 ] !== undefined )
  {
    var o = Object.create( null );
    o.container = arguments[ 0 ];
    o.query = arguments[ 1 ];
  }

  // o = _entitySelectOptions( arguments[ 0 ],arguments[ 1 ] );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.arrayCount( o.qarrey,'*' ) <= 1,'not implemented' );
  debugger;

  var result = _entitySelect( o );

  if( o.qarrey.indexOf( '*' ) !== -1 )
  if( _.arrayLike( result ) )
  result = _.arrayUnique( result );

  return result;
}

entitySelectUnique.defaults =
{
}

entitySelectUnique.defaults.__proto__ = _entitySelectOptions.defaults;

//

/**
 * Returns generated function that takes single argument( e ) and can be called to check if object( e )
 * has at least one key/value pair that is represented in( condition ).
 * If( condition ) is provided as routine, method uses it to check condition.
 * Generated function returns origin( e ) if conditions is true, else undefined.
 *
 * @param {object|function} condition - Map to compare with( e ) or custom function.
 * @returns {function} Returns condition check function.
 *
 * @example
 * //returns Object {a: 1}
 * var check = _._entityConditionMake( { a : 1, b : 1, c : 1 } );
 * check( { a : 1 } );
 *
 * @example
 * //returns false
 * function condition( src ){ return src.y === 1 }
 * var check = _._entityConditionMake( condition );
 * check( { a : 2 } );
 *
 * @method _entityConditionMake
 * @throws {exception} If no argument provided.
 * @throws {exception} If( condition ) is not a Routine or Object.
 * @memberof wTools
*/

function _entityConditionMake( condition,levels )
{
  var result;

  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( condition ) || _.objectIs( condition ) );

  if( _.objectIs( condition ) )
  {
    var template = condition;
    condition = function( e )
    {
      if( e === template )
      return e;
      if( !_.objectLike( e ) )
      return;
      var satisfied = _.mapSatisfy
      ({
        template : template,
        src : e,
        levels : levels
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
 * @callback wTools~onEach
 * @param {*} val - The current element being processed in the entity.
 * @param {string|number} key - The index (if entity is array) or key of processed element.
 * @param {Array|Object} src - The src passed to entityMap.
 */

/**
 * Creates new instance with same as( src ) type. Elements of new instance results of calling a provided ( onEach )
 * function on every element of src. If entity is array, the new array has the same length as source.
 *
 * @example
  var numbers = [ 3, 4, 6 ];

  function sqr( v )
  {
    return v * v
  };

  var res = wTools.entityMap(numbers, sqr);
  // [ 9, 16, 36 ]
  // numbers is still [ 3, 4, 6 ]

  function checkSidesOfTriangle( v, i, src )
  {
    var sumOthers = 0,
      l = src.length,
      j;

    for ( j = 0; j < l; j++ )
    {
      if ( i === j ) continue;
      sumOthers += src[ j ];
    }
    return v < sumOthers;
  }

  var res = wTools.entityMap( numbers, checkSidesOfTriangle );
 // [ true, true, true ]
 *
 * @param {ArrayLike|ObjectLike} src - Entity, on each elements of which will be called ( onEach ) function.
 * @param {wTools~onEach} onEach - Function that produces an element of the new entity.
 * @returns {ArrayLike|ObjectLike} New entity.
 * @thorws {Error} If number of arguments less or more than 2.
 * @thorws {Error} If( src ) is not Array or ObjectLike.
 * @thorws {Error} If( onEach ) is not function.
 * @method entityMap
 * @memberof wTools
 */

function entityMap( src,onEach )
{

  _.assert( arguments.length === 2 );
  _.assert( _.objectLike( src ) || _.arrayLike( src ) );
  _.assert( _.routineIs( onEach ) );

  var result = _.entityNew( src );

  if( _.arrayLike( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
    result[ s ] = onEach( src[ s ],s,src );
  }
  else if( _.objectLike( src ) )
  {
    for( var s in src )
    {
      result[ s ] = onEach( src[ s ],s,src );
      _.assert( result[ s ] !== undefined,'( entityMap ) onEach should return defined values, to been able return undefined to delete element use ( entityFilter )' )
    }
  }
  else _.assert( 0,'unexpected' );

  return result;
}

//

/**

 * Filters elements of entity( src ) by calling( onEach ) function for each item.
 * Returns result of filtering as new instance of type( src ) with items that succesfully passed ( onEach ) function.
 * @see wTools.entityMap
 *
 * @example
   var numbers = [ 36, -25, 49, 64, -16 ];

   function sqrt( v )
   {
      return ( v > 0 ) ? Math.sqrt( v ) : undefined;
   };

   var res = wTools.entityMap( numbers, sqrt );
 // [ 6, 7, 8 ]
 // numbers are still [ 36, -25, 49, 64, -16 ];
 *
 * @param {ArrayLike|ObjectLike} src - Source entity.
 * @param {wTools~onEach} onEach - Conditional function called for each entities element.
 * @returns {ArrayLike|ObjectLike} Returns new entity that contais filtered items.
 * @thorws {Error} If( arguments.length ) less or more than 2.
 * @thorws {Error} If( src ) is not Array or ObjectLike.
 * @thorws {Error} If( onEach ) is not a function.
 * @method entityFilter
 * @memberof wTools
 */

function _entityFilter( o )
{

  var result;
  var onEach = _entityConditionMake( o.onEach,o.conditionLevels );

  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( o.src ) || _.arrayLike( o.src ),'entityFilter : expects objectLike or arrayLike src, but got',_.strTypeOf( o.src ) );
  _.assert( _.routineIs( onEach ) );

  /* */

  if( _.arrayLike( o.src ) )
  {
    result = _.arrayNew( o.src,0 );
    for( var s = 0, d = 0 ; s < o.src.length ; s++, d++ )
    {
      var r = onEach.call( o.src,o.src[ s ],s,o.src );
      if( r === undefined )
      d--;
      else
      result[ d ] = r;
    }
  }
  else
  {
    // result = new o.src.constructor()
    result = _.entityNew( o.src );
    debugger;

    for( var s in o.src )
    {
      r = onEach.call( o.src,o.src[ s ],s,o.src );
      if( r !== undefined )
      result[ s ] = r;
    }
  }

  /* */

  return result;
}

_entityFilter.defaults =
{
  src : null,
  onEach : null,
  conditionLevels : 1,
}

//

function entityFilter( src,onEach )
{
  _.assert( arguments.length === 2 );
  return _entityFilter
  ({
    src : src,
    onEach : onEach,
    conditionLevels : 1,
  });
}

//

function entityFilterDeep( src,onEach )
{
  _.assert( arguments.length === 2 );
  return _entityFilter
  ({
    src : src,
    onEach : onEach,
    conditionLevels : 1024,
  });
}

//

  /**
   * Groups elements of entities from array( src ) into the object with key( o.key )
   * that contains array of values that corresponds to key( o.key ) from that entities.
   * If function cant find key( o.key ) it replaces key value with undefined.
   *
   * @param { array } [ o.src=null ] - The target array.
   * @param { array|string } [ o.key=null ] - Array of keys to search or one key as string.
   * @param { array|string } [ o.usingOriginal=1 ] - Uses keys from entities to represent elements values.
   * @param { objectLike | string } o - Options.
   * @returns { object } Returns an object with values grouped by key( o.key ).
   *
   * @example
   * // returns
   * //{
   * //  key1 : [ 1, 2, 3 ],
   * //  key3 : [ undefined, undefined, undefined ]
   * //}
   * _.entityGroup( { src : [ {key1 : 1, key2 : 2 },{key1 : 2 },{key1 : 3 }], usingOriginal : 0, key : ['key1','key3']} );
   *
   * @example
   * // returns
   * // {
   * //   a :
   * //   {
   * //     1 : [ { a : 1, b : 2 } ],
   * //     2 : [ { a : 2, b : 3 } ],
   * //     undefined : [ { c : 4 } ]
   * //   }
   * // }
   * _.entityGroup( { src : [ { a : 1, b : 2 }, { a : 2, b : 3}, {  c : 4 }  ], key : ['a'] }  );
   *
   * @method entityGroup
   * @throws {exception} If( arguments.length ) is not equal 1.
   * @throws {exception} If( o.key ) is not a Array or String.
   * @throws {exception} If( o.src ) is not a Array-like or Object-like.
   * @memberof wTools
   */

function entityGroup( o )
{
  var o = o || Object.create( null );

  /* key */

  if( o.key === undefined || o.key === null )
  {

    if( o.usingOriginal === undefined )
    o.usingOriginal = 0;

    if( _.arrayLike( o.key ) )
    o.key = _.mapKeys.apply( _,o.src );
    else
    o.key = _.mapKeys.apply( _,_.mapValues( o.src ) );

  }

  /* */

  var o = _.routineOptions( entityGroup,o );

  _assert( arguments.length === 1 );
  _assert( _.strIs( o.key ) || _.arrayIs( o.key ) );
  _assert( _.objectLike( o.src ) || _.arrayLike( o.src ) );
  _assert( _.arrayIs( o.src ),'not tested' );

  /* */

  function groupForKey( key,result )
  {

    _.each( o.src, function( e,k,iteration )
    {

      var value = o.usingOriginal ? o.src[ iteration.key ] : o.src[ iteration.key ][ key ];
      var dstKey = o.usingOriginal ? o.src[ iteration.key ][ key ] : iteration.key;

      if( o.usingOriginal )
      {
        if( result[ dstKey ] === undefined )
        result[ dstKey ] = [];
        result[ dstKey ].push( value );
      }
      else
      {
        result[ dstKey ] = value;
      }

    });

    return result;
  }

  /* */

  var result;
  if( _.arrayIs( o.key ) )
  {

    result = Object.create( null );
    for( var k = 0 ; k < o.key.length ; k++ )
    {
      debugger;
      var r = o.usingOriginal ? Object.create( null ) : _.entityNew( o.src );
      result[ o.key[ k ] ] = groupForKey( o.key[ k ],r );
    }

  }
  else
  {
    result = Object.create( null );
    groupForKey( o.key,result );
  }

  /**/

  return result;
}

entityGroup.defaults =
{
  src : null,
  key : null,
  usingOriginal : 1,
}

//

/**
 * The result of _entityMost method object.
 * @typedef {Object} wTools~entityMostResult
 * @property {Number} index - Index of found element.
 * @property {String|Number} key - If the search was on map, the value of this property sets to key of found element.
 * Else if search was on array - to index of found element.
 * @property {Number} value - The found result of onElement, if onElement don't set, this value will be same as element.
 * @property {Number} element - The appropriate element for found value.
 */

/**
 * Returns object( wTools~entityMostResult ) that contains min or max element of entity, it depends on( returnMax ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onElement  - ( onEach ) function is called for each element of( src ).If undefined method uses it own function.
 * @param {Boolean} returnMax  - If true - method returns maximum, else method returns minimum value from entity.
 * @returns {wTools~entityMostResult} Object with result of search.
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
 * @method _entityMost
 * @throws {Exception} If( arguments.length ) is not equal 3.
 * @throws {Exception} If( onElement ) function is not implemented.
 * @memberof wTools
 */

function _entityMost( src,onElement,returnMax )
{

  if( onElement === undefined )
  onElement = function( element ){ return element; }

  _.assert( arguments.length === 3 );
  _.assert( onElement.length === 1,'not mplemented' );

  var onCompare = null;

  if( returnMax )
  onCompare = function( a,b )
  {
    return a-b;
  }
  else
  onCompare = function( a,b )
  {
    return b-a;
  }

  _.assert( onCompare.length === 1 || onCompare.length === 2 ); // xxx

  var result = { index : -1, key : undefined, value : undefined, element : undefined };

  if( _.arrayLike( src ) )
  {

    if( src.length === 0 )
    return result;
    result.key = 0;
    result.value = onElement( src[ 0 ] );
    result.element = src[ 0 ];

    for( var s = 0 ; s < src.length ; s++ )
    {
      var value = onElement( src[ s ] );
      if( onCompare( value,result.value ) > 0 )
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

    //throw _.err( 'not tested' );
    for( var s in src )
    {
      result.index = 0;
      result.key = s;
      result.value = onElement( src[ s ] );
      result.element = src[ s ]
      break;
    }

    var index = 0;
    for( var s in src )
    {
      var value = onElement( src[ s ] );
      if( onCompare( value,result.value ) > 0 )
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
 * Short-cut for _entityMost() method. Returns object( wTools~entityMostResult ) with smallest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onElement  - ( onEach ) function is called for each element of( src ).If undefined method uses it own function.
 * @returns {wTools~entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index : 2, key : 'c', value 3: , element : 9  };
 *  var obj = { a : 25, b : 16, c : 9 };
 *  var min = wTools.entityMin( obj, Math.sqrt );
 *
 * @see wTools~onEach
 * @see wTools~entityMostResult
 * @method entityMin
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */

function entityMin( src,onElement )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return _entityMost( src,onElement,0 );
}

//

/**
 * Short-cut for _entityMost() method. Returns object( wTools~entityMostResult ) with biggest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onElement  - ( onEach ) function is called for each element of( src ).If undefined method uses it own function.
 * @returns {wTools~entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index: 0, key: "a", value: 25, element: 25 };
 *  var obj = { a: 25, b: 16, c: 9 };
 *  var max = wTools.entityMax( obj );
 *
 * @see wTools~onEach
 * @see wTools~entityMostResult
 * @method entityMax
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */

function entityMax( src,onElement )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return _entityMost( src,onElement,1 );
}

//

function entitySearch( o )
{
  var result = Object.create( null );

  if( arguments.length === 2 )
  {
    o = { src : arguments[ 0 ], ins : arguments[ 1 ] };
  }

  logger.log( 'entitySearch',o );

  _.routineOptions( entitySearch,o );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  _.assert( o.onDown.length === 0 || o.onDown.length === 3 );
  _.assert( o.onUp.length === 0 || o.onUp.length === 3 );

  var strIns,regexpIns;
  strIns = String( o.ins );

  if( o.searchingCaseInsensitive && _.strIs( o.ins ) )
  regexpIns = new RegExp( ( o.searchingSubstring ? '' : '^' ) + strIns + ( o.searchingSubstring ? '' : '$' ),'i' );

  if( o.condition )
  {
    o.condition = _entityConditionMake( o.condition,1 );
    _.assert( o.condition.length === 0 || o.condition.length === 3 );
  }

  /* */

  function checkCandidate( e,k,iteration,r,path )
  {

    var c = true;
    if( o.condition )
    {
      c = o.condition.call( this,e,k,iteration );
    }

    if( !c )
    return c;

    if( e === o.ins )
    {
      result[ path ] = r;
    }
    else if( regexpIns )
    {
      if( regexpIns.test( e ) )
      result[ path ] = r;
    }
    else if( o.searchingSubstring && _.strIs( e ) && e.indexOf( strIns ) !== -1 )
    {
      result[ path ] = r;
    }

  }

  /* */

  var onUp = o.onUp;
  function handleUp( e,k,iteration )
  {

    if( onUp )
    if( onUp.call( this,e,k,iteration ) === false )
    return false;

    var path = iteration.path;

    var r;
    if( o.returnParent && iteration.down )
    {
      r = iteration.down.src;
      if( o.usingExactPath )
      path = iteration.down.path;
    }
    else
    {
      r = e;
    }

    if( o.searchingValue )
    {
      checkCandidate.call( this,e,k,iteration,r,path );
    }

    if( o.searchingKey )
    {
      checkCandidate.call( this,iteration.key,k,iteration,r,path );
    }

  }

  /* */

  var optionsEach = _.mapScreen( _._each.defaults,o )
  optionsEach.onUp = handleUp;

  _._each( optionsEach );

  return result;
}

entitySearch.defaults =
{

  src : null,
  ins : null,
  condition : null,

  onUp : function(){},
  onDown : function(){},

  own : 1,
  recursive : 1,

  // pathOfParent : 1,
  returnParent : 0,
  usingExactPath : 0,

  searchingKey : 1,
  searchingValue : 1,
  searchingSubstring : 1,
  searchingCaseInsensitive : 0,

}

entitySearch.defaults.__proto__ = _each.defaults;

// --
// error
// --

function errIs( src )
{
  return src instanceof Error || _ObjectToString.call( src ) === '[object Error]';
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
  return src.attentionGiven;
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

  _.assert( _.errIs( err ) );

  Object.defineProperty( err, 'attentionGiven',
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
 * @method _err
 * @memberof wTools
 */

function _err( o )
{
  var result;

  if( arguments.length !== 1 )
  throw Error( '_err : expects single argument' );

  if( !_.arrayLike( o.args ) )
  throw Error( '_err : o.args should be array like' );

  if( !_.numberIs( o.level ) )
  o.level = _err.defaults.level;

  if( o.usingSourceCode === undefined )
  o.usingSourceCode = _err.defaults.usingSourceCode;

  if( o.args[ 0 ] === 'not tested' || o.args[ 0 ] === 'unexpected' )
  debugger;

  /* var */

  var originalMessage = '';
  var catches = '';
  var sourceCode = '';
  var stack = '';
  // var fileName,lineNumber;
  var location;
  var errors = [];

  /* Error.stackTraceLimit = 99; */

  /* find error in arguments */

  for( var a = 0 ; a < o.args.length ; a++ )
  {
    var arg = o.args[ a ];

    if( o.args[ a ] instanceof Error )
    {

      if( !result )
      {
        result = o.args[ a ];
        catches = result.catches || '';
        sourceCode = result.sourceCode || '';
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
        var fields = _.mapFields( arg );
        if( Object.keys( fields ).length )
        o.args[ a ] += '\n' + _.toStr( fields,{ wrap : 0, multiline : 1, levels : 2 } );
      }

      if( errors.length > 0 )
      o.args[ a ] = '\n' + o.args[ a ];
      errors.push( arg );

      location = _.diagnosticLocation({ error : arg, location : location });

    }

  }

  /* look into non-error arguments to find location */

  if( !result )
  for( var a = 0 ; a < o.args.length ; a++ )
  {
    var arg = o.args[ a ];

    if( !_.atomicIs( arg ) )
    {
      location = _.diagnosticLocation({ error : arg, location : location });
    }

  }

  location = location || Object.create( null );

  /* make new one if no error in arguments */

  if( !result )
  {
    result = new Error( originalMessage + '\n' );
    stack = _.diagnosticStack( result,o.level,-1 );
    if( location.full && stack.indexOf( '\n' ) === -1 )
    stack = location.full;
  }
  else
  {
    if( result.stack !== undefined )
    {
      if( result.originalMessage !== undefined )
      stack = result.stack;
      else
      stack = _.diagnosticStack( result );
    }
    else
    stack = _.diagnosticStack( o.level,-1 );
  }

  /* collect data */

  for( var a = 0 ; a < o.args.length ; a++ )
  {
    var argument = o.args[ a ];
    var str;

    if( argument && !_.atomicIs( argument ) )
    {

      if( _.atomicIs( argument ) ) str = String( argument );
      else if( _.routineIs( argument.toStr ) ) str = argument.toStr();
      else if( _.errIs( argument ) || _.strIs( argument.message ) )
      {
        if( _.strIs( argument.originalMessage ) ) str = argument.originalMessage;
        else if( _.strIs( argument.message ) ) str = argument.message;
        else str = _.toStr( argument );
      }
      else if( _.routineIs( argument.toString ) ) str = argument.toString();
      else str = '[ ' + _.strTypeOf( argument ) + ' ]';

    }
    else str = String( argument );

    if( _.strIs( str ) && str[ str.length-1 ] === '\n' )
    originalMessage += str;
    else
    originalMessage += str + ' ';

    if( originalMessage.indexOf( 'caught at' ) !== -1 )
    debugger;

  }

  /* line number */

  if( location.line !== undefined )
  {
    Object.defineProperty( result, 'lineNumber',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : location.line,
    });
  }

  /* file name */

  if( location.path !== undefined )
  {
    if( location.full !== undefined )
    originalMessage += '\n' + 'Location : ' + location.full;
    Object.defineProperty( result, 'fileName',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : location.path,
    });
  }

  /* where it was caught */

  // catches = '    caught ' + _.diagnosticStack( o.level,o.level+1 ) + '\n' + catches;
  catches = '    caught at ' + _.diagnosticLocation( o.level ).full + '\n' + catches;

  /* source code */

  if( o.usingSourceCode )
  if( result.sourceCode === undefined )
  {
    var c = '';
    location = _.diagnosticLocation({ stack : stack, location : location });
    c = _.diagnosticCode({ location : location });
    if( c && c.length < 400 )
    {
      sourceCode += '\n';
      sourceCode += c;
      sourceCode += '\n ';
    }
  }

  /* join */

  var message = '';

  var briefly = result.briefly && ( result.briefly === undefined || result.briefly === null || result.briefly );
  briefly = briefly || o.briefly;
  if( briefly )
  message += originalMessage;
  else
  message += '\n* Catches :\n' + catches + '\n* Message :\n' + originalMessage + '\n\n* Stack :\n' + stack + '\n';

  if( sourceCode && !briefly )
  message += '\n' + sourceCode;

  try
  {
    Object.defineProperty( result, 'message',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : message,
    });
  }
  catch( e )
  {
    debugger;
    result = new Error( message );
  }

  /* stack */

  try
  {
    Object.defineProperty( result, 'stack',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : stack,
    });
  }
  catch( err )
  {
  }

  /* briefly */

  if( o.briefly )
  Object.defineProperty( result, 'briefly',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : o.briefly,
  });

  /* source code */

  Object.defineProperty( result, 'sourceCode',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : sourceCode || null,
  });

  /* original message */

  Object.defineProperty( result, 'originalMessage',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : originalMessage,
  });

  /* catches */

  Object.defineProperty( result, 'catches',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : catches,
  });

  /* catch count */

  Object.defineProperty( result, 'catchCounter',
  {
    enumerable : false,
    configurable : true,
    writable : true,
    value : result.catchCounter ? result.catchCounter+1 : 1,
  });

  if( originalMessage.indexOf( 'caught at' ) !== -1 )
  {
    debugger;
    console.log( '-' );
    console.log( result.toString() );
    console.log( '-' );
    throw Error( 'err : originalMessage should have no "caught at"' );
  }

  return result;
}

_err.defaults =
{
  level : 0,
  usingSourceCode : 1,
  briefly : null,
  args : null,
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
 //   at _err (file:///.../wTools/staging/wTools.s:1418:13)
 //   at wTools.err (file:///.../wTools/staging/wTools.s:1449:10)
 //   at divide (<anonymous>:2:29)
 //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, method modified it and return
 * reference.
 * @method err
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

function errAttend( err )
{

  // if( arguments.length !== 1 || !_.errIsRefined(  ) )
  // debugger;

  if( arguments.length !== 1 || !_.errIsRefined( err ) )
  err = _err
  ({
    args : arguments,
    level : 2,
  });

  /* */

  try
  {

    Object.defineProperty( err, 'attentionRequested',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : 0,
    });

    Object.defineProperty( err, 'attentionGiven',
    {
      enumerable : false,
      configurable : true,
      writable : true,
      value : 1,
    });

  }
  catch( err )
  {
    c.warn( 'cant assign attentionRequested / attentionGiven properties' );
  }

  /* */

  return err;
}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them. Prints the created error.
 * If _global_.logger defined, method will use it to print error, else uses console
 * @see wTools.err
 *
 * @example
   function divide( x, y )
   {
      if( y == 0 )
        throw wTools.errLog('divide by zero')
      return x / y;
   }
   divide (3, 0);

   // Error:
   // caught     at divide (<anonymous>:2:29)
   // divide by zero
   // Error
   //   at _err (file:///.../wTools/staging/wTools.s:1418:13)
   //   at wTools.errLog (file:///.../wTools/staging/wTools.s:1462:13)
   //   at divide (<anonymous>:2:29)
   //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, method modified it and return
 * @method errLog
 * @memberof wTools
 */

function errLog()
{

  var c = _global_.logger || _global_.console;
  var err = _err
  ({
    args : arguments,
    level : 2,
  });

  /* */

  if( _.routineIs( err.toString ) )
  {
    c.error( err.toString() );
  }
  else
  {
    c.error( err );
  }

  /* */

  _.errAttend( err );

  /* */

  debugger;
  return err;
}

//

function errLogOnce( err )
{

  var err = _err
  ({
    args : arguments,
    level : 2,
  });

  if( err.attentionGiven )
  return err;

  return errLog( err );
}

// --
// diagnostics
// --

function _diagnosticStripPath( src )
{
  _.assert( arguments.length === 1 );

  if( _.strIs( src ) )
  {
    src = src.replace( /^\s+/,'' );
    // src = src.replace( /^at/,'' );
    // src = src.replace( /^\s+/,'' );
  }

  return src;
}

//

// function diagnosticScript( path )
// {
//
//   if( typeof document !== 'undefined' && document.scripts )
//   {
//     var scripts = document.scripts;
//     for( var s = 0 ; s < scripts.length ; s++ )
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
  o = { stack : _.diagnosticStack( 1 ) };

  _.routineOptions( diagnosticLocation,o );
  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( _.objectIs( o ),'diagnosticLocation expects integer ( level ) or string ( stack ) or object ( options )' );

  if( !o.location )
  o.location = Object.create( null );

  /* end */

  function end()
  {

    var path = o.location.path;

    /* full */

    if( path )
    {
      o.location.full = path;
      if( o.location.line !== undefined )
      o.location.full += ':' + o.location.line;
    }

    /* name */

    if( path )
    {
      var name = path;
      var i = name.lastIndexOf( '/' );
      if( i !== -1 )
      name = name.substr( i+1 );
      o.location.name = name;
    }

    /* name long */

    if( path )
    {
      var nameLong = o.location.name;
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

  /* */

  // var fileName,lineNumber;

  // if( o.error && _.strIs( o.error.fileName ) && _.numberIs( o.error.lineNumber ) )
  if( o.error )
  {
    // debugger;
    // var result = { path : o.error.fileName, line : o.error.lineNumber, col : o.error.colNumber }

    o.location.path = _.arrayLeftDefined([ o.location.path, o.error.filename, o.error.fileName ]).element;
    o.location.line = _.arrayLeftDefined([ o.location.line, o.error.line, o.error.linenumber, o.error.lineNumber, o.error.lineNo, o.error.lineno ]).element;
    o.location.col = _.arrayLeftDefined([ o.location.col, o.error.col, o.error.colnumber, o.error.colNumber, o.error.colNo, o.error.colno ]).element;

    return end();
  }

  /* */

  if( !o.stack )
  {
    if( o.error )
    {
      o.stack = _.diagnosticStack( o.error );
    }
    else
    {
      o.stack = _.diagnosticStack();
      o.level += 1;
    }
  }

  if( _.strIs( o.stack ) )
  o.stack = o.stack.split( '\n' );
  o.location.path = o.stack[ o.level ];

  if( !_.strIs( o.location.path ) )
  return end();

  o.location.path = o.location.path.replace( /^\s+/,'' );
  o.location.path = o.location.path.replace( /^\w+@/,'' );
  o.location.path = o.location.path.replace( /^at/,'' );
  o.location.path = o.location.path.replace( /^\s+/,'' );
  o.location.path = o.location.path.replace( /\s+$/,'' );

  if( _.strEnds( o.location.path,')' ) )
  o.location.path = _.strInbetweenOf( o.location.path,'(',')' );

  if( !o.location.path )
  return end();

  /* line / col number from stack */

  var lineNumber,colNumber;
  var postfix = /:(\d+)$/;
  colNumber = postfix.exec( o.location.path );
  if( colNumber )
  {
    o.location.path = _.strRemoveEnd( o.location.path,colNumber[ 0 ] );
    colNumber = colNumber[ 1 ];
    lineNumber = postfix.exec( o.location.path );
    if( lineNumber )
    {
      o.location.path = _.strRemoveEnd( o.location.path,lineNumber[ 0 ] );
      lineNumber = lineNumber[ 1 ];
    }
    else
    {
      lineNumber = colNumber;
      colNumber = undefined;
    }
  }

  lineNumber = parseInt( lineNumber );
  colNumber = parseInt( colNumber );

  if( !isNaN( lineNumber ) )
  o.location.line = lineNumber;

  if( !isNaN( colNumber ) )
  o.location.col = colNumber;

  return end();
}

diagnosticLocation.defaults =
{
  level : 0,
  stack : null,
  error : null,
  location : null,
}

//

function diagnosticCode( o )
{

  _.routineOptions( diagnosticCode,o );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  if( !o.location )
  {
    if( o.error )
    o.location = _.diagnosticLocation({ error : o.error, level : o.level });
    else
    o.location = _.diagnosticLocation({ stack : o.stack, level : o.stack ? o.level : o.level+1 });
  }

  if( !o.location.path || o.location.line === undefined )
  return;

  if( !_.fileProvider )
  return;

  var code = _.fileProvider.fileRead
  ({
    filePath : o.location.path,
    sync : 1,
    throwing : 0,
  })

  if( !code )
  return;

  var result = _.strLinesSelect
  ({
    src : code,
    line : o.location.line,
    numberOfLines : o.numberOfLines,
    selectMode : o.selectMode,
    zero : 1,
    number : 1,
  });

  return result;
}

diagnosticCode.defaults =
{
  level : 0,
  numberOfLines : 3,
  selectMode : 'center',
  stack : null,
  error : null,
  location : null,
}

//

/**
 * Return stack trace as string.
 * @example
  var stack;
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
 * @method stack
 * @memberof wTools
 */

function diagnosticStack( stack,first,last )
{

  if( last-first === 1 )
  debugger;

  if( _.numberIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined )
  {

    var first = arguments[ 0 ] ? arguments[ 0 ] + 1 : 1;
    var last = arguments[ 1 ] >= 0 ? arguments[ 1 ] + 1 : arguments[ 1 ];

    return diagnosticStack( new Error(),first,last );
  }

  if( arguments.length !== 1 && arguments.length !== 2 && arguments.length !== 3 )
  {
    debugger;
    throw Error( 'diagnosticStack : expects one, two or three arguments if error provided' );
  }

  if( !_.numberIs( first ) && first !== undefined )
  {
    debugger;
    throw Error( 'diagnosticStack : expects number ( first ), got ' + _.strTypeOf( first ) );
  }

  if( !_.numberIs( last ) && last !== undefined )
  {
    debugger;
    throw Error( 'diagnosticStack : expects number ( last ), got' + _.strTypeOf( last ) );
  }

  var errIs = 0;
  if( _.errIs( stack ) )
  {
    stack = stack.stack;
    errIs = 1;
  }

  if( !stack )
  return '';

  if( !_.arrayIs( stack ) )
  stack = stack.split( '\n' );

  /* remove redundant lines */

  if( !errIs )
  debugger;

  if( errIs )
  {
    // debugger;
    while( stack.length )
    {
      var splice = 0;
      // if( stack[ 0 ].indexOf( '@' ) !== -1 )
      // debugger;
      // if( stack[ 0 ].indexOf( '@' ) !== -1 )
      // return '';
      splice |= ( stack[ 0 ].indexOf( 'at ' ) === -1 && stack[ 0 ].indexOf( '@' ) === -1 );
      splice |= stack[ 0 ].indexOf( '(vm.js:' ) !== -1;
      splice |= stack[ 0 ].indexOf( '(module.js:' ) !== -1;
      splice |= stack[ 0 ].indexOf( '(internal/module.js:' ) !== -1;
      if( splice )
      stack.splice( 0,1 );
      else break;
    }
    // debugger;
  }

  // if( stack[ 0 ].indexOf( '@' ) === -1 )
  // stack[ 0 ] = _.strCutOffLeft( stack[ 0 ],'@' )[ 1 ];

  if( !stack[ 0 ] )
  return '{ stack is empty }';

  // debugger;
  if( stack[ 0 ].indexOf( 'at ' ) === -1 && stack[ 0 ].indexOf( '@' ) === -1 )
  throw Error( 'diagnosticStack : cant parse stack ' + stack );

  /* */

  var first = first === undefined ? 0 : first;
  var last = last === undefined ? stack.length : last;

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

/*
_.diagnosticWatchObject
({
  dst : self,
  names : 'wells',
});
*/

/*
_.diagnosticWatchObject
({
  dst : _global_,
  names : 'logger',
});
*/

//function diagnosticWatchObject( dst,options )
function diagnosticWatchObject( o )
{

  if( arguments.length === 2 )
  {
    o = { dst : arguments[ 0 ], names : arguments[ 1 ] };
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assertMapHasOnly( diagnosticWatchObject.defaults,o );

  debugger;
  if( o.names )
  o.names = _.nameFielded( o.names );

  Object.observe( o.dst,function( changes )
  {
    for( var c in changes )
    {
      var change = changes[ c ];
      if( o.names )
      if( !o.names[ change.name ] ) return;
      console.log( change.type,change.name,change.object[ change.name ] );
      //if( !change.object[ change.name ] )
      //console.log( change.name,change.object[ change.name ] );
    }
    //debugger;
  });

}

diagnosticWatchObject.defaults =
{
  dst : null,
  names : null,
}

//

/*

_.diagnosticWatchFields
({
  dst : _global_,
  names : 'Uniforms',
});

_.diagnosticWatchFields
({
  dst : state,
  names : 'filterColor',
});

_.diagnosticWatchFields
({
  dst : _global_,
  names : 'Config',
});

_.diagnosticWatchFields
({
  dst : _global_,
  names : 'logger',
});

*/

function diagnosticWatchFields( o )
{
  var o = o || Object.create( null );

  if( o.names )
  o.names = _.nameFielded( o.names );
  else
  o.names = o.dst;

  _assert( arguments.length === 1 );
  _.assertMapHasOnly( o,diagnosticWatchFields.defaults );
  _.mapComplement( o,diagnosticWatchFields.defaults );
  _assert( o.dst );
  _assert( o.names );

  for( var f in o.names ) ( function()
  {

    var fieldName = f;
    var fieldSymbol = Symbol.for( f );
    //o.dst[ fieldSymbol ] = o.dst[ f ];
    var val = o.dst[ f ];

    /* */

    function read()
    {
      //var result = o.dst[ fieldSymbol ];
      var result = val;
      if( o.printValue )
      console.log( 'reading ' + fieldName + ' ' + _.toStr( result ) );
      else
      console.log( 'reading ' + fieldName );
      return result;
    }

    /* */

    function write( src )
    {
      debugger;
      if( o.printValue )
      console.log( 'writing ' + fieldName + ' ' + _.toStr( src ) );
      else
      console.log( 'writing ' + fieldName );
      debugger;
      //o.dst[ fieldSymbol ] = src;
      val = src;
    }

    /* */

    debugger;
    Object.defineProperty( o.dst, fieldName,
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
  printValue : true,
  names : null,
  dst : null,
}

//

function diagnosticBeep()
{
  console.log( '\x07' );
}

//

/**
 * Checks condition passed by argument( condition ). Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If condition is true method returns without exceptions, otherwise method generates and throws exception. By default generates error with message 'Assertion failed'.
 * Also generates error using message(s) or existing error object(s) passed after first argument.
 *
 * @param {*} condition - condition to check.
 * @param {String|Error} [ msgs ] - error messages for generated exception.
 *
 * @example
 * var x = 1;
 * wTools.assert( wTools.strIs( x ), 'incorrect variable type->', typeof x, 'expects string' );
 *
 * // caught eval (<anonymous>:2:8)
 * // incorrect variable type-> number expects string
 * // Error
 * //   at _err (file:///.../wTools/staging/wTools.s:3707)
 * //   at assert (file://.../wTools/staging/wTools.s:4041)
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
 * //   at _err (file:///.../wTools/staging/wTools.s:3707)
 * //   at assert (file://.../wTools/staging/wTools.s:4035)
 * //   at add (<anonymous>:3:14)
 * //   at <anonymous>:6
 *
 * @example
 *   function divide ( x, y )
 *   {
 *      wTools.assert( y != 0, 'divide by zero' );
 *      return x / y;
 *   }
 *   divide (3, 0);
 *
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/wTools.s:1418:13)
 * //   at wTools.errLog (file://.../wTools/staging/wTools.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 * @throws {Error} If passed condition( condition ) fails.
 * @method assert
 * @memberof wTools
 */

function assert( condition )
{

  /*return;*/

  if( DEBUG === false )
  return;

  if( !condition )
  {
    debugger;
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion failed' ],
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
      args : _arraySlice( arguments,1 ),
      level : 2,
    });
  }

  return;
}

//

function assertNoDebugger( condition )
{

  /*return;*/

  if( DEBUG === false )
  return;

  if( !condition )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion failed' ],
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
      args : _arraySlice( arguments,1 ),
      level : 2,
    });
  }

  return;
}

//

/**
 * Checks if map passed by argument( src ) not contains undefined properties. Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If method found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after first argument.
 *
 * @param {Object} src - source map.
 * @param {String} [ msgs ] - error message for generated exception.
 *
 * @example
 * var map = { a : '1', b : undefined };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object  should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/wTools.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * var map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, '"map"');
 *
 * // caught <anonymous>:2:8
 * // Object "map" should have no undefines, but has : a
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/wTools.s:4087)
 * // at <anonymous>:2
 *
 * @method assertMapHasNoUndefine
 * @throws {Exception} If no arguments provided.
 * @throws {Exception} If map( src ) contains undefined property.
 * @memberof wTools
 *
 */

function assertMapHasNoUndefine( src )
{

  if( DEBUG === false )
  return;

  _.assert( arguments.length === 1 || arguments.length === 2 )

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );

  for( var s in src )
  if( src[ s ] === undefined )
  {
    debugger;
    throw _err
    ({
      args : [ ( 'Object ' + ( hasMsg ? _.arraySlice( arguments,1,arguments.length ) : '' ) + ' should have no undefines, but has' ) + ' : ' + s ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If method found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument.
 *
 * @param {Object} src - source map.
 * @param {...Object} target - object(s) to compare with.
 * @param {String} [ msgs ] - error message as last argument.
 *
 * @example
 * var a = { a : 1, c : 3 };
 * var b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/wTools.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * var x = { d : 1 };
 * var a = Object.create( x );
 * var b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'message' )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/wTools.s:4188)
 * // at <anonymous>:4
 *
 * @method assertMapHasOnly
 * @throws {Exception} If map( src ) contains unique property.
 * @memberof wTools
 *
 */

function assertMapHasOnly( src )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapBut.apply( this,args ) );

  if( but.length > 0 )
  {
    if( _.strJoin && !hasMsg )
    console.error( 'Consider extending Composes by :\n' + _.strJoin( '  ',but,' : null,' ).join( '\n' ) );
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] + '\n' : '','Object should have no fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

function assertMapHasOnlyWithUndefines( src )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapButWithUndefines.apply( this,args ) );

  if( but.length > 0 )
  {
    if( _.strJoin && !hasMsg )
    console.error( 'Consider extending Composes by :\n' + _.strJoin( '  ',but,' : null,' ).join( '\n' ) );
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If method found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument.
 *
 * @param {Object} src - source map.
 * @param {...Object} target - object(s) to compare with.
 * @param {String} [ msgs ] - error message as last argument.
 *
 * @example
 * var x = { d : 1 };
 * var a = Object.create( x );
 * a.a = 5;
 * var b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b ); //no exception
 *
 * @example
 * var a = { d : 1 };
 * var b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/wTools.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * var a = { x : 0, y : 2 };
 * var b = { c : 0, d : 3};
 * var c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, c, 'error msg' );
 *
 * // caught <anonymous>:4:8
 * // error msg Object should have no own fields : x,y
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/wTools.s:4215)
 * // at <anonymous>:4
 *
 * @method assertMapOwnOnly
 * @throws {Exception} If map( src ) contains unique property.
 * @memberof wTools
 *
 */

function assertMapOwnOnly( src )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapOwnBut.apply( this,args ) );

  if( but.length > 0 )
  {
    if( _.strJoin && !hasMsg )
    console.error( 'Consider extending Composes by :\n' + _.strJoin( '  ',but,' : null,' ).join( '\n' ) );
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no own fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If method did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument( msg ).
 *
 * @param {Object} src - source map.
 * @param {Object} all - object to compare with.
 * @param {String} [ msgs ] - error message.
 *
 * @example
 * var x = { a : 1 };
 * var a = Object.create( x );
 * var b = { a : 2 };
 * wTools.assertMapHasAll( a, b );// no exception
 *
 * @example
 * var a = { d : 1 };
 * var b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/wTools.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * var a = { x : 0, y : 2 };
 * var b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/wTools.s:4242)
 * // at <anonymous>:3
 *
 * @method assertMapHasAll
 * @throws {Exception} If map( src ) not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function assertMapHasAll( src,all,msg )
{

  if( DEBUG === false )
  return;

  _assert( arguments.length === 2 || arguments.length === 3 );
  _assert( arguments.length === 2 || _.strIs( msg ) );

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var but = Object.keys( _.mapBut( all,src ) );

  if( but.length > 0 )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If method did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument( msg ).
 *
 * @param {Object} src - source map.
 * @param {Object} all - object to compare with.
 * @param {String} [ msgs ] - error message.
 *
 * @example
 * var a = { a : 1 };
 * var b = { a : 2 };
 * wTools.assertMapOwnAll( a, b );// no exception
 *
 * @example
 * var a = { a : 1 };
 * var b = { a : 2, b : 2 }
 * wTools.assertMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have own fields : b
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/wTools.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * var a = { x : 0 };
 * var b = { x : 1, y : 0};
 * wTools.assertMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : y
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/wTools.s:4269)
 * // at <anonymous>:3
 *
 * @method assertMapOwnAll
 * @throws {Exception} If map( src ) not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function assertMapOwnAll( src,all,msg )
{

  if( DEBUG === false )
  return;

  _assert( arguments.length === 2 || arguments.length === 3 );
  _assert( arguments.length === 2 || _.strIs( msg ) );

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var but = Object.keys( _.mapOwnBut( all,src ) );

  if( but.length > 0 )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have own fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

function assertInstanceOrClass( _Self,_this )
{

  _.assert( arguments.length === 2 );
  _.assert
  (
    _this === _Self ||
    _this instanceof _Self ||
    Object.isPrototypeOf.call( _Self,_this ) ||
    Object.isPrototypeOf.call( _Self,_this.prototype )
  );

}

//

function assertNotTested( src )
{

  debugger;
  _.assert( false,'not tested : ' + stack( 1 ) );

}

//

/**
 * Checks if map passed by argument( src ) has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in DEBUG mode. Uses StackTrace level 2.@see wTools.err
 * If method found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument( msg ).
 *
 * @param {Object} src - source map.
 * @param {...Object} target - object(s) to compare with.
 * @param {String} [ msg ] - error message as last argument.
 *
 * @example
 * var a = { a : 1 };
 * var b = { b : 2 };
 * wTools.assertMapHasNone( a, b );// no exception
 *
 * @example
 * var x = { a : 1 };
 * var a = Object.create( x );
 * var b = { a : 2, b : 2 }
 * wTools.assertMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/wTools.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * var a = { x : 0, y : 1 };
 * var b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, 'error msg' );
 *
 * // caught <anonymous>:3:9
 * // error msg Object should have no fields : x,y
 * //
 * // at _err (file:///.../wTools/staging/wTools.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/wTools.s:4518)
 * // at <anonymous>:3
 *
 * @method assertMapHasNone
 * @throws {Exception} If map( src ) contains some properties from other map(s).
 * @memberof wTools
 *
 */

function assertMapHasNone( src )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var none = _.mapScreens.apply( this,args );

  for( var n in none )
  {
    for( var a = 1 ; a < arguments.length ; a++ )
    if( arguments[ a ][ n ] !== src[ n ] )
    break;
    if( a === arguments.length )
    delete none[ n ];
  }
  var keys = Object.keys( none );
  if( keys.length )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no fields :', keys.join( ',' ) ],
      level : 2,
    });
  }

}

//

function assertMapOwnNone( src,none )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  if( hasMsg ) l -= 1;

  if( l > 2 )
  {
    var args =_ArraySlice.call( arguments,1,l ); debugger;
    none = _.mapCopy.apply( this,args );
  }

  var has = Object.keys( _._mapScreen
  ({
    filter : _.filter.srcOwn(),
    screenObjects : none,
    srcObjects : src,
  }));

  if( has.length )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no own fields :',has.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * If condition failed, method prints warning messages passed after condition argument
 * @example
  function checkAngles( a, b, c )
  {
     wTools.assertWarn( (a + b + c) === 180, 'triangle with that angles does not exists' );
  };
  checkAngles( 120, 23, 130 );

 // triangle with that angles does not exists
 * @param condition Condition to check.
 * @param messages messages to print.
 * @method assertWarn
 * @memberof wTools
 */

function assertWarn( condition )
{

  if( DEBUG )
  return;

  if( !condition )
  {
    console.warn.apply( console,[].slice.call( arguments,1 ) );
  }

}

// --
// type test
// --

/**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * // returns true
 * var obj = {x : 100};
 * objectIs(obj);
 * @example
 * // returns false
 * objectIs(10);
 *
 * @param {*} src.
 * @return {Boolean}.
 * @method objectIs
 * @memberof wTools
 */

function objectIs( src )
{
  return _ObjectToString.call( src ) === '[object Object]';
}

//

function objectLike( src )
{
  if( objectIs( src ) ) return true;
  if( routineIs( src ) ) return true;
  if( atomicIs( src ) ) return false;

  if( Object.getOwnPropertyNames( src ).length )
  return true;

  // for( var s in src )
  // return true;

  return false;
}

//

/**
 * The mapIs() method determines whether the passed value is an Object,
 * and not inherits through the prototype chain.
 *
 * If the (src) is an Object, true is returned,
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
 * @returns { Boolean } Returns true if (src) is an Object, and not inherits through the prototype chain.
 * @method mapIs
 * @memberof wTools
 */

function mapIs( src )
{

  if( !_.objectIs( src ) )
  return false;

  _.assert( Object.getPrototypeOf( src ) === null || Object.getPrototypeOf( src ),'unexpected' );

  if( Object.getPrototypeOf( src ) === null )
  return true;

  if( Object.getPrototypeOf( src ).constructor.name !== 'Object' )
  return false;

  if( Object.getPrototypeOf( Object.getPrototypeOf( src ) ) === null )
  return true;

  return false;
}

  //

/**
 * The arrayIs() method determines whether the passed value is an Array.
 *
 * If the (src) is an Array, true is returned,
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
 * @returns { boolean } Returns true if (src) is an Array.
 * @method arrayIs
 * @memberof wTools
 */

function arrayIs( src )
{
  return _ObjectToString.call( src ) === '[object Array]';
}

//

  /**
   * The arrayLike() method determines whether the passed value is an array-like or an Array.
   * Imortant : arrayLike returns false for Object, even if the object has length field.
   *
   * If (src) is an array-like or an Array, true is returned,
   * otherwise false is.
   *
   * @param { * } src - The object to be checked.
   *
   * @example
   * // returns true
   * arrayLike( [ 1, 2 ] );
   *
   * @example
   * // returns false
   * arrayLike( 10 );
   *
   * @example
   * // returns true
   * var isArr = ( function() {
   *   return _.arrayLike( arguments );
   * } )('Hello there!');
   *
   * @returns { boolean } Returns true if (src) is an array-like or an Array.
   * @method arrayLike.
   * @memberof wTools
   */

function arrayLike( src )
{
  if( atomicIs( src ) ) return false;

  if( _.routineIs( src ) ) return false;
  if( _.objectIs( src ) ) return false;
  if( _.strIs( src ) ) return false;

  if( !_.numberIs( src.length ) ) return false;

  return true;
}

//

/**
 * The hasLength() method determines whether the passed value has the property (length).
 *
 * If (src) is equal to the (undefined) or (null) false is returned.
 * If (src) has the property (length) true is returned.
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
 * var isLength = ( function() {
 *   return _.hasLength( arguments );
 * } )('Hello there!');
 *
 * @example
 * // returns false
 * hasLength( 10 );
 *
 * @example
 * // returns false
 * hasLength( { } );
 *
 * @returns { boolean } Returns true if (src) has the property (length).
 * @method hasLength
 * @memberof wTools
 */

function hasLength( src )
{
  if( src === undefined || src === null ) return false;
  if( _.numberIs( src.length ) ) return true;
  return false;
}

//

/**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * //returns true
 * strIsIs('song');
 * @example
 * // returns false
 * strIs(5);
 *
 * @param {*} src.
 * @return {Boolean}.
 * @method strIs.
 * @memberof wTools
 */

function strIs( src )
{
  var result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

function strIsNotEmpty( src )
{
  if( !src )
  return false;
  var result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

function symbolIs( src )
{
  var result = _ObjectToString.call( src ) === '[object Symbol]';
  return result;
}

//

/**
 * Function numberIs checks incoming param whether it is number.
 * Returns "true" if incoming param is object. Othervise "false" returned.
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
 * @method numberIs.
 * @memberof wTools
 */

function numberIs( src )
{
  return _ObjectToString.call( src ) === '[object Number]';
}

//

function numberIsNotNan( src )
{
  return _.numberIs( src ) && !isNaN( src );
}

//

function numberIsRegular( src )
{
  return _.numberIs( src ) && !isNaN( src ) && src !== +Infinity && src !== -Infinity;
}

//

function numberIsFinite( src )
{

  if( !_.numberIs( src ) )
  return false;

  return isFinite( src );
}

//

function numberIsInt( src )
{

  if( !_.numberIs( src ) )
  return false;

  return Math.floor( src ) === src;
}

//

function numbersAreFinite( src )
{

  if( _.arrayLike( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
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

  if( _.arrayLike( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
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

  if( _.arrayLike( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
    if( !numbersAreInt( src[ s ] ) )
    return false;
    return true;
  }

  if( !_.numberIs( src ) )
  return false;

  return Math.floor( src ) === src;
}

//

function boolIs( src )
{
  return _ObjectToString.call( src ) === '[object Boolean]';
}

//

function boolLike( src )
{
  var type = _ObjectToString.call( src );
  return type === '[object Boolean]' || type === '[object Number]';
}

//

function dateIs( src )
{
  return _ObjectToString.call( src ) === '[object Date]';
}

//

function bufferIs( src )
{
  var type = _ObjectToString.call( src );

  if( !/\wArray/.test( type ) )
  return false;

  if( typeof Buffer !== 'undefined' )
  if( src instanceof Buffer )
  return false;

  return true;
}

//

function bufferViewIs( src )
{
  var type = _ObjectToString.call( src );
  var result = type === '[object DataView]';
  return result;
}

//

function bufferRawIs( src )
{
  var type = _ObjectToString.call( src );
  var result = type === '[object ArrayBuffer]';
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
  return bufferIs( src ) || bufferViewIs( src )  || bufferRawIs( src ) || bufferNodeIs( src );
}

//

function argumentsIs( src )
{
  return _ObjectToString.call( src ) === '[object Arguments]';
}

//

function rowIs( src )
{
  if( src && src._rowArray )
  return true;
  else return false;
}

//

function boolIs( src )
{
  return _ObjectToString.call( src ) === '[object Boolean]';
}

//

function routineIs( src )
{
  return _ObjectToString.call( src ) === '[object Function]';
}

//

function routineWithNameIs( src )
{
  if( _ObjectToString.call( src ) !== '[object Function]' )
  return false;
  if( !src.name )
  return false;
  return true;
}

//

function regexpIs( src )
{
  return _ObjectToString.call( src ) === '[object RegExp]';
}

//

function regexpObjectIs( src )
{
  if( !_.RegexpObject )
  return false;
  return src instanceof _.RegexpObject;
}

//

function definedIs( src )
{
  return src !== undefined && src !== null && src !== NaN;
}

//

function eventIs( src )
{
  if( src instanceof Event )
  return true;
  if( typeof jQuery === 'undefined' )
  return false;
  if( src instanceof jQuery.Event )
  return true;
  return false;
}

//

function htmlIs( src )
{
  return _ObjectToString.call( src ).indexOf( '[object HTML' ) !== -1;
}

//

function jqueryIs( src )
{
  if( typeof jQuery === 'undefined' )
  return;
  return src instanceof jQuery;
}

//

function canvasIs( src )
{
  if( _.jqueryIs( src ) )
  src = src[ 0 ];
  if( !domIs( src ) )
  return false;
  return src.tagName === 'CANVAS';
}

//

function domIs( src )
{
  if( !_global_.Node )
  return false;
  return src instanceof Node;
}

//

function domLike( src )
{
  if( !_global_.Node )
  return false;
  if( src instanceof Node )
  return true;
  return jqueryIs( src );
}

//

function domableIs( src )
{
  return strIs( src ) || domIs( src ) || jqueryIs( src );
}

//

function consequenceIs( src )
{
  return src instanceof wConsequence;
}

//

function atomicIs( src )
{
  if( src === null || src === undefined )
  return true;
  var t = _ObjectToString.call( src );
  return t === '[object Symbol]' || t === '[object Number]' || t === '[object Boolean]' || t === '[object String]';
}

//

function typeOf( src )
{
  if( src === null || src === undefined )
  return null
  else if( numberIs( src ) || boolIs( src ) || strIs( src ) )
  return src.constructor;
  else
  {
    _assert( _.routineIs( src.constructor ) && src instanceof src.constructor );
    return src.constructor;
  }
}

//

function typeIsBuffer( src )
{
  if( !src ) return false;
  if( !_.numberIs( src.BYTES_PER_ELEMENT ) ) return false;
  if( !_.strIs( src.name ) ) return false;
  return src.name.indexOf( 'Array' ) !== -1;

/*
  var types = [ _global_.Int8Array, _global_.Uint8Array, _global_.Uint8ClampedArray, _global_.Int16Array, _global_.Uint16Array, _global_.Int32Array, _global_.Uint32Array, _global_.Float32Array, _global_.Float64Array ];
  for( var t = 0 ; t < types.length ; t++ )
  {
    var type = types[ t ];
    if( !type ) continue;
    if( src === type ) return true;
  }
  return false;
*/

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

// --
// bool
// --

function boolFrom( src )
{
  if( strIs( src ) )
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
// str
// --

/*
function toStrFast( src ) {

  var result = '';
  if( arrayIs( src ) )
  {
    if( src.length > 0 ) result = toStr( src[0] );
    for( var i = 1 ; i < src.length ; i++ )
    result += ', ' + toStr( src[i] );
  }
  else if( src instanceof THREE.Vector2 )
  {
    result = '( ' + toStr( src.x ) + ', ' + toStr( src.y ) + ' )';
  }
  else if( src instanceof THREE.Vector3 )
  {
    result = '( ' + toStr( src.x ) + ', ' + toStr( src.y ) + ', ' + toStr( src.z ) + ' )';
  }
  else if( src instanceof THREE.Vector4 )
  {
    result = '( ' + toStr( src.x ) + ', ' + toStr( src.y ) + ', ' + toStr( src.z ) + ', ' + toStr( src.w ) + ' )';
  }
  else if( src instanceof THREE.Matrix4 )
  {
    for( var i = 0 ; i < 4*4 ; i+=4 )
    result += '\n( ' + toStr( src.elements[i+0] ) + ', ' + toStr( src.elements[i+1] ) + ', ' + toStr( src.elements[i+2] ) + ', ' + toStr( src.elements[i+3] ) + ' )';
  }
  else
  {
    result = src;
  }
  return result;

}
*/

// --
// number
// --

function numberFrom( src )
{
  if( strIs( src ) )
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

  if( _.arrayLike( src ) )
  {
    var result = [];
    for( var s = 0 ; s < src.length ; s++ )
    result[ s ] = _.numberFrom( src[ s ] );
  }
  else if( _.objectIs( src ) )
  {
    var result = Object.create( null );
    for( var s in src )
    result[ s ] = _.numberFrom( src[ s ] );
  }

  return result;
}

//

function numberRandomInRange( range )
{

  _assert( arguments.length === 1 && _.arrayIs( range ),'numberRandomInRange :','expects range( array ) as argument' );
  _assert( range.length === 2 );

  return _random()*( range[ 1 ] - range[ 0 ] ) + range[ 0 ];

}

//

function numberRandomInt( range )
{

  _assert( _.arrayIs( range ) || _.numberIs( range ) );
  _assert( range.length === 2 );

  if( _.numberIs( range ) )
  range = range >= 0 ? [ 0,range ] : [ range,0 ];
  else if( _.arrayIs( range ) )
  range = range;
  else throw _.err( 'numberRandomInt','unexpected argument' );

  var result = Math.floor( range[ 0 ] + Math.random()*( range[ 1 ] - range[ 0 ] ) );

  return result;
}

//

function numberRandomIntBut( range )
{
  var result;
  var attempts = 10;

  if( _.numberIs( range ) )
  range = [ 0,range ];
  else if( _.arrayIs( range ) )
  range = range;
  else throw _.err( 'numberRandomInt','unexpected argument' );

  for( var attempt = 0 ; attempt < attempts ; attempt++ )
  {
    /*result = _.numberRandomInt( range ); */
    var result = Math.floor( range[ 0 ] + Math.random()*( range[ 1 ] - range[ 0 ] ) );

    var bad = false;
    for( var a = 1 ; a < arguments.length ; a++ )
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
    if( bad ) continue;
    return result;
  }

  console.warn( 'numberRandomIntBut :','NaN' );
  throw _.err( 'numberRandomIntBut :','NaN' );

  result = NaN;
  return result;
}

// --
// str
// --

/**
  * Return type of src.
  * @example
      var str = _.strTypeOf( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @method strTypeOf
  * @memberof wTools
  */

function strTypeOf( src )
{

  _.assert( arguments.length === 1 );

  if( !_.atomicIs( src ) )
  if( src.constructor && src.constructor.name )
  return src.constructor.name;

  var result = _.strPrimitiveTypeOf( src );

  if( result === 'Object' )
  {
    if( Object.getPrototypeOf( src ) === null )
    result = 'Map:Pure';
    else if( src.__proto__ !== Object.__proto__ )
    result = 'Object:Fake';
  }

  return result;
}

//

/**
  * Return primitive type of src.
  * @example
      var str = _.strPrimitiveTypeOf('testing');
  * @param {*} src
  * @return {string}
  * string name of type src
  * @method strPrimitiveTypeOf
  * @memberof wTools
  */

function strPrimitiveTypeOf( src )
{

  var name = _ObjectToString.call( src );
  var result = /\[(\w+) (\w+)\]/.exec( name );

  if( !result )
  throw _.err( 'strTypeOf :','unknown type',name );
  return result[ 2 ];
}

//

/**
  * Return in one string value of all arguments.
  * @example
   var args = _.str('test2');
  * @return {string}
  * If no arguments return empty string
  * @method str
  * @memberof wTools
  */

function str()
{
  var result = '';
  var line;

  if( !arguments.length )
  return result;

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( _.str )
    line = _.toStr( src,{ stringWrapper : '' } );
    else if( src && src.toStr )
    line = src.toStr();
    else
    line = String( src );

    result += line + ' ';
  }

  return result;
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
  * @method strBeginOf
  * @memberof wTools
  */

function strBeginOf( src,end )
{

  _.assert( _.strIs( src ),'expects string ( src )' );
  _.assert( _.strIs( end ),'expects string ( end )' );
  _.assert( arguments.length === 2 );

  var i = src.indexOf( end,src.length - end.length );
  var result = i >= 0 ? src.substr( 0,i ) : undefined;

  if( i === -1 )
  debugger;

  return result;
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
  * @method strEndOf
  * @memberof wTools
  */

function strEndOf( src,begin )
{

  _.assert( _.strIs( src ),'expects string ( src )' );
  _.assert( _.strIs( begin ),'expects string ( begin )' );
  _.assert( arguments.length === 2 );

  var i = src.lastIndexOf( begin,0 );
  var result = i >= 0 ? src.substr( i+begin.length ) : undefined;

  // if( i >= 0 )
  // debugger;
  // else
  // debugger;

  return result;
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
  * _.strInbetweenOf( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strInbetweenOf( 'aaabccc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strInbetweenOf( 'aaabccc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strInbetweenOf( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strInbetweenOf( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strInbetweenOf( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @method strInbetweenOf
  * @memberof wTools
  */

function strInbetweenOf( src,begin,end )
{

  _.assert( _.strIs( src ),'expects string ( src )' );
  _.assert( _.strIs( begin ),'expects string ( begin )' );
  _.assert( _.strIs( end ),'expects string ( end )' );
  _.assert( arguments.length === 3 );

  var f = src.indexOf( begin );
  if( f === -1 )
  return;

  var l = src.lastIndexOf( end );
  if( l === -1 || l <= f )
  return;

  var result = src.substring( f+1,l );

  return result;
}

//

/**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } begin - String to find at begin of source.
  *
  * @example
  * var scr = _.strBegins( "abc","a" );
  * // returns true
  *
  * @example
  * var scr = _.strBegins( "abc","b" );
  * // returns false
  *
  * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
  * @method strBegins
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */

function strBegins( src,begin )
{

  _.assert( _.strIs( src ),'expects string' );
  _.assert( _.strIs( begin ),'expects string' );
  _.assert( arguments.length === 2 );

  return src.lastIndexOf( begin,0 ) === 0;
}

//

/**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } end - String to find at end of source.
  *
  * @example
  * var scr = _.strEnds( "abc","c" );
  * // returns true
  *
  * @example
  * var scr = _.strEnds( "abc","b" );
  * // returns false
  *
  * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
  * @method strEnds
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */

function strEnds( src,end )
{

  _.assert( _.strIs( src ),'expects string' );
  _.assert( _.strIs( end ),'expects string' );
  _.assert( arguments.length === 2 );

  return src.indexOf( end,src.length - end.length ) !== -1;
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
 * _.strRemoveBegin( 'example','exa' );
 *
 * @example
 * //returns example
 * _.strRemoveBegin( 'example','abc' );
 *
 * @method strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveBegin( src,begin )
{
  if( !strBegins( src,begin ) )
  return src;
  return src.substr( begin.length,src.length );
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
 * _.strRemoveEnd( 'example','le' );
 *
 * @example
 * //returns example
 * _.strRemoveEnd( 'example','abc' );
 *
 * @method strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveEnd( src,end )
{
  if( !strEnds( src,end ) )
  return src;
  return src.substring( 0,src.length-end.length );
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
  * @method strPrependOnce
  * @memberof wTools
  */

function strPrependOnce( src,begin )
{
  if( src.lastIndexOf( begin,0 ) === 0 )
  return src;
  else
  return begin + src;
}

//

/**
  * Appends string( begin ) to the source( src ) if postfix( end ) is not match with last chars of string( src ),
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
  * @method strAppendOnce
  * @memberof wTools
  */

function strAppendOnce( src,end )
{
  if( src.indexOf( end,src.length - end.length ) !== -1 )
  return src;
  else
  return src + end;
}

// --
// regexp
// --

/*
var regexpModeNames = namesCoded
({
  includeAny : 'includeAny',
  includeAll : 'includeAll',
  excludeAny : 'excludeAny',
  excludeAll : 'excludeAll',
});

var regexpModeNamesToExtend = namesCoded
({
  includeAll : 'includeAll',
  excludeAny : 'excludeAny',
});

var regexpModeNamesToReplace = namesCoded
({
  includeAny : 'includeAny',
  excludeAll : 'excludeAll',
});
*/

//

function regexpIdentical( src1,src2 )
{
  _.assert( arguments.length === 2 );

  if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  return false;

  return src1.source === src2.source && src1.flags === src2.flags;
}

//

/**
 * Escapes special characters with a slash (\). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * wTools.regexpEscape('Hello. How are you?'); // "Hello\. How are you\?"
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @method regexpEscape
 * @memberof wTools
 */

function regexpEscape( src )
{
  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );
  if( _.arrayIs( src ) )
  {
    var result = [];
    for( var s = 0 ; s < src.length ; s++ )
    {
      _.assert( _.strIs( src[ s ] ) )
      result[ s ] = regexpEscape( src[ s ] );
    }
    return result;
  }
  return src.replace( /([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1" );
}

//

/**
 * Turn a *-wildcard style glob into a regular expression
 * @example
 * var glob = '* /www/*.js';
 * wTools.regexpForGlob(glob);
 * // /^.\/[^\/]*\/www\/[^\/]*\.js$/m
 * @param {String} glob *-wildcard style glob
 * @returns {RegExp} RegExp that represent passed glob
 * @throw {Error} If missed argument, or got more than one argumet
 * @throw {Error} If glob is not string
 * @method regexpForGlob
 * @memberof wTools
 */

function regexpForGlob( glob )
{
  var result = '';
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( glob ) );

  var w = 0;
  glob.replace( /(\*\*[\/\\]?)|\?|\*/g, function( matched,a,offset,str )
  {

    result += regexpEscape( glob.substr( w,offset-w ) );
    w = offset + matched.length;

    if( matched === '?' )
    result += '.';
    else if( matched === '*' )
    result += '[^\\\/]*';
    else if( matched.substr( 0,2 ) === '**' )
    result += '.*';
    else _.assert( 0,'unexpected' );

  });

  result += regexpEscape( glob.substr( w,glob.length-w ) );
  if( result[ 0 ] !== '^' )
  {
    result = _.strPrependOnce( result,'./' );
    result = _.strPrependOnce( result,'^' );
  }
  result = _.strAppendOnce( result,'$' );

  return RegExp( result,'m' );
}

//

/**
 * Make regexp from string.
 *
 * @example
 * wTools.regexpMakeExpression('Hello. How are you?'); // /Hello\. How are you\?/
 * @param {String} src - string or regexp
 * @returns {String} Regexp
 * @throws {Error} Throw error with message 'unknown type of expression, expects regexp or string, but got' error
 if src not string or regexp
 * @method regexpMakeExpression
 * @memberof wTools
 */

function regexpMakeExpression( src,flags )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.regexpIs( src ) )
  return src;

  _.assert( flags === undefined || _.strIs( flags ) );

  if( _.strIs( src ) )
  return new RegExp( _.regexpEscape( src ),flags );

  debugger;
  throw _.err( 'regexpMakeExpression :','unknown type of expression, expects regexp or string, but got',_.strTypeOf( src ) );
}

//

  /**
   *  Generates "but" regular expression pattern. Accepts a list of words, which will be used in regexp.
   *  The result regexp matches the strings that do not contain any of those words.
   *
   * @example
   * wTools.regexpBut_('yellow', 'red', 'green'); //   /^(? :(?!yellow|red|green).)+$/
   *
   * var options = {
   *    but : ['yellow', 'red', 'green'],
   *    atLeastOnce : false
   * };
   * wTools.regexpBut_(options); // /^(? :(?!yellow|red|green).)*$/
   *
   * @param {Object} [options] options for generate regexp. If this argument omitted then default options will be used
   * @param {String[]} [options.but=null] a list of words,from each will consist regexp
   * @param {boolean} [options.atLeastOne=true] indicates whether search matches at least once
   * @param {...String} [words] a list of words, from each will consist regexp. This arguments can be used instead
   * options object.
   * @returns {RegExp} Result regexp
   * @throws {Error} If passed arguments are not strings or options object.
   * @throws {Error} If options contains any different from 'but' or 'atLeastOnce' properties.
   * @method regexpBut_
   * @memberof wTools
   */

function regexpBut_( options )
{
  var args = arguments;
  var atLeastOnce = regexpBut_.defaults.atLeastOnce;
  if( arguments.length === 1 && _.objectIs( options ) )
  {
    _.assertMapHasOnly( options,regexpBut_.defaults );
    _.mapComplement( options,regexpBut_.defaults );
    args = options.but;
    atLeastOnce = options.atLeastOnce;
  }

  var words = _.arrayFlatten( args );
  var result = '^(?:(?!';

  // !!! test me in builder
  // var result = '^(? :(?!';

  for( var w = 0 ; w < words.length ; w++ )
  _.assert( _.strIs( words[ w ] ) );

  result += words.join( '|' );

  if( atLeastOnce )
  result += ').)+$';
  else
  result += ').)*$';

  /* console.log( 'regexpBut_.result : ' + result ) */

  return new RegExp( result );
}

regexpBut_.defaults =
{
  but : null,
  atLeastOnce : true,
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
 * @method regexpArrayMake
 * @memberof wTools
 */

function regexpArrayMake( src )
{

  _.assert( _.arrayIs( src ) || _.regexpIs( src ) || _.strIs( src ),'expects array/regexp/string, got ' + _.strTypeOf( src ) );

  src = _.arrayFlatten( src );

  for( var k = src.length-1 ; k >= 0 ; k-- )
  {
    var e = src[ k ]

    if( e === null )
    {
      src.splice( k,1 );
      continue;
    }

    src[ k ] = _.regexpMakeExpression( e );

  }

  return src;
}

//

  /**
   * regexpArrayIndex() returns the index of the first regular expression that matches substring
    Otherwise, it returns -1.
   * @example
   *
     var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
     var regArr1 = [/white/, /green/, /blue/];
     wTools.regexpArrayIndex(regArr1, str); // 1

   * @param {RegExp[]} arr Array for regular expressions.
   * @param {String} ins String, inside which will be execute search
   * @returns {number} Index of first matching or -1.
   * @throws {Error} If first argument is not array.
   * @throws {Error} If second argument is not string.
   * @throws {Error} If element of array is not RegExp.
   * @method regexpArrayIndex
   * @memberof wTools
   */

function regexpArrayIndex( arr,ins )
{
  _.assert( _.arrayIs( arr ) );
  _.assert( _.strIs( ins ) );

  for( var a = 0 ; a < arr.length ; a++ )
  {
    var regexp = arr[ a ];
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
 * If regexp array is empty - returns some default value passed in the `none` input param
 *
 * @example
 * var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * var regArr2 = [/yellow/, /blue/, /red/];
 * wTools._regexpArrayAny(regArr2, str, false); // 1
 *
 * var regArr3 = [/yellow/, /white/, /greey/]
 * wTools._regexpArrayAny(regArr3, str, false); // false
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @method _regexpArrayAny
 * @memberof wTools
 */

function _regexpArrayAny( arr,ins,none )
{

  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3 );

  var arr = _.arrayAs( arr );
  for( var m = 0 ; m < arr.length ; m++ )
  {
    if( arr[ m ].test( ins ) )
    return m;
  }

  return arr.length ? false : none;
}

//

/**
 * Checks if all regexps passed in `arr` are found in string `ins`
 * If any of regex was not found - returns match index
 * If regexp array is not empty and all regexps passed test - returns true
 * If regexp array is empty - returns some default value passed in the `none` input param
 *
 * @example
 * var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * var regArr1 = [/red/, /green/, /blue/];
 * wTools._regexpArrayAll(regArr1, str, false); // true
 *
 * var regArr2 = [/yellow/, /blue/, /red/];
 * wTools._regexpArrayAll(regArr2, str, false); // 0
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @method _regexpArrayAll
 * @memberof wTools
 */

function _regexpArrayAll( arr,ins,none )
{
  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3 );

  var arr = _.arrayAs( arr );
  for( var m = 0 ; m < arr.length ; m++ )
  {
    if( !arr[ m ].test( ins ) )
    return m;
  }

  return arr.length ? true : none;
}

//

  /**
   * Make RegexpObject from different type sources.
      If passed RegexpObject or map with properties similar to RegexpObject but with string in values, then the second
   parameter is not required;
      All strings in sources will be turned into RegExps.
      If passed single RegExp/String or array of RegExps/Strings, then method will return RegexpObject with
   `defaultMode` as key, and array of RegExps created from first parameter as value.
      If passed array of RegexpObject, mixed with ordinary RegExps/Strings, the result object will be created by merging
   with shrinking (see [shrink]{@link wTools#shrink}) RegexpObjects and RegExps that associates
   with `defaultMode` key.
   *
   * @example
     var src = [
         /hello/,
         'world',
         {
            includeAny : ['yellow', 'blue', 'red'],
            includeAll : [/red/, /green/, /brown/],
            excludeAny : [/yellow/, /white/, /grey/],
            excludeAll : [/red/, /green/, /blue/]
         }
     ];
     wTools.regexpMakeObject(src, 'excludeAll');

     // {
     //    includeAny: [/yellow/, /blue/, /red/],
     //    includeAll: [/red/, /green/, /brown/],
     //    excludeAny: [/yellow/, /white/, /grey/],
     //    excludeAll: [/hello/, /world/]
     // }
   * @param {RegexpObject|String|RegExp|RegexpObject[]|String[]|RegExp[]} src Source for making RegexpObject
   * @param {String} [defaultMode] key for result RegexpObject map. Can be one of next strings: 'includeAny',
   'includeAll','excludeAny' or 'excludeAll'.
   * @returns {RegexpObject} Result RegexpObject
   * @throws {Error} Missing arguments if call without argument
   * @throws {Error} Missing arguments if passed array without `defaultMode`
   * @throws {Error} Unknown mode `defaultMode`
   * @throws {Error} Unknown src if first argument is not array, map, string or regexp.
   * @throws {Error} Unexpected if type of array element is not string regexp or RegexpObject.
   * @throws {Error} Unknown regexp filters if passed map has unexpected properties (see RegexpObject).
   * @method regexpMakeObject
   * @memberof wTools
   */

function regexpMakeObject( src,defaultMode )
{

  return _.RegexpObject( src,defaultMode );

}

// --
// routine
// --

/**
 * Internal implementation.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @method _routineBind
 * @memberof wTools
 */

function _routineBind( o )
{

  _assert( arguments.length === 1 );
  _assert( _.boolIs( o.seal ) );
  _assert( _.routineIs( o.routine ),'_routineBind :','expects routine' );
  _assert( _.arrayIs( o.args ) || _.argumentsIs( o.args ) || o.args === undefined );

  // if( _global_.wConsequence )
  // if( wConsequence.prototype.got === o.routine )
  // debugger;

  var routine = o.routine;
  var args = o.args;
  var context = o.context;

  if( _FunctionBind )
  {

    if( context !== undefined && args === undefined )
    {
      // if( o.seal === true )
      // throw _.err( 'not tested, not clear what convetion was meant. use [] as third argument or rotineJoin' );
      if( o.seal === true )
      {
        return function sealedContext()
        {
          return routine.call( context );
        }
      }
      else
      {
        return _FunctionBind.call( routine, context );
      }
    }
    else if( context !== undefined )
    {
      if( o.seal === true )
      {
        return function sealedContextAndArguments()
        {
          return routine.apply( context, args );
        }
      }
      else
      {
        var a = _.arrayAppendMerging( [ context ],args );
        return _FunctionBind.apply( routine, a );
      }
    }
    else if( args === undefined && !o.seal )
    {
      return routine;
    }
    else
    {
      if( !args )
      args = [];

      if( o.seal === true )
      return function sealedArguments()
      {
        return routine.apply( undefined, args );
      }
      else
      return function joinedArguments()
      {
        var a = args.slice();
        _.arrayAppendMerging( a,arguments );
        return routine.apply( this, a );
      }

    }

  }

  //

  throw _.err( 'not implemented' );

}

//

/**
 * The routineBind() method creates a new function with its 'this' (context) set to the provided `context`
 value. Unlike Function.prototype.bind() method if `context` is undefined`, in new function 'this' context will not be
 sealed. Argumetns `args` of target function which are passed before arguments of binded function during calling of
 target function.
 * Besides the aforementioned difference, routineBind method accepts function as argument, that makes it more useful
    than Function.prototype.bind().
 * @example
    var o = {
        z: 5
    };

    var y = 4;

    function sum(x, y) {
       return x + y + this.z;
    }
    var newSum = wTools.routineBind(sum, o, [3]);
    newSum(y); // 12

   function f1(){ console.log( this ) };
   var f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   var f3 = _.routineBind( f1 ); // new function, 'this' is undefined/global object.
   f3.call( o ) // print  { z: 5 }
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Array<*>} args Arguments to prepend to arguments provided to the bound function when invoking the target
 function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When first argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'expects 3 or less arguments'
 * @method routineBind
 * @memberof wTools
 */

function routineBind( routine, context, args )
{

  _assert( _.routineIs( routine ),'routineBind :','first argument must be a routine' );
  _assert( arguments.length <= 3,'routineBind :','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

/**
 * The routineJoin() method creates a new function with its 'this' (context) set to the provided `context`
 value. Argumetns `args` of target function which are passed before arguments of binded function during
 calling of target function. Unlike routineBind method, position of `context` parameter is more intuitive.
 * @example
   var o = {
        z: 5
    };

   var y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   var newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   function f1(){ console.log( this ) };
   var f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   var f3 = _.routineJoin( undefined,f1 ); // new function.
   f3.call( o ) // print  { z: 5 }

 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @see wTools.routineBind
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'expects 3 or less arguments'
 * @method routineJoin
 * @memberof wTools
 */

function routineJoin( context, routine, args )
{

  _assert( _.routineIs( routine ),'routineJoin :','second argument must be a routine' );
  _assert( arguments.length <= 3,'routineJoin :','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

  /**
   * Return new function with sealed context and arguments.
   *
   * @example
   var o = {
        z: 5
    };

   function sum(x, y) {
       return x + y + this.z;
    }
   var newSum = wTools.routineSeal(o, sum, [3, 4]);
   newSum(y); // 12
   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Array<*>} args Arguments wrapped into array. Will be used as argument to `routine` function
   * @returns {Function} Result function with sealed context and arguments.
   * @method routineJoin
   * @memberof wTools
   */

function routineSeal( context, routine, args )
{

  _assert( _.routineIs( routine ),'routineSeal :','second argument must be a routine' );
  _assert( arguments.length <= 3,'routineSeal :','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : true,
  });

}

//

  /**
   * Return function that will call passed routine function with delay.
   * @param {number} delay delay in milliseconds
   * @param {Function} routine function that will be called with delay.
   * @returns {Function} result function
   * @throws {Error} If arguments less then 2
   * @throws {Error} If `delay` is not a number
   * @throws {Error} If `routine` is not a function
   * @method routineDelayed
   * @memberof wTools
   */

function routineDelayed( delay,routine )
{

  _.assert( arguments.length >= 2 );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( routine ) );

  if( arguments.length > 2 )
  {
    _assert( arguments.length <= 4 );
    routine = _.routineJoin.call( _,arguments[ 1 ],arguments[ 2 ],arguments[ 3 ] );
  }

  return function delayed()
  {
    _.timeOut( delay,this,routine,arguments );
  }

}

//

function routinesJoin()
{
  var result,routines,index;
  var args = _.arraySlice( arguments );

  _.assert( arguments.length >= 1 && arguments.length <= 3  );

  /* */

  function makeResult()
  {

    _.assert( _.objectIs( routines ) || _.arrayIs( routines ) || _.routineIs( routines ) );

    if( _.routineIs( routines ) )
    routines = [ routines ];

    result = _.entityNew( routines );

  }

  /* */

  if( arguments.length === 1 )
  {
    routines = arguments[ 0 ];
    index = 0;
    makeResult();
  }
  else if( arguments.length === 2 )
  {
    routines = arguments[ 1 ];
    index = 1;
    makeResult();
  }
  else if( arguments.length === 3 )
  {
    routines = arguments[ 1 ];
    index = 1;
    makeResult();
  }
  else _.assert( 0,'unexpected' );

  /* */

  if( _.arrayIs( routines ) )
  for( var r = 0 ; r < routines.length ; r++ )
  {
    args[ index ] = routines[ r ];
    result[ r ] = _.routineJoin.apply( this,args );
  }
  else
  for( var r in routines )
  {
    args[ index ] = routines[ r ];
    result[ r ] = _.routineJoin.apply( this,args );
  }

  /* */

  return result;
}

//

/**
 * Call each routines in array with passed context and arguments.
    The context and arguments are same for each called functions.
    Can accept only routines without context and args.
    Can accept single routine instead array.
 * @example
    var x = 2, y = 3,
        o { z : 6 };

    function sum( x, y )
    {
        return x + y + this.z;
    },
    prod = function( x, y )
    {
        return x * y * this.z;
    },
    routines = [ sum, prod ];
    var res = wTools.routinesCall( o, routines, [ x, y ] );
 // [ 11, 36 ]
 * @param {Object} [context] Context in which calls each function.
 * @param {Function[]} routines Array of called function
 * @param {Array<*>} [args] Arguments that will be passed to each functions.
 * @returns {Array<*>} Array with results of functions invocation.
 * @method routinesCall
 * @memberof wTools
 */

function routinesCall()
{
  var result;

  _.assert( arguments.length >= 1 && arguments.length <= 3 );

  /* */

  function makeResult()
  {

    _.assert( _.objectIs( routines ) || _.arrayIs( routines ) || _.routineIs( routines ) );

    if( _.routineIs( routines ) )
    routines = [ routines ];

    result = _.entityNew( routines );

  }

  /* */

  if( arguments.length === 1 )
  {
    var routines = arguments[ 0 ];

    makeResult();

    if( _.arrayIs( routines ) )
    for( var r = 0 ; r < routines.length ; r++ )
    {
      result[ r ] = routines[ r ]();
    }
    else
    for( var r in routines )
    {
      result[ r ] = routines[ r ]();
    }

  }
  else if( arguments.length === 2 )
  {
    var context = arguments[ 0 ];
    var routines = arguments[ 1 ];

    makeResult();

    if( _.arrayIs( routines ) )
    for( var r = 0 ; r < routines.length ; r++ )
    {
      result[ r ] = routines[ r ].call( context );
    }
    else
    for( var r in routines )
    {
      result[ r ] = routines[ r ].call( context );
    }

  }
  else if( arguments.length === 3 )
  {
    var context = arguments[ 0 ];
    var routines = arguments[ 1 ];
    var args = arguments[ 2 ];

    _.assert( _.arrayLike( args ) );

    makeResult();

    if( _.arrayIs( routines ) )
    for( var r = 0 ; r < routines.length ; r++ )
    {
      result[ r ] = routines[ r ].apply( context,args );
    }
    else
    for( var r in routines )
    {
      result[ r ] = routines[ r ].apply( context,args );
    }

  }
  else _.assert( 0,'unexpected' );

  return result;
}

//

function routineOptions( routine,options )
{

  if( options === undefined )
  options = Object.create( null );

  _.assert( arguments.length === 2,'routineOptions : expects 2 arguments' );
  _.assert( _.routineIs( routine ),'routineOptions : expects routine' );
  _.assert( _.objectIs( routine.defaults ),'routineOptions : expects routine with defined defaults' );
  _.assert( _.objectIs( options ),'routineOptions : expects object' );

  _.assertMapHasOnly( options,routine.defaults );
  _.mapComplement( options,routine.defaults );
  _.assertMapHasNoUndefine( options );

  return options;
}

//

function routineOptionsWithUndefines( routine,options )
{

  if( options === undefined )
  options = Object.create( null );

  _.assert( arguments.length === 2,'routineOptionsWithUndefines : expects 2 arguments' );
  _.assert( _.routineIs( routine ),'routineOptionsWithUndefines : expects routine' );
  _.assert( _.objectIs( routine.defaults ),'routineOptionsWithUndefines : expects routine with defined defaults' );
  _.assert( _.objectIs( options ),'routineOptionsWithUndefines : expects object' );

  _.assertMapHasOnlyWithUndefines( options,routine.defaults );
  _.mapComplementWithUndefines( options,routine.defaults );

  return options;
}

//

function routineOptionsFromThis( routine,_this,constructor )
{

  _.assert( arguments.length === 3,'routineOptionsFromThis : expects 3 arguments' );

  var options = _this || Object.create( null );
  if( Object.isPrototypeOf.call( constructor,_this ) || constructor === _this )
  options = Object.create( null );

  return _.routineOptions( routine,options );
}

//

function routineInputMultiplicator_functor( o )
{

  if( _.routineIs( o ) || _.strIs( o ) )
  o = { routine : o }

  o = _.routineOptions( routineInputMultiplicator_functor,o );

  var routineName = o.routine;
  var routine = o.routine;
  var fieldFilter = o.fieldFilter;
  var bypassFilteredOut = o.bypassFilteredOut;

  if( strIs( routine ) )
  routine = function methodCall()
  {
    return this[ routineName ].apply( this,arguments );
  }

  _.assert( _.routineIs( routine ) );

  /* */

  function inputMultiplicator( src )
  {

    _.assert( arguments.length === 1 );

    if( _.arrayIs( src ) )
    {
      var result = [];
      for( var r = 0 ; r < src.length ; r++ )
      result[ r ] = routine.call( this,src[ r ] );
      return result;
    }

    if( _.mapIs( src ) )
    {
      var result = Object.create( null );
      for( var r in src )
      result[ r ] = routine.call( this,src[ r ] );
      return result;
    }

    return routine.call( this,src );

    _.assert( 0,'unknown argument',_.strTypeOf( src ) );

  }

  /* */

  function inputMultiplicatorWithFilter( src )
  {

    _.assert( arguments.length === 1 );

    if( _.arrayIs( src ) )
    {
      var result = [];
      for( var r = 0 ; r < src.length ; r++ )
      if( fieldFilter( src[ r ],r,src ) )
      result.push( routine.call( this,src[ r ] ) );
      else if( bypassFilteredOut )
      result.push( src[ r ] );
      return result;
    }

    if( _.mapIs( src ) )
    {
      var result = Object.create( null );
      for( var r in src )
      if( fieldFilter( src[ r ],r,src ) )
      result[ r ] = routine.call( this,src[ r ] );
      else if( bypassFilteredOut )
      result[ r ] = src[ r ];
      return result;
    }

    return routine.call( this,src );

    _.assert( 0,'unknown argument',_.strTypeOf( src ) );

  }

  /* */

  return fieldFilter ? inputMultiplicatorWithFilter : inputMultiplicator;
}

routineInputMultiplicator_functor.defaults =
{
  routine : null,
  fieldFilter : null,
  bypassFilteredOut : 1,
}

//

function _comparatorFromTransformer( transformer )
{

  if( transformer === undefined )
  transformer = function transformer( a,b ){ return a-b };

  _.assert( arguments.length === 1 );
  _.assert( transformer.length === 1 || transformer.length === 2 );

  if( transformer.length === 1 )
  {
    var comparator = function comparatorFromTransformer( a,b )
    {
      return transformer( a ) - transformer( b );
    }
    return comparator;
  }

  return transformer;
}

//
//
// function routines( src )
// {
//   var result = Object.create( null );
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.objectLike( src ) );
//
//   var keys = _.mapKeysCustom
//   ({
//     src : src,
//     own : 0,
//     enumerable : 1,
//   });
//
//   for( var k = 0 ; k < keys.length ; k++ )
//   {
//     if( _.routineIs( src[ keys[ k ] ] ) )
//     result[ keys[ k ] ] = src[ keys[ k ] ];
//   }
//
//   return result;
// }

// --
// time
// --

function timeReady( onReady )
{

  _assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  _assert( _.numberIs( arguments[ 0 ] ) || _.routineIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined );

  var timeOut = 0;
  if( _.numberIs( arguments[ 0 ] ) )
  {
    timeOut = arguments[ 0 ];
    onReady = arguments[ 1 ];
  }

  if( typeof window !== 'undefined' && typeof document !== 'undefined' && document.readyState != 'complete' )
  {
    var con = typeof wConsequence !== 'undefined' ? new wConsequence() : null;

    // function handleTimeOut()
    // {
    //   if( !con && onReady )
    //   onReady();
    //   else if( onReady )
    //   con.first( onReady );
    //   else
    //   con.give();
    // }

    function handleReady()
    {
      if( typeof wConsequence !== 'undefined' )
      return _.timeOut( timeOut,onReady ).doThen( con );
      else
      setTimeout( onReady,timeOut );
    }

    window.addEventListener( 'load',handleReady );
    return con;
  }
  else
  {
    if( typeof wConsequence !== 'undefined' )
    return _.timeOut( timeOut,onReady );
    else
    setTimeout( onReady,timeOut );
  }

}

//

function timeReadyJoin( context,routine,args )
{

  routine = _.routineJoin( context,routine,args );

  var result = _.routineJoin( undefined,_.timeReady,[ routine ] );

  function _timeReady()
  {
    var args = arguments;
    routine = _.routineJoin( context === undefined ? this : this,routine,args );
    return _.timeReady( routine );
  }

  return _timeReady;
}

//

function timeOnce( delay,onBegin,onEnd )
{

  var con = new wConsequence();
  var taken = false;
  var options;
  var optionsDefault =
  {
    delay : null,
    onBegin : null,
    onEnd : null,
  }

  if( _.objectIs( delay ) )
  {
    options = delay;
    _assert( arguments.length === 1 );
    _.assertMapHasOnly( options,optionsDefault );
    delay = options.delay;
    onBegin = options.onBegin;
    onEnd = options.onEnd;
  }
  else
  {
    _assert( 2 <= arguments.length && arguments.length <= 3 );
  }

  _assert( delay >= 0 );
  _assert( _.atomicIs( onBegin ) || _.routineIs( onBegin ) || _.objectIs( onBegin ) );
  _assert( _.atomicIs( onEnd ) || _.routineIs( onEnd ) || _.objectIs( onEnd ) );

  return function timeOnce()
  {

    if( taken )
    {
      /*console.log( 'timeOnce :','was taken' );*/
      return;
    }
    taken = true;

    if( onBegin )
    {
      if( _.routineIs( onBegin ) ) onBegin.apply( this,arguments );
      else if( _.objectIs( onBegin ) ) onBegin.give( arguments );
      con.give();
    }

    _.timeOut( delay,function()
    {

      if( onEnd )
      {
        if( _.routineIs( onEnd ) ) onEnd.apply( this,arguments );
        else if( _.objectIs( onEnd ) ) onEnd.give( arguments );
        con.give();
      }
      taken = false;

    });

    return con;
  }

}

//

function timeOut( delay,onReady )
{
  var con = new wConsequence();

  _assert( arguments.length <= 4 );
  _assert( _.numberIs( delay ) );

  if( arguments[ 1 ] !== undefined && arguments[ 2 ] === undefined && arguments[ 3 ] === undefined )
  _assert( _.routineIs( onReady ) || onReady instanceof wConsequence );
  else if( arguments[ 2 ] !== undefined || arguments[ 3 ] !== undefined )
  _assert( _.routineIs( arguments[ 2 ] ) );

  function onEnd()
  {
    var result;

    if( onReady )
    con.first( onReady );
    else
    con.give( timeOut );
  }

  if( arguments[ 2 ] !== undefined || arguments[ 3 ] !== undefined )
  {
    onReady = _.routineJoin.call( _,arguments[ 1 ],arguments[ 2 ],arguments[ 3 ] );
  }

  if( delay > 0 )
  setTimeout( onEnd,delay );
  else
  _fastTimeOut( onEnd );

  return con;
}

var _fastTimeOut = typeof module === 'undefined' ? function( h ){ return setTimeout( h,0 ) } : process.nextTick;

//

function timeOutError( delay,onReady )
{
  var result = _.timeOut.apply( this,arguments );

  result.doThen( function( err,data )
  {
    if( err )
    throw err;

    var err = _.err( 'Time out!' );

    Object.defineProperty( err, 'timeOut',
    {
      enumerable : false,
      configurable : false,
      writable : false,
      value : 1,
    });

    return wConsequence().error( err );
  });

  return result;
}

//

function timePeriodic( delay,onReady )
{
  var con = new wConsequence();
  var id;

  _.assert( arguments.length === 2 );

  // if( arguments.length > 2 )
  // {
  //   throw _.err( 'Not tested' );
  //   _assert( arguments.length <= 4 );
  //   onReady = _.routineJoin( arguments[ 2 ],onReady[ 3 ],arguments[ 4 ] );
  // }

  _assert( _.numberIs( delay ) );

  function handlePeriodicCon( err )
  {
    if( err ) clearInterval( id );
  }

  var _onReady = null;

  if( _.routineIs( onReady ) )
  _onReady = function()
  {
    var result = onReady.call();
    if( result === false )
    clearInterval( id );
    wConsequence.give( con,null );
    con.doThen( handlePeriodicCon );
  }
  else if( onReady instanceof wConsquence )
  _onReady = function()
  {
    var result = onReady.ping();
    if( result === false )
    clearInterval( id );
    wConsequence.give( con,null );
    con.doThen( handlePeriodicCon );
  }
  else if( onReady === undefined )
  _onReady = function()
  {
    wConsequence.give( con,null );
    con.doThen( handlePeriodicCon );
  }
  else throw _.err( 'unexpected type of onReady' );

  id = setInterval( _onReady,delay );

  return con;
}

//

function _timeNow_functor()
{
  var now;

  _assert( arguments.length === 0 );

  if( typeof performance !== 'undefined' && performance.now !== undefined )
  now = _.routineJoin( performance,performance.now );
  else if( Date.now )
  now = _.routineJoin( Date,Date.now );
  else
  now = function(){ return Date().getTime() };

  return now;
}

//

function timeSpent( description,time )
{
  var now = timeNow();

  if( arguments.length === 1 )
  {
    time = arguments[ 0 ];
    description = 'Spent';
  }

  _assert( 1 <= arguments.length && arguments.length <= 2 );
  _assert( _.numberIs( time ) );
  _assert( _.strIs( description ) );

  if( description && description !== ' ' )
  description = description + ' : ';

  var result = description + ( 0.001*( now-time ) ).toFixed( 3 ) + 's';

  return result;
}

//

function dateToStr( date )
{
  var y = date.getFullYear();
  var m = date.getMonth() + 1;
  var d = date.getDate();
  if( m < 10 ) m = '0' + m;
  if( d < 10 ) d = '0' + d;
  var result = [ y,m,d ].join( '.' );
  return result;
}

// --
// buffer
// --

  /**
   * The bufferRelen() method returns a new or the same typed array (src) with a new or the same length (len).
   *
   * It creates the variable (result) checks, if (len) is more than (src.length),
   * if true, it creates and assigns to (result) a new typed array with the new length (len) by call the function (arrayNew(src, len))
   * and copies each element from the (src) into the (result) array while ensuring only valid data types, if data types are invalid they are replaced with zero.
   * Otherwise, if (len) is less than (src.length) it returns a new typed array from 0 to the (len) indexes, but not including (len).
   * Otherwise, it returns an initial typed array.
   *
   * @see {@link wTools.arrayNew} - See for more information.
   *
   * @param { typedArray } src - The source typed array.
   * @param { Number } len - The length of a typed array.
   *
   * @example
   * // returns [ 3, 7, 13, 0 ]
   * var ints = new Int8Array( [ 3, 7, 13 ] );
   * _.bufferRelen( ints, 4 );
   *
   * @example
   * // returns [ 3, 7, 13 ]
   * var ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
   * _.bufferRelen( ints2, 3 );
   *
   * @example
   * // returns [ 3, 0, 13, 0, 77, 0 ]
   * var ints3 = new Int32Array( [ 3, 7, 13, 33, 77 ] );
   * _.bufferRelen( ints3, 6 );
   *
   * @returns { typedArray } - Returns a new or the same typed array (src) with a new or the same length (len).
   * @method bufferRelen
   * @memberof wTools
   */

function bufferRelen( src,len )
{

  _.assert( _.bufferIs( src ) );
  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( len ) );

  var result = src;

  if( len > src.length )
  {
    result = arrayNew( src, len );
    result.set( src );
  }
  else if( len < src.length )
  {
    result = src.subarray( 0,len );
  }

  return result;
}

//

function bufferResize( src,size )
{
  var result = src;

  if( !( src instanceof ArrayBuffer ) )
  throw _.err( '_.bufferResize :','"src" is not instance of "ArrayBuffer"' );

  if( size > src.byteLength )
  {
    result = arrayNew( src, size );
    var resultTyped = new Uint8Array( result,0,result.byteLength );
    var srcTyped = new Uint8Array( src,0,src.byteLength );
    resultTyped.set( srcTyped );
  }
  else if( size < src.byteLength )
  {
    result = src.slice( 0,size );
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
    return new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
  }
  else if( _.bufferIs( src ) )
  {
    return new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
  }
  else if( _.strIs( src ) )
  {
    return new Uint8Array( _.utf8ToBuffer( src ) );
  }
  else throw _.err( '_.bufferBytesGet :','wrong argument' );

}

//

  /**
   * The bufferRetype() method converts and returns a new instance of (bufferType) constructor.
   *
   * @param { typedArray } src - The typed array.
   * @param { typedArray } bufferType - The type of typed array.
   *
   * @example
   * // returns [ 513, 1027, 1541 ]
   * var view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
   * _.bufferRetype(view1, Int16Array);
   *
   * @example
   * // returns [ 1, 2, 3, 4, 5, 6 ]
   * var view2 = new Int16Array( [ 513, 1027, 1541 ] );
   * _.bufferRetype(view2, Int8Array);
   *
   * @returns { typedArray } Returns a new instance of (bufferType) constructor.
   * @method bufferRetype
   * @throws { Error } Will throw an Error if (src) is not a typed array object.
   * @throws { Error } Will throw an Error if (bufferType) is not a type of the typed array.
   * @memberof wTools
   */

function bufferRetype( src,bufferType )
{

  _.assert( _.bufferIs( src ) );
  _.assert( _.typeIsBuffer( bufferType ) );

  var o = src.byteOffset;
  var l = Math.floor( src.byteLength / bufferType.BYTES_PER_ELEMENT );
  var result = new bufferType( src.buffer,o,l );

  return result;
}

//

function bufferMove( dst,src )
{

  if( arguments.length === 2 )
  {

    _.assert( _.arrayLike( dst ) );
    _.assert( _.arrayLike( src ) );

    if( dst.length !== src.length )
    throw _.err( '_.bufferMove :','"dst" and "src" must have same length' );

    if( dst.set )
    {
      dst.set( src );
      return dst;
    }

    for( var s = 0 ; s < src.length ; s++ )
    dst[ s ] = src[ s ];

  }
  else if( arguments.length === 1 )
  {

    var options = arguments[ 0 ];
    _.assertMapHasOnly( options,bufferMove.defaults );

    var src = options.src;
    var dst = options.dst;

    if( _.bufferRawIs( dst ) )
    {
      dst = new Uint8Array( dst );
      if( _.bufferIs( src ) && !( src instanceof Uint8Array ) )
      src = new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
    }

    _.assert( _.arrayLike( dst ) );
    _.assert( _.arrayLike( src ) );

    options.dstOffset = options.dstOffset || 0;

    if( dst.set )
    {
      dst.set( src,options.dstOffset );
      return dst;
    }

    for( var s = 0, d = options.dstOffset ; s < src.length ; s++, d++ )
    dst[ d ] = src[ s ];

  }
  else _.assert( 0,'unexpected' );

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
  var result = '';

  if( src instanceof ArrayBuffer )
  src = new Uint8Array( src,0,src.byteLength );

  _.assert( arguments.length === 1 );
  _.assert( _.bufferAnyIs( src ) );

  if( bufferNodeIs( src ) )
  return src.toString( 'utf8' );

  try
  {
    result = String.fromCharCode.apply( null, src );
  }
  catch( e )
  {
    for( var i = 0 ; i < src.byteLength ; i++ )
    {
      result += String.fromCharCode( src[i] );
    }
  }

  return result;
}

//

function bufferToDom( xmlBuffer ) {

  var result;

  if( typeof DOMParser !== 'undefined' && DOMParser.prototype.parseFromBuffer )
  {

    var parser = new DOMParser();
    result = parser.parseFromBuffer( xmlBuffer,xmlBuffer.byteLength,'text/xml' );
    throw _.err( 'not tested' );

  }
  else
  {

    var xmlStr = _.bufferToStr( xmlBuffer );
    result = this.strToDom( xmlStr );

  }

  return result;
}

//

function bufferLeftBufferIndex( src,ins )
{

  if( !_.bufferIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferIs( ins ) )
  ins = _.bufferBytesGet( ins );

  _.assert( _.bufferIs( src ) );
  _.assert( _.bufferIs( ins ) );

/*
    var srcw = _.bufferRetype( src,Uint32Array );
    var insw = _.bufferRetype( ins,Uint32Array );
    debugger;
*/

  var o = -1
  do
  {

    o += 1;
    var o = src.indexOf( ins[ 0 ],o );

    for( var i = 0 ; i < ins.length ; i++ )
    if( src[ o+i ] !== ins[ i ] )
    break;

    if( i === ins.length )
    return o;

  }
  while( o !== -1 );

  return -1;
}

//

function bufferFromArrayOfArray( array,options ){

  if( _.objectIs( array ) )
  {
    options = array;
    array = options.buffer;
  }

  var options = options || Object.create( null );
  var array = options.buffer = array || options.buffer;

  //

  if( options.BufferType === undefined ) options.BufferType = Float32Array;
  if( options.sameLength === undefined ) options.sameLength = 1;
  if( !options.sameLength ) throw _.err( '_.bufferFromArrayOfArray :','differemt length of arrays is not implemented' );

  if( !array.length ) return new options.BufferType();

  var atomsPerElement = _.numberIs( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.numberIs( atomsPerElement ) ) throw _.err( '_.bufferFromArrayOfArray :','cant find out element length' );

  var length = array.length * atomsPerElement;
  var result = new options.BufferType( length );
  var i = 0;

  for( var a = 0 ; a < array.length ; a++ )
  {

    var element = array[ a ];

    for( var e = 0 ; e < atomsPerElement ; e++ )
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
  var result;

  _assert( arguments.length === 1 );
  _assert( _.objectIs( o ) );
  _assert( _.routineIs( o.bufferConstructor ),'expects bufferConstructor' );
  _.assertMapHasOnly( o,bufferFrom.defaults );

  /* buffer */

  if( _.bufferIs( o.src ) )
  {
    if( o.src.constructor === o.bufferConstructor )
    return o.src;

    debugger;

    result = new o.bufferConstructor( o.src );
    return result;
  }

  /* number */

  if( _.numberIs( o.src ) )
  o.src = [ o.src ];

  /* verification */

  _.assert( _.objectLike( o.src ) || _.arrayLike( o.src ),'bufferFrom expects object-like or array-like as o.src' );

  /* length */

  var length = o.src.length;
  if( !_.numberIs( length ) )
  {

    var length = 0;
    while( o.src[ length ] !== undefined )
    length += 1;

  }

  /* make */

  if( _.arrayIs( o.src ) )
  result = new o.bufferConstructor( o.src );
  else if ( _.arrayLike( o.src ) )
  {
    result = new o.bufferConstructor( o.src );
    throw _.err( 'not tested' );
  }
  else
  {
    result = new o.bufferConstructor( length );
    for( var i = 0 ; i < length ; i++ )
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
   * The bufferRawFromBuffer() method returns a new ArrayBuffer from (buffer.byteOffset) to the end of an ArrayBuffer of a typed array (buffer)
   * or returns the same ArrayBuffer of the (buffer), if (buffer.byteOffset) is not provided.
   *
   * @param { typedArray } buffer - Entity to check.
   *
   * @example
   * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
   * var buffer1 = new ArrayBuffer(10);
   * var view1 = new Int8Array( buffer1 );
   * _.bufferRawFromBuffer( view1 );
   *
   * @example
   * // returns [ 0, 0, 0, 0, 0, 0 ]
   * var buffer2 = new ArrayBuffer(10);
   * var view2 = new Int8Array( buffer2, 2 );
   * _.bufferRawFromBuffer( view2 );
   *
   * @returns { ArrayBuffer } Returns a new or the same ArrayBuffer.
   * If (buffer) is instance of '[object ArrayBuffer]', it returns buffer.
   * @method bufferRawFromBuffer
   * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 1.
   * @throws { Error } Will throw an Error if (buffer) is not a typed array.
   * @memberof wTools
   */

function bufferRawFromBuffer( buffer )
{

  _.assert( arguments.length === 1 );
  _.assert( _.bufferIs( buffer ) || _.bufferRawIs( buffer ) );

  if( _.bufferRawIs( buffer ) )
  return buffer;

  var result = buffer.buffer;

  if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
  result = result.slice( buffer.byteOffset || 0,buffer.byteLength );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferRawFrom( buffer )
{
  var result;

  _.assert( arguments.length === 1 );

  if( buffer instanceof ArrayBuffer )
  return buffer;

  if( _.bufferNodeIs( buffer ) )
  {

    result = new Uint8Array( buffer ).buffer;

  }
  else if( _.bufferIs( buffer ) || _.bufferViewIs( buffer ) )
  {

    buffer = buffer.buffer;
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    result = result.slice( buffer.byteOffset || 0,buffer.byteLength );

  }
  else if( _.strIs( buffer ) )
  {

    result = _.utf8ToBuffer( buffer ).buffer;

  }
  else if( _global_.File && buffer instanceof File )
  {
    var fileReader = new FileReaderSync();
    result = fileReader.readAsArrayBuffer( buffer );
    throw _.err( 'not tested' );
  }
  else throw _.err( 'bufferRawFrom : unknown source' );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function buffersSerialize( o )
{
  var self = this;
  var size = 0;
  var o = o || Object.create( null );

  _.assertMapHasNoUndefine( o );
  _.assertMapHasOnly( o,buffersSerialize.defaults );
  _.mapComplement( o,buffersSerialize.defaults );
  _.assert( _.objectIs( o.store ) );

  var store = o.store;
  var storeAttributes = store[ 'attributes' ] = store[ 'attributes' ] || Object.create( null );
  var attributes = o.onAttributesGet.call( o.context );
  var buffers = [];

  // eval size

  for( var a = 0 ; a < attributes.length ; a++ )
  {

    var name = attributes[ a ][ 0 ];
    var attribute = attributes[ a ][ 1 ];
    var buffer = o.onBufferGet.call( o.context,attribute );

    _.assert( _.bufferIs( buffer ) || buffer === null,'expects buffer or null, got : ' + _.strTypeOf( buffer ) );

    var bufferSize = buffer ? buffer.length*buffer.BYTES_PER_ELEMENT : 0;

    if( o.dropAttribute && o.dropAttribute[ name ] )
    continue;

    var descriptor = Object.create( null );
    descriptor.attribute = attribute;
    descriptor.name = name;
    descriptor.buffer = buffer;
    descriptor.bufferSize = bufferSize;
    descriptor.sizeOfAtom = buffer ? buffer.BYTES_PER_ELEMENT : 0;
    buffers.push( descriptor );

    size += bufferSize;

  }

  // make buffer

  if( !store[ 'buffer' ] )
  store[ 'buffer' ] = new ArrayBuffer( size );

  var dstBuffer = _.bufferBytesGet( store[ 'buffer' ] );

  _.assert( store[ 'buffer' ].byteLength === size );
  if( store[ 'buffer' ].byteLength < size )
  throw _.err( 'buffersSerialize :','buffer does not have enough space' );

  /* sort by atom size */

  buffers.sort( function( a,b )
  {
    return b.sizeOfAtom - a.sizeOfAtom;
  });

  // store into single buffer

  var offset = 0;
  for( var b = 0 ; b < buffers.length ; b++ )
  {

    var name = buffers[ b ].name;
    var attribute = buffers[ b ].attribute;
    var buffer = buffers[ b ].buffer;
    var bytes = buffer ? _.bufferBytesGet( buffer ) : new Uint8Array();
    var bufferSize = buffers[ b ].bufferSize;

    if( o.dropAttribute && o.dropAttribute[ name ] )
    continue;

    _.bufferMove( dstBuffer.subarray( offset,offset+bufferSize ),bytes );

    var serialized = store[ 'attributes' ][ name ] =
    {
      'bufferConstructorName' : buffer ? buffer.constructor.name : 'null',
      'sizeOfAtom' : buffer ? buffer.BYTES_PER_ELEMENT : 0,
      'offsetInCommonBuffer' : offset,
      'size' : bytes.length,
    }

    // debugger; // xxx

    if( attribute.copyCustom )
    serialized[ 'fields' ] = attribute.copyCustom
    ({

      dst : Object.create( null ),
      src : attribute,

      copyComposes : true,
      copyAggregates : true,
      copyAssociates : false,

      technique : 'data',

    });

    offset += bufferSize;

  }

  // return

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
  var o = o || Object.create( null );
  var store = o.store;
  var commonBuffer = store[ 'buffer' ];

  _.assertMapHasNoUndefine( o );
  _.assertMapHasOnly( o,buffersDeserialize.defaults );
  _.mapComplement( o,buffersDeserialize.defaults );
  _.assert( _.objectIs( o.store ) );
  _.assert( _.bufferRawIs( commonBuffer ) || _.bufferIs( commonBuffer ) );

  commonBuffer = _.bufferRawFromBuffer( commonBuffer );

  for( var a in store[ 'attributes' ] )
  {
    var attribute = store[ 'attributes' ][ a ];

    var bufferConstructor = attribute[ 'bufferConstructorName' ] === 'null' ? null : _global_[ attribute[ 'bufferConstructorName' ] ];
    var offset = attribute[ 'offsetInCommonBuffer' ];
    var size = attribute[ 'size' ];
    var sizeOfAtom = attribute[ 'sizeOfAtom' ];
    var fields = attribute[ 'fields' ];

    _.assert( _.routineIs( bufferConstructor ) || bufferConstructor === null,'unknown attribute\' constructor :',attribute[ 'bufferConstructorName' ] )
    _.assert( _.numberIs( offset ),'unknown attribute\' offset in common buffer :',offset )
    _.assert( _.numberIs( size ),'unknown attribute\' size of buffer :',size )
    _.assert( _.numberIs( sizeOfAtom ),'unknown attribute\' sizeOfAtom of buffer :',sizeOfAtom )

    if( attribute.offset+size > commonBuffer.byteLength )
    throw _.err( 'cant deserialize attribute','"'+a+'"','it is out of common buffer' );

    /* logger.log( 'bufferConstructor( ' + commonBuffer + ',' + offset + ',' + size / sizeOfAtom + ' )' ); */

    var buffer = bufferConstructor ? new bufferConstructor( commonBuffer,offset,size / sizeOfAtom ) : null;

    o.onAttribute.call( o.context,fields,buffer,a );

  }

}

buffersDeserialize.defaults =
{
  store : null,
  context : null,
  onAttribute : function( attributeOptions,buffer )
  {
    attributeOptions.buffer = buffer;
    new this.AttributeOfGeometry( attributeOptions ).addTo( this );
  },
}

//

var bufferToNodeBuffer = ( function( buffer )
{

  var toBuffer = null;

  return function bufferToNodeBuffer( buffer )
  {

    _.assert( _.bufferIs( buffer ) || _.bufferRawIs( buffer ) );

    /* */

    if( toBuffer === null )
    try
    {
      toBuffer = require( 'typedarray-to-buffer' );
    }
    catch( err )
    {
      toBuffer = false;
    }

    /* */

    if( !buffer.length && !buffer.byteLength )
    buffer = new Buffer([]);
    else if( toBuffer )
    try
    {
      buffer = toBuffer( buffer );
    }
    catch( err )
    {
      debugger;
      buffer = toBuffer( buffer );
    }
    else _.assert( 0,'unexpected' );

    return buffer;
  }

})();

// --
// array
// --

/**
 * The arraySub() method returns a shallow copy of a portion of an array
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
 * var arr = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
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
 * @method arraySub
 * @throws { Error } If the passed arguments is more than three.
 * @throws { Error } If the first argument is not an array.
 * @memberof wTools
 */

function arraySub( src,begin,end )
{

  _.assert( arguments.length <= 3 );

  if( _.atomicIs( src ) )
  throw _.err( 'arraySub','Unknown argument type' );

  if( _.routineIs( src.subarray ) )
  return src.subarray( begin,end );

  if( !_.routineIs( src.slice ) )
  throw _.err( 'arraySub','Unknown argument type' );

  return src.slice( begin,end );
}

//

/**
 * The arrayNew() method returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { arrayLike } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * var arr = _.arrayNew( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * var arr = _.arrayNew( [ 1, 2, 3 ], 4 );
 *
 * @returns { arrayLike }  Returns an array with a certain (length).
 * @method arrayNew
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */

function arrayNew( ins,length )
{
  var result;

  _.assert( arguments.length === 1 || arguments.length === 2 );

  // if( ins instanceof ArrayBuffer )
  // debugger;

  if( length === undefined )
  {
    _.assert( _.numberIs( ins.length ) );
    length = ins.length;
  }

  if( _.argumentsIs( ins ) || _.arrayIs( ins ) )
  result = new Array( length );
  else if( _.bufferIs( ins ) || ins instanceof ArrayBuffer )
  result = new ins.constructor( length );
  else throw _.err( 'arrayNew :','unknown type of instance' );

  return result;
}

//

/**
 * The arrayNewOfSameLength() method returns a new empty array
 * or a new TypedArray with the same length as in (ins).
 *
 * @param { arrayLike } ins - The instance of an array.
 *
 * @example
 * // returns [ , , , , ]
 * var arr = _.arrayNewOfSameLength( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { arrayLike } - The new empty array with the same length as in (ins).
 * @method arrayNewOfSameLength
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If the first argument in not array like object.
 * @memberof wTools
 */

// function arrayNewOfSameLength( ins )
// {
//
//   _.assert( arguments.length === 1 );
//
//   if( _.atomicIs( ins ) ) return;
//   if( !_.arrayIs( ins ) && !_.bufferIs( ins ) ) return;
//   var result = arrayNew( ins,ins.length );
//   return result;
// }

//

/**
 * The arrayFromNumber() method returns a new array
 * which containing the static elements only type of Number.
 *
 * It takes two argument (dst) and (length)
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
 * var arr = _.arrayFromNumber( 3, 7 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * var arr = _.arrayFromNumber( [ 3, 7, 13 ], 3 );
 *
 * @returns { Number[] | Array } - Returns the new array of static numbers or the original array.
 * @method arrayFromNumber
 * @throws { Error } If missed argument, or got less or more than two argument.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less than 0.
 * @throws { Error } If (dst.length) is not equal to the (length).
 * @memberof wTools
 */

function arrayFromNumber( dst,length )
{
  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( dst ) || _.arrayIs( dst ),'expects array of number as argument' );
  _.assert( length >= 0 );

  if( _.numberIs( dst ) )
  dst = arrayFill({ times : length , value : dst });
  else if( dst.length !== length )
  throw _.err( 'expects array of length',length,'but got',dst );

  return dst;
}

//

/**
 * The arraySelect() method selects elements from (srcArray) by indexes of (indicesArray).
 *
 * @param { arrayLike } srcArray - Values for the new array.
 * @param { ( arrayLike | object ) } [ indicesArray = indicesArray.indices ] - Indexes of elements from the (srcArray) or options object.
 *
 * @example
 * // returns [ 3, 4, 5 ]
 * var arr = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
 *
 * @example
 * // returns [ undefined, undefined ]
 * var arr = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
 *
 * @returns { arrayLike } - Returns a new array with the length equal (indicesArray.length) and elements from (srcArray).
   If there is no element with necessary index than the value will be undefined.
 * @method arraySelect
 * @throws { Error } If passed arguments is not array like object.
 * @throws { Error } If the atomsPerElement property is not equal to 1.
 * @memberof wTools
 */

function arraySelect( srcArray,indicesArray )
{
  var atomsPerElement = 1;

  if( _.objectIs( indicesArray ) )
  {
    atomsPerElement = indicesArray.atomsPerElement || 1;
    indicesArray = indicesArray.indices;
  }

  _assert( _.bufferIs( srcArray ) || _.arrayIs( srcArray ) );
  _assert( _.bufferIs( indicesArray ) || _.arrayIs( indicesArray ) );

  var result = new srcArray.constructor( indicesArray.length );

  if( atomsPerElement === 1 )
  for( var i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    result[ i ] = srcArray[ indicesArray[ i ] ];
  }
  else
  for( var i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    throw _.err( 'Not tested' );
    for( var a = 0 ; a < atomsPerElement ; a += 1 )
    result[ i*atomsPerElement+a ] = srcArray[ indicesArray[ i ]*atomsPerElement+a ];
  }

  return result;
}

//

function arrayIndicesOfGreatest( srcArray,numberOfElements,comparator )
{
  var result = [];
  var l = srcArray.length;

  debugger;
  throw _.err( 'not tested' );

  comparator = _._comparatorFromTransformer( comparator );

  function rcomparator( a,b )
  {
    return comparator( srcArray[ a ],srcArray[ b ] );
  };

  for( var i = 0 ; i < l ; i += 1 )
  {

    if( result.length < numberOfElements )
    {
      _.arraySortedAdd( result, i, rcomparator );
      continue;
    }

    _.arraySortedAdd( result, i, rcomparator );
    result.splice( result.length-1,1 );

  }

  return result;
}

//

/**
 * The arrayFlatten() method returns an array that contains all the passed arguments.
 *
 * It creates two variables the (result) - array and the (src) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the (src) each element,
 * checks if (src) is not equal to the 'undefined'.
 * If true, it adds element to the result.
 * If (src) is an Array and if element(s) of the (src) is not equal to the 'undefined'.
 * If true, it adds to the (result) each element of the (src) array.
 * Otherwise, if (src) is an Array and if element(s) of the (src) is equal to the 'undefined' it throws an Error.
 *
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns [ 'str', {}, 1, 2, 5, true ]
 * var arr = _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
 *
 * @returns { Array } - Returns an array of the passed argument(s).
 * @method arrayFlatten
 * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
 * @memberof wTools
 */

function arrayFlatten()
{
  var result = _.arrayIs( this ) ? this : [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var src = arguments[ a ];

    if( !_.arrayLike( src ) )
    {
      if( src !== undefined ) result.push( src );
      continue;
    }

    for( var s = 0 ; s < src.length ; s++ )
    {
      if( _.arrayIs( src[ s ] ) )
      _.arrayFlatten.call( result,src[ s ] );
      else if( src[ s ] !== undefined )
      result.push( src[ s ] );
      else if( src[ s ] === undefined )
      throw _.err( 'array should have no undefined' );
    }

  }

  return result;
}

//

function arrayCopy()
{
  var result;
  var length = 0;

  // eval length

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayCopy','argument is not defined' );

    if( _.arrayLike( argument ) ) length += argument.length;
    else if( _.bufferRawIs( argument ) ) length += argument.byteLength;
    else length += 1;
  }

  // make result

  if( _.arrayIs( arguments[ 0 ] ) || _.bufferIs( arguments[ 0 ] ) )
  result = arrayNew( arguments[ 0 ],length );
  else if( _.bufferRawIs( arguments[ 0 ] ) )
  result = new ArrayBuffer( length );

  var bufferDst;
  var offset = 0;
  if( _.bufferRawIs( arguments[ 0 ] ) )
  {
    bufferDst = new Uint8Array( result );
  }

  // copy

  for( var a = 0, c = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];
    if( _.bufferRawIs( argument ) )
    {
      bufferDst.set( new Uint8Array( argument ), offset );
      offset += argument.byteLength;
    }
    else if( _.bufferIs( arguments[ 0 ] ) )
    {
      result.set( argument, offset );
      offset += argument.length;
    }
    else if( _.arrayLike( argument ) )
    for( var i = 0 ; i < argument.length ; i++ )
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

  // !!! not optimal

  return result;
}

//

/**
 * The arrayAppendMerging() method adds one or more elements to the end of the (dst) array
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
 * var arr = _.arrayAppendMerging( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
 *
 * @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
 * @method arrayAppendMerging
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */

function arrayAppendMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayAppendMerging :','expects array' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayAppendMerging','argument is not defined' );

    if( _.arrayLike( argument ) )
    result.push.apply( result,argument );
    else
    result.push( argument );
  }

  return result;
}

//

/**
 * The arrayPrependMerging() method adds one or more elements to the beginning of the (dst) array
 * and returns the new length of the array.
 *
 * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) from the end to the beginning and assigns to the (argument) each element,
 * checks, if (argument) is equal to the 'undefined'.
 * If true, it throws an Error.
 * if (argument) is an array-like.
 * If true, it merges the (argument) into the (result) array.
 * Otherwise, it adds element to the result.
 *
 * @param { Array } dst - Initial array.
 * @param {*} arguments[] - One or more argument(s) to add to the front of the (dst) array.
 *
 * @example
 * // returns [ 'str', false, { a : 1 }, 42, 3, 7, 13, 1, 2 ];
 * var arr = _.arrayPrependMerging( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
 *
 * @returns { arrayLike } - Returns an array (dst) with all of the following argument(s) that were added to the beginning of the (dst) array.
 * @method arrayPrependMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */

function arrayPrependMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayPrependMerging :','expects array' );

  for( var a = arguments.length - 1 ; a > 0 ; a-- )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayPrependMerging','argument is not defined' );

    if( _.arrayLike( argument ) ) result.unshift.apply( dst,argument );
    else result.unshift( argument );
  }

  return result;
}

//

/**
 * The arrayAppendOnceMerging() method returns an array of elements from (dst)
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
 * var arr = _.arrayAppendOnceMerging( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
 * @method arrayAppendOnceMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */

function arrayAppendOnceMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayAppendOnceMerging :','expects array' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayAppendOnceMerging','argument is not defined' );

    if( _.arrayLike( argument ) )
    {
      for( var i = 0 ; i < argument.length ; i++ )
      if( result.indexOf( argument[ i ] ) === -1 )
      result.push( argument[ i ] );
    }
    else
    {
      if( result.indexOf( argument ) === -1 )
      result.push( argument );
    }

  }

  return result;
}

//

/**
 * The arrayPrependOnceMerging() method returns an array of elements from (dst)
 * and prepending only unique following arguments to the beginning.
 *
 * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) from the end to the beginning and assigns to the (argument) each element,
 * checks, if (argument) is equal to the 'undefined'.
 * If true, it throws an Error.
 * if (argument) is an array-like.
 * If true, it iterate over array (argument) and checks if (result) has the same values as the (argument).
 * If false, it adds elements of (argument) to the beginning of the (result) array.
 * Otherwise, it checks if (result) has not the same values as the (argument).
 * If true, it adds elements to the beginning of the (result) array.
 *
 * @param { Array } dst - Initial array.
 * @param {*} arguments[] - One or more argument(s).
 *
 * @example
 * // returns [ {}, 'str', 5, 2, 4 ]
 * var arr = _.arrayPrependOnceMerging( [ 2, 4 ], 5, 4, 'str', {} );
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the beginning of the (dst) array.
 * @method arrayPrependOnceMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */

function arrayPrependOnceMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayPrependOnceMerging :','expects array' );

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    _assert( argument !== undefined,'arrayPrependOnceMerging','argument is not defined' );

    if( _.arrayLike( argument ) )
    {
      for( var i = argument.length-1 ; i >= 0 ; i-- )
      if( result.indexOf( argument[ i ] ) === -1 )
      result.unshift( argument[ i ] );
    }
    else
    {
      if( result.indexOf( argument ) === -1 )
      result.unshift( argument );
    }

  }

  return result;
}

//

/**
 * The arraySwap() method reverses the elements by indices (index1) and (index2) in the (dst) array.
 *
 * @param { Array } dst - The initial array.
 * @param { Number } index1 - The first index.
 * @param { Number } index2 - The second index.
 *
 * @example
 * // returns [ 5, 2, 3, 4, 1 ]
 * var arr = _.arraySwap( [ 1, 2, 3, 4, 5 ], 0, 4 );
 *
 * @returns { Array } - Returns the (dst) array that has been modified in place by indexes (index1) and (index2).
 * @method arraySwap
 * @throws { Error } If the first argument in not an array.
 * @throws { Error } If the second argument is less than 0 and more than a length initial array.
 * @throws { Error } If the third argument is less than 0 and more than a length initial array.
 * @memberof wTools
 */

function arraySwap( dst,index1,index2 )
{

  if( arguments.length === 3 )
  {
    index1 = 0;
    index2 = 1;
  }

  _assert( arguments.length === 1 || arguments.length === 3 );
  _assert( _.arrayLike( dst ),'arraySwap :','argument must be array' );
  _assert( 0 <= index1 && index1 < dst.length,'arraySwap :','index1 is out of bound' );
  _assert( 0 <= index2 && index2 < dst.length,'arraySwap :','index2 is out of bound' );

  var e = dst[ index1 ];
  dst[ index1 ] = dst[ index2 ];
  dst[ index2 ] = e;

  return dst;
}

//

/**
 * The arrayFrom() method converts an object-like (src) into Array.
 *
 * @param { * } src - To convert into Array.
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * _.arrayFrom( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 * _.arrayFrom( { a : 3, b : 7, c : 13 } );
 *
 * @example
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 * _.arrayFrom( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ]
 * var args = ( function() {
 *   return arguments;
 * } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayFrom( args );
 *
 * @returns { Array } Returns an Array.
 * @method arrayFrom
 * @throws { Error } Will throw an Error if (src) is not an object-like.
 * @memberof wTools
 */

function arrayFrom( src )
{

  _.assert( arguments.length === 1 );

  if( _.arrayIs( src ) )
  return src;

  if( _.objectIs( src ) )
  return _.mapToArray( src );

  if( _.strIs( src ) )
  {
    var sep = ( src.indexOf( ',' ) !== -1 ) ? ',' : ' '; //???
    return src.split(/[, ]+/).map( function( s ){ if( s.length ) return parseFloat(s); } );
  }

  if( _.argumentsIs( src ) )
  return _ArraySlice.call( src );

  throw _.err( 'arrayFrom : unknown source : ' + _.strTypeOf( src ) ); //???
}

//

/**
 * The arrayToMap() converts an (array) into Object.
 *
 * @param { arrayLike } array - To convert into Object.
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
 * var args = ( function() {
 *   return arguments;
 * } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayToMap( args );
 *
 * @returns { Object } Returns an Object.
 * @method arrayToMap
 * @throws { Error } Will throw an Error if (array) is not an array-like.
 * @memberof wTools
 */

function arrayToMap( array )
{
  var result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( _.arrayLike( array ) );

  for( var a = 0 ; a < array.length ; a++ )
  result[ a ] = array[ a ];
  return result;
}

//

/**
 * The callback function to compare two values.
 *
 * @callback arrayRemoveArrayOnce~onEqual
 * @param { * } el - The element of the (dstArray[n]) array.
 * @param { * } ins - The value to compare (insArray[n]).
 */

/**
 * The arrayRemoveArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
 * and returns amount of the deleted elements from the (dstArray).
 *
 * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqual) arguments, creates variable (var result = 0),
 * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function (dstArray.indexOf(insArray[i])).
 * that looking for the value of the (insArray[i]) array in the (dstArray) array.
 * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
 * and incrementing the variable (result++).
 * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the method
 *
 * If callback function (onEqual) returns true, it returns the index that will be removed from (dstArray),
 * and then incrementing the variable (result++).
 *
 * @see wTools.arrayLeftIndexOf
 *
 * @param { arrayLike } dstArray - The target array.
 * @param { arrayLike } insArray - The source array.
 * @param { function } [ onEqual ] onEqual - The callback function.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayRemoveArrayOnce( [  ], [  ] );
 *
 * @example
 * // returns 2
 * _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
 *
 * @example
 * // returns 4
 * var got = _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
 *   return a < b;
 * } );
 *
 * @returns { number }  Returns amount of the deleted elements from the (dstArray).
 * @method arrayRemoveArrayOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (insArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
 * @memberof wTools
 */

function arrayRemoveArrayOnce( dstArray,insArray,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( _.arrayLike( insArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  var result = 0;
  var index = -1;

  if( arguments.length === 2 )
  {

    for( var i = 0 ; i < insArray.length ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      if( !( index >= 0 ) )
      continue;
      dstArray.splice( index,1 );
      result += 1;
    }

  }
  else if( arguments.length === 3 )
  {

    _.assert( _.routineIs( onEqual ) );
    for( var i = 0 ; i < insArray.length ; i++ )
    {
      index = arrayLeftIndexOf( dstArray,insArray[ i ],onEqual );
      if( !( index >= 0 ) )
      continue;
      dstArray.splice( index,1 );
      result += 1;
    }

  }
  else _.assert( 0,'unexpected' );

  return result;
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
 * The arrayRemovedOnce() method returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEqual) arguments,
 * checks if arguments passed two, it calls built in function (dstArray.indexOf(ins))
 * that looking for the value of the (ins) in the (dstArray).
 * If true, it removes the value (ins) from (dstArray) array by corresponding index.
 * Otherwise, if passed three arguments, it calls the method
 * [arrayLeftIndexOf( dstArray, ins, onEqual )]{@link wTools.arrayLeftIndexOf}
 * If callback function (onEqual) returns true, it returns the index that will be removed from (dstArray).
 * @see {@link wTools.arrayLeftIndexOf} - See for more information.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEqual ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 1
 * var arr = _.arrayRemovedOnce( [ 2, 4, 6 ], 4, function ( el ) {
 *   return el;
 * });
 *
 * @example
 * // returns 0
 * var arr = _.arrayRemovedOnce( [ 2, 4, 6 ], 2 );
 *
 * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
 * @method arrayRemovedOnce
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemovedOnce( dstArray,ins,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  var index = -1;

  if( arguments.length === 2 )
  {

    index = dstArray.indexOf( ins );

  }
  else if( onEqual )
  {

    _.assert( _.routineIs( onEqual ) );
    _.assert( onEqual.length === 1 || onEqual.length === 2 );
    index = arrayLeftIndexOf( dstArray,ins,onEqual );

  }
  else _.assert( 0,'unexpected' );

  if( index >= 0 )
  dstArray.splice( index,1 );

  return index;
}

//

/**
 * The arrayRemoveOnce() method removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEqual) arguments,
 * checks if arguments passed two, it calls the method
 * [arrayRemovedOnce( dstArray, ins )]{@link wTools.arrayRemovedOnce}
 * Otherwise, if passed three arguments, it calls the method
 * [arrayRemovedOnce( dstArray, ins, onEqual )]{@link wTools.arrayRemovedOnce}
 * @see  wTools.arrayRemovedOnce
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEqual ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ]
 * var arr = _.arrayRemoveOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
 *
 * @example
 * // returns [ 3, 7, 13, 33 ]
 * var arr = _.arrayRemoveOnce( [ 3, 7, 33, 13, 33 ], 13, function ( el, ins ) {
 *   return el > ins;
 * });
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @method arrayRemoveOnce
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemoveOnce( dstArray,ins,onEqual )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 )
  arrayRemovedOnce( dstArray,ins );
  else if( onEqual )
  arrayRemovedOnce( dstArray,ins,onEqual );

  return dstArray;
}

//

/**
 * Callback for compare two value.
 *
 * @callback arrayRemovedAll~compareCallback
 * @param { * } el - The element of the array.
 * @param { * } ins - The value to compare.
 */

/**
 * The arrayRemovedAll() method removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the amount of them.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEqual) arguments,
 * checks if (onEqual) is equal to the 'undefined'.
 * If true, it assigns by default callback function that checks the equality of two arguments.
 * Otherwise, it uses given callback function (onEqual).
 * Then it iterates over (dstArray) from the end to the beginning, checks if (onEqual) returns true.
 * If true, it removes the value (ins) from (dstArray) array by corresponding index, and increases (result++).
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { compareCallback } [ onEqual ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 4
 * var arr = _.arrayRemovedAll( [ 1, 2, 3, 4, 5, 5, 5 ], 5, function ( el, ins ) {
 *   return el < ins;
 * });
 *
 * @example
 * // returns 3
 * var arr = _.arrayRemovedAll( [ 1, 2, 3, 4, 5, 5, 5 ], 5 );
 *
 * @returns { Number } - Returns the amount of the removed elements.
 * @method arrayRemovedAll
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemovedAll( dstArray,ins,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 3 )
  _.assert( _.routineIs( onEqual ) );

  var result = 0;

  if( onEqual === undefined )
  onEqual = function( a,b ){ return a === b };

  for( var d = dstArray.length-1 ; d >= 0 ; d-- )
  if( onEqual( dstArray[ d ],ins ) )
  {
    dstArray.splice( d,1 );
    result += 1;
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
 * The arrayRemoveAll() method removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEqual) arguments,
 * checks if arguments passed two, it calls the method
 * [arrayRemovedAll( dstArray, ins )]{@link wTools.arrayRemovedAll}
 * Otherwise, if passed three arguments, it calls the method
 * [arrayRemovedAll( dstArray, ins, onEqual )]{@link wTools.arrayRemovedAll}
 *
 * @see wTools.arrayRemovedAll
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEqual ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 2, 2, 3, 5 ]
 * var arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2, function ( el, ins ) {
 *   return el < ins;
 * });
 *
 * @example
 * // returns [ 1, 3, 5 ]
 * var arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2 );
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @method arrayRemoveAll
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemoveAll( dstArray,ins,onEqual )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 )
  arrayRemovedAll( dstArray,ins );
  else if( arguments.length === 3 )
  arrayRemovedAll( dstArray,ins,onEqual );

  return dstArray;
}

//
  /**
   * The arrayReplaceOnce() method returns the index of the (dstArray) array which will be replaced by (sub),
   * if (dstArray) has the value (ins).
   *
   * It takes three arguments (dstArray, ins, sub), calls built in function (dstArray.indexOf(ins)),
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
   * @method arrayReplaceOnce
   * @throws { Error } Will throw an Error if (dstArray) is not an array.
   * @throws { Error } Will throw an Error if (arguments.length) is less than three.
   * @memberof wTools
   */

function arrayReplaceOnce( dstArray,ins,sub )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 3 );

  var index = -1;

  index = dstArray.indexOf( ins );

  if( index >= 0 )
  dstArray.splice( index,1,sub );

  return index;
}

//
  /**
   * The arrayUpdate() method adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
   * and returns the last added index or the last replaced index of the array (dstArray).
   *
   * It creates the variable (index) assigns and calls to it the function (arrayReplaceOnce( dstArray, ins, sub ).
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
   * var add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
   * console.log( add ) = > [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
   *
   * @example
   * // returns 5
   * var add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
   * console.log( add ) => [ 1, 2, 3, 4, 5, 6 ];
   *
   * @example
   * // returns 4
   * var replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
   * console.log( replace ) => [ true, true true, true, true ];
   *
   * @returns { number } Returns the last added or the last replaced index.
   * @method arrayUpdate
   * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
   * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
   * @memberof wTools
   */

function arrayUpdate( dstArray,ins,sub )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 3 );

  var index = arrayReplaceOnce( dstArray,ins,sub );

  if( index === -1 )
  {
    dstArray.push( sub );
    index = dstArray.length - 1;
  }

  return index;
}

//
  /**
   * The arrayAppendOnce() method adds at the end of an array (dst) a value (src),
   * if the array (dst) doesn't have the value (src).
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
   * @returns { Array } If an array (dst) doesn't have a value (src) it returns the updated array (dst) with the new length,
   * otherwise, it returns the original array (dst).
   * @method arrayAppendOnce
   * @throws { Error } Will throw an Error if (dst) is not an Array.
   * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
   * @memberof wTools
   */

function arrayAppendOnce( dst,ins,onElement )
{

  _.assert( _.arrayIs( dst ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( !onElement || _.routineIs( onElement ) );

  // if( !dst )
  // return [ ins ];

  var i;

  if( !onElement )
  i = dst.indexOf( ins );
  else
  {
    for( i = 0 ; i < dst.length ; i++ )
    if( onElement( dst[ i ],i,dst ) === ins )
    break;
    if( i === dst.length )
    i = -1;
  }

  if( i === -1 )
  {
    dst.push( ins );
    return dst.length-1;
  }

  return i;
}

//
  /**
   * The arrayPrependOnce() method adds at the beginning of an array (dst) a value (src),
   * if the array (dst) doesn't have the value (src).
   *
   * @param { Array } dst - The source array.
   * @param { * } src - The value to add.
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
   * @returns { Array } If an array (dst) doesn't have a value (src) it returns the updated array (dst) with the new length,
   * otherwise, it returns the original array (dst).
   * @method arrayPrependOnce
   * @throws { Error } Will throw an Error if (dst) is not an Array.
   * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
   * @memberof wTools
   */

function arrayPrependOnce( dst,src )
{

  _.assert( _.arrayIs( dst ) );
  _.assert( arguments.length === 2 );

  // if( !dst )
  // return [ src ];

  var i = dst.indexOf( src );

  if( i === -1 )
  {
    dst.unshift( src );
    return dst.length - 1;
  }

  return i;
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
 * If ( f ) < 0 - prepends some number of elements with value of argument( var ) to the result array.
 * @param { Array/Buffer } array - source array or buffer;
 * @param { Number } [ f = 0 ] - index of a first element to copy into new array;
 * @param { Number } [ l = array.length ] - index of a last element to copy into new array;
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * //Just partial copy of origin array
 * var arr = [ 1, 2, 3, 4 ]
 * var result = _.arrayGrow( arr, 0, 2 );
 * console.log( result );
 * //[ 1, 2 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * var arr = [ 1 ]
 * var result = _.arrayGrow( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * var arr = [ 1, 2, 3, 4, 5 ]
 * var result = _.arrayGrow( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * var arr = [ 1, 2, 3, 4, 5 ]
 * var result = _.arrayGrow( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * var arr = [ 1, 2, 3, 4, 5 ]
 * var result = _.arrayGrow( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * var buffer = new Buffer( '123' );
 * var result = _.arrayGrow( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns resized copy of a part of an original array.
 * @method arrayGrow
 * @throws { Error } Will throw an Error if( array ) is not a Array or Buffer.
 * @throws { Error } Will throw an Error if( f ) or ( l ) is not a Number.
 * @throws { Error } Will throw an Error if not enough arguments provided.
 * @memberof wTools
 */

function arrayGrow( array,f,l,val )
{
  _.assert( _.arrayLike( array ) );

  var result;
  var f = f !== undefined ? f : 0;
  var l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( l < f )
  l = f;

  if( _.bufferIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  /* */

  var lsrc = Math.min( array.length,l );
  for( var r = Math.max( f,0 ) ; r < lsrc ; r++ )
  result[ r-f ] = array[ r ];

  /* */

  if( val !== undefined )
  {
    for( var r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    for( var r = lsrc-f ; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  return result;
}

//

/**
 * Returns a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 *
 * If ( l ) is omitted or ( l ) > ( array.length ), arraySlice extracts through the end of the sequence ( array.length ).
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( f ) < 0, zero is assigned to begin index( f ).

 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 *
 * @example
 * _.arraySlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.arraySlice( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.arraySlice( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array.
 * @method arraySlice
 * @throws { Error } Will throw an Error if ( array ) is not an Array or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/

function arraySlice( array,f,l )
{
  _.assert( _.arrayLike( array ) );

  var result;
  var f = f !== undefined ? f : 0;
  var l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );

  if( f < 0 )
  f = 0;
  if( l > array.length )
  l = array.length;
  if( l < f )
  l = f;

  if( _.bufferIs( array ) )
  result = new array.constructor( l-f );
  else
  result = new Array( l-f );

  for( var r = f ; r < l ; r++ )
  result[ r-f ] = array[ r ];

  return result;
}

//

/* srcBuffer = _.arrayMultislice( [ originalBuffer,f ],[ originalBuffer,0,srcAttribute.atomsPerElement ] ); */

function arrayMultislice()
{
  var length = 0;

  if( arguments.length === 0 )
  return [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var src = arguments[ a ];
    var f = src[ 1 ];
    var l = src[ 2 ];

    _.assert( _.arrayLike( src ) && _.arrayLike( src[ 0 ] ),'expects array of array' );
    var f = f !== undefined ? f : 0;
    var l = l !== undefined ? l : src[ 0 ].length;
    if( l < f )
    l = f;

    _.assert( _.numberIs( f ) );
    _.assert( _.numberIs( l ) );

    src[ 1 ] = f;
    src[ 2 ] = l;

    length += l-f;

  }

  var result = new arguments[ 0 ][ 0 ].constructor( length );
  var r = 0;

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var src = arguments[ a ];
    var f = src[ 1 ];
    var l = src[ 2 ];

    for( var i = f ; i < l ; i++, r++ )
    result[ r ] = src[ 0 ][ i ];

  }

  return result;
}

//



// function arraySpliceArray( dstArray,srcArray,first,replace )
// {
//   debugger;
//
//   _.assert( arguments.length === 4 );
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.arrayIs( srcArray ) );
//   _.assert( _.numberIs( first ) );
//   _.assert( _.numberIs( replace ) );
//
//   var args = [ first,replace ];
//   args.push.apply( args,srcArray );
//
//   dstArray.splice.apply( dstArray,args );
//
//   return dstArray;
// }
//
// //
//
// function arraySplice( dstArray,first,replace,srcArray )
// {
//
//   _.assert( _.arrayIs( dstArray ) );
//   _.assert( _.arrayIs( srcArray ) );
//
//   var first = first !== undefined ? first : 0;
//   var replace = replace !== undefined ? replace : dstArray.length;
//   var result = dstArray.slice( first,first+replace );
//
//   var srcArray = srcArray.slice();
//   srcArray.unshift( replace );
//   srcArray.unshift( first );
//
//   dstArray.splice.apply( dstArray,srcArray );
//
//   return result;
// }

//

/**
 * Removes range( range ) of elements from provided array( dstArray ) and adds elements from array( srcArray )
 * at the start position of provided range( range ) if( srcArray ) was provided.
 * On success returns array with deleted element(s), otherwise returns empty array.
 *
 * @param { Array } dstArray - The target array.
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
 * var dst = [ 1, 2, 3, 4 ];
 * _.arrayCutin( dst, [ 0, 3 ], [ 0, 0, 0 ] );
 * console.log( dst );
 * // returns [ 0, 0, 0, 4 ]
 *
 * @returns { Array } Returns array with deleted element(s), otherwise returns empty array.
 * @method arrayCutin
 * @throws { Error } If ( arguments.length ) is not equal to two or three.
 * @throws { Error } If ( dstArray ) is not an Array.
 * @throws { Error } If ( srcArray ) is not an Array.
 * @throws { Error } If ( range ) is not an Array.
 * @memberof wTools
 */

// function arrayCutin( dstArray,first,replace,srcArray )
function arrayCutin( dstArray,range,srcArray )
{

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  var first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  var last = range[ 1 ] !== undefined ? range[ 1 ] : 0;

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.arrayIs( range ) );
  _.assert( srcArray === undefined || _.arrayIs( srcArray ) );

  var length = dstArray.length || dstArray.byteLength;

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  var args = srcArray ? srcArray.slice() : [];
  args.unshift( last-first );
  args.unshift( first );

  if( _.bufferAnyIs( dstArray ) )
  {
    if( first === last )
    return dstArray;

    var newLength = length - args[ 1 ];
    var srcArrayLength = 0;

    if( srcArray )
    {
      srcArrayLength = srcArray.length || srcArray.byteLength;
      newLength += srcArrayLength;
    }

    if( _.bufferRawIs( dstArray ) )
    {
      var result = new ArrayBuffer( newLength );
      // length = dstArray.byteLength;
    }
    else if( _.bufferNodeIs( dstArray ) )
    {
      var result = new Buffer( newLength );
      // length = dstArray.byteLength;
    }
    else
    var result = arrayNew( dstArray, newLength );

    if( first > 0 )
    for( var i = 0; i < first; ++i )
    result[ i ] = dstArray[ i ];

    if( srcArray )
    for( var i = first, j = 0; j < srcArrayLength; )
    result[ i++ ] = srcArray[ j++ ];

    for( var j = last, i = first + srcArrayLength; j < length; )
    result[ i++ ] = dstArray[ j++ ];

    return result;
  }
  else
  var result = dstArray.splice.apply( dstArray,args );

  return result;
}

//

/**
 * The arrayAs() method copies passed argument to the array.
 *
 * @param { * } src - The source value.
 *
 * @example
 * // returns [ false ]
 * var arr = _.arrayAs( false );
 *
 * @example
 * // returns [ { a : 1, b : 2 } ]
 * var arr = _.arrayAs( { a : 1, b : 2 } );
 *
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
 * Otherwise return an array which contains the element from argument.
 * @method arrayAs
 * @memberof wTools
 */

function arrayAs( src )
{

  if( src === null || src === undefined ) return [];
  else if( _.arrayIs( src ) ) return src;
  else return [ src ];

}

//

function arrayUniqueIs( o )
{

  if( _.arrayLike( o ) )
  o = { src : o };

  _.assert( arguments.length === 1 );
  _.assert( _.arrayLike( o.src ) );
  _.assertMapHasOnly( o,arrayUniqueIs.defaults );

  /**/

  if( o.onElement )
  {
    throw _.err( 'not tested' );
    o.src = _.enityMap( o.src,function( e ){ return o.onElement( e ) } );
  }

  /**/

  var number = o.src.length;
  var isUnique = _.arrayNew( o.src );
  var index;

  for( var i = 0 ; i < o.src.length ; i++ )
  isUnique[ i ] = 1;

  for( var i = 0 ; i < o.src.length ; i++ )
  {

    index = i;

    if( !isUnique[ i ] )
    continue;

    var currentUnique = 1;
    do
    {
      var index = o.src.indexOf( o.src[ i ],index+1 );
      if( index !== -1 )
      {
        isUnique[ index ] = 0;
        number -= 1;
        currentUnique = 0;
      }
    }
    while( index !== -1 );

    if( !o.includeFirst )
    if( !currentUnique )
    {
      isUnique[ i ] = 0;
      number -= 1;
    }

  }

  return { number : number, array : isUnique };
}

arrayUniqueIs.defaults =
{
  src : null,
  onElement : null,
  includeFirst : 0,
}

//

function arrayUnique( src,onElement )
{

  var isUnique = arrayUniqueIs
  ({
    src : src,
    onElement : onElement,
    includeFirst : 1,
  });
  var result = arrayNew( src,isUnique.number );

  var c = 0;
  for( var i = 0 ; i < src.length ; i++ )
  if( isUnique.array[ i ] )
  {
    result[ c ] = src[ i ];
    c += 1;
  }

  return result;
}

//

/**
 * The arrayToStr() method joins an array (src) and returns one string containing each array element separated by space,
 * only types of integer or floating point.
 *
 * @param { arrayLike } src - The source array.
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
 * @method arrayToStr
 * @throws { Error } Will throw an Error If (options.type) is not the number or float.
 * @memberof wTools
 */

function arrayToStr( src,options )
{

  var result = '';
  var options = options || Object.create( null );

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
    throw Error( '_.arrayToStr : not tested' );
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }

  return result;
}

//

/**
 * The arrayPut() method puts all values of (arguments[]) after the second argument to the (dstArray)
 * in the position (dstOffset) and changes values of the following index.
 *
 * @param { arrayLike } dstArray - The source array.
 * @param { Number } [ dstOffset = 0 ] dstOffset - The index of element where need to put the new values.
 * @param {*} arguments[] - One or more argument(s).
 * If the (argument) is an array it iterates over array and adds each element to the next (dstOffset++) index of the (dstArray).
 * Otherwise, it adds each (argument) to the next (dstOffset++) index of the (dstArray).
 *
 * @example
 * // returns [ 1, 2, 'str', true, 7, 8, 9 ]
 * var arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
 *
 * @example
 * // returns [ 'str', true, 7, 8, 5, 6, 9 ]
 * var arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
 *
 * @returns { arrayLike } - Returns an array containing the changed values.
 * @method arrayPut
 * @throws { Error } Will throw an Error if (arguments.length) is less than one.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstOffset) is not a Number.
 * @memberof wTools
 */

function arrayPut( dstArray, dstOffset )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayLike( dstArray ) );
  _.assert( _.numberIs( dstOffset ) );

  dstOffset = dstOffset || 0;

  for( var a = 2 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];
    var aIs = _.arrayIs( argument ) || _.bufferIs( argument );

    if( aIs && _.bufferIs( dstArray ) )
    {
      dstArray.set( argument,dstOffset );
      dstOffset += argument.length;
    }
    else if( aIs )
    for( var i = 0 ; i < argument.length ; i++ )
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
   * The arrayMask() method returns a new instance of array that contains the certain value(s) from array (srcArray),
   * if an array (mask) contains the truth-value(s).
   *
   * The arrayMask() method checks, how much an array (mask) contain the truth value(s),
   * and from that amount of truth values it builds a new array, that contains the certain value(s) of an array (srcArray),
   * by corresponding index(es) (the truth value(s)) of the array (mask).
   * If amount is equal 0, it returns an empty array.
   *
   * @param { arrayLike } srcArray - The source array.
   * @param { arrayLike } mask - The target array.
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
   * @returns { arrayLike } Returns a new instance of array that contains the certain value(s) from array (srcArray),
   * if an array (mask) contains the truth-value(s).
   * If (mask) contains all falsy values, it returns an empty array.
   * Otherwise, it returns a new array with certain value(s) of an array (srcArray).
   * @method arrayMask
   * @throws { Error } Will throw an Error if (arguments.length) is less or more that two.
   * @throws { Error } Will throw an Error if (srcArray) is not an array-like.
   * @throws { Error } Will throw an Error if (mask) is not an array-like.
   * @throws { Error } Will throw an Error if length of both (srcArray and mask) is not equal.
   * @memberof wTools
   */

function arrayMask( srcArray, mask )
{

  _.assert( arguments.length === 2 );
  _.assert( _.arrayLike( srcArray ),'arrayMask :','expects array-like as srcArray' );
  _.assert( _.arrayLike( mask ),'arrayMask :','expects array-like as mask' );

  var atomsPerElement = mask.length;
  var length = srcArray.length / atomsPerElement;
  if( Math.floor( length ) !== length )
  throw _.err( 'arrayMask :','expects mask that has component for each atom of srcArray',_.toStr({ 'atomsPerElement' : atomsPerElement, 'srcArray.length' : srcArray.length  }) );

  var preserve = 0;
  for( var m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  preserve += 1;

  var dstArray = new srcArray.constructor( length*preserve );

  if( !preserve )
  return dstArray;

  var c = 0;
  for( var i = 0 ; i < length ; i++ )
  for( var m = 0 ; m < mask.length ; m++ )
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

  _.assertMapHasOnly( o,arrayUnmask.defaults );
  _.assert( _.arrayLike( o.src ),'arrayUnmask : expects o.src as ArrayLike' );

  debugger;

  var atomsPerElement = o.mask.length;

  var atomsPerElementPreserved = 0;
  for( var m = 0 ; m < o.mask.length ; m++ )
  if( o.mask[ m ] )
  atomsPerElementPreserved += 1;

  var length = o.src.length / atomsPerElementPreserved;
  if( Math.floor( length ) !== length )
  throw _.err( 'arrayMask :','expects mask that has component for each atom of o.src',_.toStr({ 'atomsPerElementPreserved' : atomsPerElementPreserved, 'o.src.length' : o.src.length  }) );

  var dstArray = new o.src.constructor( atomsPerElement*length );

  var e = [];
  for( var i = 0 ; i < length ; i++ )
  {

    for( var m = 0, p = 0 ; m < o.mask.length ; m++ )
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
    o.onEach( e,i );

    for( var m = 0 ; m < o.mask.length ; m++ )
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

/**
 * The arrayDuplicate() method returns an array with duplicate values of a certain number of times.
 *
 * @param { objectLike } [ o = {  } ] o - The set of arguments.
 * @param { arrayLike } o.src - The given initial array.
 * @param { arrayLike } o.result - To collect all data.
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
 * var options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 2,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, {} );
 *
 * @example
 * // returns [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ]
 * var options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 3,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, { a : 7, b : 13 } );
 *
 * @returns { Array } Returns an array with duplicate values of a certain number of times.
 * @method arrayDuplicate
 * @throws { Error } Will throw an Error if ( o ) is not an objectLike.
 * @memberof wTools
 */

function arrayDuplicate( o )
{

  if( arguments.length === 2 )
  {
    o = { src : arguments[ 0 ], numberOfDuplicatesPerElement : arguments[ 0 ] };
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIs( o.numberOfDuplicatesPerElement ) || o.numberOfDuplicatesPerElement === undefined );
  _.routineOptions( arrayDuplicate,o );
  _.assert( _.numberIsInt( o.src.length / o.numberOfAtomsPerElement ) );

  if( o.numberOfDuplicatesPerElement === 1 )
  {
    if( o.result )
    throw _.err( 'not implemented' );
    o.result = o.src;
    return o.result;
  }

  var length = o.src.length * o.numberOfDuplicatesPerElement;
  var numberOfElements = o.src.length / o.numberOfAtomsPerElement;
  o.result = o.result || arrayNew( o.src,length );

  for( var c = 0, cl = numberOfElements ; c < cl ; c++ )
  {

    for( var d = 0, dl = o.numberOfDuplicatesPerElement ; d < dl ; d++ )
    {

      for( var e = 0, el = o.numberOfAtomsPerElement ; e < el ; e++ )
      {
        var indexDst = c*o.numberOfAtomsPerElement*o.numberOfDuplicatesPerElement + d*o.numberOfAtomsPerElement + e;
        var indexSrc = c*o.numberOfAtomsPerElement+e;
        o.result[ indexDst ] = o.src[ indexSrc ];
      }

    }

  }

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
 * The arrayFill() method fills all the elements of the given or a new array from the 0 index to an (options.times) index
 * with a static value.
 *
 * @param { ( Object | Number | Array ) } o - The options to fill the array.
 * @param { Number } [ o.times = result.length ] o.times - The count of repeats.
   If in the function passed an Array, the times will be equal the length of the array. If Number than this value.
 * @param { Number } [ o.value = 0 ] - The value for the filling.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3 ]
 * var arr = _.arrayFill( { times : 5, value : 3 } );
 *
 * @example
 * // returns [ 0, 0, 0, 0 ]
 * var arr = _.arrayFill( 4 );
 *
 * @example
 * // returns [ 0, 0, 0 ]
 * var arr = _.arrayFill( [ 1, 2, 3 ] );
 *
 * @returns { Array } - Returns an array filled with a static value.
 * @method arrayFill
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If passed argument is not an object.
 * @throws { Error } If the last element of the (o.result) is not equal to the (o.value).
 * @memberof wTools
 */

function arrayFill( o )
{

  if( arguments.length === 1 )
  {
    if( _.numberIs( o ) )
    o = { times : o };
    else if( _.arrayIs( o ) )
    o = { result : o };
  }
  else
  {
    o = { result : arguments[ 0 ], value : arguments[ 1 ] };
  }

  _assert( arguments.length === 1 || arguments.length === 2 );
  _.assertMapHasOnly( o,arrayFill.defaults );
  _assert( _.objectIs( o ) || _.numberIs( o ) || _.arrayIs( o ),'arrayFill :','"o" must be object' );

  var result = o.result || [];
  var times = o.times !== undefined ? o.times : result.length;
  var value = o.value !== undefined ? o.value : 0;

  if( _.routineIs( result.fill ) )
  {
    if( result.length < times )
    result.length = times;
    result.fill( value,0,times );
  }
  else
  {
    for( var t = 0 ; t < times ; t++ )
    result[ t ] = value;
  }

  _assert( result[ times-1 ] === value );
  return result;
}

arrayFill.defaults =
{
  result : null,
  times : null,
  value : null,
}

/**
 * The arrayCompare() method returns the first difference between the values of the first array from the second.
 *
 * @param { arrayLike } src1 - The first array.
 * @param { arrayLike } src2 - The second array.
 *
 * @example
 * // returns 3
 * var arr = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @method arrayCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */

function arrayCompare( src1,src2 )
{
  _.assert( arguments.length === 2 );
  _.assert( _.arrayLike( src1 ) && _.arrayLike( src2 ) );
  _.assert( src2.length >= src1.length );

  var result = 0;

  for( var s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] - src2[ s ];
    if( result !== 0 ) return result;

  }

  return result;
}

//

/**
 * The arrayIdentical() method checks the equality of two arrays.
 *
 * @param { arrayLike } src1 - The first array.
 * @param { arrayLike } src2 - The second array.
 *
 * @example
 * // returns true
 * var arr = _.arrayIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @method arrayIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function arrayIdentical( src1,src2 )
{
  _.assert( arguments.length === 2 );
  _.assert( _.arrayLike( src1 ) );
  _.assert( _.arrayLike( src2 ) );

  var result = true;

  if( src1.length !== src2.length )
  return false;

  for( var s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] === src2[ s ];

    if( result === false )
    return false;

  }

  return result;
}

//

function arraySameSet( src1,src2 )
{
  if( src1.length !== src2.length ) return false;
  var src = src1.slice();
  var nil = Object.create( null );

  for( var s = 0 ; s < src2.length ; s++ )
  {
    var i = src.indexOf( src2[ s ] );
    if( i === -1 )
    return false;
    src[ i ] = nil;
  }

  return true;
}

//

/**
 * The arrayLeftIndexOf() method returns the index of the first matching (ins) element in a array (arr)
 * that corresponds to the condition in the callback function.
 *
 * It iterates over an array (arr) from the left to the right,
 * and checks by callback function (equalizer(arr[a], ins)).
 * If callback function returns true, it returns corresponding index.
 * Otherwise, it returns -1.
 *
 * @param { arrayLike } arr - The target array.
 * @param { * } ins - The value to compare.
 * @param { wTools~compareCallback } [equalizer] equalizer - A callback function.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayLeftIndexOf( [ 1, 2, 3 ], 1 );
 *
 * @example
 * // returns -1
 * _.arrayLeftIndexOf( [ 1, 2, 3 ], 4 );
 *
 * @example
 * // returns 3
 * _.arrayLeftIndexOf( [ 1, 2, 3, 4 ], 3, function( el, ins ) { return el > ins } );
 *
 * @example
 * // returns 3
 * _.arrayLeftIndexOf( 'abcdef', 'd' );
 *
 * @example
 * // returns 2
 * function arr() {
 *   return arguments;
 * }( 3, 7, 13 );
 * _.arrayLeftIndexOf( arr, 13 );
 *
 * @returns { Number } Returns the corresponding index, if a callback function (equalizer) returns true.
 * Otherwise, it returns -1.
 * @method arrayLeftIndexOf
 * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 2 or 3.
 * @throws { Error } Will throw an Error if (equalizer.length) is not equal to the 1 or 2.
 * @throws { Error } Will throw an Error if (equalizer) is not a Function.
 * @memberof wTools
 */

function arrayLeftIndexOf( arr,ins,equalizer )
{

  if( !equalizer )
  {
    if( ins === undefined )
    {
      ins = true;
      equalizer = function( a ){ return !!a; };
    }
    else
    {
      equalizer = function( a ){ return a; };
    }
  }

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( equalizer.length === 1 || equalizer.length === 2 );
  _.assert( _.routineIs( equalizer ) );

  if( equalizer.length === 2 )
  for( var a = 0 ; a < arr.length ; a++ )
  {

    if( equalizer( arr[ a ],ins ) )
    return a;

  }
  else
  {

    for( var a = 0 ; a < arr.length ; a++ )
    {

      if( equalizer( arr[ a ] ) === ins )
      return a;

    }

  }

  return -1;
}

//

function arrayRightIndexOf( arr,ins,equalizer )
{

  if( !equalizer )
  {
    if( ins === undefined )
    {
      ins = true;
      equalizer = function( a ){ return !!a; };
    }
    else
    {
      equalizer = function( a ){ return a; };
    }
  }

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( equalizer.length === 1 || equalizer.length === 2 );

  if( equalizer.length === 2 )
  for( var a = arr.length-1 ; a >= 0 ; a-- )
  {

    if( equalizer( arr[ a ],ins ) )
    return a;

  }
  else
  {

    for( var a = arr.length-1 ; a >= 0 ; a-- )
    {

      if( equalizer( arr[ a ] ) === ins )
      return a;

    }

  }

  return -1;
}

//

/**
 * The arrayLeft() method returns a new object containing the properties, (index, element),
 * corresponding to a found value (ins) from an array (arr).
 *
 * It creates the variable (i), assigns and calls to it the function (_.arrayLeftIndexOf( arr, ins, equalizer )),
 * that returns the index of the value (ins) in the array (arr).
 * [wTools.arrayLeftIndexOf()]{@link wTools.arrayLeftIndexOf}
 * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
 * Otherwise, it returns the empty object.
 *
 * @see {@link wTools.arrayLeftIndexOf} - See for more information.
 *
 * @param { arrayLike } arr - Entity to check.
 * @param { * } ins - Element to locate in the array.
 * @param { wTools~compareCallback } equalizer - A callback function.
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
 * @method arrayLeft
 * @throws { Error } Will throw an Error if (equalizer) is not a Function.
 * @memberof wTools
 */

function arrayLeft( arr,ins,equalizer )
{
  var result = Object.create( null );
  var i = _.arrayLeftIndexOf( arr,ins,equalizer );

  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( i >= 0 )
  {
    result.index = i;
    result.element = arr[ i ];
  }

  return result;
}

//

function arrayRight( arr,ins,equalizer )
{
  var result = Object.create( null );
  var i = _.arrayRightIndexOf( arr,ins,equalizer );

  _.assert( arguments.length === 2 || arguments.length === 3 );

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

  _.assert( arguments.length === 1 );

  return _.arrayLeft( arr,true,function( e ){ return e !== undefined; } );
}

//

function arrayRightDefined( arr )
{

  _.assert( arguments.length === 1 );

  return _.arrayRight( arr,true,function( e ){ return e !== undefined; } );
}

//

/**
 * The arrayHasAny() method checks if the (src) array has at least one value of the following arguments.
 *
 * It iterates over array-like (arguments[]) copies each argument to the array (ins) by the method
 * [arrayAs()]{@link wTools.arrayAs}
 * Checks, if (src) array has at least one value of the (ins) array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayAs} - See for more information.
 *
 * @param { arrayLike } src - The source array.
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns true
 * var arr = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
 *
 * @returns { Boolean } - Returns true, if (src) has at least one value of the following argument(s), otherwise false is returned.
 * @method arrayHasAny
 * @throws { Error } If the first argument in not an array.
 * @memberof wTools
 */

function arrayHasAny( src )
{
  _assert( _.arrayIs( src ) || _.bufferIs( src ),'arrayHasAny :','array expected' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    var ins = _.arrayAs( arguments[ a ] );

    for( var i = 0 ; i < ins.length ; i++ )
    if( src.indexOf( ins[ i ] ) !== -1 )
    return true;

  }

  return false;
}

//

/**
 * The arrayCount() method returns the count of matched elements in the (src) array.
 *
 * @param { Array } src - The source array.
 * @param { * } instance - The value to search.
 *
 * @example
 * // returns 2
 * var arr = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
 *
 * @returns { Number } - Returns the count of matched elements in the (src).
 * @method arrayCount
 * @throws { Error } If passed arguments is less than two or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @memberof wTools
 */

function arrayCount( src,instance )
{
  var result = 0;

  _assert( arguments.length === 2 );
  _assert( _.arrayLike( src ),'arrayCount :','expects ArrayLike' );

  var index = src.indexOf( instance );
  while( index !== -1 )
  {
    result += 1;
    index = src.indexOf( instance,index+1 );
  }

  return result;
}

//
  /**
   * The arrayCountSame() method returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array (src).
   *
   * @param { arrayLike } src - The source array.
   * @param { Function } [ onElement = function( e ) { return e } ] - A callback function.
   *
   * @example
   * // returns 3
   * _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
   *
   * @example
   * // returns 0
   * _.arrayCountSame( [ 1, 2, 3, 4, 5 ] );
   *
   * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array (src).
   * @method arrayCountSame
   * @throws { Error } If passed arguments is less than one or more than two.
   * @throws { Error } If the first argument is not an array-like object.
   * @throws { Error } If the second argument is not a Function.
   * @memberof wTools
   */

function arrayCountSame( src,onElement )
{
  var result = 0;
  var found = [];
  var onElement = onElement || function( e ){ return e };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.arrayLike( src ),'arrayCountSame :','expects ArrayLike' );
  _.assert( _.routineIs( onElement ) );
  _.assert( onElement.length === 1 );

  for( var i1 = 0 ; i1 < src.length ; i1++ )
  {
    var element1 = onElement( src[ i1 ] );
    if( found.indexOf( element1 ) !== -1 )
    continue;

    for( var i2 = i1+1 ; i2 < src.length ; i2++ )
    {

      var element2 = onElement( src[ i2 ] );
      if( found.indexOf( element2 ) !== -1 )
      continue;

      if( element1 === element2 )
      found.push( element1 );

    }

  }

  return found.length;
}

//
  /**
   * The arraySum() method returns the sum of an array (src).
   *
   * @param { arrayLike } src - The source array.
   * @param { Function } [ onElement = function( e ) { return e } ] - A callback function.
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
   * @returns { Number } - Returns the sum of an array (src).
   * @method arraySum
   * @throws { Error } If passed arguments is less than one or more than two.
   * @throws { Error } If the first argument is not an array-like object.
   * @throws { Error } If the second argument is not a Function.
   * @memberof wTools
   */


function arraySum( src,onElement )
{
  var result = 0;

  _assert( arguments.length === 1 || arguments.length === 2 );
  _assert( _.arrayLike( src ),'arraySum :','expects ArrayLike' );

  if( onElement === undefined )
  onElement = function( e ){ return e; };

  _.assert( _.routineIs( onElement ) );

  for( var i = 0 ; i < src.length ; i++ )
  {
    result += onElement( src[ i ],i,src );
  }

  return result;
}

//

  /**
   * The arraySupplement() method returns an array (dstArray), that contains values from following arrays only type of numbers.
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
   * @param { arrayLike } dstArray - The initial array.
   * @param { ...arrayLike } arguments[...] - The following array(s).
   *
   * @example
   * // returns [ 4, 5, 33, 13, 9, 7 ]
   * _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
   *
   * @example
   * // returns [ 4, 5, 33, 13, undefined, 7 ];
   * _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
   *
   * @example
   * // returns [ 6, 7, 33, 13, 9, 7 ];
   * _.arraySupplement( [ 'a', 'b' ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
   *
   * @returns { arrayLike } - Returns an array that contains values only type of numbers.
   * @method arraySupplement
   * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is/are not the array-like.
   * @memberof wTools
   */

function arraySupplement( dstArray )
{
  var result = dstArray;
  if( result === null )
  result = [];

  var length = result.length;
  _assert( _.arrayLike( result ) || _.numberIs( result ),'expects object as argument' );

  for( a = arguments.length-1 ; a >= 1 ; a-- )
  {
    _assert( _.arrayLike( arguments[ a ] ),'argument is not defined :',a );
    length = Math.max( length,arguments[ a ].length );
  }

  if( _.numberIs( result ) )
  result = arrayFill
  ({
    value : result,
    times : length,
  });

  for( var k = 0 ; k < length ; k++ )
  {

    if( k in dstArray && isFinite( dstArray[ k ] ) )
    continue;

    var a;
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
   * The arrayExtendScreening() method iterates over (arguments[...]) from the right to the left (arguments[1]),
   * and returns a (dstArray) containing the values of the following arrays,
   * if the following arrays contains the indexes of the (screenArray).
   *
   * @param { arrayLike } screenArray - The source array.
   * @param { arrayLike } dstArray - To add the values from the following arrays,
   * if the following arrays contains indexes of the (screenArray).
   * If (dstArray) contains values, the certain values will be replaced.
   * @param { ...arrayLike } arguments[...] - The following arrays.
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
   * @returns { arrayLike } Returns a (dstArray) containing the values of the following arrays,
   * if the following arrays contains the indexes of the (screenArray).
   * If (screenArray) is empty, it returns a (dstArray).
   * If (dstArray) is equal to the null, it creates a new array,
   * and returns the corresponding values of the following arrays by the indexes of a (screenArray).
   * @method arrayExtendScreening
   * @throws { Error } Will throw an Error if (screenArray) is not an array-like.
   * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is/are not an array-like.
   * @memberof wTools
   */

function arrayExtendScreening( screenArray,dstArray )
{
  var result = dstArray;
  if( result === null ) result = [];

  _assert( _.arrayLike( screenArray ),'expects object as screenArray' );
  _assert( _.arrayLike( result ),'expects object as argument' );
  for( a = arguments.length-1 ; a >= 2 ; a-- )
  _assert( arguments[ a ],'argument is not defined :',a );

  for( var k = 0 ; k < screenArray.length ; k++ )
  {

    if( screenArray[ k ] === undefined )
    continue;

    var a;
    for( a = arguments.length-1 ; a >= 2 ; a-- )
    if( k in arguments[ a ] ) break;
    if( a === 1 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

function arrayShuffle( dst,times )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.arrayLike( dst ) );

  if( times === undefined )
  times = dst.length;

  var l = dst.length;
  var e1,e2;
  for( var t1 = 0 ; t1 < times ; t1++ )
  {
    var t2 = Math.floor( Math.random() * l );
    e1 = dst[ t1 ];
    e2 = dst[ t2 ];
    dst[ t1 ] = e2;
    dst[ t2 ] = e1;
  }

  return dst;
}

//

/**
 * The arrayRandom() method returns an array which contains random numbers.
 *
 * @param { Object } o - The options for getting random numbers.
 * @param { Number } o.length - The length of an array.
 * @param { Array } [ o.range = [ 0, 1 ] ] - The range of numbers.
 * @param { Boolean } [ o.int = false ] - Floating point numbers or not.
 *
 * @example
 * // returns [ 6, 2, 4, 7, 8 ]
 * var arr = _.arrayRandom( {
 *   length : 5,
 *   range : [ 1, 9 ],
 *   int : true
 * } );
 *
 * @returns { Array } - Returns an array of random numbers.
 * @method arrayRandom
 * @memberof wTools
 */

function arrayRandom( o )
{
  var result = [];

  if( _.numberIs( o ) )
  {
    o = { length : o };
  }

  _.assert( arguments.length === 1 );
  _.routineOptions( arrayRandom,o );

  debugger;

  // if( o.int === undefined )
  // o.int = false;
  //
  // if( o.range === undefined )
  // o.range = [ 0,1 ];

  for( var i = 0 ; i < o.length ; i++ )
  {
    result[ i ] = o.range[ 0 ] + Math.random()*( o.range[ 1 ] - o.range[ 0 ] );
    if( o.int )
    result[ i ] = Math.floor( result[ i ] );
  }

  return result;
}

arrayRandom.defaults =
{
  int : 0,
  range : [ 0,1 ],
}

//

/**
 * The arrayRange() method generate array of arithmetic progression series,
 * from the range[ 0 ] to the range[ 1 ] with increment 1.
 *
 * It iterates over loop from (range[0]) to the (range[ 1 ] - range[ 0 ]),
 * and assigns to the each index of the (result) array (range[ 0 ] + 1).
 *
 * @param { arrayLike } range - The first (range[ 0 ]) and the last (range[ 1 ] - range[ 0 ]) elements of the progression.
 *
 * @example
 * // returns [ 1, 2, 3, 4 ]
 * var range = _.arrayRange( [ 1, 5 ] );
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * var range = _.arrayRange( 5 );
 *
 * @returns { array } Returns an array of numbers for the requested range with increment 1.
 * May be an empty array if adding the step would not converge toward the end value.
 * @method arrayRange
 * @throws { Error } If passed arguments is less than one or more than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the length of the (range) is not equal to the two.
 * @memberof wTools
 */

function arrayRange( range )
{

  if( _.numberIs( range ) )
  range = [ 0,range ];

  _.assert( arguments.length === 1 );
  _.assert( _.arrayLike( range ) );
  _.assert( range.length === 2 );

  var result = [];
  var first = range[ 0 ];
  var len = range[ 1 ] - range[ 0 ];

  for( var i = 0 ; i < len ; i++ )
  result[ i ] = first + i;

  return result;
}

// --
// array set
// --

function arraySetIntersection( src )
{
  var result = [];

  _.assert( _.arrayLike( src ) );

  for( var i = 0 ; i < src.length ; i++ )
  {

    for( var a = 1 ; a < arguments.length ; a++ )
    {

      _.assert( _.arrayLike( arguments[ a ] ) );

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        break;
      }
    }

    if( a === arguments.length )
    result.push( src[ i ] );

  }

  return result;
}

//
/*
function arraySetContainAll( src )
{
  var result = [];

  _.assert( _.arrayLike( src ) );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.arrayLike( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( var i = 0 ; i < src.length ; i++ )
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
   * The arraySetContainAll() method returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the (src) array.
   *
   * @param { arrayLike } src - The source array.
   * @param { ...arrayLike } arguments[...] - The target array.
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
   * contains all the same values as in the (src) array.
   * If length of the (src) is more than the next argument, it returns false.
   * Otherwise, it returns false.
   * @method arraySetContainAll
   * @throws { Error } Will throw an Error if (src) is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
   * @memberof wTools
   */

function arraySetContainAll( src )
{
  _.assert( _.arrayLike( src ) );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.arrayLike( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( var i = 0 ; i < src.length ; i++ )
    {

      if( arguments[ a ].indexOf( src[ i ] ) === -1 )
      return false;

    }

  }

  return true;
}

//

/**
 * The arraySetContainSomething() method returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from (src).
 *
 * @param { arrayLike } src - The source array.
 * @param { ...arrayLike } arguments[...] - The target array.
 *
 * @example
 * // returns true
 * _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
 *
 * @example
 * // returns true
 * _.arraySetContainSomething( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
 *
 * @example
 * // returns false
 * _.arraySetContainSomething( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
 *
 * @returns { Boolean } Returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from (src).
 * Otherwise, it returns false.
 * @method arraySetContainSomething
 * @throws { Error } Will throw an Error if (src) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
 * @memberof wTools
 */

function arraySetContainSomething( src )
{
  _.assert( _.arrayLike( src ) );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.arrayLike( arguments[ a ] ) );

    for( var i = 0 ; i < src.length ; i++ )
    {

      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        return true;
      }

    }

  }

  return false;
}

// --
// array constructor
// --

// function _makeArrayOfLength( length )
// {
//   if( length === undefined )
//   length = 0;
//
//   var result = new this.ArrayType( length );
//
//   return result;
// }
//
// //
//
// function _makeArrayOfLengthZeroed( length )
// {
//   if( length === undefined )
//   length = 0;
//
//   var result = new this.ArrayType( length );
//
//   if( this.ArrayType === Array )
//   for( var i = 0 ; i < length ; i++ )
//   result[ i ] = 0;
//
//   return result;
// }

// --
// map
// --

/**
 * @callback mapClone~onCopyField
 * @param { objectLike } dstContainer - destination object.
 * @param { objectLike } srcContainer - source object.
 * @param { string } key - key to coping from one object to another.
 * @param { function } onCopyField - handler of fields.
 */

/**
 * The mapClone() method is used to clone the values of all
 * enumerable own properties from (srcObject) object to an (options.dst) object.
 *
 * It creates two variables:
 * var options = options || {}, result = options.dst || {}.
 * Iterate over (srcObject) object, checks if (srcObject) object has own properties.
 * If true, it calls the provided callback function ( options.onCopyField( result, srcObject, k ) ) for each key (k),
 * and copies each [ key, value ] of the (srcObject) to the (result),
 * and after cycle, returns clone with prototype of srcObject.
 *
 * @param { objectLike } srcObject - The source object.
 * @param { Object } o - The options.
 * @param { objectLike } [options.dst = Object.create( null )] - The target object.
 * @param { mapClone~onCopyField } [options.onCopyField()] - The callback function to copy each [ key, value ]
 * of the (srcObject) to the (result).
 *
 * @example
 * // returns Example { sex : 'Male', name : 'Peter', age : 27 }
 * function Example() {
 *   this.name = 'Peter';
 *   this.age = 27;
 * }
 * mapClone( new Example(), { dst : { sex : 'Male' } } );
 *
 * @returns { objectLike }  The (result) object gets returned.
 * @method mapClone
 * @throws { Error } Will throw an Error if ( o ) is not an Object,
 * if ( arguments.length > 2 ), if (key) is not a String or
 * if (srcObject) has not own properties.
 * @memberof wTools
 */

function mapClone( srcObject,o )
{
  var o = o || Object.create( null );
  var result = o.dst || Object.create( null );

  _assert( _.mapIs( o ) );
  _assert( arguments.length <= 2,'mapClone :','expects srcObject as argument' );
  _assert( objectLike( srcObject ),'mapClone :','expects srcObject as argument' );

  if( !o.onCopyField )
  o.onCopyField = function( dstContainer,srcContainer,key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  }

  for( var k in srcObject )
  {
    if( _ObjectHasOwnProperty.call( srcObject,k ) )
    o.onCopyField( result,srcObject,k,o.onCopyField );
  }

  Object.setPrototypeOf( result, Object.getPrototypeOf( srcObject ) );

  return result;
}

  // /**
  //  * @callback _.filter.dstNotHas()
  //  * @param { objectLike } dstObject - The target object.
  //  * @param { objectLike } argument - The next object.
  //  * @param { string } key - The key of the (argument) object.
  //  */

  /**
   * The mapExtendFiltering() creates a new [ key, value ]
   * from the next objects if callback function (filter) returns true.
   *
   * It calls a provided callback function (filter) once for each key in an (argument),
   * and adds to the (srcObject) all the [ key, value ] for which callback
   * function (filter) returns true.
   *
   * @param { function } filter - The callback function to test each [ key, value ]
   * of the (dstObject) object.
   * @param { objectLike } dstObject - The target object.
   * @param { ...objectLike } arguments[] - The next object.
   *
   * @example
   * // returns { a : 1, b : 2, c : 3 }
   * _.mapExtendFiltering( _.filter.dstNotHas(), { a : 1, b : 2 }, { a : 1 , c : 3 } );
   *
   * @returns { objectLike } Returns the unique [ key, value ].
   * @method mapExtendFiltering
   * @throws { Error } Will throw an Error if ( arguments.length < 3 ), (filter)
   * is not a Function, (result) and (argument) are not the objects.
   * @memberof wTools
   */

function mapExtendFiltering( filter,dstObject )
{
  var result = dstObject;
  var filter = _.filter.makeMapper( filter );

  if( result === null ) result = Object.create( null );

  _assert( arguments.length >= 3,'expects more arguments' );
  _assert( _.routineIs( filter ),'expects filter' );
  _assert( _.objectLike( result ),'expects objectLike as argument' );

  for( var a = 2 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];

    _.assert( !_.atomicIs( argument ),'mapExtendFiltering : expects object-like entity to extend, but got :',_.strTypeOf( argument ) );

    for( var k in argument )
    {

      filter.call( this,dstObject,argument,k );

    }

  }

  return result;
}

//

/**
 * The mapExtend() is used to copy the values of all properties
 * from one or more source objects to a target object.
 *
 * It takes first object (dstObject)
 * creates variable (result) and assign first object.
 * Checks if arguments equal two or more and if (result) is an object.
 * If true,
 * it extends (result) from the next objects.
 *
 * @param{ objectLike } dstObject - The target object.
 * @param{ ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the target object.
 * @method mapExtend
 * @throws { Error } Will throw an error if ( arguments.length < 2 ),
 * if the (dstObject) is not an Object.
 * @memberof wTools
 */

/* !!! need to explain how undefined handled */

function mapExtend( dstObject )
{
  var result = dstObject;

  // if( arguments.length === 2 )
  // debugger;

  if( result === null )
  result = Object.create( null );

  if( arguments.length === 2 )
  return Object.assign( result,arguments[ 1 ] );

  assert( arguments.length >= 2 );
  assert( objectLike( result ),'mapExtend :','expects object as the first argument' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];

    for( var k in argument )
    {
      result[ k ] = argument[ k ];
    }

  }

  return result;
}

//

function mapExtendToThis()
{
  var result = this;

  if( !result )
  result = Object.create( null );

  assert( arguments.length >= 1 );
  assert( objectLike( result ),'mapExtendToThis :','expects object as this' );

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];
    for( var k in argument )
    {
      result[ k ] = argument[ k ];
    }

  }

  return result;
}

  //

  // /**
  //  * @callback  _.filter.dstNotHas()
  //  * @param { objectLike } dstObject - The target object.
  //  * @param { objectLike } argument - The next object.
  //  * @param { string } key - The key of the (argument) object.
  //  */

/**
 * The mapSupplement() method returns an object with unique [ key, value ].
 *
 * It creates the variable (args), assign to a copy of pseudo array (arguments),
 * adds a callback function ( _.filter.dstNotHas() ) to the beginning of the (args)
 * and returns an object with unique [ key, value ].
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
 *
 * @returns { objectLike } Returns an object with unique [ key, value ].
 * @method mapSupplement
 * @memberof wTools
 */

/* !!! need to explain how undefined handled */

function mapSupplement( dst )
{
  var args = _.arraySlice( arguments );
  args.unshift( _.filter.dstNotHas() );
  return mapExtendFiltering.apply( this,args );
}

//

function mapSupplementOwn( dst )
{
  var args = _.arraySlice( arguments );
  args.unshift( _.filter.dstNotOwn() );
  return mapExtendFiltering.apply( this,args );
}

//

// /**
//  * @callback  _.filter.dstNotHasCloning()
//  * @param { objectLike } dstContainer - The target object.
//  * @param { objectLike } srcContainer - The next object.
//  * @param { string } key - The key of the (srcContainer) object.
//  */

/**
 * The mapComplement() method returns an object
 * filled by all unique, clone [ key, value ].
 *
 * It creates the variable (args), assign to a copy of pseudo array (arguments),
 * adds a specific callback function (_.filter.dstNotHasCloning())
 * to the beginning of the (args)
 * and returns an object filled by all unique clone [key, value].
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 'yyy', c : 3 };
 * _.mapComplement( { a : 1, b : 'yyy' }, { a : 12 , c : 3 } );
 *
 * @returns { objectLike } Returns an object filled by all unique, clone [ key, value ].
 * @method mapComplement
 * @memberof wTools
 */

/* !!! need to explain how undefined handled */

function mapComplement( dst )
{

  var args = _.arraySlice( arguments );
  args.unshift( _.filter.dstNotOwnNotUndefinedCloning() );
  return mapExtendFiltering.apply( this,args );

}

//

function mapComplementWithUndefines( dst )
{

  var args = _.arraySlice( arguments );
  args.unshift( _.filter.dstNotOwnCloning() );
  return mapExtendFiltering.apply( this,args );

}

//

/**
 * The mapCopy() method is used to copy the values of all properties
 * from one or more source objects to the new object.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * _.mapCopy( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the new object filled by [ key, value ]
 * from one or more source objects.
 * @method mapCopy
 * @memberof wTools
 */

function mapCopy()
{
  var args = _.arrayAppendMerging( [],Object.create( null ),arguments );
  return _.mapExtend.apply( _,args );
}

// --
// recursive
// --

function mapSupplementRecursive()
{
  _.assert( this === Self );
  return _.mapExtendRecursive.apply( { filterField : _.fieldFilter.dstNotHas(), filterUp : true },arguments );
}

//

function mapExtendRecursive( dst,src )
{
  var filter = this;

  _.assert( arguments.length >= 2 );

  if( filter === Self )
  filter = null;

  if( filter )
  {
    filter = _mapFieldFilterMake( filter );
    for( var a = 1 ; a < arguments.length ; a++ )
    {
      src = arguments[ a ];
      _mapExtendRecursiveFiltering( filter,dst,src );
    }
  }
  else
  {
    for( var a = 1 ; a < arguments.length ; a++ )
    {
      src = arguments[ a ];
      _mapExtendRecursive( dst,src );
    }
  }

  return dst;
}

//

function _filterTrue(){ return true };
_filterTrue.functionKind = 'field-filter';
function _filterFalse(){ return true };
_filterFalse.functionKind = 'field-filter';

function _mapFieldFilterMake( filter )
{

  _.assert( arguments.length === 1 );

  if( _.routineIs( filter ) )
  filter = { filterUp : filter, filterField : filter }

  if( filter.filterUp === undefined )
  filter.filterUp = filter.filterField;
  else if( filter.filterUp === true )
  filter.filterUp = _filterTrue;
  else if( filter.filterUp === false )
  filter.filterUp = _filterFalse;

  if( filter.filterField === true )
  filter.filterField = _filterTrue;
  else if( filter.filterField === false )
  filter.filterField = _filterFalse;

  _.assert( _.routineIs( filter.filterUp ) );
  _.assert( _.routineIs( filter.filterField ) );

  _.assert( filter.filterUp.functionKind === 'field-filter' );
  _.assert( filter.filterField.functionKind === 'field-filter' );

  return filter;
}

//

function _mapExtendRecursiveFiltering( filter,dst,src )
{

  _.assert( _.objectIs( src ) );

  for( var s in src )
  {

    if( _.objectIs( src[ s ] ) )
    {

      if( filter.filterUp( dst,src,s ) === true )
      {
        if( !_.objectIs( dst[ s ] ) )
        dst[ s ] = Object.create( null );
        _mapExtendRecursiveFiltering( filter,dst[ s ],src[ s ] );
      }

    }
    else
    {

      if( filter.filterField( dst,src,s ) === true )
      dst[ s ] = src[ s ];

    }

  }

}

//

function _mapExtendRecursive( dst,src )
{

  _.assert( _.objectIs( src ) );

  for( var s in src )
  {

    if( _.objectIs( src[ s ] ) )
    {

      if( !_.objectIs( dst[ s ] ) )
      dst[ s ] = Object.create( null );
      _mapExtendRecursive( dst[ s ],src[ s ] );

    }
    else
    {

      dst[ s ] = src[ s ];

    }

  }

}

// --
// map test
// --

/**
 * Short-cut for _mapSatisfy() method.
 * Checks if object( o.src ) has at least one key/value pair that is represented in( o.template ).
 * Also works with ( o.template ) as routine that check( o.src ) with own rules.
 * @param {wTools~mapSatisfyOptions} o - Default options {@link wTools~mapSatisfyOptions}.
 * @returns {boolean} Returns true if( o.src ) has same key/value pair(s) with( o.template )
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
 * @method mapSatisfy
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

  _.routineOptions( mapSatisfy,o );

  return _mapSatisfy( o.template,o.src,o.src,o.levels );
}

mapSatisfy.defaults =
{
  template : null,
  src : null,
  levels : 1,
}

//

/**
 * Default options for _mapSatisfy() method.
 * @typedef {object} wTools~mapSatisfyOptions
 * @property {object|function} [ template=null ] - Map to compare with( src ) or routine that checks each value of( src ).
 * @property {object} [ src=null ] - Source map.
 * @property {number} [ levels=256 ] - Number of levels in map structure.
 *
*/

/**
 * Checks if object( src ) has at least one key/value pair that is represented in( template ).
 * Returns true if( template ) has one or more indentical key/value pair with( src ).
 * If( template ) is provided as routine, method uses it to check( src ).
 * @param {wTools~mapSatisfyOptions} args - Arguments list {@link wTools~mapSatisfyOptions}.
 * @returns {boolean} Returns true if( src ) has same key/value pair(s) with( template ).
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
 * @method _mapSatisfy
 * @memberof wTools
*/

function _mapSatisfy( template,src,root,levels )
{

  if( template === src )
  return true;

  if( levels <= 0 )
  return false;
  //throw _.err( '_mapSatisfy : too deep structure' );

  if( _.routineIs( template ) )
  return template( src );

  if( objectIs( template ) )
  {
    for( var t in template )
    if( !_mapSatisfy( template[ t ],src[ t ],root,levels-1 ) )
    return false;
    return true;
  }

  debugger;

  return false;
}

// --
// map search
// --

function mapIndexForValue( src,ins )
{

  for( var s in src )
  {
    if( src[ s ] === ins )
    return s;
  }

  return;
}

// --
// map getter
// --

  /**
   * The mapFirstPair() method returns first pair [ key, value ] as array.
   *
   * @param { objectLike } srcObject - An object like entity of get first pair.
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
   * @returns { Array } Returns pair [ key, value ] as array if (srcObject) has fields, otherwise, undefined.
   * @method mapFirstPair
   * @throws { Error } Will throw an Error if (arguments.length) less than one, if (srcObject) is not an object-like.
   * @memberof wTools
   */

function mapFirstPair( srcObject )
{

  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( srcObject ) );

  for( var s in srcObject )
  {
    return [ s,srcObject[ s ] ];
  }

}

//

  /**
   * The mapToArray() converts an object (src) into array [ [ key, value ] ... ].
   *
   * It takes an object (src) creates an empty array,
   * checks if ( arguments.length === 1 ) and (src) is an object.
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
   * @method mapToArray
   * @throws { Error } Will throw an Error if( arguments.length !== 1 ) or (src) is not an object.
   * @memberof wTools
   */

function mapToArray( src )
{
  var result = [];

  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( src ) );

  for( var s in src )
  {
    result.push( [ s,src[s] ] );
  }

  return result;
}

//

  // +++ param (src) may be not only an array.
  // +++ throws is not defined in the function.

  /**
   * The mapValWithIndex() returns value of (src) by corresponding (index).
   *
   * It takes (src) and (index), creates a variable ( i = 0 ),
   * checks if ( index > 0 ), iterate over (src) object-like and match
   * if ( i == index ).
   * If true, it returns value of (src).
   * Otherwise it increment ( i++ ) and iterate over (src) until it doesn't match index.
   *
   * @param { objectLike } src - An object-like.
   * @param { number } index - To find the position an element.
   *
   * @example
   * // returns 7
   * _.mapValWithIndex( [ 3, 13, 'c', 7 ], 3 );
   *
   * @returns { * } Returns value of (src) by corresponding (index).
   * @method mapValWithIndex
   * @throws { Error } Will throw an Error if( arguments.length > 2 ) or (src) is not an Object.
   * @memberof wTools
   */

function mapValWithIndex( src,index )
{

  _.assert( arguments.length === 2 );
  _.assert( _.objectLike( src ) );


  if( index < 0 ) return;

  var i = 0;
  for( var s in src )
  {
    if( i == index ) return src[s];
    i++;
  }
}

//

  /**
   * The mapKeyWithIndex() returns key of (src) by corresponding (index).
   *
   * It takes (src) and (index), creates a variable ( i = 0 ),
   * checks if ( index > 0 ), iterate over (src) object-like and match
   * if ( i == index ).
   * If true, it returns value of (src).
   * Otherwise it increment ( i++ ) and iterate over (src) until it doesn't match index.
   *
   * @param { objectLike } src - An object-like.
   * @param { number } index - To find the position an element.
   *
   * @example
   * // returns '1'
   * _.mapKeyWithIndex( [ 'a', 'b', 'c', 'd' ], 1 );
   *
   * @returns { string } Returns key of (src) by corresponding (index).
   * @method mapKeyWithIndex
   * @throws { Error } Will throw an Error if( arguments.length > 2 ) or (src) is not an Object.
   * @memberof wTools
   */

function mapKeyWithIndex( src,index )
{

   _.assert( arguments.length === 2 );
   _.assert( _.objectLike( src ) );

  if( index < 0 ) return;

  var i = 0;
  for( var s in src )
  {
    if( i == index ) return s;
    i++;
  }

}

//

/**
 * The mapToStr() method converts and returns the passed object (src) to the string.
 *
 * It takes an object and two strings (keyValSep) and (tupleSep),
 * checks if (keyValSep and tupleSep) are strings.
 * If false, it assigns them defaults (' : ') to the (keyValSep) and
 * ('; ') to the tupleSep.
 * Otherwise, it returns a string representing the passed object (src).
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
 * @returns { string } Returns a string (result) representing the passed object (src).
 * @method mapToStr
 * @memberof wTools
 */

function mapToStr( o )
{

  _.routineOptions( mapToStr,o );
  _.assert( arguments.length === 1 );

  var result = '';
  for( var s in o.src )
  {
    result += s + o.valKeyDelimeter + o.src[ s ] + o.entryDelimeter;
  }

  result = result.substr( 0,result.length-o.entryDelimeter.length );

  return result
}

mapToStr.defaults =
{
  src : null,
  valKeyDelimeter : ':',
  entryDelimeter : ';',
}

//

function mapKeysCustom( o )
{

  _.assertMapHasOnly( o,mapKeysCustom.defaults );
  _.mapSupplement( o,mapKeysCustom.defaults );
  _.assert( arguments.length === 1 );

  if( o.src instanceof Map )
  throw _.err( 'not implemented' );

  /* */

  var keys;
  if( !o.enumerable )
  {

    if( o.own  )
    {
      keys = Object.getOwnPropertyNames( o.src );
    }
    else
    {
      var proto = o.src;
      keys = [];
      do
      {
        keys = _.arrayPrependOnceMerging( keys,Object.getOwnPropertyNames( proto ) );
        proto = Object.getPrototypeOf( proto );
      }
      while( proto );
    }

  }
  else
  {
    keys = o.own ? _.mapOwnKeys( o.src ) : _.mapKeys( o.src );
  }

  /* */

  return keys;
}

mapKeysCustom.defaults =
{
  src : null,
  own : 1,
  enumerable : 1,
}

//

/**
 * The mapOwnKeys() returns an array of a given objects own enumerable properties,
 * in the same order as that provided by a for...in loop.
 *
 * @param { ...objectLike } src - The object whose properties are to be returned.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapOwnKeys({ a : 7, b : 13 });
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the enumerable properties found directly upon object.
 * @method mapOwnKeys
 * @throws { Error } Will throw an Error if (src) is not an Object.
 * @memberof wTools
*/

function mapOwnKeys( src )
{
  var result = [];

  if( arguments.length === 0 )
  return result;

  _.assert( _.objectLike( src ) );

  if( arguments.length === 1 )
  if( _.objectIs( src ) && Object.keys )
  return Object.keys( src );

  for( var s in src )
  if( _ObjectHasOwnProperty.call( src,s ) )
  result.push( s );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    for( var s in src )
    if( _ObjectHasOwnProperty.call( src,s ) )
    _.arrayAppendOnce( result,s );
  }

  return result;
}

//

/**
 * This routine returns an array of a given objects enumerable properties,
 * in the same order as that provided by a for...in loop.
 * Accept several objects or single. Each element of result array is unique.
 * Unlike standard [Object.keys]{@https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/keys}
 * which accept object only mapKeys accept any object-like entity.
 *
 * @see {@link wTools.mapOwnKeys} - Similar routine taking into account own elements only.
 * @see {@link wTools.mapValues} - Similar routine returning values.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapKeys({ a : 7, b : 13 });
 *
 * @param { ...objectLike } src - objects of interest to extract keys.
 * @return { array } Returns an array with unique string elements.
 * corresponding to the enumerable properties found directly upon object.
 * @method mapKeys
 * @throws { Exception } Throw an exception if (src) is not an object-like entity.
 * @memberof wTools
 */

function mapKeys( src )
{
  var result = [];

  if( arguments.length === 0 )
  return result;

  _.assert( _.objectLike( src ) || errIs( src ));

  for( var s in src )
  result.push( s );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    _.assert( _.objectLike( src ) || errIs( src ) );
    for( var s in src )
    _.arrayAppendOnce( result,s );
  }

  return result;
}

//

function mapOwnValues( src )
{
  var result = [];

  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( src ) );

  for( var s in src )
  {
    if( _ObjectHasOwnProperty.call( src,s ) )
    result.push( src[ s ] );
  }

  return result;
}

//

/**
 * The mapValues() method returns an array of a given object's
 * own enumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object (src) creates an empty array,
 * checks if (src) is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } src - The object whose property values are to be returned.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapValues( { a : 7, b : 13 } );
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @method mapValues
 * @throws { Error } Will throw an Error if (src) is not an Object.
 * @memberof wTools
*/

function mapValues( src )
{
  var result = [];

  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( src ) );

  for( var s in src )
  result.push( src[ s ] );

  return result;
}

//

/**
 * The mapPairs() converts an object into a list of [ key, value ] pairs.
 *
 * It takes an object (src) creates an empty array,
 * checks if (src) is an object.
 * If true, it returns a list of [ key, value ] pairs,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } src - Object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapPairs( { a : 7, b : 13 } );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @method mapPairs
 * @throws { Error } Will throw an Error if (src) is not an Object.
 * @memberof wTools
*/

function mapPairs( src )
{
  var result = [];

  _.assert( _.objectLike( src ) );

  for( var s in src )
  result.push([ s, src[ s ] ]);

  return result;
}

//

function mapInvert( src,dst )
{
  var dst = dst || Object.create( null );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( src ) );

  for( var s in src )
  {
    _.assert( dst[ src[ s ] ] === undefined,'Cant invert the map, it has several keys with value',src[ s ] );
    dst[ src[ s ] ] = s;
  }

  return dst;
}

//

function mapInvertDroppingDuplicates( src,dst )
{
  var dst = dst || Object.create( null );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( src ) );

  var drop;

  for( var s in src )
  {
    if( dst[ src[ s ] ] !== undefined )
    {
      drop = drop || Object.create( null );
      drop[ src[ s ] ] = true;
    }
    dst[ src[ s ] ] = s;
  }

  if( drop )
  for( var d in drop )
  {
    delete dst[ d ];
  }

  return dst;
}

//

function mapsFlatten( o )
{

  _.assert( arguments.length === 1 );
  _.routineOptions( mapsFlatten,o );
  _.assert( _.arrayIs( o.maps ) )

  o.result = o.result || Object.create( null );

  function extend( r,s )
  {
    if( o.assertUniqueness )
    _.assertMapHasNone( r,s );
    _.mapExtend( r,s );
  }

  for( var a = 0 ; a < o.maps.length ; a++ )
  {

    var src = o.maps[ a ];

    if( !_.arrayLike( src ) )
    {
      _.assert( _.objectIs( src ) );
      if( src !== undefined )
      extend( o.result, src );
      continue;
    }

    for( var s = 0 ; s < src.length ; s++ )
    {
      if( _.arrayIs( src[ s ] ) )
      mapsFlatten
      ({
        maps : src[ s ],
        result : o.result,
        assertUniqueness : o.assertUniqueness,
      });
      else if( _.objectIs( src[ s ] ) )
      extend( o.result, src );
      else
      throw _.err( 'array should have only maps' );
    }

  }

  return o.result;
}

mapsFlatten.defaults =
{
  maps : null,
  result : null,
  assertUniqueness : 1,
}

//

function mapRoutines( src )
{
  var result = Object.create( null );

  _.routineOptions( mapRoutines,o );
  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( src ) );

  var keys = _.mapKeysCustom
  ({
    src : src,
    own : 0,
    enumerable : 1,
  });

  for( var k = 0 ; k < keys.length ; k++ )
  {
    if( _.routineIs( src[ keys[ k ] ] ) )
    result[ keys[ k ] ] = src[ keys[ k ] ];
  }

  return result;
}

mapRoutines.defaults =
{
  own : 0,
  enumerable : 1,
}

//

function mapFields( src )
{
  var result = Object.create( null );
  var o = this === Self ? Object.create( null ) : this;

  _.routineOptions( mapFields,o );
  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( src ) );

  var keys = _.mapKeysCustom
  ({
    src : src,
    own : 0,
    enumerable : 1,
  });

  for( var k = 0 ; k < keys.length ; k++ )
  {
    if( !_.routineIs( src[ keys[ k ] ] ) )
    result[ keys[ k ] ] = src[ keys[ k ] ];
  }

  return result;
}

mapFields.defaults =
{
  own : 0,
  enumerable : 1,
}

// --
// map filter
// --

/**
 * The mapSame() returns true, if the second object (src2)
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
 * mapSame( { a : 7, b : 13 }, { a : 7, b : 13 } );
 *
 * @example
 * returns undefined
 * _.mapSame( { a : 7, b : 13 }, { a : 33, b : 13 } );
 *
 * @example
 * returns undefined
 * _.mapSame( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 *
 * @returns { boolean } Returns true, if the second object (src2)
 * has the same values as the first object(src1).
 * @method mapSame
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

function mapSame( src1,src2 ){

  _.assert( arguments.length === 2 );

  if( Object.keys( src1 ).length !== Object.keys( src2 ).length ) return;

  for( var s in src1 )
  {
    if( src1[ s ] !== src2[ s ] ) return;
  }

  return true;
}

//

/**
 * The mapContain() returns true, if the first object (src)
 * has the same values as the second object(ins).
 *
 * It takes two objects (scr, ins),
 * checks if the first object (src) has the same [key, value] as
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
 * @returns { boolean } Returns true, if the first object (src)
 * has the same values as the second object(ins).
 * @method mapContain
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

function mapContain( src,ins )
{
  _.assert( arguments.length === 2 );

/*
  if( Object.keys( src ).length < Object.keys( ins ).length )
  return false;
*/

  for( var s in ins )
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
 * The mapOwn() returns true if (object) has own property.
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
 * _.mapOwn( { a : 7, b : 13 }, 'a' );
 *
 * @example
 * // returns false
 * _.mapOwn( { a : 7, b : 13 }, 'c' );
 *
 * @returns { boolean } Returns true if (object) has own property.
 * @method mapOwn
 * @throws { mapOwn } Will throw an error if the (name) is unknown.
 * @memberof wTools
 */

function mapOwn( object,name )
{

  if( arguments.length === 1 )
  {
    var result = _.mapExtendFiltering( _.filter.srcOwn(),Object.create( null ),object );
    return result;
  }

  _.assert( arguments.length === 2 );

  if( _.strIs( name ) )
  return _ObjectHasOwnProperty.call( object, name );
  else if( _.mapIs( name ) )
  return _ObjectHasOwnProperty.call( object, _.nameUnfielded( name ).coded );
  else if( _.symbolIs( name ) )
  return _ObjectHasOwnProperty.call( object, name );

  _.assert( 0,'mapOwn :','unknown type of name :',_.strTypeOf( name ) );
}

//

// function mapHas( object,name )
// {
//   var name = _.nameUnfielded( name ).coded;
//
//   var descriptor = Object.getOwnPropertyDescriptor( object,name );
//
//   if( !descriptor )
//   return false;
//
//   if( descriptor.set && descriptor.set.forbid )
//   return false;
//
//   return true;
// }

//

/**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first (srcMap) original object.
 * Values for result object come from original object (srcMap)
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
 * @method mapBut
 * @memberof wTools
 */

function mapBut( srcMap )
{
  var result = Object.create( null );
  var a,k;

  _assert( _.objectLike( srcMap ),'mapBut :','expects object as argument' );

  for( k in srcMap )
  {
    for( a = 1 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      _assert( _.objectLike( argument ),'argument','#'+a,'is not object' );

      if( k in argument )
      if( argument[ k ] !== undefined ) // xxx
      break;

    }
    if( a === arguments.length )
    {
      result[ k ] = srcMap[ k ];
    }
  }

  return result;
}

//

function mapButWithUndefines( srcMap )
{
  var result = Object.create( null );
  var a,k;

  _assert( _.objectLike( srcMap ),'mapBut :','expects object as argument' );

  for( k in srcMap )
  {
    for( a = 1 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      _assert( _.objectLike( argument ),'argument','#'+a,'is not object' );

      if( k in argument )
      break;

    }
    if( a === arguments.length )
    {
      result[ k ] = srcMap[ k ];
    }
  }

  return result;
}

//

  /**
   * The mapOwnBut() returns new object with unique own keys.
   *
   * Takes any number of objects.
   * Returns new object filled by unique own keys
   * from the first (srcMap) original object.
   * Values for (result) object come from original object (srcMap)
   * not from second or other one.
   * If (srcMap) does not have own properties it skips rest of code and checks another properties.
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
   * @method mapOwnBut
   * @throws { Error } Will throw an Error if (srcMap) is not an object.
   * @memberof wTools
   */

function mapOwnBut( srcMap )
{
  var result = Object.create( null );
  var a,k;

  /*console.warn( 'fuzzy!' ); debugger;*/

  assert( objectLike( srcMap ),'mapOwnBut :','expects object as argument' );

  for( k in srcMap )
  {
    if( !_ObjectHasOwnProperty.call( srcMap, k ) )
    continue;

    for( a = 1 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      if( k in argument )
      break;

    }
    if( a === arguments.length )
    {
      result[ k ] = srcMap[ k ];
    }
  }

  return result;
}

//

function mapDelete( dst,ins )
{

  _.assert( arguments.length === 2 );
  _.assert( _.objectLike( dst ) );
  _.assert( _.objectLike( ins ) );

  for( var i in ins )
  {
    delete dst[ i ];
  }

  return dst;
}

  // /**
  //  * @callback  _.filter.atomic()
  //  * @param { object } result - The new object.
  //  * @param { objectLike } srcMap - The target object.
  //  * @param { string } k - The key of the (srcMap) object.
  //  */

  /**
   * The mapButFiltering() method returns a new object (result)
   * whose (values) are not equal to the arrays or objects.
   *
   * Takes any number of objects.
   * If the first object has same key any other object has
   * then this pair [ key, value ] will not be included into (result) object.
   * Otherwise,
   * it calls a provided callback function ( _.filter.atomic() )
   * once for each key in the (srcMap), and adds to the (result) object
   * all the [ key, value ],
   * if values are not equal to the array or object.
   *
   * @param { function } filter.atomic() - Callback function to test each [ key, value ] of the (srcMap) object.
   * @param { objectLike } srcMap - The target object.
   * @param { ...objectLike } arguments[] - The next objects.
   *
   * @example
   * // returns { a : 1, b : "b" }
   * mapButFiltering( _.filter.atomic(), { a : 1, b : 'b', c : [ 1, 2, 3 ] } );
   *
   * @returns { object } Returns an object whose (values) are not equal to the arrays or objects.
   * @method mapButFiltering
   * @throws { Error } Will throw an Error if (srcMap) is not an object.
   * @memberof wTools
   */

function mapButFiltering( filter,srcMap )
{
  var result = Object.create( null );
  var filter = _.filter.makeMapper( filter );
  var a,k;

  assert( objectLike( srcMap ),'mapButFiltering :','expects object as argument' );

  for( k in srcMap )
  {
    for( a = 2 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      if( k in argument )
      break;

    }
    if( a === arguments.length )
    {
      filter.call( this,result,srcMap,k );
    }
  }

  return result;
}

//

function mapOwnButFiltering( filter,srcMap )
{
  var result = Object.create( null );
  var filter = _.filter.makeMapper( filter );
  var a,k;

  assert( objectLike( srcMap ),'mapOwnButFiltering :','expects object as argument' );

  for( k in srcMap )
  {
    for( a = 2 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      if( _ObjectHasOwnProperty.call( argument,k ) )
      break;

    }
    if( a === arguments.length )
    {
      filter.call( this,result,srcMap,k );
    }
  }

  return result;
}

//

/**
 * @property { objectLike } srcObjects.srcObject - The target object.
 * @property { objectLike } screenObjects.screenObject - The source object.
 * @property { Object } dstObject - The empty object.
 */

/**
 * The mapScreens() returns an object filled by unique [ key, value ]
 * from (srcObject) object.
 *
 * It creates the variable (dstObject) assignes and calls the method (_mapScreen( { } ) )
 * with three properties.
 *
 * @see {@link wTools._mapScreen} - See for more information.
 *
 * @param { objectLike } srcObject - The target object.
 * @param { objectLike } screenObject - The source object.
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * _.mapScreens( { d : 'name', c : 33, a : 'abc' }, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );
 *
 * @returns { Object } Returns an (dstObject) object filled by unique [ key, value ]
 * from (srcObject) objects.
 * @method mapScreens
 * @throws { Error } Will throw an Error if (arguments.length) more that two,
 * if (srcObject or screenObject) are not objects-like.
 * @memberof wTools
 */

function mapScreens( srcObject,screenObject )
{

  _assert( arguments.length >= 2,'mapScreens :','expects at least 2 arguments' );
  _assert( _.objectLike( srcObject ),'mapScreens :','expects object as argument' );
  _assert( _.objectLike( screenObject ),'mapScreens :','expects object as screenObject' );

  if( arguments.length > 2 )
  {
    screenObject =_ArraySlice.call( arguments,1 );
  }

  var dstObject = _mapScreen
  ({
    screenObjects : screenObject,
    srcObjects : srcObject,
    dstObject : Object.create( null ),
  });

  return dstObject;
}

//

/**
 * @namespace
 * @property { objectLike } screenObjects.screenObject - The first object.
 * @property { ...objectLike } srcObject.arguments[1,...] -
 * The pseudo array (arguments[]) from the first [1] index to the end.
 * @property { object } dstObject - The empty object.
 */

/**
 * The mapScreen() returns an object filled by unique [ key, value ]
 * from others objects.
 *
 * It takes number of objects, creates a new object by three properties
 * and calls the _mapScreen( {} ) with created object.
 *
 * @see  {@link wTools._mapScreen} - See for more information.
 *
 * @param { objectLike } screenObject - The first object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * _.mapScreen( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
 *
 * @returns { Object } Returns the object filled by unique [ key, value ]
 * from others objects.
 * @method mapScreen
 * @throws { Error } Will throw an Error if (arguments.length < 2) or (arguments.length !== 2).
 * @memberof wTools
 */

function mapScreen( screenObject )
{

  _.assert( arguments.length === 2 );

  return _mapScreen
  ({
    screenObjects : screenObject,
    srcObjects : _.arraySlice( arguments,1 ),
    dstObject : Object.create( null ),
  });

}

//

function mapScreenOwn( screenObject )
{

  _.assert( arguments.length === 2 );

  return _mapScreen
  ({
    screenObjects : screenObject,
    srcObjects : _.arraySlice( arguments,1 ),
    dstObject : Object.create( null ),
    filter : _.filter.srcOwn(),
  });

}

//

  // /**
  //  * @callback  options.filter
  //  * @param { objectLike } dstObject - An empty object.
  //  * @param { objectLike } srcObjects - The target object.
  //  * @param { string } - The key of the (screenObject).
  //  */

/**
 * The _mapScreen() returns an object filled by unique [ key, value]
 * from others objects.
 *
 * The _mapScreen() checks whether there are the keys of
 * the (screenObject) in the list of (srcObjects).
 * If true, it calls a provided callback function (filter)
 * and adds to the (dstObject) all the [ key, value ]
 * for which callback function returns true.
 *
 * @param { function } [options.filter = filter.bypass()] options.filter - The callback function.
 * @param { objectLike } options.srcObjects - The target object.
 * @param { objectLike } options.screenObjects - The source object.
 * @param { Object } [options.dstObject = Object.create( null )] options.dstObject - The empty object.
 *
 * @example
 * // returns { a : 33, c : 33, name : "Mikle" };
 * var options = Object.create( null );
 * options.dstObject = Object.create( null );
 * options.screenObjects = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
 * options.srcObjects = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
 * _mapScreen( options );
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * var options = Object.create( null );
 * options.dstObject = Object.create( null );
 * options.screenObjects = { a : 13, b : 77, c : 3, d : 'name' };
 * options.srcObjects = { d : 'name', c : 33, a : 'abc' };
 * _mapScreen( options );
 *
 * @returns { Object } Returns an object filled by unique [ key, value ]
 * from others objects.
 * @method _mapScreen
 * @throws { Error } Will throw an Error if (options.dstObject or screenObject) are not objects,
 * or if (srcObjects) is not an array
 * @memberof wTools
 */

function _mapScreen( options )
{

  var dstObject = options.dstObject || Object.create( null );
  var screenObject = options.screenObjects;
  var srcObjects = options.srcObjects;

  if( _.arrayIs( screenObject ) )
  screenObject = _.mapCopy.apply( this,screenObject );

  if( !_.arrayIs( srcObjects ) )
  srcObjects = [ srcObjects ];

  if( !options.filter )
  options.filter = _.filter.bypass();
  options.filter = _.filter.makeMapper( options.filter );

  _assert( arguments.length === 1 );
  _assert( _.objectLike( dstObject ),'_mapScreen :','expects object as argument' );
  _assert( _.objectLike( screenObject ),'_mapScreen :','expects object as screenObject' );
  _assert( _.arrayIs( srcObjects ),'_mapScreen :','expects array of object as screenObject' );
  _.assertMapHasOnly( options,_mapScreen.defaults );

  for( a = srcObjects.length-1 ; a >= 0 ; a-- )
  _assert( _.objectLike( srcObjects[ a ] ),'_mapScreen :','expects object as argument' );

  for( var k in screenObject )
  {

    if( screenObject[ k ] === undefined )
    continue;

    var a;
    for( a = srcObjects.length-1 ; a >= 0 ; a-- )
    if( k in srcObjects[ a ] )
    break;

    if( a === -1 )
    continue;

    options.filter.call( this,dstObject,srcObjects[ a ],k );

  }

  return dstObject;
}

_mapScreen.defaults =
{
  filter : null,
  screenObjects : null,
  srcObjects : null,
  dstObject : null,
}

//

function mapOnlyAtomic( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( src ) );

  var result = _.mapExtendFiltering( _.filter.atomic(),Object.create( null ),src );
  return result;
}

// --
// var
// --

/**
 * Throwen to indicate that operation was aborted by user or other subject.
 *
 * @error ErrorAbort
 * @memberof wTools
 */

function ErrorAbort()
{
  this.message = arguments.length ? _.arrayFrom( arguments ) : 'Aborted';
}

ErrorAbort.prototype = Object.create( Error.prototype );

var error =
{
  ErrorAbort : ErrorAbort,
}

Error.stackTraceLimit = Infinity;

/**
 * Some Event
 *
 * @event wTools#init
 * @property {string} kind - kind of event( 'init' ).
 * @memberof wTools
 */

// --
// prototype
// --

var Proto =
{

  // init

  _initConfig : _initConfig,
  _initUnhandledErrorHandler : _initUnhandledErrorHandler,


  // iterator

  __eachAct : __eachAct,
  _each : _each,

  each : each,
  eachOwn : eachOwn,
  eachRecursive : eachRecursive,
  eachOwnRecursive : eachOwnRecursive,

  eachSample : eachSample, /* experimental */
  eachInRange : eachInRange,
  eachInManyRanges : eachInManyRanges,
  eachInMultiRange : eachInMultiRange, /* exprerimental */

  dup : dup,


  // range

  rangeLengthGet : rangeLengthGet, /* exprerimental */
  rangeFirstGet : rangeFirstGet, /* exprerimental */
  rangeLastGet : rangeLastGet, /* exprerimental */


  // entity modifier

  enityExtend : enityExtend, /* experimental */

  entityClone : entityClone, /* deprecated */

  entityNew : entityNew,

  _entityCloneAct : _entityCloneAct,
  _entityClone : _entityClone,
  entityCloneObject : entityCloneObject,
  entityCloneObjectMergingBuffers : entityCloneObjectMergingBuffers, /* experimental */
  entityCloneData : entityCloneData,
  entityCloneDataSeparatingBuffers : entityCloneDataSeparatingBuffers, /* experimental */

  entityCopy : entityCopy, /* experimental */
  entityCopyField : entityCopyField, /* experimental */
  entityAssignField : entityAssignField, /* experimental */

  entityCoerceTo : entityCoerceTo,

  entityWrap : entityWrap,
  entityFreeze : entityFreeze,


  // entity checker

  entityHasNan : entityHasNan,
  entityHasUndef : entityHasUndef,

  entityDiff : entityDiff,

  _entitySame : _entitySame,
  _entitySameOptions : _entitySameOptions,
  entitySame : entitySame,
  entityIdentical : entityIdentical,
  entityEquivalent : entityEquivalent,
  entityContain : entityContain,


  // entity selector

  entityLength : entityLength,
  entitySize : entitySize,

  // entityWithKeyRecursive : entityWithKeyRecursive, /* deprecated */
  entityValueWithIndex : entityValueWithIndex,
  entityKeyWithValue : entityKeyWithValue,

  _entitySelectOptions : _entitySelectOptions,
  _entitySelect : _entitySelect,
  _entitySelectAct : _entitySelectAct,

  entitySelect : entitySelect,
  entitySelectSet : entitySelectSet,
  entitySelectUnique : entitySelectUnique,

  _entityConditionMake : _entityConditionMake,
  entityMap : entityMap,

  _entityFilter : _entityFilter,
  entityFilter : entityFilter,
  entityFilterDeep : entityFilterDeep,

  entityGroup : entityGroup, /* experimental */

  _entityMost : _entityMost,
  entityMin : entityMin,
  entityMax : entityMax,

  entitySearch : entitySearch,


  // error

  errIs : errIs,
  errIsRefined : errIsRefined,
  errIsAttended : errIsAttended,
  errIsAttentionRequested : errIsAttentionRequested,
  errAttentionRequest : errAttentionRequest,

  _err : _err,
  err : err,
  errBriefly : errBriefly,
  errAttend : errAttend,
  errLog : errLog,
  errLogOnce : errLogOnce,


  // diagnostics

  _diagnosticStripPath : _diagnosticStripPath,
  diagnosticLocation : diagnosticLocation,
  diagnosticCode : diagnosticCode,
  diagnosticStack : diagnosticStack,
  diagnosticWatchObject : diagnosticWatchObject, /* experimental */
  diagnosticWatchFields : diagnosticWatchFields, /* experimental */
  diagnosticBeep : diagnosticBeep,

  assert : assert,
  assertNoDebugger : assertNoDebugger,
  assertMapHasNoUndefine : assertMapHasNoUndefine,
  assertMapHasOnly : assertMapHasOnly,
  assertMapHasOnlyWithUndefines : assertMapHasOnlyWithUndefines,
  assertMapOwnOnly : assertMapOwnOnly,
  assertMapHasNone : assertMapHasNone,
  assertMapOwnNone : assertMapOwnNone,
  assertMapHasAll : assertMapHasAll,
  assertMapOwnAll : assertMapOwnAll,
  assertInstanceOrClass : assertInstanceOrClass,
  assertNotTested : assertNotTested,
  assertWarn : assertWarn,


  // type test

  arrayIs : arrayIs,
  arrayLike : arrayLike,
  hasLength : hasLength,

  objectIs : objectIs,
  objectLike : objectLike,
  mapIs : mapIs,

  strIs : strIs,
  strIsNotEmpty : strIsNotEmpty,
  symbolIs : symbolIs,

  bufferIs : bufferIs,
  bufferViewIs : bufferViewIs,
  bufferRawIs : bufferRawIs,
  bufferNodeIs : bufferNodeIs,
  bufferAnyIs : bufferAnyIs,

  argumentsIs : argumentsIs,

  rowIs : rowIs,

  numberIs : numberIs,
  numberIsNotNan : numberIsNotNan,
  numberIsRegular : numberIsRegular,
  numberIsFinite : numberIsFinite,
  numberIsInt : numberIsInt,

  numbersAreFinite : numbersAreFinite,
  numbersArePositive : numbersArePositive,
  numbersAreInt : numbersAreInt,

  dateIs : dateIs,
  boolIs : boolIs,
  boolLike : boolLike,
  routineIs : routineIs,
  routineWithNameIs : routineWithNameIs,

  regexpIs : regexpIs,
  regexpObjectIs : regexpObjectIs,

  definedIs : definedIs,

  eventIs : eventIs,
  htmlIs : htmlIs,
  jqueryIs : jqueryIs,
  canvasIs : canvasIs,
  domIs : domIs,
  domLike : domLike,
  domableIs : domableIs,
  consequenceIs : consequenceIs,

  atomicIs : atomicIs,
  primitiveIs : atomicIs,

  typeOf : typeOf,
  typeIsBuffer : typeIsBuffer,

  workerIs : workerIs,


  // bool

  boolFrom : boolFrom,


  // number

  numberFrom : numberFrom,
  numbersFrom : numbersFrom,

  numberRandomInRange : numberRandomInRange,
  numberRandomInt : numberRandomInt,
  numberRandomIntBut : numberRandomIntBut, /* experimental */


  // str

  strTypeOf : strTypeOf,
  strPrimitiveTypeOf : strPrimitiveTypeOf,

  str : str,

  strBeginOf : strBeginOf,
  strEndOf : strEndOf,
  strInbetweenOf : strInbetweenOf,

  strBegins : strBegins,
  strEnds : strEnds,

  strRemoveBegin : strRemoveBegin,
  strRemoveEnd : strRemoveEnd,

  strPrependOnce : strPrependOnce,
  strAppendOnce : strAppendOnce,


  // regexp

  regexpIdentical : regexpIdentical,
  regexpEscape : regexpEscape,
  regexpForGlob : regexpForGlob,

  regexpMakeObject : regexpMakeObject,
  regexpMakeArray : regexpArrayMake,
  regexpMakeExpression : regexpMakeExpression,

  regexpBut_ : regexpBut_,

  regexpArrayMake : regexpArrayMake,
  regexpArrayIndex : regexpArrayIndex,
  _regexpArrayAny : _regexpArrayAny,
  _regexpArrayAll : _regexpArrayAll,


  // routine

  _routineBind : _routineBind,
  routineBind : routineBind, /* deprecated */
  routineJoin : routineJoin,
  routineSeal : routineSeal,
  routineDelayed : routineDelayed,

  routinesJoin : routinesJoin,
  routinesCall : routinesCall,
  routineOptions : routineOptions,
  routineOptionsWithUndefines : routineOptionsWithUndefines,
  routineOptionsFromThis : routineOptionsFromThis,

  routineInputMultiplicator_functor : routineInputMultiplicator_functor,

  _comparatorFromTransformer : _comparatorFromTransformer,

  bind : null,


  // time

  timeReady : timeReady,
  timeReadyJoin : timeReadyJoin,
  timeOnce : timeOnce,
  timeOut : timeOut,
  timeOutError : timeOutError,

  timePeriodic : timePeriodic,

  _timeNow_functor : _timeNow_functor,
  timeSpent : timeSpent,
  dateToStr : dateToStr,


  // buffer

  bufferRelen : bufferRelen,
  bufferResize : bufferResize,
  bufferBytesGet : bufferBytesGet,
  bufferRetype : bufferRetype,

  bufferMove : bufferMove,
  bufferToStr : bufferToStr,
  bufferToDom : bufferToDom,

  bufferLeftBufferIndex : bufferLeftBufferIndex,

  bufferFromArrayOfArray : bufferFromArrayOfArray,
  bufferFrom : bufferFrom,
  bufferRawFromBuffer : bufferRawFromBuffer,
  bufferRawFrom : bufferRawFrom,

  buffersSerialize : buffersSerialize, /* deprecated */
  buffersDeserialize : buffersDeserialize, /* deprecated */

  bufferToNodeBuffer : bufferToNodeBuffer,


  // array

  arraySub : arraySub,
  arrayNew : arrayNew,
  // arrayNewOfSameLength : arrayNewOfSameLength,
  arrayFromNumber : arrayFromNumber,

  arraySelect : arraySelect,
  arrayIndicesOfGreatest : arrayIndicesOfGreatest, /* experimental */

  arrayFlatten : arrayFlatten,

  arrayCopy : arrayCopy,
  arrayAppendMerging : arrayAppendMerging,
  arrayPrependMerging : arrayPrependMerging,

  arrayAppendOnceMerging : arrayAppendOnceMerging,
  arrayPrependOnceMerging : arrayPrependOnceMerging,

  arrayAppendOnce : arrayAppendOnce,
  arrayPrependOnce : arrayPrependOnce,

  arraySwap : arraySwap,

  arrayRemoveArrayOnce : arrayRemoveArrayOnce,

  arrayRemovedOnce : arrayRemovedOnce,
  arrayRemoveOnce : arrayRemoveOnce,

  arrayRemovedAll : arrayRemovedAll,
  arrayRemoveAll : arrayRemoveAll,

  arrayReplaceOnce : arrayReplaceOnce,
  arrayUpdate : arrayUpdate,

  arrayFrom : arrayFrom,
  arrayToMap : arrayToMap,

  arrayGrow : arrayGrow,
  arraySlice : arraySlice,
  arrayMultislice : arrayMultislice,

  // arraySpliceArray : arraySpliceArray,
  // arraySplice : arraySplice, /* experimental */
  arrayCutin : arrayCutin,

  arrayAs : arrayAs,

  arrayUniqueIs : arrayUniqueIs,
  arrayUnique : arrayUnique,

  arrayToStr : arrayToStr,

  arrayPut : arrayPut,

  arrayMask : arrayMask,
  arrayUnmask : arrayUnmask,

  arrayDuplicate : arrayDuplicate,
  arrayFill : arrayFill,

  arrayCompare : arrayCompare,
  arrayIdentical : arrayIdentical,
  arraySameSet : arraySameSet,

  arrayLeftIndexOf : arrayLeftIndexOf,
  arrayRightIndexOf : arrayRightIndexOf,

  arrayLeft : arrayLeft,
  arrayRight : arrayRight,

  arrayLeftDefined : arrayLeftDefined,
  arrayRightDefined : arrayRightDefined,

  arrayHasAny : arrayHasAny,
  arrayCount : arrayCount,
  arrayCountSame : arrayCountSame,

  arraySum : arraySum,

  arraySupplement : arraySupplement,
  arrayExtendScreening : arrayExtendScreening,

  arrayShuffle : arrayShuffle,
  arrayRandom : arrayRandom,
  arrayRange : arrayRange,


  // array set

  arraySetIntersection : arraySetIntersection,
  arraySetContainAll : arraySetContainAll,
  arraySetContainSomething : arraySetContainSomething,


  // map extend

  mapClone : mapClone, /* experimental */

  mapExtendFiltering : mapExtendFiltering,
  mapExtend : mapExtend,
  mapExtendToThis : mapExtendToThis,
  mapSupplement : mapSupplement,
  mapSupplementOwn : mapSupplementOwn,
  mapComplement : mapComplement,
  mapComplementWithUndefines : mapComplementWithUndefines,
  mapCopy : mapCopy,


  // recursive

  mapSupplementRecursive : mapSupplementRecursive,
  mapExtendRecursive : mapExtendRecursive,
  _mapFieldFilterMake : _mapFieldFilterMake,
  _mapExtendRecursiveFiltering : _mapExtendRecursiveFiltering,
  _mapExtendRecursive : _mapExtendRecursive,


  // map test

  mapSatisfy : mapSatisfy,
  _mapSatisfy : _mapSatisfy,


  // map search

  mapIndexForValue : mapIndexForValue,


  // map convert

  mapFirstPair : mapFirstPair,

  mapToArray : mapToArray,
  mapValWithIndex : mapValWithIndex,
  mapKeyWithIndex : mapKeyWithIndex,
  mapToStr : mapToStr, /* deprecated */

  mapKeysCustom : mapKeysCustom,
  mapOwnKeys : mapOwnKeys,
  mapKeys : mapKeys,
  mapOwnValues : mapOwnValues,
  mapValues : mapValues,
  mapPairs : mapPairs,

  mapInvert : mapInvert,
  mapInvertDroppingDuplicates : mapInvertDroppingDuplicates,
  mapsFlatten : mapsFlatten,

  mapRoutines : mapRoutines,
  routines : mapRoutines,

  mapFields : mapFields,
  fields : mapFields,


  // map logic

  mapOwn : mapOwn,

  mapSame : mapSame,
  mapContain : mapContain,

  mapBut : mapBut,
  mapButWithUndefines : mapButWithUndefines,
  mapOwnBut : mapOwnBut,

  mapDelete : mapDelete,

  mapButFiltering : mapButFiltering,
  mapOwnButFiltering : mapOwnButFiltering,

  mapScreens : mapScreens,
  mapScreen : mapScreen,
  mapScreenOwn : mapScreenOwn,
  _mapScreen : _mapScreen,

  mapOnlyAtomic : mapOnlyAtomic,


  // etc

  workerIs : workerIs,


  // var

  ArrayType : Array,
  error : error,

  _sourceDirPath : typeof __dirname !== 'undefined' ? __dirname : null,

}

mapExtend( Self, Proto );

//

var _assert = _.assert;
var _arraySlice = _.arraySlice;
var timeNow = Self.timeNow = Self._timeNow_functor();

//

_global_[ 'wTools' ] = Self;
_global_.wTools = Self;
_global_.wBase = Self;

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

//

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

//

if( !_global_.wTestSuite )
_global_.wTestSuite = function wTestSuite( testSuite )
{

  if( !_global_.wTests )
  _global_.wTests = Object.create( null );

  if( !testSuite.sourceFilePath )
  testSuite.sourceFilePath = _.diagnosticLocation( 1 ).full;

  _.assert( _.strIsNotEmpty( testSuite.sourceFilePath ),'Test suite expects a mandatory option ( sourceFilePath )' );
  /* _.assert( _.strIsNotEmpty( testSuite.name ),'Test suite should have name' ); */
  _.assert( _.objectIs( testSuite ) );

  if( !testSuite.abstract )
  _.assert( !_global_.wTests[ testSuite.name ],'Test suite with name "' + testSuite.name + '" already registered!' );
  _global_.wTests[ testSuite.name ] = testSuite;

  return testSuite;
}

//

if( !_.Testing )
{
  _.Testing = Object.create( null );
  _.Testing.test = function test( testSuiteName )
  {
    if( _.workerIs() )
    return;
    _.assert( arguments.length === 0 || arguments.length === 1 );
    _.assert( _.strIs( testSuiteName ) || testSuiteName === undefined,'test : expects string ( testSuiteName )' );
    _.timeReady( function()
    {
      if( _.Testing.test === test )
      throw _.err( 'Cant wTesting.test, missing wTesting package' );
      _.Testing.test.call( _.Testing,testSuiteName );
    });
  }
}

//

if( typeof module !== 'undefined' && module !== null )
try
{

  require( './cFieldFilter.s' );
  require( './cFieldMapper.s' );

}
catch( err )
{
}

//

if( _global_._wToolsInitConfigExpected !== false )
{
  _._initConfig();
  _._initUnhandledErrorHandler();
}

//

if( typeof module !== 'undefined' && module !== null )
{

  require( './eInclude.s' );
  require( './eNameTools.s' );
  require( './eExecTools.s' );
  require( './eStringTools.s' );
  require( './eArrayDescriptor.s' );

  _.pathUse( __dirname + '/../..' );

}

})();
