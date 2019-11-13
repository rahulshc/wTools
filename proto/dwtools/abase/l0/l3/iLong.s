( function _iLong_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;
let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;

// --
// arguments array
// --

function argumentsArrayIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Arguments]';
}

// --
// array
// --

/**
 * The arrayIs() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.arrayIs( [ 1, 2 ] );
 * // returns true
 *
 * @example
 * _.arrayIs( 10 );
 * // returns false
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function arrayIs
 * @memberof wTools
 */

function arrayIs( src )
{
  return Array.isArray( src );
  // return Object.prototype.toString.call( src ) === '[object Array]';
}

//

function arrayIsEmpty( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return src.length === 0;
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

// --
// long
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
  if( _.bufferNodeIs( src ) )
  return false;

  if( Object.propertyIsEnumerable.call( src, 'length' ) )
  return false;
  if( !_.numberIs( src.length ) )
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

function longLike( src )
{
  return _.longIs( src );
}

// --
// long sequential search
// --

function longLeftIndex( arr, ins, evaluator1, evaluator2 )
{
  let fromIndex = 0;

  if( _.numberIs( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.longLike( arr ), 'Expect a Long' );
  _.assert( _.numberIs( fromIndex ) );
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

function longRightIndex( arr, ins, evaluator1, evaluator2 )
{

  let fromIndex = arr.length-1;

  if( _.numberIs( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.numberIs( fromIndex ) );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routineIs( evaluator2 ) );

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
 * @memberof wTools
 */

/* qqq : rewrite jsdoc | Dmytro : rewritten */

function longLeft( arr, ins, fromIndex, evaluator1, evaluator2 )
{
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
 * @memberof wTools
 */

/* qqq : rewrite jsdoc | Dmytro : documented */

function longRight( arr, ins, fromIndex, evaluator1, evaluator2 )
{
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
 * @memberof wTools
 */


/* qqq : rewrite jsdoc */
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
 * @memberof wTools
 */

/* qqq : rewrite jsdoc | Dmytro : documented */

function longRightDefined( arr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.longRight( arr, true, function( e ){ return e !== undefined; } );
}

// --
// fields
// --

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

  //

  arrayIs,
  arrayIsEmpty,
  arrayIsPopulated,
  arrayLikeResizable,
  arrayLike,

  // long

  longIs,
  longIsEmpty,
  longIsPopulated,
  longLike,

  // long sequential search

  longLeftIndex,
  longRightIndex,

  /* qqq : teach to accept fromIndex, make perfect coverage | Dmytro : already teached, covered */
  /* qqq : should be -1 in index if not found | Dmytro : already implemented */
  longLeft,
  longRight,

  longLeftDefined,
  longRightDefined,

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
