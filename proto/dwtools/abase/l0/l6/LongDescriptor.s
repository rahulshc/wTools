(function _LongDescriptor_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools;
let Self = _global.wTools;

_.assert( !_.Array );
_.assert( !_.defaultLong );
_.assert( !_.withDefaultLong );

// //
//
// function _longDescriptorApplyTo( dst, def )
// {
//   // debugger;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   // _.assert( !_.mapOwnKey( dst,'withDefaultLong' ) ); // yyy
//   // _.assert( !_.mapOwnKey( dst,'defaultLong' ) ); // yyy
//   _.assert( !!LongContext[ def ] );
//   _.assert( !!LongDescriptors[ def ] );
//
//   dst.withDefaultLong = Object.create( null );
//
//   for( let d in LongContext )
//   {
//     dst.withDefaultLong[ d ] = Object.create( dst );
//     _.mapExtend( dst.withDefaultLong[ d ], LongContext[ d ] );
//   }
//
//   // dst.defaultLong = dst.withDefaultLong[ def ];
//   // dst.longDescriptor = LongContext[ def ];
//   // dst.LongContext = LongContext;
//   dst.longDescriptor = LongDescriptors[ def ];
//   _.assert( _.mapIs( dst.longDescriptor ) );
//
// }
//
// // --
// // delcare
// // --
//
// function extensionDeclare( descriptor )
// {
//
//   // let type = descriptor.type;
//   // let ArrayName = descriptor.ArrayName;
//
//   // let defaultLong = _.mapExtend( null, descriptor );
//   let extension = Object.create( null );
//   extension.longDescriptor = descriptor;
//
//   // //
//   //
//   // /**
//   //  * @summary Creates new array based on type of `src` array. Takes length of new array from second argument `length`.
//   //  * @param {} src Source array
//   //  * @param {Number} [ length ] Lengthof target array.
//   //  * @function makeSimilar
//   //  * @memberof wTools."wTools.defaultLong"
//   //  */
//   //
//   // function makeSimilar( src, length ) /* yyy */
//   // {
//   //   _.assert( arguments.length === 1 || arguments.length === 2 );
//   //
//   //   let result = _.longMakeUndefined( src, length );
//   //
//   //   return result;
//   // }
//   //
//   // //
//   //
//   // /**
//   //  * @summary Creates new array of length( length ).
//   //  * @description Type of array depends on `type`( see examples ).
//   //  * @param {Number} length Lengthof new array.
//   //  *
//   //  * @example
//   //  * _.defaultLong.makeArrayOfLength(1);
//   //  * // returns instance of Array
//   //  *
//   //  * @example
//   //  * _.withDefaultLong.Fx.makeArrayOfLength(1);
//   //  * // returns instance of F32x
//   //  *
//   //  * @function makeArrayOfLength
//   //  * @memberof wTools."wTools.defaultLong"
//   //  */
//   //
//   // function makeArrayOfLength( length )
//   // {
//   //
//   //   if( length === undefined )
//   //   length = 0;
//   //
//   //   _.assert( length === undefined || length >= 0 );
//   //   _.assert( arguments.length === 0 || arguments.length === 1 );
//   //
//   //   let result = new this.longDescriptor.type( length );
//   //
//   //   return result;
//   // }
//   //
//   // //
//   //
//   // /**
//   //  * @summary Creates new array of length( length ) filled with zeroes.
//   //  * @description Type of array depends on `type`( see examples ).
//   //  * @param {Number} length Lengthof new array.
//   //  *
//   //  * @example
//   //  * _.defaultLong.makeArrayOfLengthZeroed( 2 );
//   //  * // returns Array [ 0,0 ]
//   //  *
//   //  * @example
//   //  * _.withDefaultLong.Fx.makeArrayOfLength( 2 );
//   //  * // returns F32x [ 0,0 ]
//   //  *
//   //  * @function makeArrayOfLengthZeroed
//   //  * @memberof wTools."wTools.defaultLong"
//   //  */
//   //
//   // function makeArrayOfLengthZeroed( length )
//   // {
//   //   if( length === undefined )
//   //   length = 0;
//   //
//   //   _.assert( length === undefined || length >= 0 );
//   //   _.assert( arguments.length === 0 || arguments.length === 1 );
//   //
//   //   let result = new this.longDescriptor.type( length );
//   //
//   //   if( this.longDescriptor.type === Array )
//   //   for( let i = 0 ; i < length ; i++ )
//   //   result[ i ] = 0;
//   //
//   //   return result;
//   // }
//   //
//   // //
//   //
//   // /**
//   //  * @summary Creates new array taking elements from source array `src`.
//   //  * @description Type of new array depends on `type`( see examples ).
//   //  * Returns new array of type `type` or src if types are same.
//   //  * @param {} src Source array.
//   //  *
//   //  * @example
//   //  * let src =  _.withDefaultLong.Fx.makeArrayOfLength( 2 );
//   //  * _.defaultLong.arrayFromCoercing( src );
//   //  * // returns Array [ 0,0 ]
//   //  *
//   //  * @example
//   //  * let src =  _.defaultLong.makeArrayOfLength( 2 );
//   //  * _.withDefaultLong.Fx.arrayFromCoercing( src );
//   //  * // returns F32x [ 0,0 ]
//   //  *
//   //  * @example
//   //  * let src =  _.defaultLong.makeArrayOfLength( 2 );
//   //  * _.defaultLong.arrayFromCoercing( src );
//   //  * // returns src
//   //  *
//   //  * @function arrayFromCoercing
//   //  * @memberof wTools."wTools.defaultLong"
//   //  */
//   //
//   // function arrayFromCoercing( src )
//   // {
//   //   _.assert( _.longIs( src ) );
//   //   _.assert( arguments.length === 1, 'Expects single argument' );
//   //
//   //   if( src.constructor === this.longDescriptor.type )
//   //   return src;
//   //
//   //   let result;
//   //
//   //   if( this.longDescriptor.type === Array )
//   //   result = new( _.constructorJoin( this.longDescriptor.type, src ) );
//   //   else
//   //   result = new this.longDescriptor.type( src );
//   //
//   //   return result;
//   // }
//
//   // --
//   //
//   // --
//
//   let Extend =
//   {
//
//     // makeSimilar,
//     // makeArrayOfLength,
//     // makeArrayOfLengthZeroed,
//     //
//     // arrayFrom : arrayFromCoercing,
//     // arrayFromCoercing,
//
//     longDescriptor : descriptor,
//
//   }
//
//   _.mapExtend( extension, Extend );
//   _.assert( !LongContext[ descriptor.name ] );
//
//   LongContext[ descriptor.name ] = extension;
//
//   return extension;
// }

// --
//
// --

function make_functor( cls )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ cls.name ] : function( src )
    {
      // debugger;
      _.assert( arguments.length === 1 );
      return new cls( src );
    }
  }
  return r[ cls.name ];
}

//

function from_functor( cls )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ cls.name ] : function( src )
    {
      // debugger;
      _.assert( arguments.length === 0 || arguments.length === 1 );
      if( src === undefined )
      return new cls()
      if( this instanceof cls )
      return this;
      return new cls( src );
    }
  }
  return r[ cls.name ];
}

//

function is_functor( cls )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ cls.name ] : function( src )
    {
      debugger; yyy
      /* qqq : cover please */
      _.assert( arguments.length === 1 );
      return src instanceof cls;
    }
  }
  return r[ cls.name ];
}

//

function _longDeclare( o )
{
  // _.routineOptions( _longDeclare, o );

  o = Object.assign( Object.create( null ), o );
  for( let k in _longDeclare.defaults )
  if( !( k in o ) )
  o[ k ] = _longDeclare.defaults[ k ];

  _.assert( _.strDefined( o.name ) );
  _.assert( _.strDefined( o.secondName ) || o.secondName === null );
  _.assert( _.strDefined( o.aliasName ) || o.aliasName === null );
  _.assert( _.routineIs( o.type ) );
  _.assert( _.routineIs( o.make ) || o.make === null );
  _.assert( _.routineIs( o.from ) || o.from === null );
  _.assert( _.routineIs( o.is ) || o.make === null );
  _.assert( _.boolIs( o.isTyped ) );
  _.assert( LongDescriptors[ o.name ] === undefined );

  if( !o.make )
  o.make = make_functor( o.type );

  if( !o.from )
  o.from = from_functor( o.type );

  if( !o.is )
  o.is = is_functor( o.type );

  Object.freeze( o );
  LongDescriptors[ o.name ] = o;
  LongTypeToDescriptorsHash.set( o.type, o );

  // extensionDeclare( o );

  return o;
}

_longDeclare.defaults =
{
  name : null,
  secondName : null,
  aliasName : null,
  type : null,
  make : null,
  from : null,
  is : null,
  isTyped : null,
}

function _argumentsArrayMake()
{
  return arguments;
}

//

let LongTypeToDescriptorsHash = new HashMap();
let LongDescriptors = Object.create( null );
// let LongContext = Object.create( null );

_.assert( _.routineIs( _.arrayMake ) );
_.assert( _.routineIs( _.unrollMake ) );

_longDeclare({ name : 'Array', type : Array, make : _.arrayMake, from : _.arrayMake, is : _.arrayIs, isTyped : false });
_longDeclare({ name : 'Unroll', type : Array, make : _.unrollMake, from : _.unrollFrom, is : _.unrollIs, isTyped : false });
_longDeclare({ name : 'ArgumentsArray', secondName : 'Arguments', type : _argumentsArrayMake().constructor, make : _.argumentsArrayFrom, from : _.argumentsArrayFrom, is : _.argumentsArrayIs, isTyped : false });

_longDeclare({ name : 'U32x', secondName : 'Uint32', type : _global.U32x, isTyped : true });
_longDeclare({ name : 'U16x', secondName : 'Uint16', type : _global.U16x, isTyped : true });
_longDeclare({ name : 'U8x', secondName : 'Uint8', type : _global.U8x, isTyped : true });
_longDeclare({ name : 'Ux', secondName : 'Uint32', aliasName : 'U32x', type : _global.Ux, isTyped : true });

_longDeclare({ name : 'I32x', secondName : 'Int32', type : _global.I32x, isTyped : true });
_longDeclare({ name : 'I16x', secondName : 'Int16', type : _global.I16x, isTyped : true });
_longDeclare({ name : 'I8x', secondName : 'Int8', type : _global.I8x, isTyped : true });
_longDeclare({ name : 'Ix', secondName : 'Int32', aliasName : 'I32x', type :_global.Ix, isTyped : true });

_longDeclare({ name : 'F32x', secondName : 'Float32', type : _global.F32x, isTyped : true });
_longDeclare({ name : 'F64x', secondName : 'Float64', type : _global.F64x, isTyped : true });
_longDeclare({ name : 'Fx', secondName : 'Float32', aliasName : 'F32x', type : _global.Fx, isTyped : true });

//

let LongDescriptorProducer =
{
  // make_functor,
  // from_functor,
  // is_functor,
  _longDeclare,
  // _longDescriptorApplyTo,
  LongDescriptors,
  LongTypeToDescriptorsHash,
}

_.LongDescriptorProducer = _.LongDescriptorProducer || Object.create( null );
_.mapExtend( _.LongDescriptorProducer, LongDescriptorProducer );

let ToolsExtension =
{
  // make_functor,
  // from_functor,
  // is_functor,
  // _longDeclare,
  // _longDescriptorApplyTo,
  // LongDescriptorProducer,
  LongDescriptors,
  LongTypeToDescriptorsHash,
}

_.mapExtend( _, ToolsExtension );

// --
//
// --

// let _ArrayNameSpaces =
// [
//   { type : F32x, ArrayName : 'Float32' },
//   { type : U32x, ArrayName : 'Wrd32' },
//   { type : I32x, ArrayName : 'Int32' },
//   { type : Array, ArrayName : 'Array' },
// ]

_.assert( !_.Array );
_.assert( !_.defaultLong );
_.assert( !_.withDefaultLong );

//
//
// /**
//  * @summary Array namespace
//  * @namespace "wTools.defaultLong"
//  * @memberof wTools
//  */
//
// // _._longDescriptorApplyTo = _longDescriptorApplyTo;
//
// // for( let d = 0 ; d < _ArrayNameSpaces.length ; d++ )
// // extensionDeclare( _ArrayNameSpaces[ d ] );
//
// _longDescriptorApplyTo( _, 'Array' );

_.assert( !_.Array );

// _.assert( _.mapOwnKey( _, 'withDefaultLong' ) ); // yyy
// _.assert( _.mapOwnKey( _, 'defaultLong' ) );
// _.assert( _.mapOwnKey( _.defaultLong, 'defaultLong' ) );
// _.assert( _.mapOwnKey( _, 'longDescriptor' ) ); // yyy
// _.assert( !_.mapOwnKey( _.defaultLong, 'withDefaultLong' ) );
// _.assert( !!_.defaultLong.withDefaultLong );

// _.assert( _.objectIs( _.withDefaultLong ) );
// _.assert( _.objectIs( _.defaultLong ) );
_.assert( !_.defaultLong );
// _.assert( _.routineIs( _.makeArrayOfLength ) );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
