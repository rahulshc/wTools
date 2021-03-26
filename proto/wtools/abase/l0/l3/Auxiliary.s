( function _l3_Auxiliary_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.aux = _global_.wTools.aux || Object.create( null );

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

  if( !_.primitive.is( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function like( src )
{
  return _.aux.is( src );
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

  if( !_.primitive.is( proto ) )
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

  if( !_.primitive.is( proto ) )
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

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.aux.is( src ) );

  return `{- ${_.entity.strType( src )} with ${_.entity.lengthOf( src )} elements -}`;
}

// --
// extension
// --

let ToolsExtension =
{

  // typing

  auxIs : is,
  auxLike : like,

  // mapLike : is,
  // mapLikePrototyped : isPrototyped,
  // mapLikePure : isPure,
  // mapLikePolluted : isPolluted,

  // checking

  // mapLikeEmpty : isEmpty,
  // mapLikePopulated : isPopulated,

}

Object.assign( _, ToolsExtension );

//

var AuxiliaryExtension =
{

  // typing

  is, /* qqq : cover */
  like, /* qqq : cover */
  isPrototyped, /* qqq : cover */
  isPure, /* qqq : cover */
  isPolluted, /* qqq : cover */

  // checking

  isEmpty, /* qqq : cover */
  isPopulated, /* qqq : cover */

  /* qqq : move here related routines */
  /* qqq : make a test suite and move there related test routines */

  // export string
  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic

}

Object.assign( _.aux, AuxiliaryExtension );

})();
