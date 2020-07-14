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
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( src === undefined || src === null )
  src = 0;
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
      else if( _.routineIs( src ) )
      {
        length = 0;
      }
      else _.assert( 0 );
    }

    if( !length )
    length = 0;

    /* */

    if( ins === undefined || ins === null )
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
          // src = null;
        }
      }
      else
      {
        ins = null;
      }
    }
    else if( !_.longLike( ins ) )
    {
      if( _.longIs( src ) )
      ins = src;
      else
      ins = null;
    }

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

    _.assert( _.longLike( result ) );

    return result;
  }

}

//

/**
 * The routine longMake() returns a new Long with the same type as source Long {-src-}. New Long makes from inserted Long {-ins-}
 * or if {-ins-} is number, the Long makes from {-src-} with length equal to {-ins-}. If {-ins-} is not provided, routine  makes
 * container with default Long type. New Long contains {-src-} elements.
 *
 * @param { Long|Function|Null } src - Instance of Long or constructor, defines type of returned Long. If null is provided, routine returns
 * container with default Long type.
 * @param { Number|Long|Null } ins - Defines length of new Long. If Long is provided, routine makes new Long from {-ins-} with {-src-} type.
 * If null is provided, then routine makes container with default Long type.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * _.longMake();
 * // returns []
 *
 * @example
 * _.longMake( null );
 * // returns []
 *
 * @example
 * _.longMake( null, null );
 * // returns []
 *
 * @example
 * _.longMake( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.longMake( 3, null );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.longMake( [ 1, 2, 3, 4 ] );
 * // returns [ 1, 2, 3, 4 ];
 *
 * @example
 * _.longMake( [ 1, 2, 3, 4 ], null );
 * // returns [ 1, 2, 3, 4 ];
 *
 * @example
 * _.longMake( [ 1, 2 ], 4 );
 * // returns [ 1, 2, undefined, undefined ];
 *
 * @example
 * let got = _.longMake( _.unrollMake( [] ), [ 1, 2, 3 ] );
 * console.log( got );
 * // log [ 1, 2, 3 ];
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let got = _.longMake( new F32x( [ 1, 2, 3 ] ), 1 );
 * console.log( got );
 * // log Float32Array[ 1 ];
 *
 * @example
 * let got = _.longMake( Array, null );
 * console.log( got );
 * // log [];
 *
 * @example
 * let got = _.longMake( Array, 3 );
 * console.log( got );
 * // log [ undefined, undefined, undefined ];
 *
 * @returns { Long } - Returns a Long with type of source Long {-src-} which makes from {-ins-}. If {-ins-} is not
 * provided, then routine returns container with default Long type.
 * @function longMake
 * @throws { Error } If arguments.length is more then two.
 * @throws { Error } If {-src-} is not a Long, not a constructor, not null.
 * @throws { Error } If {-ins-} is not a number, not a Long, not null, not undefined.
 * @throws { Error } If {-ins-} or ins.length has a not finite value.
 * @namespace Tools
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
      result = _.unrollIs( src ) ? _.unrollMake( ins ) : new( _.constructorJoin( src.constructor, ins ) ); /* Dmytro : needs to improve, maybe remove */
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
  {
    return _.unrollMake( 0 );
  }
  else if( src === null || _.argumentsArrayIs( src ) )
  {
    return this.longDescriptor.make( 0 );
  }
  else if( _.arrayIs( src ) || _.bufferTypedIs( src ) )
  {
    return new src.constructor();
  }
  // else if( _.routineIs( src ) ) /* qqq : it was covered badly! */
  else if( _.routineIs( src.constructor ) )
  {
    let result = new src.constructor();
    _.assert( _.long_.lengthOf( result ) === 0, 'Constructor should return empty long' );
    return result;
  }
  _.assert( 0, `Unknown long subtype ${_.strType( src )}` );
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

let _longMakeOfLength = _longMake_functor( function( src, ins, length, minLength )
{
  let result;

  if( _.routineIs( src ) )
  {
    result = new src( length );
  }
  else if( _.arrayIs( src ) )
  {
    debugger;
    if( length === src.length )
    {
      result = new( _.constructorJoin( src.constructor, src ) );
    }
    else if( length < src.length )
    {
      result = src.slice( 0, length );
    }
    else
    {
      result = new src.constructor( length );
      for( let i = 0 ; i < minLength ; i++ )
      result[ i ] = src[ i ];
    }
  }
  else
  {
    if( length === src.length )
    {
      result = new src.constructor( ins );
    }
    else
    {
      result = new src.constructor( length );
      for( let i = 0 ; i < minLength ; i++ )
      result[ i ] = src[ i ];
    }
  }

  return result;
});

// function _longMakeOfLength( src, len )
// {
//   let result;
//
//   // if( src === null )
//   // src = [];
//
//   if( _.longLike( len ) )
//   len = len.length;
//
//   if( len === undefined )
//   {
//     if( src === null )
//     {
//       len = 0;
//     }
//     else if( _.longLike( src ) )
//     {
//       len = src.length;
//     }
//     else if( _.numberIs( src ) )
//     {
//       len = src;
//       src = null;
//     }
//     else _.assert( 0 );
//   }
//
//   if( !len )
//   len = 0;
//
//   if( _.argumentsArrayIs( src ) )
//   src = this.longDescriptor.name === 'ArgumentsArray' ? this.longDescriptor.make : this.longDescriptor.make( src );
//
//   if( src === null )
//   src = this.longDescriptor.make;
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.numberIsFinite( len ) );
//   _.assert( _.routineIs( src ) || _.longLike( src ), () => 'Expects long, but got ' + _.strType( src ) );
//
//   if( _.routineIs( src ) )
//   {
//     result = new src( len );
//   }
//   else if( _.arrayIs( src ) )
//   {
//     if( len === src.length )
//     {
//       result = new( _.constructorJoin( src.constructor, src ) );
//     }
//     else if( len < src.length )
//     {
//       result = src.slice( 0, len );
//     }
//     else
//     {
//       result = new src.constructor( len );
//       let minLen = Math.min( len, src.length );
//       for( let i = 0 ; i < minLen ; i++ )
//       result[ i ] = src[ i ];
//     }
//   }
//   else
//   {
//     if( len === src.length )
//     {
//       result = new src.constructor( len );
//     }
//     else
//     {
//       result = new src.constructor( len );
//       let minLen = Math.min( len, src.length );
//       for( let i = 0 ; i < minLen ; i++ )
//       result[ i ] = src[ i ];
//     }
//   }
//
//   _.assert( _.longLike( result ), 'Instance should be a long' );
//
//   return result;
// }

//

/**
 * The routine longMakeUndefined() returns a new Long with the same type as source Long {-src-}. New Long has length equal to {-ins-}
 * argument. If {-ins-} is not provided, then new container has default Long type and length of source Long {-src-}.
 *
 * @param { Long|Function|Null } src - Long or constructor, defines type of returned Long. If null is provided, then routine returns
 * container with default Long type.
 * @param { Number|Long } ins - Defines length of new Long. If {-ins-} is Long, then routine makes new Long with length equal to ins.length.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * _.longMakeUndefined();
 * // returns []
 *
 * @example
 * _.longMakeUndefined( null );
 * // returns []
 *
 * @example
 * _.longMakeUndefined( null, null );
 * // returns []
 *
 * @example
 * _.longMakeUndefined( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.longMakeUndefined( 3, undefined );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.longMakeUndefined( [ 1, 2, 3, 4 ] );
 * // returns [ undefined, undefined, undefined, undefined ];
 *
 * @example
 * _.longMakeUndefined( [ 1, 2, 3, 4 ], null );
 * // returns [ undefined, undefined, undefined, undefined ];
 *
 * @example
 * _.longMakeUndefined( [ 1, 2, 3, 4 ], 2 );
 * // returns [ undefined, undefined ];
 *
 * @example
 * let got = _.longMakeUndefined( _.unrollMake( [] ), [ 1, 2, 3 ] );
 * console.log( got );
 * // log [ undefined, undefined, undefined ];
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let got = _.longMakeUndefined( new F32x( [ 1, 2, 3, 4 ] ), 2 );
 * console.log( got );
 * // log Float32Array[ undefined, undefined ];
 *
 * @example
 * let got = _.longMakeUndefined( Array, null );
 * console.log( got );
 * // log [];
 *
 * @example
 * let got = _.longMakeUndefined( Array, 3 );
 * console.log( got );
 * // log [ undefined, undefined, undefined ];
 *
 * @returns { Long } - Returns a Long with type of source Long {-src-} with a certain length defined by {-ins-}.
 * If {-ins-} is not defined, then routine returns container with default Long type. Length of the new container defines by {-src-}.
 * @function longMakeUndefined
 * @throws { Error } If arguments.length is more then two.
 * @throws { Error } If the {-src-} is not a Long, not a constructor, not null.
 * @throws { Error } If the {-ins-} is not a number, not a Long, not null, not undefined.
 * @throws { Error } If the {-ins-} or ins.length has a not finite value.
 * @namespace Tools
 */

/*
aaa : extend coverage and documentation of longMakeUndefined
Dmytro : extended coverage and documentation
aaa : longMakeUndefined does not create unrolls, but should
Dmytro : longMakeUndefined creates unrolls.
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

/* aaa3 : teach to accept only length */
/* aaa3 : use default long type if type is not clear */
/* aaa3 : allow buffers which are long */
/* aaa3 : relevant to all routines longMake* of such kind */
/* Dmytro : all requirements implemented and covered */

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

function longMakeFilling( type, value, length )
{
  let result;

  // _.assert( arguments.length === 2 || arguments.length === 3 ); /* Dmytro : double check */

  if( arguments.length === 2 )
  {
    value = arguments[ 0 ];
    length = arguments[ 1 ];
    if( _.longIs( length ) )
    {
      if( _.argumentsArrayIs( length ) )
      type = null;
      else
      type = length.constructor;
    }
    else
    {
      type = null;
    }
  }
  else if( arguments.length !== 3 )
  {
    _.assert( 0, 'Expects two or three arguments' );
  }

  /* Dmytro : missed */
  if( _.longIs( length ) )
  length = length.length;

  _.assert( value !== undefined );
  _.assert( _.numberIs( length ) );
  _.assert( type === null || _.routineIs( type ) || _.longIs( type ) );

  result = this.longMake( type, length );
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = value;

  return result;
}

//

/**
 * The routine longFill() fills elements the given Long {-src-} by static value. The range of replaced elements
 * defines by a parameter {-range-}. If it possible, routine longFill() saves original container {-src-}.
 *
 * @param { Long } src - The source Long.
 * @param { * } value - Any value to fill the elements in the {-src-}.
 * If {-value-} is not provided, the routine fills elements of source Long by 0.
 * @param { Range|Number } range - The two-element array that defines the start index and the end index for copying elements.
 * If {-range-} is number, then it defines the end index, and the start index is 0.
 * If range[ 0 ] < 0, then start index sets to 0, end index increments by absolute value of range[ 0 ].
 * If range[ 1 ] <= range[ 0 ], then routine returns a copy of original Long.
 * If {-range-} is not provided, routine fills all elements of the {-src-}.
 *
 * @example
 * _.longFill( [ 1, 2, 3, 4, 5 ] );
 * // returns [ 0, 0, 0, 0, 0 ]
 *
 * @example
 * _.longFill( [ 1, 2, 3, 4, 5 ], 'a' );
 * // returns [ 'a', 'a', 'a', 'a', 'a' ]
 *
 * @example
 * _.longFill( [ 1, 2, 3, 4, 5 ], 'a', 2 );
 * // returns [ 'a', 'a', 3, 4, 5 ]
 *
 * @example
 * _.longFill( [ 1, 2, 3, 4, 5 ], 'a', [ 1, 3 ] );
 * // returns [ 1, 'a', 'a', 4, 5 ]
 *
 * @example
 * _.longFill( [ 1, 2, 3, 4, 5 ], 'a', [ -1, 3 ] );
 * // returns [ 'a', 'a', 'a', 'a', 5 ]
 *
 * @example
 * _.longFill( [ 1, 2, 3, 4, 5 ], 'a', [ 4, 3 ] );
 * // returns [ 1, 2, 3, 4, 5 ]
 *
 * @returns { Long } - If it is possible, returns the source Long filled with a static value.
 * Otherwise, returns copy of the source Long filled with a static value.
 * @function longFill
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If {-src-} is not a Long.
 * @throws { Error } If {-range-} is not a Range or not a Number.
 * @namespace Tools
 */

function longFill( src, value, range )
{

  if( range === undefined )
  range = [ 0, src.length ];
  if( _.numberIs( range ) )
  range = [ 0, range ];

  _.assert( 1 <= arguments.length && arguments.length <= 3 );
  _.assert( _.longIs( src ) );
  _.assert( _.rangeIs( range ) );

  if( value === undefined )
  value = 0;

  src = _.longGrowInplace( src, range );

  let offset = Math.max( -range[ 0 ], 0 );

  if( range[ 0 ] < 0 )
  {
    range[ 1 ] -= range[ 0 ];
    range[ 0 ] = 0;
  }

  if( _.routineIs( src.fill ) )
  {
    src.fill( value, range[ 0 ], range[ 1 ] + offset );
  }
  else
  {
    for( let t = range[ 0 ] ; t < range[ 1 ] + offset ; t++ )
    src[ t ] = value;
  }

  return src;
}

//

/**
 * The longDuplicate() routine returns an array with duplicate values of a certain number of times.
 *
 * @param { objectLike } [ o = {  } ] o - The set of arguments.
 * @param { longIs } o.src - The given initial array.
 * @param { longIs } o.result - To collect all data.
 * @param { Number } [ o.nScalarsPerElement = 1 ] o.nScalarsPerElement - The certain number of times
 * to append the next value from (srcArray or o.src) to the (o.result).
 * If (o.nScalarsPerElement) is greater that length of a (srcArray or o.src) it appends the 'undefined'.
 * @param { Number } [ o.nDupsPerElement = 2 ] o.nDupsPerElement = 2 - The number of duplicates per element.
 *
 * @example
 * _.longDuplicate( [ 'a', 'b', 'c' ] );
 * // returns [ 'a', 'a', 'b', 'b', 'c', 'c' ]
 *
 * @example
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   nScalarsPerElement : 2,
 *   nDupsPerElement : 3
 * };
 * _.longDuplicate( options, {} );
 * // returns [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ]
 *
 * @example
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   nScalarsPerElement : 3,
 *   nDupsPerElement : 3
 * };
 * _.longDuplicate( options, { a : 7, b : 13 } );
 * // returns [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ]
 *
 * @returns { Array } Returns an array with duplicate values of a certain number of times.
 * @function longDuplicate
 * @throws { Error } Will throw an Error if ( o ) is not an objectLike.
 * @namespace Tools
 */

function longDuplicate( o ) /* xxx : review interface */
{
  // _.assert( arguments.length === 1 || arguments.length === 2 );

  _.assert( _.mapIs( o ) );

  // if( arguments.length === 2 )
  // {
  //   o = { src : arguments[ 0 ], nDupsPerElement : arguments[ 1 ] };
  // }
  // else if( arguments.length === 1 )
  // {
  //   if( !_.mapIs( o ) )
  //   o = { src : o };
  // }
  // else _.assert( 0 );

  if( o.nScalarsPerElement === 0 )
  if( o.src.length === 0 )
  o.nScalarsPerElement = 1;
  else
  o.nScalarsPerElement = o.src.length;

  _.routineOptions( longDuplicate, o );
  _.assert( _.numberIs( o.nDupsPerElement ) );
  _.assert( _.longIs( o.src ), 'Expects Long {-o.src-}' );
  _.assert( _.intIs( o.src.length / o.nScalarsPerElement ) );

  if( o.nDupsPerElement === 1 )
  {
    if( o.dst )
    {
      _.assert( _.longIs( o.dst ) || _.bufferTypedIs( o.dst ), 'Expects o.dst as longIs or TypedArray if nDupsPerElement equals 1' );

      if( _.bufferTypedIs( o.dst ) )
      o.dst = _.longShallowClone( o.dst, o.src );
      else if( _.longIs( o.dst ) )
      o.dst.push.apply( o.dst, o.src );
    }
    else
    {
      o.dst = o.src;
    }
    return o.dst;
  }

  let length = o.src.length * o.nDupsPerElement;
  let numberOfElements = o.src.length / o.nScalarsPerElement;

  if( o.dst )
  _.assert( o.dst.length >= length );

  o.dst = o.dst || _.longMakeUndefined( o.src, length );

  let rlength = o.dst.length;

  for( let c = 0, cl = numberOfElements ; c < cl ; c++ )
  {

    for( let d = 0, dl = o.nDupsPerElement ; d < dl ; d++ )
    {

      for( let e = 0, el = o.nScalarsPerElement ; e < el ; e++ )
      {
        let indexDst = c*o.nScalarsPerElement*o.nDupsPerElement + d*o.nScalarsPerElement + e;
        let indexSrc = c*o.nScalarsPerElement+e;
        o.dst[ indexDst ] = o.src[ indexSrc ];
      }

    }

  }

  _.assert( o.dst.length === rlength );

  return o.dst;
}

longDuplicate.defaults = /* qqq : cover. take into account extreme cases */
{
  src : null,
  dst : null,
  nScalarsPerElement : 1,
  nDupsPerElement : 2,
}

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
 * @namespace Tools
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

/* aaa : add good coverage for longFrom. */
/* Dmytro : covered, two test routines implemented */

function longFrom( src )
{
  _.assert( arguments.length === 1 );
  if( src instanceof this.longDescriptor.type )
  if( !_.unrollIs( src ) && _.longIs( src ) )
  return src;
  return this.longMake.call( this, src );
}

//

/**
 * The routine longFromCoercing() returns Long from provided argument {-src-}. The feature of routine is possibility of
 * converting an object-like {-src-} into Long. Also, routine longFromCoercing() converts string with number literals
 * to a Long.
 * If routine convert {-src-}, then result returns in container with default Long type.
 *
 * @param { Long|ObjectLike|String } src - An instance to convert into Long.
 * If {-src-} is a Long and it type is equal to current default Long type, then routine convert not {-src-}.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * let src = [ 3, 7, 13, 'abc', false, undefined, null, {} ];
 * let got = _.longFromCoercing( src );
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * let src = _.argumentsArrayMake( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 * let got = _.longFromCoercing( src );
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * let src = { a : 3, b : 7, c : 13 };
 * let got = _.longFromCoercing( src );
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 *
 * @example
 * let src = "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl";
 * let got = _.longFromCoercing( src );
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 *
 * @returns { Long } - Returns a Long. If {-src-} is Long with default Long type, then routine returns original {-src-}.
 * Otherwise, it makes new container with default Long type.
 * @function longFromCoercing
 * @throws { Error } If arguments.length is less or more then one.
 * @throws { Error } If {-src-} is not a Long, not an object-like, not a string.
 * @namespace Tools
 */

function longFromCoercing( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( src instanceof this.longDescriptor.type && _.longIs( src ) )
  return src;

  /* Dmytro : this condition make recursive call with array from argumentsArray. But first condition return any long object
     ( ArgumentsArray.type is  Object ), and next make other long types without recursive call */
  // if( _.argumentsArrayIs( src ) )
  // return this.longFromCoercing( Array.prototype.slice.call( src ) );

  if( _.longIs( src ) )
  return this.longDescriptor.from( src );

  if( _.objectIs( src ) )
  return this.longFromCoercing( _.mapToArray( src ) );

  /* aaa : cover */
  /* Dmytro : covered */
  if( _.strIs( src ) )
  return this.longFromCoercing( this.arrayFromStr( src ) );

  _.assert( 0, `Unknown data type : ${ _.strType( src ) }` );
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
 * @namespace Tools
 */

/* qqq2 : review. ask */
/* qqq2 : implement bufferRepresent_( any buffer )
should return undefined if cant create representation
let representation = _.bufferRepresent_( src );
representation[ 4 ] = x; // src changed too
*/
/* qqq2 : implement longRepresent_( src, crange ~ [ first, last ] ) */

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
 * @namespace Tools
 */

/* aaa : optimize */
/* Dmytro : optimized */

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
  return Array.prototype.slice.call( array, f, l );
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
 * @namespace Tools
 */

/*
qqq : routine longBut requires good test coverage and documentation | Dmytro : extended routine coverage by using given clarifications, documented
 */

function longBut( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longShallowClone( array );
  // return _.longMake( array );

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
 * @namespace Tools
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

function _relength_pre( dst, src, range, ins )
{
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  /* qqq : suspicious */

  if( dst === null )
  {
    dst = true;
  }
  else if( dst === src )
  {
    dst = false;
  }
  else if( arguments.length === 4 )
  {
    _.assert( _.longLike( dst ), '{-dst-} should be Long' );
  }
  else
  {
    /* qqq2 : wrong. src could pass check rangeIs if length is 2 */
    /* Dmytro : this check means: if length > 1 and second argument is not a range, then it is source container, and third argument is range */
    // if( arguments.length > 1 && !_.rangeIs( src ) && !_.numberIs( src ) )
    // {
    //   _.assert( _.longLike( dst ) );
    // }
    // else
    // {
    //   ins = range;
    //   range = src;
    //   src = dst;
    //   dst = false;
    // }

    ins = range;
    range = src;
    src = dst;
    dst = false;
  }

  _.assert( _.longLike( src ) );

  return [ dst, src, range, ins ];
}

//

/* aaa2 : rename arguments. ask */

function longBut_( dst, src, crange, ins )
{
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( arguments.length < 4 && dst !== null && dst !== src )
  {
    dst = arguments[ 0 ];
    src = arguments[ 0 ];
    crange = arguments[ 1 ];
    ins = arguments[ 2 ];
  }

  if( crange === undefined )
  return resultMake( dst, src )
  else if( _.numberIs( crange ) )
  crange = [ crange, crange + 1 ];

  _.assert( _.longLike( src ) );
  _.assert( _.rangeIs( crange ) );
  _.assert( _.longLike( ins ) || ins === undefined || ins === null );

  _.rangeClamp( crange, [ 0, src.length ] );
  if( crange[ 1 ] < crange[ 0 ] )
  crange[ 1 ] = crange[ 0 ];

  let delta = crange[ 1 ] - crange[ 0 ];
  let insLength = ins ? ins.length : 0;
  let delta2 = delta - insLength;
  let resultLength = src.length - delta2;

  let result;
  if( dst === null )
  {
    result = _.longMakeUndefined( src, resultLength );
  }
  else if( dst === src )
  {
    if( _.arrayLikeResizable( dst ) )
    {
      ins ? dst.splice( crange[ 0 ], delta, ... ins ) : dst.splice( crange[ 0 ], delta );
      return dst;
    }
    else if( dst.length !== resultLength || _.argumentsArrayIs( dst ) )
    {
      result = _.longMakeUndefined( dst, resultLength );
    }
    else
    {
      result = dst;
    }
  }
  else if( dst.length !== resultLength )
  {
    if( _.arrayLikeResizable( dst ) )
    {
      dst.length = resultLength;
    }
    else
    {
      dst = _.longMakeUndefined( dst, resultLength );
    }

    result = dst;
  }

  /* */

  result = resultMake( result, src, ins );

  return result;

  /* */

  function resultMake( dst, src, ins )
  {
    if( dst !== src )
    {
      for( let i = 0 ; i < crange[ 0 ] ; i++ )
      dst[ i ] = src[ i ];

      for( let i = crange[ 1 ] ; i < src.length ; i++ )
      dst[ i - delta2 ] = src[ i ];
    }

    if( ins )
    for( let i = 0 ; i < ins.length ; i++ )
    dst[ crange[ 0 ] + i ] = ins[ i ];

    return dst;
  }
}

//

// /* qqq2 : rename arguments. ask */
// function longBut_( dst, array, range, val )
// {
//
//   [ dst, array, range, val ] = _relength_pre.apply( this, arguments );
//
//   if( _.arrayLikeResizable( array ) && !_.bufferAnyIs( dst ) )
//   return _.arrayBut_.apply( this, arguments ); /* qqq2 : ? */
//
//   if( range === undefined )
//   return returnDst();
//
//   if( _.numberIs( range ) )
//   range = [ range, range + 1 ];
//
//   _.assert( _.rangeIs( range ) );
//
//   _.rangeClamp( range, [ 0, array.length ] );
//   if( range[ 1 ] < range[ 0 ] )
//   range[ 1 ] = range[ 0 ];
//
//   if( range[ 0 ] === range[ 1 ] && val === undefined ) /* qqq2 : ? */
//   return returnDst();
//
//   let d = range[ 1 ] - range[ 0 ];
//   let len = val ? val.length : 0;
//   let d2 = d - len;
//   let l2 = array.length - d2;
//
//   let result;
//   if( _.boolIs( dst ) )
//   result = _.longMakeUndefined( array, l2 );
//   else if( _.arrayLikeResizable( dst ) )
//   result = _.longEmpty( dst ); /* qqq2 : ? */
//   else if( dst.length !== l2 )
//   result = _.longMakeUndefined( dst, l2 );
//   else
//   result = dst;
//
//   for( let i = 0 ; i < range[ 0 ] ; i++ )
//   result[ i ] = array[ i ];
//
//   for( let i = range[ 1 ] ; i < array.length ; i++ )
//   result[ i-d2 ] = array[ i ];
//
//   if( val )
//   for( let i = 0 ; i < val.length ; i++ )
//   result[ range[ 0 ]+i ] = val[ i ];
//
//   return result;
//
//   /* */
//
//   function returnDst() /* qqq2 : ? */
//   {
//     if( dst.length !== undefined )
//     {
//       if( _.arrayLikeResizable( dst ) )
//       {
//         return dst.splice( 0, dst.length, ... array );
//       }
//       else
//       {
//         if( dst.length !== array.length )
//         dst = _.longMakeUndefined( dst, array.length );
//
//         for( let i = 0; i < dst.length; i++ )
//         dst[ i ] = array[ i ];
//
//         return dst;
//       }
//     }
//     return dst === true ? _.longMake( array ) : array;
//   }
// }

//

/**
 * The routine longShrink() returns a copy of a portion of provided Long {-array-} into a new Long
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
 * var got = _.longShrink( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longShrink( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longShrink( src, [ 1, 4 ], [ 'str' ] );
 * console.log( got );
 * // log [ 2, 3, 4 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longShrink( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longShrink( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a copy of source Long containing the extracted elements. The copy has same type as source Long.
 * @function longShrink
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @namespace Tools
 */

/*
  qqq : extend documentation and test coverage of longShrink | Dmytro : documented, covered.
*/

function longShrink( array, range, val )
{
  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  // return _.longMake( array, array.length ? array.length : 0 );
  return _.longShallowClone( array );

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
  // return _.longMake( array, array.length );
  return _.longShallowClone( array );

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
 * The routine longShrinkInplace() returns a portion of provided Long {-array-} selected by {-range-}.
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
 * var got = _.longShrinkInplace( src );
 * console.log( got );
 * // log Float32Array[ 1, 2, 3, 4, 5 ]
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = _.unrollMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longShrinkInplace( src, 2, [ 'str' ] );
 * console.log( got );
 * // log [ 3, 4, 5 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 * console.log( got === src );
 * // log true
 *
 * @example
 * var src = new U8x( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longShrinkInplace( src, [ 1, 4 ], [ 1 ] );
 * console.log( got );
 * // log Uint8Array[ 2, 3, 4 ]
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = _.argumentsArrayMake( [ 1, 2, 3, 4, 5 ] );
 * var got = _.longShrinkInplace( src, [ -5, 10 ], [ 'str' ] );
 * console.log( got );
 * // log [ 1, 2, 3, 4, 5 ]
 * console.log( _.argumentsArrayIs( got ) );
 * // log false
 * console.log( got === src );
 * // log false
 *
 * @example
 * var src = [ 1, 2, 3, 4, 5 ];
 * var got = _.longShrinkInplace( src, [ 4, 1 ], [ 'str' ] );
 * console.log( got );
 * // log []
 * console.log( got === src );
 * // log false
 *
 * @returns { Long } Returns a Long containing the selected elements. If Long is resizable,
 * routine returns modified source Long, otherwise, returns a copy.
 * @function longShrinkInplace
 * @throws { Error } If arguments.length is less then one or more then three.
 * @throws { Error } If argument {-array-} is not a Long.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range elements is not number / undefined.
 * @namespace Tools
 */

/*
  qqq : extend documentation and test coverage of longShrinkInplace | Dmytro : documented, covered
  qqq : implement arrayShrink | Dmytro : implemented
  qqq : implement arrayShrinkInplace | Dmytro : implemented
*/

function longShrinkInplace( array, range, val )
{

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( _.arrayLikeResizable( array ) )
  return _.arrayShrinkInplace( array, range, val );

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
  return _.longShrink( array, range, val );
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

function longShrink_( dst, array, range, val )
{

  [ dst, array, range, val ] = _relength_pre.apply( this, arguments );

  if( _.arrayLikeResizable( array ) )
  return _.arrayShrink_.apply( this, arguments );

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
 * @namespace Tools
 */

/*
  qqq : extend documentation and test coverage of longGrowInplace | Dmytro : extended documentation, covered routine longGrow, longGrowInplace
  qqq : implement arrayGrow | Dmytro : implemented
  qqq : implement arrayGrowInplace | Dmytro : implemented
*/

function longGrow( array, range, val )
{
  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longShallowClone( array );

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

  if( l === array.length && -range[ 0 ] <= 0 )
  return _.longShallowClone( array );

  /* */

  let f2 = Math.max( -range[ 0 ], 0 );
  let l2 = Math.min( array.length, l );

  // debugger;
  let result = _.longMakeUndefined( array, range[ 1 ] > array.length ? l : array.length + f2 );
  for( let r = f2 ; r < l2 + f2 ; r++ )
  result[ r ] = array[ r - f2 ];

  /* */

  if( val !== undefined )
  {
    for( let r = 0 ; r < f2 ; r++ )
    result[ r ] = val;
    for( let r = l2 + f2; r < result.length ; r++ )
    result[ r ] = val;
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
 * @namespace Tools
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

  if( l === array.length && -range[ 0 ] <= 0 )
  return array;
  else
  return _.longGrow( array, range, val );
}

//

function longGrow_( dst, src, crange, ins )
{
  _.assert( 1 <= arguments.length && arguments.length <= 4 );

  if( arguments.length < 4 && dst !== null && dst !== src )
  {
    dst = arguments[ 0 ];
    src = arguments[ 0 ];
    crange = arguments[ 1 ];
    ins = arguments[ 2 ];
  }

  if( crange === undefined )
  crange = [ 0, src.length - 1 ];
  if( _.numberIs( crange ) )
  crange = [ 0, crange ];

  _.assert( _.longIs( dst ) || dst === null, 'Expects {-dst-} of any long type or null' );
  _.assert( _.rangeIs( crange ), 'Expects crange {-crange-}' );

  crange[ 0 ] = crange[ 0 ] !== undefined ? crange[ 0 ] : 0;
  crange[ 1 ] = crange[ 1 ] !== undefined ? crange[ 1 ] : src.length;

  let f = crange[ 0 ];
  let l = crange[ 1 ];

  if( f < 0 )
  {
    l -= f;
    f -= f;
  }

  if( l < f )
  l = f;

  if( f > 0 )
  f = 0;
  if( l < src.length - 1 )
  l = src.length - 1;

  let f2 = Math.max( -crange[ 0 ], 0 );
  let l2 = Math.min( src.length - 1 + f2, l + f2 );

  let resultLength = l + f2 + 1;

  let result;
  if( dst === null )
  {
    result = _.longMakeUndefined( src, resultLength );
  }
  else if( dst === src )
  {
    if( dst.length === resultLength )
    {
      return dst;
    }
    if( _.arrayLikeResizable( dst ) )
    {
      dst.splice( f, 0, ... _.dup( ins, f2 ) );
      dst.splice( l2 + 1, 0, ... _.dup( ins, resultLength <= l2 ? 0 : resultLength - l2 - 1 ) );
      return dst;
    }
    else if( dst.length !== resultLength || _.argumentsArrayIs( dst ) )
    {
      result = _.longMakeUndefined( dst, resultLength );
    }
  }
  else if( dst.length !== resultLength )
  {
    dst = _.longMakeUndefined( dst, resultLength );
    result = dst;
  }


  for( let r = f2 ; r < l2 + 1 ; r++ )
  result[ r ] = src[ r - f2 ];

  if( ins !== undefined )
  {
    for( let r = 0 ; r < f2 ; r++ )
    result[ r ] = ins;

    for( let r = l2 + 1 ; r < resultLength ; r++ )
    result[ r ] = ins;
  }

  return result;
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
 * @namespace Tools
 */

function longRelength( array, range, val )
{

  let result;

  _.assert( 1 <= arguments.length && arguments.length <= 3 );

  if( range === undefined )
  return _.longShallowClone( array );
  // return _.longMake( array );

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
 * @namespace Tools
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

  [ dst, array, range, val ] = _relength_pre.apply( this, arguments );

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
 * @namespace Tools
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
 * @namespace Tools
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
 * @namespace Tools
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
 * @namespace Tools
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
 * @namespace Tools
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
 * @namespace Tools
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
 * @namespace Tools
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
 * @namespace Tools
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
  longMakeFilling,
  /* qqq : check routine longMakeFilling, and add perfect coverage */
  /* qqq : implement routine arrayMakeFilling, and add perfect coverage */

  longFill,
  longDuplicate,

  _longClone,
  longShallowClone,

  longFrom, /* aaa2 : cover please | Dmytro : covered*/
  longFromCoercing, /* aaa2 : cover please | Dmytro : covered */

  longRepresent, /* qqq2 : review. ask */
  longSlice,
  longEmpty,

  longBut,
  longButInplace,
  _relength_pre,
  longBut_, /* !!! : use instead of longBut, longButInplace */
  longShrink,
  longShrink_, /* !!! : use instead of longShrink, longShrinkInplace */
  longShrinkInplace,
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
  longHasAny,
  longHasAll,
  longHasNone,
  longHasDepth,

  longAll,
  longAny,
  longNone,

  // long sequential search

  longCountElement,
  longCountTotal,
  longCountUnique,

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
  | longShrink_      | _.longShrink_( null, src, range )        | _.longShrink_( src )                                    |
  |                  | _.longShrink_( dst, src, range )         | _.longShrink_( src, range )                             |
  |                  | if dst not resizable and change length   | _.longShrink_( dst, dst )                               |
  |                  |                                          | _.longShrink_( dst, dst, range ) if dst is resizable    |
  |                  |                                          | or dst not change length                                |
  |                  |                                          | _.longShrink_( dst, src, range ) if dst is resizable    |
  |                  |                                          | or dst not change length                                |
  | ---------------  | ---------------------------------------- | ------------------------------------------------------  |
  | longGrow_        | _.longGrow_( null, src, range )          | _.longGrow_( src )                                      |
  |                  | _.longGrow_( dst, src, range )           | _.longGrow_( src, range )                               |
  |                  | if dst not resizable and change length   | _.longGrow_( dst, dst )                                 |
  |                  | qqq2 : should throw error                | _.longGrow_( dst, dst, range ) if dst is resizable      |
  |                  |  if not resizable                        | or dst not change length                                |
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

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
