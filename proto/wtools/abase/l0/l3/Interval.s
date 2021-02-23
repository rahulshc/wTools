( function _l3_Interval_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// range
// --

/* aaa for Dmytro : where is tests for those routiens?? */ /* Dmytro : moved to test suite Interval.test.s, test suite IntervalOld.test.s may be deleted */
function intervalIs( range )
{
  _.assert( arguments.length === 1 );
  if( !_.number.s.areAll( range ) )
  return false;
  if( range.length !== 2 )
  return false;
  return true;
}

//

function intervalIsValid( range )
{
  _.assert( arguments.length === 1 );
  if( !_.intervalIs( range ) )
  return false;
  if( !_.intIs( range[ 0 ] ) )
  return false;
  if( !_.intIs( range[ 1 ] ) )
  return false;
  return true;
}

//

// function intervalIsEmpty( range )
// {
//   _.assert( arguments.length === 1 );
//   if( !_.intervalIs( range ) )
//   return false;
//   return range[ 0 ] === range[ 1 ];
// }
//
// //
//
// function intervalIsPopulated( range )
// {
//   _.assert( arguments.length === 1 );
//   if( !_.intervalIs( range ) )
//   return false;
//   return range[ 0 ] !== range[ 1 ];
// }
//
// //
//
// function rangeInInclusive( range, srcNumber )
// {
//
//   if( _.longIs( srcNumber ) )
//   srcNumber = srcNumber.length;
//
//   _.assert( arguments.length === 2 );
//   _.assert( _.intervalIs( range ) );
//   _.assert( _.number.is( srcNumber ) );
//
//   if( srcNumber < range[ 0 ] )
//   return false;
//   if( srcNumber > range[ 1 ] )
//   return false;
//
//   return true;
// }
//
// //
//
// function rangeInExclusive( range, srcNumber )
// {
//   if( _.longIs( srcNumber ) )
//   srcNumber = srcNumber.length;
//
//   _.assert( arguments.length === 2 );
//   _.assert( _.intervalIs( range ) );
//   _.assert( _.number.is( srcNumber ) );
//
//   if( srcNumber <= range[ 0 ] )
//   return false;
//   if( srcNumber >= range[ 1 ] )
//   return false;
//
//   return true;
// }
//
// //
//
// function rangeInInclusiveLeft( range, srcNumber )
// {
//   if( _.longIs( srcNumber ) )
//   srcNumber = srcNumber.length;
//
//   _.assert( arguments.length === 2 );
//   _.assert( _.intervalIs( range ) );
//   _.assert( _.number.is( srcNumber ) );
//
//   if( srcNumber < range[ 0 ] )
//   return false;
//   if( srcNumber >= range[ 1 ] )
//   return false;
//
//   return true;
// }
//
// //
//
// function rangeInInclusiveRight( range, srcNumber )
// {
//   if( _.longIs( srcNumber ) )
//   srcNumber = srcNumber.length;
//
//   _.assert( arguments.length === 2 );
//   _.assert( _.intervalIs( range ) );
//   _.assert( _.number.is( srcNumber ) );
//
//   if( srcNumber < range[ 0 ] )
//   return false;
//   if( srcNumber >= range[ 1 ] )
//   return false;
//
//   return true;
// }
//
// //
//
// function sureInInterval( src, range )
// {
//   _.assert( arguments.length >= 2 );
//   if( arguments.length !== 2 )
//   debugger;
//   let args = _.unrollFrom([ _.rangeIn( range, src ), () => 'Out of range' + _.rangeToStr( range ), _.unrollSelect( arguments, 2 ) ]);
//   _.assert.apply( _, args );
//   return true;
// }
//
// //
//
// function assertInInterval( src, range )
// {
//   _.assert( arguments.length >= 2 );
//   if( arguments.length !== 2 )
//   debugger;
//   let args = _.unrollFrom([ _.rangeIn( range, src ), () => 'Out of range' + _.rangeToStr( range ), _.unrollSelect( arguments, 2 ) ]);
//   _.assert.apply( _, args );
//   return true;
// }

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

  /* zzz : review and rearrange */

  // range

  intervalIs,
  intervalIsValid, /* xxx : remove later */
  intervalDefined : intervalIsValid, /* xxx : remove later */

  // intervalIsEmpty, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  // intervalIsPopulated, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  //
  // rangeInInclusive, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  // rangeInExclusive, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  // rangeInInclusiveLeft, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  // rangeInInclusiveRight, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  // rangeIn : rangeInInclusiveLeft, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  //
  // sureInInterval, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
  // assertInInterval, /* !!! : remove later */ /* Dmytro : implemented for each namespace */

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
