( function _l3_Buffer_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// implementation
// --

function bufferRawIs( src )
{
  let type = Object.prototype.toString.call( src );
  // let result = type === '[object ArrayBuffer]';
  // return result;
  if( type === '[object ArrayBuffer]' || type === '[object SharedArrayBuffer]' )
  return true;
  return false;
}

//

function bufferTypedIs( src )
{
  let type = Object.prototype.toString.call( src );
  if( !/\wArray/.test( type ) )
  return false;
  // Dmytro : two next lines is added to correct returned result when src is SharedArrayBuffer
  if( type === '[object SharedArrayBuffer]' )
  return false;
  if( _.bufferNodeIs( src ) )
  return false;
  return true;
}

//

function bufferViewIs( src )
{
  let type = Object.prototype.toString.call( src );
  let result = type === '[object DataView]';
  return result;
}

//

function bufferNodeIs( src )
{
  if( typeof BufferNode !== 'undefined' )
  return src instanceof BufferNode;
  return false;
}

//

function bufferAnyIs( src )
{
  if( !src )
  return false;
  if( typeof src !== 'object' )
  return false;
  if( !Reflect.has( src, 'byteLength' ) )
  return false;
  // return src.byteLength >= 0;
  // return bufferTypedIs( src ) || bufferViewIs( src )  || bufferRawIs( src ) || bufferNodeIs( src );
  return true;
}

//

function bufferBytesIs( src )
{
  if( _.bufferNodeIs( src ) )
  return false;
  return src instanceof U8x;
}

//

function constructorIsBuffer( src )
{
  if( !src )
  return false;
  if( !_.number.is( src.BYTES_PER_ELEMENT ) )
  return false;
  if( !_.strIs( src.name ) )
  return false;
  return src.name.indexOf( 'Array' ) !== -1;
}


// --
// declaration
// --

let Extension =
{

  bufferRawIs,
  bufferTypedIs,
  bufferViewIs,
  bufferNodeIs,
  bufferAnyIs,
  bufferBytesIs,
  constructorIsBuffer,
  /* xxx qqq : move buffer checks here | aaa : Done. Yevhen S. */
}

//

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
