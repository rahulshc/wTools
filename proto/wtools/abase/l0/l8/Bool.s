( function _Bool_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

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

function boolFrom( src )
{
  let result = _.boolFromMaybe( src );
  _.assert( _.boolIs( result ), `Cant convert ${_.strType( src )} to boolean` );
  return result;
}

//

/**
 * @summary Converts argument( src ) to boolean or return src.
 * @function boolFrom
 * @param {*} src - entity to convert
 * @namespace Tools
 */

function boolFromMaybe( src )
{
  if( _.boolIs( src ) )
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

function boolFromForce( src )
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
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  boolFrom, /* qqq : cover please ( not Dmytro ) | aaa : Done. Yevhen S.*/
  boolFromMaybe, /* qqq : cover please ( not Dmytro ) | aaa : Done. Yevhen S.*/
  boolFromForce, /* qqq : cover please ( not Dmytro ) | aaa : Done. Yevhen S.*/

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();