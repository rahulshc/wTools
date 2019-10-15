( function _fFunctional_s_() {

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

function entityEach( src, onEach )
{

  _.assert( arguments.length === 2 );
  _.assert( onEach.length <= 3 );
  _.assert( _.routineIs( onEach ) );

  /* */

  if( _.longIs( src ) )
  {

    for( let k = 0 ; k < src.length ; k++ )
    {
      onEach( src[ k ], k, src );
    }

  }
  // else if( _.objectLike( src ) )
  else if( _.mapLike( src ) )
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
  // else if( _.objectLike( src ) )
  else if( _.mapLike( src ) )
  {

    for( let k in src )
    {
      if( !Object.hasOwnProperty.call( src, k ) )
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

// //
//
// function entityEachKey( src, onEach )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( onEach.length <= 3 );
//   // _.assert( onEach.length <= 2 );
//   _.assert( _.routineIs( onEach ) );
//
//   /* */
//
//   if( _.longIs( src ) )
//   {
//
//     for( let index = 0 ; index < src.length ; index++ )
//     {
//       onEach( src[ index ], undefined, index, src );
//     }
//
//   }
//   else if( _.objectLike( src ) )
//   {
//
//     let index = 0;
//     for( let k in src )
//     {
//       onEach( k, src[ k ], index, src );
//       index += 1;
//     }
//
//   }
//   else
//   {
//     onEach( src, undefined, undefined, undefined );
//   }
//
//   /* */
//
//   return src;
//
//   // if( arguments.length === 2 )
//   // o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }
//   //
//   // _.routineOptions( eachKey, o );
//   // _.assert( arguments.length === 1 || arguments.length === 2 );
//   // _.assert( o.onUp && o.onUp.length <= 3 );
//   //
//   // /* */
//   //
//   // if( _.longIs( o.src ) )
//   // {
//   //
//   //   for( let index = 0 ; index < o.src.length ; index++ )
//   //   {
//   //     o.onUp.call( o, o.src[ index ], undefined, index );
//   //   }
//   //
//   // }
//   // else if( _.objectLike( o.src ) )
//   // {
//   //
//   //   let index = 0;
//   //   for( let k in o.src )
//   //   {
//   //     o.onUp.call( o, k, o.src[ k ], index );
//   //     index += 1;
//   //   }
//   //
//   // }
//   // else _.assert( 0, 'not container' );
//   //
//   // /* */
//   //
//   // return src;
// }
//
// var defaults = entityEachKey.defaults = Object.create( null );
//
// defaults.src = null;
// defaults.onUp = function( e, k ){};

//

/*

LongLike / MapLike / HashMapLike / SetLike


_.only( Array::dst, Map::src );
_.only( Array::dst, Set::src );

*/

function entityOnly( dst, src, onEach )
{

  if( arguments.length > 2 )
  onEach = arguments[ arguments.length-1 ];

  if( src === undefined )
  src = dst;

  if( _.strIs( onEach ) )
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

  let dstTypeStr = typeStr( dst );
  let srcTypeStr = typeStr( src );

  _.assert( dst === null || dstTypeStr === srcTypeStr );
  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ), 'Expects optional routine or selector {- onEach -}' );

  /* */

/*

  let srcHas = null;
  if ...
  srcHas = srcHasMap;
  else ...
  srcHas = srcHasSet;

*/

  /* */

  if( dst !== null )
  // if( dst === src )
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutineDeleting();
      else
      withRoutineDeleting();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutineDeleting();
      else
      withoutRoutineDeleting();
    }

  }
  else
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutine();
      else
      withRoutine();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutine();
      else
      withoutRoutine(); /* don't change the subroutine */
    }

  }

  /* */

  return dst;

  /* */

  // function srcHasMap( e )
  // {
  // }
  //
  // /* */
  //
  // function srcHasSet( e )
  // {
  // }

  /* */

  function setWithRoutine()
  {
    dst = new Set( src );

    for( let value of src )
    {
      let res = onEach( value, value, src );
      if( !res )
      dst.delete( value );
    }
  }

  /* */

  function setWithoutRoutine()
  {
    dst = new Set( src );

    let unnecessaries = [ null, 0, undefined, false, '' ];
    for( let key of unnecessaries )
    if( dst.has( key ) )
    dst.delete( key );
  }

  /* */

  function hashMapWithRoutine()
  {
    dst = new Map( src );

    for ( let [ key, value ] of src )
    {
      let res = onEach( value, key, src );
      if( !res )
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithoutRoutine()
  {
    dst = new Map( src );

    for ( let [ key, value ] of dst )
    if( !value )
    dst.delete( key );
  }

  /* */

  function withRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0 ; k < src.length ; k++ )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = onEach( src, undefined, undefined );
      if( res )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0 ; k < src.length ; k++ )
      {
        let res = src[ k ];
        if( res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = src[ k ];
        if( res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = src;
      if( res )
      dst = res;
      else
      dst = undefined;
    }

  }

  /* */

  function setWithRoutineDeleting()
  {
    for( let value of src )
    {
      let res = onEach( value, value, src );
      if( !res )
      dst.delete( value );
    }
  }

  /* */

  function setWithoutRoutineDeleting()
  {
    let unnecessaries = [ null, 0, undefined, false, '' ];
    for( let key of unnecessaries )
    {
      if( src.has( key ) )
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithRoutineDeleting()
  {
    for ( let [ key, value ] of src )
    {
      let res = onEach( value, key, src )
      if( !res )
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithoutRoutineDeleting()
  {
    for ( let [ key, value ] of src )
    if( !value )
    dst.delete( key );
  }

  /* */

  function withRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res = onEach( src[ k ], k, src );
        if( !res )
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res = onEach( src[ k ], k, src );
        if( !res )
        delete dst[ k ];
      }

    }
    else
    {
      let res = onEach( src, undefined, undefined );
      if( !res )
      dst = undefined;
    }

  }

  // function withRoutineDeleting()
  // {
  //
  //   if( _.longIs( src ) )
  //   {
  //
  //     if( src === dst )
  //     {
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = onEach( src[ k ], k2, src );
  //         if( !res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //     else
  //     {
  //       debugger;
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = onEach( src[ k2 ], k2, src );
  //         if( !res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //
  //   }
  //   else if( _.mapLike( src ) )
  //   {
  //
  //     for( let k in dst )
  //     {
  //       let res = onEach( src[ k ], k, src );
  //       if( !res )
  //       delete dst[ k ];
  //     }
  //
  //   }
  //   else
  //   {
  //     let res = onEach( src, undefined, undefined );
  //     if( !res )
  //     dst = undefined;
  //     else
  //     dst = dst;
  //   }
  //
  // }

  /* */

  function withoutRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res = src[ k ];
        if( !res )
        dst.splice( k, 1 );
      }
    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res = src[ k ];
        if( !res )
        delete dst[ k ];
      }

    }
    else
    {
      let res = src;
      if( !res )
      dst = undefined;
    }

  }

  // function withoutRoutineDeleting()
  // {
  //
  //   if( _.longIs( src ) )
  //   {
  //
  //     if( src === dst )
  //     {
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = src[ k ];
  //         if( !res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //     else
  //     {
  //       debugger;
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = src[ k2 ];
  //         if( !res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //
  //   }
  //   else if( _.mapLike( src ) )
  //   {
  //
  //     for( let k in dst )
  //     {
  //       let res = src[ k ];
  //       if( !res )
  //       delete dst[ k ];
  //     }
  //
  //   }
  //   else
  //   {
  //     let res = src;
  //     if( !res )
  //     dst = undefined;
  //     else
  //     dst = dst;
  //   }
  //
  // }

  function typeStr( e )
  {
    let type;
    if( _.longIs( e ) )
    type = 'long';
    else if( _.mapLike( e ) )
    type = 'map';
    else if( _.setIs( e ) )
    type = 'set';
    else if( _.hashMapIs( e ) )
    type = 'hashMap';
    else
    type = 'primitive';

    return type;
  }

}

//

function entityBut( dst, src, onEach )
{

  if( arguments.length > 2 )
  onEach = arguments[ arguments.length-1 ];

  if( src === undefined )
  src = dst;

  if( _.strIs( onEach ) )
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

  let dstTypeStr = typeStr( dst );
  let srcTypeStr = typeStr( src );

  _.assert( dst === null || dstTypeStr === srcTypeStr );
  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ), 'Expects optional routine or selector {- onEach -}' );

  /* */

  if( dst !== null )
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutineDeleting();
      else
      withRoutineDeleting();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutineDeleting();
      else
      withoutRoutineDeleting();
    }

  }
  else
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutine();
      else
      withRoutine();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutine();
      else
      withoutRoutine(); /* don't change the subroutine */
    }

  }

  /* */

  return dst;

  /* */

  function setWithRoutine()
  {
    dst = new Set( null );

    for( let value of src )
    {
      let res = onEach( value, value, src );
      if( !res )
      dst.add( value );
    }
  }

  /* */

  function setWithoutRoutine()
  {
    dst = new Set( null );

    // Dmytro : it'll be faster, but can't keep order of elements
    // let unnecessaries = [ undefined, 0, null, false, '' ];
    // for( let key of unnecessaries )
    // if( src.has( key ) )
    // dst.add( key );
    for( let e of src )
    if( !e )
    dst.add( e );
  }

  /* */

  function hashMapWithRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    {
      let res = onEach( value, key, src );
      if( !res )
      dst.set( key, value );
    }
  }

  /* */

  function hashMapWithoutRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    if( !value )
    dst.set( key, value );
  }

  /* */

  function withRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0 ; k < src.length ; k++ )
      {
        let res = onEach( src[ k ], k, src );
        if( !res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = onEach( src[ k ], k, src );
        if( !res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = onEach( src, undefined, undefined );
      if( !res )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0 ; k < src.length ; k++ )
      {
        let res = src[ k ];
        if( !res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = src[ k ];
        if( !res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = src;
      if( !res )
      dst = res;
      else
      dst = undefined;
    }

  }

  /* */

  function setWithRoutineDeleting()
  {
    for( let value of src )
    {
      let res = onEach( value, value, src );
      if( res )
      dst.delete( value );
    }
  }

  /* */

  function setWithoutRoutineDeleting()
  {
    for( let value of src )
    {
      if( value )
      dst.delete( value );
    }
  }

  /* */

  function hashMapWithRoutineDeleting()
  {
    for ( let [ key, value ] of src )
    {
      let res = onEach( value, key, src )
      if( res )
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithoutRoutineDeleting()
  {
    for ( let [ key, value ] of src )
    if( value )
    dst.delete( key );
  }

  /* */

  function withRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        delete dst[ k ];
      }

    }
    else
    {
      let res = onEach( src, undefined, undefined );
      if( res )
      dst = undefined;
    }

  }

  // function withRoutineDeleting()
  // {
  //
  //   if( _.longIs( src ) )
  //   {
  //
  //     if( src === dst )
  //     {
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = onEach( src[ k ], k2, src );
  //         if( res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //     else
  //     {
  //       debugger;
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = onEach( src[ k2 ], k2, src );
  //         if( res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //
  //   }
  //   else if( _.mapLike( src ) )
  //   {
  //
  //     for( let k in dst )
  //     {
  //       let res = onEach( src[ k ], k, src );
  //       if( res )
  //       delete dst[ k ];
  //     }
  //
  //   }
  //   else
  //   {
  //     let res = onEach( src, undefined, undefined );
  //     if( !res )
  //     dst = dst;
  //     else
  //     dst = undefined;
  //   }
  //
  // }

  /* */

  function withoutRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res = src[ k ];
        if( res )
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res = src[ k ];
        if( res )
        delete dst[ k ];
      }

    }
    else
    {
      let res = src;
      if( res )
      dst = undefined;
      else
      dst = dst;
    }

  }

  // function withoutRoutineDeleting()
  // {
  //
  //   if( _.longIs( src ) )
  //   {
  //
  //     if( src === dst )
  //     {
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = src[ k ];
  //         if( res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //     else
  //     {
  //       debugger;
  //       let k2 = 0;
  //       for( let k = 0 ; k < dst.length ; k++, k2++ )
  //       {
  //         let res = src[ k2 ];
  //         if( res )
  //         {
  //           dst.splice( k, 1 );
  //           k -= 1;
  //         }
  //       }
  //     }
  //
  //   }
  //   else if( _.mapLike( src ) )
  //   {
  //
  //     for( let k in dst )
  //     {
  //       let res = src[ k ];
  //       if( res )
  //       delete dst[ k ];
  //     }
  //
  //   }
  //   else
  //   {
  //     let res = src;
  //     if( res )
  //     dst = undefined;
  //     else
  //     dst = dst;
  //   }
  //
  // }

  function typeStr( e )
  {
    let type;
    if( _.longIs( e ) )
    type = 'long';
    else if( _.mapLike( e ) )
    type = 'map';
    else if( _.setIs( e ) )
    type = 'set';
    else if( _.hashMapIs( e ) )
    type = 'hashMap';
    else
    type = 'primitive';

    return type;
  }

}

// function entityBut( src, onEach )
// {
//   let result;
//
//   if( _.strIs( onEach ) )
//   {
//     let selector = onEach;
//     _.assert( _.routineIs( _.select ) );
//     _.assert( _.strBegins( selector, '*/' ), () => `Selector should begins with "*/", but "${selector}" does not` );
//     selector = _.strRemoveBegin( selector, '*/' );
//     onEach = function( e, k )
//     {
//       return _.select( e, selector );
//     }
//   }
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ), 'Expects optional routine or selector {- onEach -}' );
//
//   /* */
//
//   if( _.routineIs( onEach ) )
//   {
//
//     if( _.longIs( src ) )
//     {
//
//       result = [];
//       for( let k = 0 ; k < src.length ; k++ )
//       {
//         let res = onEach( src[ k ], k, src );
//         if( !res )
//         result.push( src[ k ] );
//       }
//
//     }
//     else if( _.mapLike( src ) )
//     {
//
//       result = Object.create( null );
//       for( let k in src )
//       {
//         let res = onEach( src[ k ], k, src );
//         if( !res )
//         result[ k ] = src[ k ];
//       }
//
//     }
//     else
//     {
//       let res = onEach( src, undefined, undefined );
//       if( !res )
//       result = src;
//     }
//
//   }
//   else
//   {
//
//     if( _.longIs( src ) )
//     {
//
//       result = [];
//       for( let k = 0 ; k < src.length ; k++ )
//       {
//         let res = src[ k ];
//         if( !res )
//         result.push( src[ k ] );
//       }
//
//     }
//     else if( _.mapLike( src ) )
//     {
//
//       result = Object.create( null );
//       for( let k in src )
//       {
//         let res = src[ k ];
//         if( !res )
//         result[ k ] = src[ k ];
//       }
//
//     }
//     else
//     {
//       let res = src;
//       if( !res )
//       result = res;
//     }
//
//   }
//
//   /* */
//
//   return result;
// }

//

function entityAnd( dst, src, onEach )
{

  if( arguments.length > 2 )
  onEach = arguments[ arguments.length-1 ];

  if( src === undefined )
  src = dst;

  if( _.strIs( onEach ) )
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

  let dstTypeStr = typeStr( dst );
  let srcTypeStr = typeStr( src );

  _.assert( dst === null || dstTypeStr === srcTypeStr );
  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ), 'Expects optional routine or selector {- onEach -}' );

  /* */

  if( dst !== null )
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutineDeleting();
      else
      withRoutineDeleting();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutineDeleting();
      else
      withoutRoutineDeleting();
    }

  }
  else
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutine();
      else
      withRoutine();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutine();
      else
      withoutRoutine(); /* don't change the subroutine */
    }

  }

  return dst;

  /* */

  function setWithRoutine()
  {
    dst = new Set( null );

    for( let value of src )
    {
      let res = onEach( value, value, src );
      if( res )
      dst.add( value );
    }
  }

  /* */

  function setWithoutRoutine()
  {
    dst = new Set( src );

    let unnecessaries = [ null, 0, undefined, false, '' ];
    for( let key of unnecessaries )
    if( src.has( key ) )
    dst.delete( key );
  }

  /* */

  function hashMapWithRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    {
      let res = onEach( value, key, src );
      if( res )
      dst.set( key, value );
    }
  }

  /* */

  function hashMapWithoutRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    if( value )
    dst.set( key, value );
  }

  /* */

  function withRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0; k < src.length; k++ )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = onEach( src, undefined, undefined );
      if( res )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0; k < src.length; k++ )
      {
        let res = src[ k ];
        if( res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = src[ k ];
        if( res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = src;
      if( res )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function setWithRoutineDeleting()
  {

    for( let value of dst )
    {
      let res1, res2;
      let from = [ ... src ]

      res1 = onEach( value, value, dst );
      if( res1 && from.lastIndexOf( value ) !== -1 )
      res2 = onEach( value, value, from );
      else if( res1 )
      res2 = onEach( undefined, undefined, src );

      if( !res1 || !res2 )
      dst.delete( value );
    }
  }

  /* */

  function setWithoutRoutineDeleting()
  {
    for( let value of dst )
    {
      if( !value || !src.has( value ) )
      dst.delete( value );
    }
  }

  /* */

  function hashMapWithRoutineDeleting()
  {
    for ( let [ key, value ] of dst )
    {
      let res1, res2;
      res1 = onEach( value, key, dst )
      if( res1 !== undefined && src.has( key ) )
      res2 = onEach( src.get( key ), key, src );

      if( !res1 || !res2 )
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithoutRoutineDeleting()
  {
    for ( let [ key, value ] of dst )
    if( !value || !src.get( key ) )
    dst.delete( key );
  }

  /* */

  function withRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      dst = _.arrayIs( dst ) ? dst : _.arrayMake( dst );
      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res1, res2;
        res1 = onEach( dst[ k ], k, dst );
        if( res1 )
        res2 = onEach( src[ k ], k, src );
        if( !res1 || !res2 )
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res1, res2;
        res1 = onEach( dst[ k ], k, dst );
        if( res1 )
        res2 = onEach( src[ k ], k, src );
        if( !res1 || !res2 )
        delete dst[ k ];
      }

    }
    else
    {
      let res1, res2;
      res1 = onEach( dst, undefined, undefined );
      if( res1 )
      res2 = onEach( src, undefined, undefined );
      if( !res1 || !res2 )
      dst = undefined;
    }

  }

  /* */

  function withoutRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      dst = _.arrayIs( dst ) ? dst : _.arrayMake( dst );
      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res1 = dst[ k ];
        let res2 = src[ k ];
        if( !res1 || !res2 )
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res1 = dst[ k ];
        let res2 = src[ k ];
        if( !res1 || !res2 )
        delete dst[ k ];
      }

    }
    else
    {
      let res1 = dst;
      let res2 = src;
      if( !res1 || !res2 )
      dst = undefined;
    }

  }

  function typeStr( e )
  {
    let type;
    if( _.longIs( e ) )
    type = 'long';
    else if( _.mapLike( e ) )
    type = 'map';
    else if( _.setIs( e ) )
    type = 'set';
    else if( _.hashMapIs( e ) )
    type = 'hashMap';
    else
    type = 'primitive';

    return type;
  }

}

//

function entityOr( dst, src, onEach )
{

  if( arguments.length > 2 )
  onEach = arguments[ arguments.length-1 ];

  if( src === undefined )
  src = dst;

  if( _.strIs( onEach ) )
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

  let dstTypeStr = typeStr( dst );
  let srcTypeStr = typeStr( src );

  _.assert( dst === null || dstTypeStr === srcTypeStr );
  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ), 'Expects optional routine or selector {- onEach -}' );

  /* */

  if( dst !== null )
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutineDeleting();
      else
      withRoutineDeleting();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutineDeleting();
      else
      withoutRoutineDeleting();
    }

  }
  else
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutine();
      else
      withRoutine();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutine();
      else
      withoutRoutine(); /* don't change the subroutine */
    }

  }

  return dst;

  /* */

  function setWithRoutine()
  {
    dst = new Set( null );

    for( let value of src )
    {
      let res = onEach( value, value, src );
      if( res )
      dst.add( value );
    }
  }

  /* */

  function setWithoutRoutine()
  {
    dst = new Set( src );

    let unnecessaries = [ null, 0, undefined, false, '' ];
    for( let key of unnecessaries )
    if( src.has( key ) )
    dst.delete( key );
  }

  /* */

  function hashMapWithRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    {
      let res = onEach( value, key, src );
      if( res )
      dst.set( key, value );
    }
  }

  /* */

  function hashMapWithoutRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    if( value )
    dst.set( key, value );
  }

  /* */

  function withRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0; k < src.length; k++ )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = onEach( src[ k ], k, src );
        if( res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = onEach( src, undefined, undefined );
      if( res )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0; k < src.length; k++ )
      {
        let res = src[ k ];
        if( res )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res = src[ k ];
        if( res )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res = src;
      if( res )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function setWithRoutineDeleting()
  {
    for( let key of dst )
    {
      let res1, res2;
      res1 = onEach( key, key, dst );
      if( !res1 && src.has( key ) )
      res2 = onEach( key, key, src );
      else
      res2 = onEach( undefined, undefined, src );

      if( !res1 && !res2 )
      dst.delete( key );
    }
  }

  /* */

  function setWithoutRoutineDeleting()
  {
    for( let value of dst )
    {
      if( !value )
      dst.delete( value );
    }
  }

  /* */

  function hashMapWithRoutineDeleting()
  {
    for ( let [ key, value ] of dst )
    {
      let res1, res2
      res1 = onEach( value, key, dst )
      if( !res1 && src.has( key ) )
      res2 = onEach( src.get( key ), key, src );
      else
      res2 = onEach( undefined, undefined, src );

      if( res1 )
      dst.set( key, value );
      else if( res2 )
      dst.set( key, src.get( key ) );
      else
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithoutRoutineDeleting()
  {
    for ( let [ key, value ] of dst )
    {
      if( !value )
      {
        let res = src.get( key );

        if( res )
        dst.set( key, res );
        else
        dst.delete( key );
      }
    }
  }

  /* */

  function withRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      dst = _.arrayIs( dst ) ? dst : _.arrayMake( dst );
      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res1, res2;
        res1 = onEach( dst[ k ], k, dst );
        if( !res1 )
        res2 = onEach( src[ k ], k, src );

        if( res1 )
        dst[ k ] = dst[ k ];
        else if( res2 )
        dst[ k ] = src[ k ];
        else
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res1, res2;
        res1 = onEach( dst[ k ], k, dst );
        if( !res1 )
        res2 = onEach( src[ k ], k, src );

        if( res1 )
        dst[ k ] = dst[ k ];
        else if( res2 )
        dst[ k ] = src[ k ];
        else
        delete dst[ k ];
      }

    }
    else
    {
      let res1, res2;
      res1 = onEach( dst, undefined, undefined );
      if( !res1 )
      res2 = onEach( src, undefined, undefined );

      if( res1 )
      dst = dst;
      else if( res2 )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      dst = _.arrayIs( dst ) ? dst : _.arrayMake( dst );
      for( let k = dst.length - 1; k >= 0; k-- )
      {
        let res1 = dst[ k ];
        let res2 = src[ k ];

        if( res1 )
        dst[ k ] = dst[ k ];
        else if( res2 )
        dst[ k ] = src[ k ];
        else
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in dst )
      {
        let res1 = dst[ k ];
        let res2 = src[ k ];

        if( res1 )
        dst[ k ] = dst[ k ];
        else if( res2 )
        dst[ k ] = src[ k ];
        else
        delete dst[ k ];
      }

    }
    else
    {
      let res1 = dst;
      let res2 = src;

      if( res1 )
      dst = dst;
      else if( res2 )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function typeStr( e )
  {
    let type;
    if( _.longIs( e ) )
    type = 'long';
    else if( _.mapLike( e ) )
    type = 'map';
    else if( _.setIs( e ) )
    type = 'set';
    else if( _.hashMapIs( e ) )
    type = 'hashMap';
    else
    type = 'primitive';

    return type;
  }

}

//

function entityXor( dst, src, onEach )
{

  if( arguments.length > 2 )
  onEach = arguments[ arguments.length-1 ];

  if( src === undefined )
  src = dst;

  if( _.strIs( onEach ) )
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

  let dstTypeStr = typeStr( dst );
  let srcTypeStr = typeStr( src );

  _.assert( dst === null || dstTypeStr === srcTypeStr );
  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ), 'Expects optional routine or selector {- onEach -}' );

  /* */

  if( dst !== null )
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutineDeleting();
      else
      withRoutineDeleting();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutineDeleting();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutineDeleting();
      else
      withoutRoutineDeleting();
    }

  }
  else
  {

    if( _.routineIs( onEach ) )
    {
      if( srcTypeStr === 'set' )
      setWithRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithRoutine();
      else
      withRoutine();
    }
    else
    {
      if( srcTypeStr === 'set' )
      setWithoutRoutine();
      else if( srcTypeStr === 'hashMap' )
      hashMapWithoutRoutine();
      else
      withoutRoutine(); /* don't change the subroutine */
    }

  }

  return dst;

  /* */

  function setWithRoutine()
  {
    dst = new Set( null );

    for( let value of src )
    {
      let res1 = onEach( undefined, undefined, dst );
      let res2 = onEach( value, value, src );

      if( ( res1 && !res2 ) || ( !res1 && res2 ) )
      dst.add( value );
    }
  }

  /* */

  function setWithoutRoutine()
  {
    dst = new Set( src );

    let unnecessaries = [ null, 0, undefined, false, '' ];
    for( let e of unnecessaries )
    dst.delete( e );
  }

  /* */

  function hashMapWithRoutine()
  {
    dst = new Map( null );

    for ( let [ key, value ] of src )
    {
      let res1 = onEach( undefined, undefined, dst );
      let res2 = onEach( value, key, src );

      if( ( res1 && !res2 ) || ( !res1 && res2 ) )
      dst.set( key, value );
    }
  }

  /* */

  function hashMapWithoutRoutine()
  {
    dst = new Map( src );

    let unnecessaries = [ null, 0, undefined, false, '' ];
    for( let k of unnecessaries )
    {
      if( !dst.get( k ) )
      dst.delete( k );
    }
  }

  /* */

  function withRoutine()
  {

    if( _.longIs( src ) )
    {

      dst = [];
      for( let k = 0; k < src.length; k++ )
      {
        let res1 = onEach( undefined, undefined, dst );
        let res2 = onEach( src[ k ], k, src );

        if( ( res1 && !res2 ) || ( !res1 && res2 ) )
        dst.push( src[ k ] );
      }

    }
    else if( _.mapLike( src ) )
    {

      dst = Object.create( null );
      for( let k in src )
      {
        let res1 = onEach( undefined, undefined, dst );
        let res2 = onEach( src[ k ], k, src );

        if( ( res1 && !res2 ) || ( !res1 && res2 ) )
        dst[ k ] = src[ k ];
      }

    }
    else
    {
      let res1 = onEach( null );
      let res2 = onEach( src, undefined, undefined );
      if( ( res1 && !res2 ) || ( !res1 && res2 ) )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutine()
  {

    if( _.longIs( src ) )
    {
      dst = [];
      for( let e of src )
      if( e )
      dst.push( e );
    }
    else if( _.mapLike( src ) )
    {
      dst = Object.assign( {}, src );
      let  unnecessaries = [ null, 0, undefined, false, '' ];
      for( let k of unnecessaries )
      {
        if( !dst[ k ] )
        delete dst[ k ];
      }
    }
    else
    {
      if( src !== undefined )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function setWithRoutineDeleting()
  {
    for( let key of dst )
    {
      let res = onEach( key, key, dst );
      if( !res )
      dst.delete( key );
    }

    for( let key of src )
    {
      let res1, res2;
      if( dst.has( key ) )
      res1 = onEach( key, key, dst );
      else
      res1 = onEach( undefined, undefined, dst );
      res2 = onEach( key, key, src );

      if( res1 && !res2 )
      {}
      else if( !res1 && res2 )
      dst.add( key );
      else
      dst.delete( key );
    }
  }

  /* */

  function setWithoutRoutineDeleting()
  {
    for( let key of dst )
    if( !key )
    dst.delete( key );
    for( let key of src )
    {
      if( dst.has( key ) )
      dst.delete( key );
      else if( key )
      dst.add( key );
    }
  }

  /* */

  function hashMapWithRoutineDeleting()
  {
    for( let [ key, value ] of dst )
    {
      let res = onEach( value, key, dst )
      if( !res )
      dst.delete( key );
    }
    for( let [ key, value ] of src )
    {
      let res1, res2
      if( dst.has( key ) )
      res1 = onEach( dst.get( key ), key, dst );
      else
      res1 = onEach( undefined, undefined, dst );
      res2 = onEach( value, key, src )

      if( res1 && !res2 )
      {}
      else if( !res1 && res2 )
      dst.set( key, value );
      else
      dst.delete( key );
    }
  }

  /* */

  function hashMapWithoutRoutineDeleting()
  {
    for( let [ key, value ] of dst )
    if( !value )
    dst.delete( key );
    for ( let [ key, value ] of src )
    {
      let res1 = dst.get( key );
      let res2 = value;

      if( res1 && !res2 )
      {}
      else if( !res1 && res2 )
      dst.set( key, value );
      else
      dst.delete( key );
    }
  }

  /* */

  function withRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      dst = _.arrayIs( dst ) ? dst : _.arrayMake( dst );
      for( let k = src.length - 1; k >= 0; k-- )
      {
        let res1 = onEach( dst[ k ], k, dst );
        let res2 = onEach( src[ k ], k, src );

        if( res1 && !res2 )
        {}
        else if( !res1 && res2 )
        dst[ k ] = src[ k ];
        else
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in src )
      {
        let res1 = onEach( dst[ k ], k, dst );
        let res2 = onEach( src[ k ], k, src );

        if( res1 && !res2 )
        {}
        else if( !res1 && res2 )
        dst[ k ] = src[ k ];
        else
        delete dst[ k ];
      }

    }
    else
    {
      let res1 = onEach( dst, undefined, undefined );
      let res2 = onEach( src, undefined, undefined );

      if( res1 && !res2 )
      {}
      else if( !res1 && res2 )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function withoutRoutineDeleting()
  {

    if( _.longIs( dst ) )
    {

      dst = _.arrayIs( dst ) ? dst : _.arrayMake( dst );
      for( let k = src.length - 1; k >= 0; k-- )
      {
        let res1 = dst[ k ];
        let res2 = src[ k ];

        if( res1 && !res2 )
        {}
        else if( !res1 && res2 )
        dst[ k ] = src[ k ];
        else
        dst.splice( k, 1 );
      }

    }
    else if( _.mapLike( dst ) )
    {

      for( let k in src )
      {
        let res1 = dst[ k ];
        let res2 = src[ k ];

        if( res1 && !res2 )
        {}
        else if( !res1 && res2 )
        dst[ k ] = src[ k ];
        else
        delete dst[ k ];
      }

    }
    else
    {
      let res1 = dst;
      let res2 = src;

      if( res1 && !res2 )
      {}
      else if( !res1 && res2 )
      dst = src;
      else
      dst = undefined;
    }

  }

  /* */

  function typeStr( e )
  {
    let type;
    if( _.longIs( e ) )
    type = 'long';
    else if( _.mapLike( e ) )
    type = 'map';
    else if( _.setIs( e ) )
    type = 'set';
    else if( _.hashMapIs( e ) )
    type = 'hashMap';
    else
    type = 'primitive';

    return type;
  }

}

//

function entityAll( src, onEach )
{
  let result = true;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 3 ) );

  /* */

  if( _.routineIs( onEach ) )
  {

    if( _.setLike( src ) )
    {

      for( let e of src )
      {
        result = onEach( e, undefined, src );
        if( !result )
        return result;
      }

    }
    else if( _.hashMapIs( src ) )
    {

      for( let [ key, value ] of src )
      {
        result = onEach( value, key, src );
        if( !result )
        return result
      }

    }
    else if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        result = onEach( src[ k ], k, src );
        if( !result )
        return result;
      }

    }
    // else if( _.objectLike( src ) )
    else if( _.mapLike( src ) )
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

    if( _.longIs( src ) || _.setLike( src ) )
    {

      for( let e of src )
      {
        result = e;
        if( !result )
        return result;
      }
      // for( let k = 0 ; k < src.length ; k++ )
      // {
      //   result = src[ k ];
      //   if( !result )
      //   return result;
      // }

    }
    // else if( _.objectLike( src ) )
    else if( _.hashMapIs( src ) )
    {

      for( let [ key, value ] of src )
      {
        result = value;
        if( !result )
        return result;
      }

    }
    else if( _.mapLike( src ) )
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
    // else if( _.objectLike( src ) )
    else if( _.mapLike( src ) )
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
    // else if( _.objectLike( src ) )
    else if( _.mapLike( src ) )
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
    // else if( _.objectLike( src ) )
    else if( _.mapLike( src ) )
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
    // else if( _.objectLike( src ) )
    else if( _.mapLike( src ) )
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
 * let check = _._filter_functor( { a : 1, b : 1, c : 1 } );
 * check( { a : 1 } );
 * // returns Object {a: 1}
 *
 * @example
 * function condition( src ){ return src.y === 1 }
 * let check = _._filter_functor( condition );
 * check( { a : 2 } );
 * // returns false
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
        template,
        src : e,
        levels
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
 * let numbers = [ 3, 4, 6 ];
 * function sqrt( v )
 * {
 *   return v * v;
 * };
 *
 * _.entityMap( numbers, sqrt );
 * // returns [ 9, 16, 36 ]
 * // numbers is still [ 3, 4, 6 ]
 *
 * @example
 * function checkSidesOfTriangle( v, i, src )
 * {
 *   let sumOthers = 0,
 *     l = src.length,
 *     j;
 *
 *   for ( j = 0; j < l; j++ )
 *   {
 *     if ( i === j ) continue;
 *     sumOthers += src[ j ];
 *   }
 *   return v < sumOthers;
 * }
 *
 * _.entityMap( numbers, checkSidesOfTriangle );
 * // returns [ true, true, true ]
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
    result = _.entityMakeUndefined( src );
    for( let s = 0 ; s < src.length ; s++ )
    {
      result[ s ] = onEach( src[ s ], s, src );
      _.assert( result[ s ] !== undefined, '{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )' )
    }
  }
  // else if( _.objectLike( src ) )
  else if( _.mapLike( src ) )
  {
    result = _.entityMakeUndefined( src );
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

    result = _.entityMakeUndefined( src );
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
 * _._entityMost([ 1, 3, 3, 9, 10 ], undefined, 0 );
 * // returns { index: 0, key: 0, value: 1, element: 1 }
 *
 * @example
 * _._entityMost( [ 1, 3, 3, 9, 10 ], undefined, 1 );
 * // returns { index: 4, key: 4, value: 10, element: 10 }
 *
 * @example
 * _._entityMost( { a : 1, b : 2, c : 3 }, undefined, 0 );
 * // returns { index: 4, key: 4, value: 10, element: 10 }
 *
 * @private
 * @function _entityMost
 * @throws {Exception} If( arguments.length ) is not equal 3.
 * @throws {Exception} If( onEvaluate ) function is not implemented.
 * @memberof wTools
 */

/*
qqq : refactor routine _entityMost
- make o-fication
- make it accept evaluator or comparator( not in the same call )
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
  else if( _.mapLike( src ) )
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
  else _.assert( 0 );

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
 *  let obj = { a : 25, b : 16, c : 9 };
 *  _.entityMin( obj, Math.sqrt );
 *  // returns { index : 2, key : 'c', value 3: , element : 9  };
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
 *  let obj = { a: 25, b: 16, c: 9 };
 *  _.entityMax( obj );
 *  // returns { index: 0, key: "a", value: 25, element: 25 };
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

  // scalar

  scalarAppend,
  // scalarPrepend, /* qqq : implement and cover routine scalarPrepend, pelase */
  scalarAppendOnce,
  // scalarPrependOnce, /* qqq : implement and cover routine scalarPrependOnce, pelase */

  scalarToVector,
  scalarFrom,
  scalarFromOrNull,

  // multiplier

  dup,
  multiple,
  multipleAll,

  // entity iterator

  entityEach,
  each : entityEach,
  entityEachOwn,
  eachOwn : entityEachOwn,

  // entityEachKey,
  // eachKey : entityEachKey,

  /* qqq : take _.nothing case in routines only, but, all, any, none */

  entityOnly, /* qqq : optimize, implement good coverage and jsdoc, please */
  only : entityOnly,
  entityBut, /* qqq : optimize, implement good coverage and jsdoc, please */
  but : entityBut,
  entityAnd, /* qqq : optimize, implement good coverage and jsdoc, please */
  and : entityAnd,
  entityOr, /* qqq : optimize, implement good coverage and jsdoc, please */
  or : entityOr,
  entityXor,
  xor : entityXor,

  entityAll, /* qqq : optimize entityAll */
  all : entityAll,
  entityAny, /* qqq : optimize entityAny */
  any : entityAny,
  entityNone, /* qqq : optimize entityNone */
  none : entityNone,

  _filter_functor, /* qqq : cover please */

  entityMap,
  map : entityMap,
  entityFilter,
  filter : entityFilter,

  /* qqq : take into account Unroll case in routines filter, filterInplace */

  //

  _entityMost, // qqq : refactor routine _entityMost
  entityMin,
  min : entityMin,
  entityMax,
  max : entityMax,

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
