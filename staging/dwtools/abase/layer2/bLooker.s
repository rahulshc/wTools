( function _bLooker_s_() {

'use strict';

var _global = _global_;
var Self = _global_.wTools;
var _global = _global_; var _ = _global_.wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

_.assert( _globalReal_ );

// --
// look
// --

function _lookIterationBegin()
{
  var it = this;

  debugger;

  _.assert( arguments.length === 0 );
  _.assert( it.level >= 0 );
  _.assert( it.iterator );

  var newIt = Object.create( it.iterator );

  newIt.level = it.level,
  newIt.path = it.path;
  newIt.down = it;
  newIt.key = null;
  newIt.index = null;
  newIt.src = it.src;
  newIt.ascending = true;

  Object.preventExtensions( newIt );

  return newIt;
}

//

function _lookIterationSelect( k,i )
{
  var it = this;

  debugger;

  _.assert( arguments.length === 2 );
  _.assert( it.level >= 0 );

  it.level = it.level+1;
  it.path = it.path !== it.pathDelimteter ? it.path + it.pathDelimteter + k : it.path + k;
  it.key = k;
  it.index = i;
  it.src = src[ k ];

  return it;
}

//

var LookIrerator = Object.create( null );
LookIrerator.begin = _lookIterationBegin;
LookIrerator.select = _lookIterationSelect;

//

function __lookAct( it )
{

  // var iterator = this;
  // var src = it.src;
  // var index = 0;

  _.assert( Object.keys( it.iterator ).length === 11 );
  _.assert( Object.keys( it ).length === 6 );
  _.assert( it.level >= 0 );
  _.assert( arguments.length === 1 );

  debugger;

  /* level */

  if( it.levelLimit !== 0 )
  if( !( it.level < it.levelLimit ) )
  {
    debugger;
    return it;
  }

  /* trackingVisits */

  if( it.trackingVisits )
  {
    if( it.visited.indexOf( it.src ) !== -1 )
    return it;
    it.visited.push( it.src );
  }

  /* up */

  if( it.visitingRoot || it.root !== src )
  {
    it.ascending = it.onUp.call( it, it );
    _.assert( _.boolIs( it.ascending ),'expects it.onUp returns boolean, but got',_.strTypeOf( it.ascending ) );
  }

  /* down */

  function end()
  {

    if( it.root !== src )
    {
      it.onDown.call( it, it );
    }
    else if( it.visitingRoot )
    {
      it.onDown.call( it, it );
    }

    if( it.trackingVisits )
    {
      _.assert( it.visited[ it.visited.length-1 ] === it.src );
      it.visited.pop();
    }

    return it;
  }

  if( it.ascending === false || it.iterator.looking === false )
  return end();

  /* element */

  function handleElement( k )
  {

    if( it.recursive || it.root === src )
    {
      var itNew = it.begin().select( k,i )
      __lookAct( itNew );
    }

    index += 1;
  }

  /* iterate */

  if( _.arrayLike( src ) )
  {

    for( var k = 0 ; k < src.length ; k++ )
    {

      handleElement( k );

    }

  }
  else if( _.objectLike( src ) )
  {

    for( var k in src )
    {

      if( iterator.own )
      if( !_hasOwnProperty.call( src,k ) )
      continue;

      handleElement( k );

    }

  }
  else
  {
    if( it.onTerminal )
    it.onTerminal.call( it, it );
  }

  /* end */

  return end();
}

//

function _lookPre( routine, args )
{
  var o;

  if( args.length === 1 )
  o = args[ 0 ];
  else if( args.length === 2 )
  o = { src : args[ 0 ], onUp : args[ 1 ] };
  else if( args.length === 3 )
  o = { src : args[ 0 ], onUp : args[ 1 ], onDown : args[ 2 ] };
  else _.assert( 0,'look expects single options map, 2 or 3 arguments' );

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2 );

  return o
}

//

function _lookBody( o )
{

  _.assert( arguments.length === 1 );
  _.assert( o.onUp === null || o.onUp.length === 1 );
  _.assert( o.onDown === null || o.onDown.length === 1 );

  /* */

  var itetator = Object.create( LookIrerator );
  _.mapExtend( iterator, o );

  iterator.iterator = iterator;

  if( iterator.root === null )
  iterator.root = iterator.src;

  if( iterator.trackingVisits )
  if( iterator.visited === null )
  iterator.visited = [];

  if( iterator.path === null )
  iterator.path = o.pathDelimteter;

  iterator.key = null;
  iterator.looking = true;

  Object.preventExtensions( newIt );

  var it = iterator.begin();

  return __lookAct( it );
}

_lookBody.defaults =
{

  onUp : function( it ){},
  onTerminal : function( it ){},
  onDown : function( it ){},

  src : null,
  dst : null,

  own : 0,
  recursive : 1,
  visitingRoot : 1,

  trackingVisits : 1,
  levelLimit : 0,

  pathDelimteter : '/',
  path : null,

  counter : 0,
  visited : null,
  level : 0,
  down : null,
  root : null,

  // key : null,
  // index : 0,

}

//

function look( o )
{
  var o = look.pre.call( _, look, arguments );
  return look.body.call( _, o );
}

look.pre = _lookPre;
look.body = _lookBody;

var defaults = look.defaults = Object.create( _lookBody.defaults );

defaults.own = 0;

//

function lookOwn( o )
{
  var o = lookOwn.pre.call( _, look, arguments );
  _.assert( o.own );
  return lookOwn.body.call( _, o );
}

look.pre = _lookPre;
look.body = _lookBody;

var defaults = lookOwn.defaults = Object.create( _lookBody.defaults );

defaults.own = 1;
defaults.recursive = 1;

// --
// each
// --

function eachSample( o )
{

  if( arguments.length === 2 )
  {
    o =
    {
      sets : arguments[ 0 ],
      onEach : arguments[ 1 ],
    }
  }

  _.routineOptions( eachSample,o );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( o.onEach ) || o.onEach === null );
  _.assert( _.arrayIs( o.sets ) || _.mapLike( o.sets ) );
  _.assert( o.base === undefined && o.add === undefined );

  /* sample */

  if( !o.sample )
  o.sample = _.entityMakeTivial( o.sets );

  /* */

  var keys = _.arrayLike( o.sets ) ? _.arrayFromRange([ 0,o.sets.length ]) : _.mapKeys( o.sets );
  if( o.result && !_.arrayIs( o.result ) )
  o.result = [];
  var len = [];
  var indexnd = [];
  var index = 0;
  var l = _.entityLength( o.sets );

  /* sets */

  var sindex = 0;
  _.each( o.sets, function( e,k )
  {
    var set = o.sets[ k ];
    _.assert( _.arrayLike( set ) || _.primitiveIs( set ) );
    if( _.primitiveIs( set ) )
    o.sets[ k ] = [ set ];

    len[ sindex ] = _.entityLength( o.sets[ k ] );
    indexnd[ sindex ] = 0;
    sindex += 1;
  });

  /* */

  function firstSample()
  {

    var sindex = 0;
    _.each( o.sets, function( e,k )
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

    var k = keys[ i ];
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
    for( var i = 0 ; i < l ; i++ )
    {
      if( nextSample( i ) )
      return 1;
    }
    else for( var i = l - 1 ; i >= 0 ; i-- )
    {
      if( nextSample( i ) )
      return 1;
    }

    return 0;
  }

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

  _.routineOptions( eachInManyRanges,o );
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

eachInManyRanges.defaults = Object.create( eachInRange.defaults )

//

function eachInMultiRange( o )
{

  if( !o.onEach )
  o.onEach = function( e )
  {
    console.log( e );
  }

  _.routineOptions( eachInMultiRange,o );
  _.assert( _.objectIs( o ) )
  _.assert( _.arrayIs( o.ranges ) || _.objectIs( o.ranges ),'eachInMultiRange :','expects o.ranges as array or object' )
  _.assert( _.routineIs( o.onEach ),'eachInMultiRange :','expects o.onEach as routine' )
  _.assert( !o.delta || o.delta.length === o.ranges.length,'eachInMultiRange :','o.delta must be same length as ranges' );

  /* */

  var iterationNumber = 1;
  var l = 0;
  var delta = _.objectIs( o.delta ) ? [] : null;
  var ranges = [];
  var names = null;
  if( _.objectIs( o.ranges ) )
  {
    _.assert( _.objectIs( o.delta ) || !o.delta );

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

    _.assert( ranges[ r ].length === 2 );
    _.assert( _.numberIs( ranges[ r ][ 0 ] ) );
    _.assert( _.numberIs( ranges[ r ][ 1 ] ) );

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

  var indexFlat = 0;
  var indexNd = [];
  for( var r = 0 ; r < ranges.length ; r++ )
  {
    indexNd[ r ] = ranges[ r ][ 0 ];
    if( ranges[ r ][ 1 ] <= ranges[ r ][ 0 ] )
    return 0;
  }

  /* */


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

function entityWrap( o )
{
  var result = o.dst;

  debugger;

  _.routineOptions( entityWrap,o );
  _.assert( arguments.length === 1 );

  if( o.onCondition )
  o.onCondition = _entityConditionMake( o.onCondition,1 );

  /* */

  function handleDown( e,k,it )
  {

    debugger;

    if( o.onCondition )
    if( !o.onCondition.call( this,e,k,it ) )
    return

    if( o.onWrap )
    {
      var newElement = o.onWrap.call( this,e,k,it );

      if( newElement !== e )
      {
        if( e === result )
        result = newElement;
        if( it.down && it.down.src )
        it.down.src[ it.key ] = newElement;
      }

    }
    else
    {

      var newElement = { _ : e };
      if( e === result )
      result = newElement;
      else
      it.down.src[ it.key ] = newElement;

    }

  }

  /* */

  _.look
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

  function checkCandidate( e,k,it,r,path )
  {

    var c = true;
    if( o.condition )
    {
      c = o.condition.call( this,e,k,it );
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
  function handleUp( e,k,it )
  {

    if( onUp )
    if( onUp.call( this,e,k,it ) === false )
    return false;

    var path = it.path;

    var r;
    if( o.returnParent && it.down )
    {
      r = it.down.src;
      if( o.usingExactPath )
      path = it.down.path;
    }
    else
    {
      r = e;
    }

    if( o.searchingValue )
    {
      checkCandidate.call( this,e,k,it,r,path );
    }

    if( o.searchingKey )
    {
      checkCandidate.call( this,it.key,k,it,r,path );
    }

  }

  /* */

  var optionsEach = _.mapScreen( _.look.defaults,o )
  optionsEach.onUp = handleUp;

  _.look( optionsEach );

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

  returnParent : 0,
  usingExactPath : 0,

  searchingKey : 1,
  searchingValue : 1,
  searchingSubstring : 1,
  searchingCaseInsensitive : 0,

}

entitySearch.defaults.__proto__ = look.defaults;

// --
// selector
// --


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
 * @function _entitySelectOptions
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
  onElement : null,
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

      // var it = Object.create( null );
      // it.qarrey = o.qarrey[ i ];
      // it.container = o.container;
      // iterator.query = o.query[ i ];

      var optionsForSelect = _.mapExtend( null,o );
      optionsForSelect.query = optionsForSelect.query[ i ];

      // it.qarrey = o.qarrey[ i ];
      // it.container = o.container;
      // iterator.query = o.query[ i ];

      debugger; xxx
      result[ iterator.query ] = _entitySelectAct( it,iterator );
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
  iterator.onElement = o.onElement;
  iterator.usingSet = o.usingSet;
  iterator.query = o.query;

  var it = Object.create( null );
  it.qarrey = o.qarrey;
  it.container = o.container;
  it.up = null;

  result = _entitySelectAct( it,iterator );

  return result;
}

//

/**
 * Returns value from entity that corresponds to index / key or path provided by( o.qarrey ) from entity( o.container ).
 *
 * @param {Object|Array} [ o.container=null ] - Source entity.
 * @param {Array} [ o.qarrey=null ] - Specifies key/index to select or path to element. If has '*' routine processes each element of container.
 * Example process each element at [ 0 ]: { container : [ [ 1, 2, 3 ] ], qarrey : [ 0, '*' ] }.
 * Example path to element [ 1 ][ 1 ]: { container : [ 0, [ 1, 2 ] ],qarrey : [ 1, 1 ] }.
 * @param {*} [ o.set=null ] - Replaces selected index/key value with this. If defined and specified index/key not exists, routine inserts it.
 * @param {Boolean} [ o.usingUndefinedForMissing=false ] - If true returns undefined for Atomic type of( o.container ).
 * @returns {*} Returns value finded by index/key or path.
 *
 * @function _entitySelectAct
 * @throws {Exception} If container is Atomic type.
 * @memberof wTools
*/

function _entitySelectAct( it,iterator )
{

  var result;
  var container = it.container;

  var key = it.qarrey[ 0 ];
  var key2 = it.qarrey[ 1 ];

  if( !it.qarrey.length )
  {
    if( iterator.onElement )
    return iterator.onElement( it,iterator );
    else
    return container;
  }

  _.assert( Object.keys( iterator ).length === 7 );
  _.assert( Object.keys( it ).length === 3 );
  _.assert( arguments.length === 2 );

  if( _.primitiveIs( container ) )
  {
    if( iterator.usingUndefinedForMissing )
    return undefined;
    else
    throw _.err( 'cant select',it.qarrey.join( '.' ),'from atomic',_.strTypeOf( container ) );
  }

  var qarrey = it.qarrey.slice( 1 );

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
    newIteration.up = container;

    return _entitySelectAct( newIteration,iterator );
  }

  /* */

  if( key === '*' )
  {

    result = _.entityMakeTivial( container );
    _.each( container,function( e,k )
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

function entitySelectSet( o )
{

  _.assert( arguments.length === 1 || arguments.length === 3 );

  if( arguments[ 1 ] !== undefined || arguments[ 2 ] !== undefined )
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
    // var o = Object.create( null );
    // var o = _entitySelectOptions( arguments[ 0 ] );
    _.assert( _.mapOwnKey( o,{ set : 'set' } ) );
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
  // _.assert( _.arrayCount( o.qarrey,'*' ) <= 1,'not implemented' );
  // debugger;

  var result = _entitySelect( o );

  // debugger;

  if( o.qarrey.indexOf( '*' ) !== -1 )
  if( _.arrayLike( result ) )
  result = _.arrayUnique( result );

  return result;
}

entitySelectUnique.defaults =
{
}

entitySelectUnique.defaults.__proto__ = _entitySelectOptions.defaults;

// --
// transformer
// --

function _entityProbeReport( o )
{

  _.assert( arguments.length );
  o = _.routineOptions( _entityProbeReport,o );

  /* report */

  if( o.report )
  {
    if( !_.strIs( o.report ) )
    o.report = '';
    o.report += o.title + ' : ' + o.total + '\n';
    for( var r in o.result )
    {
      var d = o.result[ r ];
      o.report += o.tab;
      if( o.prependingByAsterisk )
      o.report += '*.';
      o.report += r + ' : ' + d.having.length;
      if( d.values )
      o.report += ' ' + _.toStr( d.values,{ levels : 0 } );
      o.report += '\n';
    }
  }

  return o.report;
}

_entityProbeReport.defaults =
{
  title : null,
  report : null,
  result : null,
  total : null,
  prependingByAsterisk : 1,
  tab : '  ',
}

//

function entityProbeField( o )
{

  if( arguments[ 1 ] !== undefined )
  {
    var o = Object.create( null );
    o.container = arguments[ 0 ];
    o.query = arguments[ 1 ];
  }

  _.routineOptions( entityProbeField,o );

  // o = _entitySelectOptions( arguments[ 0 ],arguments[ 1 ] );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  // _.assert( _.arrayCount( o.qarrey,'*' ) <= 1,'not implemented' );
  // debugger;
  o.all = _entitySelect( _.mapScreen( _entitySelectOptions.defaults,o ) );
  o.onElement = function( it ){ return it.up };
  o.parents = _entitySelect( _.mapScreen( _entitySelectOptions.defaults,o ) );
  o.result = Object.create( null );

  // debugger;

  // if( o.qarrey.indexOf( '*' ) !== -1 )
  // if( _.arrayLike( result ) )
  // result = _.arrayUnique( result );

  /* */

  // debugger;

  for( var i = 0 ; i < o.all.length ; i++ )
  {
    var val = o.all[ i ];
    // if( !_.primitiveIs( val ) )
    // continue;
    if( !o.result[ val ] )
    {
      var d = o.result[ val ] = Object.create( null );
      d.having = [];
      d.notHaving = [];
      d.value = val;
    }
    var d = o.result[ val ];
    d.having.push( o.parents[ i ] );
  }

  // debugger;

  for( var k in o.result )
  {
    var d = o.result[ k ];
    for( var i = 0 ; i < o.all.length ; i++ )
    {
      var element = o.all[ i ];
      var parent = o.parents[ i ];
      if( !_.arrayHas( d.having, parent ) )
      d.notHaving.push( parent );
    }
  }

  // debugger;

  /* */

  if( o.report )
  {
    // debugger;
    if( o.title === null )
    o.title = o.query;
    o.report = _._entityProbeReport
    ({
      title : o.title,
      report : o.report,
      result : o.result,
      total : o.all.length,
      prependingByAsterisk : 0,
    });
    // debugger;
  }

  return o;
}

entityProbeField.defaults =
{
  title : null,
  report : 1,
}

entityProbeField.defaults.__proto__ = _entitySelectOptions.defaults;

//

function entityProbe( o )
{

  if( _.arrayIs( o ) )
  o = { src : o }

  _.assert( arguments.length === 1 );
  _.routineOptions( entityProbe,o );
  _.assert( _.arrayIs( o.src ) || _.objectIs( o.src ) );

  o.result = o.result || Object.create( null );
  o.all = o.all || [];

  /* */

  function extend( result,src )
  {

    o.all.push( src );

    if( o.assertingUniqueness )
    _.assertMapHasNone( result,src );
    // _.mapExtend( result,src );

    for( var s in src )
    {
      if( !result[ s ] )
      {
        var r = result[ s ] = Object.create( null );
        r.times = 0;
        r.values = [];
        r.having = [];
        r.notHaving = [];
      }
      var r = result[ s ];
      r.times += 1;
      var added = _.arrayAppendedOnce( r.values,src[ s ] ) !== -1;
      r.having.push( src );
    }

  }

  /* */

  _.entityMap( o.src, function( src,k )
  {

    o.total += 1;

    if( !_.arrayLike( src ) || !o.recursive )
    {
      _.assert( _.objectIs( src ) );
      if( src !== undefined )
      extend( o.result, src );
      return src;
    }

    for( var s = 0 ; s < src.length ; s++ )
    {
      if( _.arrayIs( src[ s ] ) )
      entityProbe
      ({
        src : src[ s ],
        result : o.result,
        assertingUniqueness : o.assertingUniqueness,
      });
      else if( _.objectIs( src[ s ] ) )
      extend( o.result, src );
      else
      throw _.err( 'array should have only maps' );
    }

    return src;
  });

  /* not having */

  for( var a = 0 ; a < o.all.length ; a++ )
  {
    var map = o.all[ a ];
    for( var r in o.result )
    {
      var field = o.result[ r ];
      if( !_.arrayHas( field.having,map ) )
      field.notHaving.push( map );
    }
  }

  if( o.report )
  o.report = _._entityProbeReport
  ({
    title : o.title,
    report : o.report,
    result : o.result,
    total : o.total,
    prependingByAsterisk : 1,
  });

  return o;
}

entityProbe.defaults =
{
  src : null,
  result : null,
  recursive : 0,
  report : 1,
  total : 0,
  all : null,
  title : 'Probe',
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
   * @function entityGroup
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
    o.key = _.mapKeys.apply( _,_.mapVals( o.src ) );

  }

  /* */

  var o = _.routineOptions( entityGroup,o );

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( o.key ) || _.arrayIs( o.key ) );
  _.assert( _.objectLike( o.src ) || _.arrayLike( o.src ) );
  _.assert( _.arrayIs( o.src ),'not tested' );

  /* */

  function groupForKey( key,result )
  {

    _.each( o.src, function( e,k )
    {

      var value = o.usingOriginal ? o.src[ k ] : o.src[ k ][ key ];
      var dstKey = o.usingOriginal ? o.src[ k ][ key ] : k;

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
      var r = o.usingOriginal ? Object.create( null ) : _.entityMake( o.src );
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

// --
// entity checker
// --

/**
 * Options for _entityEqualAct() function.
 * @typedef {Object} wTools~entityEqualOptions
 * @property {routine} [ onSameNumbers ] - Routine to compare two numbers.Returns true if numbers are equal.
 * @property {boolean} [ contain=0 ] - If this parameter sets to true, two entities will be considered the same,
 * if all keys/indexes of `src2`, are in `src1` with same values. Has no effect on comparison entities with primitive
 * types. If `options.contain` set to false, `src1` and `src2` will be considered the same, if and only if they has
 * the same lengths, same keys/indexes and same appropriates values.
 * @property {boolean} [ strict=1 ] - Specify equality comparison. When it set to true, then the Strict equality
 * using (===), else the Loose equality using (==).
 * @property {string} [ lastPath='' ] - This parameters is modified during the execution of routine. Specified on path to
 * value, that composite from keys/indexes separated by '.'
 * @property {string} [ path='' ] - For non primitive entities indicates the current path for elements that is compared now.
 */

/**
 * Compares two values. For objects, arrays, array like objects, comparison will be recursive. Comparison criteria set
 * in the `options`. If in some moment routine finds different values in two entities, then it returns false.
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} o - Comparison criteria.
 * @returns {boolean} result - Returns true for same entities.
 *
 * @example
 * //returns false
 * var o = { onSameNumbers : function( a, b ){ return a === b } };
 * _._entityEqualAct( 5, 6, o );
 *
 * @example
 * //returns true
 * _._entityEqualAct( 'a', 'a', {} );
 *
 * @example
 * //returns false
 * var o = { onSameNumbers : function( a, b ){ return a === b } };
 * _._entityEqualAct( [ 1, 2, 3 ], [ 1, 2, 4 ], o );
 *
 * @example
 * //returns false
 * var o = { onSameNumbers : function( a, b ){ return a === b } };
 * _._entityEqualAct( { a : 1, b : 2 }, { a : 1, b : 2, c: 1 }, o );
 *
 * @example
 * //returns true
 * var o = { onSameNumbers : function( a, b ){ return a === b }, strict : 0 };
 * _._entityEqualAct( { a : '1', b : '2' },{ a : 1, b : 2 }, o );
 *
 * @private
 * @function _entityEqualAct
 * @throws {exception} If ( arguments.length ) is not equal 3.
 * @memberof wTools
 */

function _entityEqualAct( src1, src2, iterator )
{

  var path = iterator.path;
  iterator.lastPath = path;

  _.assert( arguments.length === 3 );

  if( src1 === src2 )
  return true;

  if( iterator.strict )
  {
    if( _ObjectToString.call( src1 ) !== _ObjectToString.call( src2 ) )
    return false;
  }
  else
  {
    if( _.primitiveIs( src1 ) )
    if( _ObjectToString.call( src1 ) !== _ObjectToString.call( src2 ) && src1 != src2 )
    return false;
  }

  /* */

  if( _.bufferRawIs( src1 ) )
  {

    if( !_.bufferRawIs( src2 ) )
    return false;

    src1 = new Uint8Array( src1 );
    src2 = new Uint8Array( src2 );

  }

  if( _.arrayLike( src1 ) )
  {

    if( !src2 )
    return false;
    if( src1.constructor !== src2.constructor )
    return false;
    if( !iterator.contain )
    if( src1.length !== src2.length )
    return false;
    for( var k = 0 ; k < src2.length ; k++ )
    {
      iterator.path = path + '.' + k;
      if( !_entityEqualAct( src1[ k ], src2[ k ], iterator ) )
      return false;
      iterator.path = path;
    }

  }
  else if( _.objectLike( src1 ) )
  {

    if( _.routineIs( src1._equalAre) )
    {
      _.assert( src1._equalAre.length === 3 );
      if( !src1._equalAre( src1, src2, iterator ) )
      return false;
    }
    else if( _.routineIs( src1.equalWith ) )
    {
      _.assert( src1.equalWith.length <= 2 );
      if( !src1.equalWith( src2, iterator ) )
      return false;
    }
    else if( _.regexpIs( src1 ) )
    {
      return _.regexpIdentical( src1, src2 );
    }
    else
    {

      if( !iterator.contain )
      if( _.entityLength( src1 ) !== _.entityLength( src2 ) )
      return false;
      for( var k in src2 )
      {
        iterator.path = path + '.' + k;
        if( !_entityEqualAct( src1[ k ], src2[ k ], iterator ) )
        return false;
        iterator.path = path;
      }

    }

  }
  else if( _.numberIs( src1 ) )
  {
    return iterator.onSameNumbers( src1,src2 );
  }
  else if( _.regexpIs( src1 ) )
  {
    if( src1.source !== src2.source )
    return false;
    if( src1.flags !== src2.flags )
    return false;
  }
  else if( _.bufferViewIs( src1 ) )
  {
    debugger;
    if( !_.bufferViewIs( src2 ) )
    return false;
    if( src1.byteLength !== src2.byteLength )
    debugger;
    for( var i = 0 ; i < src1.byteLength ; i++ )
    if( src1.getUint8( i ) !== src2.getUint8( i ) )
    return false;
    return true;
  }
  else
  {
    if( iterator.strict )
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

function _entityEqualIteratorMake( o )
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

  var o = o || Object.create( null );

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( o === undefined || _.objectIs( o ), '_.toStrFine :','options must be object' );
  _.routineOptions( _entityEqualIteratorMake,o );

  if( o.onSameNumbers === null )
  o.onSameNumbers = o.strict ? _sameNumbersStrict : _sameNumbersNotStrict;

  var eps = o.eps;

  return o;
}

_entityEqualIteratorMake.defaults =
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
 * Returns false if finds difference in two entities, else returns true. By default routine uses it own
 * ( onSameNumbers ) routine to compare numbers.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} o - comparsion options {@link wTools~entityEqualOptions}.
 * @returns {boolean} result - Returns true for same entities.
 *
 * @example
 * //returns false
 * _._entityEqual( '1', 1 );
 *
 * @example
 * //returns true
 * _._entityEqual( '1', 1, { strict : 0 } );
 *
 * @example
 * //returns true
 * _._entityEqual( { a : { b : 1 }, b : 1 } , { a : { b : 1 } }, { contain : 1 } );
 *
 * @example
 * //returns ".a.b"
 * var o = { contain : 1 };
 * _._entityEqual( { a : { b : 1 }, b : 1 } , { a : { b : 1 } }, o );
 * console.log( o.lastPath );
 *
 * @function _entityEqual
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( o ) is not a Object.
 * @throws {exception} If( o ) is extended by unknown property.
 * @memberof wTools
 */

function _entityEqual( src1,src2,o )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  var o = _entityEqualIteratorMake( o );

  return _entityEqualAct( src1,src2,o );
}

_entityEqual.defaults =
{
}

_entityEqual.defaults.__proto__ = _entityEqualIteratorMake.defaults;

//

/**
 * Deep strict comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * Returns true if entities are identical.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} options - Comparsion options {@link wTools~entityEqualOptions}.
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
 * @function entityIdentical
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

  return _._entityEqual( src1,src2,options );
}

//

/**
 * Deep soft comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * By default uses own( onSameNumbers ) routine to compare numbers using( options.eps ). Returns true if two numbers are NaN, strict equal or
 * ( a - b ) <= ( options.eps ). For example: '_.entityEquivalent( 1, 1.5, { eps : .5 } )' returns true.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} options - Comparsion options {@link wTools~entityEqualOptions}.
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
 * @function entityEquivalent
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

  return _._entityEqual( src1,src2,options );
}

//

/**
 * Deep contain comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
 * Returns true if entity( src1 ) contains keys/values from entity( src2 ) or they are indentical.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} options - Comparsion options {@link wTools~entityEqualOptions}.
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
 * @function entityContain
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

  return _._entityEqual( src1,src2,options );
}

//

 /**
  * Deep comparsion of two entities. Uses recursive comparsion for objects,arrays and array-like objects.
  * Returns string refering to first found difference or false if entities are sames.
  *
  * @param {*} src1 - Entity for comparison.
  * @param {*} src2 - Entity for comparison.
  * @param {wTools~entityEqualOptions} o - Comparsion options {@link wTools~entityEqualOptions}.
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
  * @function entityDiff
  * @throws {exception} If( arguments.length ) is not equal 2 or 3.
  * @throws {exception} If( o ) is not a Object.
  * @throws {exception} If( o ) is extended by unknown property.
  * @memberof wTools
  */

function entityDiff( src1,src2,o )
{

  var o = o || Object.create( null );
  _.assert( arguments.length === 2 || arguments.length === 3 );
  var same = _._entityEqual( src1,src2,o );

  if( same )
  return false;

  var result = '';

  if( !_.primitiveIs( src1 ) )
  src1 = _.toStr( _.entitySelect( src1,o.path ) );

  if( !_.primitiveIs( src2 ) )
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

// --
// define class
// --

var Proto =
{

  // look

  LookIrerator : LookIrerator,

  __lookAct : __lookAct,
  _lookPre : _lookPre,
  _lookBody : _lookBody,
  look : look,
  lookOwn : lookOwn,

  // eacg

  eachSample : eachSample,
  eachInRange : eachInRange,
  eachInManyRanges : eachInManyRanges,
  eachInMultiRange : eachInMultiRange, /* exprerimental */

  entityWrap : entityWrap,
  entitySearch : entitySearch,

  // selector

  _entitySelectOptions : _entitySelectOptions,
  _entitySelect : _entitySelect,
  _entitySelectAct : _entitySelectAct,

  entitySelect : entitySelect,
  entitySelectSet : entitySelectSet,
  entitySelectUnique : entitySelectUnique,

  // transformer

  _entityProbeReport : _entityProbeReport,
  entityProbeField : entityProbeField,
  entityProbe : entityProbe,

  entityGroup : entityGroup, /* experimental */

  // entity checker

  _entityEqualAct : _entityEqualAct,
  _entityEqualIteratorMake : _entityEqualIteratorMake,
  _entityEqual : _entityEqual,

  entityIdentical : entityIdentical,
  entityEquivalent : entityEquivalent,
  entityContain : entityContain,

  entityDiff : entityDiff,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
