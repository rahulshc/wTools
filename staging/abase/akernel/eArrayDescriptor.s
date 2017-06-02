(function _ArrayDescriptor_s_() {

'use strict';

var _ = wTools;

function _arrayDescriptorsApplyTo( dst )
{

  // debugger;

  _.assert( arguments.length === 1 );
  _.assert( dst.withArray === undefined );

  dst.withArray = Object.create( null );

  for( var d in wTools.ArrayDescriptorsMap )
  {
    dst.withArray[ d ] = Object.create( dst );
    dst.withArray[ d ].array = wTools.ArrayDescriptorsMap[ d ];
  }

}

function _declare( Descriptor ) { //

var ArrayType = Descriptor.ArrayType;
var ArrayName = Descriptor.ArrayName;

Descriptor = _.mapExtend( null,Descriptor );

// if( !wTools[ ArrayName ] )
// wTools[ ArrayName ] = Object.create( null );
//var Self = wTools[ ArrayName ];

// var Self = Object.create( null );

// --
// routines
// --

// function mixinArrayDescriptorTo( dst )
// {
//
//   _.assert( _.objectIs( dst ) );
//   _.assert( arguments.length === 1 );
//
//   debugger;
//
//   _.mapExtendFiltering( _.filter.srcOwn(),dst,this._ArrayDescriptor );
//
//   return this._ArrayDescriptor;
// }

// function _makeArrayDescriptorsFor( dst )
// {
//
//   _.assert( _.objectIs( dst ) );
//   _.assert( arguments.length === 1 );
//   _.assert( dst.array === undefined );
//
//   dst.array = Object.create( null );
//
//   debugger;
//   for( var d in wTools.ArrayDescriptorsMap )
//   {
//     dst.array[ d ] = Object.create( dst );
//     _.mapExtend( dst.array[ d ],wTools.ArrayDescriptorsMap[ d ] );
//   }
//   debugger;
//
// }

//

function makeSimilar( src,length )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  var result = _.arrayMakeSimilar( src,length );

  return result;
}

//

function makeArrayOfLength( length )
{
  if( length === undefined )
  length = 0;

  _.assert( length === undefined || length >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  var result = new this.array.ArrayType( length );

  return result;
}

//

function makeArrayOfLengthZeroed( length )
{
  if( length === undefined )
  length = 0;

  _.assert( length === undefined || length >= 0 );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  var result = new this.array.ArrayType( length );

  if( this.array.ArrayType === Array )
  for( var i = 0 ; i < length ; i++ )
  result[ i ] = 0;

  return result;
}

//

function arrayFromCoercing( src )
{
  _.assert( _.arrayLike( src ) );
  _.assert( arguments.length === 1 );

  if( src.constructor === this.array.ArrayType )
  return src;

  var result;

  if( this.array.ArrayType === Array )
  result = new( _.routineJoin( this.array.ArrayType, this.array.ArrayType, src ) );
  else
  result = new this.array.ArrayType( src );

  return result;
}

// --
// float
// --

var Extend =
{

  // mixinArrayDescriptorTo : mixinArrayDescriptorTo,
  // _makeArrayDescriptorsFor : _makeArrayDescriptorsFor,

  makeSimilar : makeSimilar,
  makeArrayOfLength : makeArrayOfLength,
  makeArrayOfLengthZeroed : makeArrayOfLengthZeroed,

  arrayFrom : arrayFromCoercing,
  arrayFromCoercing : arrayFromCoercing,

  // ArrayType : ArrayType,
  // ArrayName : ArrayName,

  array : Descriptor,

}

// Extend._ArrayDescriptor = Self;

_.mapExtend( Descriptor,Extend );

_.assert( !wTools.ArrayDescriptorsMap[ ArrayName ] );
wTools.ArrayDescriptorsMap[ ArrayName ] = Descriptor;

// _.accessorForbid( Self,
// {
//   ArrayDescriptor : 'ArrayDescriptor',
// });

return Descriptor;

} // _declare

var Descriptors =
[
  { ArrayType : Float32Array, ArrayName : 'Float32' },
  { ArrayType : Uint32Array, ArrayName : 'Wrd32' },
  { ArrayType : Int32Array, ArrayName : 'Int32' },
  { ArrayType : Array, ArrayName : 'Array' },
]

if( wTools.ArrayDescriptorsMap )
return;

_.assert( !wTools.ArrayDescriptorsMap );
_.assert( !wTools.ArrayDescriptor );
_.assert( !wTools.array );
_.assert( !wTools.withArray );

wTools._arrayDescriptorsApplyTo = _arrayDescriptorsApplyTo;
wTools.ArrayDescriptorsMap = wTools.ArrayDescriptorsMap || Object.create( null );

for( var d = 0 ; d < Descriptors.length ; d++ )
_declare( Descriptors[ d ] );

// debugger;
// wTools.ArrayDescriptor = wTools.ArrayDescriptorsMap.Array;
wTools.array = wTools.ArrayDescriptorsMap.Array;
// _.assert( wTools.ArrayDescriptorsMap );
// debugger;

_arrayDescriptorsApplyTo( wTools );

_.assert( _.objectIs( wTools.ArrayDescriptorsMap ) );
_.assert( _.objectIs( wTools.array ) );

// debugger;

})();
