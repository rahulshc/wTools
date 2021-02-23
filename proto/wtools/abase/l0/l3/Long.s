( function _l3_Long_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;

_.long_ = _.long_ || Object.create( null );

// --
// checker
// --

/**
 * The routine longIs() determines whether the passed value is an array-like or an Array.
 * Imortant : longIs returns false for Object, even if the object has length field.
 *
 * If {-srcMap-} is an array-like or an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.longIs( [ 1, 2 ] );
 * // returns true
 *
 * @example
 * _.longIs( 10 );
 * // returns false
 *
 * @example
 * let isArr = ( function() {
 *   return _.longIs( arguments );
 * } )( 'Hello there!' );
 * // returns true
 *
 * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
 * @function longIs.
 * @namespace Tools
 */

let notLongSymbol = Symbol.for( 'notLong' );
/* xxx : optimize! */
function longIs( src ) /* qqq : check coverage */
{

  if( _.primitive.is( src ) )
  return false;
  if( _.routineIs( src ) )
  return false;
  if( _.object.is( src ) )
  return false;
  if( _.strIs( src ) )
  return false;
  if( _.bufferNodeIs( src ) )
  return false;

  if( notLongSymbol in src ) /* qqq : cover please */
  return false;

  if( Object.propertyIsEnumerable.call( src, 'length' ) )
  return false;
  if( !_.number.is( src.length ) )
  return false;

  return true;
}

//

function longIsEmpty( src )
{
  if( !_.longIs( src ) )
  return false;
  return src.length === 0;
}

//

function longIsPopulated( src )
{
  if( !_.longIs( src ) )
  return false;
  return src.length > 0;
}

//

/* xxx : introduce vectorIs. remove check methodIteratorOf from here */
function longLike( src ) /* qqq : cover */
{
  if( _.primitive.is( src ) )
  return false;
  // if( _.entity.methodIteratorOf( src ) ) /* yyy */
  // // if( !_.mapIs( src ) && _.object.is( src ) )
  // if( !_.mapIs( src ) )
  // return true;
  return _.longIs( src );
}

// --
// getter
// --

function lengthOf( src )
{
  _.assert( _.longLike( src ) );

  if( 'length' in src )
  return src.length;

  return [ ... src ].length;
}

// --
// long sequential search
// --

function longLeftIndex( /* arr, ins, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let fromIndex = 0;

  if( _.number.is( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.longLike( arr ), 'Expect a Long' );
  _.assert( _.number.is( fromIndex ) );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routineIs( evaluator2 ) );

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
  else /* evaluator */
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    if( arr.findIndex && fromIndex === 0 )
    {
      return arr.findIndex( ( e ) => evaluator1( e ) === ins );
    }
    else
    {
      for( let a = fromIndex; a < arr.length ; a++ )
      {
        if( evaluator1( arr[ a ] ) === ins )
        return a;
      }
    }

  }

  return -1;
}

//

function longRightIndex( /* arr, ins, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let fromIndex = arr.length-1;

  if( _.number.is( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.number.is( fromIndex ) );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routineIs( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    // if( !_.arrayIs( arr ) )
    // debugger;
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
  else /* evaluator */
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
 * The routine longLeft() returns a new object containing the properties, (index, element),
 * corresponding to a found value {-ins-} from a Long {-arr-}.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 * @param { * } ins - An element to locate in the {-arr-}.
 * @param { Number } fromIndex - An index from which routine starts search left to right.
 * If {-fromIndex-} not defined, then routine starts search from the first index.
 * @param { Function } evaluator1 - It's a callback. If the routine has two parameters,
 * it is used as an equalizer, and if it has only one, then routine is used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the {-ins-} to search.
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], 2 );
 * // returns { index : 1, element : 2 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], [ 2 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], 2, 3 );
 * // returns { index : 4, element : 2 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], [ 2 ], ( e ) => e[ 0 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longLeft( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( e ) => e[ 0 ] );
 * // returns { index : 1, element : [ 2 ] }
 *
 * @example
 * _.longLeft( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( e ) => e - 3, ( ins ) => ins[ 0 ] );
 * // returns { index : 5, element : 5 }
 *
 * @example
 * _.longLeft( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], 3, ( e ) => e + 1, ( ins ) => ins[ 0 ] );
 * // returns { index : 5, element : 5 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], 2, ( e, ins ) => e === ins );
 * // returns { index : 1, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value {-ins-} from the array {-arr-}.
 * Otherwise, it returns the object with property (index), which value is -1.
 * @function longLeft
 * @throws { Error } If arguments.length is less then two or more then five.
 * @throws { Error } If {-fromIndex-} is not a number.
 * @throws { Error } If {-onEvaluate1-} is not a routine.
 * @throws { Error } If {-onEvaluate1-} is undefines and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate1-} is evaluator and accepts less or more then one parameter.
 * @throws { Error } If {-onEvaluate1-} is equalizer and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate2-} is not a routine.
 * @throws { Error } If {-onEvaluate2-} accepts less or more then one parameter.
 * @namespace Tools
 */

function longLeft( /* arr, ins, fromIndex, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let fromIndex = arguments[ 2 ];
  let evaluator1 = arguments[ 3 ];
  let evaluator2 = arguments[ 4 ];

  let result = Object.create( null );
  let i = _.longLeftIndex( arr, ins, fromIndex, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 5 );

  result.index = i;

  if( i >= 0 )
  result.element = arr[ i ];

  return result;
}

//

/**
 * The routine longRight() returns a new object containing the properties, (index, element),
 * corresponding to a found value {-ins-} from a Long {-arr-}.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 * @param { * } ins - An element to locate in the {-arr-}.
 * @param { Number } fromIndex - An index from which routine starts search right to left.
 * If {-fromIndex-} not defined, then routine starts search from the last index.
 * @param { Function } evaluator1 - It's a callback. If the routine has two parameters,
 * it is used as an equalizer, and if it has only one, then routine is used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the {-ins-} to search.
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], 2 );
 * // returns { index : 4, element : 2 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], [ 2 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], 2, 3 );
 * // returns { index : 1, element : 2 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], [ 2 ], ( e ) => e[ 0 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRight( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( e ) => e[ 0 ] );
 * // returns { index : 1, element : [ 2 ] }
 *
 * @example
 * _.longRight( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( e ) => e - 3, ( ins ) => ins[ 0 ] );
 * // returns { index : 5, element : 5 }
 *
 * @example
 * _.longRight( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], 4, ( e ) => e - 3, ( ins ) => ins[ 0 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], 2, ( e, ins ) => e === ins );
 * // returns { index : 4, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value {-ins-} from the array {-arr-}.
 * Otherwise, it returns the object with property (index), which value is -1.
 * @function longRight
 * @throws { Error } If arguments.length is less then two or more then five.
 * @throws { Error } If {-fromIndex-} is not a number.
 * @throws { Error } If {-onEvaluate1-} is not a routine.
 * @throws { Error } If {-onEvaluate1-} is undefines and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate1-} is evaluator and accepts less or more then one parameter.
 * @throws { Error } If {-onEvaluate1-} is equalizer and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate2-} is not a routine.
 * @throws { Error } If {-onEvaluate2-} accepts less or more then one parameter.
 * @namespace Tools
 */

function longRight( /* arr, ins, fromIndex, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let fromIndex = arguments[ 2 ];
  let evaluator1 = arguments[ 3 ];
  let evaluator2 = arguments[ 4 ];

  let result = Object.create( null );
  let i = _.longRightIndex( arr, ins, fromIndex, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 5 );

  result.index = i;

  if( i >= 0 )
  result.element = arr[ i ];

  return result;
}

//

/**
 * The routine longLeftDefined() returns a new object containing the properties, (index, element),
 * of first left element in a Long {-arr-}, which value is not equal to undefined.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 *
 * @example
 * _.longLeftDefined( [ undefined, undefined, undefined, undefined, undefined ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longLeftDefined( [ 1, undefined, 2, false, 'str', 2, undefined, 5 ] );
 * // returns { index : 0, element : 1 }
 *
 * @example
 * _.longLeftDefined( [ undefined, undefined, 2, false, 'str', 2 ] );
 * // returns { index : 2, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * of first left element in a Long {-arr-}, which value is not equal to undefined.
 * Otherwise, it returns the object with property (index), which value is -1.
 * @function longRight
 * @throws { Error } If arguments.length is less then or more then one.
 * @namespace Tools
 */

function longLeftDefined( arr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.longLeft( arr, true, function( e ){ return e !== undefined; } );
}

//

/**
 * The routine longRightDefined() returns a new object containing the properties, (index, element),
 * of first right element in a Long {-arr-}, which value is not equal to undefined.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 *
 * @example
 * _.longRightDefined( [ undefined, undefined, undefined, undefined, undefined ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRightDefined( [ 1, 2, false, 'str', 2, undefined, 5 ] );
 * // returns { index : 6, element : 5 }
 *
 * @example
 * _.longRightDefined( [ 1, 2, false, 'str', 2, undefined, undefined ] );
 * // returns { index : 4, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * of first right element in a Long {-arr-}, which value is not equal to undefined.
 * Otherwise, it returns the object with property (index) which, value is -1.
 * @function longRight
 * @throws { Error } If arguments.length is less then or more then one.
 * @namespace Tools
 */

function longRightDefined( arr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.longRight( arr, true, function( e ){ return e !== undefined; } );
}

//

function appender( src )
{
  _.assert( _.longLike( src ) );

  if( 'append' in src && _.routineIs( src.append ) )
  return appendWithAppend;
  else if( 'push' in src && _.routineIs( src.push ) )
  return appendWithPush;
  else if( 'add' in src && _.routineIs( src.add ) )
  return appendWithAdd;

  function appendWithAppend( e )
  {
    src.append( e );
  }

  function appendWithPush( e )
  {
    src.push( e );
  }

  function appendWithAdd( e )
  {
    src.add( e );
  }

}

//

function prepender( src )
{
  _.assert( _.longLike( src ) );

  if( 'prepend' in src && _.routineIs( src.prepend ) )
  return prependWithAppend;
  else if( 'push' in src && _.routineIs( src.push ) )
  return prependWithPush;
  else if( 'add' in src && _.routineIs( src.add ) )
  return prependWithAdd;

  function prependWithAppend( e )
  {
    src.prepend( e );
  }

  function prependWithPush( e )
  {
    src.unshift( e );
  }

  function prependWithAdd( e )
  {
    src.add( e );
  }

}

//

function eacher( src )
{

  _.assert( _.longLike( src ) );

  if( _.entity.methodIteratorOf( src ) )
  return eachOf;
  else
  return eachLength;

  /* */

  function eachOf( onEach )
  {
    let k = 0;
    for( let e of src )
    {
      onEach( e, k, src );
      k += 1;
    }
    return k;
  }

  /* */

  function eachLength( onEach )
  {
    let k = 0;
    while( k < src.length )
    {
      let e = src[ k ];
      args2[ 0 ] = e;
      onEach( e, k, src );
      k += 1;
    }
    return k;
  }

  /* */

}

// --
// declare
// --

let accuracy = 1e-7;
let accuracySqrt = 1e-4;
let accuracySqr = 1e-14;

let ToolsExtension =
{

  // long

  longIs,
  longIsEmpty,
  longIsPopulated,
  longLike,

  // long sequential search

  longLeftIndex,
  longRightIndex,

  longLeft,
  longRight,

  longLeftDefined,
  longRightDefined,

  // fields

  accuracy,
  accuracySqrt,
  accuracySqr,

}

Object.assign( _, ToolsExtension );

//

let LongExtension =
{

  // checker

  is : longIs,
  isEmpty : longIsEmpty,
  isPopulated : longIsPopulated,
  like : longLike,

  // getter

  lengthOf,

  // long sequential search

  leftIndex : longLeftIndex,
  rightIndex : longRightIndex,

  left : longLeft,
  right : longRight,

  leftDefined : longLeftDefined,
  rightDefined : longRightDefined,

  // er

  appender, /* qqq : cover. take into account all types. don't forget about set, arguments array, ContainerAdapterSet, ContainerAdapterLong */
  prepender, /* qqq : cover. take into account all types. don't forget about set, arguments array, ContainerAdapterSet, ContainerAdapterLong */
  eacher, /* qqq : cover. take into account all types. don't forget about set, arguments array, ContainerAdapterSet, ContainerAdapterLong */

  // fields

  accuracy,
  accuracySqrt,
  accuracySqr,

}

//

Object.assign( _.long_, LongExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
