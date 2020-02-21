( function _fLong_s_() {

'use strict';

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayIncludes = Array.prototype.includes;
if( !_ArrayIncludes )
_ArrayIncludes = function( e ){ _ArrayIndexOf.call( this, e ) }

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

function argumentsArrayMake( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.numberIs( src ) || _.longLike( src ) );
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

function _longMake_functor( onMake )
{

  _.assert( _.routineIs( onMake ) );

  return function _longMake( src, ins )
  {
    let result;

    /* */

    let length = ins;

    if( _.longLike( length ) )
    length = length.length;

    if( length === undefined || length === null )
    {
      if( src === null )
      {
        length = 0;
      }
      else if( _.longLike( src ) )
      {
        length = src.length;
      }
      else if( _.numberIs( src ) )
      {
        length = src;
        src = null;
      }
      else _.assert( 0 );
    }

    if( !length )
    length = 0;

    /* */

    // if( !_.longLike( ins ) )
    // {
    //   if( _.longLike( src ) )
    //   ins = src;
    //   else
    //   ins = [];
    // }

    // if( ins === undefined || _.numberIs( ins ) )
    // if( !_.longLike( ins ) )
    // {
    //   if( _.longLike( src ) )
    //   {
    //     ins = src;
    //     src = null;
    //   }
    //   else
    //   {
    //     // ins = [];
    //     ins = null;
    //   }
    // }

    // if( !_.longLike( ins ) )
    // if( ins === undefined )
    if( !ins )
    {
      if( _.longLike( src ) )
      {
        if( ins === null )
        {
          ins = src;
        }
        else
        {
          ins = src;
          src = null;
        }
      }
      else
      {
        // ins = [];
        ins = null;
      }
    }
    else if( !_.longLike( ins ) )
    {
      ins = src;
    }

    /**/

    // let length = ins;
    //
    // if( _.longLike( length ) )
    // length = length.length;
    //
    // if( length === undefined || length === null )
    // {
    //   if( src === null )
    //   {
    //     length = 0;
    //   }
    //   else if( _.longLike( src ) )
    //   {
    //     length = src.length;
    //   }
    //   else if( _.numberIs( src ) )
    //   {
    //     length = src;
    //     src = null;
    //   }
    //   else _.assert( 0 );
    // }
    //
    // if( !length )
    // length = 0;

    /**/

    let minLength;
    if( ins )
    minLength = Math.min( ins.length, length );
    else
    minLength = 0;

    /**/

    if( _.argumentsArrayIs( src ) )
    src = null;

    if( src === null )
    src = this.longDescriptor.make;

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.numberIsFinite( length ) );
    _.assert( _.routineIs( src ) || _.longLike( src ), () => 'Expects long, but got ' + _.strType( src ) );

    result = onMake.call( this, src, ins, length, minLength );

    // if( _.routineIs( src ) )
    // {
    //   if( ins && ins.length === length )
    //   {
    //     if( src === Array )
    //     {
    //       if( _.longLike( ins ) )
    //       {
    //         if( ins.length === 1 )
    //         result = [ ins[ 0 ] ];
    //         else if( !_.arrayLike( ins ) )
    //         result = new( _.constructorJoin( src, [ ... ins ] ) );
    //         else
    //         result = new( _.constructorJoin( src, ins ) );
    //       }
    //       else
    //       {
    //         result = new src( ins );
    //       }
    //     }
    //     else
    //     {
    //       result = new src( ins );
    //     }
    //   }
    //   else
    //   {
    //     result = new src( length );
    //     let minLen = Math.min( length, ins.length );
    //     for( let i = 0 ; i < minLen ; i++ )
    //     result[ i ] = ins[ i ];
    //   }
    // }
    // else if( _.arrayIs( src ) )
    // {
    //   if( length === ins.length )
    //   {
    //     result = _.unrollIs( src ) ? _.unrollMake( ins ) : new( _.constructorJoin( src.constructor, ins ) );
    //   }
    //   else
    //   {
    //     _.assert( length >= 0 );
    //     result = _.unrollIs( src ) ? _.unrollMake( length ) : new src.constructor( length );
    //     let minLen = Math.min( length, ins.length );
    //     for( let i = 0 ; i < minLen ; i++ )
    //     result[ i ] = ins[ i ];
    //   }
    // }
    // else
    // {
    //   if( length === ins.length )
    //   {
    //     result = new src.constructor( ins );
    //   }
    //   else
    //   {
    //     result = new src.constructor( length );
    //     let minLen = Math.min( length, ins.length );
    //     for( let i = 0 ; i < minLen ; i++ )
    //     result[ i ] = ins[ i ];
    //   }
    // }

    // _.assert( result instanceof this.longDescriptor.type );
    _.assert( _.longLike( result ) );

    return result;
  }

}

//

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
 * @returns { Long } Returns a Long with type of source Long which makes from ins.
 * @function longMake
 * @throws { Error } If arguments.length is less than two or more then two.
 * @throws { Error } If {-ins-} is not a number and not a Long.
 * @throws { Error } If {-src-} is not a Long or not a constructor.
 * @throws { Error } If {-ins-} or ins.length has a not finite value.
 * @memberof wTools
 */

/* aaa : extend coverage and documentation of longMake */
/* Dmytro : extended coverage and documentation of routine longMake */
/* aaa : longMake does not create unrolls, but should */
/* Dmytro : longMake creates unrolls */

let longMake = _longMake_functor( function( src, ins, length, minLength )
{
  let result;

  if( _.routineIs( src ) )
  {
    if( ins && ins.length === length )
    {
      if( src === Array )
      {
        if( _.longLike( ins ) )
        {
          if( ins.length === 1 )
          result = [ ins[ 0 ] ];
          else if( !_.arrayLike( ins ) )
          result = new( _.constructorJoin( src, [ ... ins ] ) );
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
      // let minLength = Math.min( length, ins.length );
      // if( !ins && minLength )
      // debugger;
      for( let i = 0 ; i < minLength ; i++ )
      result[ i ] = ins[ i ];
    }
  }
  else if( _.arrayIs( src ) )
  {
    if( ins && length === ins.length )
    {
      result = _.unrollIs( src ) ? _.unrollMake( ins ) : new( _.constructorJoin( src.constructor, ins ) );
    }
    else
    {
      _.assert( length >= 0 );
      result = _.unrollIs( src ) ? _.unrollMake( length ) : new src.constructor( length );
      // let minLength = Math.min( length, ins.length );
      for( let i = 0 ; i < minLength ; i++ )
      result[ i ] = ins[ i ];
    }
  }
  else
  {
    if( ins && length === ins.length )
    {
      result = new src.constructor( ins );
    }
    else
    {
      result = new src.constructor( length );
      // let minLength = Math.min( length, ins.length );
      for( let i = 0 ; i < minLength ; i++ )
      result[ i ] = ins[ i ];
    }
  }

  return result;
});

// function longMake( src, ins )
// {
//   let result;
//   let length = ins;
//
//   if( _.longLike( length ) )
//   length = length.length;
//
//   if( length === undefined )
//   {
//     if( src === null )
//     {
//       length = 0;
//     }
//     else if( _.longLike( src ) )
//     {
//       length = src.length;
//     }
//     else if( _.numberIs( src ) )
//     {
//       length = src;
//       src = null;
//     }
//     else _.assert( 0 );
//   }
//
//   // if( !_.longLike( ins ) )
//   // {
//   //   if( _.longLike( src ) )
//   //   ins = src;
//   //   else
//   //   ins = [];
//   // }
//
//   if( !_.longLike( ins ) )
//   {
//     if( _.longLike( src ) )
//     {
//       ins = src;
//       src = null;
//     }
//     else
//     {
//       ins = [];
//     }
//   }
//
//   if( !length )
//   length = 0;
//
//   if( _.argumentsArrayIs( src ) )
//   src = null;
//
//   if( src === null )
//   src = this.longDescriptor.make;
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( length ) );
//   _.assert( _.routineIs( src ) || _.longLike( src ), () => 'Expects long, but got ' + _.strType( src ) );
//
//   if( _.routineIs( src ) )
//   {
//     if( ins.length === length )
//     {
//       if( src === Array )
//       {
//         if( _.longLike( ins ) )
//         {
//           if( ins.length === 1 )
//           result = [ ins[ 0 ] ];
//           else if( !_.arrayLike( ins ) )
//           result = new( _.constructorJoin( src, [ ... ins ] ) );
//           else
//           result = new( _.constructorJoin( src, ins ) );
//         }
//         else
//         {
//           result = new src( ins );
//         }
//       }
//       else
//       {
//         result = new src( ins );
//       }
//     }
//     else
//     {
//       result = new src( length );
//       let minLen = Math.min( length, ins.length );
//       for( let i = 0 ; i < minLen ; i++ )
//       result[ i ] = ins[ i ];
//     }
//   }
//   else if( _.arrayIs( src ) )
//   {
//     if( length === ins.length )
//     {
//       result = _.unrollIs( src ) ? _.unrollMake( ins ) : new( _.constructorJoin( src.constructor, ins ) );
//     }
//     else
//     {
//       _.assert( length >= 0 );
//       result = _.unrollIs( src ) ? _.unrollMake( length ) : new src.constructor( length );
//       let minLen = Math.min( length, ins.length );
//       for( let i = 0 ; i < minLen ; i++ )
//       result[ i ] = ins[ i ];
//     }
//   }
//   else
//   {
//     if( length === ins.length )
//     {
//       result = new src.constructor( ins );
//     }
//     else
//     {
//       result = new src.constructor( length );
//       let minLen = Math.min( length, ins.length );
//       for( let i = 0 ; i < minLen ; i++ )
//       result[ i ] = ins[ i ];
//     }
//   }
//
//   _.assert( result instanceof this.longDescriptor.type );
//   // _.assert( _.longLike( result ) );
//
//   return result;
// }

//

/* aaa : implement test */
/* Dmytro : implemented */

function longMakeEmpty( src )
{
  if( arguments.length === 0 )
  return this.longDescriptor.make( 0 );

  _.assert( arguments.length === 1 );

  if( _.unrollIs( src ) )
  return _.unrollMake( 0 );
  else if( src === null || _.argumentsArrayIs( src ) )
  return this.longDescriptor.make( 0 );
  else if( _.arrayIs( src ) || _.bufferTypedIs( src ) )
  return new src.constructor();
  else if( _.routineIs( src ) )
  {
    let result = new src.constructor();
    _.assert( _.longIs( result ) && result.length === 0, 'Constructor should return empty long' );
    return result;
  }
  _.assert( 0, 'Unknown how to construct long' );
}

// function longMakeEmpty( src )
// {
//   let result;
//   let length = 0;
//
//   if( src === null )
//   src = [];
//
//   if( _.argumentsArrayIs( src ) )
//   src = [];
//
//   _.assert( arguments.length === 1 );
//
//   result = new src.constructor();
//
//   _.assert( _.longIs( result ) );
//   _.assert( result.length === 0 );
//
//   return result;
// }

//

function _longMakeOfLength( src, len )
{
  let result;

  // if( src === null )
  // src = [];

  if( _.longLike( len ) )
  len = len.length;

  if( len === undefined )
  {
    if( src === null )
    {
      len = 0;
    }
    else if( _.longLike( src ) )
    {
      len = src.length;
    }
    else if( _.numberIs( src ) )
    {
      len = src;
      src = null;
    }
    else _.assert( 0 );
  }

  if( !len )
  len = 0;

  if( _.argumentsArrayIs( src ) )
  src = this.longDescriptor.name === 'ArgumentsArray' ? this.longDescriptor.make : this.longDescriptor.make( src );

  if( src === null )
  src = this.longDescriptor.make;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIsFinite( len ) );
  _.assert( _.routineIs( src ) || _.longLike( src ), () => 'Expects long, but got ' + _.strType( src ) );

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

  _.assert( _.longLike( result ), 'Instance should be a long' );

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
 * @returns { Long } - Returns a Long with type of source Long with a certain length.
 * @function longMakeUndefined
 * @throws { Error } If arguments.length is less than one or more then two.
 * @throws { Error } If the {-ins-} is not a Long or not a constructor.
 * @throws { Error } If the {-len-} is not a number or not a Long.
 * @throws { Error } If the {-len-} or ins.length has a not finite value.
 * @throws { Error } If the {-len-} is undefined and ins.length is not a number.
 * @memberof wTools
 */

/*
qqq : extend coverage and documentation of longMakeUndefined | Dmytro : routine is covered and documented
qqq : longMakeUndefined does not create unrolls, but should | Dmytro : longMakeUndefined creates unrolls.
*/

let longMakeUndefined = _longMake_functor( function( src, ins, length, minLength )
{
  let result;

  if( _.routineIs( src ) )
  result = new src( length );
  else if( _.unrollIs( src ) )
  result = _.unrollMake( length );
  else if( src === null )
  result = this.longDescriptor.make( length );
  else
  result = new src.constructor( length );

  return result;
})

// function longMakeUndefined( ins, len )
// {
//   let result, length;
//
//   /* aaa3 : ask. use default long container */
//   /* Dmytro : explained, used this.longDescriptor */
//   // if( ins === null )
//   // result = [];
//
//   if( len === undefined )
//   {
//     if( ins === null )
//     {
//       length = 0;
//     }
//     else if( _.numberIs( ins ) )
//     {
//       length = ins;
//       ins = null;
//     }
//     else
//     {
//       length = ins.length;
//     }
//   }
//   else
//   {
//     if( _.longLike( len ) )
//     length = len.length;
//     else if( _.numberIs( len ) )
//     length = len;
//     else _.assert( 0 );
//   }
//
//   if( _.argumentsArrayIs( ins ) )
//   ins = null;
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( length ) );
//   _.assert( _.routineIs( ins ) || _.longLike( ins ) || ins === null, () => 'Expects long, but got ' + _.strType( ins ) );
//
//   if( _.routineIs( ins ) )
//   result = new ins( length );
//   else if( _.unrollIs( ins ) )
//   result = _.unrollMake( length );
//   else if( ins === null ) /* aaa3 : ask */
//   result = this.longDescriptor.make( length );
//   else
//   result = new ins.constructor( length );
//
//   return result;
// }

//

/* qqq3 : teach to accept only length */
/* qqq3 : use default long type if type is not clear */
/* qqq3 : allow buffers which are long */
/* qqq3 : relevant to all routines longMake* of such kind */

let longMakeZeroed = _longMake_functor( function( src, ins, length, minLength )
{
  let result;

  if( _.routineIs( src ) )
  result = new src( length );
  else if( _.unrollIs( src ) )
  result = _.unrollMake( length );
  else if( src === null )
  result = this.longDescriptor.make( length );
  else
  result = new src.constructor( length );

  if( !_.bufferTypedIs( result ) )
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = 0;

  return result;
})

// function longMakeZeroed( ins, src )
// {
//   let result, length;
//
//   if( _.routineIs( ins ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( src === undefined )
//   {
//     length = ins.length;
//   }
//   else
//   {
//     if( _.longLike( src ) )
//     length = src.length;
//     else if( _.numberIs( src ) )
//     length = src;
//     else _.assert( 0, 'Expects long or number as the second argument, got', _.strType( src ) );
//   }
//
//   if( _.argumentsArrayIs( ins ) )
//   ins = [];
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( length ) );
//   _.assert( _.routineIs( ins ) || _.longLike( ins ), () => 'Expects long, but got ' + _.strType( ins ) );
//
//   if( _.routineIs( ins ) )
//   result = new ins( length );
//   else if( _.unrollIs( ins ) )
//   result = _.unrollMake( length );
//   else
//   result = new ins.constructor( length );
//
//   if( !_.bufferTypedIs( result ) )
//   for( let i = 0 ; i < length ; i++ )
//   result[ i ] = 0;
//
//   return result;
// }

//

/*
aaa : find and let me know what is _.buffer* analog of _longClone |
aaa Dmytro : module has not _.buffer* analog of routine _longClone. The closest functionality has routine bufferMake( ins, src )
zzz
*/

function _longClone( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longLike( src ) || _.bufferAnyIs( src ) );
  // _.assert( !_.bufferNodeIs( src ), 'not tested' );

  if( _.bufferViewIs( src ) )
  debugger;

  if( _.unrollIs( src ) )
  return _.unrollMake( src );
  else if( _.arrayIs( src ) )
  return src.slice();
  else if( _.argumentsArrayIs( src ) )
  return Array.prototype.slice.call( src );
  else if( _.bufferRawIs( src ) )
  return new U8x( new U8x( src ) ).buffer;
  else if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
  return new src.constructor( src );
  else if( _.bufferViewIs( src ) )
  return new src.constructor( src.buffer, src.byteOffset, src.byteLength );

  _.assert( 0, 'unknown kind of buffer', _.strType( src ) );
}

//

/**
 * The routine longShallowClone() makes new container with type defined by first argument. Routine clones content of provided arguments
 * into created container.
 *
 * @param { Long|Buffer } arguments[ 0 ] - Long or Buffer, defines type of returned container. If provided only {-arguments[ 0 ]-}, then
 * routine makes shallow copy of it.
 * @param { * } ... - Arguments to make copy into new container. Can have any types exclude undefined.
 *
 * @example
 * let src = [];
 * let got = _.longShallowClone( src );
 * console.log( got );
 * // log []
 * console.log( src === got );
 * // log false
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4 ] );
 * var got = _.longShallowClone( src );
 * console.log( got );
 * // log Uint8Array [ 1, 2, 3, 4 ];
 * console.log( src === got );
 * // log false
 *
 * @example
 * let src = _.unrollMake( [] );
 * let got = _.longShallowClone( src, 1, 'str', new F32x( [ 3 ] ) );
 * console.log( got );
 * // log [ 1, 'str', 3 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( src === got );
 * // log false
 *
 * @example
 * let src = new BufferRaw( 3 );
 * let got = _.longShallowClone( src, 1, 2, _.argumentsArrayMake( [ 3, 4 ] ) );
 * console.log( got );
 * // log ArrayBuffer { [Uint8Contents]: <00 00 00 01 02 03 04>, byteLength: 7 }
 * console.log( src === got );
 * // log false
 *
 * @returns { Long|Buffer } - Returns a Long or a Buffer with type of first argument. Returned container filled by content of provided arguments.
 * @function longShallowClone
 * @throws { Error } If arguments.length is less than one.
 * @throws { Error } If the {-arguments[ 0 ]-} is not a Long or not a Buffer.
 * @throws { Error } If {-arguments-} has undefined value.
 * @memberof wTools
 */

/* zzz : review longShallowClone */

function longShallowClone()
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );

  if( arguments.length === 1 )
  {
    return _._longClone( arguments[ 0 ] );
  }

  /* eval length */

  let length = 0;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let argument = arguments[ a ];

    _.assert( argument !== undefined, 'argument is not defined' );
    // if( argument === undefined )
    // throw _.err( 'argument is not defined' );

    if( _.longLike( argument ) || _.bufferNodeIs( argument ) )
    length += argument.length;
    else if( _.bufferRawIs( argument ) || _.bufferViewIs( argument ) )
    length += argument.byteLength;
    else
    length += 1;
  }

  /* make result */

  let result;
  let bufferDst;
  let offset = 0;

  if( _.bufferRawIs( arguments[ 0 ] ) )
  {
    result = new BufferRaw( length );
    bufferDst = new U8x( result );
  }
  else if( _.bufferViewIs( arguments[ 0 ] ) )
  {
    result = new BufferView( new BufferRaw( length ) );
    bufferDst = new U8x( result.buffer );
  }
  else
  {
    if( _.arrayIs( arguments[ 0 ] ) || _.bufferTypedIs( arguments[ 0 ] ) || _.argumentsArrayIs( arguments[ 0 ] ) )
    result = _.longMakeUndefined( arguments[ 0 ], length );
    else if( _.bufferNodeIs( arguments[ 0 ] ) )
    result = BufferNode.alloc( length );
    else
    _.assert( 0, 'Unexpected data type' );

    bufferDst = result;
  }

  /* copy */

  for( let a = 0; a < arguments.length ; a++ )
  {
    let srcTyped;
    let argument = arguments[ a ];
    if( _.bufferRawIs( argument ) )
    srcTyped = new U8x( argument );
    else if( _.bufferViewIs( argument ) )
    srcTyped = new U8x( argument.buffer );
    else if( _.bufferTypedIs( argument ) )
    srcTyped = argument;
    else if( _.longLike( argument ) || _.bufferNodeIs( argument ) )
    srcTyped = argument;
    else
    srcTyped = [ argument ];

    for( let i = 0; i < srcTyped.length; i++ )
    bufferDst[ i + offset ] = srcTyped[ i ];

    offset += srcTyped.length;
  }

  // for( let a = 0, c = 0 ; a < arguments.length ; a++ )
  // {
  //   let argument = arguments[ a ];
  //   if( _.bufferRawIs( argument ) )
  //   {
  //     bufferDst.set( new U8x( argument ), offset );
  //     offset += argument.byteLength;
  //   }
  //   else if( _.bufferTypedIs( arguments[ 0 ] ) )
  //   {
  //     result.set( argument, offset );
  //     offset += argument.length;
  //   }
  //   else if( _.longLike( argument ) )
  //   for( let i = 0 ; i < argument.length ; i++ )
  //   {
  //     result[ c ] = argument[ i ];
  //     c += 1;
  //   }
  //   else
  //   {
  //     result[ c ] = argument;
  //     c += 1;
  //   }
  // }

  return result;
}

//

/*
qqq : add good coverage for longFrom.
*/

function longFrom( src )
{
  _.assert( arguments.length === 1 );
  if( src instanceof this.longDescriptor.type )
  if( !_.unrollIs( src ) )
  return src;
  return this.longMake.call( this, src );
}

//

/**
 * The longFromCoercing() routine converts an object-like {-srcMap-} into Array.
 *
 * @param { * } src - To convert into Array.
 *
 * @example
 * _.longFromCoercing( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 *
 * @example
 * _.longFromCoercing( { a : 3, b : 7, c : 13 } );
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 *
 * @example
 * _.longFromCoercing( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 *
 * @example
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.longFromCoercing( args );
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ]
 *
 * @returns { Array } Returns an Array.
 * @function longFromCoercing
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object-like.
 * @memberof wTools
 */

function longFromCoercing( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( src instanceof this.longDescriptor.type )
  return src;

  if( _.longIs( src ) )
  return this.longDescriptor.from( src );

  if( _.objectIs( src ) )
  return this.longFromCoercing( _.mapToArray( src ) );

  debugger; qqq // qqq : cover
  if( _.strIs( src ) )
  return this.longFromCoercing( this.arrayFromStr( src ) );

  if( _.argumentsArrayIs( src ) )
  return this.longFromCoercing( Array.prototype.slice.call( src ) );

  _.assert( 0, 'Unknown data type : ' + _.strType( src ) );
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
  _.assert( _.longLike( src ), 'Unknown type of (-src-) argument' );
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

/* qqq : optimize | Dmytro : optimized */

function longSlice( array, f, l )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( f === undefined || _.numberIs( f ) );
  _.assert( l === undefined || _.numberIs( l ) );

  if( _.bufferTypedIs( array ) )
  return array.subarray( f, l );
  else if( _.arrayLikeResizable( array ) )
  return array.slice( f, l );
  else if( _.argumentsArrayIs( array ) )
  return [ ... array ].slice( f, l );
  else
  _.assert( 0 );

}

// function longSlice( array, f, l )
// {
//   let result;
//
//   if( _.argumentsArrayIs( array ) )
//   if( f === undefined && l === undefined )
//   {
//     if( array.length === 2 )
//     return [ array[ 0 ], array[ 1 ] ];
//     else if( array.length === 1 )
//     return [ array[ 0 ] ];
//     else if( array.length === 0 )
//     return [];
//   }
//
//   _.assert( _.longIs( array ) );
//   _.assert( 1 <= arguments.length && arguments.length <= 3 );
//
//   if( _.arrayLikeResizable( array ) )
//   {
//     _.assert( f === undefined || _.numberIs( f ) );
//     _.assert( l === undefined || _.numberIs( l ) );
//     result = array.slice( f, l );
//     return result;
//   }
//
//   f = f !== undefined ? f : 0;
//   l = l !== undefined ? l : array.length;
//
//   _.assert( _.numberIs( f ) );
//   _.assert( _.numberIs( l ) );
//
//   if( f < 0 )
//   f = array.length + f;
//   if( l < 0 )
//   l = array.length + l;
//
//   if( f < 0 )
//   f = 0;
//   if( l > array.length )
//   l = array.length;
//   if( l < f )
//   l = f;
//
//   result = _.longMakeUndefined( array, l-f );
//   // if( _.bufferTypedIs( array ) )
//   // result = new array.constructor( l-f );
//   // else
//   // result = new Array( l-f );
//
//   for( let r = f ; r < l ; r++ )
//   result[ r-f ] = array[ r ];
//
//   return result;
// }

//

function longEmpty( dstLong )
{
  if( _.arrayIs( dstLong ) )
  {
    // dstLong.slice( 0, dstLong.length ); // Dmytro : slice() method make copy of array, splice() method removes elements
    dstLong.splice( 0, dstLong.length );
    return dstLong;
  }
  _.assert( 0, () => `Cant change length of fixed-length container ${_.strType( dstLong )}` );
}

//

/**
 * The routine longBut() returns a shallow copy of provided Long {-array-}. Routine removes existing
 * elements in bounds defined by {-range-} and inserts new elements from {-val-}. The original
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
 * @returns { Long } - Returns a copy of source Long with removed or replaced existing elements and / or added new elements. The copy has same type as source Long.
 * @function longBut
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @throws { Error } If argument {-val-} is not Long / undefined.
 * @memberof wTools
 */

/*
qqq : routine longBut requires good test coverage and documentation | Dmytro : extended routine coverage by using given clarifications, documented
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

  _.assert( _.longLike( array ) );
  _.assert( val === undefined || _.longLike( val ) );
  _.assert( _.rangeIs( range ) );
  // _.assert( _.longLike( range ), 'not tested' );
  // _.assert( !_.longLike( range ), 'not tested' );

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
qqq : routine longButInplace requires good test coverage and documentation | Dmytro : implemented and covered routine longButInplace, documented
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

  _.assert( _.longLike( array ) );
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
  // _.assert( _.longLike( src ) );
  // _.assert( ins === undefined || _.longLike( ins ) );
  // _.assert( _.longLike( range ), 'not tested' );
  // _.assert( !_.longLike( range ), 'not tested' );
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

function _argumentsOnlyLong( dst, src, range, ins )
{
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( dst === null )
  dst = true;
  else if( dst === src )
  dst = false;
  else if( arguments.length === 4 )
  _.assert( _.longLike( dst ), '{-dst-} should be Long' );
  else
  {
    if( arguments.length > 1 && !_.rangeIs( src ) && !_.numberIs( src ) )
    _.assert( _.longLike( dst ) );
    else
    {
      ins = range;
      range = src;
      src = dst;
      dst = false;
    }
  }

  _.assert( _.longLike( src ) );

  return [ dst, src, range, ins ];
}

//

function longBut_( dst, array, range, val )
{

  [ dst, array, range, val ] = _argumentsOnlyLong.apply( this, arguments );

  if( _.arrayLikeResizable( array ) && !_.bufferAnyIs( dst ) )
  return _.arrayBut_.apply( this, arguments );

  if( range === undefined )
  return returnDst();

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];

  _.assert( _.rangeIs( range ) );

  _.rangeClamp( range, [ 0, array.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] === range[ 1 ] && val === undefined )
  return returnDst();

  let d = range[ 1 ] - range[ 0 ];
  let len = val ? val.length : 0;
  let d2 = d - len;
  let l2 = array.length - d2;

  let result;
  if( _.boolIs( dst ) )
  result = _.longMakeUndefined( array, l2 );
  else if( _.arrayLikeResizable( dst ) )
  result = _.longEmpty( dst );
  else if( dst.length !== l2 )
  result = _.longMakeUndefined( dst, l2 );
  else
  result = dst;

  for( let i = 0 ; i < range[ 0 ] ; i++ )
  result[ i ] = array[ i ];

  for( let i = range[ 1 ] ; i < array.length ; i++ )
  result[ i-d2 ] = array[ i ];

  if( val )
  for( let i = 0 ; i < val.length ; i++ )
  result[ range[ 0 ]+i ] = val[ i ];

  return result;

  /* */

  function returnDst()
  {
    if( dst.length !== undefined )
    {
      if( _.arrayLikeResizable( dst ) )
      return dst.splice( 0, dst.length, ... array );
      else
      {
        if( dst.length !== array.length )
        dst = _.longMakeUndefined( dst, array.length );

        for( let i = 0; i < dst.length; i++ )
        dst[ i ] = array[ i ];

        return dst;
      }
    }
    return dst === true ? _.longMake( array ) : array;
  }
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
  qqq : extend documentation and test coverage of longSelect | Dmytro : documented, covered.
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

  _.assert( _.longLike( array ) );
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
  qqq : extend documentation and test coverage of longSelectInplace | Dmytro : documented, covered
  qqq : implement arraySelect | Dmytro : implemented
  qqq : implement arraySelectInplace | Dmytro : implemented
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

  _.assert( _.longLike( array ) );
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
  // _.assert( _.longLike( array ) );
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

function longSelect_( dst, array, range, val )
{

  [ dst, array, range, val ] = _argumentsOnlyLong.apply( this, arguments );

  if( _.arrayLikeResizable( array ) )
  return _.arraySelect_.apply( this, arguments );

  if( range === undefined )
  return returnDst();

  if( _.numberIs( range ) )
  range = [ range, array.length ];

  _.assert( _.rangeIs( range ) )

  _.rangeClamp( range, [ 0, array.length ] );
  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] === 0 && range[ 1 ] === array.length )
  return returnDst();

  let f2 = Math.max( range[ 0 ], 0 );
  let l2 = Math.min( array.length, range[ 1 ] );

  let result;
  if( _.boolIs( dst ) )
  result = _.longMakeUndefined( array, range[ 1 ] - range[ 0 ] );
  else if( _.arrayLikeResizable( dst ) )
  result = _.longEmpty( dst );
  else if( dst.length !== range[ 1 ] - range[ 0 ] )
  result = _.longMakeUndefined( dst, range[ 1 ] - range[ 0 ] );
  else
  result = dst;

  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = array[ r ];

  return result;

  /* */

  function returnDst()
  {
    if( dst.length !== undefined )
    {
      if( _.arrayLikeResizable( dst ) )
      return dst.splice( 0, dst.length, ... array );
      else
      {
        if( dst.length !== array.length )
        dst = _.longMakeUndefined( dst, array.length );

        for( let i = 0; i < dst.length; i++ )
        dst[ i ] = array[ i ];

        return dst;
      }
    }
    return dst === true ? _.longMake( array ) : array;
  }
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
  qqq : extend documentation and test coverage of longGrowInplace | Dmytro : extended documentation, covered routine longGrow, longGrowInplace
  qqq : implement arrayGrow | Dmytro : implemented
  qqq : implement arrayGrowInplace | Dmytro : implemented
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

  _.assert( _.longLike( array ) );
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

  _.assert( _.longLike( array ) );
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
  // _.assert( _.longLike( array ) );
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

function longGrow_( dst, array, range, val )
{

  [ dst, array, range, val ] = _argumentsOnlyLong.apply( this, arguments );

  if( _.arrayLikeResizable( array ) )
  return this.arrayGrow_.apply( this, arguments );

  if( range === undefined )
  return returnDst();

  if( _.numberIs( range ) )
  range = [ 0, range ];

  _.assert( _.rangeIs( range ) );

  range[ 0 ] = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  range[ 1 ] = range[ 1 ] !== undefined ? range[ 1 ] : array.length;

  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];

  if( range[ 0 ] < 0 )
  {
    range[ 1 ] -= range[ 0 ];
    range[ 0 ] -= range[ 0 ];
  }

  if( range[ 0 ] > 0 )
  range[ 0 ] = 0;
  if( range[ 1 ] < array.length )
  range[ 1 ] = array.length;

  if( range[ 1 ] === array.length )
  return returnDst();

  let f2 = Math.max( range[ 0 ], 0 );
  let l2 = Math.min( array.length, range[ 1 ] );

  let result;
  if( _.boolIs( dst ) )
  result = _.longMakeUndefined( array, range[ 1 ] - range[ 0 ] );
  else if( _.arrayLikeResizable( dst ) )
  {
    result = dst;
    result.length = range[ 1 ] - range[ 0 ];
  }
  else if( dst.length !== range[ 1 ] - range[ 0 ] )
  result = _.longMakeUndefined( dst, range[ 1 ] - range[ 0 ] );
  else
  result = dst;

  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = array[ r ];

  if( val !== undefined )
  {
    for( let r = l2 - range[ 0 ]; r < result.length ; r++ )
    result[ r ] = val;
  }

  return result;

  /* */

  function returnDst()
  {
    if( dst.length !== undefined )
    {
      if( _.arrayLikeResizable( dst ) )
      return dst.splice( 0, dst.length, ... array );
      else
      {
        if( dst.length !== array.length )
        dst = _.longMakeUndefined( dst, array.length );

        for( let i = 0; i < dst.length; i++ )
        dst[ i ] = array[ i ];

        return dst;
      }
    }
    return dst === true ? _.longMake( array ) : array;
  }
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

  _.assert( _.longLike( array ) );
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

  _.assert( _.longLike( array ) );
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

//

function longRelength_( dst, array, range, val )
{

  [ dst, array, range, val ] = _argumentsOnlyLong.apply( this, arguments );

  if( _.arrayLikeResizable( array ) )
  return _.arrayRelength_.apply( this, arguments );

  if( range === undefined )
  return returnDst();

  if( _.numberIs( range ) )
  range = [ range, array.length ];

  _.assert( _.rangeIs( range ) );

  range[ 0 ] = range[ 0 ] !== undefined ? range[ 0 ] : 0;
  range[ 1 ] = range[ 1 ] !== undefined ? range[ 1 ] : src.length;

  if( range[ 1 ] < range[ 0 ] )
  range[ 1 ] = range[ 0 ];
  if( range[ 0 ] > array.length )
  range[ 0 ] = array.length

  if( range[ 0 ] < 0 )
  range[ 0 ] = 0;

  if( range[ 0 ] === 0 && range[ 1 ] === array.length )
  return returnDst();

  let f2 = Math.max( range[ 0 ], 0 );
  let l2 = Math.min( array.length, range[ 1 ] );

  let result;
  if( _.boolIs( dst ) )
  result = _.longMakeUndefined( array, range[ 1 ] - range[ 0 ] );
  else if( _.arrayLikeResizable( dst ) )
  {
    result = dst;
    result.length = range[ 1 ] - range[ 0 ];
  }
  else if( dst.length !== range[ 1 ] - range[ 0 ] )
  result = _.longMakeUndefined( dst, range[ 1 ] - range[ 0 ] );
  else
  result = dst;

  for( let r = f2 ; r < l2 ; r++ )
  result[ r-f2 ] = array[ r ];

  if( val !== undefined )
  {
    for( let r = l2 - range[ 0 ]; r < result.length; r++ )
    result[ r ] = val;
  }

  return result;

  /* */

  function returnDst()
  {
    if( dst.length !== undefined )
    {
      if( _.arrayLikeResizable( dst ) )
      return dst.splice( 0, dst.length, ... array );
      else
      {
        if( dst.length !== array.length )
        dst = _.longMakeUndefined( dst, array.length );

        for( let i = 0; i < dst.length; i++ )
        dst[ i ] = array[ i ];

        return dst;
      }
    }
    return dst === true ? _.longMake( array ) : array;
  }
}

// --
// array checker
// --

/**
 * The longCompare() routine returns the first difference between the values of the first array from the second.
 *
 * @param { longLike } src1 - The first array.
 * @param { longLike } src2 - The second array.
 *
 * @example
 * _.longCompare( [ 1, 5 ], [ 1, 2 ] );
 * // returns 3
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @function longCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */

function longCompare( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longLike( src1 ) && _.longLike( src2 ) );
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
 * The longIdentical() routine checks the equality of two arrays.
 *
 * @param { longLike } src1 - The first array.
 * @param { longLike } src2 - The second array.
 *
 * @example
 * _.longIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 * // returns true
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function longIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function longIdentical( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longLike( src1 ) );
  _.assert( _.longLike( src2 ) );

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

function longHas( array, element, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayLike( array ) );

  if( !evaluator1 && !evaluator2 )
  {
    // return _ArrayIndexOf.call( array, element ) !== -1;
    return _ArrayIncludes.call( array, element );
  }
  else
  {
    if( _.longLeftIndex( array, element, evaluator1, evaluator2 ) >= 0 )
    return true;
    return false;
  }

}

//

/**
 * The routine longHasAny() checks if the {-src-} array has at least one element of the argument {-ins-}.
 * It can take equalizer or evaluators for the routine equalities.
 *
 * It iterates over array-like {-src-} copies each element of the array {-ins-} by the routine
 * [longLeftIndex()]{@link wTools.longLeftIndex}
 * Checks, if {-src-} array has at least one element of the {-ins-} array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.longLeftIndex} - See for more information.
 *
 * @param { Long } src - The source array.
 * @param  { Long|Primitive } ins - The elements to check in the source array.
 * @param { Function } evaluator - A collback function.
 *
 * @example
 * _.longHasAny( [ 5, 'str', 42, false ], 7 );
 * // returns false
 *
 * @example
 * _.longHasAny( [ 5, 'str', 42, false ], [ false, 7, 10 ] );
 * // returns true
 *
 * @example
 * _.longHasAny( [ { a : 2 }, 'str', 42, false ], [ { a : 2 }, { a : 3 } ] );
 * // returns false
 *
 * @example
 * var evaluator = ( e ) => e.a;
 * _.longHasAny( [ { a : 2 }, 'str', 42, false ], [ { a : 2 }, { a : 3 } ], evaluator );
 * // returns true
 *
 * @returns { Boolean } - Returns true, if {-src-} has at least one element of {-ins-}, otherwise false is returned.
 * @function longHasAny
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-ins-} is not a Long, not a primitive.
 * @throws { Error } If {-evaluator-} is not a routine.
 * @memberof wTools
 */

function longHasAny( src, ins, evaluator )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longLike( src ), 'Expects array, but got ' + _.strType( src ) );
  _.assert( _.longLike( ins ) || _.primitiveIs( ins ) );

  if( _.primitiveIs( ins ) )
  ins = [ ins ];

  let i = 0;
  let result;

  do
  {
    result = _.longLeftIndex( src, ins[ i ], 0, evaluator );
    i++;
  }
  while( result < 0 && i < ins.length )

  if( result !== -1 )
  return true;
  return false;
}

//

/**
 * The routine longHasAll() checks if the {-src-} array has all elements of the argument {-ins-}.
 * It can take equalizer or evaluators for the routine equalities.
 *
 * It iterates over array-like {-src-} copies each element of the array {-ins-} by the routine
 * [longLeftIndex()]{@link wTools.longLeftIndex}
 * Checks, if {-src-} array has all elements of the {-ins-} array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.longLeftIndex} - See for more information.
 *
 * @param { Long } src - The source array.
 * @param  { Long|Primitive } ins - The elements to check in the source array.
 * @param { Function } evaluator - A collback function.
 *
 * @example
 * _.longHasAll( [ 5, 'str', 42, false ], 7 );
 * // returns false
 *
 * @example
 * _.longHasAny( [ 5, 'str', 42, false ], [ false, 5, 'str' ] );
 * // returns true
 *
 * @example
 * _.longHasAny( [ { a : 2 }, { a : 3 } 'var', 42, false ], [ { a : 2 }, { a : 3 } ] );
 * // returns false
 *
 * @example
 * var evaluator = ( e ) => e.a;
 * _.longHasAny( [ { a : 2 }, { a : 3 } 'str', 42, false ], [ { a : 2 }, { a : 3 } ], evaluator );
 * // returns true
 *
 * @returns { Boolean } - Returns true, if {-src-} has all elements of {-ins-}, otherwise false is returned.
 * @function longHasAll
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-ins-} is not a Long, not a primitive.
 * @throws { Error } If {-evaluator-} is not a routine.
 * @memberof wTools
 */

function longHasAll( src, ins, evaluator )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longLike( src ), 'Expects array, but got ' + _.strType( src ) );
  _.assert( _.longLike( ins ) || _.primitiveIs( ins ) );

  if( _.primitiveIs( ins ) )
  ins = [ ins ];

  if( ins.length === 0 )
  return true;

  let i = 0;
  let result = 0;
  while( result >= 0 && i < ins.length )
  {
    result = _.longLeftIndex( src, ins[ i ], 0, evaluator );
    i++;
  }

  if( result !== -1 )
  return true;
  return false;
}

//

/**
 * The routine longHasNone() checks if the {-src-} array has no one element of the argument {-ins-}.
 * It can take equalizer or evaluators for the routine equalities.
 *
 * It iterates over array-like {-src-} copies each element of the array {-ins-} by the routine
 * [longLeftIndex()]{@link wTools.longLeftIndex}
 * Checks, if {-src-} array has no one elements of the {-ins-} array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.longLeftIndex} - See for more information.
 *
 * @param { Long } src - The source array.
 * @param  { Long|Primitive } ins - The elements to check in the source array.
 * @param { Function } evaluator - A collback function.
 *
 * @example
 * _.longHasNone( [ 5, 'str', 42, false ], 7 );
 * // returns true
 *
 * @example
 * _.longHasNone( [ 5, 'str', 42, false ], [ false, 5, 'str' ] );
 * // returns false
 *
 * @example
 * _.longHasNone( [ { a : 2 }, { a : 3 } 'var', 42, false ], [ { a : 2 }, { a : 3 } ] );
 * // returns true
 *
 * @example
 * var evaluator = ( e ) => e.a;
 * _.longHasNone( [ { a : 2 }, { a : 3 } 'str', 42, false ], [ { a : 2 }, { a : 4 } ], evaluator );
 * // returns false
 *
 * @returns { Boolean } - Returns true, if {-src-} has no one element of {-ins-}, otherwise false is returned.
 * @function longHasAll
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-ins-} is not a Long, not a primitive.
 * @throws { Error } If {-evaluator-} is not a routine.
 * @memberof wTools
 */

function longHasNone( src, ins, evaluator )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longLike( src ), 'Expects array, but got ' + _.strType( src ) );
  _.assert( _.longLike( ins ) || _.primitiveIs( ins ) );

  if( _.primitiveIs( ins ) )
  ins = [ ins ];

  let i = 0;
  let result;

  do
  {
    result = _.longLeftIndex( src, ins[ i ], 0, evaluator );
    i++;
  }
  while( result < 0 && i < ins.length )

  if( result !== -1 )
  return false;
  return true;
}

//

/* qqq : cover please | Dmytro : covered*/

function longHasDepth( arr, level = 1 )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.intIs( level ) );

  if( !_.longLike( arr ) )
  return false;

  if( level <= 0 )
  return true;

  for( let a = 0 ; a < arr.length ; a += 1 )
  if( _.longLike( arr[ a ] ) )
  {
    if( _.longHasDepth( arr[ a ], level - 1 ) )
    return true;
  }

  return false;
}

//

function longAll( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longLike( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  {
    if( !src[ s ] )
    return false;
  }

  return true;
}

//

function longAny( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longLike( src ) );

  debugger;
  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return true;

  debugger;
  return false;
}

//

function longNone( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longLike( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return false;

  return true;
}

// --
// long sequential search
// --

/**
 * The routine longCountElement() returns the count of matched elements {-element-} in the {-srcArray-} array.
 * Returns 0 if no {-element-} is matched. It can take equalizer or evaluators to check specific equalities.
 *
 * @param { Long } srcArray - The source array.
 * @param { * } element - The value to count matches.
 * @param { Function } onEvaluate1 - It's a callback. If the routine has two parameters, it is used as an equalizer, and if it has only one, then routine used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the value to search.
 *
 * @example
 * // simple exapmle, no matches
 * _.longCountElement( [ 1, 2, 'str', 10, 10, true ], 3 );
 * // returns 0
 *
 * @example
 * // simple exapmle
 * _.longCountElement( [ 1, 2, 'str', 10, 10, true ], 10 );
 * // returns 2
 *
 * @example
 * // with equalizer
 * _.longCountElement( [ 1, 2, 'str', 10, 10, true ], 10, ( a, b ) => _.typeOf( a ) === _.typeOf( b ) );
 * // returns 4
 *
 * @example
 * // with single evaluator
 * _.longCountElement( [ [ 10 ], [ 10 ], [ 'str' ], [ 10 ], [ false ] ], [ 'str' ], ( e ) => e[ 0 ] );
 * // returns 1
 *
 * @example
 * // with two part of evaluator
 * _.longCountElement( [ [ 10 ], [ 10 ], [ 'str' ], [ 10 ], [ false ] ], 10, ( e ) => e[ 0 ], ( e ) => e );
 * // returns 4
 *
 * @returns { Number } - Returns the count of matched elements {-element-} in the {-srcArray-}.
 * @function longCountElement
 * @throws { Error } If passed arguments is less than two or more than four.
 * @throws { Error } If the first argument is not a Long.
 * @throws { Error } If the third or fourth argument is not a routine.
 * @throws { Error } If the routine in third argument has less than one or more than two arguments.
 * @throws { Error } If the routine in third argument has two arguments and fourth argument is passed into routine longCountElement.
 * @throws { Error } If the routine in fourth argument has less than one or more than one arguments.
 * @memberof wTools
 */

/*
qqq : are all combinations of call of routine arrayCountElement covered? | Dmytro : yes, all combinations of call is implemented
*/

function longCountElement( srcArray, element, onEvaluate1, onEvaluate2 )
{
  let result = 0;

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.longLike( srcArray ), 'Expects long' );

  let left = _.longLeftIndex( srcArray, element, onEvaluate1, onEvaluate2 );
  // let index = srcArray.indexOf( element );

  while( left >= 0 )
  {
    result += 1;
    left = _.longLeftIndex( srcArray, element, left+1, onEvaluate1, onEvaluate2 );
    // index = srcArray.indexOf( element, index+1 );
  }

  return result;
}

//

/**
 * The routine longCountTotal() adds all the elements in {-srcArray-}, elements can be numbers or booleans ( it considers them 0 or 1 ).
 *
 * @param { Array } srcArray - The source array.
 *
 * @example
 * _.longCountTotal( [ 1, 2, 10, 10 ] );
 * // returns 23
 *
 * @example
 * _.longCountTotal( [ true, false, false ] );
 * // returns 1
 *
 * @returns { Number } - Returns the sum of the elements in {-srcArray-}.
 * @function longCountTotal
 * @throws { Error } If passed arguments is different than one.
 * @throws { Error } If the first argument is not a Long.
 * @throws { Error } If {-srcArray-} doesn´t contain number-like elements.
 * @memberof wTools
 */

function longCountTotal( srcArray )
{
  let result = 0;

  _.assert( arguments.length === 1 );
  _.assert( _.longLike( srcArray ), 'Expects long' );

  for( let i = 0 ; i < srcArray.length ; i++ )
  {
    _.assert( _.boolIs( srcArray[ i ] ) || _.numberIs( srcArray[ i ] ) || srcArray[ i ] === null );
    result += srcArray[ i ];
  }

  return result;
}

//

/**
 * The longCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 *
 * @param { longLike } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * _.longCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 * // returns 3
 *
 * @example
 * _.longCountUnique( [ 1, 2, 3, 4, 5 ] );
 * // returns 0
 *
 * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 * @function longCountUnique
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function longCountUnique( src, onEvaluate )
{
  let found = [];
  onEvaluate = onEvaluate || function( e ){ return e };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longLike( src ), 'longCountUnique :', 'Expects ArrayLike' );
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
// xxx
// --

// /**
//  * @summary Creates new array based on type of `src` array. Takes length of new array from second argument `length`.
//  * @param {} src Source array
//  * @param {Number} [ length ] Lengthof target array.
//  * @function makeSimilar
//  * @memberof wTools."wTools.defaultLong"
//  */
//
// function makeSimilar( src, length )
// {
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//
//   let result = _.longMakeUndefined( src, length );
//
//   return result;
// }

// //
//
// /**
//  * @summary Creates new array of length( length ).
//  * @description Type of array depends on `type`( see examples ).
//  * @param {Number} length Lengthof new array.
//  *
//  * @example
//  * _.defaultLong.makeArrayOfLength(1);
//  * // returns instance of Array
//  *
//  * @example
//  * _.withDefaultLong.Fx.makeArrayOfLength(1);
//  * // returns instance of F32x
//  *
//  * @function makeArrayOfLength
//  * @memberof wTools."wTools.defaultLong"
//  */
//
// function makeArrayOfLength( length )
// {
//
//   if( length === undefined )
//   length = 0;
//
//   _.assert( length === undefined || length >= 0 );
//   _.assert( arguments.length === 0 || arguments.length === 1 );
//
//   let result = new this.longDescriptor.type( length );
//
//   return result;
// }
//
// //
//
// /**
//  * @summary Creates new array of length( length ) filled with zeroes.
//  * @description Type of array depends on `type`( see examples ).
//  * @param {Number} length Lengthof new array.
//  *
//  * @example
//  * _.defaultLong.makeArrayOfLengthZeroed( 2 );
//  * // returns Array [ 0,0 ]
//  *
//  * @function makeArrayOfLengthZeroed
//  * @memberof wTools."wTools.defaultLong"
//  */
//
// function makeArrayOfLengthZeroed( length )
// {
//   if( length === undefined )
//   length = 0;
//
//   _.assert( length === undefined || length >= 0 );
//   _.assert( arguments.length === 0 || arguments.length === 1 );
//
//   let result = new this.longDescriptor.type( length );
//
//   if( this.longDescriptor.type === Array )
//   for( let i = 0 ; i < length ; i++ )
//   result[ i ] = 0;
//
//   return result;
// }

// //
//
// /**
//  * @summary Creates new array taking elements from source array `src`.
//  * @description Type of new array depends on `type`( see examples ).
//  * Returns new array of type `type` or src if types are same.
//  * @param {} src Source array.
//  *
//  * @example
//  * let src =  _.withDefaultLong.Fx.makeArrayOfLength( 2 );
//  * _.defaultLong.arrayFromCoercing( src );
//  * // returns Array [ 0,0 ]
//  *
//  * @example
//  * let src =  _.defaultLong.makeArrayOfLength( 2 );
//  * _.withDefaultLong.Fx.arrayFromCoercing( src );
//  * // returns F32x [ 0,0 ]
//  *
//  * @example
//  * let src =  _.defaultLong.makeArrayOfLength( 2 );
//  * _.defaultLong.arrayFromCoercing( src );
//  * // returns src
//  *
//  * @function arrayFromCoercing
//  * @memberof wTools."wTools.defaultLong"
//  */
//
// function arrayFromCoercing( src )
// {
//   _.assert( _.longIs( src ) );
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   if( src.constructor === this.longDescriptor.type )
//   return src;
//
//   let result;
//
//   if( this.longDescriptor.type === Array )
//   result = new( _.constructorJoin( this.longDescriptor.type, src ) );
//   else
//   result = new this.longDescriptor.type( src );
//
//   return result;
// }

// --
// extension
// --

let Extension =
{

  // arguments array

  argumentsArrayMake,
  _argumentsArrayMake,
  argumentsArrayFrom,

  //

  _longMake_functor,

  longMake,
  longMakeEmpty,
  _longMakeOfLength,
  longMakeUndefined,
  longMakeZeroed,
  _longClone,
  longShallowClone,

  longFrom, /* qqq2 : cover please */
  longFromCoercing, /* qqq2 : cover please */

  longRepresent,
  longSlice,
  longEmpty,

  longBut,
  longButInplace,
  _argumentsOnlyLong,
  longBut_, /* !!! : use instead of longBut, longButInplace */
  longSelect,
  longSelect_, /* !!! : use instead of longSelect, longSelectInplace */
  longSelectInplace,
  longGrow,
  longGrow_, /* !!! : use instead of longGrow, longGrowInplace */
  longGrowInplace,
  longRelength,
  longRelengthInplace,
  longRelength_, /* !!! : use instead of longRelength, longRelengthInplace */

  // array checker

  longCompare,
  longIdentical,

  longHas,
  longHasAny, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer | Dmytro : reimplemented, documented, covered */
  longHasAll, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer | Dmytro : reimplemented, documented, covered */
  longHasNone, /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer | Dmytro : reimplemented, documented, covered */
  longHasDepth,

  longAll,
  longAny,
  longNone,

  // long sequential search

  longCountElement, /* qqq : cover by tests | Dmytro : covered */
  longCountTotal, /* qqq : cover by tests | Dmytro : covered */
  longCountUnique,

  //

  /* qqq2 : adjust jsdoc of each routine below */

  // makeSimilar,
  // makeArrayOfLength,
  // makeArrayOfLengthZeroed,
  // arrayFrom : arrayFromCoercing,
  // arrayFromCoercing,

  // to replace

  /*
  | routine          | makes new dst container                  | saves dst container                                     |
  | ---------------- | ---------------------------------------- | ------------------------------------------------------- |
  | longBut_         | _.longBut_( null, src, range )           | _.longBut_( src )                                       |
  |                  | _.longBut_( dst, src, range )            | _.longBut_( src, range )                                |
  |                  | if dst not resizable and change length   | _.longBut_( dst, dst )                                  |
  |                  |                                          | _.longBut_( dst, dst, range ) if dst is resizable       |
  |                  |                                          | or dst not change length                                |
  |                  |                                          | _.longBut_( dst, src, range ) if dst is resizable       |
  |                  |                                          | or dst not change length                                |
  | ---------------  | ---------------------------------------- | ------------------------------------------------------  |
  | longSelect_      | _.longSelect_( null, src, range )        | _.longSelect_( src )                                    |
  |                  | _.longSelect_( dst, src, range )         | _.longSelect_( src, range )                             |
  |                  | if dst not resizable and change length   | _.longSelect_( dst, dst )                               |
  |                  |                                          | _.longSelect_( dst, dst, range ) if dst is resizable    |
  |                  |                                          | or dst not change length                                |
  |                  |                                          | _.longSelect_( dst, src, range ) if dst is resizable    |
  |                  |                                          | or dst not change length                                |
  | ---------------  | ---------------------------------------- | ------------------------------------------------------  |
  | longGrow_        | _.longGrow_( null, src, range )          | _.longGrow_( src )                                      |
  |                  | _.longGrow_( dst, src, range )           | _.longGrow_( src, range )                               |
  |                  | if dst not resizable and change length   | _.longGrow_( dst, dst )                                 |
  |                  |                                          | _.longGrow_( dst, dst, range ) if dst is resizable      |
  |                  |                                          | or dst not change length                                |
  |                  |                                          | _.longGrow_( dst, src, range ) if dst is resizable      |
  |                  |                                          | or dst not change length                                |
  | ---------------  | ---------------------------------------- | ------------------------------------------------------  |
  | longRelength_    | _.longRelength_( null, src, range )      | _.longRelength_( src )                                  |
  |                  | _.longRelength_( dst, src, range )       | _.longRelength_( src, range )                           |
  |                  | if dst not resizable and change length   | _.longRelength_( dst, dst )                             |
  |                  |                                          | _.longRelength_( dst, dst, range ) if dst is resizable  |
  |                  |                                          | or dst not change length                                |
  |                  |                                          | _.longRelength_( dst, src, range ) if dst is resizable  |
  |                  |                                          | or dst not change length                                |
  | ---------------  | ---------------------------------------- | ------------------------------------------------------- |
  */

}

_.mapSupplement( _, Extension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
