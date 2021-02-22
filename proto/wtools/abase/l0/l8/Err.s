( function _l8_Err_s_()
{

'use strict';

let _global = _global_;
let _ = _global.wTools;
let _err = _._err;

// --
// checker
// --

function _isInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  debugger;
  let result =
  (
    _this === _constructor
    || _this instanceof _constructor
    || Object.isPrototypeOf.call( _constructor, _this )
    || Object.isPrototypeOf.call( _constructor, _this.prototype )
  );
  return result;
}

//

function _ownNoConstructor( ins )
{
  _.assert( !_.primitiveIs( ins ) );
  _.assert( arguments.length === 1 );
  let result = !Object.hasOwnProperty.call( ins, 'constructor' );
  return result;
}

//

function sureInstanceOrClass( _constructor, _this )
{
  _.sure( arguments.length === 2, 'Expects exactly two arguments' );
  _.sure( _._isInstanceOrClass( _constructor, _this ) );
}

//

function sureOwnNoConstructor( ins )
{
  _.sure( !_.primitiveIs( ins ) );
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _._ownNoConstructor( ins );
  _.sure.apply( _, args );
}

//

function assertInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _._isInstanceOrClass( _constructor, _this ) );
}

//

function assertOwnNoConstructor( ins )
{
  _.assert( !_.primitiveIs( ins ) );
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _._ownNoConstructor( ins );
  _.assert.apply( _, args );
  // _.assert( !_.primitiveIs( ins ) );
  // let args = Array.prototype.slice.call( arguments );
  // args[ 0 ] = _.sureOwnNoConstructor( ins );
  //
  // if( args.length === 1 )
  // args.push( () => 'Entity should not own constructor, but own ' + _.entity.exportStringShort( ins ) );
  //
  // _.assert.apply( _, args );
}

// --
// errrors
// --

let ErrorAbort = _.error.error_functor( 'ErrorAbort' );

// --
// declare
// --

/* zzz : move into independent module or namespace */

let ErrorExtension =
{
  ErrorAbort,
}

let ToolsExtension =
{

  // checker

  _isInstanceOrClass,
  _ownNoConstructor,

  // sure

  sureInstanceOrClass,
  sureOwnNoConstructor,

  // assert

  assertInstanceOrClass,
  assertOwnNoConstructor,

}

Object.assign( _.error, ErrorExtension );
Object.assign( _, ToolsExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
