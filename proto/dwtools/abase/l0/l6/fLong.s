( function _fLong_s_() {

'use strict';

let _ArrayIncludes = Array.prototype.includes;
if( !_ArrayIncludes )
_ArrayIncludes = function( e ){ _ArrayIndexOf.call( this, e ) }
let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

/*
               |  can grow   |  can shrink  |   range
grow                +                -         positive
select              -                +         positive
relength            +                +         positive
but                 -                +         negative
*/

/* array / long / buffer */
/* - / inplace */

// --
// arguments array
// --

// function argumentsArrayIs( src )
// {
//   return Object.prototype.toString.call( src ) === '[object Arguments]';
// }

//

function argumentsArrayMake( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.numberIs( src ) || _.longIs( src ) );
  if( _.numberIs( src ) )
  return _argumentsArrayMake.apply( _, Array( src ) );
  else
  return _argumentsArrayMake.apply( _, src );
}

//

function _argumentsArrayMake()
{
  return arguments;
}

//

function argumentsArrayFrom( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.argumentsArrayIs( src ) )
  return src;
  return _.argumentsArrayMake( src );
}

// --
// long
// --

/**
 * The routine longMake() returns a new Long with the same type as source Long (src). New Long makes from inserted Long (ins)
 * or if (ins) is number, the Long makes from (src) with length equal to (ins). If (ins) is not provided, routine returns copy of (src).
 *
 * @param { Long } src - Instance of Long or constructor, defines type of returned Long. If null is provided, routine returns empty array.
 * @param { Number|Long } ins - Defines length of new Long. If Long is provided, routine makes new Long from {-ins-} with {-src-} type.
 *
 * @example
 * _.longMake( null );
 * // returns []
 *
 * @example
 * _.longMake( [ 1, 2, 3, 4 ] );
 * // returns [ 1, 2, 3, 4 ];
 *
 * @example
 * let src = _.unrollMake( [] );
 * let got = _.longMake( src, [ 1, 2, 3 ] );
 * console.log( got );
 * // log [ 1, 2, 3 ];
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.longMake( src, 2 );
 * console.log( got );
 * // log Float32Array[ 1, 2 ];
 * console.log( _.bufferTypedIs( got ) );
 * // log true
 *
 * @returns { Long }  Returns a Long with type of source Long which makes from ins.
 * @function longMake
 * @throws { Error } If arguments.length is less than two or more then two.
 * @throws { Error } If {-ins-} is not a number and not a Long.
 * @throws { Error } If {-src-} is not a Long or not a constructor.
 * @throws { Error } If {-ins-} or ins.length has a not finite value.
 * @memberof wTools
 */

/*
qqq : extend coverage and documentation of longMake
Dmytro : extended coverage and documentation of routine longMake
qqq : longMake does not create unrolls, but should
Dmytro : longMake creates unrolls. It is implemented two variants, one of them should be deleted.
*/

function longMake( src, ins )
{
  // let result, length;
  let result;
  let length = ins;

  if( src === null )
  src = [];

  if( _.longIs( length ) )
  length = length.length;

  if( length === undefined )
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0 );
  }

  if( !_.longIs( ins ) )
  {
    if( _.longIs( src ) )
    ins = src;
    else
    ins = [];
  }

  if( !length )
  length = 0;

  if( _.argumentsArrayIs( src ) )
  src = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( src ) || _.longIs( src ), () => 'Expects long, but got ' + _.strType( src ) );

  if( _.routineIs( src ) )
  {
    if( ins.length === length )
    {
      debugger;
      if( src === Array )
      {
        if( _.longIs( ins ) )
        {
          /* Dmytro : simple and effective solution is
          result = Array.from( ins );
          Anyway, new container makes from ins
          */
          if( ins.length === 1 )
          result = [ ins[ 0 ] ];
          else
          result = new( _.constructorJoin( src, ins ) );
        }
        else
        {
          result = new src( ins );
        }
      }
      else
      {
        result = new src( ins );
      }
    }
    else
    {
      result = new src( length );
      let minLen = Math.min( length, ins.length );
      for( let i = 0 ; i < minLen ; i++ )
      result[ i ] = ins[ i ];
    }
  }
  // else if( _.unrollIs( src ) )  // Dmytro : alternative section for unrolls, but it is copy of section for arrayIs( src )
  // {
  //   if( length === ins.length )
  //   {
  //     result = _.unrollMake( ins );
  //   }
  //   else
  //   {
  //     result = _.unrollMake( length );
  //     let minLen = Math.min( length, ins.length );
  //     for( let i = 0 ; i < minLen ; i++ )
  //     result[ i ] = ins[ i ];
  //   }
  // }
  else if( _.arrayIs( src ) )
  {
    if( length === ins.length )
    {
      result = _.unrollIs( src ) ? _.unrollMake( ins ) : new( _.constructorJoin( src.constructor, ins ) );
      // result = new( _.constructorJoin( src.constructor, ins ) );
    }
    else
    {
      _.assert( length >= 0 );
      result = _.unrollIs( src ) ? _.unrollMake( length ) : new src.constructor( length );
      // result = new src.constructor( length );
      let minLen = Math.min( length, ins.length );
      for( let i = 0 ; i < minLen ; i++ )
      result[ i ] = ins[ i ];
    }
  }
  else
  {
    if( length === ins.length )
    {
      result = new src.constructor( ins );
    }
    else
    {
      result = new src.constructor( length );
      let minLen = Math.min( length, ins.length );
      for( let i = 0 ; i < minLen ; i++ )
      result[ i ] = ins[ i ];
    }
  }

  _.assert( _.longIs( result ) );

  return result;
}

//

/* qqq : optimize */

function longMakeEmpty( src )
{
  let result;
  let length = 0;

  if( src === null )
  src = [];

  if( _.argumentsArrayIs( src ) )
  src = [];

  _.assert( arguments.length === 1 );

  result = new src.constructor();

  _.assert( _.longIs( result ) );
  _.assert( result.length === 0 );

  return result;
}

//

function _longMakeOfLength( src, len )
{
  // let result, length;
  let result;

  if( src === null )
  src = [];

  if( _.longIs( len ) )
  len = len.length;

  if( len === undefined )
  {
    if( _.longIs( src ) )
    len = src.length;
    else if( _.numberIs( src ) )
    len = src;
    else _.assert( 0 );
  }

  if( !len )
  len = 0;

  if( _.argumentsArrayIs( src ) )
  src = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( len ) );
  _.assert( _.routineIs( src ) || _.longIs( src ), () => 'Expects long, but got ' + _.strType( src ) );

  if( _.routineIs( src ) )
  {
    result = new src( len );
  }
  else if( _.arrayIs( src ) )
  {
    if( len === src.length )
    {
      result = new( _.constructorJoin( src.constructor, src ) );
    }
    else if( len < src.length )
    {
      result = src.slice( 0, len );
    }
    else
    {
      result = new src.constructor( len );
      let minLen = Math.min( len, src.length );
      for( let i = 0 ; i < minLen ; i++ )
      result[ i ] = src[ i ];
    }
  }
  else
  {
    if( len === src.length )
    {
      result = new src.constructor( len );
    }
    else
    {
      result = new src.constructor( len );
      let minLen = Math.min( len, src.length );
      for( let i = 0 ; i < minLen ; i++ )
      result[ i ] = src[ i ];
    }
  }

  return result;
}

//

/**
 * The routine longMakeUndefined() returns a new Long with the same type as source Long {-src-}. New Long has length equal to {-len-}
 * or it has length of source Long {-src-} if second argument is not provided.
 *
 * @param { Long } ins - Long or constructor, defines type of returned Long. If null is provided, routine returns empty array.
 * @param { Number|Long } len - Defines length of new Long. If Long is provided, routine makes new Long with length equal to ins.length.
 *
 * @example
 * _.longMakeUndefined( null );
 * // returns []
 *
 * @example
 * _.longMakeUndefined( [ 1, 2, 3, 4 ] );
 * // returns [ undefined, undefined, undefined, undefined ];
 *
 * @example
 * let src = _.unrollMake( [] )
 * let got = _.longMakeUndefined( src, [ 1, 2, 3 ] );
 * console.log( got );
 * // log [ undefined, undefined, undefined ];
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let src = new F32x( [ 1, 2, 3, 4, 5] )
 * let got = _.longMakeUndefined( src, 2 );
 * console.log( got );
 * // log Float32Array[ undefined, undefined ];
 * console.log( _.bufferTypedIs( got ) );
 * // log true
 *
 * @returns { Long }  Returns a Long with type of source Long with a certain length.
 * @function longMakeUndefined
 * @throws { Error } If arguments.length is less than one or more then two.
 * @throws { Error } If the {-ins-} is not a Long or not a constructor.
 * @throws { Error } If the {-len-} is not a number or not a Long.
 * @throws { Error } If the {-len-} or ins.length has a not finite value.
 * @throws { Error } If the {-len-} is undefined and ins.length is not a number.
 * @memberof wTools
 */

/*
qqq : extend coverage and documentation of longMakeUndefined
Dmytro : routine is covered and documented
qqq : longMakeUndefined does not create unrolls, but should
Dmytro : longMakeUndefined creates unrolls.
*/

function longMakeUndefined( ins, len )
{
  let result, length;

  if( ins === null )
  ins = [];

  if( len === undefined )
  {
    length = ins.length;
  }
  else
  {
    if( _.longIs( len ) )
    length = len.length;
    else if( _.numberIs( len ) )
    length = len;
    else _.assert( 0 );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  // /* Dmytro : it is unnacessary code, see three lines above */
  // _.assert( !_.argumentsArrayIs( ins ), 'not tested' );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ), () => 'Expects long, but got ' + _.strType( ins ) );

  if( _.routineIs( ins ) )
  result = new ins( length );
  else if( _.unrollIs( ins ) )
  result = _.unrollMake( length );
  else
  result = new ins.constructor( length );

  return result;
}

//

/*
qqq : forbid non-long buffers as ins or src
Dmytro : asserts is improved
*/

function longMakeZeroed( ins, src )
{
  let result, length;

  if( _.routineIs( ins ) )
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( src === undefined )
  {
    length = ins.length;
  }
  else
  {
    if( _.longIs( src ) )
    length = src.length;
    else if( _.numberIs( src ) )
    length = src;
    else _.assert( 0, 'Expects long or number as the second argument, got', _.strType( src ) );
  }

  if( _.argumentsArrayIs( ins ) )
  ins = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( length ) );
  _.assert( _.routineIs( ins ) || _.longIs( ins ), () => 'Expects long, but got ' + _.strType( ins ) );
  // _.assert( _.routineIs( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.strType( ins ) );

  if( _.routineIs( ins ) )
  result = new ins( length );
  else if( _.unrollIs( ins ) )
  result = _.unrollMake( length );
  else
  result = new ins.constructor( length );

  if( !_.bufferTypedIs( result ) )
  // if( !_.bufferTypedIs( result ) && !_.bufferRawIs( result )  )
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = 0;

  return result;
}

//

/*
qqq : find and let me know what is _.buffer* analog of _longClone
*/

function _longClone( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) || _.bufferAnyIs( src ) );
  _.assert( !_.bufferNodeIs( src ), 'not tested' );

  if( _.bufferViewIs( src ) )
  debugger;

  if( _.bufferRawIs( src ) )
  return new U8x( new U8x( src ) ).buffer;
  else if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
  return new src.constructor( src );
  else if( _.arrayIs( src ) )
  return src.slice();
  else if( _.bufferViewIs( src ) )
  return new src.constructor( src.buffer, src.byteOffset, src.byteLength );

  _.assert( 0, 'unknown kind of buffer', _.strType( src ) );
}

//

/* xxx : review */
/* qqq : find and let me know what is _.buffer* analog of _.longShallowClone */

function longShallowClone()
{
  let result;
  let length = 0;

  if( arguments.length === 1 )
  {
    return _._longClone( arguments[ 0 ] );
  }

  /* eval length */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'argument is not defined' );

    if( _.longIs( argument ) ) length += argument.length;
    else if( _.bufferRawIs( argument ) ) length += argument.byteLength;
    else length += 1;
  }

  /* make result */

  if( _.arrayIs( arguments[ 0 ] ) || _.bufferTypedIs( arguments[ 0 ] ) )
  result = _.longMakeUndefined( arguments[ 0 ], length );
  else if( _.bufferRawIs( arguments[ 0 ] ) )
  result = new BufferRaw( length );

  let bufferDst;
  let offset = 0;
  if( _.bufferRawIs( arguments[ 0 ] ) )
  {
    bufferDst = new U8x( result );
  }

  /* copy */

  for( let a = 0, c = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];
    if( _.bufferRawIs( argument ) )
    {
      bufferDst.set( new U8x( argument ), offset );
      offset += argument.byteLength;
    }
    else if( _.bufferTypedIs( arguments[ 0 ] ) )
    {
      result.set( argument, offset );
      offset += argument.length;
    }
    else if( _.longIs( argument ) )
    for( let i = 0 ; i < argument.length ; i++ )
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

  return result;
}

//

/**
 * The longRepresent() routine returns a shallow copy of a portion of an array
 * or a new TypedArray that contains
 * the elements from (begin) index to the (end) index,
 * but not including (end).
 *
 * @param { Array } src - Source array.
 * @param { Number } begin - Index at which to begin extraction.
 * @param { Number } end - Index at which to end extraction.
 *
 * @example
 * _.longRepresent( [ 1, 2, 3, 4, 5 ], 2, 4 );
 * // returns [ 3, 4 ]
 *
 * @example
 * _.longRepresent( [ 1, 2, 3, 4, 5 ], -4, -2 );
 * // returns [ 2, 3 ]
 *
 * @example
 * _.longRepresent( [ 1, 2, 3, 4, 5 ] );
 * // returns [ 1, 2, 3, 4, 5 ]
 *
 * @returns { Array } - Returns a shallow copy of a portion of an array into a new Array.
 * @function longRepresent
 * @throws { Error } If the passed arguments is more than three.
 * @throws { Error } If the first argument is not an array.
 * @memberof wTools
 */

function longRepresent( src, begin, end )
{

  _.assert( arguments.length <= 3 );
  _.assert( _.longIs( src ), 'Unknown type of (-src-) argument' );
  _.assert( _.routineIs( src.slice ) || _.routineIs( src.subarray ) );

  if( _.routineIs( src.subarray ) )
  return src.subarray( begin, end );

  return src.slice( begin, end );
}

//

/**
 * Returns a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 *
 * If ( l ) is omitted or ( l ) > ( array.length ), longSlice extracts through the end of the sequence ( array.length ).
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( f ) < 0, zero is assigned to begin index( f ).

 * @param { Array/BufferNode } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 *
 * @example
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * // end index is bigger then length of array
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array.
 * @function longSlice
 * @throws { Error } Will throw an Error if ( array ) is not an Array or BufferNode.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
 */

function longSlice( array, f, l ) /* qqq : optimize */
{
  let result;

  if( _.argumentsArrayIs( array ) )
  if( f === undefined && l === undefined )
  {
    if( array.length === 2 )
    return [ array[ 0 ], array[ 1 ] ];
    else if( array.length === 1 )
    return [ array[ 0 ] ];
    else if( array.length === 0 )
    return [];
  }

  _.assert( _.longIs( array ) );
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  {
    _.assert( f === undefined || _.numberIs( f ) );
    _.assert( l === undefined || _.numberIs( l ) );
    result = array.slice( f, l );
    return result;
  }

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : array.length;

  _.assert( _.numberIs( f ) );
  _.assert( _.numberIs( l ) );

  if( f < 0 )
  f = array.length + f;
  if( l < 0 )
  l = array.length + l;

  if( f < 0 )
  f = 0;
  if( l > array.length )
  l = array.length;
  if( l < f )
  l = f;

  result = _.longMakeUndefined( array, l-f );
  // if( _.bufferTypedIs( array ) )
  // result = new array.constructor( l-f );
  // else
  // result = new Array( l-f );

  for( let r = f ; r < l ; r++ )
  result[ r-f ] = array[ r ];

  return result;
}

//

function longEmpty( dstLong )
{
  if( _.arrayIs( dstLong ) )
  {
    dstLong.slice( 0, dstLong.length );
    return dstLong;
  }
  _.assert( 0, `Cant change length of fixed-length container ${_.strType( dstLong )}` );
}

//

/**
 * The routine longBut() returns a shallow copy of provided Long {-array-}. Routine removes existing
 * elements in bounds defined by {-range-} and insert new elements from {-val-}. The original
 * source Long {-array-} will not be modified.
 *
 * @param { Long } array - The Long from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for removing elements.
 * If {-range-} is number, then it defines the start index, and the end index is start index incremented by one.
 * If {-range-} is undefined, routine returns copy of {-array-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > array.length, end index sets to array.length.
 * If range[ 1 ] <= range[ 0 ], then routine removes not elements, the insertion of elements begins at start index.
 * @param { Long } val - The Long with elements for insertion. Inserting begins at start index.
 * If quantity of removed elements is not equal to val.length, then returned Long will have length different to array.length.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longBut( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longBut( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 'str', 4, 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longBut( src, [ 1, 4 ], [ 5, 6, 7 ] );
 * console.log( got );
 * // log Float32Array[ 1, 5, 6, 7, 5 ]
 * console.log( _.bufferTypedIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longBut( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longBut( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 'str', 5 ]
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a copy of source Long with removed or replaced existing elements and / or added new elements. The copy has same type as source Long.
 * @function longBut
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @throws { Error } If argument {-val-} is not Long / undefined.
 * @memberof wTools
 */

/*
qqq : routine longBut requires good test coverage and documentation
Dmytro : extended routine coverage by using given clarifications, documented
 */

function longBut( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longMake( array );

  if( _.arrayIs( array ) )
  return _.arrayBut( array, range, val );

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( _.longIs( array ) );
  _.assert( val === undefined || _.longIs( val ) );
  _.assert( _.rangeIs( range ) );
  // _.assert( _.longIs( range ), 'not tested' );
  // _.assert( !_.longIs( range ), 'not tested' );

  // if( _.numberIs( range ) )
  // range = [ range, range + 1 ];

  _.rangeClamp( range, [ 0, array.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  let d = range[ 1 ] - range[ 0 ];
  let len = ( val ? val.length : 0 );
  let d2 = d - len;
  let l2 = array.length - d2;

  let result = _.longMakeUndefined( array, l2 );

  // debugger;
  // _.assert( 0, 'not tested' )

  for( let i = 0 ; i < range[ 0 ] ; i++ )
  result[ i ] = array[ i ];

  for( let i = range[ 1 ] ; i < array.length ; i++ )
  result[ i-d2 ] = array[ i ];

  if( val )
  for( let i = 0 ; i < val.length ; i++ )
  result[ range[ 0 ]+i ] = val[ i ];

  return result;
}

//

/**
 * The routine longButInplace() returns a Long {-array-} with removed existing elements in bounds
 * defined by {-range-} and inserted new elements from {-val-}.
 * If provided Long is resizable, routine modifies this Long in place, otherwise, return copy.
 *
 * @param { Long } array - The Long to remove, replace or add elements.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for removing elements.
 * If {-range-} is number, then it defines the start index, and the end index defines as start index incremented by one.
 * If {-range-} is undefined, routine returns {-src-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > array.length, end index sets to array.length.
 * If range[ 1 ] <= range[ 0 ], then routine removes no elements, the insertion of elements begins at start index.
 * @param { Long } ins - The Long with elements for insertion. Inserting begins at start index.
 * If quantity of removed elements is not equal to val.length, then returned array will have length different to original array.length.
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longButInplace( src );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4, 5 ]
 * console.log( _.bufferTypedIs( got ) );
 * // log true
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = new I32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longButInplace( src, 2, [ 6, 7 ] );
 * console.log( got );
 * // log Int8Array[ 1, 2, 6, 7, 4, 5 ]
 * console.log( _.bufferTypedIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longButInplace( src, [ 1, 4 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 'str', 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longButInplace( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 'str' ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longButInplace( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 'str', 5 ]
 * console.log( got === src );
 * // log true
 *
 * @returns { Long } Returns Long with removed or replaced existing elements and / or added new elements.
 * If long is resizable, routine returns modified source long, otherwise, returns a copy.
 * @function longButInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @throws { Error } If argument {-val-} is not long / undefined.
 * @memberof wTools
 */

/*
qqq : routine longButInplace requires good test coverage and documentation
Dmytro : implemented and covered routine longButInplace, documented
 */

function longButInplace( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  // if( _.arrayIs( array ) )
  if( _.arrayLikeResizable( array ) )
  return _.arrayButInplace( array, range, val );

  if( range === undefined )
  return array;
  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) );

  _.rangeClamp( range, [ 0, array.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] === range[ 1 ] && val === undefined )
  return array;
  else
  return _.longBut( array, range, val ); // Dmytro : not resizable longs should be processed by longBut algorithm. If it need, I'll make copy of code.

  // let result;
  //
  // _.assert( _.longIs( src ) );
  // _.assert( ins === undefined || _.longIs( ins ) );
  // _.assert( _.longIs( range ), 'not tested' );
  // _.assert( !_.longIs( range ), 'not tested' );
  //
  // _.assert( 0, 'not implemented' )

  //
  // if( _.numberIs( range ) )
  // range = [ range, range + 1 ];
  //
  // _.rangeClamp( range, [ 0, src.length ] );
  // if( range[ 1 ] < range[ 0 ] )
  // range[ 1 ] = range[ 0 ];
  //
  // let d = range[ 1 ] - range[ 0 ];
  // let range[ 1 ] = src.length - d + ( ins ? ins.length : 0 );
  //
  // result = _.longMakeUndefined( src, range[ 1 ] );
  //
  // debugger;
  // _.assert( 0, 'not tested' )
  //
  // for( let i = 0 ; i < range[ 0 ] ; i++ )
  // result[ i ] = src[ i ];
  //
  // for( let i = range[ 1 ] ; i < range[ 1 ] ; i++ )
  // result[ i-d ] = src[ i ];
  //
  // return result;
}

//

/**
 * The routine longSelect() returns a copy of a portion of provided Long {-array-} into a new Long
 * selected by {-range-}. The original {-array-} will not be modified.
 *
 * @param { Long } array - The Long from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to array.length.
 * If {-range-} is undefined, routine returns copy of {-array-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > array.length, end index sets to array.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty Long.
 * @param { * } val - The object of any type for insertion.
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelect( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelect( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longSelect( src, [ 1, 4 ], [ 'str' ] );
 * console.log( got );
 * // log [ 2, 3, 4 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelect( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longSelect( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a copy of source Long containing the extracted elements. The copy has same type as source Long.
 * @function longSelect
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

/*
  qqq : extend documentation and test coverage of longSelect
  Dmytro : documented, covered.
  Now, routine temporary uses routine longMake to make copy of provided long. Routine longShallowClone throws errors in argumentsArray cases.
*/

function longSelect( array, range, val )
{
  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longMake( array );
  // return _.longShallowClone( array );

  if( _.numberIs( range ) )
  range = [ range, array.length ];

  // let f = range ? range[ 0 ] : undefined;
  // let l = range ? range[ 1 ] : undefined;
  //
  // f = f !== undefined ? f : 0;
  // l = l !== undefined ? l : array.length;

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) )

  // if( f < 0 )
  // {
  //   l -= f;
  //   f -= f;
  // }

  _.rangeClamp( range, [ 0, array.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  // if( l < f )
  // l = f;

  // if( f < 0 )
  // f = 0;
  // if( l > array.length )
  // l = array.length;

  if( range[ 0 ] === 0 && range[ 1 ] === array.length )
  return _.longMake( array );
  // return _.longShallowClone( array );

  result = _.longMakeUndefined( array, range[ 1 ]-range[ 0 ] );

  let f2 = Math.max( range[ 0 ], 0 );
  let l2 = Math.min( array.length, range[ 1 ] );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = array[ r ];

  if( val !== undefined )
  {
    for( let r = 0 ; r < -range[ 0 ] ; r++ )
    {
      result[ r ] = val;
    }
    for( let r = l2 - range[ 0 ]; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  return result;
}

//

/**
 * The routine longSelectInplace() returns a portion of provided Long {-array-} selected by {-range-}.
 * If provided Long is resizable, routine modifies this Long in place, otherwise, return copy.
 *
 * @param { Long } array - The Long from which selects elements.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to array.length.
 * If {-range-} is undefined, routine returns {-array-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > array.length, end index sets to array.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty Long.
 * @param { * } val - The object of any type for insertion.
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelectInplace( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelectInplace( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelectInplace( src, [ 1, 4 ], [ 1 ] );
 * console.log( got );
 * // log Uint8Array[ 2, 3, 4 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longSelectInplace( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longSelectInplace( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a Long containing the selected elements. If Long is resizable,
 * routine returns modified source Long, otherwise, returns a copy.
 * @function longSelectInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

/*
  qqq : extend documentation and test coverage of longSelectInplace
  Dmytro : documented, covered
  qqq : implement arraySelect
  Dmytro : implemented
  qqq : implement arraySelectInplace
  Dmytro : implemented
*/

function longSelectInplace( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  return _.arraySelectInplace( array, range, val );

  if( range === undefined )
  return array;
  if( _.numberIs( range ) )
  range = [ range, array.length ];

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) );

  _.rangeClamp( range, [ 0, array.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] === 0 && range[ 1 ] === array.length )
  return array;
  else
  return _.longSelect( array, range, val );
  // let result;
  //
  // if( range === undefined )
  // return array;
  //
  // if( _.numberIs( range ) )
  // range = [ range, array.length ];
  //
  // // let f = range ? range[ 0 ] : undefined;
  // // let l = range ? range[ 1 ] : undefined;
  // //
  // // f = f !== undefined ? f : 0;
  // // l = l !== undefined ? l : array.length;
  //
  // _.assert( _.longIs( array ) );
  // _.assert( _.rangeIs( range ) )
  // // _.assert( _.numberIs( f ) );
  // // _.assert( _.numberIs( l ) );
  // _.assert( 1 <= arguments.length && arguments.length <= 3 );
  // // _.assert( 1 <= arguments.length && arguments.length <= 4 );
  //
  // _.rangeClamp( range, [ 0, array.length ] );
  // if( range[ 1 ] < range[ 0 ] )
  // range[ 1 ] = range[ 0 ];
  //
  // // if( l < f )
  // // l = f;
  // //
  // // if( f < 0 )
  // // f = 0;
  // // if( l > array.length )
  // // l = array.length;
  //
  // if( range[ 0 ] === 0 && range[ 1 ] === array.length )
  // // if( range[ 0 ] === 0 && l === array.length ) // Dmytro : l is not defined
  // return array;
  //
  // // if( _.bufferTypedIs( array ) )
  // // result = new array.constructor( l-f );
  // // else
  // // result = new Array( l-f );
  //
  // result = _.longMakeUndefined( array, range[ 1 ]-range[ 0 ] );
  //
  // /* */
  //
  // let f2 = Math.max( range[ 0 ], 0 );
  // let l2 = Math.min( array.length, range[ 1 ] );
  // for( let r = f2 ; r < l2 ; r++ )
  // result[ r-range[ 0 ] ] = array[ r ];
  //
  // /* */
  //
  // if( val !== undefined )
  // {
  //   for( let r = 0 ; r < -range[ 0 ] ; r++ )
  //   {
  //     result[ r ] = val;
  //   }
  //   for( let r = l2 - range[ 0 ]; r < result.length ; r++ )
  //   {
  //     result[ r ] = val;
  //   }
  // }
  //
  // /* */
  //
  // return result;
}

//

/**
 * Routine longGrow() changes length of provided Long {-array-} by copying it elements to newly created Long of the same
 * type using range {-range-} positions of the original Long and value to fill free space after copy {-val-}.
 * Routine can only grows size of Long. The original {-array-} will not be modified.
 *
 * @param { Long } array - The Long from which makes a shallow copy.
 * @param { Range } The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the end index, and the start index is 0.
 * If range[ 0 ] < 0, then start index sets to 0, end index incrementes by absolute value of range[ 0 ].
 * If range[ 0 ] > 0, then start index sets to 0.
 * If range[ 1 ] > array.length, end index sets to array.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns a copy of original Long.
 * @param { * } val - The object of any type. Used to fill the space left after copying elements of the original Long.
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrow( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrow( src, 7, 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrow( src, [ 1, 6 ], 7 );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4, 5, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrow( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7, 7, 7, 7, 7, 7 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longGrow( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a copy of provided Long with changed length.
 * @function longGrow
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

/*
  qqq : extend documentation and test coverage of longGrowInplace
  Dmytro : extended documentation, covered routine longGrow, longGrowInplace
  qqq : implement arrayGrow
  Dmitro : implemented
  qqq : implement arrayGrowInplace
  Dmitro : implemented
*/

function longGrow( array, range, val )
{
  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longMake( array );

  if( _.numberIs( range ) )
  range = [ 0, range ];

  let f = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let l = range[ 1 ] !== undefined ? range[ 1 ] : array.length;

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) )
  // _.assert( _.numberIs( f ) );
  // _.assert( _.numberIs( l ) );
  // _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( l < f )
  l = f;

  if( f < 0 )
  {
    l -= f;
    f -= f;
  }

  // if( _.bufferTypedIs( array ) )
  // result = new array.constructor( l-f );
  // else
  // result = new Array( l-f );

  if( f > 0 )
  f = 0;
  if( l < array.length )
  l = array.length;

  if( l === array.length )
  return _.longMake( array );

  result = _.longMakeUndefined( array, l-f );

  /* */

  let f2 = Math.max( f, 0 );
  let l2 = Math.min( array.length, l );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = array[ r ];

  /* */

  if( val !== undefined )
  {
    for( let r = 0 ; r < -f ; r++ )
    {
      result[ r ] = val;
    }
    for( let r = l2 - f; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  /* */

  return result;
}

//

/**
 * Routine longGrowInplace() changes length of provided Long {-array-} using range {-range-} positions of the original
 * Long and value to fill free space after copy {-val-}. If provided Long is resizable, routine modifies this
 * Long in place, otherwise, return copy. Routine can only grows size of Long.
 *
 * @param { Long } array - The Long to grow length.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the end index, and the start index is 0.
 * If range[ 0 ] < 0, then start index sets to 0, end index incrementes by absolute value of range[ 0 ].
 * If range[ 0 ] > 0, then start index sets to 0.
 * If range[ 1 ] > array.length, end index sets to array.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns origin array.
 * @param { * } val - The object of any type. Used to fill the space left of the original Long.
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrowInplace( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrowInplace( src, 7, 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrowInplace( src, [ 1, 6 ], 7 );
 * console.log( got );
 * // log Uint8Array[ 1, 2, 3, 4, 5, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longGrowInplace( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7, 7, 7, 7, 7, 7 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longGrowInplace( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @returns { Long } Returns a Long with changed length.
 * If Long is resizable, routine returns modified source Long, otherwise, returns a copy.
 * @function longGrowInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function longGrowInplace( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  return _.arrayGrowInplace( array, range, val );

  if( range === undefined )
  return array;
  if( _.numberIs( range ) )
  range = [ 0, range ];

  let f = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let l = range[ 1 ] !== undefined ? range[ 1 ] : array.length;

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) )

  if( l < f )
  l = f;
  if( f < 0 )
  {
    l -= f;
    f -= f;
  }
  if( f > 0 )
  f = 0;
  if( l < array.length )
  l = array.length;

  if( l === array.length )
  return array;
  else
  return _.longGrow( array, range, val );

  // let result;
  //
  // _.assert( 1 <= arguments.length && arguments.length <= 3 );   // Dmytro : in previus place some asserts lose its own sense
  //
  // if( range === undefined )
  // return array;
  //
  // let f = range ? range[ 0 ] : undefined;
  // let l = range ? range[ 1 ] : undefined;
  //
  // f = f !== undefined ? f : 0;
  // l = l !== undefined ? l : array.length;
  //
  // _.assert( _.longIs( array ) );
  // _.assert( _.rangeIs( range ) )
  // // _.assert( _.numberIs( f ) );
  // // _.assert( _.numberIs( l ) );
  // // _.assert( 1 <= arguments.length && arguments.length <= 3 );
  // // // _.assert( 1 <= arguments.length && arguments.length <= 4 );
  //
  // if( l < f )
  // l = f;
  //
  // if( f < 0 )
  // {
  //   l -= f;
  //   f -= f;
  // }
  //
  // // if( _.bufferTypedIs( array ) )
  // // result = new array.constructor( l-f );
  // // else
  // // result = new Array( l-f );
  //
  // if( f > 0 )
  // f = 0;
  // if( l < array.length )
  // l = array.length;
  //
  // if( l === array.length )
  // return array;
  //
  // result = _.longMakeUndefined( array, l-f );
  //
  // /* */
  //
  // let f2 = Math.max( f, 0 );
  // let l2 = Math.min( array.length, l );
  // for( let r = f2 ; r < l2 ; r++ )
  // result[ r-f ] = array[ r ];
  //
  // /* */
  //
  // if( val !== undefined )
  // {
  //   for( let r = 0 ; r < -f ; r++ )
  //   {
  //     result[ r ] = val;
  //   }
  //   for( let r = l2 - f; r < result.length ; r++ )
  //   {
  //     result[ r ] = val;
  //   }
  // }
  //
  // /* */
  //
  // return result;
}

//

/**
 * Routine longRelength() changes length of provided Long {-array-} by copying it elements to newly created Long of the same
 * type using range {-range-} positions of the original Long and value to fill free space after copy {-val-}.
 * Routine can grows and reduses size of Long. The original {-array-} will not be modified.
 *
 * @param { Long } array - The Long from which makes a shallow copy.
 * @param { Range } The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to array.length.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty Long.
 * @param { * } val - The object of any type. Used to fill the space left after copying elements of the original Long.
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelength( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelength( src, 7, 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelength( src, [ 1, 6 ], 7 );
 * console.log( got );
 * // log Uint8Array[ 2, 3, 4, 5, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelength( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longRelength( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a copy of provided Long with changed length.
 * @function longRelength
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function longRelength( array, range, val )
{

  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longMake( array );

  if( _.numberIs( range ) )
  range = [ range, array.length ];

  let f = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let l = range[ 1 ] !== undefined ? range[ 1 ] : src.length;

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) )

  if( l < f )
  l = f;
  if( f > array.length )
  f = array.length

  if( f < 0 )
  f = 0;

  if( f === 0 && l === array.length )
  return _.longMake( array );

  result = _.longMakeUndefined( array, l-f );

  /* */

  let f2 = Math.max( f, 0 );
  let l2 = Math.min( array.length, l );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = array[ r ];

  /* */

  if( val !== undefined )
  {
    for( let r = l2 - range[ 0 ]; r < result.length ; r++ )
    {
      result[ r ] = val;
    }
  }

  /* */

  return result;
}

//

/**
 * Routine longRelengthInplace() changes length of provided Long {-array-} using range {-range-} positions of the original
 * Long and value to fill free space after copy {-val-}. If provided Long is resizable, routine modifies this
 * Long in place, otherwise, return copy. Routine can grows and reduce size of Long.
 *
 * @param { Long } array - The Long to change length.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to src.length.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty array.
 * @param { * } val - The object of any type. Used to fill the space left of the original Long.
 *
 * @example
 * var src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelengthInplace( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelengthInplace( src, 7, 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelengthInplace( src, [ 1, 6 ], 7 );
 * console.log( got );
 * // log Uint8Array[ 2, 3, 4, 5, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longRelengthInplace( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longRelengthInplace( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log true
 *
 * @returns { Long } Returns a Long with changed length.
 * If Long is resizable, routine returns modified source Long, otherwise, returns a copy.
 * @function longRelengthInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function longRelengthInplace( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  return _.arrayRelengthInplace( array, range, val );

  if( range === undefined )
  return array;
  if( _.numberIs( range ) )
  range = [ range, array.length ];

  let f = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  let l = range[ 1 ] !== undefined ? range[ 1 ] : src.length;

  _.assert( _.longIs( array ) );
  _.assert( _.rangeIs( range ) )

  if( l < f )
  l = f;
  if( f > array.length )
  f = array.length;
  if( f < 0 )
  f = 0;

  if( f === 0 && l === array.length )
  return array;
  else
  return _.longRelength( array, range, val );

}

// --
// array checker
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

//

function constructorLikeArray( src )
{
  if( !src )
  return false;

  if( src === Function )
  return false;
  if( src === Object )
  return false;
  if( src === String )
  return false;

  if( _.primitiveIs( src ) )
  return false;

  if( !( 'length' in src.prototype ) )
  return false;
  if( Object.propertyIsEnumerable.call( src.prototype, 'length' ) )
  return false;

  return true;
}

//

/**
 * The hasLength() routine determines whether the passed value has the property (length).
 *
 * If {-srcMap-} is equal to the (undefined) or (null) false is returned.
 * If {-srcMap-} has the property (length) true is returned.
 * Otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.hasLength( [ 1, 2 ] );
 * // returns true
 *
 * @example
 * _.hasLength( 'Hello there!' );
 * // returns true
 *
 * @example
 * let isLength = ( function() {
 *   return _.hasLength( arguments );
 * } )( 'Hello there!' );
 * // returns true
 *
 * @example
 * _.hasLength( 10 );
 * // returns false
 *
 * @example
 * _.hasLength( {} );
 * // returns false
 *
 * @returns { boolean } Returns true if {-srcMap-} has the property (length).
 * @function hasLength
 * @memberof wTools
 */

function hasLength( src )
{
  if( src === undefined || src === null )
  return false;
  if( _.numberIs( src.length ) )
  return true;
  return false;
}

//

function arrayHasArray( arr )
{

  _.assert( arguments.length === 1 );

  if( !_.arrayLike( arr ) )
  return false;

  for( let a = 0 ; a < arr.length ; a += 1 )
  if( _.arrayLike( arr[ a ] ) )
  return true;

  return false;
}

//

/**
 * The arrayCompare() routine returns the first difference between the values of the first array from the second.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
 * // returns 3
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @function arrayCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */

function arrayCompare( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) && _.longIs( src2 ) );
  _.assert( src2.length >= src1.length );

  let result = 0;

  for( let s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] - src2[ s ];
    if( result !== 0 )
    return result;

  }

  return result;
}

//

/**
 * The arraysAreIdentical() routine checks the equality of two arrays.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * _.arraysAreIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 * // returns true
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function arraysAreIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function arraysAreIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) );
  _.assert( _.longIs( src2 ) );

  let result = true;

  if( src1.length !== src2.length )
  return false;

  for( let s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] === src2[ s ];

    if( result === false )
    return false;

  }

  return result;
}

//

function arrayHas( array, element, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayLike( array ) );

  if( evaluator1 === undefined && evaluator2 === undefined )
  {
    // return _ArrayIndexOf.call( array, element ) !== -1;
    return _ArrayIncludes.call( array, element );
  }
  else
  {
    if( _.arrayLeftIndex( array, element, evaluator1, evaluator2 ) >= 0 )
    return true;
    return false;
  }

}

//

/**
 * The routine arrayHasAny() checks if the {-src-} array has at least one element of the argument {-ins-}.
 * It can take equalizer or evaluators for the routine equalities.
 *
 * It iterates over array-like {-src-} copies each element of the array {-ins-} by the routine
 * [arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * Checks, if {-src-} array has at least one element of the {-ins-} array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Long } src - The source array.
 * @param  { Long|Primitive } ins - The elements to check in the source array.
 * @param { Function } evaluator - A collback function.
 *
 * @example
 * _.arrayHasAny( [ 5, 'str', 42, false ], 7 );
 * // returns false
 *
 * @example
 * _.arrayHasAny( [ 5, 'str', 42, false ], [ false, 7, 10 ] );
 * // returns true
 *
 * @example
 * _.arrayHasAny( [ { a : 2 }, 'str', 42, false ], [ { a : 2 }, { a : 3 } ] );
 * // returns false
 *
 * @example
 * var evaluator = ( e ) => e.a;
 * _.arrayHasAny( [ { a : 2 }, 'str', 42, false ], [ { a : 2 }, { a : 3 } ], evaluator );
 * // returns true
 *
 * @returns { Boolean } - Returns true, if {-src-} has at least one element of {-ins-}, otherwise false is returned.
 * @function arrayHasAny
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-ins-} is not a Long, not a primitive.
 * @throws { Error } If {-evaluator-} is not a routine.
 * @memberof wTools
 */

function arrayHasAny( src, ins, evaluator )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longIs( src ), 'Expects array, but got ' + _.strType( src ) );
  _.assert( _.longIs( ins ) || _.primitiveIs( ins ) );

  if( _.primitiveIs( ins ) )
  ins = [ ins ];

  let i = 0;
  let result;

  do
  {
    result = _.arrayLeftIndex( src, ins[ i ], 0, evaluator );
    i++;
  }
  while( result < 0 && i < ins.length )

  if( result !== -1 )
  return true;
  return false;
}

// function arrayHasAny( src )
// {
//   let empty = true;
//   empty = false;
//
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//   _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ), 'arrayHasAny :', 'array expected' );
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//     empty = false;
//
//     let ins = _.arrayAs( arguments[ a ] );
//     for( let i = 0 ; i < ins.length ; i++ )
//     {
//       if( src.indexOf( ins[ i ] ) !== -1 )
//       return true;
//     }
//
//   }
//
//   return empty;
// }

//

/**
 * The routine arrayHasAll() checks if the {-src-} array has all elements of the argument {-ins-}.
 * It can take equalizer or evaluators for the routine equalities.
 *
 * It iterates over array-like {-src-} copies each element of the array {-ins-} by the routine
 * [arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * Checks, if {-src-} array has all elements of the {-ins-} array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Long } src - The source array.
 * @param  { Long|Primitive } ins - The elements to check in the source array.
 * @param { Function } evaluator - A collback function.
 *
 * @example
 * _.arrayHasAll( [ 5, 'str', 42, false ], 7 );
 * // returns false
 *
 * @example
 * _.arrayHasAny( [ 5, 'str', 42, false ], [ false, 5, 'str' ] );
 * // returns true
 *
 * @example
 * _.arrayHasAny( [ { a : 2 }, { a : 3 } 'var', 42, false ], [ { a : 2 }, { a : 3 } ] );
 * // returns false
 *
 * @example
 * var evaluator = ( e ) => e.a;
 * _.arrayHasAny( [ { a : 2 }, { a : 3 } 'str', 42, false ], [ { a : 2 }, { a : 3 } ], evaluator );
 * // returns true
 *
 * @returns { Boolean } - Returns true, if {-src-} has all elements of {-ins-}, otherwise false is returned.
 * @function arrayHasAll
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-ins-} is not a Long, not a primitive.
 * @throws { Error } If {-evaluator-} is not a routine.
 * @memberof wTools
 */

function arrayHasAll( src, ins, evaluator )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longIs( src ), 'Expects array, but got ' + _.strType( src ) );
  _.assert( _.longIs( ins ) || _.primitiveIs( ins ) );

  if( _.primitiveIs( ins ) )
  ins = [ ins ];

  let i = 0;
  let result;

  do
  {
    result = _.arrayLeftIndex( src, ins[ i ], 0, evaluator );
    i++;
  }
  while( result >= 0 && i < ins.length )

  if( result !== -1 )
  return true;
  return false;
}

// function arrayHasAll( src )
// {
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//   _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ), 'arrayHasAll :', 'array expected' );
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//
//     let ins = _.arrayAs( arguments[ a ] );
//     for( let i = 0 ; i < ins.length ; i++ )
//     if( src.indexOf( ins[ i ] ) === -1 )
//     return false;
//
//   }
//
//   return true;
// }

//

/**
 * The routine arrayHasNone() checks if the {-src-} array has no one element of the argument {-ins-}.
 * It can take equalizer or evaluators for the routine equalities.
 *
 * It iterates over array-like {-src-} copies each element of the array {-ins-} by the routine
 * [arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * Checks, if {-src-} array has no one elements of the {-ins-} array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Long } src - The source array.
 * @param  { Long|Primitive } ins - The elements to check in the source array.
 * @param { Function } evaluator - A collback function.
 *
 * @example
 * _.arrayHasNone( [ 5, 'str', 42, false ], 7 );
 * // returns true
 *
 * @example
 * _.arrayHasNone( [ 5, 'str', 42, false ], [ false, 5, 'str' ] );
 * // returns false
 *
 * @example
 * _.arrayHasNone( [ { a : 2 }, { a : 3 } 'var', 42, false ], [ { a : 2 }, { a : 3 } ] );
 * // returns true
 *
 * @example
 * var evaluator = ( e ) => e.a;
 * _.arrayHasNone( [ { a : 2 }, { a : 3 } 'str', 42, false ], [ { a : 2 }, { a : 4 } ], evaluator );
 * // returns false
 *
 * @returns { Boolean } - Returns true, if {-src-} has no one element of {-ins-}, otherwise false is returned.
 * @function arrayHasAll
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-ins-} is not a Long, not a primitive.
 * @throws { Error } If {-evaluator-} is not a routine.
 * @memberof wTools
 */

function arrayHasNone( src, ins, evaluator )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longIs( src ), 'Expects array, but got ' + _.strType( src ) );
  _.assert( _.longIs( ins ) || _.primitiveIs( ins ) );

  if( _.primitiveIs( ins ) )
  ins = [ ins ];

  let i = 0;
  let result;

  do
  {
    result = _.arrayLeftIndex( src, ins[ i ], 0, evaluator );
    i++;
  }
  while( result < 0 && i < ins.length )

  if( result !== -1 )
  return false;
  return true;
}

// function arrayHasNone( src )
// {
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//   _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ), 'arrayHasNone :', 'array expected' );
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//
//     let ins = _.arrayAs( arguments[ a ] );
//     for( let i = 0 ; i < ins.length ; i++ )
//     if( src.indexOf( ins[ i ] ) !== -1 )
//     return false;
//
//   }
//
//   return true;
// }

//

function arrayAll( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  {
    if( !src[ s ] )
    return false;
  }

  return true;
}

//

function arrayAny( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  debugger;
  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return true;

  debugger;
  return false;
}

//

function arrayNone( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return false;

  return true;
}

// --
// array producer
// --

/**
 * The routine arrayMake() returns a new Array maked from {-src-}.
 *
 * @param { Number|Long|Null } src - The number or any Long to make new Array. If null passed, routine returns an empty Array.
 *
 * @example
 * _.arrayMake( null );
 * // returns []
 *
 * @example
 * _.arrayMake( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let src = [ 1, 2, 3, 4, '5' ]
 * let got = _.arrayMake( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, '5' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * let src = _.unrollMake( [ 1, 2, 'str' ] );
 * let got = _.arrayMake( src );
 * console.log( got );
 * // log [ 1, 2, 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log false
 *
 * @example
 * let src = new U32x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.arrayMake( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( _.arrayIs( got ) );
 * // log true
 *
 * @returns { Array } Returns a new Array maked from {-src-}.
 * Otherwise, it returns the empty Array.
 * @function arrayMake
 * @throws { Error } If arguments.length is less or more then one.
 * @throws { Error } If argument {-src-} is not a number, not a Long, not null.
 * @memberof wTools
 */

/* qqq : extend coverage, take into account Set case
*/

function arrayMake( src )
{
  _.assert( arguments.length === 1 );

  if( src === null )
  return Array();

  if( _.numberIs( src ) )
  return Array( src );

  if( _.setIs( src ) )
  return [ ... src ];

  _.assert( _.longIs( src ) );

  if( src.length === 1 )
  return [ src[ 0 ] ];
  else
  return Array.apply( Array, src );
}

//

/**
 * The routine arrayMakeUndefined() returns a new Array with length equal to {-length-}.
 * If the argument {-length-} is not provided, routine returns new Array with the length defined from {-src-}.
 *
 * @param { Number|Long|Null } src - The number or any Long. If {-length-} is not provided, defines length of new Array.
 * @param { Number } length - Defines length of new Array.
 *
 * @example
 * _.arrayMakeUndefined( null );
 * // returns []
 *
 * @example
 * _.arrayMakeUndefined( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.arrayMakeUndefined( 5, 2 );
 * // returns [ undefined, undefined ]
 *
 * @example
 * let src = [ 1, 2, 3, 4, '5' ]
 * let got = _.arrayMakeUndefined( src );
 * console.log( got );
 * // log [ undefined, undefined, undefined, undefined, undefined ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * let src = [ 1, 2, 3, 4, '5' ]
 * let got = _.arrayMakeUndefined( src, 2 );
 * console.log( got );
 * // log [ undefined, undefined ]
 *
 * @example
 * let src = _.unrollMake( [ 1, 2, 'str' ] );
 * let got = _.arrayMakeUndefined( src );
 * console.log( got );
 * // log [ undefined, undefined, undefined ]
 * console.log( _.unrollIs( got ) );
 * // log false
 *
 * @example
 * let src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.arrayMakeUndefined( src, 3 );
 * console.log( got );
 * // log [ undefined, undefined, undefined ]
 * console.log( _.arrayIs( got ) );
 * // log true
 *
 * @returns { Array } Returns a new Array with length equal to {-length-} or defined from {-src-}.
 * If null passed, routine returns the empty Array.
 * @function arrayMakeUndefined
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If argument {-src-} is not a number, not a Long, not null.
 * @throws { Error } If argument {-length-} is not a number.
 * @memberof wTools
 */

/*
qqq : document and cover arrayMakeUndefined
Dmytro : routine is covered and documented
*/

function arrayMakeUndefined( src, length )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIs( src ) || _.longIs( src ) || src === null );
  _.assert( length === undefined || _.numberIs( length ) );

  if( src && src.length && length === undefined )
  length = src.length;

  // Dmytro : missed condition
  if( _.numberIs( src ) && length === undefined )
  length = src;

  if( !length )
  length = 0;

  _.assert( _.numberIsFinite( length ) )
  return Array( length );
}

//

/* qqq
add good coverage for arrayFrom
take into account unroll cases
Dmytro : covered with unroll cases.
*/

function arrayFrom( src )
{
  _.assert( arguments.length === 1 );
  if( _.arrayIs( src ) && !_.unrollIs( src ) )
  return src;
  return _.arrayMake.call( _, src );
}

//

/**
 * The arrayAs() routine copies passed argument to the array.
 *
 * @param { * } src - The source value.
 *
 * @example
 * _.arrayAs( false );
 * // returns [ false ]
 *
 * @example
 * _.arrayAs( { a : 1, b : 2 } );
 * // returns [ { a : 1, b : 2 } ]
 *
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
 * Otherwise return an array which contains the element from argument.
 * @function arrayAs
 * @memberof wTools
 */

function arrayAs( src )
{
  _.assert( arguments.length === 1 );
  _.assert( src !== undefined );

  if( src === null )
  return [];
  else if( _.longIs( src ) )
  return src;
  else
  return [ src ];

}

//

function arrayAsShallowing( src )
{
  _.assert( arguments.length === 1 );
  _.assert( src !== undefined );

  if( src === null )
  return [];
  else if( _.longIs( src ) )
  return _.arraySlice( src );
  else
  return [ src ];

}

// --
// array transformer
// --

/**
 * The routine arraySlice() returns a shallow copy of a portion of {-srcArray-} into a new array object.
 * The copy makes from first index {-f-} to last index {-l-}. The original {-srcArray-} will not be modified.
 *
 * @param { Array|Unroll } srcArray - The Array or Unroll from which makes a shallow copy.
 * @param { Number } f - Defines the start index of copying.
 * Negative value of argument {-f-} indicates an offset from the end of the sequence.
 * If {-f-} is undefined, slice begins from index 0.
 * If {-f-} is greater than the length of the sequence, an empty array is returned.
 * @param { Number } l - Defines last index of copying. An element with this index not included.
 * Negative value of {-l-} indicates an offset from the end of the sequence.
 * If {-l-} is omitted, slice extracts through the end of the sequence ( srcArray.length ).
 * If {-l-} is greater than the length of the sequence, slice extracts through to the end of the sequence (arr.length).
 *
 * @example
 * _.arraySlice( [ 1, 2, 3, 4, '5' ] );
 * // returns [ 1, 2, 3, 4, '5' ]
 *
 * @example
 * _.arraySlice( [ 1, 2, 3, 4, '5' ], 1, 4 );
 * // returns [ 2, 3, 4 ]
 *
 * @example
 * _.arraySlice( [ 1, 2, 3, 4, '5' ], -2, 5 );
 * // returns [ 4, '5' ]
 *
 * @example
 * _.arraySlice( [ 1, 2, 3, 4, '5' ], 2, -1 );
 * // returns [ 3, 4 ]
 *
 * @example
 * _.arraySlice( [ 1, 2, 3, 4, '5' ], 6, 9 );
 * // returns []
 *
 * @returns { Array } Returns a new Array containing the extracted elements.
 * @function arraySlice
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-srcArray-} is not an array or unroll.
 * @memberof wTools
 */

/*
qqq : routine arraySlice requires good test coverage and documentation
Dmytro : good test coverage is added, routine is documented
*/

function arraySlice( srcArray, f, l )
{
  _.assert( _.arrayLikeResizable( srcArray ) );
  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  return srcArray.slice( f, l );
}

//

/**
 * The routine arrayBut() returns a shallow copy of provided array {-src-}. Routine removes existing
 * elements in bounds defined by {-range-} and insert new elements from {-ins-}. The original
 * source array {-src-} will not be modified.
 *
 * @param { Array|Unroll } src - The Array or Unroll from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for removing elements.
 * If {-range-} is number, then it defines the start index, and the end index is start index incremented by one.
 * If {-range-} is undefined, routine returns copy of {-src-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to src.length.
 * If range[ 1 ] <= range[ 0 ], then routine removes not elements, the insertion of elements begins at start index.
 * @param { Long } ins - The Long with elements for insertion. Inserting begins at start index.
 * If quantity of removed elements is not equal to ins.length, then returned array will have length different to src.length.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayBut( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayBut( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 'str', 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayBut( src, [ 1, 4 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 'str', 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayBut( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayBut( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 'str', 5 ]
 * console.log( got === src );
 * // log false
 *
 * @returns { Array|Unroll } Returns a copy of Array / Unroll with removed or replaced existing elements and / or added new elements.
 * @function arrayBut
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @throws { Error } If argument {-ins-} is not Long / undefined.
 * @memberof wTools
 */

function arrayBut( src, range, ins )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.arrayMake( src );

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) );
  _.assert( ins === undefined || _.longIs( ins ) );

  _.rangeClamp( range, [ 0, src.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  let args = [ range[ 0 ], range[ 1 ] - range[ 0 ] ];

  if( ins )
  _.arrayAppendArray( args, ins );

  /*
  qqq : check is it optimal to make double copy
  Dmytro : it is not double copy. Method slice() makes a copy and method splice replaces some elements in this copy.
  or uncomment this code
  let result = [];

  for( let i = 0; i < range[ 0 ]; i++ )
  result.push( src[ i ] );

  if( ins )
  for( let i = 0; i < ins.length; i++ )
  result.push( ins[ i ] );

  for( let i = range[ 1 ]; i < src.length; i++ )
  result.push( src[ i ] );
  */

  let result = src.slice();

  result.splice.apply( result, args );

  return result;
}

//

/**
 * The routine arrayButInplace() returns a provided array {-src-} with removed existing elements in bounds
 * defined by {-range-} and inserted new elements from {-ins-}.
 *
 * @param { Array|Unroll } src - The Array or Unroll to remove, replace or add elements.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for removing elements.
 * If {-range-} is number, then it defines the start index, and the end index defines as start index incremented by one.
 * If {-range-} is undefined, routine returns {-src-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to src.length.
 * If range[ 1 ] <= range[ 0 ], then routine removes no elements, the insertion of elements begins at start index.
 * @param { Long } ins - The Long with elements for insertion. Inserting begins at start index.
 * If quantity of removed elements is not equal to ins.length, then returned array will have length different to original src.length.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayButInplace( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayButInplace( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 'str', 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayButInplace( src, [ 1, 4 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 'str', 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayButInplace( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 'str' ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayButInplace( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 'str', 5 ]
 * console.log( got === src );
 * // log true
 *
 * @returns { Array|Unroll } Returns original Array / Unroll with removed or replaced existing elements and / or added new elements.
 * @function arrayButInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @throws { Error } If argument {-ins-} is not Long / undefined.
 * @memberof wTools
 */

function arrayButInplace( src, range, ins )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src;

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( _.arrayLikeResizable( src ) );
  _.assert( _.rangeIs( range ) );
  _.assert( ins === undefined || _.longIs( ins ) );

  // Dmytro : missed
  _.rangeClamp( range, [ 0, src.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];
  //

  let args = [ range[ 0 ], range[ 1 ] - range[ 0 ] ];

  if( ins )
  _.arrayAppendArray( args, ins );

  let result = src;

  result.splice.apply( result, args );

  return result;
}

//

/**
 * The routine arraySelect() returns a copy of a portion of provided array {-src-} into a new array object
 * selected by {-range-}. The original {-src-} will not be modified.
 *
 * @param { Array|Unroll } src - The Array or Unroll from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to src.length.
 * If {-range-} is undefined, routine returns copy of {-src-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to src.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty array object.
 * @param { * } ins - The object of any type for insertion.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelect( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelect( src, 2, 'str' );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelect( src, [ 1, 4 ], 'str' );
 * console.log( got );
 * // log [ 2, 3, 4 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelect( src, [ -5, 10 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelect( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Array|Unroll } Returns a copy of Array / Unroll containing the extracted elements.
 * @function arraySelect
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function arraySelect( src, range, ins )
{
  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src.slice();

  if( _.numberIs( range ) )
  range = [ range, src.length ];

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) );

  _.rangeClamp( range, [ 0, src.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] === 0 && range[ 1 ] === src.length )
  return src.slice( src );

  result = _.arrayMakeUndefined( src, range[ 1 ]-range[ 0 ] );

  let f2 = Math.max( range[ 0 ], 0 );
  let l2 = Math.min( src.length, range[ 1 ] );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-range[ 0 ] ] = src[ r ];

  return result;
}

//

/**
 * The routine arraySelectInplace() returns a portion of provided array {-src-} selected by {-range-}.
 *
 * @param { Array|Unroll } src - The Array or Unroll from which selects elements.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to src.length.
 * If {-range-} is undefined, routine returns {-src-}.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to src.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty array object.
 * @param { * } ins - The object of any type for insertion.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelectInplace( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelectInplace( src, 2, 'str' );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelectInplace( src, [ 1, 4 ], 'str' );
 * console.log( got );
 * // log [ 2, 3, 4 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelectInplace( src, [ -5, 10 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arraySelectInplace( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log true
 *
 * @returns { Array|Unroll } Returns a Array / Unroll containing the selected elements.
 * @function arraySelectInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function arraySelectInplace( src, range, ins )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src;

  if( _.numberIs( range ) )
  range = [ range, src.length ];

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) );

  _.rangeClamp( range, [ 0, src.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] === 0 && range[ 1 ] === src.length )
  return src;

  let f2 = Math.max( range[ 0 ], 0 );
  let l2 = Math.min( src.length, range[ 1 ] );

  let result = src;

  result.splice.apply( result, [ 0, f2 ] );
  result.length = range[ 1 ] - range[ 0 ];

  return result;
}

//

/**
 * Routine arrayGrow() changes length of provided array {-src-} by copying it elements to newly created array
 * using range {-range-} positions of the original array and value to fill free space after copy {-ins-}.
 * Routine can only grows size of array.The original {-src-} will not be modified.
 *
 * @param { Array|Unroll } src - The Array or Unroll from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the end index, and the start index is 0.
 * If range[ 0 ] < 0, then start index sets to 0, end index incrementes by absolute value of range[ 0 ].
 * If range[ 0 ] > 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to src.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns copy of origin array.
 * @param { * } ins -  object of any type. Used to fill the space left after copying elements of the original array.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, 7, 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, [ 1, 6 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7, 7, 7, 7, 7, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @returns { Array|Unroll } Returns a copy of Array / Unroll with changed length.
 * @function arrayGrow
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function arrayGrow( src, range, ins )
{
  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src.slice();

  if( _.numberIs( range ) )
  range = [ 0, range ];

  let f = range ? range[ 0 ] : undefined;
  let l = range ? range[ 1 ] : undefined;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : src.length;

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) )

  if( l < f )
  l = f;

  if( f < 0 )
  {
    l -= f;
    f -= f;
  }

  if( f > 0 )
  f = 0;
  if( l < src.length )
  l = src.length;

  if( l === src.length )
  return src.slice();

  result = _.arrayMakeUndefined( src, l-f );

  let f2 = Math.max( f, 0 );
  let l2 = Math.min( src.length, l );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f ] = src[ r ];

  if( ins !== undefined )
  {
    for( let r = l2 - f; r < result.length ; r++ )
    {
      result[ r ] = ins;
    }
  }

  return result;
}

//

/**
 * Routine arrayGrowInplace() changes length of provided array {-src-} using range {-range-} positions of the original
 * array and value to fill free space after copy {-ins-}. Routine can only grows size of array.
 *
 * @param { Array|Unroll } src - The Array or Unroll to grow length.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the end index, and the start index is 0.
 * If range[ 0 ] < 0, then start index sets to 0, end index incrementes by absolute value of range[ 0 ].
 * If range[ 0 ] > 0, then start index sets to 0.
 * If range[ 1 ] > src.length, end index sets to src.length.
 * If range[ 1 ] <= range[ 0 ], then routine returns copy of origin array.
 * @param { * } ins - The object of any type. Used to fill the space left of the original array.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, 7, 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str', 'str' ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, [ 1, 6 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 'str' ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7, 7, 7, 7, 7, 7 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayGrow( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @returns { Array|Unroll } Returns a provided Array / Unroll with changed length.
 * @function arrayGrowInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function arrayGrowInplace( src, range, ins )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src;

  if( _.numberIs( range ) )
  range = [ 0, range ];

  let f = range ? range[ 0 ] : undefined;
  let l = range ? range[ 1 ] : undefined;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : src.length;

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) )

  if( l < f )
  l = f;

  if( f < 0 )
  {
    l -= f;
    f -= f;
  }

  if( f > 0 )
  f = 0;
  if( l < src.length )
  l = src.length;

  if( l === src.length )
  return src;

  let l2 = Math.min( src.length, l );

  let result = src;
  result.length = l;

  if( ins !== undefined )
  {
    for( let r = l2; r < result.length ; r++ )
    {
      result[ r ] = ins;
    }
  }

  return result;
}

//

/**
 * Routine arrayRelength() changes length of provided array {-src-} by copying it elements to newly created array object
 * using range (range) positions of the original array and value to fill free space after copy (val).
 * Routine can grows and reduses size of Long. The original {-src-} will not be modified.
 *
 * @param { Array|Unroll } src - The Array or Unroll from which makes a shallow copy.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the start index, and the end index sets to src.length.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty array.
 * @param { * } ins - The object of any type. Inserting begins from last index of {-src-} to end index.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelength( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelength( src, 7, 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelength( src, [ 1, 6 ], 'str' );
 * console.log( got );
 * // log [ 2, 3, 4, 5, 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelength( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelength( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Array|Unroll } Returns a copy provided Array / Unroll with changed length.
 * @function arrayRelength
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function arrayRelength( src, range, ins )
{
  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src.slice();

  if( _.numberIs( range ) )
  range = [ range, src.length ];

  let f = range ? range[ 0 ] : undefined;
  let l = range ? range[ 1 ] : undefined;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : src.length;

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) );

  if( l < f )
  l = f;

  if( f < 0 )
  f = 0;

  if( f === 0 && l === src.length )
  return src.slice( src );

  result = _.arrayMakeUndefined( src, l-f );

  let f2 = Math.max( f, 0 );
  let l2 = Math.min( src.length, l );
  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = src[ r ];

  if( ins !== undefined )
  {
    for( let r = l2 - f; r < result.length ; r++ )
    {
      result[ r ] = ins;
    }
  }

  return result;
}

//

/**
 * Routine arrayRelengthInplace() changes length of provided array {-src-} using range {-range-} positions of the original
 * array and value to fill free space after copy {-ins-}. Routine can grows and reduce size of Long.
 *
 * @param { Array|Unroll } src - The Array or Unroll to change length.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index of new array.
 * If {-range-} is number, then it defines the start index, and the end index sets to src.length.
 * If range[ 0 ] < 0, then start index sets to 0.
 * If range[ 1 ] <= range[ 0 ], then routine returns empty array.
 * @param { * } ins - The object of any type. Inserting begins from last index of {-src-} to end index.
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelengthInplace( src );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelengthInplace( src, 7, 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelengthInplace( src, [ 1, 6 ], 'str' );
 * console.log( got );
 * // log [ 2, 3, 4, 5, 'str' ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelengthInplace( src, [ -5, 6 ], 7 );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5, 7 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.arrayRelengthInplace( src, [ 4, 1 ], 'str' );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Array|Unroll } Returns a provided Array / Unroll with changed length.
 * @function arrayRelengthInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-src-} is not an array or unroll.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @memberof wTools
 */

function arrayRelengthInplace( src, range, ins )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return src;

  if( _.numberIs( range ) )
  range = [ range, src.length ];

  let f = range ? range[ 0 ] : undefined;
  let l = range ? range[ 1 ] : undefined;

  f = f !== undefined ? f : 0;
  l = l !== undefined ? l : src.length;

  _.assert( _.arrayIs( src ) );
  _.assert( _.rangeIs( range ) );

  if( l < f )
  l = f;

  if( f < 0 )
  f = 0;

  if( f === 0 && l === src.length )
  return src;

  let f2 = Math.max( f, 0 );
  let l2 = Math.min( src.length, l );

  let result = src;

  result.splice.apply( result, [ 0, f ] );
  result.length = l - f;

  if( ins !== undefined )
  {
    for( let r = l2 - f; r < result.length ; r++ )
    {
      result[ r ] = ins;
    }
  }

  return result;
}

// --
// array sequential search
// --

function arrayLeftIndex( arr, ins, evaluator1, evaluator2 )
{
  let fromIndex = 0;

  if( _.numberIs( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.longIs( arr ), 'Expect a Long' );
  _.assert( _.numberIs( fromIndex ) );
  _.assert( evaluator1 === undefined || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( evaluator1 === undefined || _.routineIs( evaluator1 ) );
  _.assert( evaluator2 === undefined || evaluator2.length === 1 );
  _.assert( evaluator2 === undefined || _.routineIs( evaluator2 ) );

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
  else
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

function arrayRightIndex( arr, ins, evaluator1, evaluator2 )
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
  _.assert( evaluator1 === undefined || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( evaluator1 === undefined || _.routineIs( evaluator1 ) );
  _.assert( evaluator2 === undefined || evaluator2.length === 1 );
  _.assert( evaluator2 === undefined || _.routineIs( evaluator2 ) );

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
  else
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
 * The arrayLeft() routine returns a new object containing the properties, (index, element),
 * corresponding to a found value (ins) from an array (arr).
 *
 * It creates the variable (i), assigns and calls to it the function( _.arrayLeftIndex( arr, ins, evaluator1 ) ),
 * that returns the index of the value (ins) in the array (arr).
 * [wTools.arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
 * Otherwise, it returns the empty object.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { longIs } arr - Entity to check.
 * @param { * } ins - Element to locate in the array.
 * @param { wTools~compareCallback } evaluator1 - A callback function.
 *
 * @example
 * _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
 * // returns { index : 3, element : 'str' }
 *
 * @example
 * _.arrayLeft( [ 1, 2, 3, 4, 5 ], 6 );
 * // returns {}
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value (ins) from the array (arr).
 * Otherwise, it returns the empty object.
 * @function arrayLeft
 * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
 * @memberof wTools
 */

function arrayLeft( arr, ins, evaluator1, evaluator2 )
{
  let result = Object.create( null );
  let i = _.arrayLeftIndex( arr, ins, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( i >= 0 )
  {
    result.index = i;
    result.element = arr[ i ];
  }

  return result;
}

//

function arrayRight( arr, ins, evaluator1, evaluator2 )
{
  let result = Object.create( null );
  let i = _.arrayRightIndex( arr, ins, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

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

  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.arrayLeft( arr, true, function( e ){ return e !== undefined; } );
}

//

function arrayRightDefined( arr )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.arrayRight( arr, true, function( e ){ return e !== undefined; } );
}

//

/**
 * The routine arrayCountElement() returns the count of matched elements {-element-} in the {-srcArray-} array.
 * Returns 0 if no {-element-} is matched. It can take equalizer or evaluators to check specific equalities.
 *
 * @param { Long } srcArray - The source array.
 * @param { * } element - The value to count matches.
 * @param { Function } onEvaluate1 - It's a callback. If the routine has two parameters, it is used as an equalizer, and if it has only one, then routine used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the value to search.
 *
 * @example
 * // simple exapmle, no matches
 * _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 3 );
 * // returns 0
 *
 * @example
 * // simple exapmle
 * _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10 );
 * // returns 2
 *
 * @example
 * // with equalizer
 * _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10, ( a, b ) => _.typeOf( a ) === _.typeOf( b ) );
 * // returns 4
 *
 * @example
 * // with single evaluator
 * _.arrayCountElement( [ [ 10 ], [ 10 ], [ 'str' ], [ 10 ], [ false ] ], [ 'str' ], ( e ) => e[ 0 ] );
 * // returns 1
 *
 * @example
 * // with two part of evaluator
 * _.arrayCountElement( [ [ 10 ], [ 10 ], [ 'str' ], [ 10 ], [ false ] ], 10, ( e ) => e[ 0 ], ( e ) => e );
 * // returns 4
 *
 * @returns { Number } - Returns the count of matched elements {-element-} in the {-srcArray-}.
 * @function arrayCountElement
 * @throws { Error } If passed arguments is less than two or more than four.
 * @throws { Error } If the first argument is not a Long.
 * @throws { Error } If the third or fourth argument is not a routine.
 * @throws { Error } If the routine in third argument has less than one or more than two arguments.
 * @throws { Error } If the routine in third argument has two arguments and fourth argument is passed into routine arrayCountElement.
 * @throws { Error } If the routine in fourth argument has less than one or more than one arguments.
 * @memberof wTools
 */

/*
qqq : are all combinations of call of routine arrayCountElement covered?
*/

function arrayCountElement( srcArray, element, onEvaluate1, onEvaluate2 )
{
  let result = 0;

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.longIs( srcArray ), 'Expects long' );

  let left = _.arrayLeftIndex( srcArray, element, onEvaluate1, onEvaluate2 );
  // let index = srcArray.indexOf( element );

  while( left >= 0 )
  {
    result += 1;
    left = _.arrayLeftIndex( srcArray, element, left+1, onEvaluate1, onEvaluate2 );
    // index = srcArray.indexOf( element, index+1 );
  }

  return result;
}

//

/**
 * The routine arrayCountTotal() adds all the elements in {-srcArray-}, elements can be numbers or booleans ( it considers them 0 or 1 ).
 *
 * @param { Array } srcArray - The source array.
 *
 * @example
 * _.arrayCountTotal( [ 1, 2, 10, 10 ] );
 * // returns 23
 *
 * @example
 * _.arrayCountTotal( [ true, false, false ] );
 * // returns 1
 *
 * @returns { Number } - Returns the sum of the elements in {-srcArray-}.
 * @function arrayCountTotal
 * @throws { Error } If passed arguments is different than one.
 * @throws { Error } If the first argument is not a Long.
 * @throws { Error } If {-srcArray-} doesn´t contain number-like elements.
 * @memberof wTools
 */

function arrayCountTotal( srcArray )
{
  let result = 0;

  _.assert( arguments.length === 1 );
  _.assert( _.longIs( srcArray ), 'Expects long' );

  for( let i = 0 ; i < srcArray.length ; i++ )
  {
    _.assert( _.boolIs( srcArray[ i ] ) || _.numberIs( srcArray[ i ] ) || srcArray[ i ] === null );
    result += srcArray[ i ];
  }

  return result;
}

//

/**
 * The arrayCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 * // returns 3
 *
 * @example
 * _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
 * // returns 0
 *
 * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 * @function arrayCountUnique
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arrayCountUnique( src, onEvaluate )
{
  let found = [];
  onEvaluate = onEvaluate || function( e ){ return e };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( src ), 'arrayCountUnique :', 'Expects ArrayLike' );
  _.assert( _.routineIs( onEvaluate ) );
  _.assert( onEvaluate.length === 1 );

  for( let i1 = 0 ; i1 < src.length ; i1++ )
  {
    let element1 = onEvaluate( src[ i1 ] );
    if( found.indexOf( element1 ) !== -1 )
    continue;

    for( let i2 = i1+1 ; i2 < src.length ; i2++ )
    {

      let element2 = onEvaluate( src[ i2 ] );
      if( found.indexOf( element2 ) !== -1 )
      continue;

      if( element1 === element2 )
      found.push( element1 );

    }

  }

  return found.length;
}

// --
// array prepend
// --

/*

qqq : use for documentation

alteration Routines :

- array { Op } { Tense } { Second } { How }

alteration Op : [ Append , Prepend , Remove, Flatten ]        // operation
alteration Tense : [ - , ed ]                                 // what to return
alteration Second : [ -, element, array, array ]              // how to treat src arguments
alteration How : [ - , Once , OnceStrictly ]                  // how to treat repeats

~ 60 routines

*/

//

// function arrayPrepend_( dstArray )
// {
//   _.assert( arguments.length >= 1 );
//   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
//
//   dstArray = dstArray || [];
//
//   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
//   {
//     if( _.longIs( arguments[ a ] ) )
//     {
//       dstArray.unshift.apply( dstArray, arguments[ a ] );
//     }
//     else
//     {
//       dstArray.unshift( arguments[ a ] );
//     }
//   }
//
//   return dstArray;
// }

//

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
 * @memberof wTools
 */

function arrayPrependOnce( dstArray, ins, evaluator1, evaluator2 )
{
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
 * @memberof wTools
 */

function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
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
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  dstArray.unshift( ins );
  return 0;
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
 * @memberof wTools
 */

function arrayPrependedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return 0;
  }
  return -1;
}

//

function arrayPrependedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
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
 * @memberof wTools
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

function arrayPrependElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayPrependElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if ( Config.debug )
  {
    debugger;
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
  _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );

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
 * @memberof wTools
 */

function arrayPrependedElement( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  dstArray.unshift( ins );

  /* xxx qqq : should return element, not index */
  // return 0;
  return ins;
}

//

function arrayPrependedElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return dstArray[ 0 ];
  }
  return undefined;
}

//

function arrayPrependedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if ( Config.debug )
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
 * @memberof wTools
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
 * @memberof wTools
 */

function arrayPrependArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
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
 * @memberof wTools
 */

function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
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
 * @memberof wTools
 */

function arrayPrependedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArray :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArray :', 'Expects longIs' );

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
 * @memberof wTools
 */

function arrayPrependedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
  _.assert( _.longIs( insArray ) );
  // _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    let index = i;
    if( dstArray === insArray )
    index = i + result;

    if( _.arrayLeftIndex( dstArray, insArray[ index ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.unshift( insArray[ index ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayPrependedArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
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
 * @param{ longIs | * } arguments[...] - Source arguments.
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
 * @memberof wTools
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
 * @param{ longIs | * } arguments[...] - Source arguments.
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
 * @memberof wTools
 */

function arrayPrependArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
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
 * @param { longIs | * } arguments[...] - Source arguments.
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
 * @memberof wTools
 */

function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
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
      if( _.longIs( insArray[ i ] ) )
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
      if( _.longIs( insArray[ i ] ) )
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
 * @param{ longIs | * } arguments[...] - Source arguments.
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
 * @memberof wTools
 */

function arrayPrependedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArrays :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArrays :', 'Expects longIs entity' );

  let result = 0;

  if( dstArray === insArray )
  {
    result = insArray.length;
    dstArray.unshift.apply( dstArray, insArray );
    return result;
  }

  for( let a = 0, len = insArray.length ; a < len ; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
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
 * @param{ longIs | * } arguments[...] - Source arguments.
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
 * @memberof wTools
 */

function arrayPrependedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), 'arrayPrependedArraysOnce :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayPrependedArraysOnce :', 'Expects longIs entity' );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  function _prependOnce( element )
  {
    let index = _.arrayLeftIndex( dstArray, element, evaluator1, evaluator2 );
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
    if( _.longIs( insArray[ ii ] ) )
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

function arrayPrependedArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
 let result;
 if( Config.debug )
 {
   let expected = 0;
   let insIsDst = 0;
   for( let i = insArray.length - 1; i >= 0; i-- )
   {
     if( _.longIs( insArray[ i ] ) )
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
//     if( _.longIs( arguments[ a ] ) )
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

  arrayAppended.apply( this, arguments );
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
 * @memberof wTools
 */

function arrayAppendOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
  }
  else
  {
    result = arrayAppended.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

//

function arrayAppended( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.push( ins );
    return dstArray.length - 1;
  }

  return -1;
}

//

function arrayAppendedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );
  }
  else
  {
    result = arrayAppended.apply( this, [ dstArray, ins ] );
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
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedElementOnce( dstArray, ins )
{
  let i = _.arrayLeftIndex.apply( _, arguments );

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
* @memberof wTools
*/

function arrayAppendArray( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedArray.apply( this, arguments );
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
 * @memberof wTools
 */

function arrayAppendArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayAppendedArrayOnce.apply( this, arguments )
  return dstArray;
}

//

function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    let insArrayLength = insArray.length
    result = arrayAppendedArrayOnce.apply( this, arguments )
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
  _.assert( _.longIs( insArray ), 'arrayPrependedArray :', 'Expects longIs' );

  let result = insArray.length;
  dstArray.push.apply( dstArray, insArray );
  return result;
}

//

function arrayAppendedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.longIs( insArray ) );
  // _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
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
    result = arrayAppendedArrayOnce.apply( this, arguments );
    _.assert( result === insArrayLength , 'Array should have only unique elements, but has several', ins );
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

function arrayAppendArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{

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

function arrayAppendArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
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
      if( _.longIs( insArray[ i ] ) )
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

  if( !_.longIs( insArray ) && insArray !== undefined )
  insArray = [ insArray ];

  // if( !_.longIs( insArray ) )
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
  _.assert( _.longIs( insArray ), 'Expects longIs entity' );

  let result = 0;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
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

function arrayAppendedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( dstArray === undefined )
  return insArray;

  if( !_.arrayIs( insArray ) && insArray !== undefined )
  insArray = [ insArray ];

  _.assert( _.arrayIs( dstArray ), 'Expects array' );
  _.assert( _.longIs( insArray ), 'Expects longIs entity' );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return result;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
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
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
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
      if( _.longIs( ins[ i ] ) )
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
// array remove
// --

/**
 * ArrayRemove, arrayRemoveOnce, arrayRemoveOnceStrictly and arrayRemoved behave just like
 * arrayRemoveElement, arrayRemoveElementOnce, arrayRemoveElementOnceStrictly and arrayRemovedElement.
 */

function arrayRemove( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemoved.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemoveElementOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoved( dstArray, ins, evaluator1, evaluator2 )
{
  let removedElements = arrayRemovedElement.apply( this, arguments );
  return removedElements;
}

//

/**
 * ArrayRemovedOnce and arrayRemovedOnceStrictly behave just like arrayRemovedElementOnce and arrayRemovedElementOnceStrictly,
 * but return the index of the removed element, instead of the removed element
 */

function arrayRemovedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  dstArray.splice( index, 1 );

  return index;
}

//

function arrayRemovedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  let newIndex = _.arrayLeftIndex.apply( _, arguments );
  _.assert( newIndex < 0, () => 'The element ' + _.toStrShort( ins ) + ' is several times in dstArray' );

  return index;
}

//

function arrayRemoveElement( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedElement.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayRemoveElementOnce() routine removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins )]{@link wTools.arrayRemovedElementOnce}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElementOnce}
 * @see  wTools.arrayRemovedElementOnce
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * _.arrayRemoveElementOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
 * // returns [ 1, 2, 3, 'str' ]
 *
 * @example
 * _.arrayRemoveElementOnce( [ 3, 7, 33, 13, 33 ], 13, function( el, ins ) {
 *   return el > ins;
 * });
 * // returns [ 3, 7, 13, 33 ]
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveElementOnce
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemoveElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let result = arrayRemovedElementOnce.apply( this, arguments );
    let index = _.arrayLeftIndex.apply( _, arguments );
    _.assert( index < 0 );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  }
  else
  {
    let result = arrayRemovedElement.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

/*
function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result = arrayRemovedElementOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/

//

function arrayRemovedElement( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( this, arguments );
  let removedElements = 0;

  for( let i = 0; i < dstArray.length; i++ )
  {
    if( index !== -1 )
    {
      dstArray.splice( index, 1 );
      removedElements = removedElements + 1;
      i = i - 1 ;
    }
    index = _.arrayLeftIndex.apply( this, arguments );
  }

  return removedElements;
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
 * The arrayRemovedElementOnce() routine returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls built in function(dstArray.indexOf(ins))
 * that looking for the value of the (ins) in the (dstArray).
 * If true, it removes the value (ins) from (dstArray) array by corresponding index.
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayLeftIndex( dstArray, ins, onEvaluate )]{@link wTools.arrayLeftIndex}
 * If callback function(onEvaluate) returns true, it returns the index that will be removed from (dstArray).
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * _.arrayRemovedElementOnce( [ 2, 4, 6 ], 4, function( el ) {
 *   return el;
 * });
 * // returns 1
 *
 * @example
 * _.arrayRemovedElementOnce( [ 2, 4, 6 ], 2 );
 * // returns 0
 *
 * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
 * @function arrayRemovedElementOnce
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemovedElementOnce( dstArray, ins, evaluator1, evaluator2 )
{

  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  dstArray.splice( index, 1 );

  return index;
  /* "!!! : breaking" */
  /* // arrayRemovedElementOnce should return the removed element
  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );

  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }

  return result;
  */
}

//

function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  index = _.arrayLeftIndex.apply( _, arguments );
  _.assert( index < 0, () => 'The element ' + _.toStrShort( ins ) + ' is several times in dstArray' );

  return result;
}

/*
function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  return result;
}
*/

//

function arrayRemoveArray( dstArray, insArray )
{
  arrayRemovedArray.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayRemovedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let insArrayLength = insArray.length;
    result = arrayRemovedArrayOnce.apply( this, arguments );
    let index = - 1;
    for( let i = 0, len = insArray.length; i < len ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      _.assert( index < 0 );
    }
    _.assert( result === insArrayLength );

  }
  else
  {
    result = arrayRemovedArray.apply( this, [ dstArray, insArray ] );
  }
  return dstArray;
}

/*
function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

function arrayRemovedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2 )
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
  _.assert( _.longIs( insArray ) );
  // _.assert( dstArray !== insArray );

  if( dstArray === insArray )
  return dstArray.splice( 0 ).length;

  let result = 0;
  let index = -1;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    index = dstArray.indexOf( insArray[ i ] );
    while( index !== -1 )
    {
      dstArray.splice( index, 1 );
      result += 1;
      index = dstArray.indexOf( insArray[ i ], index );
    }
  }

  return result;
}

//

/**
 * The callback function to compare two values.
 *
 * @callback arrayRemovedArrayOnce~onEvaluate
 * @param { * } el - The element of the (dstArray[n]) array.
 * @param { * } ins - The value to compare (insArray[n]).
 */

/**
 * The arrayRemovedArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
 * and returns amount of the deleted elements from the (dstArray).
 *
 * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqualize) arguments, creates variable (let result = 0),
 * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function(dstArray.indexOf(insArray[i])).
 * that looking for the value of the (insArray[i]) array in the (dstArray) array.
 * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
 * and incrementing the variable (result++).
 * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the routine
 *
 * If callback function(onEqualize) returns true, it returns the index that will be removed from (dstArray),
 * and then incrementing the variable (result++).
 *
 * @see wTools.arrayLeftIndex
 *
 * @param { longIs } dstArray - The target array.
 * @param { longIs } insArray - The source array.
 * @param { function } onEqualize - The callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * _.arrayRemovedArrayOnce( [  ], [  ] );
 * // returns 0
 *
 * @example
 * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
 * // returns 2
 *
 * @example
 * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
 *   return a < b;
 * } );
 * // returns 4
 *
 * @returns { number }  Returns amount of the deleted elements from the (dstArray).
 * @function arrayRemovedArrayOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (insArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
 * @memberof wTools
 */

function arrayRemovedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
  _.assert( _.longIs( insArray ) );
  // _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( dstArray === insArray )
  if( arguments.length === 2 )
  return dstArray.splice( 0 ).length;

  let result = 0;
  let index = -1;

  for( let i = insArray.length - 1; i >= 0 ; i-- )
  {
    index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );

    if( index >= 0 )
    {
      dstArray.splice( index, 1 );
      result += 1;
    }
  }

  return result;
}

//

function arrayRemovedArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let insArrayLength = insArray.length;
    result = arrayRemovedArrayOnce.apply( this, arguments );
    let index = - 1;
    for( let i = 0, len = insArray.length; i < len ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      _.assert( index < 0 );
    }
    _.assert( result === insArrayLength );

  }
  else
  {
    result = arrayRemovedArray.apply( this, [ dstArray, insArray ] );
  }
  return result;
}

//

function arrayRemoveArrays( dstArray, insArray )
{
  arrayRemovedArrays.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayRemovedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    result = arrayRemovedArraysOnce.apply( this, arguments );

    _.assert( result === expected );
    _.assert( arrayRemovedArraysOnce.apply( this, arguments ) === 0 );
  }
  else
  {
    result = arrayRemovedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArraysOnce.apply( this, arguments );

  let expected = 0;
  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.longIs( insArray[ i ] ) )
    expected += insArray[ i ].length;
    else
    expected += 1;
  }

  _.assert( result === expected );

  return dstArray;
}
*/

//

function arrayRemovedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'arrayRemovedArrays :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayRemovedArrays :', 'Expects longIs entity' );

  let result = 0;

  if( dstArray === insArray )
  {
    result = insArray.length;
    dstArray.splice( 0 );
    return result;
  }

  function _remove( argument )
  {
    let index = dstArray.indexOf( argument );
    while( index !== -1 )
    {
      dstArray.splice( index, 1 );
      result += 1;
      index = dstArray.indexOf( argument, index );
    }
  }

  for( let a = insArray.length - 1; a >= 0; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = array.length - 1; i >= 0; i-- )
      _remove( array[ i ] );
    }
    else
    {
      _remove( insArray[ a ] );
    }
  }

  return result;
}

//

function arrayRemovedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), 'arrayRemovedArraysOnce :', 'Expects array' );
  _.assert( _.longIs( insArray ), 'arrayRemovedArraysOnce :', 'Expects longIs entity' );

  let result = 0;

  if( dstArray === insArray )
  if( arguments.length === 2 )
  {
    result = insArray.length;
    dstArray.splice( 0 );
    return result;
  }

  function _removeOnce( argument )
  {
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
    if( index >= 0 )
    {
      dstArray.splice( index, 1 );
      result += 1;
    }
  }

  for( let a = insArray.length - 1; a >= 0; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = array.length - 1; i >= 0; i-- )
      _removeOnce( array[ i ] );
    }
    else
    {
      _removeOnce( insArray[ a ] );
    }
  }

  return result;
}

//

function arrayRemovedArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    result = arrayRemovedArraysOnce.apply( this, arguments );

    _.assert( result === expected );
    _.assert( arrayRemovedArraysOnce.apply( this, arguments ) === 0 );
  }
  else
  {
    result = arrayRemovedArrays.apply( this, [ dstArray, insArray ] );
  }

  return result;
}

//

/**
 * The arrayRemoveDuplicates( dstArray, evaluator ) routine returns the dstArray with the duplicated elements removed.
 *
 * @param { ArrayIs } dstArray - The source and destination array.
 * @param { Function } [ evaluator = function( e ) { return e } ] - A callback function.
 *
 * @example
 * _.arrayRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 * // returns [ 1, 2, 'abc', 4, true ]
 *
 * @example
 * _.arrayRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 * // returns [ 1, 2, 3, 4, 5 ]
 *
 * @returns { Number } - Returns the source array without the duplicated elements.
 * @function arrayRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'Expects Array' );

  for( let i = 0 ; i < dstArray.length ; i++ )
  {
    let index;
    do
    {
      index = _.arrayRightIndex( dstArray, dstArray[ i ], evaluator );
      if( index !== i )
      {
        dstArray.splice( index, 1 );
      }
    }
    while( index !== i );
  }

  return dstArray;
}

/*
/*
function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'arrayRemoveDuplicates :', 'Expects Array' );

  for( let i1 = 0 ; i1 < dstArray.length ; i1++ )
  {
    let element1 = dstArray[ i1 ];
    let index = _.arrayRightIndex( dstArray, element1, evaluator );

    while ( index !== i1 )
    {
      dstArray.splice( index, 1 );
      index = _.arrayRightIndex( dstArray, element1, evaluator );
    }
  }

  return dstArray;
}
*/

// --
// array flatten
// --

/**
 * The arrayFlatten() routine returns an array that contains all the passed arguments.
 *
 * It creates two variables the (result) - array and the {-srcMap-} - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the {-srcMap-} each element,
 * checks if {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds element to the result.
 * If {-srcMap-} is an Array and if element(s) of the {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds to the (result) each element of the {-srcMap-} array.
 * Otherwise, if {-srcMap-} is an Array and if element(s) of the {-srcMap-} is equal to the 'undefined' it throws an Error.
 *
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
 * // returns [ 'str', {}, 1, 2, 5, true ]
 *
 * @returns { Array } - Returns an array of the passed argument(s).
 * @function arrayFlatten
 * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
 * @memberof wTools
 */

function arrayFlatten( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattened.apply( this, arguments );

  return dstArray;
}

//

function arrayFlattenOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattenedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayFlattenedOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattened( dstArray, src )
{
  let result = 0;
  let length = dstArray.length;
  let visited = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectIs( this ) );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  if( arguments.length === 1 )
  {
    for( let i = 0 ; i < dstArray.length ; i++ )
    {
      let e = dstArray[ i ];
      if( _.longLike( e ) || _.setLike( e ) )
      {
        dstArray.splice( i, 1 );
        if( e !== dstArray )
        i = containerReplace( e, i );
        i -= 1;
      }
      // else
      // {
      //   result += 1;
      // }
    }

    return dstArray;  // Dmytro : it has no sence to count result and return dstArray
  }

  if( _.arrayHas( dstArray, dstArray ) ) // Dmytro : stack is unstable if dstArray.push( dstArray )
  {
    let i = _.arrayLeftIndex( dstArray, dstArray );

    while( i !== -1 )
    {
      dstArray.splice( i, 1 );
      i = _.arrayLeftIndex( dstArray, dstArray );
    }
  }

  if( _.longLike( src ) || _.setLike( src ) )
  {
    containerAppend( src );
  }
  else
  {
    dstArray.push( src );
    result += 1;
  }

  return result;

  /* */

  function containerAppend( src )
  {
    if( _.arrayHas( visited, src ) )
    return;
    visited.push( src );

    let count;
    if( src === dstArray )
    count = length;
    else
    count = src.length;

    for( let e of src )
    {
      if( count < 1 )
      break;
      count--;

      if( _.longLike( e ) || _.setLike( e ) )
      {
        containerAppend( e )
      }
      else
      {
        dstArray.push( e );
        result += 1;
      }
    }

    visited.pop();
  }

  /* */

  function containerReplace( src, index )
  {
    // dstArray.splice( index, 1 );
    // result -= 1;
    for( let e of src )
    {
      if( _.longLike( e ) || _.setLike( e ) )
      {
        index = containerReplace( e, index );
      }
      else
      {
        dstArray.splice( index, 0, e );
        // result += 1;
        index += 1;
      }
    }
    return index;
  }

}

//

function arrayFlattenedOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = 0;
  let length = dstArray.length;
  let visited = [];

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  if( arguments.length === 1 )
  {
    _.arrayRemoveDuplicates( dstArray );

    for( let i = 0 ; i < dstArray.length ; i++ )
    {
      let e = dstArray[ i ];
      if( _.longLike( e ) || _.setLike( e ) )
      {
        dstArray.splice( i, 1 );
        if( e !== dstArray )
        i = containerReplace( e, i );
        i -= 1;
      }
      // else
      // {
      //   result += 1;
      // }
    }

    return dstArray;
  }

  if( _.arrayHas( dstArray, dstArray ) )
  {
    let i = _.arrayLeftIndex( dstArray, dstArray );

    while( i !== -1 )
    {
      dstArray.splice( i, 1 );
      i = _.arrayLeftIndex( dstArray, dstArray );
    }
  }

  if( _.longLike( insArray ) || _.setLike( insArray ) )
  {
    containerAppend( insArray );
  }
  else if( _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 ) === -1 )
  {
    dstArray.push( insArray );
    result += 1;
  }

  return result;

  /* */

  function containerAppend( src )
  {
    if( _.arrayHas( visited, src ) )
    return;
    visited.push( src );

    let count;
    if( src === dstArray )
    count = length;
    else
    count = src.length;


    for( let e of src )
    {
      if( count < 1 )
      break;
      count--;

      if( _.longLike( e ) || _.setLike( e ) )
      {
        containerAppend( e )
      }
      else if( _.arrayLeftIndex( dstArray, e, evaluator1, evaluator2 ) === -1 )
      {
        dstArray.push( e );
        result += 1;
      }
    }

    visited.pop();
  }

  /* */

  function containerReplace( src, index )
  {
    for( let e of src )
    {
      if( _.longLike( e ) || _.setLike( e ) )
      {
        index = containerReplace( e, index );
      }
      else if( _.arrayLeftIndex( dstArray, e ) === -1 )
      {
        dstArray.splice( index, 0, e );
        // result += 1;
        index += 1;
      }
    }
    return index;
  }
}

// function arrayFlattenedOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//
//   _.assert( arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
//
//   if( arguments.length === 1 )
//   {
//     _.arrayRemoveDuplicates( dstArray );
//
//     for( let i = dstArray.length-1; i >= 0; --i )
//     if( _.longIs( dstArray[ i ] ) )
//     {
//       let insArray = dstArray[ i ];
//       dstArray.splice( i, 1 );
//       onLongOnce( insArray, i );
//     }
//     return dstArray;
//   }
//
//   let result = 0;
//
//   if( _.longIs( insArray ) )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
//       if( _.longIs( insArray[ i ] ) )
//       {
//         let c = _.arrayFlattenedOnce( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         result += c;
//       }
//       else
//       {
//         let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         if( index === -1 )
//         {
//           dstArray.push( insArray[ i ] );
//           result += 1;
//         }
//       }
//     }
//   }
//   else
//   {
//
//     _.assert( insArray !== undefined, 'The Array should have no undefined' );
//
//     let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
//     if( index === -1 )
//     {
//       dstArray.push( insArray );
//       result += 1;
//     }
//   }
//
//   return result;
//
//   /* */
//
//   function onLongOnce( insArray, insIndex )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       onLongOnce( insArray[ i ], insIndex )
//       else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
//       dstArray.splice( insIndex++, 0, insArray[ i ] );
//     }
//   }
// }

//

function arrayFlattenedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = 0;
  let visited = [];

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  let oldLength = dstArray.length;
  _.arrayRemoveDuplicates( dstArray );
  let newLength = dstArray.length;
  if( Config.debug )
  _.assert( oldLength === newLength, 'Elements in dstArray must not be repeated' );

  if( arguments.length === 1 )
  {
    for( let i = 0 ; i < dstArray.length ; i++ )
    {
      let e = dstArray[ i ];
      if( _.longLike( e ) || _.setLike( e ) )
      {
        dstArray.splice( i, 1 );
        if( e !== dstArray )
        i = containerReplace( e, i );
        i -= 1;
      }
      // else
      // {
      //   result += 1;
      // }
    }

    return dstArray;
  }

  if( _.arrayHas( dstArray, dstArray ) )
  {
    let i = _.arrayLeftIndex( dstArray, dstArray );

    while( i !== -1 )
    {
      dstArray.splice( i, 1 );
      i = _.arrayLeftIndex( dstArray, dstArray );
    }
  }

  if( _.longLike( insArray ) || _.setLike( insArray ) )
  {
    containerAppend( insArray );
  }
  else if( _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 ) === -1 )
  {
    _.assert( insArray !== undefined, 'The container should be no undefined' );

    dstArray.push( insArray );
    result += 1;
  }
  else if( Config.debug )
  _.assert( 0, 'Elements must not be repeated' );

  return result;

  /* */

  function containerAppend( src )
  {
    if( _.arrayHas( visited, src ) )
    return;
    visited.push( src );

    let count;
    if( src === dstArray )
    count = oldLength;
    else
    count = src.length;


    for( let e of src )
    {
      if( count < 1 )
      break;
      count--;

      _.assert( e !== undefined, 'The container should have no undefined' );

      if( _.longLike( e ) || _.setLike( e ) )
      {
        containerAppend( e )
      }
      else if( _.arrayLeftIndex( dstArray, e, evaluator1, evaluator2 ) === -1 )
      {
        dstArray.push( e );
        result += 1;
      }
      else if( Config.debug )
      _.assert( 0, 'Elements must not be repeated' );

    }

    visited.pop();
  }

  /* */

  function containerReplace( src, index )
  {
    for( let e of src )
    {
      if( _.longLike( e ) || _.setLike( e ) )
      {
        index = containerReplace( e, index );
      }
      else if( _.arrayLeftIndex( dstArray, e ) === -1 )
      {
        dstArray.splice( index, 0, e );
        // result += 1;
        index += 1;
      }
    }
    return index;
  }

}

// function arrayFlattenedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//
//   _.assert( arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
//
//   let oldLength = dstArray.length;
//   _.arrayRemoveDuplicates( dstArray );
//   let newLength = dstArray.length;
//   if( Config.debug )
//   _.assert( oldLength === newLength, 'Elements in dstArray must not be repeated' );
//
//
//   if( arguments.length === 1 )
//   {
//     for( let i = dstArray.length-1; i >= 0; --i )
//     if( _.longIs( dstArray[ i ] ) )
//     {
//       let insArray = dstArray[ i ];
//       dstArray.splice( i, 1 );
//       onLongOnce( insArray, i );
//     }
//     return dstArray;
//   }
//
//   let result = 0;
//
//   if( _.longIs( insArray ) )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
//       if( _.longIs( insArray[ i ] ) )
//       {
//         let c = _.arrayFlattenedOnceStrictly( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         result += c;
//       }
//       else
//       {
//         let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         if( Config.debug )
//         _.assert( index === -1, 'Elements must not be repeated' );
//
//         if( index === -1 )
//         {
//           dstArray.push( insArray[ i ] );
//           result += 1;
//         }
//       }
//     }
//   }
//   else
//   {
//     _.assert( insArray !== undefined, 'The Array should have no undefined' );
//     let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
//     if( Config.debug )
//     _.assert( index === -1, 'Elements must not be repeated' );
//
//     if( index === -1 )
//     {
//       dstArray.push( insArray );
//       result += 1;
//     }
//   }
//
//   return result;
//
//   /* */
//
//   function onLongOnce( insArray, insIndex )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       onLongOnce( insArray[ i ], insIndex )
//       else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
//       dstArray.splice( insIndex++, 0, insArray[ i ] );
//       else if( Config.debug )
//       _.assert( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1, 'Elements must not be repeated' );
//     }
//   }
// }

//

function arrayFlattenDefined( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattenedDefined.apply( this, arguments );

  return dstArray;
}

//

function arrayFlattenDefinedOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayFlattenedDefinedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenDefinedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayFlattenedDefinedOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenedDefined( dstArray, src )
{
  let result = 0;
  let length = dstArray.length;
  let visited = [];

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectIs( this ) );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  if( arguments.length === 1 )
  {
    for( let i = 0 ; i < dstArray.length ; i++ )
    {
      let e = dstArray[ i ];

      if( e === undefined )
      {
        dstArray.splice( i, 1 );
        i -= 1;
      }
      else if( _.longLike( e ) || _.setLike( e ) )
      {
        dstArray.splice( i, 1 );
        if( e !== dstArray )
        i = containerReplace( e, i );
        i -= 1;
      }
      // else
      // {
      //   result += 1;
      // }
    }

    return dstArray;
  }

  if( _.arrayHas( dstArray, dstArray ) )
  {
    let i = _.arrayLeftIndex( dstArray, dstArray );

    while( i !== -1 )
    {
      dstArray.splice( i, 1 );
      i = _.arrayLeftIndex( dstArray, dstArray );
    }
  }

  if( _.longLike( src ) || _.setLike( src ) )
  {
    containerAppend( src );
  }
  else if( src !== undefined )
  {
    dstArray.push( src );
    result += 1;
  }

  return result;

  /* */

  function containerAppend( src )
  {
    if( _.arrayHas( visited, src ) )
    return;
    visited.push( src );

    let count;
    if( src === dstArray )
    count = length;
    else
    count = src.length;

    for( let e of src )
    {
      if( count < 1 )
      break;
      count--;

      if( _.longLike( e ) || _.setLike( e ) )
      {
        containerAppend( e )
      }
      else
      {
        if( e !== undefined )
        {
          dstArray.push( e );
          result += 1;
        }
      }
    }

    visited.pop();
  }

  /* */

  function containerReplace( src, index )
  {
    for( let e of src )
    {
      if( _.longLike( e ) || _.setLike( e ) )
      {
        index = containerReplace( e, index );
      }
      else
      {
        if( e !== undefined )
        {
          dstArray.splice( index, 0, e );
          // result += 1;
          index += 1;
        }
      }
    }
    return index;
  }

}

// function arrayFlattenedDefined( dstArray, insArray )
// {
//
//   _.assert( arguments.length >= 1 );
//   _.assert( _.objectIs( this ) );
//   _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
//
//   if( arguments.length === 1 )
//   {
//     for( let i = dstArray.length-1; i >= 0; --i )
//     if( _.longIs( dstArray[ i ] ) )
//     {
//       let insArray = dstArray[ i ];
//       dstArray.splice( i, 1 );
//       onLong( insArray, i );
//     }
//     return dstArray;
//   }
//
//   let result = 0;
//
//   for( let a = 1 ; a < arguments.length ; a++ )
//   {
//     let insArray = arguments[ a ];
//
//     if( _.longIs( insArray ) )
//     {
//       for( let i = 0, len = insArray.length; i < len; i++ )
//       {
//         if( _.longIs( insArray[ i ] ) )
//         {
//           let c = _.arrayFlattenedDefined( dstArray, insArray[ i ] );
//           result += c;
//         }
//         else
//         {
//           // _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
//           if( insArray[ i ] !== undefined )
//           {
//             dstArray.push( insArray[ i ] );
//             result += 1;
//           }
//         }
//       }
//     }
//     else
//     {
//       _.assert( insArray !== undefined, 'The Array should have no undefined' );
//       if( insArray !== undefined )
//       {
//         dstArray.push( insArray );
//         result += 1;
//       }
//     }
//
//   }
//
//   return result;
//
//   /* */
//
//   function onLong( insArray, insIndex )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       onLong( insArray[ i ], insIndex )
//       else
//       dstArray.splice( insIndex++, 0, insArray[ i ] );
//     }
//   }
//
// }

//

function arrayFlattenedDefinedOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = 0;
  let length = dstArray.length;
  let visited = [];

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  if( arguments.length === 1 )
  {
    _.arrayRemoveDuplicates( dstArray );

    for( let i = 0 ; i < dstArray.length ; i++ )
    {
      let e = dstArray[ i ];
      if( e === undefined )
      {
        dstArray.splice( i, 1 );
        i -= 1;
      }
      if( _.longLike( e ) || _.setLike( e ) )
      {
        dstArray.splice( i, 1 );
        if( e !== dstArray )
        i = containerReplace( e, i );
        i -= 1;
      }
      // else
      // {
      //   result += 1;
      // }
    }

    return dstArray;
  }

  if( _.arrayHas( dstArray, dstArray ) )
  {
    let i = _.arrayLeftIndex( dstArray, dstArray );

    while( i !== -1 )
    {
      dstArray.splice( i, 1 );
      i = _.arrayLeftIndex( dstArray, dstArray );
    }
  }

  if( _.longLike( insArray ) || _.setLike( insArray ) )
  {
    containerAppend( insArray );
  }
  else if( insArray !== undefined )
  {
    if( _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 ) === -1)
    {
      dstArray.push( insArray );
      result += 1;
    }
  }

  return result;

  /* */

  function containerAppend( src )
  {
    if( _.arrayHas( visited, src ) )
    return;
    visited.push( src );

    let count;
    if( src === dstArray )
    count = length;
    else
    count = src.length;


    for( let e of src )
    {
      if( count < 1 )
      break;
      count--;

      if( _.longLike( e ) || _.setLike( e ) )
      {
        containerAppend( e )
      }
      else if( e !== undefined )
      {
        if( _.arrayLeftIndex( dstArray, e, evaluator1, evaluator2 ) === -1 )
        {
          dstArray.push( e );
          result += 1;
        }
      }
    }

    visited.pop();
  }

  /* */

  function containerReplace( src, index )
  {
    for( let e of src )
    {
      if( _.longLike( e ) || _.setLike( e ) )
      {
        index = containerReplace( e, index );
      }
      else if( e !== undefined )
      {
        if( _.arrayLeftIndex( dstArray, e ) === -1 )
        {
          dstArray.splice( index, 0, e );
          // result += 1;
          index += 1;
        }
      }
    }
    return index;
  }
}

// function arrayFlattenedDefinedOnce( dstArray, insArray, evaluator1, evaluator2 )
// {
//
//   _.assert( arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
//
//   if( arguments.length === 1 )
//   {
//     _.arrayRemoveDuplicates( dstArray );
//
//     for( let i = dstArray.length-1; i >= 0; --i )
//     if( _.longIs( dstArray[ i ] ) )
//     {
//       let insArray = dstArray[ i ];
//       dstArray.splice( i, 1 );
//       onLongOnce( insArray, i );
//     }
//     return dstArray;
//   }
//
//   let result = 0;
//
//   if( _.longIs( insArray ) )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       _.assert( insArray[ i ] !== undefined );
//       if( _.longIs( insArray[ i ] ) )
//       {
//         let c = _.arrayFlattenedDefinedOnce( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         result += c;
//       }
//       else
//       {
//         let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         if( index === -1 )
//         {
//           dstArray.push( insArray[ i ] );
//           result += 1;
//         }
//       }
//     }
//   }
//   else if( insArray !== undefined )
//   {
//
//     let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
//     if( index === -1 )
//     {
//       dstArray.push( insArray );
//       result += 1;
//     }
//   }
//
//   return result;
//
//   /* */
//
//   function onLongOnce( insArray, insIndex )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       onLongOnce( insArray[ i ], insIndex )
//       else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
//       dstArray.splice( insIndex++, 0, insArray[ i ] );
//     }
//   }
//
// }

//

function arrayFlattenedDefinedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = 0;
  let visited = [];

  _.assert( arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );

  let oldLength = dstArray.length;
  _.arrayRemoveDuplicates( dstArray );
  let newLength = dstArray.length;
  if( Config.debug )
  _.assert( oldLength === newLength, 'Elements in dstArray must not be repeated' );

  if( arguments.length === 1 )
  {
    for( let i = 0 ; i < dstArray.length ; i++ )
    {
      let e = dstArray[ i ];
      if( e === undefined )
      {
        dstArray.splice( i, 1 );
        i -= 1;
      }
      else if( _.longLike( e ) || _.setLike( e ) )
      {
        dstArray.splice( i, 1 );
        if( e !== dstArray )
        i = containerReplace( e, i );
        i -= 1;
      }
      // else
      // {
      //   result += 1;
      // }
    }

    return dstArray;
  }

  if( _.arrayHas( dstArray, dstArray ) )
  {
    let i = _.arrayLeftIndex( dstArray, dstArray );

    while( i !== -1 )
    {
      dstArray.splice( i, 1 );
      i = _.arrayLeftIndex( dstArray, dstArray );
    }
  }

  if( _.longLike( insArray ) || _.setLike( insArray ) )
  {
    containerAppend( insArray );
  }
  else if( insArray !== undefined )
  {
    if( _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 ) === -1 )
    {
      dstArray.push( insArray );
      result += 1;
    }
    else if( Config.debug )
    _.assert( 0, 'Elements must not be repeated' );
  }

  return result;

  /* */

  function containerAppend( src )
  {
    if( _.arrayHas( visited, src ) )
    return;
    visited.push( src );

    let count;
    if( src === dstArray )
    count = oldLength;
    else
    count = src.length;


    for( let e of src )
    {
      if( count < 1 )
      break;
      count--;

      if( _.longLike( e ) || _.setLike( e ) )
      {
        containerAppend( e )
      }
      else if( e !== undefined )
      {
        if( _.arrayLeftIndex( dstArray, e, evaluator1, evaluator2 ) === -1 )
        {
          dstArray.push( e );
          result += 1;
        }
        else if( Config.debug )
        _.assert( 0, 'Elements must not be repeated' );
      }
    }

    visited.pop();
  }

  /* */

  function containerReplace( src, index )
  {
    for( let e of src )
    {
      if( _.longLike( e ) || _.setLike( e ) )
      {
        index = containerReplace( e, index );
      }
      else if( e !== undefined )
      {
        if( _.arrayLeftIndex( dstArray, e ) === -1 )
        {
          dstArray.splice( index, 0, e );
          // result += 1;
          index += 1;
        }
        else if( Config.debug )
        _.assert( 0, 'Elements must not be repeated' );
      }
    }
    return index;
  }

}

// function arrayFlattenedDefinedOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
// {
//
//   _.assert( arguments.length && arguments.length <= 4 );
//   _.assert( _.arrayIs( dstArray ), () => 'Expects array as the first argument {-dstArray-} ' + 'but got ' + _.strQuote( dstArray ) );
//
//   let oldLength = dstArray.length;
//   _.arrayRemoveDuplicates( dstArray );
//   let newLength = dstArray.length;
//   if( Config.debug )
//   _.assert( oldLength === newLength, 'Elements in dstArray must not be repeated' );
//
//
//   if( arguments.length === 1 )
//   {
//     for( let i = dstArray.length-1; i >= 0; --i )
//     if( _.longIs( dstArray[ i ] ) )
//     {
//       let insArray = dstArray[ i ];
//       dstArray.splice( i, 1 );
//       onLongOnce( insArray, i );
//     }
//     return dstArray;
//   }
//
//   let result = 0;
//
//   if( _.longIs( insArray ) )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       // _.assert( insArray[ i ] !== undefined );
//       if( insArray[ i ] === undefined )
//       {
//       }
//       else if( _.longIs( insArray[ i ] ) )
//       {
//         let c = _.arrayFlattenedDefinedOnceStrictly( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         result += c;
//       }
//       else
//       {
//         let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
//         if( Config.debug )
//         _.assert( index === -1, 'Elements must not be repeated' );
//         if( index === -1 )
//         {
//           dstArray.push( insArray[ i ] );
//           result += 1;
//         }
//       }
//     }
//   }
//   else if( insArray !== undefined )
//   {
//
//     let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
//     if( Config.debug )
//     _.assert( index === -1, 'Elements must not be repeated' );
//
//     if( index === -1 )
//     {
//       dstArray.push( insArray );
//       result += 1;
//     }
//   }
//
//   return result;
//
//   /* */
//
//   function onLongOnce( insArray, insIndex )
//   {
//     for( let i = 0, len = insArray.length; i < len; i++ )
//     {
//       if( _.longIs( insArray[ i ] ) )
//       onLongOnce( insArray[ i ], insIndex )
//       else if( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1 )
//       dstArray.splice( insIndex++, 0, insArray[ i ] );
//       else if( Config.debug )
//       _.assert( _.arrayLeftIndex( dstArray, insArray[ i ] ) === -1, 'Elements must not be repeated' );
//     }
//   }
// }

// --
// array replace
// --

//

function arrayReplace( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return dstArray;
}

/**
 * The arrayReplaceOnce() routine returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 *
 * It takes three arguments (dstArray, ins, sub), calls built in function(dstArray.indexOf(ins)),
 * that looking for value (ins) in the (dstArray).
 * If true, it replaces (ins) value of (dstArray) by (sub) and returns the index of the (ins).
 * Otherwise, it returns (-1) index.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to find.
 * @param { * } sub - The value to replace.
 *
 * @example
 * _.arrayReplaceOnce( [ 2, 4, 6, 8, 10 ], 12, 14 );
 * // returns -1
 *
 * @example
 * _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
 * // returns 1
 *
 * @example
 * _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
 * // returns 3
 *
 * @example
 * _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
 * // returns 4
 *
 * @returns { number }  Returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 * @function arrayReplaceOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array.
 * @throws { Error } Will throw an Error if (arguments.length) is less than three.
 * @memberof wTools
 */

function arrayReplaceOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  arrayReplacedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result < 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedOnce.apply( this, arguments );
  }
  return dstArray;
}

/*
function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/

//

function arrayReplaced( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return result;
}

//

function arrayReplacedOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  if( _.longIs( ins ) )
  {
    _.assert( _.longIs( sub ) );
    _.assert( ins.length === sub.length );
  }

  let index = -1;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  if( index >= 0 )
  dstArray.splice( index, 1, sub );

  return index;
}

//

function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;

  if( Config.debug )
  {
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
    let newResult = arrayReplacedOnce.apply( this, arguments );
    _.assert( newResult < 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedOnce.apply( this, arguments );
  }

  return result;
}

//

function arrayReplaceElement( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return dstArray;
}

//

function arrayReplaceElementOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  arrayReplacedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceElementOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( result !== undefined, () => 'Array does not have element ' + _.toStrShort( ins ) );
    result = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( result === undefined, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
  }
  return dstArray;
}

//

function arrayReplacedElement( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index, 1, sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return result;
}

//

function arrayReplacedElementOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  if( _.longIs( ins ) )
  {
    _.assert( _.longIs( sub ) );
    _.assert( ins.length === sub.length );
  }

  let index = -1;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  if( index >= 0 )
  dstArray.splice( index, 1, sub );
  else
  return undefined;

  return ins;
}

//

function arrayReplacedElementOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( result !== undefined, () => 'Array does not have element ' + _.toStrShort( ins ) );
    let newResult = arrayReplacedElementOnce.apply( this, arguments );
    _.assert( newResult === undefined, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedElementOnce.apply( this, arguments );
  }

  return result;
}

/*
function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return result;
}
*/

//

function arrayReplaceArray( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArray.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArrayOnce( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    let insArrayLength = ins.length;
    result = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( result === insArrayLength, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( insArrayLength === sub.length, '{-subArray-} should have the same length {-insArray-} has' );

    if( dstArray === ins )
    return dstArray;

    let newResult = arrayReplacedArrayOnce.apply( this, arguments );

    _.assert( newResult === 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
  }

  return dstArray;
}

/*
function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result = arrayReplacedArrayOnce.apply( this, arguments );
  _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
  return dstArray;
}
*/

//

function arrayReplacedArray( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );
  _.assert( _.longIs( ins ) );
  _.assert( _.longIs( sub ) );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );

  let result = 0;
  let index = -1;
  // let oldDstArray = dstArray.slice();  // Array with src values stored
  if( dstArray === ins )
  ins = ins.slice();

  for( let i = 0, len = ins.length; i < len; i++ )
  {
    // let dstArray2 = oldDstArray.slice(); // Array modified for each ins element
    index = _.arrayLeftIndex( dstArray, ins[ i ], evaluator1, evaluator2 );
    while( index !== -1 )
    {
      let subValue = sub[ i ];
      let insValue = ins[ i ];
      if( subValue === undefined )
      {
        dstArray.splice( index, 1 );
        // dstArray2.splice( index, 1 );
      }
      else
      {
        dstArray.splice( index, 1, subValue );
        // dstArray2.splice( index, 1, subValue );
      }

      result += 1;

      // if( dstArray === ins )
      // break;

      if( subValue === insValue )
      break;

      index = _.arrayLeftIndex( dstArray, insValue, evaluator1, evaluator2 );
    }
  }

  return result;
}

//

function arrayReplacedArrayOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( _.longIs( ins ) );
  _.assert( _.longIs( sub ) );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  //let oldDstArray = dstArray.slice();  // Array with src values stored
  for( let i = 0, len = ins.length; i < len; i++ )
  {
    index = _.arrayLeftIndex( dstArray, ins[ i ], evaluator1, evaluator2 );
    if( index >= 0 )
    {
      let subValue = sub[ i ];
      if( subValue === undefined )
      dstArray.splice( index, 1 );
      else
      dstArray.splice( index, 1, subValue );
      result += 1;
    }
  }

  return result;
}

//

function arrayReplacedArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    let insArrayLength = ins.length
    result = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( result === insArrayLength, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( insArrayLength === sub.length, '{-subArray-} should have the same length {-insArray-} has' );

    if( dstArray === ins )
    return result;

    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'One element of ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this, arguments );
  }

  return result;
}

//

function arrayReplaceArrays( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArrays.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArraysOnce( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceArraysOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    let expected = 0;
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longIs( ins[ i ] ) )
      expected += ins[ i ].length;
      else
      expected += 1;
    }

    result = arrayReplacedArraysOnce.apply( this, arguments );

    _.assert( result === expected, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );

    if( dstArray === ins )
    return dstArray;

    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'One element of ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArraysOnce.apply( this, arguments );
  }

  return dstArray;

}

//

function arrayReplacedArrays( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );
  _.assert( _.arrayIs( dstArray ), 'arrayReplacedArrays :', 'Expects array' );
  _.assert( _.longIs( sub ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( _.longIs( ins ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );

  let result = 0;

  function _replace( dstArray, argument, subValue, evaluator1, evaluator2  )
  {
    // let dstArray2 = oldDstArray.slice();
    //let index = dstArray.indexOf( argument );
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );

    while( index !== -1 )
    {
      // dstArray2.splice( index, 1, subValue );
      dstArray.splice( index, 1, subValue );
      result += 1;
      if( subValue === argument )
      break;
      index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
    }
  }

  let insCopy = Object.create( null );
  let subCopy = Object.create( null );

  if( dstArray === ins )
  {
    ins = ins.slice();
  }
  else
  {
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longIs( ins[ i ] ) )
      if( ins[ i ] === dstArray )
      insCopy[ i ] = ins[ i ].slice();

      if( _.longIs( sub[ i ] ) )
      if( sub[ i ] === dstArray )
      subCopy[ i ] = sub[ i ].slice();
    }
  }

  for( let a = 0, len = ins.length; a < len; a++ )
  {
    if( _.longIs( ins[ a ] ) )
    {
      let insArray = insCopy[ a ] || ins[ a ];
      let subArray = sub[ a ] || subCopy[ a ];

      for( let i = 0, len2 = insArray.length; i < len2; i++ )
      _replace( dstArray, insArray[ i ], subArray[ i ], evaluator1, evaluator2   );
    }
    else
    {
      _replace( dstArray, ins[ a ], sub[ a ], evaluator1, evaluator2 );
    }
  }

  return result;
}

//

function arrayReplacedArraysOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );
  _.assert( _.arrayIs( dstArray ), 'arrayReplacedArrays :', 'Expects array' );
  _.assert( _.longIs( sub ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( _.longIs( ins ), 'arrayReplacedArrays :', 'Expects longIs entity' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  );

  let result = 0;
  // let oldDstArray = dstArray.slice();  // Array with src values stored

  function _replace( dstArray, argument, subValue, evaluator1, evaluator2  )
  {
    // let dstArray2 = oldDstArray.slice();
    //let index = dstArray.indexOf( argument );
    // let index = _.arrayLeftIndex( dstArray2, argument, evaluator1, evaluator2 );
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );

    if( index !== -1 )
    {
      // dstArray2.splice( index, 1, subValue );
      dstArray.splice( index, 1, subValue );
      result += 1;
    }
  }

  for( let a = 0, len = ins.length; a < len ; a++ )
  {
    if( _.longIs( ins[ a ] ) )
    {
      let insArray = ins[ a ];
      let subArray = sub[ a ];

      for( let i = 0, len2 = insArray.length; i < len2; i++ )
      _replace( dstArray, insArray[ i ], subArray[ i ], evaluator1, evaluator2   );
    }
    else
    {
      _replace( dstArray, ins[ a ], sub[ a ], evaluator1, evaluator2 );
    }
  }

  return result;
}

//

function arrayReplacedArraysOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = ins.length - 1; i >= 0; i-- )
    {
      if( _.longIs( ins[ i ] ) )
      expected += ins[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );

    if( dstArray === ins )
    return result;

    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArraysOnce.apply( this, arguments );
  }

  return result;

}

//

/**
 * The arrayUpdate() routine adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
 * and returns the last added index or the last replaced index of the array (dstArray).
 *
 * It creates the variable (index) assigns and calls to it the function(arrayReplaceOnce( dstArray, ins, sub ).
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
 * let add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
 * // returns 3
 * console.log( add );
 * // log [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 *
 * @example
 * let add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
 * // returns 5
 * console.log( add );
 * // log [ 1, 2, 3, 4, 5, 6 ]
 *
 * @example
 * let replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
 * // returns 4
 * console.log( replace );
 * // log [ true, true true, true, true ]
 *
 * @returns { number } Returns the last added or the last replaced index.
 * @function arrayUpdate
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
 * @memberof wTools
 */

function arrayUpdate( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let index = arrayReplacedOnce.apply( this, arguments );

  if( index === -1 )
  {
    dstArray.push( sub );
    index = dstArray.length - 1;
  }

  return index;
}

// --
// fields
// --

// let unrollSymbol = Symbol.for( 'unroll' );

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

  // argumentsArrayIs,
  argumentsArrayMake,
  _argumentsArrayMake,
  argumentsArrayFrom,

  // long

  // longIs,
  // longIsPopulated,

  longMake,
  longMakeEmpty,
  _longMakeOfLength,
  longMakeUndefined,
  longMakeZeroed,
  _longClone,
  longShallowClone,

  longRepresent,
  longSlice,
  longEmpty,

  longBut,
  longButInplace,
  longSelect,
  longSelectInplace,
  longGrow,
  longGrowInplace,
  longRelength,
  longRelengthInplace,

  // array checker

  arrayIs,
  arrayIsPopulated,
  arrayLikeResizable,
  arrayLike,

  constructorLikeArray,
  hasLength,
  arrayHasArray,

  arrayCompare,
  arraysAreIdentical,

  arrayHas,
  arrayHasAny, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer | Dmytro : reimplemented, documented, covered */
  arrayHasAll, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer | Dmytro : reimplemented, documented, covered */
  arrayHasNone, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer | Dmytro : reimplemented, documented, covered */

  arrayAll,
  arrayAny,
  arrayNone,

  // array producer

  arrayMake,
  arrayMakeUndefined,
  arrayFrom,
  arrayAs,
  arrayAsShallowing,

  // array transformer

  arraySlice,
  // arrayButInplace, // Dmytro : maybe it should be arraySliceInplace

  arrayBut,
  arrayButInplace,
  arraySelect,
  arraySelectInplace,
  arrayGrow,
  arrayGrowInplace,
  arrayRelength,
  arrayRelengthInplace,

  // array sequential search

  arrayLeftIndex,
  arrayRightIndex,

  arrayLeft,
  arrayRight,

  arrayLeftDefined,
  arrayRightDefined,

  arrayCountElement, /* qqq : cover by tests | Dmytro : covered */
  arrayCountTotal, /* qqq : cover by tests | Dmytro : covered */
  arrayCountUnique,

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

  // array remove

  arrayRemove,
  arrayRemoveOnce,
  arrayRemoveOnceStrictly,
  arrayRemoved,
  arrayRemovedOnce,
  arrayRemovedOnceStrictly,

  arrayRemoveElement, /* qqq : should remove all, check test coverage | Dmytro : removes all possible elements, extended coverage */
  arrayRemoveElementOnce,
  arrayRemoveElementOnceStrictly,
  arrayRemovedElement,
  arrayRemovedElementOnce,
  arrayRemovedElementOnceStrictly,

  arrayRemoveArray,
  arrayRemoveArrayOnce,
  arrayRemoveArrayOnceStrictly,
  arrayRemovedArray,
  arrayRemovedArrayOnce,
  arrayRemovedArrayOnceStrictly,

  arrayRemoveArrays,
  arrayRemoveArraysOnce,
  arrayRemoveArraysOnceStrictly,
  arrayRemovedArrays,
  arrayRemovedArraysOnce,
  arrayRemovedArraysOnceStrictly,

  arrayRemoveDuplicates,

  // array flatten

  /* qqq : extend routine arrayFlatten and its coverage to support Sets as input */

  arrayFlatten,
  arrayFlattenOnce,
  arrayFlattenOnceStrictly,
  arrayFlattened,
  arrayFlattenedOnce,
  arrayFlattenedOnceStrictly,

  arrayFlattenDefined,
  arrayFlattenDefinedOnce,
  arrayFlattenDefinedOnceStrictly,
  arrayFlattenedDefined,
  arrayFlattenedDefinedOnce,
  arrayFlattenedDefinedOnceStrictly,

  // array replace

  arrayReplace,
  arrayReplaceOnce,
  arrayReplaceOnceStrictly,
  arrayReplaced,
  arrayReplacedOnce,
  arrayReplacedOnceStrictly,

  arrayReplaceElement,
  arrayReplaceElementOnce,
  arrayReplaceElementOnceStrictly,
  arrayReplacedElement,
  arrayReplacedElementOnce,
  arrayReplacedElementOnceStrictly,

  arrayReplaceArray,
  arrayReplaceArrayOnce,
  arrayReplaceArrayOnceStrictly,
  arrayReplacedArray,
  arrayReplacedArrayOnce,
  arrayReplacedArrayOnceStrictly,

  arrayReplaceArrays,
  arrayReplaceArraysOnce,
  arrayReplaceArraysOnceStrictly,
  arrayReplacedArrays,
  arrayReplacedArraysOnce,
  arrayReplacedArraysOnceStrictly,

  // arrayReplaceAll, // use arrayReplaceElement instead
  // arrayReplacedAll, // use arrayReplacedElement instead

  arrayUpdate,

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
