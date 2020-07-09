( function _iType_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// let Object.hasOwnProperty = Object.hasOwnProperty;

// --
// type test
// --

function nothingIs( src )
{
  if( src === null )
  return true;
  if( src === undefined )
  return true;
  if( src === _.nothing )
  return true;
  return false;
}

//

function definedIs( src )
{
  return src !== undefined && src !== null && !Number.isNaN( src ) && src !== _.nothing;
  // return src !== undefined && src !== null && src !== NaN && src !== _.nothing;
  /* Dmytro : direct comparizon of NaN and src is uncorrect.
  let a = NaN;
  a == NaN // false
  a === NaN // false
  Function isNaN is unstable. So, method Number.isNaN is better choise for check it.
  */
}

//

function primitiveIs( src )
{
  if( !src )
  return true;
  let t = Object.prototype.toString.call( src );
  return t === '[object Symbol]' || t === '[object Number]' || t === '[object BigInt]' || t === '[object Boolean]' || t === '[object String]';
}

//

function symbolIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object Symbol]';
  return result;
}

//

function bigIntIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object BigInt]';
  return result;
}

// --
// math
// --

function vectorAdapterIs( src )
{
  return Object.prototype.toString.call( src ) === '[object VectorAdapter]';
  // if( !_.objectIs( src ) )
  // return false;
  //
  // if( !( '_vectorBuffer' in src ) )
  // return false;
  //
  // if( Object.hasOwnProperty.call( src, 'constructor' ) )
  // return false;
  //
  // return true;
}

//

function vectorIs( src )
{

  if( _.vectorAdapterIs( src ) )
  return true;

  if( _.longIs( src ) )
  return true;

  return false;
}

//

function vectorLike( src )
{
  return _.vectorIs( src );
}

//

function constructorIsVectorAdapter( src )
{
  if( !src )
  return false;
  return '_vectorBuffer' in src.prototype;
}

// //
//
// function matrixIs( src )
// {
//   if( !src )
//   return false;
//   if( !_.Matrix )
//   return false;
//   if( src instanceof _.Matrix )
//   return true;
// }
//
// //
//
// function constructorIsMatrix( src )
// {
//   // if( !_.Matrix )
//   // return false;
//   // if( src === _.Matrix )
//   // return true;
//   // return false;
//   return _.Matrix ? src === _.Matrix : false;
// }

//

function consequenceIs( src )
{
  if( !src )
  return false;

  let prototype = Object.getPrototypeOf( src );

  if( !prototype )
  return false;

  return prototype.shortName === 'Consequence';
}

//

function consequenceLike( src )
{
  if( _.consequenceIs( src ) )
  return true;

  if( _.promiseIs( src ) )
  return true;

  return false;
}

//

function promiseIs( src )
{
  if( !src )
  return false;
  return src instanceof Promise;
}

//

function promiseLike( src )
{
  if( !src )
  return false;
  // if( !_.objectIs( src ) )
  // return false;
  return _.routineIs( src.then ) && _.routineIs( src.catch ) && ( src.constructor ) && ( src.constructor.name !== 'wConsequence' );
}

//

function typeOf( src, constructor )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  {
    return _.typeOf( src ) === constructor;
  }

  if( src === null || src === undefined )
  {
    return null;
  }
  else if( _.numberIs( src ) || _.boolIs( src ) || _.strIs( src ) )
  {
    return src.constructor;
  }
  else if( src.constructor )
  {
    _.assert( _.routineIs( src.constructor ) && src instanceof src.constructor );
    return src.constructor;
  }
  else
  {
    return null;
  }

}

//

function isPrototypeOf( superPrototype, subPrototype )
{
  _.assert( arguments.length === 2, 'Expects two arguments, probably you meant routine prototypeOf' );
  if( superPrototype === subPrototype )
  return true;
  if( !superPrototype )
  return false;
  if( !subPrototype )
  return false;
  return Object.isPrototypeOf.call( superPrototype, subPrototype );
}

//

function prototypeHas( superPrototype, subPrototype )
{
  _.assert( arguments.length === 2, 'Expects two arguments' );
  // eslint-disable-next-line no-prototype-builtins
  return _.isPrototypeOf( subPrototype, superPrototype );
}

//

/**
 * Is prototype.
 * @function prototypeIs
 * @param {object} src - entity to check
 * @namespace Tools
 */

function prototypeIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.primitiveIs( src ) )
  return false;
  if( _.routineIs( src ) )
  return false;
  return Object.hasOwnProperty.call( src, 'constructor' );
}

//

function prototypeIsStandard( src )
{

  if( !_.prototypeIs( src ) )
  return false;

  if( !Object.hasOwnProperty.call( src, 'Composes' ) )
  return false;

  return true;
}

//

/**
 * Checks if argument( cls ) is a constructor.
 * @function constructorIs
 * @param {Object} cls - entity to check
 * @namespace Tools
 */

function constructorIs( cls )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.routineIs( cls ) && !instanceIs( cls );
}

//

/**
 * Is instance of a class.
 * @function instanceIs
 * @param {object} src - entity to check
 * @namespace Tools
 */

function instanceIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.primitiveIs( src ) )
  return false;

  if( Object.hasOwnProperty.call( src, 'constructor' ) )
  return false;

  // if( Object.hasOwnProperty.call( src, 'prototype' ) && src.prototype )
  // return false;

  let prototype = Object.getPrototypeOf( src );

  if( prototype === null || prototype === undefined )
  return false;

  if( prototype === Object.prototype )
  return false;
  if( prototype === null )
  return false;
  if( _.routineIs( prototype ) )
  return false;

  return Object.hasOwnProperty.call( prototype, 'constructor' );

  // return _.prototypeIs( prototype );
//
//   if( prototype === Object.prototype )
//   return false;
//   if( prototype === null )
//   return false;
//
//   return true;
}

//

function instanceLike( src )
{
  if( _.primitiveIs( src ) )
  return false;
  if( src.Composes )
  return true;
  return false;
}

//

function workerIs( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    if( typeof WorkerGlobalScope !== 'undefined' && src instanceof WorkerGlobalScope )
    return true;
    if( typeof Worker !== 'undefined' && src instanceof Worker )
    return true;
    return false;
  }
  else
  {
    return typeof WorkerGlobalScope !== 'undefined';
  }
}

//

function streamIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.objectIs( src ) && _.routineIs( src.pipe )
}

//

function consoleIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( console.Console )
  if( src && src instanceof console.Console )
  return true;

  if( src !== console )
  return false;

  let result = Object.prototype.toString.call( src );
  if( result === '[object Console]' || result === '[object Object]' )
  return true;

  return false;
}

//

function printerIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !src )
  return false;

  let prototype = Object.getPrototypeOf( src );
  if( !prototype )
  return false;

  if( src.MetaType === 'Printer' )
  return true;

  return false;
}

//

function printerLike( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( printerIs( src ) )
  return true;

  if( consoleIs( src ) )
  return true;

  return false;
}

//

function loggerIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.Logger )
  return false;

  if( src instanceof _.Logger )
  return true;

  return false;
}

//

function processIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  let typeOf = _.strType( src );
  if( typeOf === 'ChildProcess' || typeOf === 'process' )
  return true;

  return false;
}

//

function procedureIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( !src )
  return false;
  if( !_.Procedure )
  return false;
  return src instanceof _.Procedure;
}

//

function definitionIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !src )
  return false;

  if( !_.Definition )
  return false;

  return src instanceof _.Definition;
}

//

function traitIs( trait )
{
  if( !_.definitionIs( trait ) )
  return false;
  return trait.definitionGroup === 'trait';
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

  // primitive

  nothingIs,
  definedIs,
  primitiveIs,
  symbolIs,
  bigIntIs,

  //

  vectorAdapterIs,
  vadIs : vectorAdapterIs,
  vectorIs, /* qqq : cover */
  vectorLike,

  constructorIsVectorAdapter,
  constructorIsVad : constructorIsVectorAdapter,
  // matrixIs,
  // constructorIsMatrix,

  consequenceIs,
  consequenceLike,
  promiseIs,
  promiseLike,

  typeOf,
  isPrototypeOf,
  prototypeHas,
  prototypeIs,
  prototypeIsStandard,
  constructorIs,
  instanceIs,
  instanceLike,

  workerIs,
  streamIs, /* qqq : cover */
  consoleIs,
  printerIs,
  printerLike,
  loggerIs,
  processIs,
  procedureIs,
  definitionIs,
  traitIs,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
