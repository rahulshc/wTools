( function _gFunctional_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// scalar
// --

/**
 * Produce a single array from all arguments if cant return single argument as a scalar.
 * If {-scalarAppend-} gets a single argument it returns the argument as is.
 * If {-scalarAppend-} gets an argument and one or more undefined it returns the argument as is.
 * If {-scalarAppend-} gets more than one or less than one defined arguments then it returns array having all defined arguments.
 * If some argument is a Long ( for example array ) then each element of the Long is treated as an argument, not recursively.
 *
 * @function scalarAppend.
 * @memberof wTools
 */

function scalarAppend( dst, src )
{

  _.assert( arguments.length === 2 );

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

function scalarAppendOnce( dst, src )
{

  _.assert( arguments.length === 2 );

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
    _.arrayAppendArrayOnce( dst, src );
    else
    _.arrayAppendElementOnce( dst, src );

  }
  else
  {

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    dst = _.arrayAppendArrayOnce( [ dst ], src );
    else
    dst = _.arrayAppendElementOnce( [ dst ], src );

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
 * _.scalarToVector( 3, 7 );
 * // returns [ 3, 3, 3, 3, 3, 3, 3 ]
 *
 * @example
 * _.scalarToVector( [ 3, 7, 13 ], 3 );
 * // returns [ 3, 7, 13 ]
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
  // _.assert( _.numberIs( dst ) || _.arrayIs( dst ), 'Expects array of number as argument' );
  _.assert( dst !== undefined, 'Expects array or scalar' );
  _.assert( length >= 0 );

  if( _.arrayIs( dst ) )
  {
    _.assert( dst.length === length, () => 'Expects array of length ' + length + ' but got ' + dst.length );
  }
  else
  {
    dst = _.longFill( [], dst, [ 0, length ] );
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
 * Routine eachSample() accepts the container {-sets-} with scalar or vector elements.
 * Routine returns an array of vectors. Each vector is a unique combination of elements of vectors
 * that is passed in option {-sets-}.
 *
 * Routine eachSample() accepts the options map {-o-} or two arguments. If options map
 * is used, all parameters can be set. If passed two arguments, first of them is ( sets )
 * and second is ( onEach ).
 *
 * Routine eachSample() accepts the callback {-onEach-}. Callback accepts two arguments. The first is
 * template {-sample-} and second is index of vector in returned array. Callback can change template {-sample-}
 * and corrupt the building of vectors.
 *
 * @param {Array|Map} sets - Container with vector and scalar elements to combine new vectors.
 * @param {Routine|Null} onEach - Callback that accepts template {-sample-} and index of new vector.
 * @param {Array|Map} sample - Template for new vectors. If not passed, routine create empty container.
 * If sample.length > vector.length, then vector elements replace template elements with the same indexes.
 * @param {boolean} leftToRight - Sets the direction of reading {-sets-}. 1 - left to rigth, 0 - rigth to left. By default is 1.
 * @param {boolean} result - Sets retuned value. 1 - routine returns array with verctors, 0 - routine returns index of last element. By default is 1.
 *
 * @example
 * var got = _.eachSample( { sets : [ [ 0, 1 ], 2 ] });
 * console.log( got );
 * // log [ [ 0, 2 ], [ 1, 2 ] ]
 *
 * @example
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], result : 0 });
 * console.log( got );
 * // log 3
 *
 * @example
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ] });
 * console.log( got );
 * // log [ [ 0, 2 ], [ 1, 2 ],
 *          [ 0, 3 ], [ 1, 3 ] ]
 *
 * @example
 * var got = _.eachSample( { sets : { a : [ 0, 1 ], b : [ 2, 3 ] } });
 * console.log( got );
 * // log [ { a : 0, b : 2}, { a : 1, b : 2},
 *          { a : 0, b : 3}, { a : 1, b : 3} ]
 *
 * @example
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], leftToRight : 0 } );
 * console.log( got );
 * // log [ [ 3, 0 ], [ 2, 0 ],
 *          [ 3, 1 ], [ 2, 1 ] ]
 *
 * @example
 * var got = _.eachSample
 * ({
 *   sets : [ [ 0, 1 ], [ 2, 3 ] ],
 *   sample : [ 2, 3, 4, 5 ]
 * });
 * console.log( got );
 * // log [ [ 3, 0, 4, 5 ], [ 2, 0, 4, 5 ],
 *          [ 3, 1, 4, 5 ], [ 2, 1, 4, 5 ] ]
 *
 * @example
 * function onEach( sample, i )
 * {
 *   _.arrayAppend( got, sample[ i ] );
 * }
 * var got = [];
 * _.eachSample
 * ({
 *   sets : [ [ 0, 1 ], [ 2, 3 ] ],
 *   onEach : onEach,
 *   sample : [ 'a', 'b', 'c', 'd' ]
 * });
 * console.log( got );
 * // log [ 0, 2, 'c', 'd' ]
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
  // qqq: I think containerMakeTrivial should be containerMakeTrivial. 7 missprints founded in wTools. Maybe, willbe contains this also.
  o.sample = _.containerMakeTrivial( o.sets );

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
    result = _.containerMakeTrivial( o.src );
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
    src,
    onEach,
    conditionLevels : 1024,
  });
}

//

function _entityIndex_functor( fop )
{

  fop = _.routineOptions( _entityIndex_functor, fop );

  let extendRoutine = fop.extendRoutine;

  return function entityIndex( src, onEach )
  {
    let result = Object.create( null );

    if( onEach === undefined )
    onEach = function( e, k )
    {
      if( k === undefined && extendRoutine )
      return { [ e ] : undefined };
      return k;
    }
    else if( _.strIs( onEach ) )
    {
      let selector = onEach;
      _.assert( _.routineIs( _.select ) );
      _.assert( _.strBegins( selector, '*/' ), () => `Selector should begins with "*/", but "${selector}" does not` );
      selector = _.strRemoveBegin( selector, '*/' );
      onEach = function( e, k )
      {
        return _.select( e, selector );
      }
    }

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.routineIs( onEach ) );
    _.assert( src !== undefined, 'Expects src' );

    /* */

    if( _.mapLike( src ) )
    {

      for( let k in src )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, val );
      }

    }
    else if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, val );
      }

    }
    else
    {

      let val = src;
      let r = onEach( val, undefined, undefined );
      extend( r, val );

    }

    return result;

    /* */

    function extend( res, val )
    {
      if( res === undefined )
      return;

      if( _.unrollIs( res ) )
      debugger;
      if( _.unrollIs( res ) )
      return res.forEach( ( res ) => extend( res, val ) );

      if( extendRoutine === null )
      {
        if( res !== undefined )
        result[ res ] = val;
      }
      else
      {
        if( _.mapLike( res ) )
        extendRoutine( result, res );
        else if( res !== undefined )
        result[ res ] = val;
      }

    }

  }

}

_entityIndex_functor.defaults =
{
  extendRoutine : null,
}

let entityIndex = _entityIndex_functor({ extendRoutine : null });
let entityIndexExtending = _entityIndex_functor({ extendRoutine : _.mapExtend });
let entityIndexSupplementing = _entityIndex_functor({ extendRoutine : _.mapSupplement });
let entityIndexPrepending = _entityIndex_functor({ extendRoutine : _.mapExtendPrepending });
let entityIndexAppending = _entityIndex_functor({ extendRoutine : _.mapExtendAppending });

//

function _entityRemap_functor( fop )
{

  fop = _.routineOptions( _entityRemap_functor, fop );

  let extendRoutine = fop.extendRoutine;

  return function entityRemap( src, onEach )
  {
    let result = Object.create( null );

    if( onEach === undefined )
    onEach = function( e, k )
    {
      if( e === undefined && extendRoutine )
      return { [ k ] : e };
      return e;
    }
    else if( _.strIs( onEach ) )
    {
      let selector = onEach;
      _.assert( _.routineIs( _.select ) );
      _.assert( _.strBegins( selector, '*/' ), () => `Selector should begins with "*/", but "${selector}" does not` );
      selector = _.strRemoveBegin( selector, '*/' );
      onEach = function( e, k )
      {
        return _.select( e, selector );
      }
    }

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.routineIs( onEach ) );
    _.assert( src !== undefined, 'Expects src' );

    /* */

    if( _.mapLike( src ) )
    {

      for( let k in src )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, k );
      }

    }
    else if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, k );
      }

    }
    else
    {

      let val = src;
      let r = onEach( val, undefined, undefined );
      extend( r, undefined );

    }

    return result;

    /* */

    function extend( res, key )
    {
      if( res === undefined )
      return;

      if( _.unrollIs( res ) )
      return res.forEach( ( res ) => extend( res, key ) );

      if( extendRoutine === null )
      {
        if( key !== undefined )
        result[ key ] = res;
      }
      else
      {
        if( _.mapLike( res ) )
        extendRoutine( result, res );
        else if( key !== undefined )
        result[ key ] = res;
      }

    }

  }

}

_entityRemap_functor.defaults =
{
  extendRoutine : null,
}

let entityRemap = _entityRemap_functor({ extendRoutine : null });
let entityRemapExtending = _entityRemap_functor({ extendRoutine : _.mapExtend });
let entityRemapSupplementing = _entityRemap_functor({ extendRoutine : _.mapSupplement });
let entityRemapPrepending = _entityRemap_functor({ extendRoutine : _.mapExtendPrepending });
let entityRemapAppending = _entityRemap_functor({ extendRoutine : _.mapExtendAppending });

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

  eachSample,

  _entityFilterDeep,
  entityFilterDeep,
  filterDeep : entityFilterDeep,

  _entityIndex_functor,
  entityIndex, /* qqq : add jsdoc, please */
  index : entityIndex,
  entityIndexSupplementing, /* qqq : add jsdoc, please */
  indexSupplementing : entityIndexSupplementing,
  entityIndexExtending, /* qqq : add jsdoc, please */
  indexExtending : entityIndexExtending,
  entityIndexPrepending, /* qqq : add jsdoc, please */
  indexPrepending : entityIndexPrepending,
  entityIndexAppending, /* qqq : add jsdoc, please */
  indexAppending : entityIndexAppending,

  _entityRemap_functor,
  entityRemap, /* qqq : add jsdoc, please */
  remap : entityRemap,
  entityRemapSupplementing, /* qqq : add jsdoc, please */
  remapSupplementing : entityRemapSupplementing,
  entityRemapExtending, /* qqq : add jsdoc, please */
  remapExtending : entityRemapExtending,
  entityRemapPrepending, /* qqq : add jsdoc, please */
  remapPrepending : entityRemapPrepending,
  entityRemapAppending, /* qqq : add jsdoc, please */
  remapAppending : entityRemapAppending,

  // _entityIndexInplace_functor,
  // entityIndexInplace, /* qqq : implement, cover, add jsdoc, please */
  // indexInplace : entityIndexInplace,
  // entityIndexInplaceSupplementing, /* qqq : implement, cover, add jsdoc, please */
  // indexInplaceSupplementing : entityIndexInplaceSupplementing,
  // entityIndexInplaceExtending, /* qqq : implement, cover, add jsdoc, please */
  // indexInplaceExtending : entityIndexInplaceExtending,
  // entityIndexInplacePrepending, /* qqq : implement, cover, add jsdoc, please */
  // indexInplacePrepending : entityIndexInplacePrepending,
  // entityIndexInplaceAppending, /* qqq : implement, cover, add jsdoc, please */
  // indexInplaceAppending : entityIndexInplaceAppending,
  //
  // _entityRemapInplace_functor,
  // entityRemapInplace, /* qqq : implement, cover, add jsdoc, please */
  // remapInplace : entityRemapInplace,
  // entityRemapInplaceSupplementing, /* qqq : implement, cover, add jsdoc, please */
  // remapInplaceSupplementing : entityRemapInplaceSupplementing,
  // entityRemapInplaceExtending, /* qqq : implement, cover, add jsdoc, please */
  // remapInplaceExtending : entityRemapInplaceExtending,
  // entityRemapInplacePrepending, /* qqq : implement, cover, add jsdoc, please */
  // remapInplacePrepending : entityRemapInplacePrepending,
  // entityRemapInplaceAppending, /* qqq : implement, cover, add jsdoc, please */
  // remapInplaceAppending : entityRemapInplaceAppending,

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
