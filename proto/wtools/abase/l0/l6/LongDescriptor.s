( function _LongDescriptor_s_()
{

'use strict';

let _global = _global_;
let _ = _global.wTools;
let Self = _global.wTools;

_.assert( !_.Array );
_.assert( !_.defaultLong );
_.assert( !_.withDefaultLong );

// --
//
// --

function is_functor( name, cls )
{
  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ name ] : function( src )
    {
      /* aaa : cover please */
      /* Dmytro : covered */
      _.assert( arguments.length === 1 );
      return src instanceof cls;
    }
  }
  return r[ name ];
}

//

function make_functor( name, cls )
{
  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  // let r = /* Dmytro : maybe, it's better Implementation, it takes into account quantity of arguments and its type */
  // {
  //   [ name ] : function( src )
  //   {
  //     _.assert( arguments.length === 0 || arguments.length === 1 );
  //
  //     if( src === undefined || src === null )
  //     src = 0;
  //
  //     _.assert( _.numberIs( src ) || _.longIs( src ) );
  //     return new cls( src );
  //   }
  // }
  let r =
  {
    [ name ] : function()
    {
      return new cls( ... arguments );
    }
  }
  return r[ name ];
}

//

function from_functor( name, cls )
{
  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.strDefined( cls.name ) );
  let r =
  {
    [ name ] : function( src )
    {
      // _.assert( arguments.length === 1 ); /* Dmytro : assertion for single argument is better for from routine */
      // _.assert( _.longIs( src ) || _.numberIs( src ) || src === undefined || src === null ); /* Dmytro : maybe, it is missed, if src is any map, then returns empty buffer */
      _.assert( arguments.length === 0 || arguments.length === 1 );
      if( src === undefined )
      return new cls()
      // if( this instanceof cls )
      // return this;
      if( src instanceof cls )
      return src;
      return new cls( src );
    }
  }
  return r[ name ];
}

//

function _longDeclare( o )
{

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

  if( !o.is )
    o.is = is_functor( o.name, o.type );
  /* aaa : cover please _.longDescriptor.is */
  /* Dmytro : covered */

  if( !o.make )
  o.make = make_functor( o.name, o.type );
  /* aaa : cover please _.longDescriptor.make */
  /* Dmytro : covered */

  if( !o.from )
  o.from = from_functor( o.name, o.type );
  /* qqq : cover please _.longDescriptor.from */
  /* Dmytro : covered, needs clarification of a few features */

  Object.freeze( o );
  LongDescriptors[ o.name ] = o;
  if( !LongTypeToDescriptorsHash.get( o.type ) )
  LongTypeToDescriptorsHash.set( o.type, o );

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

_.assert( _.routineIs( _.arrayMake ) );
_.assert( _.routineIs( _.unrollMake ) );

// _longDeclare({ name : 'Array', type : Array, make : _.arrayMake, from : _.arrayMake, is : _.arrayIs, isTyped : false });
_longDeclare({ name : 'Array', type : Array, make : _.arrayMake, from : _.arrayFrom, is : _.arrayIs, isTyped : false });
_longDeclare({ name : 'Unroll', type : Array, make : _.unrollMake, from : _.unrollFrom, is : _.unrollIs, isTyped : false });
_longDeclare({ name : 'ArgumentsArray', secondName : 'Arguments', type : _argumentsArrayMake().constructor, make : _.argumentsArray.make, from : _.argumentsArray.from, is : _.argumentsArray.is, isTyped : false });
// _longDeclare({ name : 'ArgumentsArray', secondName : 'Arguments', type : _argumentsArrayMake().constructor, make : _.argumentsArray.from, from : _.argumentsArray.from, is : _.argumentsArray.is, isTyped : false }); /* Dmytro : wrong function make */

_longDeclare({ name : 'U32x', secondName : 'Uint32', type : _global.U32x, isTyped : true });
_longDeclare({ name : 'U16x', secondName : 'Uint16', type : _global.U16x, isTyped : true });
_longDeclare({ name : 'U8x', secondName : 'Uint8', type : _global.U8x, isTyped : true });
_longDeclare({ name : 'Ux', secondName : 'Uint32', aliasName : 'U32x', type : _global.Ux, isTyped : true });

_longDeclare({ name : 'I32x', secondName : 'Int32', type : _global.I32x, isTyped : true });
_longDeclare({ name : 'I16x', secondName : 'Int16', type : _global.I16x, isTyped : true });
_longDeclare({ name : 'I8x', secondName : 'Int8', type : _global.I8x, isTyped : true });
_longDeclare({ name : 'Ix', secondName : 'Int32', aliasName : 'I32x', type : _global.Ix, isTyped : true });

_longDeclare({ name : 'F32x', secondName : 'Float32', type : _global.F32x, isTyped : true });
_longDeclare({ name : 'F64x', secondName : 'Float64', type : _global.F64x, isTyped : true });
_longDeclare({ name : 'Fx', secondName : 'Float32', aliasName : 'F32x', type : _global.Fx, isTyped : true });

//

let longDescriptorProducer =
{
  _longDeclare,
  LongDescriptors,
  LongTypeToDescriptorsHash,
}

_.longDescriptorProducer = _.longDescriptorProducer || Object.create( null );
_.mapExtend( _.longDescriptorProducer, longDescriptorProducer );

let ToolsExtension =
{
  LongDescriptors,
  LongTypeToDescriptorsHash,
}

_.mapExtend( _, ToolsExtension );

// --
//
// --

_.assert( !_.Array );
_.assert( !_.defaultLong );
_.assert( !_.withDefaultLong );
_.assert( !_.Array );
_.assert( !_.defaultLong );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
