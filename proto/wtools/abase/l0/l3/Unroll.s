( function _l3_Unroll_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// unroll
// --

/**
 * The routine unrollIs() determines whether the passed value is an instance of type Unroll ( unroll-array ).
 *
 * If {-src-} is an Unroll, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 * // returns true
 *
 * @example
 * _.unrollIs( [] );
 * // returns false
 *
 * @example
 * _.unrollIs( 1 );
 * // returns false
 *
 * @returns { boolean } Returns true if {-src-} is an Unroll.
 * @function unrollIs
 * @namespace Tools
 */

function unrollIs( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return !!src[ _.unroll ];
}

//

/**
 * The routine unrollIsPopulated() determines whether the unroll-array has elements (length).
 *
 * If {-src-} is an unroll-array and has one or more elements, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * let src = _.unrollFrom( [ 1, 'str' ] );
 * _.unrollIsPopulated( src );
 * // returns true
 *
 * @example
 * let src = _.unrollMake( [] )
 * _.unrollIsPopulated( src );
 * // returns false
 *
 * @returns { boolean } Returns true if argument ( src ) is an Unroll and has one or more elements ( length ).
 * @function unrollIsPopulated
 * @namespace Tools
 */

function unrollIsPopulated( src )
{
  if( !_.unrollIs( src ) )
  return false;
  return src.length > 0;
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

  unrollIs,
  unrollIsPopulated,

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
