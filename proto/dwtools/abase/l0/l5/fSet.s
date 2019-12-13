( function _fSet_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
// let Self = _.set = _.set || Object.create( null );
let Self = _;

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
 * _.arraySetDiff( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 * // returns [ 1, 2, 3, 4, 5, 6 ]
 *
 * @example
 * _.arraySetDiff( [ 1, 2, 4 ], [ 1, 3, 5 ] );
 * // returns [ 2, 4, 3, 5 ]
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

/* qqq2 : cant use container adapter! | Dmytro : containerAdapter is not used */

//

function _arraySetHas( src, e, onEvaluate1, onEvaluate2 ) 
{
  _.assert( onEvaluate2 === undefined || _.routineIs( onEvaluate2 ) );

  let fromIndex = 0;
  if( _.numberIs( onEvaluate1 ) )
  {
    fromIndex = onEvaluate1;
    onEvaluate1 = onEvaluate2;
    onEvaluate2 = undefined;
  }

  if( _.routineIs( onEvaluate1 ) )
  {
    if( onEvaluate1.length === 2 )
    {
      _.assert( !onEvaluate2 );

      for( let el of src )
      {
        if( fromIndex === 0 )
        {
          if( onEvaluate1( el, e ) )
          return true;
        }
        else
        {
          fromIndex -= 1;
        }
      }

      return false;
    }
    else if( onEvaluate1.length === 1 )
    {
      _.assert( !onEvaluate2 || onEvaluate2.length === 1 );

      if( onEvaluate2 )
      e = onEvaluate2( e );
      else
      e = onEvaluate1( e );

      for( let el of src )
      {
        if( fromIndex === 0 )
        {
          if( onEvaluate1( el ) === e )
          return true;
        }
        else
        {
          fromIndex -= 1;
        }
      }

      return false;
    }
    else _.assert( 0 );
  }
  else if( onEvaluate1 === undefined || onEvaluate1 === null )
  {
    if( _.longLike( src ) )
    return src.includes( e );
    else if( _.setLike( src ) )
    return src.has( e );
  }
  else _.assert( 0 );
}

//

function arraySetDiff_( dst, src1, src2, onEvaluate1, onEvaluate2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( dst ) || _.setIs( dst ) || dst === null );
  _.assert( _.longIs( src1 ) || _.setIs( src1 ) );
  _.assert( _.longIs( src2 ) || _.setIs( src2 ) || _.routineIs( src2 ) || src2 === undefined );


  if( dst === null )
  dst = new src1.constructor();

  if( _.routineIs( src2 ) || src2 === undefined )
  {
    onEvaluate2 = onEvaluate1;
    onEvaluate1 = src2;
    src2 = src1;
    src1 = dst;
  }
  
  let temp = [];
  if( dst === src1 )
  {
    if( _.longLike( dst ) )
    {
      for( let e of src2 )
      if( _.longLeftIndex( dst, e, onEvaluate1, onEvaluate2 ) === -1 )
      temp.push( e );
      for( let i = dst.length - 1; i >= 0; i-- )
      if( _arraySetHas( src2, dst[ i ], onEvaluate1, onEvaluate2 ) )
      dst.splice( i, 1 )
      for( let i = 0; i < temp.length; i++ ) 
      dst.push( temp[ i ] );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src2 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      temp.push( e );
      for( let e of dst )
      if( _arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.delete( e );
      for( let i = 0; i < temp.length; i++ ) 
      dst.add( temp[ i ] ); 
    }
  }
  else if( dst === src2 )
  {
    if( _.longLike( dst ) )
    {
      for( let e of src1 )
      if( _.longLeftIndex( dst, e, onEvaluate1, onEvaluate2 ) === -1 )
      temp.push( e );
      for( let i = dst.length - 1; i >= 0; i-- )
      if( _arraySetHas( src1, dst[ i ], onEvaluate1, onEvaluate2 ) )
      dst.splice( i, 1 )
      for( let i = 0; i < temp.length; i++ ) 
      dst.push( temp[ i ] ); 
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      temp.push( e );
      for( let e of dst )
      if( _arraySetHas( src1, e, onEvaluate1, onEvaluate2 ) )
      dst.delete( e );
      for( let i = 0; i < temp.length; i++ ) 
      dst.add( temp[ i ] ); 
    }
  }
  else 
  {
    if( _.longLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
      for( let e of src2 )
      if( !_arraySetHas( src1, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) ) 
      dst.add( e );
      for( let e of src2 )
      if( !_arraySetHas( src1, e, onEvaluate1, onEvaluate2 ) ) 
      dst.add( e );
    }
  }

  return dst;
}

//

/**
 * Returns new array that contains elements from ( src ) that are not present in ( but ).
 * All copies of ignored element are ignored too.
 * @param { longIs } src - source array;
 * @param { longIs} but - array of elements to ignore.
 *
 * @example
 * _.arraySetBut( [ 1, 1, 1 ], [ 1 ] );
 * // returns []
 *
 * @example
 * _.arraySetBut( [ 1, 1, 2, 2, 3, 3 ], [ 1, 3 ] );
 * // returns [ 2, 2 ]
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

function arraySetBut_( dst, src1, src2, onEvaluate1, onEvaluate2 )
{

  if( arguments.length === 1 )
  {
    if( dst === null )
    return [];
    else if( _.longLike( dst ) || _.setLike( dst ) )
    return dst;
    else
    _.assert( 0 );
  }

  if( ( dst === null && _.routineIs( src2 ) ) || ( dst === null && src2 === undefined ) )
  {
    if( _.longLike( src1 ) )
    return _.longSlice( src1 )
    else if( _.setLike( src1 ) )
    return new Set( src1 )
    _.assert( 0 );
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( dst ) || _.setIs( dst ) || dst === null );
  _.assert( _.longIs( src1 ) || _.setIs( src1 ) );
  _.assert( _.longIs( src2 ) || _.setIs( src2 ) || _.routineIs( src2 ) || src2 === undefined );


  if( dst === null )
  dst = new src1.constructor();

  if( _.routineIs( src2 ) || src2 === undefined )
  {
    onEvaluate2 = onEvaluate1;
    onEvaluate1 = src2;
    src2 = src1;
    src1 = dst;
  }

  if( dst === src1 )
  {
    if( _.longLike( dst ) )
    {
      for( let i = dst.length - 1; i >= 0; i-- )
      if( _arraySetHas( src2, dst[ i ], onEvaluate1, onEvaluate2 ) )
      dst.splice( i, 1 );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of dst )
      if( _arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.delete( e );
    }
  }
  else
  {
    if( _.longLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.add( e );
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
 * _.arraySetIntersection( [ 1, 2, 3 ], [ 1 ], [ 3 ] );
 * // returns [ 1, 3 ]
 *
 * @example
 * _.arraySetIntersection( [ 1, 1, 2, 2, 3, 3 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ] );
 * // returns [ 1, 1, 2, 2, 3, 3 ]
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

function arraySetIntersection_( dst, src1, src2, onEvaluate1, onEvaluate2 )
{
  if( arguments.length === 1 )
  {
    if( dst === null )
    return [];
    else if( _.longIs( dst ) || _.setIs( dst ) )
    return dst;
    else
    _.assert( 0 );
  }
  if( ( dst === null && _.routineIs( src2 ) ) || ( dst === null && src2 === undefined ) )
  {
    if( _.longIs( src1 ) )
    return _.longSlice( src1 )
    else if( _.setIs( src1 ) )
    return new Set( src1 )
    _.assert( 0 );
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( dst ) || _.setIs( dst ) || dst === null );
  _.assert( _.longIs( src1 ) || _.setIs( src1 ) );
  _.assert( _.longIs( src2 ) || _.setIs( src2 ) || _.routineIs( src2 ) || src2 === undefined );


  if( dst === null )
  dst = new src1.constructor();

  if( _.routineIs( src2 ) || src2 === undefined )
  {
    onEvaluate2 = onEvaluate1;
    onEvaluate1 = src2;
    src2 = src1;
    src1 = dst;
  }

  if( dst === src1 )
  {
    if( _.longLike( dst ) )
    {
      for( let i = dst.length - 1; i >= 0; i-- )
      if( !_arraySetHas( src2, dst[ i ], onEvaluate1, onEvaluate2 ) )
      dst.splice( i, 1 );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of dst )
      if( !_arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.delete( e );
    }
  }
  else
  {
    if( _.longLike( dst ) )
    {
      for( let e of src1 )
      if( _arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src1 )
      if( _arraySetHas( src2, e, onEvaluate1, onEvaluate2 ) )
      dst.add( e );
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

function arraySetUnion_( dst, src1, src2, onEvaluate1, onEvaluate2 )
{
  if( arguments.length === 1 )
  {
    if( dst === null )
    return [];
    else if( _.longIs( dst ) || _.setIs( dst ) )
    return dst;
    else
    _.assert( 0 );
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( dst ) || _.setIs( dst ) || dst === null );
  _.assert( _.longIs( src1 ) || _.setIs( src1 ) );
  _.assert( _.longIs( src2 ) || _.setIs( src2 ) || _.routineIs( src2 ) || src2 === undefined );


  if( dst === null )
  dst = new src1.constructor();

  if( _.routineIs( src2 ) || src2 === undefined )
  {
    onEvaluate2 = onEvaluate1;
    onEvaluate1 = src2;
    src2 = src1;
    src1 = dst;
  }

  if( dst === src1 )
  {
    if( _.longLike( dst ) )
    {
      for( let e of src2 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src2 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.add( e );
    }
  }
  else if( dst === src2 )
  {
    if( _.longLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.add( e );
    }
  }
  else
  {
    if( _.longLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
      for( let e of src2 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.push( e );
    }
    else if( _.setLike( dst ) )
    {
      for( let e of src1 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.add( e );
      for( let e of src2 )
      if( !_arraySetHas( dst, e, onEvaluate1, onEvaluate2 ) )
      dst.add( e );
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
   * _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
   * // returns true
   *
   * @example
   * _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
   * // returns false
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

function arraySetContainAll_( src1, src2, onEvaluate1, onEvaluate2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( src2 ) || _.setIs( src2 ) );

  if( _.arrayIs( src1 ) )
  {
    for( let e of src2 )
    if( _.longLeftIndex( src1, e, onEvaluate1, onEvaluate2 ) === -1 )
    return false;
  }
  else if( _.setIs( src1 ) )
  {
    let startFrom = 0;
    if( _.numberIs( onEvaluate1 ) )
    {
      startFrom = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    if( !src1.size && ( src2.length || src2.size ) )
    return false;

    let result;
    for( let e of src2 )
    {
      if( result === false )
      {
        break;
      }
      else
      {
        let from = startFrom;
        result = undefined;
        for( let el of src1 )
        {
          if( from === 0 )
          {
            if( _.entityEntityEqualize( el, e, onEvaluate1, onEvaluate2 ) )
            {
              result = true;
              break;
            }
            else
            {
              result = false
            }
          }
          else
          {
            from--;
          }
        }
      }
    }
    return result === undefined ? true : result;
  }
  else
  {
    _.assert( 0, '{-src1-} should be instance of Array or Set' );
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
 * _.arraySetContainAny( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
 * // returns true
 *
 * @example
 * _.arraySetContainAny( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
 * // returns true
 *
 * @example
 * _.arraySetContainAny( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
 * // returns false
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

function arraySetContainAny_( src1, src2, onEvaluate1, onEvaluate2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( src2 ) || _.setIs( src2 ) );

  if( _.arrayIs( src1 ) )
  {
    for( let e of src2 )
    if( _.longLeftIndex( src1, e, onEvaluate1, onEvaluate2 ) !== -1 )
    return true;
  }
  else if( _.setIs( src1 ) )
  {
    let startFrom = 0;
    if( _.numberIs( onEvaluate1 ) )
    {
      startFrom = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    for( let e of src2 )
    {
      let from = startFrom;
      for( let el of src1 )
      {
        if( from === 0 )
        {
          if( _.entityEntityEqualize( el, e, onEvaluate1, onEvaluate2 ) )
          return true;
        }
        else
        {
          from--;
        }
      }
    }
  }
  else
  {
    _.assert( 0, '{-src1-} should be instance of Array or Set' );
  }

  return false;
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

function arraySetContainNone_( src1, src2, onEvaluate1, onEvaluate2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( src2 ) || _.setIs( src2 ) );

  if( _.arrayIs( src1 ) )
  {
    for( let e of src2 )
    if( _.longLeftIndex( src1, e, onEvaluate1, onEvaluate2 ) !== -1 )
    return false;
  }
  else if( _.setIs( src1 ) )
  {
    let startFrom = 0;
    if( _.numberIs( onEvaluate1 ) )
    {
      startFrom = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    for( let e of src2 )
    {
      let from = startFrom;
      for( let el of src1 )
      {
        if( from === 0 )
        {
          if( _.entityEntityEqualize( el, e, onEvaluate1, onEvaluate2 ) )
          return false;
        }
        else
        {
          from--;
        }
      }
    }
  }
  else
  {
    _.assert( 0, '{-src1-} should be instance of Array or Set' );
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
 * _.arraySetIdentical( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 * // returns false
 *
 * @example
 * _.arraySetIdentical( [ 1, 2, 4 ], [ 4, 2, 1 ] );
 * // returns true
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

//

function arraySetLeft( arr, ins, fromIndex, onEvaluate1, onEvaluate2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 5 );

  if( _.setLike( arr ) )
  {
    let result = Object.create( null );
    result.index = -1;
    let index = 0;
    let from = 0;

    if( _.routineIs( fromIndex ) )
    {
      onEvaluate2 = onEvaluate1;
      onEvaluate1 = fromIndex;
    }
    else if( _.numberIs( fromIndex ) )
    {
      from = fromIndex;
    }

    for( let e of arr )
    {
      if( from === 0 )
      {
        if( _.entityEntityEqualize( e, ins, onEvaluate1, onEvaluate2 ) )
        {
          result.index = index;
          result.element = e;
          break;
        }
      }
      else
      {
        from--;
      }
      index++;
    }

    return result;
  }
  else if( _.longLike( arr ) ) /* qqq2 : ask | Dmytro : it's explained, and it's corrected */
  {
    return _.longLeft.apply( this, arguments );
  }
  else
  _.assert( 0 );

}

//

function arraySetRight( arr, ins, fromIndex, onEvaluate1, onEvaluate2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 5 );

  if( _.setLike( arr ) )
  {
    let result = Object.create( null );
    result.index = -1;
    let to = arr.size;
    let index = 0;

    if( _.routineIs( fromIndex ) )
    {
      onEvaluate2 = onEvaluate1;
      onEvaluate1 = fromIndex;
    }
    else if( _.numberIs( fromIndex ) )
    {
      to = fromIndex;
    }
    else if( fromIndex !== undefined )
    _.assert( 0 );

    for( let e of arr )
    {
      if( index < to )
      {
        if( _.entityEntityEqualize( e, ins, onEvaluate1, onEvaluate2 ) )
        {
          result.index = index;
          result.element = e;
        }
      }
      index += 1;
    }

    return result;
  }
  else if( _.longLike( arr ) )
  {
    return _.longRight.apply( this, arguments );
  }
  else
  _.assert( 0 );

}

// --
// routines
// --

let NamespaceExtension =
{

  // array set

  arraySetDiff,
  arraySetDiff_, /* !!! : use instead of arraySetDiff */
  arraySetBut,
  arraySetBut_, /* !!! : use instead of arraySetBut */
  arraySetIntersection,
  arraySetIntersection_, /* !!! : use instead of arraySetIntersection */
  arraySetUnion,
  arraySetUnion_, /* !!! : use instead of arraySetUnion */

  arraySetContainAll,
  arraySetContainAll_,
  arraySetContainAny,
  arraySetContainAny_,
  arraySetContainNone,
  arraySetContainNone_,
  arraySetIdentical,

  arraySetLeft,
  arraySetRight,

  // to replace


  /*
  | routine                 | makes new dst container                       | saves dst container                           |
  | ----------------------- | --------------------------------------------- | --------------------------------------------- |
  | arraySetDiff_           | _.arraySetDiff_( null )                       | _.arraySetDiff_( src1, src2 )                 |
  |                         | _.arraySetDiff_( null, src1 )                 | _.arraySetDiff_( src1, src1, src2 )           |
  |                         | _.arraySetDiff_( null, src1, src2 )           | _.arraySetDiff_( src2, src1, src2 )           |
  |                         |                                               | _.arraySetDiff_( dst, src1, src2 )            |
  | ----------------------- | --------------------------------------------- | --------------------------------------------- |
  | arraySetBut_            | _.arraySetBut_( null )                        | _.arraySetBut_( src1 )                        |
  |                         | _.arraySetBut_( null, src1 )                  | _.arraySetBut_( src1, src2 )                  |
  |                         | _.arraySetBut_( null, src1, src2 )            | _.arraySetBut_( src1, src1, src2 )            |
  |                         |                                               | _.arraySetBut_( src2, src1, src2 )            |
  |                         |                                               | _.arraySetBut_( dst, src1, src2 )             |
  | ----------------------- | --------------------------------------------- | --------------------------------------------- |
  | arraySetIntersection_   | _.arraySetIntersection_( null )               | _.arraySetIntersection_( src1 )               |
  |                         | _.arraySetIntersection_( null, src1 )         | _.arraySetIntersection_( src1, src2 )         |
  |                         | _.arraySetIntersection_( null, src1, src2 )   | _.arraySetIntersection_( src1, src1, src2 )   |
  |                         |                                               | _.arraySetIntersection_( src2, src1, src2 )   |
  |                         |                                               | _.arraySetIntersection_( dst, src1, src2 )    |
  | ----------------------- | --------------------------------------------- | --------------------------------------------- |
  | arraySetUnion_          | _.arraySetUnion_( null )                      | _.arraySetUnion_( src1 )                      |
  |                         | _.arraySetUnion_( null, src1 )                | _.arraySetUnion_( src1, src2 )                |
  |                         | _.arraySetUnion_( null, src1, src2 )          | _.arraySetUnion_( src1, src1, src2 )          |
  |                         |                                               | _.arraySetUnion_( src2, src1, src2 )          |
  |                         |                                               | _.arraySetUnion_( dst, src1, src2 )           |
  | ----------------------- | --------------------------------------------- | --------------------------------------------- |

  */

}

//

Object.assign( Self, NamespaceExtension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
