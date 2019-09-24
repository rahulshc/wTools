( function _iRange_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// range
// --

function rangeIs( range )
{
  _.assert( arguments.length === 1 );
  if( !_.numbersAre( range ) )
  return false;
  if( range.length !== 2 )
  return false;
  return true;
}

//

function rangeInInclusive( range, srcNumber )
{

  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( range ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < range[ 0 ] )
  return false;
  if( srcNumber > range[ 1 ] )
  return false;

  return true;
}

//

function rangeInExclusive( range, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( range ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber <= range[ 0 ] )
  return false;
  if( srcNumber >= range[ 1 ] )
  return false;

  return true;
}

//

function rangeInInclusiveLeft( range, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( range ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < range[ 0 ] )
  return false;
  if( srcNumber >= range[ 1 ] )
  return false;

  return true;
}

//

function rangeInInclusiveRight( range, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( range ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < range[ 0 ] )
  return false;
  if( srcNumber >= range[ 1 ] )
  return false;

  return true;
}

//

function sureInRange( src, range )
{
  _.assert( arguments.length >= 2 );
  if( arguments.length !== 2 )
  debugger;
  let args = _.unrollFrom([ _.rangeIn( range, src ), () => 'Out of range' + _.rangeToStr( range ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

//

function assertInRange( src, range )
{
  _.assert( arguments.length >= 2 );
  if( arguments.length !== 2 )
  debugger;
  let args = _.unrollFrom([ _.rangeIn( range, src ), () => 'Out of range' + _.rangeToStr( range ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
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

  // range

  /* qqq : good coverage of each routine is required */

  rangeIs,

  rangeInInclusive,
  rangeInExclusive,
  rangeInInclusiveLeft,
  rangeInInclusiveRight,
  rangeIn : rangeInInclusiveLeft,

  sureInRange,
  assertInRange,

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
