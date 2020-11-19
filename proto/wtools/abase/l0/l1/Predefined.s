( function _Predefined_s_() {

'use strict';

/**
 *  */

/**
  Collection of general purpose tools for solving problems. Fundamentally extend JavaScript without spoiling namespace, so may be used solely or in conjunction with another module of such kind. Tools contain hundreds of routines to operate effectively with Array, SortedArray, Map, RegExp, Buffer, Time, String, Number, Routine, Error and other fundamental types. The module provides advanced tools for diagnostics and errors handling. Use it to have a stronger foundation for the application.
  @module Tools/base/Fundamental
*/

/**
 * wTools - Generic purpose tools of base level for solving problems in Java Script.
 * @namespace Tools
 * @module Tools/base/Fundamental
 */

// global

let _global = undefined;
if( typeof _global_ !== 'undefined' && _global_._global_ === _global_ )
_global = _global_;
else if( typeof globalThis !== 'undefined' && globalThis.globalThis === globalThis )
_global = globalThis;
else if( typeof Global !== 'undefined' && Global.Global === Global )
_global = Global;
else if( typeof global !== 'undefined' && global.global === global )
_global = global;
else if( typeof window !== 'undefined' && window.window === window )
_global = window;
else if( typeof self   !== 'undefined' && self.self === self )
_global = self;
if( !_global._globals_ )
{
  _global._globals_ = Object.create( null );
  _global._globals_.real = _global;
  _global._realGlobal_ = _global;
  _global._global_ = _global;
}

// verification

if( _global_.__GLOBAL_NAME__ === 'real' )
{

  if( _global_.wBase )
  {
    debugger;
    throw new Error( 'wTools was included several times' );
  }

}

// config

if( _realGlobal_.__GLOBAL_NAME__ === undefined )
_realGlobal_.__GLOBAL_NAME__ = 'real';

if( !_realGlobal_.Config )
_realGlobal_.Config = { debug : true }
if( _realGlobal_.Config.debug === undefined )
_realGlobal_.Config.debug = true;
if( _realGlobal_.Config.interpreter === undefined )
if( ( ( typeof module !== 'undefined' ) && ( typeof process !== 'undefined' ) ) )
_realGlobal_.Config.interpreter = 'njs';
else
_realGlobal_.Config.interpreter = 'browser';
if( _realGlobal_.Config.isWorker === undefined )
if( typeof self !== 'undefined' && self.self === self && typeof importScripts !== 'undefined' )
_realGlobal_.Config.isWorker = true;
else
_realGlobal_.Config.isWorker = false;

if( !_global_.Config )
_global_.Config = { debug : true }
if( _global_.Config.debug === undefined )
_global_.Config.debug = true;
if( _global_.Config.interpreter === undefined )
_global_.Config.interpreter = _realGlobal_.Config.interpreter;
if( _global_.Config.isWorker === undefined )
_global_.Config.isWorker = _realGlobal_.Config.isWorker

if( _global_.__GLOBAL_NAME__ === 'real' )
if( _global_._ )
{
  _global_.Underscore = _global_._;
  delete _global_._;
}

// if( Object.hasOwnProperty.call( _global, 'wTools' ) && _global !== _realGlobal_ )
// {
//   debugger;
//   throw Error( 'wTools was already defined' );
// }

//

_global.wTools = Object.hasOwnProperty.call( _global, 'wTools' ) ? _global.wTools : Object.create( null );
_realGlobal_.wTools = _realGlobal_.wTools || Object.create( null );
let Self = _global.wTools;
let _ = Self;

Self.__GLOBAL_NAME__ = _global.__GLOBAL_NAME__;

// special tokens

Self.def = Symbol.for( 'def' );
Self.null = Symbol.for( 'null' );
Self.undefined = Symbol.for( 'undefined' );
Self.nothing = Symbol.for( 'nothing' );
Self.anything = Symbol.for( 'anything' );
Self.maybe = Symbol.for( 'maybe' );
Self.unknown = Symbol.for( 'unknown' );
Self.dont = Symbol.for( 'dont' );
Self.unroll = Symbol.for( 'unroll' );
Self.self = Symbol.for( 'self' );
Self.optional = Symbol.for( 'optional' );

// type aliases

_realGlobal_.U64x = BigUint64Array;
_realGlobal_.U32x = Uint32Array;
_realGlobal_.U16x = Uint16Array;
_realGlobal_.U8x = Uint8Array;
_realGlobal_.U8ClampedX = Uint8ClampedArray;
_realGlobal_.Ux = _realGlobal_.U32x;

_realGlobal_.I64x = BigInt64Array;
_realGlobal_.I32x = Int32Array;
_realGlobal_.I16x = Int16Array;
_realGlobal_.I8x = Int8Array;
_realGlobal_.Ix = _realGlobal_.I32x;

_realGlobal_.F64x = Float64Array;
_realGlobal_.F32x = Float32Array;
_realGlobal_.Fx = _realGlobal_.F32x;

if( typeof Buffer !== 'undefined' )
_realGlobal_.BufferNode = Buffer;
_realGlobal_.BufferRaw = ArrayBuffer;
_realGlobal_.BufferRawShared = SharedArrayBuffer;
_realGlobal_.BufferView = DataView;

_realGlobal_.HashMap = Map;
_realGlobal_.HashMapWeak = WeakMap;

// --
// export
// --

_global[ 'wTools' ] = Self;
_global.wTools = Self;
_global.wBase = Self;

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
