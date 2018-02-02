(function _ArrayDescriptor_s_() {

'use strict';

var _ = _global_.wTools;
var Self = _global_.wTools;

//

function _arrayDescriptorsApplyTo( dst )
{

  _.assert( arguments.length === 1 );
  _.assert( !_.mapOwnKey( dst,'withArray' ) );

  dst.withArray = Object.create( null );

  for( var d in _.ArrayDescriptorsMap )
  {
    dst.withArray[ d ] = Object.create( dst );
    dst.withArray[ d ].array = _.ArrayDescriptorsMap[ d ];
  }

}

// --
// delcare
// --

function _declare( Descriptor ) {

var ArrayType = Descriptor.ArrayType;
var ArrayName = Descriptor.ArrayName;

Descriptor = _.mapExtend( null,Descriptor );

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

  makeSimilar : makeSimilar,
  makeArrayOfLength : makeArrayOfLength,
  makeArrayOfLengthZeroed : makeArrayOfLengthZeroed,

  arrayFrom : arrayFromCoercing,
  arrayFromCoercing : arrayFromCoercing,

  array : Descriptor,

}

_.mapExtend( Descriptor,Extend );
_.assert( !_.ArrayDescriptorsMap[ ArrayName ] );
_.ArrayDescriptorsMap[ ArrayName ] = Descriptor;

return Descriptor;

}

// --
//
// --

var Descriptors =
[
  { ArrayType : Float32Array, ArrayName : 'Float32' },
  { ArrayType : Uint32Array, ArrayName : 'Wrd32' },
  { ArrayType : Int32Array, ArrayName : 'Int32' },
  { ArrayType : Array, ArrayName : 'Array' },
]

if( _.ArrayDescriptorsMap )
return;

_.assert( !_.ArrayDescriptorsMap );
_.assert( !_.ArrayDescriptor );
_.assert( !_.array );
_.assert( !_.withArray );

_._arrayDescriptorsApplyTo = _arrayDescriptorsApplyTo;
_.ArrayDescriptorsMap = _.ArrayDescriptorsMap || Object.create( null );

for( var d = 0 ; d < Descriptors.length ; d++ )
_declare( Descriptors[ d ] );

_.array = _.ArrayDescriptorsMap.Array;

_arrayDescriptorsApplyTo( _ );

_.assert( _.objectIs( _.ArrayDescriptorsMap ) );
_.assert( _.objectIs( _.array ) );
_.assert( _.routineIs( _.array.makeArrayOfLength ) );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_._UsingWtoolsPrivately_ )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
