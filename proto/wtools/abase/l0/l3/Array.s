( function _l3_Array_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;
const _ArrayIndexOf = Array.prototype.indexOf;
const _ArrayLastIndexOf = Array.prototype.lastIndexOf;

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
 * @namespace Tools
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

/* xxx : introduce vectorIs. remove check methodIteratorOf from here */
function arrayLike( src ) /* qqq : cover */
{
  if( _.arrayIs( src ) )
  return true;
  if( _.argumentsArray.is( src ) )
  return true;
  // if( _.class.methodIteratorOf( src ) ) /* yyy */
  // // if( !_.mapIs( src ) && _.object.is( src ) )
  // if( !_.mapIs( src ) )
  // return true;
  return false;
}

// --
// array prepend
// --

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
 * _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
 * // returns [ 5, 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
 * // returns [ 1, 2, 3, 4, 5 ]
 *
 * @example
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 *
 * @example
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
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
 * @namespace Tools
 */

function arrayPrependOnce( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

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
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4 ], 5 );
 * // returns [ 5, 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4, 5 ], 5 );
 * // throws error
 *
 * @example
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 *
 * @example
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 * // throws error
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
 * @namespace Tools
 */

function arrayPrependOnceStrictly( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0, () => `Array should have only unique elements, but has several ${ _.entity.exportStringShort( ins ) }` );
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
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );

  dstArray.unshift( ins );
  return 0;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionally takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * _.arrayPrependedOnce( [ 1, 2, 3, 4 ], 5 );
 * // returns 0
 *
 * @example
 * _.arrayPrependedOnce( [ 1, 2, 3, 4, 5 ], 5 );
 * // returns -1
 *
 * @example
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 * // returns 0
 *
 * @example
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 * // returns -1
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
 * @namespace Tools
 */

function arrayPrependedOnce( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );

  let i = _.longLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return 0;
  }
  return -1;
}

//

function arrayPrependedOnceStrictly( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let result;
  if( Config.debug )
  {
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0, () => `Array should have only unique elements, but has several ${ _.entity.exportStringShort( ins ) }` );
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
 * _.arrayPrependElement( [ 1, 2, 3, 4 ], 5 );
 * // returns [ 5, 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 );
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @namespace Tools
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

function arrayPrependElementOnce( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayPrependElementOnceStrictly( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
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
  _.assert( result >= 0, () => `Array should have only unique elements, but has several ${ _.entity.exportStringShort( ins ) }` );

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
 * _.arrayPrependedElement( [ 1, 2, 3, 4 ], 5 );
 * // returns 0
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependedElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is not equal to two.
 * @namespace Tools
 */

function arrayPrependedElement( dstArray, ins )
{
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );

  dstArray.unshift( ins );

  return ins;
}

//

function arrayPrependedElementOnce( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );

  let i = _.longLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return dstArray[ 0 ];
  }
  return undefined;
}

//

function arrayPrependedElementOnceStrictly( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let result;
  if( Config.debug )
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
 * _.arrayPrependArray( [ 1, 2, 3, 4 ], [ 5 ] );
 * // returns [ 5, 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayPrependArray( [ 1, 2, 3, 4, 5 ], [ 5 ] );
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 *
 * @returns { Array } Returns updated array, that contains elements from( insArray ).
 * @function arrayPrependArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @namespace Tools
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
 * _.arrayPrependArrayOnce( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 * // returns [ 0, 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayPrependArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
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
 * @namespace Tools
 */

function arrayPrependArrayOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

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
 * _.arrayPrependArrayOnceStrictly( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 * // returns [ 0, 1, 2, 3, 4 ]
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
 * @namespace Tools
 */

function arrayPrependArrayOnceStrictly( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    let insArrayLength = insArray.length
    result = arrayPrependedArrayOnce.apply( this, arguments );
    _.assert( result === insArrayLength );
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
 * //log [ 5, 6, 7, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @namespace Tools
 */

function arrayPrependedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArray :', 'Expects array' );
  _.assert( _.longLike( insArray ), 'arrayPrependedArray :', 'Expects longLike' );

  let result = insArray.length;
  dstArray.unshift.apply( dstArray, insArray );
  return result;
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
 * _.arrayPrependedArrayOnce( [ 1, 2, 3 ], [ 4, 5, 6] );
 * // returns 3
 *
 * @example
 * _.arrayPrependedArrayOnce( [ 0, 2, 3, 4 ], [ 1, 1, 1 ] );
 * // returns 1
 *
 * @example
 * _.arrayPrependedArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 * // returns 0
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
 * @namespace Tools
 */

function arrayPrependedArrayOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );
  _.assert( _.longLike( insArray ) );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    let index = i;
    if( dstArray === insArray )
    index = i + result;

    if( _.longLeftIndex( dstArray, insArray[ index ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.unshift( insArray[ index ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayPrependedArrayOnceStrictly( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let result;
  if( Config.debug )
  {
    let insArrayLength = insArray.length;
    result = arrayPrependedArrayOnce.apply( this, arguments );
    _.assert( result === insArrayLength );
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
 * @param{ longLike | * } arguments[...] - Source arguments.
 *
 * @example
 * _.arrayPrependArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
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
 * @namespace Tools
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
 * @param{ longLike | * } arguments[...] - Source arguments.
 *
 * @example
 * _.arrayPrependArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
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
 * @namespace Tools
 */

function arrayPrependArraysOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

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
 * @param { longLike | * } arguments[...] - Source arguments.
 * @param { wTools~compareCallback } onEqualize - A callback function that can be provided through routine`s context. By default, it checks the equality of two arguments.
 *
 * @example
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], 5, [ 6, [ 7 ] ], 8 );
 * // returns [ 5, 6, 7, 8, 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 * // throws error
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a === b;
 * };
 * let dst = [];
 * let arguments = [ dst, [ 1, [ 2 ], [ [ 3 ] ] ], 4 ];
 * _.arrayPrependArraysOnceStrictly.apply( { onEqualize }, arguments );
 * // returns [ 1, 2, [ 3 ], 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @throws { Error } An Error if count of added elements is not equal to count of elements from( arguments )( only first two levels inside of array are counted ).
 * @namespace Tools
 */

function arrayPrependArraysOnceStrictly( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    let expected = 0;
    let insIsDst = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longLike( insArray[ i ] ) )
      {
        expected += insArray[ i ].length

        if( insArray[ i ] === dstArray )
        {
          insIsDst += 1;
          if( insIsDst > 1 )
          expected += insArray[ i ].length
        }
      }
      else
      expected += 1;
    }
    result = arrayPrependedArraysOnce.apply( this, arguments );
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
      if( _.longLike( insArray[ i ] ) )
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
 * @param{ longLike | * } arguments[...] - Source arguments.
 *
 * @example
 * _.arrayPrependedArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 * // returns 3
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @namespace Tools
 */

function arrayPrependedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArrays :', 'Expects array' );
  _.assert( _.longLike( insArray ), 'arrayPrependedArrays :', 'Expects longLike entity' );

  let result = 0;

  if( dstArray === insArray )
  {
    result = insArray.length;
    dstArray.unshift.apply( dstArray, insArray );
    return result;
  }

  for( let a = 0, len = insArray.length ; a < len ; a++ )
  {
    if( _.longLike( insArray[ a ] ) )
    {
      result += insArray[ a ].length;
      dstArray.unshift.apply( dstArray, insArray[ a ] );
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
 * @param{ longLike | * } arguments[...] - Source arguments.
 *
 * @example
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4, 5, 6, 7 ], [ 5 ], [ 6 ], 7 );
 * // returns 0
 *
 * @example
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 * // returns 3
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArraysOnce( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @namespace Tools
 */

function arrayPrependedArraysOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArraysOnce :', 'Expects array' );
  _.assert( _.longLike( insArray ), 'arrayPrependedArraysOnce :', 'Expects longLike entity' );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  function _prependOnce( element )
  {
    let index = _.longLeftIndex( dstArray, element, evaluator1, evaluator2 );
    if( index === -1 )
    {
      dstArray.unshift( element );
      // dstArray.splice( result, 0, element );
      result += 1;
    }
  }

  // for( let ii = insArray.length - 1; ii >= 0; ii-- )
  for( let ii = 0, len = insArray.length; ii < len ; ii++ )
  {
    if( _.longLike( insArray[ ii ] ) )
    {
      let array = insArray[ ii ];
      if( array === dstArray )
      array = array.slice();
      // for( let a = array.length - 1; a >= 0; a-- )
      for( let a = array.length - 1; a >= 0 ; a-- )
      _prependOnce( array[ a ] );
    }
    else
    {
      if( dstArray === insArray )
      _prependOnce( insArray[ ii + result ] );
      else
      _prependOnce( insArray[ ii ] );
    }
  }

  return result;
}

//

function arrayPrependedArraysOnceStrictly( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let result;
  if( Config.debug )
  {
    let expected = 0;
    let insIsDst = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longLike( insArray[ i ] ) )
      {
        expected += insArray[ i ].length

        if( insArray[ i ] === dstArray )
        {
          insIsDst += 1;
          if( insIsDst > 1 )
          expected += insArray[ i ].length
        }
      }
      else
      expected += 1;
    }

    result = arrayPrependedArraysOnce.apply( this, arguments );

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

// function arrayAppend_( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = 1, len = arguments.length ; a < len; a++ )
//   {
//     if( _.longLike( arguments[ a ] ) )
//     {
//       dstArray.push.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.push( arguments[ a ] );
//     }
//   }
//
//   return dstArray;
// }

//

function arrayAppend( dstArray, ins )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  _.arrayAppended.apply( this, arguments );
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
 * _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
 * // returns [ 1, 2, 3, 4, 5 ]
 *
 * @example
 * _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
 * // returns [ 1, 2, 3, 4, 5 ]
 *
 * @example
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 *
 * @example
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 *
 * @returns { Array } If an array (dst) doesn't have a value {-srcMap-} it returns the updated array (dst) with the new length,
 * otherwise, it returns the original array (dst).
 * @function arrayAppendOnce
 * @throws { Error } Will throw an Error if (dst) is not an Array.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @namespace Tools
 */

function arrayAppendOnce( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  _.arrayAppendedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendOnceStrictly( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = _.arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0, () => `Array should have only unique elements, but has several ${ _.entity.exportStringShort( ins ) }` );
  }
  else
  {
    result = _.arrayAppended.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

//

function arrayAppended( dstArray, ins )
{
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedOnce( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let i = _.longLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.push( ins );
    return dstArray.length - 1;
  }

  return -1;
}

//

function arrayAppendedOnceStrictly( /* dstArray, ins, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let result;
  if( Config.debug )
  {
    result = _.arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0, () => `Array should have only unique elements, but has several ${ _.entity.exportStringShort( ins ) }` );
  }
  else
  {
    result = _.arrayAppended.apply( this, [ dstArray, ins ] );
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
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedElementOnce( dstArray, ins )
{
  let i = _.longLeftIndex.apply( _, arguments );

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
* _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
* // returns [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
*
* @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
* @function arrayAppendArray
* @throws { Error } If the first argument is not an array.
* @throws { Error } If type of the argument is equal undefined.
* @namespace Tools
*/

function arrayAppendArray( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  _.arrayAppendedArray.apply( this, arguments );
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
 * _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
 * // returns [ 1, 2, 'str', {}, 5 ]
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
 * @function arrayAppendArrayOnce
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @namespace Tools
 */

function arrayAppendArrayOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  _.arrayAppendedArrayOnce.apply( this, arguments )
  return dstArray;
}

//

function arrayAppendArrayOnceStrictly( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    let insArrayLength = insArray.length
    result = _.arrayAppendedArrayOnce.apply( this, arguments )
    _.assert( result === insArrayLength );
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
  _.assert( _.longLike( insArray ), 'arrayPrependedArray :', 'Expects longLike' );

  let result = insArray.length;
  dstArray.push.apply( dstArray, insArray );
  return result;
}

//

function arrayAppendedArrayOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  _.assert( _.longLike( insArray ) );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    if( _.longLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
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
    let insArrayLength = ins.length;
    result = _.arrayAppendedArrayOnce.apply( this, arguments );
    _.assert( result === insArrayLength, 'Array should have only unique elements, but has several', ins );
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

function arrayAppendArraysOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

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

function arrayAppendArraysOnceStrictly( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    let expected = 0;
    let insIsDst = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longLike( insArray[ i ] ) )
      {
        expected += insArray[ i ].length

        if( insArray[ i ] === dstArray )
        {
          insIsDst += 1;
          if( insIsDst > 1 )
          expected += insArray[ i ].length
        }
      }
      else
      expected += 1;
    }

    result = arrayAppendedArraysOnce.apply( this, arguments );

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

  if( !_.longLike( insArray ) && insArray !== undefined )
  insArray = [ insArray ];

  // if( !_.longLike( insArray ) )
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
  _.assert( _.longLike( insArray ), 'Expects longLike entity' );

  let result = 0;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longLike( insArray[ a ] ) )
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

function arrayAppendedArraysOnce( /* dstArray, insArray, evaluator1, evaluator2 */ )
{
  let dstArray = arguments[ 0 ];
  let insArray = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( dstArray === undefined )
  return insArray;

  if( !_.arrayIs( insArray ) && insArray !== undefined )
  insArray = [ insArray ];

  _.assert( _.arrayIs( dstArray ), 'Expects array' );
  _.assert( _.longLike( insArray ), 'Expects longLike entity' );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longLike( insArray[ a ] ) )
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
    let index = _.longLeftIndex( dstArray, argument, evaluator1, evaluator2 );
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
    let expected = 0;
    let insIsDst = 0;
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longLike( ins[ i ] ) )
      {
        expected += ins[ i ].length

        if( ins[ i ] === dstArray )
        {
          insIsDst += 1;
          if( insIsDst > 1 )
          expected += ins[ i ].length
        }
      }
      else
      expected += 1;
    }
    result = arrayAppendedArraysOnce.apply( this, arguments );
    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
  }
  else
  {
    result = arrayAppendedArrays.apply( this, [ dstArray, ins ] );
  }

  return result;
}

// --
// fields
// --

let Fields =
{

  // ArrayType : Array,

  accuracy : 1e-7,
  accuracySqrt : 1e-4,
  accuracySqr : 1e-14,

}

// --
// routines
// --

let Routines =
{

  //

  arrayIs,
  arrayIsEmpty,
  arrayIsPopulated,
  arrayLikeResizable,
  arrayLike,

  // array prepend

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

  arrayAppend,
  arrayAppendOnce,
  arrayAppendOnceStrictly,
  arrayAppended,
  arrayAppendedOnce,
  arrayAppendedOnceStrictly,

  arrayAppendElement,
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

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

})();
