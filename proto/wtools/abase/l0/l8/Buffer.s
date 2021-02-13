( function _l8_Buffer_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// buffer
// --

function buffersTypedAreEquivalent( src1, src2, accuracy )
{

  // if( !_.bufferTypedIs( src1 ) )
  // return false;
  // if( !_.bufferTypedIs( src2 ) )
  // return false;

  if( !_.longIs( src1 ) )
  return false;
  if( !_.longIs( src2 ) )
  return false;

  if( src1.length !== src2.length )
  return false;

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

  // if( src1.byteLength !== src2.byteLength )
  // debugger;
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

  if( !_.bufferViewIs( src1 ) )
  return false;
  if( !_.bufferViewIs( src2 ) )
  return false;

  // if( src1.byteLength !== src2.byteLength )
  // debugger;
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
  return _.buffersTypedAreEquivalent( src1, src2, accuracy );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
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

function _bufferMake_functor( onMake )
{
  _.assert( _.routineIs( onMake ) );

  return function _bufferMake( src, ins )
  {
    let result;

    /* */

    let length = ins;

    if( _.longIs( length ) || _.bufferNodeIs( length ) )
    {
      length = length.length
    }
    else if( _.bufferRawIs( length ) || _.bufferViewIs( length ) )
    {
      length = length.byteLength;
      ins = _.bufferViewIs( ins ) ? new U8x( ins.buffer ) : new U8x( ins );
    }
    else if( length === undefined || length === null )
    {
      if( src === null ) /* Dmytro : Does module has default buffer type? */
      {
        length = 0;
      }
      else if( _.longIs( src ) || _.bufferNodeIs( src ) )
      {
        length = src.length;
        ins = src;
        // src = null;
      }
      else if( _.bufferRawIs( src ) )
      {
        length = src.byteLength;
        ins = new U8x( src );
        // src = null;
      }
      else if( _.bufferViewIs( src ) )
      {
        length = src.byteLength;
        ins = new U8x( src.buffer );
        // src = null;
      }
      else if( _.numberIs( src ) )
      {
        length = src;
        src = null;
      }
      else if( _.routineIs( src ) )
      {
        _.assert( 0, 'Unknown length of buffer' );
      }
      else _.assert( 0 );
    }
    else if( !_.numberIs( length ) )
    {
      _.assert( 0, 'Unknown length of buffer' );
    }

    if( !length )
    length = 0;

    /* */

    if( _.numberIs( ins ) )
    {
      if( _.bufferRawIs( src ) )
      ins = new U8x( src );
      else if( _.bufferViewIs( src ) )
      ins = new U8x( src.buffer )
      else if( _.longIs( src ) || _.bufferNodeIs( src ) )
      ins = src;
      else
      ins = null;
    }

    /* */

    let minLength;
    if( ins )
    minLength = Math.min( ins.length, length );
    else
    minLength = 0;

    /* */

    if( _.argumentsArrayIs( src ) )
    src = this.longDescriptor.make;

    if( src === null )
    src = this.longDescriptor.make;

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.numberIsFinite( length ) );
    _.assert( _.routineIs( src ) || _.longIs( src ) || _.bufferAnyIs( src ), 'unknown type of array', _.strType( src ) );

    result = onMake.call( this, src, ins, length, minLength );

    _.assert( _.bufferAnyIs( result ) || _.longLike( result ) );

    return result;
  }
}

//

/**
 * The routine bufferMake() returns a new buffer with the same type as source buffer {-src-}. New buffer fills by content of insertion buffer {-ins-}. If {-ins-} is
 * a number, the buffer fills by {-src-} content. The length of resulted buffer is equal to {-ins-}. If {-ins-} is not defined, then routine makes default Long type,
 * length of returned container defines from {-src-}.
 *
 * @param { BufferAny|Long|Function|Number|Null } src - Instance of any buffer, Long or constructor, defines type of returned buffer. If {-src-} is null,
 * then routine returns instance of default Long.
 * @param { Number|Long|Buffer|Null|Undefined } ins - Defines length and content of new buffer. If {-ins-} is null or undefined, then routine makes new container
 * with default Long type and fills it by {-src-} content.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * let got = _.bufferMake();
 * // returns []
 *
 * @example
 * let got = _.bufferMake( null );
 * // returns []
 *
 * @example
 * let got = _.bufferMake( null, null );
 * // returns []
 *
 * @example
 * let got = _.bufferMake( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.bufferMake( 3, null );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.bufferMake( new U8x( [ 1, 2, 3 ] ) );
 * // returns [ 1, 2, 3 ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * let got = _.bufferMake( new I16x( [ 1, 2, 3 ] ), null );
 * // returns [ 1, 2, 3 ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * _.bufferMake( new BufferRaw( 4 ), 6 );
 * // returns ArrayBuffer { [Uint8Contents]: <00 00 00 00 00 00>, byteLength: 6 }
 *
 * @example
 * _.bufferMake( new BufferRaw( 4 ), [ 1, 2, 3 ] );
 * // returns ArrayBuffer { [Uint8Contents]: <01 02 03>, byteLength: 3 }
 *
 * @example
 * _.bufferMake( F64x, [ 1, 2, 3 ] );
 * // returns Float64Array [ 1, 2, 3 ]
 *
 * @returns { BufferAny|Long }  Returns a buffer with source buffer {-src-} type filled by insertion container {-ins-} content.
 * If {-ins-} is not defined, then routine makes default Long type container and fills it by {-src-} content.
 * @function bufferMake
 * @throws { Error } If arguments.length is more than two.
 * @throws { Error } If {-src-} is not a Long, not a buffer, not a Number, not a constructor, not null.
 * @throws { Error } If {-src-} is constructor and second argument {-src-} is not provided.
 * @throws { Error } If {-src-} is constructor that returns not a Long, not a buffer value.
 * @throws { Error } If {-ins-} is not a number, not a Long, not a buffer, not null, not undefined.
 * @throws { Error } If {-ins-} or src.length has a not finite value.
 * @namespace Tools
 */

/*
aaa : review
Dmytro : reviewed, improved, covered
*/

let bufferMake = _bufferMake_functor( function( /* src, ins, length, minLength */ )
{
  let src = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let length = arguments[ 2 ];
  let minLength = arguments[ 3 ];

  /* */

  let resultTyped;
  if( _.routineIs( src ) )
  resultTyped = new src( length );
  else if( _.bufferNodeIs( src ) )
  resultTyped = BufferNode.alloc( length );
  else if( _.bufferViewIs( src ) )
  resultTyped = new BufferView( new BufferRaw( length ) );
  else if( _.unrollIs( src ) )
  resultTyped = _.unrollMake( length );
  else
  resultTyped = new src.constructor( length );

  let result = resultTyped;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );

  for( let i = 0 ; i < minLength ; i++ )
  resultTyped[ i ] = ins[ i ];

  return result;
});

//

// function bufferMake( src, ins )
// {
//   let result, length;
//
//   if( _.argumentsArrayIs( src ) )
//   src = _.arrayMake( src );
//
//   if( _.routineIs( src ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( ins === undefined )
//   {
//     length = _.definedIs( src.length ) ? src.length : src.byteLength;
//   }
//   else
//   {
//     if( _.longIs( ins ) || _.bufferNodeIs( ins ) )
//     length = ins.length;
//     else if( _.bufferRawIs( ins ) || _.bufferViewIs( ins ) )
//     {
//       length = ins.byteLength;
//       ins = _.bufferViewIs( ins ) ? new U8x( ins.buffer ) : new U8x( ins );
//     }
//     else if( _.numberIs( ins ) )
//     length = ins;
//     else _.assert( 0 );
//   }
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( length ) );
//   _.assert( _.routineIs( src ) || _.longIs( src ) || _.bufferAnyIs( src ), 'unknown type of array', _.strType( src ) );
//
//   if( _.longIs( ins ) || _.bufferAnyIs( ins ) )
//   {
//     if( _.routineIs( src ) )
//     {
//       result = new src( length );
//       for( let i = 0 ; i < length ; i++ )
//       result[ i ] = ins[ i ];
//     }
//     else if( src.constructor === Array )
//     {
//       result = _.unrollIs( src ) ? _.unrollMake( ins ) : new( _.constructorJoin( src.constructor, ins ) );
//     }
//     else if( _.bufferRawIs( src ) )
//     result = new U8x( ins ).buffer;
//     else if( _.bufferViewIs( src ) )
//     result = new BufferView( new U8x( ins ).buffer );
//     else if ( _.bufferNodeIs( src ) )
//     result = BufferNode.from( ins );
//     else
//     result = new src.constructor( ins );
//
//   }
//   else
//   {
//     let insert;
//     if( _.bufferRawIs( src ) )
//     insert = new U8x( src );
//     else if( _.bufferViewIs( src ) )
//     insert = new U8x( src.buffer );
//     else
//     insert = src;
//
//     let resultTyped;
//     if( _.routineIs( src ) )
//     resultTyped = new src( length );
//     else if( _.bufferNodeIs( src ) )
//     resultTyped = BufferNode.alloc( length );
//     else if ( _.bufferViewIs( src ) )
//     resultTyped = new BufferView( new BufferRaw( length ) );
//     else if( _.unrollIs( src ) )
//     resultTyped = _.unrollMake( length );
//     else
//     resultTyped = new src.constructor( length );
//
//     result = resultTyped;
//     if( _.bufferRawIs( result ) )
//     resultTyped = new U8x( result );
//     if( _.bufferViewIs( result ) )
//     resultTyped = new U8x( result.buffer );
//
//     let minLen = Math.min( length, insert.length );
//     for( let i = 0 ; i < minLen ; i++ )
//     resultTyped[ i ] = insert[ i ];
//   }
//
//   return result;
// }
//
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
 * The routine bufferMakeUndefined() returns a new buffer with the same type as source buffer {-src-}. The length of resulted buffer is equal to {-ins-}.
 * If {-ins-} is not defined, then routine makes default Long type, length of returned container defines from {-src-}.
 *
 * @param { BufferAny|Long|Function|Number|Null } src - Instance of any buffer, Long or constructor, defines type of returned buffer. If {-src-} is null,
 * then routine returns instance of default Long.
 * @param { Number|Long|Buffer|Null|Undefined } ins - Defines length of new buffer. If {-ins-} is null or undefined, then routine makes new container
 * with default Long type and length defined by {-src-}.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * let got = _.bufferMakeUndefined();
 * // returns []
 *
 * @example
 * let got = _.bufferMakeUndefined( null );
 * // returns []
 *
 * @example
 * let got = _.bufferMakeUndefined( null, null );
 * // returns []
 *
 * @example
 * let got = _.bufferMakeUndefined( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.bufferMakeUndefined( 3, null );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.bufferMakeUndefined( new U8x( [ 1, 2, 3 ] ) );
 * // returns [ undefined, undefined, undefined ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * let got = _.bufferMakeUndefined( new I16x( [ 1, 2, 3 ] ), null );
 * // returns [ undefined, undefined, undefined ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * _.bufferMakeUndefined( new BufferRaw( 4 ), 6 );
 * // returns ArrayBuffer { [Uint8Contents]: <00 00 00 00 00 00>, byteLength: 6 }
 *
 * @example
 * _.bufferMakeUndefined( new BufferRaw( 4 ), [ 1, 2, 3 ] );
 * // returns ArrayBuffer { [Uint8Contents]: <00 00 00>, byteLength: 3 }
 *
 * @example
 * _.bufferMakeUndefined( F64x, [ 1, 2, 3 ] );
 * // returns Float64Array [ 0, 0, 0 ]
 *
 * @returns { BufferAny|Long }  Returns a buffer with source buffer {-src-} type filled by insertion container {-ins-} content.
 * If {-ins-} is not defined, then routine makes default Long type container and fills it by {-src-} content.
 * @function bufferMakeUndefined
 * @throws { Error } If arguments.length is more than two.
 * @throws { Error } If {-src-} is not a Long, not a buffer, not a Number, not a constructor, not null.
 * @throws { Error } If {-src-} is constructor and second argument {-src-} is not provided.
 * @throws { Error } If {-src-} is constructor that returns not a Long, not a buffer value.
 * @throws { Error } If {-ins-} is not a number, not a Long, not a buffer, not null, not undefined.
 * @throws { Error } If {-ins-} or src.length has a not finite value.
 * @namespace Tools
 */

/*
aaa : review
Dmytro : reviewed, extended, covered
*/

let bufferMakeUndefined = _bufferMake_functor( function( /* src, ins, length, minLength */ )
{
  let src = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let length = arguments[ 2 ];
  let minLength = arguments[ 3 ];

  /* */

  let result;
  if( _.routineIs( src ) )
  result = new src( length );
  else if( _.bufferNodeIs( src ) )
  result = BufferNode.alloc( length );
  else if( _.bufferViewIs( src ) )
  result = new BufferView( new BufferRaw( length ) );
  else if( _.unrollIs( src ) )
  result = _.unrollMake( length );
  else
  result = new src.constructor( length );

  return result;
});

// function bufferMakeUndefined( ins, src )
// {
//   let result, length;
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
//     if( _.longIs( src ) || _.bufferNodeIs( src ) )
//     length = src.length;
//     else if( _.bufferRawIs( src ) || _.bufferViewIs( src ) )
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
//   _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferAnyIs( ins ), 'unknown type of array', _.strType( ins ) );
//
//   if( _.routineIs( ins ) )
//   result = new ins( length );
//   else if( _.bufferNodeIs( ins ) )
//   result = BufferNode.alloc( length );
//   else if( _.bufferViewIs( ins ) )
//   result = new BufferView( new BufferRaw( length ) );
//   else if( _.unrollIs( ins ) )
//   result = _.unrollMake( length );
//   else
//   result = new ins.constructor( length );
//
//   return result;
// }
//
// //
//
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
  if( !options.sameLength )
  throw _.err( '_.bufferFromArrayOfArray :', 'different length of arrays is not implemented' );

  if( !array.length )
  return new options.BufferType();

  let scalarsPerElement = _.numberIs( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.numberIs( scalarsPerElement ) )
  throw _.err( '_.bufferFromArrayOfArray :', 'cant find out element length' );

  let length = array.length * scalarsPerElement;
  let result = new options.BufferType( length );
  let i = 0;

  for( let a = 0 ; a < array.length ; a++ )
  {
    let element = array[ a ];

    for( let e = 0 ; e < scalarsPerElement ; e++ )
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
  _.assert( _.routineIs( o.bufferConstructor ), 'Expects bufferConstructor' );
  _.assertMapHasOnly( o, bufferFrom.defaults );

  if( o.src === null || _.numberIs( o.src ) )
  {
    if( o.bufferConstructor.name === 'Buffer' )
    return o.bufferConstructor.alloc( o.src ? o.src : 0 );
    else if( o.bufferConstructor.name === 'DataView' )
    return new o.bufferConstructor( new U8x( o.src ).buffer )
    return new o.bufferConstructor( o.src );
  }

  _.assert( _.bufferAnyIs( o.src ) || _.longIs( o.src ) || _.strIs( o.src ) );

  if( _.strIs( o.src ) )
  o.src = _.bufferBytesFrom( o.src );

  /* */

  if( o.src.constructor === o.bufferConstructor )
  return o.src;

  /* */

  if( _.bufferViewIs( o.src ) )
  o.src = o.src.buffer.slice( o.src.byteOffset, o.src.byteLength );

  if( _.constructorIsBuffer( o.bufferConstructor ) )
  return new o.bufferConstructor( o.src );

  if( o.bufferConstructor.name === 'Buffer' )
  return o.bufferConstructor.from( o.src );

  if( o.bufferConstructor.name === 'DataView' )
  return new o.bufferConstructor( new U8x( o.src ).buffer );

  if( o.bufferConstructor.name === 'ArrayBuffer' )
  return new U8x( o.src ).buffer;

  if( o.bufferConstructor.name === 'SharedArrayBuffer' )
  {
    let srcTyped = _.bufferRawIs( o.src ) ? new U8x( o.src ) : o.src;
    let result = new BufferRawShared( srcTyped.length );
    let resultTyped = new U8x( result );
    for( let i = 0; i < srcTyped.length; i++ )
    resultTyped[ i ] = srcTyped[ i ];
    return result;
  }
}

// function bufferFrom( o )
// {
//   let result;
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.objectIs( o ) );
//   _.assert( _.routineIs( o.bufferConstructor ), 'Expects bufferConstructor' );
//   _.assertMapHasOnly( o, bufferFrom.defaults );
//
//   /* same */
//
//   if( o.src.constructor )
//   if( o.src.constructor === o.bufferConstructor  )
//   return o.src;
//
//   /* number */
//
//   if( _.numberIs( o.src ) )
//   o.src = [ o.src ];
//
//   if( o.bufferConstructor.name === 'BufferRaw' )
//   return _.bufferRawFrom( o.src );
//
//   if( o.bufferConstructor.name === 'BufferNode' )
//   return _.bufferNodeFrom( o.src );
//
//   /* str / buffer.node / buffer.raw */
//
//   if( _.strIs( o.src ) || _.bufferNodeIs( o.src ) || _.bufferRawIs( o.src ) )
//   o.src = _.bufferBytesFrom( o.src );
//
//   /* buffer.typed */
//
//   if( _.bufferTypedIs( o.src ) )
//   {
//     if( o.src.constructor === o.bufferConstructor  )
//     return o.src;
//
//     result = new o.bufferConstructor( o.src );
//     return result;
//   }
//
//   /* verification */
//
//   _.assert( _.objectLike( o.src ) || _.longIs( o.src ), 'bufferFrom expects object-like or array-like as o.src' );
//
//   /* length */
//
//   let length = o.src.length;
//   if( !_.numberIs( length ) )
//   {
//
//     let length = 0;
//     while( o.src[ length ] !== undefined )
//     length += 1;
//
//   }
//
//   /* make */
//
//   if( _.arrayIs( o.src ) )
//   {
//     result = new o.bufferConstructor( o.src );
//   }
//   else if ( _.longIs( o.src ) )
//   {
//     result = new o.bufferConstructor( o.src );
//     throw _.err( 'not tested' );
//   }
//   else
//   {
//     result = new o.bufferConstructor( length );
//     for( let i = 0 ; i < length ; i++ )
//     result[ i ] = o.src[ i ];
//   }
//
//   return result;
// }

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
 * @namespace Tools
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

  /*
  aaa : should do not copying when possible! |
  aaa Dmytro : not copying if it possible
  zzz
  */

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

function bufferBytesFromNode( src ) /* Dmytro : what does this code do? */
{
  _.assert( _.bufferNodeIs( src ) );
  let result = new U8x( buffer );
  return result;
}

//

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
    // debugger;
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

// function bufferBut( dstArray, range, srcArray )
// {
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longBut( dstArray, range, srcArray );
//
//   if( range === undefined )
//   range = [ 0, 0 ];
//   if( _.numberIs( range ) )
//   range = [ range, range + 1 ];
//
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//   _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
//   _.assert( _.intervalIs( range ) );
//   _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );
//
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
//   let newLength = length - last + first;
//   let srcArrayLength = 0;
//
//   if( srcArray )
//   {
//     srcArrayLength = _.definedIs( srcArray.length ) ? srcArray.length : srcArray.byteLength;
//     newLength += srcArrayLength;
//   }
//
//   if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
//   {
//     result = new U8x( newLength );
//   }
//   else
//   {
//     result = _.longMakeUndefined( dstArray, newLength );
//   }
//
//   let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;
//
//   if( first > 0 )
//   {
//     for( let i = 0; i < first; ++i )
//     result[ i ] = dstArrayTyped[ i ];
//   }
//
//   if( srcArray )
//   {
//     for( let i = first, j = 0; j < srcArrayLength; )
//     result[ i++ ] = srcArray[ j++ ];
//   }
//
//   for( let j = last, i = first + srcArrayLength; j < length; )
//   result[ i++ ] = dstArrayTyped[ j++ ];
//
//   //
//
//   if( _.bufferRawIs( dstArray ) )
//   return result.buffer;
//   if( _.bufferNodeIs( dstArray ) )
//   return BufferNode.from( result );
//   if( _.bufferViewIs( dstArray ) )
//   return new BufferView( result.buffer );
//   else
//   return result;
// }

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
//   _.assert( _.intervalIs( range ) );
//   // _.assert( srcArray === undefined || _.arrayIs( srcArray ) );
//   _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );
//
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
// //
//
// function bufferButInplace( dstArray, range, srcArray )
// {
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longButInplace( dstArray, range, srcArray );
//
//   if( range === undefined )
//   return dstArray;
//   if( _.numberIs( range ) )
//   range = [ range, range + 1 ];
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( _.intervalIs( range ) );
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
//   if( last === first && srcArray === undefined )
//   return dstArray;
//   else
//   return _.bufferBut( dstArray, range, srcArray );
//
// }

//

function _argumentsOnlyBuffer( /* dst, src, range, ins */ )
{
  let dst = arguments[ 0 ];
  let src = arguments[ 1 ];
  let cinterval = arguments[ 2 ];
  let ins = arguments[ 3 ];

  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( dst === null )
  dst = true;
  else if( dst === src )
  dst = false;
  else if( arguments.length === 4 )
  _.assert( _.longIs( dst ) || _.bufferAnyIs( dst ), '{-dst-} should be Long or buffer' );
  else
  {
    if( arguments.length > 1 && !_.intervalIs( src ) && !_.numberIs( src ) )
    _.assert( _.longIs( dst ) || _.bufferAnyIs( dst ) );
    else
    {
      ins = range;
      range = src;
      src = dst;
      dst = false;
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
    dst.length = srcLength;
    else if( _.argumentsArrayIs( dst ) )
    dst = new Array( srcLength );
    else if( dstLength !== srcLength )
    dst = _.bufferViewIs( dst ) ? new BufferView( new BufferRaw( srcLength ) ) : new dst.constructor( srcLength );

    let dstTyped = dst;
    if( _.bufferRawIs( dstTyped ) )
    dstTyped = new U8x( dstTyped );
    else if( _.bufferViewIs( dstTyped ) )
    dstTyped = new U8x( dstTyped.buffer );

    if( _.bufferRawIs( src ) )
    src = new U8x( src );
    else if( _.bufferViewIs( src ) )
    src = new U8x( src.buffer );

    for( let i = 0; i < srcLength; i++ )
    dstTyped[ i ] = src[ i ];

    return dst;
  }
  return dst === true ? _.bufferMake( src ) : src;
}

//

/**
 * Routine bufferBut_() copies elements from source buffer {-src-} to destination buffer {-dst-}.
 * Routine copies all elements excluding elements in range {-cinterval-}, its elements replaces by elements
 * from insertion buffer {-ins-}.
 *
 * If first and second provided arguments is containers, then fisrs argument is destination
 * container {-dst-} and second argument is source container {-src-}. All data in {-dst-} cleares. If {-dst-} container
 * is not resizable and resulted length of destination container is not equal to original {-dst-} length, then routine
 * makes new container of {-dst-} type.
 *
 * If first argument and second argument are the same container, routine tries to change container inplace.
 *
 * If {-dst-} is not provided then routine tries to change container inplace.
 *
 * @param { BufferAny|Long|Null } dst - The destination container.
 * @param { BufferAny|Long } src - The container from which makes a shallow copy.
 * @param { Range|Number } cinterval - The two-element array that defines the start index and the end index for removing elements.
 * If {-cinterval-} is a Number, then it defines the index of removed element.
 * If {-cinterval-} is undefined and {-dst-} is null, then routine returns copy of {-src-}, otherwise, routine returns original {-src-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to ( src.length - 1 ).
 * If range[ 1 ] < range[ 0 ], then routine removes not elements, the insertion of elements begins at start index.
 * @param { BufferAny|Long } ins - The container with elements for insertion. Inserting begins at start index.
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( null, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( buffer, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ]
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( dst, buffer );
 * console.log( got );
 * // log [ 1, 2, 3, 4 ]
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let ins = new I32x( [ 0, 0 ] );
 * let got = _.bufferBut_( buffer, [ 1, 2 ], ins );
 * console.log( got );
 * // log Uint8Array[ 1, 0, 0, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( null, buffer, 1, [ 0, 0 ] );
 * console.log( got );
 * // log Uint8Array[ 0, 0, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( buffer, buffer, [ 1, 2 ], [ 0, 0 ] );
 * console.log( got );
 * // log Uint8Array[ 1, 0, 0, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ]
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferBut_( dst, buffer, [ 1, 2 ], [ 0, 0 ] );
 * console.log( got );
 * // log [ 1, 0, 0, 4 ]
 * console.log( got === dst );
 * // log true
 *
 * @returns { BufferAny|Long } - If {-dst-} is provided, routine returns container of {-dst-} type.
 * Otherwise, routine returns container of {-src-} type.
 * If {-dst-} and {-src-} are the same container, routine tries to return original container.
 * @function bufferBut_
 * @throws { Error } If arguments.length is less then one or more then four.
 * @throws { Error } If {-dst-} is not a buffer, not a Long, not null.
 * @throws { Error } If {-src-} is not an any buffer, not a Long.
 * @throws { Error } If {-cinterval-} is not a Range or not a Number.
 * @namespace Tools
 */

function bufferBut_( /* dst, src, cinterval, ins */ )
{
  let dst = arguments[ 0 ];
  let src = arguments[ 1 ];
  let cinterval = arguments[ 2 ];
  let ins = arguments[ 3 ];

  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( arguments.length < 4 && dst !== null && dst !== src )
  {
    dst = arguments[ 0 ];
    src = arguments[ 0 ];
    cinterval = arguments[ 1 ];
    ins = arguments[ 2 ];
  }

  let dstLength = 0;
  if( dst !== null )
  dstLength = dst.length !== undefined ? dst.length : dst.byteLength;
  let srcLength = src.length !== undefined ? src.length : src.byteLength;

  if( cinterval === undefined )
  {
    cinterval = [ 0, -1 ];
    ins = undefined;
  }
  else if( _.numberIs( cinterval ) )
  {
    cinterval = [ cinterval, cinterval ];
  }

  _.assert( _.bufferAnyIs( dst ) || _.longIs( dst ) || dst === null, 'Expects {-dst-} of any buffer type, long or null' );
  _.assert( _.bufferAnyIs( src ) || _.longIs( src ), 'Expects {-src-} of any buffer type or long' );
  _.assert( _.intervalIs( cinterval ), 'Expects cinterval {-cinterval-}' );
  _.assert( _.longIs( ins ) || _.bufferNodeIs( ins ) || ins === undefined || ins === null, 'Expects iterable buffer {-ins-}' );

  let first = cinterval[ 0 ] = cinterval[ 0 ] !== undefined ? cinterval[ 0 ] : 0;
  let last = cinterval[ 1 ] = cinterval[ 1 ] !== undefined ? cinterval[ 1 ] : srcLength - 1;

  if( first < 0 )
  first = 0;
  if( first > srcLength )
  first = srcLength;
  if( last > srcLength - 1 )
  last = srcLength - 1;

  if( last + 1 < first )
  last = first - 1;

  let delta = last - first + 1;
  let insLength = 0
  if( ins )
  insLength = ins.length !== undefined ? ins.length : ins.byteLength;
  let delta2 = delta - insLength;
  let resultLength = srcLength - delta2;

  let result = dst;
  if( dst === null )
  {
    result = _.bufferMakeUndefined( src, resultLength );
  }
  else if( dst === src )
  {
    if( ( dstLength === resultLength ) && delta === 0 )
    {
      return dst;
    }
    if( _.arrayLikeResizable( dst ) )
    {
      ins ? dst.splice( first, delta, ... ins ) : dst.splice( first, delta );
      return dst;
    }
    else if( dstLength !== resultLength || _.argumentsArrayIs( dst ) )
    {
      result = _.bufferMakeUndefined( dst, resultLength );
    }
  }
  else if( dstLength !== resultLength )
  {
    dst = _.bufferMakeUndefined( dst, resultLength );
  }

  let resultTyped = result;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  else if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );
  let srcTyped = src;
  if( _.bufferRawIs( src ) )
  srcTyped = new U8x( src );
  else if( _.bufferViewIs( src ) )
  srcTyped = new U8x( src.buffer );

  for( let i = 0 ; i < first ; i++ )
  resultTyped[ i ] = srcTyped[ i ];

  for( let i = last + 1 ; i < srcLength ; i++ )
  resultTyped[ i - delta2 ] = srcTyped[ i ];

  if( ins )
  {
    for( let i = 0 ; i < insLength ; i++ )
    resultTyped[ first + i ] = ins[ i ];
  }

  return result;
}

// //
//
// function bufferOnly( dstArray, range, srcArray )
// {
//
//   let result;
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longOnly( dstArray, range, srcArray );
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   range = [ 0, length ];
//   else if( _.numberIs( range ) )
//   range = [ range, length ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//   _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
//   _.assert( _.intervalIs( range ) );
//   _.assert( srcArray === undefined || _.longIs( srcArray ) || _.bufferAnyIs( srcArray ) );
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
//   let newLength = last - first;
//
//   if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
//   {
//     result = new U8x( newLength );
//   }
//   else
//   {
//     result = _.longMakeUndefined( dstArray, newLength );
//   }
//
//   let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;
//
//   let first2 = Math.max( first, 0 );
//   let last2 = Math.min( length, last );
//   for( let r = first2 ; r < last2 ; r++ )
//   result[ r-first2 ] = dstArrayTyped[ r ];
//
//   //
//   if( _.bufferRawIs( dstArray ) )
//   return result.buffer;
//   if( _.bufferNodeIs( dstArray ) )
//   return BufferNode.from( result );
//   if( _.bufferViewIs( dstArray ) )
//   return new BufferView( result.buffer );
//   else
//   return result;
// }

// //
//
// function bufferOnlyInplace( dstArray, range, srcArray )
// {
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longOnlyInplace( dstArray, range, srcArray );
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   range = [ 0, length ];
//   if( _.numberIs( range ) )
//   range = [ range, length ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( _.intervalIs( range ) );
//
//   if( first < 0 )
//   first = 0;
//   if( last > length)
//   last = length;
//
//   if( first === 0 && last === length )
//   return dstArray;
//   else
//   return _.bufferOnly( dstArray, range, srcArray );
//
// }

//

/**
 * Routine bufferOnly_() returns a shallow copy of a portion of provided container {-dstArray-}
 * into a new container selected by range {-range-}.
 *
 * If first and second provided arguments is containers, then fisrs argument is destination
 * container {-dst-} and second argument is source container {-dstArray-}. All data in {-dst-}
 * will be cleared. If {-dst-} container is not resizable and resulted container length
 * is not equal to original {-dst-} length, then routine makes new container of {-dst-} type.
 *
 * If first argument and second argument is the same container, routine will try change container inplace.
 *
 * If {-dst-} is not provided routine makes new container of {-dstArray-} type.
 *
 * @param { BufferAny|Long|Null } dst - The destination container.
 * @param { BufferAny|Long } dstArray - The container from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for selecting elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to dstArray.length.
 * If {-range-} is undefined, routine returns copy of {-dstArray-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > dstArray.length, end index sets to dstArray.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty container.
 * @param { * } srcArray - The object of any type for insertion.
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( null, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( buffer, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ]
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( dst, buffer );
 * console.log( got );
 * // log [ 1, 2, 3, 4 ]
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let src = new I32x( [ 0, 0, 0 ] );
 * let got = _.bufferOnly_( buffer, [ 1, 3 ], src );
 * console.log( got );
 * // log Uint8Array[ 2, 3 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( null, buffer, 1, [ 0, 0, 0 ] );
 * console.log( got );
 * // log Uint8Array[ 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( buffer, buffer, [ 1, 3 ], [ 0, 0, 0 ] );
 * console.log( got );
 * // log Uint8Array[ 2, 3 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let dst = [ 0, 0 ];
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferOnly_( dst, buffer, [ 1, 3 ], [ 0, 0, 0 ] );
 * console.log( got );
 * // log [ 2, 3 ]
 * console.log( got === dst );
 * // log true
 *
 * @returns { BufferAny|Long } If {-dst-} is provided, routine returns container of {-dst-} type.
 * Otherwise, routine returns container of {-dstArray-} type.
 * If {-dst-} and {-dstArray-} is the same container, routine tries to return original container.
 * @function bufferOnly_
 * @throws { Error } If arguments.length is less then one or more then four.
 * @throws { Error } If {-dst-} is not an any buffer, not a Long, not null.
 * @throws { Error } If {-dstArray-} is not an any buffer, not a Long.
 * @throws { Error } If ( range ) is not a Range or not a Number.
 * @namespace Tools
 */

function bufferOnly_( dst, src, cinterval )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3, 'Expects not {-ins-} argument' );

  if( arguments.length < 3 && dst !== null && dst !== src )
  {
    dst = arguments[ 0 ];
    src = arguments[ 0 ];
    cinterval = arguments[ 1 ];
  }

  let dstLength = 0;
  if( dst !== null )
  dstLength = dst.length !== undefined ? dst.length : dst.byteLength;
  let srcLength = src.length !== undefined ? src.length : src.byteLength;

  if( cinterval === undefined )
  cinterval = [ 0, srcLength - 1 ];
  if( _.numberIs( cinterval ) )
  cinterval = [ 0, cinterval ];

  _.assert( _.bufferAnyIs( dst ) || _.longIs( dst ) || dst === null, 'Expects {-dst-} of any buffer type, long or null' );
  _.assert( _.bufferAnyIs( src ) || _.longIs( src ), 'Expects {-src-} of any buffer type or long' );
  _.assert( _.intervalIs( cinterval ), 'Expects cinterval {-cinterval-}' );

  let first = cinterval[ 0 ] = cinterval[ 0 ] !== undefined ? cinterval[ 0 ] : 0;
  let last = cinterval[ 1 ] = cinterval[ 1 ] !== undefined ? cinterval[ 1 ] : srcLength - 1;

  if( first < 0 )
  first = 0;
  if( last > srcLength - 1 )
  last = srcLength - 1;

  if( last + 1 < first )
  last = first - 1;

  let first2 = Math.max( first, 0 );
  let last2 = Math.min( srcLength - 1, last );

  let resultLength = last - first + 1;

  let result = dst;
  if( dst === null )
  {
    result = _.bufferMakeUndefined( src, resultLength );
  }
  else if( dst === src )
  {
    if( dstLength === resultLength )
    {
      return dst;
    }
    if( _.arrayLikeResizable( dst ) )
    {
      _.assert( Object.isExtensible( dst ), 'Array is not extensible, cannot change array' );
      if( resultLength === 0 )
      return _.longEmpty( dst );

      dst.splice( last2 + 1, dst.length - last + 1 );
      dst.splice( 0, first2 );
      return dst;
    }
    else if( dstLength !== resultLength || _.argumentsArrayIs( dst ) )
    {
      result = _.bufferMakeUndefined( dst, resultLength );
    }
  }
  else if( dstLength !== resultLength )
  {
    if( !_.arrayLikeResizable( result ) )
    result = _.bufferMakeUndefined( dst, resultLength );
    else
    result.splice( resultLength );
  }

  let resultTyped = result;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  else if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );
  let srcTyped = src;
  if( _.bufferRawIs( src ) )
  srcTyped = new U8x( src );
  else if( _.bufferViewIs( src ) )
  srcTyped = new U8x( src.buffer );

  for( let r = first2 ; r < last2 + 1 ; r++ )
  resultTyped[ r - first2 ] = srcTyped[ r ];

  return result;
}

// //
//
// function bufferGrow( dstArray, range, srcArray )
// {
//
//   let result;
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longGrow( dstArray, range, srcArray );
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   range = [ 0, length ];
//   if( _.numberIs( range ) )
//   range = [ 0, range ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( 1 <= arguments.length && arguments.length <= 3, 'Expects two or three arguments' );
//   _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
//   _.assert( _.intervalIs( range ) );
//
//   if( first < 0 )
//   {
//     last -= first;
//     first -= first;
//   }
//   if( last < first )
//   last = first;
//   if( first > 0 )
//   first = 0;
//   if( last < length )
//   last = length;
//
//   let newLength = last - first;
//
//   if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
//   {
//     result = new U8x( newLength );
//   }
//   else
//   {
//     result = _.longMakeUndefined( dstArray, newLength );
//   }
//
//   let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;
//
//   let first2 = Math.max( first, 0 );
//   let last2 = Math.min( length, last );
//   for( let r = first2 ; r < last2 ; r++ )
//   result[ r-first2 ] = dstArrayTyped[ r ];
//
//   if( srcArray !== undefined )
//   {
//     for( let r = last2; r < newLength ; r++ )
//     {
//       result[ r ] = srcArray;
//     }
//   }
//
//   //
//   if( _.bufferRawIs( dstArray ) )
//   return result.buffer;
//   if( _.bufferNodeIs( dstArray ) )
//   return BufferNode.from( result );
//   if( _.bufferViewIs( dstArray ) )
//   return new BufferView( result.buffer );
//   else
//   return result;
// }
//
// //
//
// function bufferGrowInplace( dstArray, range, srcArray )
// {
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longGrowInplace( dstArray, range, srcArray );
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   range = [ 0, length ];
//   if( _.numberIs( range ) )
//   range = [ 0, range ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( _.intervalIs( range ) );
//
//   if( first < 0 )
//   {
//     last -= first;
//     first -= first;
//   }
//   if( first > 0 )
//   first = 0;
//   if( last < length )
//   last = length;
//
//   if( first === 0 && last === length )
//   return dstArray;
//   else
//   return _.bufferGrow( dstArray, range, srcArray );
//
// }

//

/**
 * Routine bufferGrow_() grows provided container {-dst-} by copying elements of source buffer to it.
 * Routine uses cinterval {-cinterval-} positions of the source container and value {-ins-} to fill destination buffer.
 * Routine can only grows size of source container.
 *
 * If first and second provided arguments is containers, then fisrs argument is destination
 * container {-dst-} and second argument is source container {-dstArray-}. All data in {-dst-}
 * will be cleared. If {-dst-} container is not resizable and resulted container length
 * is not equal to original {-src-} length, then routine makes new container with {-dst-} type.
 *
 * If first argument and second argument is the same container, routine will try change container inplace.
 *
 * If {-dst-} is not provided routine makes new container with {-src-} type.
 *
 * @param { BufferAny|Long|Null } dst - The destination container.
 * @param { BufferAny|Long } src - The container from which makes a shallow copy.
 * @param { Range|Number } cinterval - The two-element array that defines the start index and the end index for copying elements from {-src-} and adding {-ins-}.
 * If {-range-} is number, then it defines the end index, and the start index is 0.
 * If range[ 0 ] < 0, then start index sets to 0, end index incrementes by absolute value of range[ 0 ].
 * If range[ 0 ] > 0, then start index sets to 0.
 * If range[ 1 ] < range[ 0 ], then routine returns a copy of original container.
 * @param { * } ins - The object of any type for insertion.
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( null, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( buffer, buffer, [ 0, 3 ] );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ]
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( dst, buffer, [ 0, 3 ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4 ]
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( buffer, [ 1, 5 ], 0 );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4, 0, 0 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( null, buffer, 2, 1 );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( buffer, buffer, [ 0, 3 ], 2 );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ];
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferGrow_( dst, buffer, [ 1, 5 ], 1 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 1, 1 ]
 * console.log( got === dst );
 * // log true
 *
 * @returns { BufferAny|Long } - If {-dst-} is provided, routine returns container of {-dst-} type.
 * Otherwise, routine returns container of {-src-} type.
 * If {-dst-} and {-src-} is the same container, routine tries to return original container.
 * @function bufferGrow_
 * @throws { Error } If arguments.length is less then one or more then four.
 * @throws { Error } If {-dst-} is not an any buffer, not a Long, not null.
 * @throws { Error } If {-src-} is not an any buffer, not a Long.
 * @throws { Error } If ( range ) is not a Range or not a Number.
 * @namespace Tools
 */

function bufferGrow_( /* dst, src, cinterval, ins */ )
{
  let dst = arguments[ 0 ];
  let src = arguments[ 1 ];
  let cinterval = arguments[ 2 ];
  let ins = arguments[ 3 ];

  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( arguments.length < 4 && dst !== null && dst !== src )
  {
    dst = arguments[ 0 ];
    src = arguments[ 0 ];
    cinterval = arguments[ 1 ];
    ins = arguments[ 2 ];
  }

  let dstLength = 0;
  if( dst !== null )
  dstLength = dst.length !== undefined ? dst.length : dst.byteLength;
  let srcLength = src.length !== undefined ? src.length : src.byteLength;

  if( cinterval === undefined )
  cinterval = [ 0, srcLength - 1 ];
  if( _.numberIs( cinterval ) )
  cinterval = [ 0, cinterval - 1 ];

  _.assert( _.bufferAnyIs( dst ) || _.longIs( dst ) || dst === null, 'Expects {-dst-} of any buffer type, long or null' );
  _.assert( _.bufferAnyIs( src ) || _.longIs( src ), 'Expects {-src-} of any buffer type or long' );
  _.assert( _.intervalIs( cinterval ), 'Expects cinterval {-cinterval-}' );

  let first = cinterval[ 0 ] = cinterval[ 0 ] !== undefined ? cinterval[ 0 ] : 0;
  let last = cinterval[ 1 ] = cinterval[ 1 ] !== undefined ? cinterval[ 1 ] : srcLength - 1;

  if( first > 0 )
  first = 0;
  if( last < srcLength - 1 )
  last = srcLength - 1;

  if( first < 0 )
  {
    last -= first;
    first -= first;
  }

  if( last + 1 < first )
  last = first - 1;

  let first2 = Math.max( -cinterval[ 0 ], 0 );
  let last2 = Math.min( srcLength - 1 + first2, last + first2 );

  let resultLength = last - first + 1;

  let result = dst;
  if( dst === null )
  {
    result = _.bufferMakeUndefined( src, resultLength );
  }
  else if( dst === src )
  {
    if( dstLength === resultLength )
    {
      return dst;
    }
    if( _.arrayLikeResizable( dst ) )
    {
      _.assert( Object.isExtensible( dst ), 'Array is not extensible, cannot change array' );
      dst.splice( first, 0, ... _.dup( ins, first2 ) );
      dst.splice( last2 + 1, 0, ... _.dup( ins, resultLength <= last2 ? 0 : resultLength - last2 - 1 ) );
      return dst;
    }
    else if( dstLength !== resultLength || _.argumentsArrayIs( dst ) )
    {
      result = _.bufferMakeUndefined( dst, resultLength );
    }
  }
  else if( dstLength !== resultLength )
  {
    if( !_.arrayLikeResizable( result ) )
    result = _.bufferMakeUndefined( dst, resultLength );
    else
    result.splice( resultLength );
  }

  let resultTyped = result;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  else if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );
  let srcTyped = src;
  if( _.bufferRawIs( src ) )
  srcTyped = new U8x( src );
  else if( _.bufferViewIs( src ) )
  srcTyped = new U8x( src.buffer );

  for( let r = first2 ; r < last2 + 1 ; r++ )
  resultTyped[ r ] = srcTyped[ r - first2 ];

  if( ins !== undefined )
  {
    for( let r = 0 ; r < first2 ; r++ )
    resultTyped[ r ] = ins;

    for( let r = last2 + 1 ; r < resultLength ; r++ )
    resultTyped[ r ] = ins;
  }

  return result;
}

// function bufferGrow_( dst, dstArray, range, srcArray )
// {
//
//   [ dst, dstArray, range, srcArray ] = _argumentsOnlyBuffer.apply( this, arguments );
//
//   if( _.arrayLikeResizable( dstArray ) )
//   return _.arrayGrow_.apply( this, arguments );
//
//   let length = dstArray.length !== undefined ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   return _returnDst( dst, dstArray );
//
//   if( _.numberIs( range ) )
//   range = [ 0, range ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( _.intervalIs( range ) );
//
//   if( first < 0 )
//   {
//     last -= first;
//     first -= first;
//   }
//   if( last < first )
//   last = first;
//   if( first > 0 )
//   first = 0;
//   if( last < length )
//   last = length;
//
//   if( first === 0 && last === length )
//   return _returnDst( dst, dstArray );
//
//   let newLength = last - first;
//   let dstLength = dst.length !== undefined ? dst.length : dst.byteLength;
//
//   let result;
//   if( _.boolIs( dst ) )
//   result = _.bufferMakeUndefined( dstArray, newLength );
//   else if( _.arrayLikeResizable( dst ) )
//   {
//     result = dst;
//     result.length = newLength;
//   }
//   else if( _.argumentsArrayIs( dst ) )
//   result = new Array( newLength );
//   else if( dstLength !== newLength )
//   result = _.bufferViewIs( dst ) ? new BufferView( new BufferRaw( newLength ) ) : new dst.constructor( newLength );
//   else
//   result = dst;
//
//   let resultTyped = result;
//   if( _.bufferRawIs( result ) )
//   resultTyped = new U8x( result );
//   else if( _.bufferViewIs( result ) )
//   resultTyped = new U8x( result.buffer );
//   let dstArrayTyped = dstArray;
//   if( _.bufferRawIs( dstArray ) )
//   dstArrayTyped = new U8x( dstArray );
//   else if( _.bufferViewIs( dstArray ) )
//   dstArrayTyped = new U8x( dstArray.buffer );
//
//   let first2 = Math.max( first, 0 );
//   let last2 = Math.min( length, last );
//   for( let r = first2 ; r < last2 ; r++ )
//   resultTyped[ r-first2 ] = dstArrayTyped[ r ];
//
//   if( srcArray !== undefined )
//   {
//     for( let r = last2; r < newLength; r++ )
//     resultTyped[ r ] = srcArray;
//   }
//
//   return result;
// }

// //
//
// function bufferRelength( dstArray, range, srcArray )
// {
//
//   let result;
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longRelength( dstArray, range, srcArray );
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   range = [ 0, length ];
//   if( _.numberIs( range ) )
//   range = [ range, length ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( 1 <= arguments.length && arguments.length <= 3, 'Expects two or three arguments' );
//   _.assert( _.arrayIs( dstArray ) || _.bufferAnyIs( dstArray ) );
//   _.assert( _.intervalIs( range ) );
//
//   if( first < 0 )
//   first = 0;
//   if( first > length )
//   first = length;
//   if( last < first )
//   last = first;
//
//   let newLength = last - first;
//
//   if( _.bufferViewIs( dstArray ) || _.bufferRawIs( dstArray ) || _.bufferNodeIs( dstArray ) )
//   {
//     result = new U8x( newLength );
//   }
//   else
//   {
//     result = _.longMakeUndefined( dstArray, newLength );
//   }
//
//   let dstArrayTyped = _.bufferRawIs( dstArray ) ? new U8x( dstArray ) : dstArray;
//
//   let first2 = Math.max( first, 0 );
//   let last2 = Math.min( length, last );
//   for( let r = first2 ; r < last2 ; r++ )
//   result[ r-first2 ] = dstArrayTyped[ r ];
//
//   if( srcArray !== undefined )
//   {
//     for( let r = last2 -first2; r < newLength ; r++ )
//     {
//       result[ r ] = srcArray;
//     }
//   }
//
//   if( _.bufferRawIs( dstArray ) )
//   return result.buffer;
//   if( _.bufferNodeIs( dstArray ) )
//   return BufferNode.from( result );
//   if( _.bufferViewIs( dstArray ) )
//   return new BufferView( result.buffer );
//   else
//   return result;
// }

// //
//
// function bufferRelengthInplace( dstArray, range, srcArray )
// {
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//
//   if( !_.bufferAnyIs( dstArray ) )
//   return _.longRelengthInplace( dstArray, range, srcArray );
//
//   let length = _.definedIs( dstArray.length ) ? dstArray.length : dstArray.byteLength;
//
//   if( range === undefined )
//   range = [ 0, length ];
//   if( _.numberIs( range ) )
//   range = [ range, length ];
//
//   let first = range[ 0 ] !== undefined ? range[ 0 ] : 0;
//   let last = range[ 1 ] !== undefined ? range[ 1 ] : length;
//
//   _.assert( _.intervalIs( range ) );
//
//   if( first < 0 )
//   first = 0;
//   if( first > length )
//   first = length;
//   if( last < first )
//   last = first;
//
//   if( first === 0 && last === length )
//   return dstArray;
//   else
//   return _.bufferRelength( dstArray, range, srcArray );
//
// }

//

/**
 * Routine bufferRelength_() changes length of provided container {-dstArray-} by copying it elements to newly created container of the same
 * type using range {-range-} positions of the original containers and value to fill free space after copy {-srcArray-}.
 * Routine can grows and reduces size of container.
 *
 * If first and second provided arguments is containers, then fisrs argument is destination
 * container {-dst-} and second argument is source container {-dstArray-}. All data in {-dst-}
 * will be cleared. If {-dst-} container is not resizable and resulted container length
 * is not equal to original {-dst-} length, then routine makes new container of {-dst-} type.
 *
 * If first argument and second argument is the same container, routine will try change container inplace.
 *
 * If {-dst-} is not provided routine makes new container of {-dstArray-} type.
 *
 * @param { BufferAny|Long|Null } dst - The destination container.
 * @param { BufferAny|Long } dstArray - The container from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements from {-dstArray-} and adding {-srcArray-}.
 * If {-range-} is number, then it defines the start index, and the end index sets to dstArray.length.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty container.
 * @param { * } srcArray - The object of any type for insertion.
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( null, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( buffer, buffer );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ]
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( dst, buffer );
 * console.log( got );
 * // log [ 1, 2, 3, 4 ]
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( buffer, [ 1, 6 ], 0 );
 * console.log( got );
 * // log Uint8Array[ 2, 3, 4, 0, 0 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( null, buffer, 2, 1 );
 * console.log( got );
 * // log Uint8Array[ 3, 4 ]
 * console.log( got === buffer );
 * // log false
 *
 * @example
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( buffer, buffer, [ 0, 3 ], 2 );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4 ]
 * console.log( got === buffer );
 * // log true
 *
 * @example
 * let dst = [ 0, 0 ];
 * let buffer = new U8x( [ 1, 2, 3, 4 ] );
 * let got = _.bufferRelength_( dst, buffer, [ 1, 6 ], [ 0, 0, 0 ] );
 * console.log( got );
 * // log [ 2, 3, 4, [ 0, 0, 0 ], [ 0, 0, 0 ] ]
 * console.log( got === dst );
 * // log true
 *
 * @returns { BufferAny|Long } If {-dst-} is provided, routine returns container of {-dst-} type.
 * Otherwise, routine returns container of {-dstArray-} type.
 * If {-dst-} and {-dstArray-} is the same container, routine tries to return original container.
 * @function bufferRelength_
 * @throws { Error } If arguments.length is less then one or more then four.
 * @throws { Error } If {-dst-} is not an any buffer, not a Long, not null.
 * @throws { Error } If {-dstArray-} is not an any buffer, not a Long.
 * @throws { Error } If ( range ) is not a Range or not a Number.
 * @namespace Tools
 */

function bufferRelength_( /* dst, src, cinterval, ins */ )
{
  let dst = arguments[ 0 ];
  let src = arguments[ 1 ];
  let cinterval = arguments[ 2 ];
  let ins = arguments[ 3 ];

  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( arguments.length < 4 && dst !== null && dst !== src )
  {
    dst = arguments[ 0 ];
    src = arguments[ 0 ];
    cinterval = arguments[ 1 ];
    ins = arguments[ 2 ];
  }

  let dstLength = 0;
  if( dst !== null )
  dstLength = dst.length !== undefined ? dst.length : dst.byteLength;
  let srcLength = src.length !== undefined ? src.length : src.byteLength;

  if( cinterval === undefined )
  cinterval = [ 0, srcLength - 1 ];
  if( _.numberIs( cinterval ) )
  cinterval = [ 0, cinterval-1 ];

  _.assert( _.bufferAnyIs( dst ) || _.longIs( dst ) || dst === null, 'Expects {-dst-} of any buffer type, long or null' );
  _.assert( _.bufferAnyIs( src ) || _.longIs( src ), 'Expects {-src-} of any buffer type or long' );
  _.assert( _.intervalIs( cinterval ), 'Expects cinterval {-cinterval-}' );

  let first = cinterval[ 0 ] = cinterval[ 0 ] !== undefined ? cinterval[ 0 ] : 0;
  let last = cinterval[ 1 ] = cinterval[ 1 ] !== undefined ? cinterval[ 1 ] : srcLength - 1;

  if( last < first )
  last = first - 1;

  if( cinterval[ 1 ] < 0 && cinterval[ 0 ] < 0 )
  cinterval[ 0 ] -= cinterval[ 1 ] + 1;

  if( first < 0 )
  {
    last -= first;
    first -= first;
  }

  let first2 = Math.max( Math.abs( cinterval[ 0 ] ), 0 );
  let last2 = Math.min( srcLength - 1, last );

  let resultLength = last - first + 1;

  let result = dst;
  if( dst === null )
  {
    result = _.bufferMakeUndefined( src, resultLength );
  }
  else if( dst === src )
  {
    if( dstLength === resultLength && cinterval[ 0 ] === 0 )
    {
      return dst;
    }
    if( _.arrayLikeResizable( dst ) )
    {
      _.assert( Object.isExtensible( dst ), 'dst is not extensible, cannot change dst' );
      if( cinterval[ 0 ] < 0 )
      {
        dst.splice( first, 0, ... _.dup( ins, first2 ) );
        dst.splice( last2 + 1, src.length - last2, ... _.dup( ins, last - last2 ) );
      }
      else
      {
        dst.splice( 0, first );
        dst.splice( last2 + 1 - first2, src.length - last2, ... _.dup( ins, last - last2 ) );
      }
      return dst;
    }
    else if( dstLength !== resultLength || _.argumentsArrayIs( dst ) )
    {
      result = _.bufferMakeUndefined( dst, resultLength );
    }
  }
  else if( dstLength !== resultLength )
  {
    if( !_.arrayLikeResizable( result ) )
    result = _.bufferMakeUndefined( dst, resultLength );
    else
    result.splice( resultLength );
  }

  let resultTyped = result;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  else if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );
  let srcTyped = src;
  if( _.bufferRawIs( src ) )
  srcTyped = new U8x( src );
  else if( _.bufferViewIs( src ) )
  srcTyped = new U8x( src.buffer );

  if( resultLength === 0 )
  {
    return result;
  }
  if( cinterval[ 0 ] < 0 )
  {
    for( let r = first2 ; r < ( last2 + 1 + first2 ) && r < resultLength ; r++ )
    resultTyped[ r ] = srcTyped[ r - first2 ];
    if( ins !== undefined )
    {
      for( let r = 0 ; r < first2 ; r++ )
      resultTyped[ r ] = ins;
      for( let r = last2 + 1 + first2 ; r < resultLength ; r++ )
      resultTyped[ r ] = ins;
    }
  }
  else
  {
    for( let r = first2 ; r < last2 + 1 ; r++ )
    resultTyped[ r - first2 ] = srcTyped[ r ];
    if( ins !== undefined )
    {
      for( let r = last2 + 1 ; r < last + 1 ; r++ )
      resultTyped[ r - first2 ] = ins;
    }
  }

  return result;
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
 * @namespace Tools
 */

function bufferRelen( src, len )
{
  let result = src;

  _.assert( _.bufferTypedIs( src ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( len ) );

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

// //
//
// function bufferResize( srcBuffer, size )
// {
//   let result = srcBuffer;
//
//   let range = _.intervalIs( size ) ? size : [ 0, size ];
//   size = range[ 1 ] - range[ 0 ];
//
//   if( range[ 1 ] < range[ 0 ] )
//   range[ 1 ] = range[ 0 ];
//
//   _.assert( _.bufferAnyIs( srcBuffer ) );
//   _.assert( srcBuffer.byteLength >= 0 );
//   _.assert( _.intervalIs( range ) );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   var newOffset = srcBuffer.byteOffset ? srcBuffer.byteOffset + range[ 0 ] : range[ 0 ];
//
//   if( !_.bufferRawIs( srcBuffer ) && newOffset >= 0 && newOffset + size <= srcBuffer.buffer.byteLength )
//   {
//     if( srcBuffer.constructor.name === 'Buffer' )
//     result = BufferNode.from( srcBuffer.buffer, newOffset, size );
//     if( srcBuffer.constructor.name === 'DataView' )
//     result = new BufferView( srcBuffer.buffer, newOffset, size );
//     else
//     result = new srcBuffer.constructor( srcBuffer.buffer, newOffset, size / srcBuffer.BYTES_PER_ELEMENT );
//   }
//   else
//   {
//     let resultTyped = new U8x( size );
//     let srcBufferToU8x = _.bufferRawIs( srcBuffer ) ? new U8x( srcBuffer ) : new U8x( srcBuffer.buffer );
//
//     let first = Math.max( newOffset, 0 );
//     let last = Math.min( srcBufferToU8x.byteLength, newOffset + size );
//     newOffset = newOffset < 0 ? -newOffset : 0;
//     for( let r = first ; r < last ; r++ )
//     resultTyped[ r - first + newOffset ] = srcBufferToU8x[ r ];
//
//     if( srcBuffer.constructor.name === 'Buffer' )
//     result = BufferNode.from( resultTyped.buffer );
//     if( srcBuffer.constructor.name === 'DataView' )
//     result = new BufferView( resultTyped.buffer );
//     if( srcBuffer.constructor.name === 'ArrayBuffer' )
//     result = resultTyped.buffer;
//     else
//     result = new srcBuffer.constructor( resultTyped.buffer );
//   }
//
//   return result;
// }

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

// //
//
// function bufferResizeInplace( srcBuffer, size )
// {
//   _.assert( _.bufferAnyIs( srcBuffer ) );
//   _.assert( srcBuffer.byteLength >= 0 );
//   _.assert( _.numberIs( size ) || _.intervalIs( size ) );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   let range = _.intervalIs( size ) ? size : [ 0, size ];
//   if( range[ 0 ] === 0 && range[ 1 ] === srcBuffer.byteLength )
//   return srcBuffer;
//   else
//   return bufferResize( srcBuffer, range );
// }

//

function bufferResize_( dst, srcBuffer, size )
{
  if( dst === null )
  dst = _.nothing;

  if( arguments.length === 2 )
  {
    size = srcBuffer;
    srcBuffer = dst;
  }

  let range = _.intervalIs( size ) ? size : [ 0, size ];
  size = range[ 1 ] - range[ 0 ];

  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  _.assert( _.bufferAnyIs( srcBuffer ) && srcBuffer.byteLength >= 0 );
  _.assert( _.intervalIs( range ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( dst === srcBuffer && range[ 0 ] === 0 && range[ 1 ] === srcBuffer.byteLength )
  return srcBuffer;

  let result;
  let newOffset = srcBuffer.byteOffset ? srcBuffer.byteOffset + range[ 0 ] : range[ 0 ];

  if( dst !== _.nothing )
  {
    _.assert( _.bufferAnyIs( dst ) );

    if( dst === srcBuffer && !_.bufferRawIs( srcBuffer ) && newOffset >= 0 && newOffset + size <= srcBuffer.buffer.byteLength )
    {
      if( _.bufferNodeIs( srcBuffer ) )
      result = BufferNode.from( srcBuffer.buffer, newOffset, size );
      else if( _.bufferViewIs( srcBuffer ) )
      result = new BufferView( srcBuffer.buffer, newOffset, size );
      else
      result = new srcBuffer.constructor( srcBuffer.buffer, newOffset, size / srcBuffer.BYTES_PER_ELEMENT );
    }
    else if( _.bufferRawIs( dst ) )
    {
      if( size === dst.byteLength )
      result = dst;
      else
      result = _.bufferMakeUndefined( dst, size );
    }
    else if( size <= dst.byteLength )
    {
      result = dst;
    }
    else
    {
      result = _.bufferMakeUndefined( dst, size / dst.BYTES_PER_ELEMENT || size );
    }

    let dstTyped = _.bufferRawIs( result ) ? new U8x( result ) : new U8x( result.buffer );
    let srcBufferToU8x = _.bufferRawIs( srcBuffer ) ? new U8x( srcBuffer ) : new U8x( srcBuffer.buffer );

    let first = Math.max( newOffset, 0 );
    let last = Math.min( srcBufferToU8x.byteLength, newOffset + size );
    for( let r = first ; r < last ; r++ )
    dstTyped[ r - first ] = srcBufferToU8x[ r ];
    dstTyped.fill( 0, last - first, dstTyped.length );
  }
  else
  {
    _.assert( dst === _.nothing );

    result = _.bufferMakeUndefined( srcBuffer, size / srcBuffer.BYTES_PER_ELEMENT || size );
    let resultTyped = _.bufferRawIs( result ) ? new U8x( result ) : new U8x( result.buffer );
    let srcBufferToU8x = _.bufferRawIs( srcBuffer ) ? new U8x( srcBuffer ) : new U8x( srcBuffer.buffer );

    let first = Math.max( newOffset, 0 );
    let last = Math.min( srcBufferToU8x.byteLength, newOffset + size );
    newOffset = newOffset < 0 ? -newOffset : 0;
    for( let r = first ; r < last ; r++ )
    resultTyped[ r - first + newOffset ] = srcBufferToU8x[ r ];
  }

  return result;
}

//

function _bufferReusing_head()
{
  let o = Object.create( null );
  if( arguments.length === 1 )
  {
    if( _.mapIs( arguments[ 0 ] ) )
    {
      o = arguments[ 0 ];
    }
    else
    {
      o.dst = null;
      o.src = arguments[ 0 ];
    }
  }
  else if( arguments.length === 2 )
  {
    o.dst = null;
    o.src = arguments[ 0 ];
    o.cinterval = arguments[ 1 ];
  }
  else if( arguments.length === 3 )
  {
    o.dst = null;
    o.src = arguments[ 0 ];
    o.cinterval = arguments[ 1 ];
    o.ins = arguments[ 2 ];
  }
  else
  {
    o.dst = arguments[ 0 ];
    o.src = arguments[ 1 ];
    o.cinterval = arguments[ 2 ];
    o.ins = arguments[ 3 ];
  }

  return o;
}

//

function _bufferReusing( o )
{
  _.assert( arguments.length === 1 );
  _.routineOptions( _bufferReusing, o );
  _.assert( _.bufferAnyIs( o.src ) || _.longIs( o.src ) );
  _.assert( _.intervalIs( o.cinterval ) );
  _.assert( _.intIs( o.growFactor ) && o.growFactor >= 0 );
  _.assert( _.intIs( o.shrinkFactor ) && o.shrinkFactor >= 0 );
  _.assert( _.intIs( o.minSize ) && o.minSize >= 0 );

  o.growFactor = o.growFactor === 0 ? 1 : o.growFactor;
  o.shrinkFactor = o.shrinkFactor === 0 ? 1 : o.shrinkFactor;

  if( o.ins === undefined )
  o.ins = 0;

  if( o.dst === _.self )
  o.dst = o.src;

  let newBufferCreate = o.dst === null || o.dst === undefined;

  _.assert( newBufferCreate || _.bufferAnyIs( o.dst ) || _.longIs( o.dst ) );

  let resultElementLength = resultElementLengthCount();
  let resultSize = resultSizeCount();
  let resultLength = resultSize / resultElementLength;
  _.assert( _.intIs( resultLength ) );

  let resultBuffer = resultBufferMake();
  let result = resultBufferFill( resultBuffer, o.src );

  return result;

  /* */

  function resultElementLengthCount()
  {
    if( newBufferCreate )
    {
      if( o.src.BYTES_PER_ELEMENT )
      return o.src.BYTES_PER_ELEMENT;
      else if( o.src.byteLength )
      return 1;
      else
      return 8;
    }
    else
    {
      if( o.dst.BYTES_PER_ELEMENT )
      return o.dst.BYTES_PER_ELEMENT;
      else if( o.dst.byteLength )
      return 1;
      else
      return 8;
    }
  }

  /* */

  function resultSizeCount()
  {
    let result;
    if( o.bufferLengthCount )
    result = o.bufferLengthCount() * resultElementLength;
    else
    result = ( o.cinterval[ 1 ] - o.cinterval[ 0 ] + 1 ) * resultElementLength;

    if( o.growFactor > 1 && o.resizing && !newBufferCreate )
    {
      let dstSize = o.dst.length ? o.dst.length * resultElementLength : o.dst.byteLength;
      if( dstSize < result )
      {
        let growed = dstSize * o.growFactor;
        result = growed > result ? growed : result;
      }
    }

    result = o.minSize > result ? o.minSize : result;
    return result;
  }

  /* */

  function resultBufferMake()
  {
    let buffer;

    if( o.reusing && !newBufferCreate )
    {

      let dstOffset = 0;
      let dstSize = o.dst.length ? o.dst.length * resultElementLength : o.dst.byteLength;

      if( o.offsetting && !_.bufferNodeIs( o.dst ) && _.bufferAnyIs( o.dst ) )
      {
        dstOffset = o.dst.byteOffset ? o.dst.byteOffset : dstOffset;
        dstSize = o.dst.buffer ? o.dst.buffer.byteLength : dstSize;
      }

      let leftOffset = dstOffset + o.cinterval[ 0 ];
      let insideLeftBound = leftOffset >= 0 && leftOffset < dstSize;
      let rightBound = leftOffset + resultSize;
      let insideRightBound = rightBound < dstSize;

      let shouldShrink = false;
      if( o.shrinkFactor > 1 )
      shouldShrink = ( dstSize / resultSize ) >= o.shrinkFactor;

      if( insideLeftBound && insideRightBound && !shouldShrink )
      {
        buffer = o.dst;
        if( _.bufferNodeIs( buffer ) )
        buffer = BufferNode.from( buffer.buffer, leftOffset, resultSize );
        else if( buffer.buffer )
        buffer = new buffer.constructor( buffer.buffer, leftOffset, resultSize );
      }
      else
      {
        buffer = _.bufferMakeUndefined( o.dst, resultLength );
      }
    }
    else
    {
      if( newBufferCreate )
      buffer = _.bufferMakeUndefined( o.src, resultLength );
      else if( o.dst.byteLength && o.dst.byteLength > resultSize )
      buffer = o.dst;
      else if( o.dst.length && ( o.dst.length * resultElementLength ) > resultSize )
      buffer = o.dst;
      else
      buffer = _.bufferMakeUndefined( o.dst, resultLength );
    }

    return buffer;
  }

  /* */

  function resultBufferFill( dst, src )
  {
    let dstTyped = bufferTypedViewMake( dst );
    let srcTyped = bufferTypedViewMake( src );

    if( o.bufferFill )
    o.bufferFill( dstTyped, srcTyped, o.cinterval, o.ins );
    else
    bufferFill( dstTyped, srcTyped, o.cinterval, o.ins );
    return dst;
  }

  /* */

  function bufferTypedViewMake( src )
  {
    let srcTyped = src;
    if( _.bufferRawIs( src ) )
    srcTyped = new U8x( src );
    if( _.bufferViewIs( src ) )
    srcTyped = new U8x( src.buffer );

    return srcTyped;
  }

  /* */

  function bufferFill( dst, src, cinterval, ins )
  {
    let offset = Math.max( 0, -cinterval[ 0 ] );
    for( let i = 0 ; i < offset ; i++ )
    dstTyped[ i ] = o.ins;

    let rightBound = Math.min( resultLength, srcTyped.length );
    for( let i = offset ; i < rightBound ; i++ )
    dstTyped[ offset + i ] = src[ i ];

    for( let i = rightBound ; i < resultLength ; i++ )
    dstTyped[ rightBound + i ] = o.ins;

    return dstTyped;
  }
}

_bufferReusing.defaults =
{
  dst : null,
  src : null,
  cinterval : null,
  ins : null,
  offsetting : 1,
  reusing : 1,
  growFactor : 2,
  shrinkFactor : 0,
  minSize : 64,

  bufferLengthCount : null,
  bufferFill : null,
};

//

function bufferReusingBut( /* dst, src, cinterval, ins */ )
{
  let o = _._bufferReusing_head.apply( this, arguments );

  let bufferLength = 0;
  if( o.dst )
  bufferLength = o.dst && o.dst.length !== undefined ? o.dst.length : o.dst.byteLength;
  else
  bufferLength = o.src.length !== undefined ? o.src.length : o.src.byteLength;

  if( o.cinterval === undefined )
  o.cinterval = [ 0, -1 ];
  else if( _.numberIs( o.cinterval ) )
  o.cinterval = [ o.cinterval, o.cinterval ];

  if( o.cinterval[ 0 ] < 0 )
  o.cinterval[ 0 ] = 0;
  if( o.cinterval[ 1 ] < o.cinterval[ 0 ] - 1 )
  o.cinterval[ 1 ] = o.cinterval[ 0 ] - 1;

  if( o.ins === undefined )
  o.ins = [];

  _.routineOptions( bufferReusingBut, o );
  _.assert( _.longIs( o.ins ) || _.bufferAnyIs( o.ins ) );

  o.bufferLengthCount = bufferLengthCount;
  o.bufferFill = dstBufferFill;

  return _._bufferReusing( o );

  /* */

  function bufferLengthCount()
  {
    return bufferLength - ( o.cinterval[ 1 ] - o.cinterval[ 0 ] + 1 ) + o.ins.length;
  }

  /* */

  function dstBufferFill( dstTyped, srcTyped, cinterval, ins )
  {
    let left = Math.max( 0, cinterval[ 0 ] );
    for( let i = 0 ; i < left ; i++ )
    dstTyped[ i ] = srcTyped[ i ];

    let right = left + ins.length
    for( let i = left ; i < right ; i++ )
    dstTyped[ i ] = ins[ i - left ];

    let start = cinterval[ 1 ] + 1;
    for( let i = start ; i < srcTyped.length ; i++ )
    dstTyped[ right + i - start ] = srcTyped[ i ];

    return dstTyped;
  }
}

bufferReusingBut.defaults =
{
  dst : null,
  src : null,
  cinterval : null,
  ins : null,
  offsetting : 1,
  reusing : 1,
  growFactor : 2,
  shrinkFactor : 0,
  minSize : 64,
};

//

function bufferReusingOnly( /* dst, src, cinterval, ins */ )
{
  let o = _._bufferReusing_head.apply( this, arguments );
  _.assert( o.ins === undefined, 'Expects no argument {-ins-}' );

  let bufferLength = 0;
  if( o.dst )
  bufferLength = o.dst && o.dst.length !== undefined ? o.dst.length : o.dst.byteLength;
  else
  bufferLength = o.src.length !== undefined ? o.src.length : o.src.byteLength;

  if( o.cinterval === undefined )
  o.cinterval = [ 0, bufferLength - 1 ];
  else if( _.numberIs( o.cinterval ) )
  o.cinterval = [ 0, o.cinterval ];

  if( o.cinterval[ 0 ] < 0 )
  o.cinterval[ 0 ] = 0;
  if( o.cinterval[ 1 ] < o.cinterval[ 0 ] - 1 )
  o.cinterval[ 1 ] = o.cinterval[ 0 ] - 1;
  if( o.cinterval[ 1 ] > bufferLength - 1 )
  o.cinterval[ 1 ] = bufferLength - 1;

  _.routineOptions( bufferReusingOnly, o );

  o.growFactor = 1;
  o.bufferFill = dstBufferFill;

  return _._bufferReusing( o );

  /* */

  function dstBufferFill( dstTyped, srcTyped, cinterval, ins )
  {
    let left = Math.max( 0, cinterval[ 0 ] );
    let right = Math.min( cinterval[ 1 ], srcTyped.length - 1 );
    for( let i = left ; i < right + 1 ; i++ )
    dstTyped[ i - left ] = srcTyped[ i ];

  }
}

bufferReusingOnly.defaults =
{
  dst : null,
  src : null,
  cinterval : null,
  ins : null,
  offsetting : 1,
  reusing : 1,
  shrinkFactor : 0,
  minSize : 0,
};

//

function bufferReusingGrow( /* dst, src, cinterval, ins */ )
{
  let o = _._bufferReusing_head.apply( this, arguments );

  let bufferLength = 0;
  if( o.dst )
  bufferLength = o.dst && o.dst.length !== undefined ? o.dst.length : o.dst.byteLength;
  else
  bufferLength = o.src.length !== undefined ? o.src.length : o.src.byteLength;

  if( o.cinterval === undefined )
  o.cinterval = [ 0, bufferLength - 1 ];
  else if( _.numberIs( o.cinterval ) )
  o.cinterval = [ 0, o.cinterval - 1 ];

  let left = o.cinterval[ 0 ];
  let right = o.cinterval[ 1 ];

  if( o.cinterval[ 0 ] > 0 )
  o.cinterval[ 0 ] = 0;
  if( o.cinterval[ 0 ] < 0 )
  {
    o.cinterval[ 1 ] -= o.cinterval[ 0 ];
    o.cinterval[ 0 ] -= o.cinterval[ 0 ];
  }
  if( o.cinterval[ 1 ] < o.cinterval[ 0 ] - 1 )
  o.cinterval[ 1 ] = o.cinterval[ 0 ] - 1;
  if( o.cinterval[ 1 ] < bufferLength - 1 )
  o.cinterval[ 1 ] = bufferLength - 1;

  _.routineOptions( bufferReusingGrow, o );

  o.growFactor = 1;
  o.bufferFill = dstBufferFill;

  return _._bufferReusing( o );

  /* */

  function dstBufferFill( dstTyped, srcTyped, cinterval, ins )
  {
    let offset = Math.max( 0, -left );
    for( let i = 0 ; i < offset ; i++ )
    dstTyped[ i ] = o.ins;

    let rightBound = Math.min( dstTyped.length, srcTyped.length );
    for( let i = offset ; i < rightBound + offset ; i++ )
    dstTyped[ i ] = srcTyped[ i - offset ];

    let length = dstTyped.length;
    for( let i = offset + rightBound ; i < length ; i++ )
    dstTyped[ i ] = o.ins;

    return dstTyped;

  }
}

bufferReusingGrow.defaults =
{
  dst : null,
  src : null,
  cinterval : null,
  ins : null,
  offsetting : 1,
  reusing : 1,
  growFactor : 2,
  minSize : 64,
};

//

function bufferReusingRelength( /* dst, src, cinterval, ins */ )
{
  let o = _._bufferReusing_head.apply( this, arguments );

  let bufferLength = 0;
  if( o.dst )
  bufferLength = o.dst && o.dst.length !== undefined ? o.dst.length : o.dst.byteLength;
  else
  bufferLength = o.src.length !== undefined ? o.src.length : o.src.byteLength;

  if( o.cinterval === undefined )
  o.cinterval = [ 0, bufferLength - 1 ];
  else if( _.numberIs( o.cinterval ) )
  o.cinterval = [ 0, o.cinterval - 1 ];

  let left = o.cinterval[ 0 ];
  let right = o.cinterval[ 1 ];

  if( o.cinterval[ 0 ] < 0 )
  {
    o.cinterval[ 1 ] -= o.cinterval[ 0 ];
    o.cinterval[ 0 ] -= o.cinterval[ 0 ];
  }
  if( o.cinterval[ 1 ] < o.cinterval[ 0 ] - 1 )
  o.cinterval[ 1 ] = o.cinterval[ 0 ] - 1;

  _.routineOptions( bufferReusingRelength, o );

  o.growFactor = 1;
  o.bufferFill = dstBufferFill;

  return _._bufferReusing( o );

  /* */

  function dstBufferFill( dstTyped, srcTyped, cinterval, ins )
  {
    let offset = left < 0 ? Math.max( 0, -left ) : 0;
    left = left < 0 ? 0 : left;
    for( let i = 0 ; i < offset ; i++ )
    dstTyped[ i ] = o.ins;

    let rightBound = Math.min( srcTyped.length, right - left + 1 );
    let i;
    for( i = offset ; i < rightBound + offset && i - offset + left < srcTyped.length ; i++ )
    dstTyped[ i ] = srcTyped[ i - offset + left ];

    let length = dstTyped.length;
    for( ; i < length ; i++ )
    dstTyped[ i ] = o.ins;

    return dstTyped;

  }
}

bufferReusingRelength.defaults =
{
  dst : null,
  src : null,
  cinterval : null,
  ins : null,
  offsetting : 1,
  reusing : 1,
  growFactor : 2,
  minSize : 64,
};

//

/**
 * The routine bufferBytesGet() converts source buffer {-src-} and returns a new instance of buffer U8x ( array of 8-bit unsigned integers ).
 *
 * @param { BufferRaw|BufferNode|BufferTyped|BufferView|String } src - Instance of any buffer or string.
 *
 * @example
 * let src = new BufferRaw( 5 );
 * _.bufferBytesGet(src);
 * // returns [ 0, 0, 0, 0, 0, ]
 *
 * @example
 * let src = BufferNode.alloc( 5, 'a' );
 * _.bufferBytesGet(src);
 * // returns [ 97, 97, 97, 97, 97 ]
 *
 * @example
 * let src = new I32x( [ 5, 6, 7 ] );
 * _.bufferBytesGet(src);
 * // returns [ 5, 0, 6, 0, 7, 0 ]
 *
 * @example
 * let src = 'string';
 * _.bufferBytesGet(src);
 * // returns [ 115, 116, 114, 105, 110, 103 ]
 *
 * @returns { TypedArray } Returns a new instance of U8x constructor.
 * @function bufferBytesGet
 * @throws { Error } If arguments.length is less or more than 1.
 * @throws { Error } If {-src-} is not a instance of any buffer or string.
 * @memberof wTools
 */

function bufferBytesGet( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( src instanceof BufferRaw || src instanceof BufferRawShared )
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
  else if( _.bufferViewIs( src ) )
  {
    return new U8x( src.buffer, src.byteOffset, src.byteLength );
  }
  else if( _.strIs( src ) )
  {
    if( _global_.BufferNode )
    return new U8x( _.bufferRawFrom( BufferNode.from( src, 'utf8' ) ) );
    else
    return new U8x( _.encode.utf8ToBuffer( src ) ); /* Dmytro : maybe it should have some improvement, base module should not use higher level modules */
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
 * @namespace Tools
 */

function bufferRetype( src, bufferType )
{

  _.assert( arguments.length === 2, 'Expects source buffer {-src-} and constructor of buffer {-bufferTyped-}' );
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
    {
      resultBytes.set( src, offset );
    }
    else
    {
      for( let i = 0 ; i < src.length ; i++ )
      resultBytes[ offset+i ] = src[ i ];
    }
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

    if( dst.set && ( src instanceof U64x || src instanceof I64x ) )
    {
      for( let s = 0 ; s < src.length ; s++ )
      dst[ s ] = Number( src[ s ] );
    }
    else if( dst.set && ( dst instanceof U64x || dst instanceof I64x ) )
    {
      dst.set( _.bigIntsFrom( src ) );
    }
    else if( dst.set )
    {
      dst.set( src );
    }
    else
    {
      for( let s = 0 ; s < src.length ; s++ )
      dst[ s ] = src[ s ];
    }

  }
  else if( arguments.length === 1 )
  {

    let options = arguments[ 0 ];
    _.assertMapHasOnly( options, bufferMove.defaults );

    src = options.src;
    dst = options.dst;

    if( _.bufferRawIs( dst ) )
    {
      dst = new U8x( dst );
      if( _.bufferTypedIs( src ) && !( src instanceof U8x ) )
      src = new U8x( src.buffer, src.byteOffset, src.byteLength );
    }

    _.assert( _.longIs( dst ) );
    _.assert( _.longIs( src ) );

    options.dstOffset = options.dstOffset || 0;

    if( dst.set && ( src instanceof U64x || src instanceof I64x ) )
    {
      for( let s = 0, d = options.dstOffset ; s < src.length ; s++, d++ )
      dst[ d ] = Number( src[ s ] );
    }
    else if( dst.set && ( dst instanceof U64x || dst instanceof I64x ) )
    {
      dst.set( _.bigIntsFrom( src ), options.dstOffset );
    }
    else if( dst.set )
    {
      dst.set( src, options.dstOffset );
    }
    else
    {
      for( let s = 0, d = options.dstOffset ; s < src.length ; s++, d++ )
      dst[ d ] = src[ s ];
    }

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
      result += String.fromCharCode( src[ i ] );
    }
  }

  return result;
}

//

function bufferToDom( xmlBuffer )
{
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
    let i = 0;
    for( ; i < ins.length ; i++ )
    if( src[ index + i ] !== ins[ i ] )
    break;

    if( i === ins.length )
    return index;

    index += 1;
    index = src.indexOf( ins[ 0 ], index );

  }

  return index;
}

//

function bufferRight( src, ins )
{

  if( !_.bufferRawIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferRawIs( ins ) )
  ins = _.bufferBytesGet( ins );

  _.assert( src.indexOf );
  _.assert( ins.indexOf );

  let index = src.lastIndexOf( ins[ 0 ] );
  while( index !== -1 )
  {

    let i = 0;
    for( ; i < ins.length; i++ )
    if( src[ index + i ] !== ins[ i ] )
    break;

    if( i === ins.length )
    return index;

    index -= 1;
    index = src.lastIndexOf( ins[ 0 ], index );

  }

  return index;
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

function bufferIsolate_head( routine, args )
{
  let o;

  if( args.length > 1 )
  {
    o = { src : args[ 0 ], delimeter : args[ 1 ], times : args[ 2 ] };
  }
  else
  {
    o = args[ 0 ];
    _.assert( args.length === 1, 'Expects single argument' );
  }

  _.routineOptions( routine, o );
  _.assert( 1 <= args.length && args.length <= 3 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.bufferAnyIs( o.src ) || _.strIs( o.src ) );
  _.assert( _.bufferAnyIs( o.delimeter ) || _.strIs( o.delimeter ) );
  _.assert( _.numberIs( o.times ) );

  return o;
}

//

function bufferIsolate_body( o )
{
  _.assertRoutineOptions( bufferIsolate_body, arguments );

  let src = o.src;
  if( _.strIs( o.src ) )
  src = o.src = _.bufferBytesGet( o.src );
  if( !_.bufferTypedIs( o.src ) )
  src = _.bufferBytesGet( o.src );

  let delimeter = o.delimeter;
  if( _.strIs( o.delimeter ) || !_.bufferTypedIs( o.delimeter ) )
  delimeter = _.bufferBytesGet( o.delimeter );

  delimeter = _.bufferRetype( delimeter, src.constructor );

  _.assert( src.indexOf );
  _.assert( delimeter.indexOf );

  let result = [];
  let times = o.times;
  let index = o.left ? 0 : src.length;
  let more = o.left ? bufferLeft : bufferRight;

  /* */

  while( times > 0 )
  {
    index = more( index );

    if( index === -1 )
    break;

    times -= 1;

    if( times === 0 )
    {
      if( o.src.constructor !== src.constructor )
      {
        if( o.src.constructor === BufferRaw )
        {
          result.push( o.src.slice( 0, index ) );
          result.push( delimeter.buffer.slice( delimeter.byteOffset, delimeter.byteOffset + delimeter.byteLength ) );
          result.push( o.src.slice( index + delimeter.length, src.byteLength ) );
        }
        else
        {
          let del = delimeter;
          result.push( new o.src.constructor( o.src.buffer, o.src.byteOffset, index ) );
          result.push( new o.src.constructor( del.buffer, del.byteOffset, del.byteLength / ( o.src.BYTES_PER_ELEMENT || 1 ) ) );
          let secondOffset = src.byteOffset + index * ( o.src.BYTES_PER_ELEMENT || 1 ) + delimeter.length;
          result.push( new o.src.constructor( o.src.buffer, secondOffset, o.src.byteOffset + src.byteLength - secondOffset ) );
        }
      }
      else
      {
        let del = delimeter;
        result.push( o.src.subarray( 0, index ) );
        result.push( new o.src.constructor( del.buffer, del.byteOffset, del.byteLength / ( o.src.BYTES_PER_ELEMENT || 1 ) ) );
        result.push( o.src.subarray( index + delimeter.length ) );
      }
      return result;
    }

    /* */

    if( o.left )
    {
      index = index + 1;
      if( index >= src.length )
      break;
    }
    else
    {
      index = index - 1;
      if( index <= 0 )
      break;
    }

  }

  /* */

  if( !result.length )
  {
    if( o.times === 0 )
    return everything( !o.left );
    else if( times === o.times )
    return everything( o.left ^ o.none );
    else
    return everything( o.left );
  }

  return result;

  /* */

  function everything( side )
  {
    let empty = new U8x( 0 ).buffer;
    return ( side ) ? [ o.src, undefined, new o.src.constructor( empty ) ] : [ new o.src.constructor( empty ), undefined, o.src ];
  }

  /* */

  function bufferLeft( index )
  {
    index = src.indexOf( delimeter[ 0 ], index );
    while( index !== -1 )
    {
      let i = 0;
      for( ; i < delimeter.length; i++ )
      if( src[ index + i ] !== delimeter[ i ] )
      break;

      if( i === delimeter.length )
      return index;

      index += 1;
      index = src.indexOf( delimeter[ 0 ], index );
    }
    return index;
  }

  /* */

  function bufferRight( index )
  {
    index = src.lastIndexOf( delimeter[ 0 ], index );
    while( index !== -1 )
    {
      let i = 0;
      for( ; i < delimeter.length; i++ )
      if( src[ index + i ] !== delimeter[ i ] )
      break;

      if( i === delimeter.length )
      return index;

      index -= 1;
      index = src.lastIndexOf( delimeter[ 0 ], index );
    }
    return index;
  }
}

bufferIsolate_body.defaults =
{
  src : null,
  delimeter : ' ',
  left : 1,
  times : 1,
  none : 1,
};

//

let bufferIsolate = _.routineUnite( bufferIsolate_head, bufferIsolate_body );

//

function bufferIsolateLeftOrNone_body( o )
{
  o.left = 1;
  o.none = 1;
  let result = _.bufferIsolate.body( o );
  return result;
}

bufferIsolateLeftOrNone_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
};

let bufferIsolateLeftOrNone = _.routineUnite( bufferIsolate_head, bufferIsolateLeftOrNone_body );

//

function bufferIsolateLeftOrAll_body( o )
{
  o.left = 1;
  o.none = 0;
  let result = _.bufferIsolate.body( o );
  return result;
}

bufferIsolateLeftOrAll_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
};

let bufferIsolateLeftOrAll = _.routineUnite( bufferIsolate_head, bufferIsolateLeftOrAll_body );

//

function bufferIsolateRightOrNone_body( o )
{
  o.left = 0;
  o.none = 1;
  let result = _.bufferIsolate.body( o );
  return result;
}

bufferIsolateRightOrNone_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
};

let bufferIsolateRightOrNone = _.routineUnite( bufferIsolate_head, bufferIsolateRightOrNone_body );

//

function bufferIsolateRightOrAll_body( o )
{
  o.left = 0;
  o.none = 0;
  let result = _.bufferIsolate.body( o );
  return result;
}

bufferIsolateRightOrAll_body.defaults =
{
  src : null,
  delimeter : ' ',
  times : 1,
};

let bufferIsolateRightOrAll = _.routineUnite( bufferIsolate_head, bufferIsolateRightOrAll_body );

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
//     descriptor.sizeOfScalar = buffer ? buffer.BYTES_PER_ELEMENT : 0;
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
//     return b.sizeOfScalar - a.sizeOfScalar;
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
//       'sizeOfScalar' : buffer ? buffer.BYTES_PER_ELEMENT : 0,
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
//     let sizeOfScalar = attribute[ 'sizeOfScalar' ];
//     let fields = attribute[ 'fields' ];
//
//     _.assert( _.routineIs( bufferConstructor ) || bufferConstructor === null, 'unknown attribute\' constructor :', attribute[ 'bufferConstructorName' ] )
//     _.assert( _.numberIs( offset ), 'unknown attribute\' offset in common buffer :', offset )
//     _.assert( _.numberIs( size ), 'unknown attribute\' size of buffer :', size )
//     _.assert( _.numberIs( sizeOfScalar ), 'unknown attribute\' sizeOfScalar of buffer :', sizeOfScalar )
//
//     if( attribute.offset+size > commonBuffer.byteLength )
//     throw _.err( 'cant deserialize attribute', '"'+a+'"', 'it is out of common buffer' );
//
//     /* logger.log( 'bufferConstructor( ' + commonBuffer + ', ' + offset + ', ' + size / sizeOfScalar + ' )' ); */
//
//     let buffer = bufferConstructor ? new bufferConstructor( commonBuffer, offset, size / sizeOfScalar ) : null;
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

  buffersTypedAreEquivalent, /* qqq : cover pelase */
  buffersTypedAreIdentical, /* qqq : cover pelase */
  buffersRawAreIdentical,
  buffersViewAreIdentical,
  buffersNodeAreIdentical,
  buffersAreEquivalent,
  buffersAreIdentical,

  _bufferMake_functor,
  bufferMake,
  bufferMakeUndefined,

  bufferFromArrayOfArray,
  bufferFrom, /* qqq : cover. seems broken */
  bufferRawFromTyped,
  bufferRawFrom,
  bufferBytesFrom,
  bufferBytesFromNode,
  bufferNodeFrom,

  // bufferBut,
  // bufferButInplace, /* !!! : use instead of bufferBut, bufferButInplace */ /* Dmytro : coverage of the alternative split into parts and extended */
  bufferBut_,
  // bufferOnly,
  // bufferOnlyInplace, /* !!! : use instead of bufferOnly, bufferOnlyInplace */ /* Dmytro : coverage of the alternative split into parts and extended */
  bufferOnly_,
  // bufferGrow,
  // bufferGrowInplace, /* !!! : use instead of bufferGrow, bufferGrowInplace */ /* Dmytro : coverage of the alternative split into parts and extended */
  bufferGrow_,

  // bufferRelength, /* qqq for Dmytro : don't understand. explain how what it does. ask */
  // bufferRelengthInplace, /* !!! : use instead of bufferRelength, bufferRelengthInplace */ /* Dmytro : coverage of the alternative split into parts and extended */
  bufferRelength_,

  bufferRelen,
  // bufferResize,
  // bufferResizeInplace, /* !!! : use instead of bufferResize, bufferResizeInplace */
  bufferResize_,

  //

  _bufferReusing_head,
  _bufferReusing,
  bufferReusingBut, /* qqq for Dmytro : implement */
  bufferReusingOnly, /* qqq for Dmytro : implement */
  bufferReusingGrow, /* qqq for Dmytro : implement */
  bufferReusingRelength, /* qqq for Dmytro : implement */
  // bufferReusingResize, /* qqq for Dmytro : implement */

  bufferBytesGet,
  bufferRetype,

  bufferJoin, /* qqq for Dmytro : look, analyze and cover _.longJoin */

  bufferMove,
  bufferToStr,
  bufferToDom, /* qqq for Dmytro : move out to DomTools */

  bufferLeft,
  bufferRight,
  bufferSplit,
  bufferCutOffLeft,

  bufferIsolate,
  bufferIsolateLeftOrNone,
  bufferIsolateLeftOrAll,
  bufferIsolateRightOrNone,
  bufferIsolateRightOrAll,

  // buffersSerialize, /* deprecated */
  // buffersDeserialize, /* deprecated */

  /*

  bufferAnyIs,
  bufferBytesIs,
  constructorIsBuffer,

  bufferBytesGet,
  bufferRetype,

  bufferMove,
  bufferToStr,
  bufferToDom,

  bufferSplit,
  bufferCutOffLeft,

  bufferIsolate : _.routineUnite( bufferIsolate_head, bufferIsolate_body ), // Dmytro : implemented, covered
  bufferIsolateLeftOrNone, // Dmytro : implemented, covered
  bufferIsolateLeftOrAll, // Dmytro : implemented
  bufferIsolateRightOrNone, // Dmytro : implemented
  bufferIsolateRightOrAll, // Dmytro : implemented

  */

  // to replace

  /*
  | routine           | makes new dst container                        | saves dst container                                        |
  | ----------------- | ---------------------------------------------- | ---------------------------------------------------------- |
  | bufferBut_        | _.bufferBut_( src, range )                     | _.bufferBut_( src )                                        |
  |                   | if src is not resizable and  change length     | _.bufferBut_( dst, dst )                                   |
  |                   | _.bufferBut_( null, src, range )               | _.bufferBut_( dst, dst, range ) if dst is resizable        |
  |                   | _.bufferBut_( dst, src, range )                | or dst not change length                                   |
  |                   | if dst not resizable and change length         | _.bufferBut_( dst, src, range ) if dst is resizable        |
  |                   |                                                | or dst not change length                                   |
  | ----------------- | ---------------------------------------------- | ---------------------------------------------------------- |
  | bufferOnly__    | _.bufferOnly__( src, range )                 | _.bufferOnly__( src )                                    |
  |                   | if src is not resizable and  change length     | _.bufferOnly__( dst, dst )                               |
  |                   | _.bufferOnly__( null, src, range )           | _.bufferOnly__( dst, dst, range ) if dst is resizable    |
  |                   | _.bufferOnly__( dst, src, range )            | or dst not change length                                   |
  |                   | if dst not resizable and change length         | _.bufferOnly__( dst, src, range ) if dst is resizable    |
  |                   |                                                | or dst not change length                                   |
  | ----------------- | ---------------------------------------------- | ---------------------------------------------------------- |
  | bufferGrow_       | _.bufferGrow_( src, range )                    | _.bufferGrow_( src )                                       |
  |                   | if src is not resizable and  change length     | _.bufferGrow_( dst, dst )                                  |
  |                   | _.bufferGrow_( null, src, range )              | _.bufferGrow_( dst, dst, range ) if dst is resizable       |
  |                   | _.bufferGrow_( dst, src, range )               | or dst not change length                                   |
  |                   | if dst not resizable and change length         | _.bufferGrow_( dst, src, range ) if dst is resizable       |
  |                   |                                                | or dst not change length                                   |
  | ----------------- | ---------------------------------------------- | ---------------------------------------------------------- |
  | bufferRelength_   | _.bufferRelength_( src, range )                | _.bufferRelength_( src )                                   |
  |                   | if src is not resizable and  change length     | _.bufferRelength_( dst, dst )                              |
  |                   | _.bufferRelength_( null, src, range )          | _.bufferRelength_( dst, dst, range ) if dst is resizable   |
  |                   | _.bufferRelength_( dst, src, range )           | or dst not change length                                   |
  |                   | if dst not resizable and change length         | _.bufferRelength_( dst, src, range ) if dst is resizable   |
  |                   |                                                | or dst not change length                                   |
  | ----------------- | ---------------------------------------------- | ---------------------------------------------------------- |
  | bufferResize_     | _.bufferResize_( null, src, size )             | _.bufferResize_( src, size )                               |
  | bufferResize_     | every time                                     | if src is not BufferRaw or buffer not changes length       |
  |                   | _.bufferResize_( src, size )                   | _.bufferResize_( dst, dst, size ) if buffer not changes    |
  |                   | if src is BufferRaw or buffer changes length   | _.bufferResize_( dst, src, size )                          |
  |                   | _.bufferResize_( dst, src, range )             | if dst.byteLength >= size                                  |
  |                   | if dst.byteLength < size                       |                                                            |
  | ----------------- | ---------------------------------------------- | ---------------------------------------------------------- |
  */

}

//

Object.assign( Self, Routines );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
