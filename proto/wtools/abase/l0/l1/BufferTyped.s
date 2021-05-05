( function _l1_BufferTyped_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.bufferTyped = _.bufferTyped || Object.create( null );

// --
// implementation
// --

function typedIs( src )
{
  let type = Object.prototype.toString.call( src );
  if( !/\wArray/.test( type ) )
  return false;
  if( type === '[object SharedArrayBuffer]' )
  return false;
  if( _.buffer.nodeIs( src ) )
  return false;
  return true;
}

//

function _make( src, length )
{
  if( arguments.length === 2 )
  {
    let data = length;
    if( _.number.is( length ) )
    {
      data = src;
    }
    else if( _.long.is( length ) )
    {
      length = length.length;
    }
    if( _.countable.is( length ) )
    {
      data = [ ... length ];
      length = data.length;
    }


    if( this.like( src ) )
    return fill( new src.constructor( length ), data );
    return fill( this.tools.defaultBufferTyped.make( length ), data );
  }
  else if( arguments.length === 1 )
  {
    if( this.like( src ) )
    return new src.constructor( src );
    return this.tools.defaultBufferTyped.make( src );
  }
  return this.tools.defaultBufferTyped.make( 0 );

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
}

//

function _makeUndefined( src, length )
{
  if( arguments.length === 0 )
  return this.make( 0 );

  if( length === undefined )
  length = src;
  if( length && !_.number.is( length ) )
  {
    if( length.length )
    length = length.length;
    else
    length = [ ... length ].length;
  }
  if( this.like( src ) )
  return new src.constructor( length );
  return this._make( length );
}

//

function _makeFilling( type, value, length )
{
  if( arguments.length === 2 )
  {
    value = arguments[ 0 ];
    length = arguments[ 1 ];
    if( this.like( length ) )
    type = length;
    else
    type = null;
  }

  if( !_.number.is( length ) )
  // if( _.long.is( length ) )
  if(  length.length ) )
  length = length.length;
  else if( _.countable.is( length ) )
  length = [ ... length ].length;

  let result = this._make( type, length );
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = value;

  return result;
}

// --
// declaration
// --

let BufferTypedExtension =
{

  //

  NamespaceName : 'bufferTyped',
  NamespaceQname : 'wTools/bufferTyped',
  TypeName : 'BufferTyped',
  SecondTypeName : 'ArrayTyped',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  typedIs,
  is : typedIs,
  like : typedIs,

  // maker

  // _make : _.buffer._make, /* qqq : cover */
  // make : _.buffer.make,
  _make, /* qqq : cover */
  make : _.long.make,
  _makeEmpty : _.buffer._makeEmpty,
  makeEmpty : _.buffer.makeEmpty,
  _makeUndefined, /* qqq : implement */
  makeUndefined : _.argumentsArray.makeUndefined,
  _makeZeroed : _makeUndefined,
  makeZeroed : _.argumentsArray.makeZeroed, /* qqq : for junior : cover */
  _makeFilling,
  makeFilling : _.argumentsArray.makeFilling, /* qqq : for junior : cover */

  _cloneShallow : _.buffer._cloneShallow,
  cloneShallow : _.argumentsArray.cloneShallow, /* qqq : for junior : cover */
  from : _.argumentsArray.from, /* qqq : for junior : cover */
  // qqq : implement

}

Object.assign( _.bufferTyped, BufferTypedExtension );

//

let BufferExtension =
{

  // dichotomy

  typedIs : typedIs.bind( _.buffer ),

}

Object.assign( _.buffer, BufferExtension );

//

let ToolsExtension =
{

  // dichotomy

  bufferTypedIs : typedIs.bind( _.buffer ),

}

//

Object.assign( _, ToolsExtension );

})();
