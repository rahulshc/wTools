( function _fCrange_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;

require( './fRange.s' );

// --
// checker
// --

function isEmpty( crange )
{
  _.assert( arguments.length === 1 );
  if( !_.rangeIs( crange ) )
  return false;
  return crange[ 0 ] === crange[ 1 ] + 1;
}

//

function isPopulated( crange )
{
  _.assert( arguments.length === 1 );
  if( !_.rangeIs( crange ) )
  return false;
  return crange[ 0 ] !== crange[ 1 ] + 1;
}

//

function inInclusive( crange, srcNumber )
{

  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( crange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < crange[ 0 ] )
  return false;
  if( srcNumber >= crange[ 1 ] + 1 )
  return false;

  return true;
}

//

function inExclusive( crange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( crange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber <= crange[ 0 ] )
  return false;
  if( srcNumber > crange[ 1 ] + 1 )
  return false;

  return true;
}

//

function inInclusiveLeft( crange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( crange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < crange[ 0 ] )
  return false;
  if( srcNumber >= crange[ 1 ] + 1 )
  return false;

  return true;
}

//

function inInclusiveRight( crange, srcNumber )
{
  if( _.longIs( srcNumber ) )
  srcNumber = srcNumber.length;

  _.assert( arguments.length === 2 );
  _.assert( _.rangeIs( crange ) );
  _.assert( _.numberIs( srcNumber ) );

  if( srcNumber < crange[ 0 ] )
  return false;
  if( srcNumber >= crange[ 1 ] + 1 )
  return false;

  return true;
}

//

function sureInRange( src, crange )
{
  _.assert( arguments.length >= 2 );
  let args = _.unrollFrom([ _.crange.in( crange, src ), () => 'Out of crange' + _.rangeToStr( crange ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

//

function assertInRange( src, crange )
{
  _.assert( arguments.length >= 2 );
  let args = _.unrollFrom([ _.crange.in( crange, src ), () => 'Out of crange' + _.rangeToStr( crange ), _.unrollSelect( arguments, 2 ) ]);
  _.assert.apply( _, args );
  return true;
}

// --
// maker
// --

function fromSingle( crange )
{
  _.assert( arguments.length === 1 );

  if( _.numberIs( crange ) )
  return [ crange, crange ];

  _.assert( _.longIs( crange ) );
  _.assert( crange.length === 1 || crange.length === 2 );

  if( crange[ 0 ] === undefined )
  {
    if( crange[ 1 ] === undefined )
    return [ 0, 0 ];

    _.assert( _.numberIs( crange[ 1 ] ) );
    return [ crange[ 1 ], crange[ 1 ] ];
  }

  _.assert( _.numberIs( crange[ 0 ] ) );

  if( crange[ 1 ] === undefined )
  return [ crange[ 0 ], crange[ 0 ] ];

  _.assert( _.numberIs( crange[ 1 ] ) );

  return crange;
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

function countElements( crange, increment )
{

  _.assert( _.rangeIs( crange ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( increment === undefined )
  increment = 1;

  _.assert( _.numberIs( increment ), 'Increment should has a number value' );

  if( increment )
  {
    let result = ( crange[ 1 ] - crange[ 0 ] + 1 ) / increment;
    if( result > 0 )
    {
      if( result < 1 )
      return 1;
      return Math.floor( result );
    }
    else if( result < 0 )
    {
      if( result > -1 )
      return -1;
      return Math.ceil( result );
    }
  }

  return 0;
}

//

function lastGet( crange, options )
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

  if( _.longIs( crange ) )
  {
    _.assert( _.rangeIs( crange ) );
    return crange[ 1 ];
  }
  else if( _.mapIs( crange ) )
  {
    return crange.last;
  }
  _.assert( 0, 'unexpected type of crange', _.strType( crange ) );

}

// --
// define
// --

class Crange
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
    return Crange.fromLeft( ... args );
  }
};

let Self = new Proxy( Crange, Handler );
Self.original = Crange;

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
_.assert( _.crange === undefined );
_.crange = Self;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;
})();
