( function _l3_Prototype_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.prototype = _global_.wTools.prototype || Object.create( null );

// --
// implementation
// --


function isPrototypeOf( superPrototype, subPrototype ) /* xxx : move */
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

function has( superPrototype, subPrototype ) /* xxx : move */
{
  _.assert( arguments.length === 2, 'Expects two arguments' );
  // eslint-disable-next-line no-prototype-builtins
  return _.prototype.isPrototypeOf( subPrototype, superPrototype );
}

//

/**
 * Is prototype.
 * @function is
 * @param {object} src - entity to check
 * @namespace Tools
 */

function is( src ) /* xxx : move */
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.primitiveIs( src ) )
  return false;
  if( _.routineIs( src ) )
  return false;
  return Object.hasOwnProperty.call( src, 'constructor' );
}

// --
// extension
// --

var Extension =
{
  isPrototypeOf,
  has,
  is
}

//

var ExtensionTools =
{
  prototypeIsPrototypeOf : isPrototypeOf,
  prototypeHas : has,
  prototypeIs : is

}

//

Object.assign( Self, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
