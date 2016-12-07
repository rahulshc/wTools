(function _ArrayDescriptor_s_() {

'use strict';

var _ = wTools;

function _declare( declarator ) { //

var ArrayType = declarator.ArrayType;
var ArrayName = declarator.ArrayName;

// if( !wTools[ ArrayName ] )
// wTools[ ArrayName ] = Object.create( null );
//var Self = wTools[ ArrayName ];

var Self = Object.create( null );

// --
// routines
// --

var mixinArrayDescriptor = function mixinArrayDescriptor( dst )
{

  _.assert( _.objectIs( dst ) );
  _.assert( arguments.length === 1 );

  _.mapExtendFiltering( _.filter.srcOwn(),dst,this._ArrayDescriptor );

  return this._ArrayDescriptor;
}

//

var makeArrayOfLength = function makeArrayOfLength( length )
{
  if( length === undefined )
  length = 0;

  _.assert( length === undefined || length >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  var result = new ArrayType( length );

  return result;
}

//

var makeArrayOfLengthZeroed = function makeArrayOfLengthZeroed( length )
{
  if( length === undefined )
  length = 0;

  _.assert( length === undefined || length >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  var result = new ArrayType( length );

  if( this.ArrayType === Array )
  for( var i = 0 ; i < length ; i++ )
  result[ i ] = 0;

  return result;
}

//

var makeArrayCoercing = function makeArrayCoercing( src )
{
  _.assert( _.arrayLike( src ) );
  _.assert( arguments.length === 1 );

  if( src.constructor === this.ArrayType )
  return src;

  var result = new this.ArrayType( src );
  return result;
}

// --
// float
// --

var Extend =
{

  mixinArrayDescriptor : mixinArrayDescriptor,

  makeArrayOfLength : makeArrayOfLength,
  makeArrayOfLengthZeroed : makeArrayOfLengthZeroed,
  makeArrayCoercing : makeArrayCoercing,

  ArrayType : ArrayType,
  ArrayName : ArrayName,

}

Extend._ArrayDescriptor = Self;

_.mapExtend( Self,Extend );

_.assert( !wTools.ArrayDescriptors[ ArrayName ] );
wTools.ArrayDescriptors[ ArrayName ] = Self;

// _.accessorForbid( Self,
// {
//   ArrayDescriptor : 'ArrayDescriptor',
// });

} // _declare

var Types =
[
  { ArrayType : Float32Array, ArrayName : 'Float32' },
  { ArrayType : Uint32Array, ArrayName : 'Wrd32' },
  { ArrayType : Int32Array, ArrayName : 'Int32' },
  { ArrayType : Array, ArrayName : 'Array' },
]

if( wTools.ArrayDescriptors )
return;

wTools.ArrayDescriptors = wTools.ArrayDescriptors || {};

for( var t in Types )
_declare( Types[ t ] );

wTools.ArrayDescriptors.Array.mixinArrayDescriptor( wTools );

})();
