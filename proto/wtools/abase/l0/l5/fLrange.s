( function _fLrange_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;

require( './fRange.s' );

// --
// checker
// --

function isEmpty( lrange )
{
  _.assert( arguments.length === 1 );
  if( !_.rangeIs( lrange ) )
  return false;
  return lrange[ 1 ] === 0;
}

//

function isPopulated( lrange )
{
  _.assert( arguments.length === 1 );
  if( !_.rangeIs( lrange ) )
  return false;
  return lrange[ 1 ] !== 0;
}

//

function inInclusive( lrange, srcNumber )
{

  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( lrange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < lrange[ 0 ] )
  return false;
  if( srcNumber >= lrange[ 0 ] + lrange[ 1 ] )
  return false;

  return true;
}

//

function inExclusive( lrange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( lrange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber <= lrange[ 0 ] )
  return false;
  if( srcNumber > lrange[ 0 ] + lrange[ 1 ] )
  return false;

  return true;
}

//

function inInclusiveLeft( lrange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( lrange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < lrange[ 0 ] )
  return false;
  if( srcNumber >= lrange[ 0 ] + lrange[ 1 ] )
  return false;

  return true;
}

//

function inInclusiveRight( lrange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( lrange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < lrange[ 0 ] )
  return false;
  if( srcNumber >= lrange[ 0 ] + lrange[ 1 ] )
  return false;

  return true;
}

//

function sureInRange( src, lrange )
{
  _.assert( arguments.length >= 2 );
  let args = _.unrollFrom([ _.lrange.in( lrange, src ), () => 'Out of lrange' + _.rangeToStr( lrange ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

//

function assertInRange( src, lrange )
{
  _.assert( arguments.length >= 2 );
  let args = _.unrollFrom([ _.lrange.in( lrange, src ), () => 'Out of lrange' + _.rangeToStr( lrange ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

// --
// maker
// --

function fromSingle( lrange )
{
  _.assert( arguments.length === 1 );

  if( _.numberIs( lrange ) )
  return [ lrange, 1 ];

  _.assert( _.longIs( lrange ) );
  _.assert( lrange.length === 1 || lrange.length === 2 );

  if( lrange[ 0 ] === undefined )
  {
    if( lrange[ 1 ] === undefined )
    return [ 0, 1 ];

    _.assert( lrange[ 1 ] === 1, 'Expects length of 1' );
    return [ 0, 1 ];
  }

  _.assert( _.numberIs( lrange[ 0 ] ) );

  if( lrange[ 1 ] === undefined )
  return [ lrange[ 0 ], 1 ];

  _.assert( _.numberIs( lrange[ 1 ] ) );

  return lrange;
}

//

function clamp( dstRange, clampRange )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.rangeIs( dstRange ) );

  if( _.numberIs( clampRange ) )
  {
    dstRange[ 0 ] = clampRange;
    dstRange[ 1 ] = 0;
  }
  else
  {
    _.assert( _.rangeIs( clampRange ) );

    if( dstRange[ 0 ] < 0 )
    dstRange[ 0 ] = 0;
    else if( dstRange[ 0 ] > clampRange[ 0 ] )
    dstRange[ 0 ] = clampRange[ 0 ];

    if( dstRange[ 1 ] < 0 )
    dstRange[ 1 ] = 0;
    else if( dstRange[ 1 ] > clampRange[ 1 ] )
    dstRange[ 1 ] = clampRange[ 1 ];
  }

  return dstRange;
}

//

function countElements( lrange, increment )
{

  _.assert( _.rangeIs( lrange ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( increment === undefined )
  increment = 1;

  _.assert( _.numberIs( increment ), 'Increment should has a number value' );

  return increment ? lrange[ 1 ] / increment : 0;
}

//

function lastGet( lrange, options )
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

  if( _.longIs( lrange ) )
  {
    _.assert( _.rangeIs( lrange ) );
    return lrange[ 0 ] + lrange[ 1 ];
  }
  else if( _.mapIs( lrange ) )
  {
    return lrange.last;
  }
  _.assert( 0, 'unexpected type of lrange', _.strType( lrange ) );

}

// --
// define
// --

class Lrange
{
  static[ Symbol.hasInstance ]( instance )
  {
    return is( instance );
  }
}

let Handler =
{
  construct( original, args )
  {
    return Lrange.fromLeft( ... args );
  }
};

let Self = new Proxy( Lrange, Handler );
Self.original = Lrange;

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
  firstGet : _.range.firstGet,
  lastGet,

  toStr : _.range.toStr,

}

//

_.mapSupplement( Self, Extension );
_.assert( _.lrange === undefined );
_.lrange = Self;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;
})();
