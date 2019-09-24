( function _iBool_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// bool
// --

/**
 * Returns true if entity ( src ) is a Boolean.
 * @function boolIs
 * @param {} src - entity to check
 * @memberof wTools
 */

function boolIs( src )
{
  return src === true || src === false;
}

//

/**
 * Returns true if entity ( src ) is a Boolean or Number.
 * @function boolLike
 * @param {} src - entity to check
 * @memberof wTools
 */

function boolLike( src )
{
  let type = Object.prototype.toString.call( src );
  return type === '[object Boolean]' || type === '[object Number]';
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

  boolIs,
  boolLike,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
