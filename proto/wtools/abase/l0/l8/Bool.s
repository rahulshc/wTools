( function _l8_Bool_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.bool = _.bool || Object.create( null );

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;

// --
// bool
// --

/**
 * @summary Converts argument( src ) to boolean.
 * @function boolFrom
 * @param {*} src - entity to convert
 * @namespace Tools
 * @throws Exception if cannot convert.
 */

function from( src )
{
  let result = _.bool.fromMaybe( src );
  _.assert( _.boolIs( result ), `Cant convert ${_.entity.strType( src )} to boolean` );
  return result;
}

//

/**
 * @summary Converts argument( src ) to boolean or return src.
 * @function boolFrom
 * @param {*} src - entity to convert
 * @namespace Tools
 */

function fromMaybe( src )
{
  if( _.bool.is( src ) )
  {
    return src;
  }
  else if( _.numberIs( src ) )
  {
    return !!src;
  }
  else if( _.strIs( src ) )
  {
    src = src.toLowerCase();
    if( src === '0' )
    return false;
    if( src === 'false' )
    return false;
    if( src === '1' )
    return true;
    if( src === 'true' )
    return true;
    return src;
  }
  else
  {
    return src;
  }
}

//

/**
 * @summary Converts argument( src ) to boolean.
 * @function boolFrom
 * @param {*} src - entity to convert
 * @namespace Tools
 */

function fromForce( src )
{
  if( _.strIs( src ) )
  {
    src = src.toLowerCase();
    if( src === '0' )
    return false;
    if( src === 'false' )
    return false;
    if( src === 'null' )
    return false;
    if( src === 'undefined' )
    return false;
    if( src === '' )
    return false;
    return true;
  }
  return Boolean( src );
}

// --
// routines
// --

let ExtensionTools =
{

  boolFrom : from, /* qqq : cover please ( not Dmytro ) | aaa : Done. Yevhen S.*/
  boolFromMaybe : fromMaybe, /* qqq : cover please ( not Dmytro ) | aaa : Done. Yevhen S.*/
  boolFromForce : fromForce, /* qqq : cover please ( not Dmytro ) | aaa : Done. Yevhen S.*/

}

//

let Extension =
{

  from,
  fromMaybe,
  fromForce,

}

//

Object.assign( _, ExtensionTools );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
