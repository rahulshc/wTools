( function _l3_Auxiliary_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.aux = _global_.wTools.aux || Object.create( null );

// --
// typing
// --

function is( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto === Object.prototype )
  return true;

  if( !_.primitiveIs( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function isPrototyped( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto === Object.prototype )
  return false;

  if( !_.primitiveIs( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function isPure( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto.constructor === Object )
  return false;

  if( !_.primitiveIs( proto ) )
  if( !Reflect.has( proto, 'constructor' ) )
  return true;

  return false;
}

//

function isPolluted( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto.constructor === Object )
  return true;

  return false;
}

// --
// checking
// --

function isEmpty( src )
{
  if( !_.aux.is( src ) )
  return false;
  return Object.keys( src ).length === 0;
}

//

function isPopulated( src )
{
  if( !_.aux.is( src ) )
  return false;
  return Object.keys( src ).length > 0;
}

// --
// extension
// --

let ToolsExtension =
{

  // typing

  mapLike : is,
  mapLikePrototyped : isPrototyped,
  mapLikePure : isPure,
  mapLikePolluted : isPolluted,

  // checking

  mapLikeEmpty : isEmpty,
  mapLikePopulated : isPopulated,

}

Object.assign( _, ToolsExtension );

//

var AuxiliaryExtension =
{

  // typing

  is, /* qqq : cover */
  isPrototyped, /* qqq : cover */
  isPure, /* qqq : cover */
  isPolluted, /* qqq : cover */

  // checking

  isEmpty, /* qqq : cover */
  isPopulated, /* qqq : cover */

  /* qqq : move here related routines */
  /* qqq : make a test suite and move there related test routines */

}

Object.assign( _.aux, AuxiliaryExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
