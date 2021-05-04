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
    data = src;
    if( _.countable.is( length ) )
    length = length.length;

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
  _makeUndefined : _.buffer._makeUndefined, /* qqq : implement */
  makeUndefined : _.buffer.makeUndefined,
  _makeZeroed : _.buffer._makeZeroed,
  makeZeroed : _.buffer.makeZeroed, /* qqq : for junior : cover */

  // _cloneShallow : _.buffer._cloneShallow,
  // cloneShallow : _.buffer.cloneShallow, /* qqq : for junior : cover */
  // from : _.buffer.from, /* qqq : for junior : cover */
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
