( function _l1_Array_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.array = _.array || Object.create( null );

_.assert( !!_.argumentsArray.make, 'Expects routine _.argumentsArray.make' );

// --
// array
// --

/**
 * The is() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.array.is( [ 1, 2 ] );
 * // returns true
 *
 * @example
 * _.array.is( 10 );
 * // returns false
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function is
 * @namespace Tools
 */

function is( src )
{
  return Array.isArray( src );
  // return Object.prototype.toString.call( src ) === '[object Array]';
}

//

function isEmpty( src )
{
  if( !_.array.is( src ) )
  return false;
  return src.length === 0;
}

//

function isPopulated( src )
{
  if( !_.array.is( src ) )
  return false;
  return src.length > 0;
}

//

function likeResizable( src )
{
  return _.array.is( src );
}

//

function like( src ) /* qqq : cover */
{
  return this.is( src );
}

// --
// maker
// --

function _makeEmpty( src )
{
  return [];
}

//

function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    _.assert( this.like( src ) );
    return [];
  }
  else
  {
    return [];
  }
}

//

function _makeUndefined( src, length )
{
  if( arguments.length === 2 )
  {
    if( _.long.is( length ) )
    length = length.length;
    return new Array( length );
  }
  else if( arguments.length === 1 )
  {
    length = src;
    if( _.long.is( length ) )
    length = length.length;
    if( length === null )
    return new Array();
    else
    return new Array( length );
  }
  else
  {
    return [];
  }
}

//

function makeUndefined( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) );
    _.assert( _.number.is( length ) || _.long.is( length ) );
    return this._makeUndefined( src, length );
  }
  else if( arguments.length === 1 )
  {
    _.assert( _.number.is( src ) || _.long.is( src ) || src === null );
    return this._makeUndefined( src );
  }
  else
  {
    return [];
  }
}

//

function _makeZeroed( src, length )
{
  if( arguments.length === 2 )
  {
    if( _.long.is( length ) )
    length = length.length;
    return new Array( length ).fill( 0 );
  }
  else if( arguments.length === 1 )
  {
    length = src;
    if( _.long.is( length ) )
    length = length.length;
    if( length === null )
    length = 0;

    return new Array( length ).fill( 0 );
  }
  return [];
}

//

function makeZeroed( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) );
    _.assert( _.number.is( length ) || _.long.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( _.number.is( src ) || _.long.is( src ) || src === null );
  }
  return this._makeZeroed( ... arguments );
}

//

function _makeFilling( type, value, length )
{
  if( arguments.length === 2 )
  {
    value = arguments[ 0 ];
    length = arguments[ 1 ];
    if( _.longIs( length ) )
    {
      if( _.argumentsArray.is( length ) )
      type = length;
      else if( _.number.is( length ) )
      type = null;
      else
      type = length;
    }
    else
    {
      type = null;
    }
  }

  if( _.longIs( length ) )
  length = length.length;

  let result = this._make( type, length );
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = value;

  return result;
}

//

function makeFilling( type, value, length )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 )
  {
    _.assert( _.number.is( value ) || _.countable.is( value ) );
    _.assert( type !== undefined );
  }
  else
  {
    _.assert( value !== undefined );
    _.assert( _.number.is( length ) || _.countable.is( length ) );
    _.assert( type === null || _.routine.is( type ) || _.longIs( type ) );
  }

  return this._makeFilling( ... arguments );
}

//

function _make( src, length )
{
  if( arguments.length === 2 )
  {
    let data = length;
    if( _.number.is( length ) )
    data = src;
    if( _.countable.is( length ) )
    length = length.length;
    return fill( new Array( length ), data );
  }
  else if( arguments.length === 1 )
  {
    if( _.number.is( src ) )
    return new Array( src );
    if( _.countable.is( src ) )
    return [ ... src ];
  }
  return [];

  /* */

  function fill( dst, data )
  {
    if( data === null || data === undefined )
    return dst;
    let l = Math.min( length, data.length );
    for( let i = 0 ; i < l ; i++ )
    dst[ i ] = data[ i ];
    return dst;
  }

  // if( _.numberIs( length ) )
  // return new Array( length );
  // if( _.numberIs( src ) )
  // return new Array( src );
  // if( src )
  // return [ ... src ];
  // return [];
}

//

// function make( src, length )
// {
//   _.assert( arguments.length === 0 || src === null || _.countable.is( src ) || _.numberIs( src ) );
//   _.assert( length === undefined || !_.number.is( src ) || !_.number.is( length ) );
//   // _.assert( arguments.length < 2 || _.number.is( length ) );
//   _.assert( arguments.length < 2 || _.number.is( length ) || _.countable.is( length ) );
//   _.assert( arguments.length <= 2 );
//   return this._make( ... arguments );
// }

//

function _cloneShallow( srcArray )
{
  return srcArray.slice();
}

//

function cloneShallow( srcArray )
{
  _.assert( this.like( srcArray ) );
  _.assert( arguments.length === 1 );
  return this._cloneShallow( srcArray );
}

//

function from( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( this.is( src ) )
  return src;
  return this.make( src );
}

// --
// declaration
// --

/* qqq : for Yevhen : duplicate routines on all levels */
let ToolsExtension =
{

  // dichotomy

  arrayIs : is.bind( _.array ),
  arrayIsEmpty : isEmpty.bind( _.array ),
  arrayIsPopulated : isPopulated.bind( _.array ),
  arrayLikeResizable : likeResizable.bind( _.array ),
  arrayLike : like.bind( _.array ),

  // maker

  arrayMakeEmpty : makeEmpty.bind( _.array ),
  arrayMakeUndefined : makeUndefined.bind( _.array ),
  arrayMake : _.argumentsArray.make.bind( _.array ),
  // arrayMake : make.bind( _.array ),
  arrayCloneShallow : cloneShallow.bind( _.array ),
  arrayFrom : from.bind( _.array ),

}

//

Object.assign( _, ToolsExtension );

//

let ArrayExtension =
{

  // fields

  NamespaceName : 'array',
  NamespaceQname : 'wTools/array',
  TypeName : 'Array',
  SecondTypeName : 'Array',
  InstanceConstructor : Array,
  tools : _,

  // dichotomy

  is,
  isEmpty,
  isPopulated,
  likeResizable,
  like,

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for Yevhen : cover */
  _makeZeroed,
  makeZeroed, /* qqq : for Yevhen : cover */
  _makeFilling,
  makeFilling,
  _make,
  make : _.argumentsArray.make, /* qqq : for Yevhen : cover */
  // make, /* qqq : for Yevhen : cover */
  _cloneShallow,
  cloneShallow, /* qqq : for Yevhen : cover */
  from, /* qqq : for Yevhen : cover */

}

//

Object.assign( _.array, ArrayExtension );

_.long._namespaceRegister( _.array );
_.assert( _.defaultLong === undefined );
_.defaultLong = _.array;


})();
