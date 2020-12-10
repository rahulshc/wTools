// ( function _l5_Interval_s_()
// {
//
// 'use strict';
//
// let _global = _global_;
// let _ = _global_.wTools;
//
// // --
// // range
// // --
//
// /* aaa : use _.pair as example to make the same thing */
// /* Dmytro : new namespace and class is created. As _.pair, this module has Proxy. Routines from l3/iRange.s connected too */
//
// function fromLeft( range )
// {
//   _.assert( arguments.length === 1 );
//
//   if( _.numberIs( range ) )
//   return [ range, Infinity ];
//
//   _.assert( _.longIs( range ) );
//
//   if( range.length === 1 )
//   range = [ range[ 0 ], Infinity ];
//   else
//   _.assert( range.length === 2 );
//
//   if( !_.numberIs( range[ 0 ] ) )
//   {
//     _.assert( range[ 0 ] === undefined );
//     range[ 0 ] = 0;
//   }
//   if( !_.numberIs( range[ 1 ] ) )
//   {
//     _.assert( range[ 1 ] === undefined );
//     range[ 1 ] = Infinity;
//   }
//
//   return range;
// }
//
// // function fromLeft( range )
// // {
// //   _.assert( arguments.length === 1 );
// //   if( _.numberIs( range ) )
// //   return [ range, Infinity ];
// //   _.assert( _.longIs( range ) );
// //   _.assert( range.length === 1 || range.length === 2 );
// //   _.assert( range[ 0 ] === undefined || _.numberIs( range[ 0 ] ) );
// //   _.assert( range[ 1 ] === undefined || _.numberIs( range[ 1 ] ) );
// //   if( range[ 0 ] === undefined )
// //   return [ 0, range[ 1 ] ];
// //   if( range[ 1 ] === undefined )
// //   return [ range[ 0 ], Infinity ];
// //   return range;
// // }
//
// //
//
// /* aaa Dmytro : this routine is identical to rangeFromLeft. Is it correct? */
// /* aaa : not really */
// /* Dmytro : new feature is tested */
//
// function fromRight( range )
// {
//   _.assert( arguments.length === 1 );
//
//   if( _.numberIs( range ) )
//   return [ 0, range ];
//
//   _.assert( _.longIs( range ) );
//
//   if( range.length === 1 )
//   range = [ range[ 0 ], Infinity ];
//   else
//   _.assert( range.length === 2 );
//
//   if( !_.numberIs( range[ 0 ] ) )
//   {
//     _.assert( range[ 0 ] === undefined );
//     range[ 0 ] = 0;
//   }
//   if( !_.numberIs( range[ 1 ] ) )
//   {
//     _.assert( range[ 1 ] === undefined );
//     range[ 1 ] = Infinity;
//   }
//
//   return range;
// }
//
// // function fromRight( range )
// // {
// //   _.assert( arguments.length === 1 );
// //   if( _.numberIs( range ) )
// //   return [ 0, range ];
// //   _.assert( _.longIs( range ) );
// //   _.assert( range.length === 1 || range.length === 2 );
// //   _.assert( range[ 0 ] === undefined || _.numberIs( range[ 0 ] ) );
// //   _.assert( range[ 1 ] === undefined || _.numberIs( range[ 1 ] ) );
// //   if( range[ 0 ] === undefined )
// //   return [ 0, range[ 1 ] ];
// //   if( range[ 1 ] === undefined )
// //   return [ range[ 0 ], Infinity ];
// //   return range;
// // }
//
// // //
// //
// // function fromSingle( range )
// // {
// //   _.assert( arguments.length === 1 );
// //   if( _.numberIs( range ) )
// //   return [ range, range + 1 ];
// //
// //   _.assert( _.longIs( range ) );
// //   _.assert( range.length === 1 || range.length === 2 );
// //   _.assert( range[ 0 ] === undefined || _.numberIs( range[ 0 ] ) );
// //   _.assert( range[ 1 ] === undefined || _.numberIs( range[ 1 ] ) );
// //
// //   if( range[ 0 ] === undefined )
// //   if( range[ 1 ] !== undefined )
// //   return [ range[ 1 ]-1, range[ 1 ] ];
// //   else
// //   return [ 0, 1 ];
// //
// //   if( range[ 1 ] === undefined )
// //   return [ range[ 0 ], range[ 0 ] + 1 ];
// //   return range;
// // }
// //
// // //
// //
// // /* aaa : teach to accept number in second argument */ /* Dmytro : done */
// //
// // function clamp( dstRange, clampRange )
// // {
// //
// //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
// //   _.assert( _.intervalIs( dstRange ) );
// //
// //   if( _.numberIs( clampRange ) )
// //   {
// //     dstRange[ 0 ] = clampRange;
// //     dstRange[ 1 ] = clampRange;
// //   }
// //   else
// //   {
// //     _.assert( _.intervalIs( clampRange ) );
// //
// //     if( dstRange[ 0 ] < clampRange[ 0 ] )
// //     dstRange[ 0 ] = clampRange[ 0 ];
// //     else if( dstRange[ 0 ] > clampRange[ 1 ] )
// //     dstRange[ 0 ] = clampRange[ 1 ];
// //
// //     if( dstRange[ 1 ] < clampRange[ 0 ] )
// //     dstRange[ 1 ] = clampRange[ 0 ];
// //     else if( dstRange[ 1 ] > clampRange[ 1 ] )
// //     dstRange[ 1 ] = clampRange[ 1 ];
// //   }
// //
// //   return dstRange;
// // }
// //
// // //
// //
// // function countElements( range, increment )
// // {
// //
// //   _.assert( _.intervalIs( range ) );
// //   _.assert( arguments.length === 1 || arguments.length === 2 );
// //
// //   if( increment === undefined )
// //   increment = 1;
// //
// //   _.assert( _.numberIs( increment ), 'Increment should has a number value' );
// //
// //   return increment ? ( range[ 1 ]-range[ 0 ] ) / increment : 0;
// // }
//
// //
//
// function firstGet( range, options )
// {
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//
//   // options = options || Object.create( null ); /* Dmytro : I don't know why routine makes this side effect */
//   // if( options.increment === undefined )       /* The creating of new map has no sense, improved below */
//   // options.increment = 1;
//
//   if( options )
//   {
//     _.assert( _.mapLike( options ) );
//     if( options.increment === undefined )
//     options.increment = 1;
//   }
//
//   if( _.longIs( range ) )
//   {
//     _.assert( _.intervalIs( range ) );
//     return range[ 0 ];
//   }
//   else if( _.mapIs( range ) )
//   {
//     return range.first;
//   }
//   _.assert( 0, 'unexpected type of range', _.strType( range ) );
// }
//
// // //
// //
// // function lastGet( range, options )
// // {
// //
// //   options = options || Object.create( null );
// //   if( options.increment === undefined )
// //   options.increment = 1;
// //
// //   _.assert( arguments.length === 1 || arguments.length === 2 );
// //
// //   if( _.longIs( range ) )
// //   {
// //     _.assert( _.intervalIs( range ) );
// //     return range[ 1 ];
// //   }
// //   else if( _.mapIs( range ) )
// //   {
// //     return range.last
// //   }
// //   _.assert( 0, 'unexpected type of range', _.strType( range ) );
// //
// // }
//
// //
//
// function toStr( range )
// {
//   _.assert( _.intervalIs( range ) );
//   _.assert( arguments.length === 1 );
//   return range[ 0 ] + '..' + range[ 1 ];
// }
//
// // --
// // define
// // --
//
// class Range
// {
//   static[ Symbol.hasInstance ]( instance )
//   {
//     return is( instance );
//   }
// }
//
// let Handler =
// {
//   construct( original, args )
//   {
//     return Range.fromLeft( ... args );
//   }
// };
//
// let Self = new Proxy( Range, Handler );
// Self.original = Range;
//
// // --
// // routines
// // --
//
// let Extension =
// {
//
//   is : _.intervalIs,
//   isEmpty : _.intervalIsEmpty,
//   defined : _.intervalDefined,
//   isPopulated : _.intervalIsPopulated,
//
//   // inInclusive : _.rangeInInclusive,
//   // inExclusive : _.rangeInExclusive,
//   // inInclusiveLeft : _.rangeInInclusiveLeft,
//   // inInclusiveRight : _.rangeInInclusiveRight,
//   // in : _.rangeInInclusiveLeft,
//
//   // sureInInterval : _.sureInInterval,
//   // assertInInterval : _.assertInInterval,
//
//   fromLeft,
//   fromRight,
//   // fromSingle, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
//
//   // clamp, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
//   // countElements, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
//   firstGet,
//   // lastGet, /* !!! : remove later */ /* Dmytro : implemented for each namespace */
//
//   toStr,
//
// }
//
// //
//
// _.mapSupplement( Self, Extension );
// _.assert( _._interval === undefined );
// _._interval = Self;
// /* aaa for Dmytro : make possible to remove the namespace */ /* routines copied to namespace cinterval and its are used from this namespace */
// /* Dmytro : another way is to create abstract class ( or namespace ) in l3 and inherit it */
//
// // --
// // export
// // --
//
// if( typeof module !== 'undefined' )
// module[ 'exports' ] = _;
// })();
