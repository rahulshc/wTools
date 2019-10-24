( function _gBuffer_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

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

  let t1 = Object.prototype.toString.call( src1 );
  let t2 = Object.prototype.toString.call( src2 );
  if( t1 !== t2 )
  return false;

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

  src1 = new U8x( src1 );
  src2 = new U8x( src2 );

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
  // Dmytro : correct misprint
  // return _.buffersNodeAreIdentica( src1, src2 );
  return _.buffersNodeAreIdentical( src1, src2 );
  else return false;

}

//

function buffersAreIdentical( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let t1 = Object.prototype.toString.call( src1 );
  let t2 = Object.prototype.toString.call( src2 );
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
 * The routine bufferMake() returns a new buffer with the same type as source buffer {-ins-}. New buffer makes from inserted buffer {-src-}
 * or if {-src-} is number, the buffer makes from {-ins-} with length equal to {-src-}. If {-src-} is not provided, routine returns copy of {-ins-}.
 *
 * @param { BufferAny|Long|Function } ins - Instance of any buffer, Long or constructor, defines type of returned buffer. If not a buffer is provided, routine returns instance of default ArrayType.
 * @param { Number|Long|Buffer } src - Defines length of new buffer. If buffer of Long is provided, routine makes new buffer from {-src-} with {-ins-} type.
 *
 * @example
 * let ins = BufferNode.from( [ 1, 2, 3, 4 ] );
 * let got = _.bufferMake( ins );
 * console.log( got );
 * // log Buffer[ 1, 2, 3 ];
 * console.log( _.bufferNodeIs( got ) );
 * // log true
 *
 * @example
 * let ins = _.unrollMake( [] )
 * let got = _.bufferMake( ins, [ 1, 2, 3 ] );
 * console.log( got );
 * // log [ 1, 2, 3 ];
 * console.log( _.unrollIs( got ) );
 * // log false
 *
 * @example
 * let ins = new BufferRaw( 0 );
 * let got = _.bufferMake( ins, new U32x( [ 1, 2, 3 ] ) );
 * console.log( got );
 * // log ArrayBuffer[ 0x1, 0x2, 0x3 ];
 * console.log( _.bufferRawIs( got ) );
 * // log true
 *
 * @example
 * let ins = new F32x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.bufferMake( ins, 2 );
 * console.log( got );
 * // log Float32Array[ 1, 2 ];
 * console.log( _.bufferTypedIs( got ) );
 * // log true
 *
 * @returns { BufferAny|Array }  Returns a buffer ( array ) from {-src-} with {-ins-} type.
 * @function bufferMake
 * @throws { Error } If arguments.length is less then one or more than two.
 * @throws { Error } If {-ins-} is constructor and second argument {-src-} is not provided.
 * @throws { Error } If {-src-} is not a number, not a Long, not a buffer.
 * @throws { Error } If {-ins-} is not a Long, not a buffer or not a constructor.
 * @throws { Error } If {-src-} or src.length has a not finite value.
 * @memberof wTools
 */

/*
qqq : implement, cover, document
Dmytro : implemented, covered, documented. If ins is not a buffer, routine returns default ArrayType.
*/

function bufferMake( ins, src )
{
  let result, length;

  if( _.argumentsArrayIs( ins ) )
  ins = _.arrayMake( ins );

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
  }
  else
  {
    if( _.longIs( src ) || _.bufferNodeIs( src ) )
    length = src.length;
    else if( _.bufferRawIs( src ) || _.bufferViewIs( src ) )
    {
      length = src.byteLength;
      src = _.bufferViewIs( src ) ? new U8x( src.buffer ) : new U8x( src );
    }
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferAnyIs( ins ), 'unknown type of array', _.strType( ins ) );

  if( _.longIs( src ) || _.bufferAnyIs( src ) )
  {
    if( _.routineIs( ins ) )
    {
      result = new ins( length );
      for( let i = 0 ; i < length ; i++ )
      result[ i ] = src[ i ];
    }
    else if( ins.constructor === Array )
    {
      result = _.unrollIs( ins ) ? _.unrollMake( src ) : new( _.constructorJoin( ins.constructor, src ) );
    }
    else if( _.bufferRawIs( ins ) )
    result = new U8x( src ).buffer;
    else if( _.bufferViewIs( ins ) )
    result = new BufferView( new U8x( src ).buffer );
    else if ( _.bufferNodeIs( ins ) )
    result = BufferNode.from( src );
    else
    result = new ins.constructor( src );

  }
  else
  {
    let insert;
    if( !_.bufferRawIs( ins ) && !_.bufferViewIs( ins ) )
    insert = ins;
    else
    insert = _.bufferViewIs( ins ) ? new U8x( ins.buffer ) : new U8x( ins );

    if( _.routineIs( ins ) )
    result = new ins( length );
    else if( _.bufferNodeIs( ins ) )
    result = BufferNode.alloc( length );
    else if( _.bufferViewIs( ins ) || _.bufferRawIs( ins ) )
    result = new U8x( length );
    else if( _.unrollIs( ins ) )
    result = _.unrollMake( length );
    else
    result = new ins.constructor( length );

    let minLen = Math.min( length, insert.length );
    for( let i = 0 ; i < minLen ; i++ )
    result[ i ] = insert[ i ];

    if( _.bufferRawIs( ins ) )
    result = result.buffer;
    if( _.bufferViewIs( ins ) )
    result = new BufferView( result.buffer );
  }

  return result;
}

// function bufferMake( ins, src )
// {
//   let result, length;
//
//   if( _.routineIs( ins ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( _.argumentsArrayIs( ins ) )
//   ins = [];
//
//   if( src === undefined )
//   {
//     length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
//   }
//   else
//   {
//     if( _.longIs( src ) || _.bufferNodeIs( src ) )
//     length = src.length;
//     else if( _.bufferRawIs( src ) || _.bufferViewIs( src ) )
//     length = src.byteLength;
//     else if( _.numberIs( src ) )
//     length = src;
//     else _.assert( 0 );
//   }
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( length ) );
//   _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.strType( ins ) );
//
//   if( _.longIs( src ) || _.bufferAnyIs( src ) )
//   {
//
//     if( ins.constructor === Array )
//     {
//       result = new( _.constructorJoin( ins.constructor, src ) );
//     }
//     else if( _.routineIs( ins ) )
//     {
//       if( ins.prototype.constructor.name === 'Array' )
//       result = _ArraySlice.call( src );
//       else
//       result = new ins( src );
//     }
//     else
//     result = new ins.constructor( src );
//
//   }
//   else
//   {
//     if( _.routineIs( ins ) )
//     result = new ins( length );
//     else
//     result = new ins.constructor( length );
//   }
//
//   return result;
// }

//

/**
 * The routine bufferMakeUndefined() returns a new buffer with the same type as buffer in argument {-ins-}.
 * New buffer has length equal to the length of second argument {-src-} or it has length of initial array {-ins-}
 * if second argument is not provided.
 *
 * @param { Buffer|Long|Routine } ins - Buffer, Long or constructor, defines type of returned buffer.
 * @param { Buffer|Long|Number } src - Defines length of the new buffer.
 *
 * @example
 * // from array, no src
 * let ins = [ 1, 2, 3, 4, 5 ];
 * let got = _.bufferMakeUndefined( ins );
 * console.log( got );
 * // log [ undefined, undefined, undefined, undefined, undefined ]
 * console.log( _.arrayIs( got ) );
 * // log true
 *
 * @example
 * // from BufferTyped, no src
 * let ins = new U8x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.bufferMakeUndefined( ins );
 * console.log( got );
 * // log Uint8Array[ 0, 0, 0, 0, 0 ]
 *
 * @example
 * // from array, src.length < array.length
 * let ins = new Array( [ 1, 2, 3, 4, 5 ] );
 * let got = _.bufferMakeUndefined( ins, 2 );
 * console.log( got );
 * // log [ undefined, undefined ]
 * console.log( _.arrayIs( got ) );
 * // log true
 *
 * @example
 * // from BufferRaw, buffer.byteLength < src.length
 * let ins = new BufferRaw( 2 );
 * let got = _.bufferMakeUndefined( ins, [ 1, 2, 3, 4, 5 ] );
 * console.log( got );
 * // log ArrayBuffer[ 0x0, 0x0, 0x0, 0x0, 0x0 ]
 *
 * @example
 * // from Array constructor
 * let got = _.bufferMakeUndefined( F32x, 4 );
 * console.log( got );
 * // log Float32Array[ 0, 0, 0, 0 ]
 *
 * @returns { Buffer }  Returns a new buffer with the same type as inserted buffer {-ins-} with a certain length.
 * @function bufferMakeUndefined
 * @throws { Error } If arguments.length is less than one or more then two.
 * @throws { Error } If {-ins-} is constructor and second argument {-src-} is not provided.
 * @throws { Error } If {-ins-} is not a buffer, not a Long, not a constructor.
 * @throws { Error } If {-src-} is not a buffer, not a Long, not a Number.
 * @throws { Error } If {-src-} has not defined length.
 * @memberof wTools
 */

/* qqq : implement, cover, document */
/* Dmytro : implemented, covered, documented */

function bufferMakeUndefined( ins, src )
{
  let result, length;

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
  }
  else
  {
    if( _.longIs( src ) || _.bufferNodeIs( src ) )
    length = src.length;
    else if( _.bufferRawIs( src ) || _.bufferViewIs( src ) )
    length = src.byteLength;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferAnyIs( ins ), 'unknown type of array', _.strType( ins ) );

  if( _.routineIs( ins ) )
  result = new ins( length );
  else if( _.bufferNodeIs( ins ) )
  result = BufferNode.alloc( length );
  else if( _.bufferViewIs( ins ) )
  result = new BufferView( new BufferRaw( length ) );
  else if( _.unrollIs( ins ) )
  result = _.unrollMake( length );
  else
  result = new ins.constructor( length );

  return result;
}

// function bufferMakeUndefined( ins, src )
// {
//   let result, length;
//
//   throw _.err( 'not tested' );
//
//   if( _.routineIs( ins ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( src === undefined )
//   {
//     length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
//   }
//   else
//   {
//     if( _.longIs( src ) )
//     length = src.length;
//     else if( _.bufferRawIs( src ) )
//     length = src.byteLength;
//     else if( _.numberIs( src ) )
//     length = src;
//     else _.assert( 0 );
//   }
//
//   if( _.argumentsArrayIs( ins ) )
//   ins = [];
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( length ) );
//   _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.strType( ins ) );
//
//   if( _.longIs( src ) || _.bufferAnyIs( src ) )
//   {
//
//     if( ins.constructor === Array )
//     {
//       result = new( _.constructorJoin( ins.constructor, src ) );
//     }
//     else if( _.routineIs( ins ) )
//     {
//       if( ins.prototype.constructor.name === 'Array' )
//       result = _ArraySlice.call( src );
//       else
//       result = new ins( src );
//     }
//     else
//     result = new ins.constructor( src );
//
//   }
//   else
//   {
//     if( _.routineIs( ins ) )
//     result = new ins( length );
//     else
//     result = new ins.constructor( length );
//   }
//
//   return result;
// }

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

  if( options.BufferType === undefined ) options.BufferType = F32x;
  if( options.sameLength === undefined ) options.sameLength = 1;
  if( !options.sameLength ) throw _.err( '_.bufferFromArrayOfArray :', 'different length of arrays is not implemented' );

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

  if( o.bufferConstructor.name === 'BufferRaw' )
  return _.bufferRawFrom( o.src );

  if( o.bufferConstructor.name === 'BufferNode' )
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
 * The bufferRawFromTyped() routine returns a new BufferRaw from (buffer.byteOffset) to the end of an BufferRaw of a typed array (buffer)
 * or returns the same BufferRaw of the (buffer), if (buffer.byteOffset) is not provided.
 *
 * @param { typedArray } buffer - Entity to check.
 *
 * @example
 * let buffer1 = new BufferRaw( 10 );
 * let view1 = new I8x( buffer1 );
 * _.bufferRawFromTyped( view1 );
 * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
 *
 * @example
 * let buffer2 = new BufferRaw( 10 );
 * let view2 = new I8x( buffer2, 2 );
 * _.bufferRawFromTyped( view2 );
 * // returns [ 0, 0, 0, 0, 0, 0 ]
 *
 * @returns { BufferRaw } Returns a new or the same BufferRaw.
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

  /* qqq : should do not copying when possible!
     Dmytro : not copying if it possible */

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( buffer instanceof BufferRaw )
  return buffer;

  if( _.bufferNodeIs( buffer ) || _.arrayIs( buffer ) )
  {

    // result = buffer.buffer;
    result = new U8x( buffer ).buffer;

  }
  else if( _.bufferTypedIs( buffer ) || _.bufferViewIs( buffer ) )
  {

    result = buffer.buffer;
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    // Dmytro : works not correctly, offset + length = right bound of new bufferRaw
    // result = result.slice( buffer.byteOffset || 0, buffer.byteLength );
    result = result.slice( buffer.byteOffset, buffer.byteOffset + buffer.byteLength );

  }
  else if( _.strIs( buffer ) )
  {

    if( _global_.BufferNode )
    {
      result = _.bufferRawFrom( BufferNode.from( buffer, 'utf8' ) );
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

  // Dmytro : missed
  if( _.bufferBytesIs( buffer ) )
  return buffer;

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
  let result = new U8x( buffer );
  return result;
}

//

/*
qqq : cover it
Dmytro : coverage is extended
*/

function bufferNodeFrom( buffer )
{
  if( _.bufferNodeIs( buffer ) )
  return buffer;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferAnyIs( buffer ) || _.strIs( buffer ) || _.arrayIs( buffer ), 'Expects buffer, string of array, but got', _.strType( buffer ) );
  // _.assert( _.bufferViewIs( buffer ) || _.bufferTypedIs( buffer ) || _.bufferRawIs( buffer ) || _.bufferNodeIs( buffer ) || _.strIs( buffer ) || _.arrayIs( buffer ), 'Expects typed or raw buffer, but got', _.strType( buffer ) );

  // if( _.bufferNodeIs( buffer ) )
  // return buffer;

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
    // result = new BufferNode([]);
    result = BufferNode.from([]);
  }
  else if( _.strIs( buffer ) )
  {
    debugger;
    result = _.bufferNodeFrom( _.bufferRawFrom( buffer ) );
  }
  else if( buffer.buffer )
  {
    result = BufferNode.from( buffer.buffer, buffer.byteOffset, buffer.byteLength );
  }
  else
  {
    // _.assert( 0, 'not tested' );
    result = BufferNode.from( buffer );
  }

  // if( !buffer.length && !buffer.byteLength )
  // {
  //   buffer = new BufferNode([]);
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
  //   buffer = BufferNode.from( buffer.buffer );
  //   else
  //   buffer = BufferNode.from( buffer );
  // }

  _.assert( _.bufferNodeIs( result ) );

  return result;
}

//

/**
 * Removes range( range ) of elements from provided array( dstArray ) and adds elements from array( srcArray )
 * at the start position of provided range( range ) if( srcArray ) was provided.
 * On success returns array with deleted element(s), otherwise returns empty array.
 * For TypedArray's and buffers returns modified copy of ( dstArray ) or original array if nothing changed.
 *
 * @param { Array|TypedArray|BufferNode } dstArray - The target array, TypedArray( I8x, I16x, U8x ... etc ) or BufferNode( BufferRaw, BufferNode ).
 * @param { Array|Number } range - The range of elements or index of single element to remove from ( dstArray ).
 * @param { Array } srcArray - The array of elements to add to( dstArray ) at the start position of provided range( range ).
 * If one of ( range ) indexies is not specified it will be setted to zero.
 * If ( range ) start index is greater than the length of the array ( dstArray ), actual starting index will be set to the length of the array ( dstArray ).
 * If ( range ) start index is negative, will be setted to zero.
 * If ( range ) start index is greater than end index, the last will be setted to value of start index.
 *
 * @example
 * _.bufferBut( [ 1, 2, 3, 4 ], 2 );
 * // returns [ 3 ]
 *
 * @example
 * _.bufferBut( [ 1, 2, 3, 4 ], [ 1, 2 ] );
 * // returns [ 2 ]
 *
 * @example
 * _.bufferBut( [ 1, 2, 3, 4 ], [ 0, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * _.bufferBut( [ 1, 2, 3, 4 ], [ -1, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.bufferBut( dst, [ 0, 3 ], [ 0, 0, 0 ] );
 * console.log( dst );
 * // log [ 0, 0, 0, 4 ]
 *
 * @example
 * let dst = new I32x( 4 );
 * dst.set( [ 1, 2, 3, 4 ] )
 * _.bufferBut( dst, 0 );
 * // returns [ 2, 3, 4 ]
 *
 * @returns { Array|TypedArray|BufferNode } For array returns array with deleted element(s), otherwise returns empty array.
 * For other types returns modified copy or origin( dstArray ).
 * @function bufferBut
 * @throws { Error } If ( arguments.length ) is not equal to two or three.
 * @throws { Error } If ( dstArray ) is not an Array.
 * @throws { Error } If ( srcArray ) is not an Array.
 * @throws { Error } If ( range ) is not an Array.
 * @memberof wTools
 */

function bufferBut( dstArray, range, srcArray )
{
  if( !_.bufferAnyIs( dstArray ) )
  return _.longBut( dstArray, range, srcArray );

  if( range === undefined )
  range = [ 0, 0 ];
  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.rangeIs( range ) );
  _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );

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

  let newLength = length - last + first;
  let srcArrayLength = 0;

  if( srcArray )
  {
    srcArrayLength = _.definedIs( srcArray.length ) ? srcArray.length : srcArray.byteLength;
    newLength += srcArrayLength;
  }

  if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
  {
    result = new U8x( newLength );
  }
  else
  {
    result = _.longMakeUndefined( dstArray, newLength );
  }

  let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;

  if( first > 0 )
  for( let i = 0; i < first; ++i )
  result[ i ] = dstArrayTyped[ i ];

  if( srcArray )
  for( let i = first, j = 0; j < srcArrayLength; )
  result[ i++ ] = srcArray[ j++ ];

  for( let j = last, i = first + srcArrayLength; j < length; )
  result[ i++ ] = dstArrayTyped[ j++ ];

   //
  if( _.bufferRawIs( dstArray ) )
  return result.buffer;
  if( _.bufferNodeIs( dstArray ) )
  return BufferNode.from( result );
  if( _.bufferViewIs( dstArray ) )
  return new BufferView( result.buffer );
  else
  return result;
}

/* qqq : routine bufferBut requires good test coverage and documentation */
/* qqq : implement cover and document routine bufferButInplace */

/* qqq : implement
   Dmytro : implemented for typed buffers
  qqq : no
      src can be any long or any buffer
      ins can be any long or any buffer
*/

// Dmytro : not a my template

// function bufferBut( dstArray, range, srcArray )
// {
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longBut( dstArray, range, srcArray );
//
//   if( _.numberIs( range ) )
//   range = [ range, range + 1 ];
//
//   _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
//   _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
//   _.assert( _.rangeIs( range ) );
//   // _.assert( srcArray === undefined || _.arrayIs( srcArray ) );
//   _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );
//
//   /* qqq : jeed separate if fo BufferRaw, bufferNode and bufferView */
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//   let result;
//
//   if( first < 0 )
//   first = 0;
//   if( first > length)
//   first = length;
//   if( last > length)
//   last = length;
//   if( last < first )
//   last = first;
//
//   // if( _.bufferAnyIs( dstArray ) )
//   // {
//
//     // if( first === last )
//     // return _.bufferMake( dstArray );
//
//     // if( first === last )
//     // return dstArray;
//
//     // if( first === last )
//     // debugger;
//
//     let newLength = length - last + first;
//     let srcArrayLength = 0;
//
//     if( srcArray )
//     {
//       srcArrayLength = _.definedIs( srcArray.length ) ? srcArray.length : srcArray.byteLength;
//       newLength += srcArrayLength;
//     }
//
//     if( _.bufferRawIs( dstArray ) )
//     {
//       result = new BufferRaw( newLength );
//     }
//     else if( _.bufferNodeIs( dstArray ) )
//     {
//       result = BufferNode.alloc( newLength );
//     }
//     else
//     {
//       result = _.longMakeUndefined( dstArray, newLength );
//     }
//
//     if( first > 0 )
//     for( let i = 0; i < first; ++i )
//     result[ i ] = dstArray[ i ];
//
//     if( srcArray )
//     for( let i = first, j = 0; j < srcArrayLength; )
//     result[ i++ ] = srcArray[ j++ ];
//
//     for( let j = last, i = first + srcArrayLength; j < length; )
//     result[ i++ ] = dstArray[ j++ ];
//
//     return result;
//
//   // }
//   // else
//   // {
//   //
//   //   return _.longBut( srcArray,  );
//   //
//   //   let args = srcArray ? srcArray.slice() : [];
//   //   args.unshift( last-first );
//   //   args.unshift( first );
//   //
//   //   result = dstArray.splice.apply( dstArray, args );
//   // }
//
//   return result;
// }

//

function bufferButInplace( dstArray, range, srcArray )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( !_.bufferAnyIs( dstArray ) )
  return _.longButInplace( dstArray, range, srcArray );

  if( range === undefined )
  return dstArray;
  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( _.rangeIs( range ) );

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  if( last === first && srcArray === undefined )
  return dstArray;
  else
  return _.bufferBut( dstArray, range, srcArray );

}

//

function _argumentsOnlyBuffer( dst, src, range, ins )
{
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( dst === null )
  dst = true;
  else if( dst === src )
  dst = false;
  else if( arguments.length === 4 )
  _.assert( _.longIs( dst ) || _.bufferAnyIs( dst ), '{-dst-} should be Long or buffer' );
  else
  {
    if( arguments.length > 1 && !_.rangeIs( src ) && !_.numberIs( src ) )
    _.assert( _.longIs( dst ) || _.bufferAnyIs( dst ) );
    else
    {
      ins = range;
      range = src;
      src = dst;
      dst = true;
    }
  }

  _.assert( _.longIs( src ) || _.bufferAnyIs( src ) );

  return [ dst, src, range, ins ];
}

function _returnDst( dst, src )
{
  let dstLength;
  if( !_.boolIs( dst ) )
  dstLength = dst.length === undefined ? dst.byteLength : dst.length;
  
  if( dstLength !== undefined )
  {
    let srcLength = src.length === undefined ? src.byteLength : src.length;

    if( _.arrayLikeResizable( dst ) )
    {
      if( _.bufferRawIs( src ) )
      dst.splice( 0, dstLength, ... new U8x( src ) );
      else if( _.bufferViewIs( src ) )
      dst.splice( 0, dstLength, ... new U8x( src.buffer ) );
      else
      dst.splice( 0, dstLength, ... src );

      return dst;
    }
    else
    {
      if( dstLength !== srcLength )
      dst = new dst.constructor( srcLength );

      let dstTyped = dst;
      if( _.bufferRawIs( dstTyped ) )
      dstTyped = new U8x( dstTyped );
      else if( _.bufferViewIs( dstTyped ) )
      dstTyped = new U8x( dstTyped.buffer );

      if( _.bufferRawIs( src ) )
      src = new U8x( src );
      else if( _.bufferViewIs( src ) )
      src = new U8x( src.buffer );

      for( let i = 0; i < dst.length; i++ )
      dstTyped[ i ] = src[ i ];

      return dst;
    }
  }
  return dst === true ? _.bufferMake( src ) : src;
}

//

function bufferBut_( dst, dstArray, range, srcArray )
{

  [ dst, dstArray, range, srcArray ] = _argumentsOnlyBuffer.apply( this, arguments );

  if( !_.bufferAnyIs( dstArray ) )
  return _.longBut_.apply( this, arguments );

  if( range === undefined )
  return _returnDst( dst, dstArray );

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( _.rangeIs( range ) );
  _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );

  let length = dstArray.length !== undefined ? dstArray.length : dstArray.byteLength;
  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  if( last === first && srcArray === undefined )
  return _returnDst( dst, dstArray );

  let newLength = length - last + first;
  let srcArrayLength = 0;
  if( srcArray )
  {
    srcArrayLength = srcArray.length !== undefined ? srcArray.length : srcArray.byteLength;
    newLength += srcArrayLength;
  }

  let result;
  if( _.boolIs( dst ) )
  result = _.bufferMakeUndefined( dstArray, newLength );
  else if( _.arrayLikeResizable( dst ) )
  {
    result = dst;
    result.length = newLength;
  }
  else if( dst.length !== newLength && dst.byteLength !== newLength )
  result = new dst.constructor( newLength );
  else
  result = dst;

  let resultTyped = result;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  else if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );
  let dstArrayTyped = dstArray;
  if( _.bufferRawIs( dstArray ) )
  dstArrayTyped = new U8x( dstArray );
  else if( _.bufferViewIs( dstArray ) )
  dstArrayTyped = new U8x( dstArray.buffer );

  if( first > 0 )
  for( let i = 0; i < first; i++ )
  resultTyped[ i ] = dstArrayTyped[ i ];

  if( srcArray )
  for( let i = first, j = 0; j < srcArrayLength; i++, j++ )
  resultTyped[ i ] = srcArray[ j ];

  for( let j = last, i = first + srcArrayLength; j < length; i++, j++ )
  resultTyped[ i ] = dstArrayTyped[ j ];

  return result;
}

//

function bufferSelect( dstArray, range, srcArray )
{

  let result;

  if( !_.bufferAnyIs( dstArray ) )
  return _.longSelect( dstArray, range, srcArray );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  range = [ 0, length ];
  else if( _.numberIs( range ) )
  range = [ range, length ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.rangeIs( range ) );
  _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  let newLength = last - first;

  if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
  {
    result = new U8x( newLength );
  }
  else
  {
    result = _.longMakeUndefined( dstArray, newLength );
  }

  let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;

  let first2 = Math.max( first, 0 );
  let last2 = Math.min( length, last );
  for( let r = first2 ; r < last2 ; r++ )
  result[ r-first2 ] = dstArrayTyped[ r ];

  //
  if( _.bufferRawIs( dstArray ) )
  return result.buffer;
  if( _.bufferNodeIs( dstArray ) )
  return BufferNode.from( result );
  if( _.bufferViewIs( dstArray ) )
  return new BufferView( result.buffer );
  else
  return result;
}

//

function bufferSelectInplace( dstArray, range, srcArray )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( !_.bufferAnyIs( dstArray ) )
  return _.longSelectInplace( dstArray, range, srcArray );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  range = [ 0, length ];
  if( _.numberIs( range ) )
  range = [ range, length ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( _.rangeIs( range ) );

  if( first < 0 )
  first = 0;
  if( last > length)
  last = length;

  if( first === 0 && last === length )
  return dstArray;
  else
  return _.bufferSelect( dstArray, range, srcArray );

}

//

function bufferSelect_( dst, dstArray, range, srcArray )
{

  [ dst, dstArray, range, srcArray ] = _argumentsOnlyBuffer.apply( this, arguments );

  if( !_.bufferAnyIs( dstArray ) )
  return _.longSelect_.apply( this, arguments );

  let length = dstArray.length !== undefined ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  return _returnDst( dst, dstArray );

  else if( _.numberIs( range ) )
  range = [ range, length ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( _.rangeIs( range ) );
  _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );

  if( first < 0 )
  first = 0;
  if( first > length)
  first = length;
  if( last > length)
  last = length;
  if( last < first )
  last = first;

  if( first === 0 && last === length )
  return _returnDst( dst, dstArray );

  let newLength = last - first;

  let result;
  if( _.boolIs( dst ) )
  result = _.bufferMakeUndefined( dstArray, newLength );
  else if( _.arrayLikeResizable( dst ) )
  {
    result = dst;
    result.length = newLength;
  }
  else if( dst.length !== newLength && dst.byteLength !== newLength )
  result = new dst.constructor( newLength );
  else
  result = dst;

  let resultTyped = result;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  else if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );
  let dstArrayTyped = dstArray;
  if( _.bufferRawIs( dstArray ) )
  dstArrayTyped = new U8x( dstArray );
  else if( _.bufferViewIs( dstArray ) )
  dstArrayTyped = new U8x( dstArray.buffer );

  let first2 = Math.max( first, 0 );
  let last2 = Math.min( length, last );
  for( let r = first2 ; r < last2 ; r++ )
  resultTyped[ r-first2 ] = dstArrayTyped[ r ];

  return result;
}

//

function bufferGrow( dstArray, range, srcArray )
{

  let result;

  if( !_.bufferAnyIs( dstArray ) )
  return _.longGrow( dstArray, range, srcArray );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  range = [ 0, length ];
  if( _.numberIs( range ) )
  range = [ 0, range ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( 1 <= arguments.length && arguments.length <= 3, 'Expects two or three arguments' );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.rangeIs( range ) );

  if( first < 0 )
  {
    last -= first;
    first -= first;
  }
  if( last < first )
  last = first;
  if( first > 0 )
  first = 0;
  if( last < length )
  last = length;

  let newLength = last - first;

  if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
  {
    result = new U8x( newLength );
  }
  else
  {
    result = _.longMakeUndefined( dstArray, newLength );
  }

  let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;

  let first2 = Math.max( first, 0 );
  let last2 = Math.min( length, last );
  for( let r = first2 ; r < last2 ; r++ )
  result[ r-first2 ] = dstArrayTyped[ r ];

  if( srcArray !== undefined )
  {
    for( let r = last2; r < newLength ; r++ )
    {
      result[ r ] = srcArray;
    }
  }

  //
  if( _.bufferRawIs( dstArray ) )
  return result.buffer;
  if( _.bufferNodeIs( dstArray ) )
  return BufferNode.from( result );
  if( _.bufferViewIs( dstArray ) )
  return new BufferView( result.buffer );
  else
  return result;
}

//

function bufferGrowInplace( dstArray, range, srcArray )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( !_.bufferAnyIs( dstArray ) )
  return _.longGrowInplace( dstArray, range, srcArray );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  range = [ 0, length ];
  if( _.numberIs( range ) )
  range = [ 0, range ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( _.rangeIs( range ) );

  if( first < 0 )
  {
    last -= first;
    first -= first;
  }
  if( first > 0 )
  first = 0;
  if( last < length )
  last = length;

  if( first === 0 && last === length )
  return dstArray;
  else
  return _.bufferGrow( dstArray, range, srcArray );

}

//

function bufferRelength( dstArray, range, srcArray )
{

  let result;

  if( !_.bufferAnyIs( dstArray ) )
  return _.longRelength( dstArray, range, srcArray );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  range = [ 0, length ];
  if( _.numberIs( range ) )
  range = [ range, length ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( 1 <= arguments.length && arguments.length <= 3, 'Expects two or three arguments' );
  _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
  _.assert( _.rangeIs( range ) );

  if( first < 0 )
  first = 0;
  if( first > length )
  first = length;
  if( last < first )
  last = first;

  let newLength = last - first;

  if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
  {
    result = new U8x( newLength );
  }
  else
  {
    result = _.longMakeUndefined( dstArray, newLength );
  }

  let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;

  let first2 = Math.max( first, 0 );
  let last2 = Math.min( length, last );
  for( let r = first2 ; r < last2 ; r++ )
  result[ r-first2 ] = dstArrayTyped[ r ];

  if( srcArray !== undefined )
  {
    for( let r = last2 -first2; r < newLength ; r++ )
    {
      result[ r ] = srcArray;
    }
  }

  //
  if( _.bufferRawIs( dstArray ) )
  return result.buffer;
  if( _.bufferNodeIs( dstArray ) )
  return BufferNode.from( result );
  if( _.bufferViewIs( dstArray ) )
  return new BufferView( result.buffer );
  else
  return result;
}

//

function bufferRelengthInplace( dstArray, range, srcArray )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( !_.bufferAnyIs( dstArray ) )
  return _.longRelengthInplace( dstArray, range, srcArray );

  let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;

  if( range === undefined )
  range = [ 0, length ];
  if( _.numberIs( range ) )
  range = [ range, length ];

  let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let last = range[ 1 ] !== undefined ? range[ 1 ] : length;

  _.assert( _.rangeIs( range ) );

  if( first < 0 )
  first = 0;
  if( first > length )
  first = length;
  if( last < first )
  last = first;

  if( first === 0 && last === length )
  return dstArray;
  else
  return _.bufferRelength( dstArray, range, srcArray );

}

//

/**
 * The bufferRelen() routine returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 *
 * It creates the variable (result) checks, if (len) is more than (src.length),
 * if true, it creates and assigns to (result) a new typed array with the new length (len) by call the function(longMakeUndefined(src, len))
 * and copies each element from the {-srcMap-} into the (result) array while ensuring only valid data types, if data types are invalid they are replaced with zero.
 * Otherwise, if (len) is less than (src.length) it returns a new typed array from 0 to the (len) indexes, but not including (len).
 * Otherwise, it returns an initial typed array.
 *
 * @see {@link wTools.longMakeUndefined} - See for more information.
 *
 * @param { typedArray } src - The source typed array.
 * @param { Number } len - The length of a typed array.
 *
 * @example
 * let ints = new I8x( [ 3, 7, 13 ] );
 * _.bufferRelen( ints, 4 );
 * // returns [ 3, 7, 13, 0 ]
 *
 * @example
 * let ints2 = new I16x( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints2, 3 );
 * // returns [ 3, 7, 13 ]
 *
 * @example
 * let ints3 = new I32x( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints3, 6 );
 * // returns [ 3, 0, 13, 0, 77, 0 ]
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
    result = _.longMakeUndefined( src, len );
    result.set( src );
  }
  else if( len < src.length )
  {
    result = src.subarray( 0, len );
  }

  return result;
}

//

/*
qqq : implement for 2 other types of buffer and do code test coverage
Dmytro : implemented for all buffer types
*/

/*
  qqq : wrong! Size and length are different concepts.
  Dmytro : use concept size in routine
*/

function bufferResize( srcBuffer, size )
{
  let result = srcBuffer;

  let range = _.rangeIs( size ) ? size : [ 0, size ];
  size = range[ 1 ] - range[ 0 ];

  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  _.assert( _.bufferAnyIs( srcBuffer ) );
  _.assert( srcBuffer.byteLength >= 0 );
  _.assert( _.rangeIs( range ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  var newOffset = srcBuffer.byteOffset ? srcBuffer.byteOffset + range[ 0 ] : range[ 0 ];

  if( !_.bufferRawIs( srcBuffer ) && newOffset >= 0 && newOffset + size <= srcBuffer.buffer.byteLength )
  {
    if( srcBuffer.constructor.name === 'Buffer' )
    result = BufferNode.from( srcBuffer.buffer, newOffset, size );
    if( srcBuffer.constructor.name === 'DataView' )
    result = new BufferView( srcBuffer.buffer, newOffset, size );
    else
    result = new srcBuffer.constructor( srcBuffer.buffer, newOffset, size / srcBuffer.BYTES_PER_ELEMENT );
  }
  else
  {
    let resultTyped = new U8x( size );
    let srcBufferToU8x = _.bufferRawIs( srcBuffer ) ? new U8x( srcBuffer ) : new U8x( srcBuffer.buffer );

    let first = Math.max( newOffset, 0 );
    let last = Math.min( srcBufferToU8x.byteLength, newOffset + size );
    newOffset = newOffset < 0 ? -newOffset : 0;
    for( let r = first ; r < last ; r++ )
    resultTyped[ r - first + newOffset ] = srcBufferToU8x[ r ];

    if( srcBuffer.constructor.name === 'Buffer' )
    result = BufferNode.from( resultTyped.buffer );
    if( srcBuffer.constructor.name === 'DataView' )
    result = new BufferView( resultTyped.buffer );
    if( srcBuffer.constructor.name === 'ArrayBuffer' )
    result = resultTyped.buffer;
    else
    result = new srcBuffer.constructor( resultTyped.buffer );
  }

  return result;
}

// function bufferResize( srcBuffer, size )
// {
//   let result = srcBuffer;
//
//   _.assert( _.bufferRawIs( srcBuffer ) || _.bufferTypedIs( srcBuffer ) );
//   _.assert( srcBuffer.byteLength >= 0 );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( size > srcBuffer.byteLength )
//   {
//     result = _.longMakeUndefined( srcBuffer, size );
//     let resultTyped = new U8x( result, 0, result.byteLength );
//     let srcTyped = new U8x( srcBuffer, 0, srcBuffer.byteLength );
//     resultTyped.set( srcTyped );
//   }
//   else if( size < srcBuffer.byteLength )
//   {
//     result = srcBuffer.slice( 0, size );
//   }
//
//   return result;
// }

//

function bufferResizeInplace( srcBuffer, size )
{
  _.assert( _.bufferAnyIs( srcBuffer ) );
  _.assert( srcBuffer.byteLength >= 0 );
  _.assert( _.numberIs( size ) || _.rangeIs( size ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let range = _.rangeIs( size ) ? size : [ 0, size ];
  if( range[ 0 ] === 0 && range[ 1 ] === srcBuffer.byteLength )
  return srcBuffer;
  else
  return bufferResize( srcBuffer, range );
}

//

function bufferBytesGet( src )
{

  if( src instanceof BufferRaw )
  {
    return new U8x( src );
  }
  else if( typeof BufferNode !== 'undefined' && src instanceof BufferNode )
  {
    return new U8x( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.bufferTypedIs( src ) )
  {
    return new U8x( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.strIs( src ) )
  {
    if( _global_.BufferNode )
    return new U8x( _.bufferRawFrom( BufferNode.from( src, 'utf8' ) ) );
    else
    return new U8x( _.encode.utf8ToBuffer( src ) );
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
   * let view1 = new I8x( [ 1, 2, 3, 4, 5, 6 ] );
   * _.bufferRetype(view1, I16x);
   * // returns [ 513, 1027, 1541 ]
   *
   * @example
   * let view2 = new I16x( [ 513, 1027, 1541 ] );
   * _.bufferRetype(view2, I8x);
   * // returns [ 1, 2, 3, 4, 5, 6 ]
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
  {
    _.assert( _.bufferAnyIs( arguments[ 0 ] ) || !arguments[ 0 ] );
    return arguments[ 0 ] || null;
  }

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
      srcs.push( new U8x( src ) );
    }
    else if( src instanceof U8x )
    {
      srcs.push( src );
    }
    else
    {
      srcs.push( new U8x( src.buffer, src.byteOffset, src.byteLength ) );
    }

    _.assert( src.byteLength >= 0, 'Expects buffers, but got', _.strType( src ) );

    size += src.byteLength;
  }

  if( srcs.length === 0 )
  return null;

  // if( srcs.length < 2 )
  // return firstSrc || null;

  /* */

  let resultBuffer = new BufferRaw( size );
  let result = _.bufferRawIs( firstSrc ) ? resultBuffer : new firstSrc.constructor( resultBuffer );
  let resultBytes = result.constructor === U8x ? result : new U8x( resultBuffer );

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
      dst = new U8x( dst );
      if( _.bufferTypedIs( src ) && !( src instanceof U8x ) )
      src = new U8x( src.buffer, src.byteOffset, src.byteLength );
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

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferAnyIs( src ) );

  if( typeof BufferNode !== 'undefined' )
  src = _.bufferNodeFrom( src );
  else if( src instanceof BufferRaw )
  src = new U8x( src, 0, src.byteLength );

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

function bufferLeft( src, ins )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( ins ) )
  ins = _.bufferBytesGet( ins );

  _.assert( src.indexOf );
  _.assert( ins.indexOf );

  let index = src.indexOf( ins[ 0 ] );
  while( index !== -1 )
  {

    for( let i = 0 ; i < ins.length ; i++ )
    if( src[ index+i ] !== ins[ i ] )
    break;

    if( i === ins.length )
    return index;

    index += 1;
    index = src.indexOf( ins[ 0 ], index );

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
//
// function buffersSerialize( o )
// {
//   let self = this;
//   let size = 0;
//   o = o || Object.create( null );
//
//   _.assertMapHasNoUndefine( o );
//   _.assertMapHasOnly( o, buffersSerialize.defaults );
//   _.mapComplement( o, buffersSerialize.defaults );
//   _.assert( _.objectIs( o.store ) );
//
//   let store = o.store;
//   let storeAttributes = store[ 'attributes' ] = store[ 'attributes' ] || Object.create( null );
//   let attributes = o.onAttributesGet.call( o.context );
//   let buffers = [];
//
//   /* eval size */
//
//   for( let a = 0 ; a < attributes.length ; a++ )
//   {
//
//     let name = attributes[ a ][ 0 ];
//     let attribute = attributes[ a ][ 1 ];
//     let buffer = o.onBufferGet.call( o.context, attribute );
//
//     _.assert( _.bufferTypedIs( buffer ) || buffer === null, 'Expects buffer or null, got : ' + _.strType( buffer ) );
//
//     let bufferSize = buffer ? buffer.length*buffer.BYTES_PER_ELEMENT : 0;
//
//     if( o.dropAttribute && o.dropAttribute[ name ] )
//     continue;
//
//     let descriptor = Object.create( null );
//     descriptor.attribute = attribute;
//     descriptor.name = name;
//     descriptor.buffer = buffer;
//     descriptor.bufferSize = bufferSize;
//     descriptor.sizeOfAtom = buffer ? buffer.BYTES_PER_ELEMENT : 0;
//     buffers.push( descriptor );
//
//     size += bufferSize;
//
//   }
//
//   /* make buffer */
//
//   if( !store[ 'buffer' ] )
//   store[ 'buffer' ] = new BufferRaw( size );
//
//   let dstBuffer = _.bufferBytesGet( store[ 'buffer' ] );
//
//   _.assert( store[ 'buffer' ].byteLength === size );
//   if( store[ 'buffer' ].byteLength < size )
//   throw _.err( 'buffersSerialize :', 'buffer does not have enough space' );
//
//   /* sort by atom size */
//
//   buffers.sort( function( a, b )
//   {
//     return b.sizeOfAtom - a.sizeOfAtom;
//   });
//
//   /* store into single buffer */
//
//   let offset = 0;
//   for( let b = 0 ; b < buffers.length ; b++ )
//   {
//
//     let name = buffers[ b ].name;
//     let attribute = buffers[ b ].attribute;
//     let buffer = buffers[ b ].buffer;
//     let bytes = buffer ? _.bufferBytesGet( buffer ) : new U8x();
//     let bufferSize = buffers[ b ].bufferSize;
//
//     if( o.dropAttribute && o.dropAttribute[ name ] )
//     continue;
//
//     _.bufferMove( dstBuffer.subarray( offset, offset+bufferSize ), bytes );
//
//     let serialized = store[ 'attributes' ][ name ] =
//     {
//       'bufferConstructorName' : buffer ? buffer.constructor.name : 'null',
//       'sizeOfAtom' : buffer ? buffer.BYTES_PER_ELEMENT : 0,
//       'offsetInCommonBuffer' : offset,
//       'size' : bytes.length,
//     }
//
//     if( attribute.copyCustom )
//     serialized[ 'fields' ] = attribute.copyCustom
//     ({
//
//       dst : Object.create( null ),
//       src : attribute,
//
//       copyingComposes : 3,
//       copyingAggregates : 3,
//       copyingAssociates : 1,
//
//       technique : 'data',
//
//     });
//
//     offset += bufferSize;
//
//   }
//
//   /* return */
//
//   return store;
// }
//
// buffersSerialize.defaults =
// {
//
//   context : null,
//   store : null,
//
//   dropAttribute : {},
//
//   onAttributesGet : function()
//   {
//     return _.mapPairs( this.attributes );
//   },
//   onBufferGet : function( attribute )
//   {
//     return attribute.buffer;
//   },
//
// }
//
// //
//
// function buffersDeserialize( o )
// {
//   o = o || Object.create( null );
//   let store = o.store;
//   let commonBuffer = store[ 'buffer' ];
//
//   _.assertMapHasNoUndefine( o );
//   _.assertMapHasOnly( o, buffersDeserialize.defaults );
//   _.mapComplement( o, buffersDeserialize.defaults );
//   _.assert( _.objectIs( o.store ) );
//   _.assert( _.bufferRawIs( commonBuffer ) || _.bufferTypedIs( commonBuffer ) );
//
//   commonBuffer = _.bufferRawFromTyped( commonBuffer );
//
//   for( let a in store[ 'attributes' ] )
//   {
//     let attribute = store[ 'attributes' ][ a ];
//
//     let bufferConstructor = attribute[ 'bufferConstructorName' ] === 'null' ? null : _global[ attribute[ 'bufferConstructorName' ] ];
//     let offset = attribute[ 'offsetInCommonBuffer' ];
//     let size = attribute[ 'size' ];
//     let sizeOfAtom = attribute[ 'sizeOfAtom' ];
//     let fields = attribute[ 'fields' ];
//
//     _.assert( _.routineIs( bufferConstructor ) || bufferConstructor === null, 'unknown attribute\' constructor :', attribute[ 'bufferConstructorName' ] )
//     _.assert( _.numberIs( offset ), 'unknown attribute\' offset in common buffer :', offset )
//     _.assert( _.numberIs( size ), 'unknown attribute\' size of buffer :', size )
//     _.assert( _.numberIs( sizeOfAtom ), 'unknown attribute\' sizeOfAtom of buffer :', sizeOfAtom )
//
//     if( attribute.offset+size > commonBuffer.byteLength )
//     throw _.err( 'cant deserialize attribute', '"'+a+'"', 'it is out of common buffer' );
//
//     /* logger.log( 'bufferConstructor( ' + commonBuffer + ', ' + offset + ', ' + size / sizeOfAtom + ' )' ); */
//
//     let buffer = bufferConstructor ? new bufferConstructor( commonBuffer, offset, size / sizeOfAtom ) : null;
//
//     o.onAttribute.call( o.context, fields, buffer, a );
//
//   }
//
// }
//
// buffersDeserialize.defaults =
// {
//   store : null,
//   context : null,
//   onAttribute : function( attributeOptions, buffer )
//   {
//     attributeOptions.buffer = buffer;
//     new this.AttributeOfGeometry( attributeOptions ).addTo( this );
//   },
// }

// --
// routines
// --

let Routines =
{

  buffersTypedAreEquivalent,
  buffersTypedAreIdentical,
  buffersRawAreIdentical,
  buffersViewAreIdentical,
  buffersNodeAreIdentical,
  buffersAreEquivalent,
  buffersAreIdentical,

  bufferMake,
  bufferMakeUndefined,

  bufferFromArrayOfArray,
  bufferFrom,
  bufferRawFromTyped,
  bufferRawFrom,
  bufferBytesFrom,
  bufferBytesFromNode,
  bufferNodeFrom,

  bufferBut,
  bufferButInplace,
  bufferBut_,
  bufferSelect,
  bufferSelectInplace,
  bufferSelect_,
  bufferGrow,
  bufferGrowInplace,
  bufferRelength,
  bufferRelengthInplace,
  bufferRelen,
  bufferResize,
  bufferResizeInplace,

  bufferBytesGet,
  bufferRetype,

  bufferJoin,

  bufferMove,
  bufferToStr,
  bufferToDom,

  bufferLeft,
  // bufferRight, /* qqq : please, implement and cover routine bufferRight */
  bufferSplit,
  bufferCutOffLeft,

  // buffersSerialize, /* deprecated */
  // buffersDeserialize, /* deprecated */

}

//

Object.assign( Self, Routines );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
