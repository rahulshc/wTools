( function _fOrange_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;

require( './fRange.s' );

// --
// checker
// --

function isEmpty( orange )
{
  _.assert( arguments.length === 1 );
  if( !_.rangeIs( orange ) )
  return false;
  return orange[ 0 ] === orange[ 1 ];
}

//

function isPopulated( orange )
{
  _.assert( arguments.length === 1 );
  if( !_.rangeIs( orange ) )
  return false;
  return orange[ 0 ] !== orange[ 1 ];
}

//

function inInclusive( orange, srcNumber )
{

  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( orange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < orange[ 0 ] )
  return false;
  if( srcNumber >= orange[ 1 ] )
  return false;

  return true;
}

//

function inExclusive( orange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( orange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber <= orange[ 0 ] )
  return false;
  if( srcNumber > orange[ 1 ] )
  return false;

  return true;
}

//

function inInclusiveLeft( orange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( orange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < orange[ 0 ] )
  return false;
  if( srcNumber >= orange[ 1 ] )
  return false;

  return true;
}

//

function inInclusiveRight( orange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( orange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < orange[ 0 ] )
  return false;
  if( srcNumber >= orange[ 1 ] )
  return false;

  return true;
}

//

function sureInRange( src, orange )
{
  _.assert( arguments.length >= 2 );
  let args = _.unrollFrom([ _.orange.in( orange, src ), () => 'Out of orange' + _.rangeToStr( orange ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

//

function assertInRange( src, orange )
{
  _.assert( arguments.length >= 2 );
  let args = _.unrollFrom([ _.orange.in( orange, src ), () => 'Out of orange' + _.rangeToStr( orange ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

// --
// maker
// --

function fromSingle( orange )
{
  _.assert( arguments.length === 1 );

  if( _.numberIs( orange ) )
  return [ orange, orange + 1 ];

  _.assert( _.longIs( orange ) );
  _.assert( orange.length === 1 || orange.length === 2 );

  if( orange[ 0 ] === undefined )
  {
    if( orange[ 1 ] === undefined )
    return [ 0, 1 ];

    _.assert( _.numberIs( orange[ 1 ] ) );
    return [ orange[ 1 ] - 1, orange[ 1 ] ];
  }

  _.assert( _.numberIs( orange[ 0 ] ) );

  if( orange[ 1 ] === undefined )
  return [ orange[ 0 ], orange[ 0 ] + 1 ];

  _.assert( _.numberIs( orange[ 1 ] ) );

  return orange;
}

//

function clamp( dstRange, clampRange )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.rangeIs( dstRange ) );

  if( _.numberIs( clampRange ) )
  {
    dstRange[ 0 ] = clampRange;
    dstRange[ 1 ] = clampRange;
  }
  else
  {
    _.assert( _.rangeIs( clampRange ) );

    if( dstRange[ 0 ] < clampRange[ 0 ] )
    dstRange[ 0 ] = clampRange[ 0 ];
    else if( dstRange[ 0 ] > clampRange[ 1 ] )
    dstRange[ 0 ] = clampRange[ 1 ];

    if( dstRange[ 1 ] < clampRange[ 0 ] )
    dstRange[ 1 ] = clampRange[ 0 ];
    else if( dstRange[ 1 ] > clampRange[ 1 ] )
    dstRange[ 1 ] = clampRange[ 1 ];
  }

  return dstRange;
}

//

function countElements( orange, increment )
{

  _.assert( _.rangeIs( orange ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( increment === undefined )
  increment = 1;

  _.assert( _.numberIs( increment ), 'Increment should has a number value' );

  return increment ? ( orange[ 1 ] - orange[ 0 ] ) / increment : 0;
}

//

function firstGet( orange, options )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  // options = options || Object.create( null ); /* Dmytro : I don't know why routine makes this side effect */
  // if( options.increment === undefined )       /* The creating of new map has no sense, improved below */
  // options.increment = 1;

  if( options )
  {
    _.assert( _.objectLike( options ) );
    if( options.increment === undefined )
    options.increment = 1;
  }

  if( _.longIs( orange ) )
  {
    _.assert( _.rangeIs( orange ) );
    return orange[ 0 ];
  }
  else if( _.mapIs( orange ) )
  {
    return orange.first;
  }
  _.assert( 0, 'unexpected type of orange', _.strType( orange ) );

}

//

function lastGet( orange, options )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  // options = options || Object.create( null ); /* Dmytro : I don't know why routine makes this side effect */
  // if( options.increment === undefined )       /* The creating of new map has no sense, improved below */
  // options.increment = 1;

  if( options )
  {
    _.assert( _.objectLike( options ) );
    if( options.increment === undefined )
    options.increment = 1;
  }

  if( _.longIs( orange ) )
  {
    _.assert( _.rangeIs( orange ) );
    return orange[ 1 ];
  }
  else if( _.mapIs( orange ) )
  {
    return orange.last;
  }
  _.assert( 0, 'unexpected type of orange', _.strType( orange ) );

}

// --
// define
// --

class Orange
{
  static [ Symbol.hasInstance ]( instance )
  {
    return is( instance );
  }
}

let Handler =
{
  construct( original, args )
  {
    return Orange.fromLeft( ... args );
  }
};

let Self = new Proxy( Orange, Handler );
Self.original = Orange;

// --
// routines
// --

let Extension =
{

  // checker

  is : _.rangeIs,
  isValid : _.rangeIsValid,
  defined : _.rangeIsValid,
  isEmpty,
  isPopulated,

  inInclusive,
  inExclusive,
  inInclusiveLeft,
  inInclusiveRight,
  in : inInclusiveLeft,

  sureInRange,
  assertInRange,

  // maker

  fromLeft : _.range.fromLeft,
  fromRight : _.range.fromRight,
  fromSingle,

  clamp,
  countElements,
  firstGet,
  lastGet,

  toStr : _.range.toStr,

}

//

_.mapSupplement( Self, Extension );
_.assert( _.orange === undefined );
_.orange = Self;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;
})();
