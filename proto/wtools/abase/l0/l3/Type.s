( function _l3_Type_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// type test
// --

function undefinedIs( src )
{
  if( src === undefined )
  return true;
  return false;
}

//

function nullIs( src )
{
  if( src === null )
  return true;
  return false;
}

//

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
}

//

// function primitiveIs( src )
// {
//   if( !src )
//   return true;
//   let t = Object.prototype.toString.call( src );
//   return t === '[object Symbol]' || t === '[object Number]' || t === '[object BigInt]' || t === '[object Boolean]' || t === '[object String]';
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
  // if( !_.object.is( src ) )
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
  else if( _.numberIs( src ) || _.bool.is( src ) || _.strIs( src ) ) /* yyy */
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

// //
//
// function prototypeIsStandard( src )
// {
//
//   if( !_.workpiece.prototypeIs( src ) )
//   return false;
//
//   if( !Object.hasOwnProperty.call( src, 'Composes' ) )
//   return false;
//
//   return true;
// }

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
  if( !Reflect.has( src, 'constructor' ) )
  return false;

  let prototype = Object.getPrototypeOf( src );
  _.assert( prototype !== undefined );

  if( prototype === null )
  return false;
  // if( prototype === undefined )
  // return false;
  if( prototype === Object.prototype )
  return false;
  if( _.routineIs( prototype ) )
  return false;

  // return Object.hasOwnProperty.call( prototype, 'constructor' );

  return true;
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
  return _.object.is( src ) && _.routineIs( src.pipe )
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

  if( _.routineIs( src ) )
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

  if( src === _global_.logger )
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

  // let type = _.entity.strType( src );
  let type = _.entity.strTypeSecondary( src );
  if( type === 'ChildProcess' || type === 'process' )
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
  return trait.defGroup === 'trait';
}

//

function blueprintIsDefinitive( blueprint )
{
  if( !blueprint )
  return false;
  if( !_.blueprint.isDefinitive )
  return false;
  return _.blueprint.isDefinitive( blueprint );
}

//

function blueprintIsRuntime( blueprint )
{
  if( !blueprint )
  return false;
  if( !_.blueprint.isRuntime )
  return false;
  return _.blueprint.isRuntime( blueprint );
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

  undefinedIs,
  nullIs,
  nothingIs,
  definedIs,
  primitiveIs,
  _primitiveIs,
  symbolIs,

  //

  consequenceIs,
  consequenceLike,
  promiseIs,
  promiseLike,

  typeOf,
  constructorIs,
  instanceIs,

  workerIs,
  streamIs, /* qqq : cover | aaa : Done. Yevhen S. */
  consoleIs,
  printerIs,
  printerLike,
  loggerIs,
  processIs,
  procedureIs,

  definitionIs, /* xxx : move to namespace::property */
  traitIs, /* xxx : move to namespace::property */

  blueprintIsDefinitive,
  blueprintIsRuntime,

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
