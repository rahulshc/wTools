( function _fString_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// decorator
// --

// class QuotePair
// {
//   constructor( elements )
//   {
//     this.elements = elements;
//     return this;
//   }
// }

//

function strQuote( o )
{

  if( !_.mapIs( o ) )
  o = { src : arguments[ 0 ], quote : arguments[ 1 ] };
  if( o.quote === undefined || o.quote === null )
  o.quote = strQuote.defaults.quote;
  _.assertMapHasOnly( o, strQuote.defaults );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( o.src ) )
  {
    let result = [];
    for( let s = 0 ; s < o.src.length ; s++ )
    result.push( _.strQuote({ src : o.src[ s ], quote : o.quote }) );
    return result;
  }

  let src = o.src;

  if( !_.primitiveIs( src ) )
  src = _.toStr( src );

  _.assert( _.primitiveIs( src ) );

  let result = o.quote + String( src ) + o.quote;

  return result;
}

strQuote.defaults =
{
  src : null,
  quote : '"',
}

//

function strUnquote( o )
{

  if( !_.mapIs( o ) )
  o = { src : arguments[ 0 ], quote : arguments[ 1 ] };
  if( o.quote === undefined || o.quote === null )
  o.quote = strUnquote.defaults.quote;
  _.assertMapHasOnly( o, strUnquote.defaults );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( o.src ) )
  {
    let result = [];
    for( let s = 0 ; s < o.src.length ; s++ )
    result.push( _.strUnquote({ src : o.src[ s ], quote : o.quote }) );
    return result;
  }

  let result = o.src;
  let isolated = _.strIsolateInsideLeft( result, o.quote );
  if( isolated[ 0 ] === '' && isolated[ 4 ] === '' )
  result = isolated[ 2 ];

  return result;
}

strUnquote.defaults =
{
  src : null,
  quote : [ '"', '`', '\'' ],
}

//

function strQuotePairsNormalize( quote )
{

  if( ( _.boolLike( quote ) && quote ) )
  quote = strQuoteAnalyze.defaults.quote;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( quote ) || _.arrayIs( quote ) );

  quote = _.arrayAs( quote );
  for( let q = 0 ; q < quote.length ; q++ )
  {
    let quotingPair = quote[ q ];
    _.assert( _.pair.is( quotingPair ) || _.strIs( quotingPair ) );
    if( _.strIs( quotingPair ) )
    quotingPair = quote[ q ] = [ quotingPair, quotingPair ];
    _.assert( _.strIs( quotingPair[ 0 ] ) && _.strIs( quotingPair[ 1 ] ) );
  }

  return quote;
}

//

function strQuoteAnalyze( o )
{
  let i = -1;
  let result = Object.create( null );
  result.ranges = [];
  result.quotes = [];

  // if( !_.mapIs( o ) )
  // o = { src : o };
  // if( o.quote === undefined || o.quote === null )
  // o.quote = strQuoteAnalyze.defaults.quote;
  // _.assertMapHasOnly( o, strQuoteAnalyze.defaults );
  // _.assert( arguments.length === 1, 'Expects single argument' );
  // _.assert( _.strIs( o.src ) );

  if( !_.mapIs( o ) )
  o = { src : arguments[ 0 ], quote : arguments[ 1 ] };
  if( o.quote === undefined || o.quote === null )
  o.quote = strQuoteAnalyze.defaults.quote;
  _.assertMapHasOnly( o, strQuoteAnalyze.defaults );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  o.quote = _.strQuotePairsNormalize( o.quote );
  let maxQuoteLength = 0;
  for( let q = 0 ; q < o.quote.length ; q++ )
  {
    let quotingPair = o.quote[ q ];
    maxQuoteLength = Math.max( maxQuoteLength, quotingPair[ 0 ].length, quotingPair[ 1 ].length );
  }

  let isEqual = maxQuoteLength === 1 ? isEqualChar : isEqualString;
  let inRange = false
  do
  {
    while( i < o.src.length )
    {
      i += 1;

      if( inRange )
      {
        if( isEqual( inRange ) )
        {
          result.ranges.push( i );
          inRange = false;
        }
        continue;
      }

      for( let q = 0 ; q < o.quote.length ; q++ )
      {
        let quotingPair = o.quote[ q ];
        if( isEqual( quotingPair[ 0 ] ) )
        {
          result.quotes.push( quotingPair[ 0 ] );
          result.ranges.push( i );
          inRange = quotingPair[ 1 ];
          break;
        }
      }
    }

    if( inRange )
    {
      result.quotes.pop();
      i = result.ranges.pop()+1;
      inRange = false;
    }

  }
  while( i < o.src.length );

  return result;

  function isEqualChar( quote )
  {
    _.assert( o.src.length >= i );
    if( o.src[ i ] === quote )
    return true;
    return false;
  }

  function isEqualString( quote )
  {
    if( i+quote.length > o.src.length )
    return false;
    let subStr = o.src.substring( i, i+quote.length );
    if( subStr === quote )
    return true;
    return false;
  }

}

strQuoteAnalyze.defaults =
{
  src : null,
  quote : [ '"', '`', '\'' ],
}

// --
//
// --

/* qqq : ask how to modify strLeft/strRight | Dmytro : routines used range */

// function _strLeftSingle( src, ins, first, last )
// {
// 
//   _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
//   _.assert( _.strIs( src ) );
//   _.assert( first === undefined || _.numberIs( first ) );
//   _.assert( last === undefined || _.numberIs( last ) );
// 
//   ins = _.arrayAs( ins );
// 
//   let olength = src.length;
//   let result = Object.create( null );
//   result.index = olength;
//   result.instanceIndex = -1;
//   result.entry = undefined;
// 
//   if( first !== undefined || last !== undefined )
//   {
//     if( first === undefined )
//     first = 0;
//     if( last === undefined )
//     last = src.length;
//     if( first < 0 )
//     first = src.length + first;
//     if( last < 0 )
//     last = src.length + last;
//     // if( first >= src.length )
//     // return result;
//     // if( last <= -1 )
//     // return result;
//     _.assert( 0 <= first && first <= src.length );
//     _.assert( 0 <= last && last <= src.length );
//     src = src.substring( first, last );
//   }
// 
//   for( let k = 0, len = ins.length ; k < len ; k++ )
//   {
//     let entry = ins[ k ];
//     if( _.strIs( entry ) )
//     {
//       let found = src.indexOf( entry );
//       if( found >= 0 && ( found < result.index || result.entry === undefined ) )
//       {
//         result.instanceIndex = k;
//         result.index = found;
//         result.entry = entry;
//       }
//     }
//     else if( _.regexpIs( entry ) )
//     {
//       let found = src.match( entry );
//       if( found && ( found.index < result.index || result.entry === undefined ) )
//       {
//         result.instanceIndex = k;
//         result.index = found.index;
//         result.entry = found[ 0 ];
//       }
//     }
//     else _.assert( 0, 'Expects string-like ( string or regexp )' );
//   }
// 
//   if( first !== undefined && result.index !== olength )
//   result.index += first;
// 
//   return result;
// }

function _strLeftSingle( src, ins, range )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.strIs( src ) );

  if( _.numberIs( range ) )
  range = [ range, src.length ];
  else if( range === undefined )
  range = [ 0, src.length ];

  range[ 0 ] = range[ 0 ] === undefined ? 0 : range[ 0 ];
  range[ 1 ] = range[ 1 ] === undefined ? src.length : range[ 1 ];
  if( range[ 0 ] < 0 )
  range[ 0 ] = src.length + range[ 0 ];
  if( range[ 1 ] < 0 )
  range[ 1 ] = src.length + range[ 1 ];

  _.assert( _.rangeIs( range ) );
  _.assert( 0 <= range[ 0 ] && range[ 0 ] <= src.length );
  _.assert( 0 <= range[ 1 ] && range[ 1 ] <= src.length );

  let result = Object.create( null );
  result.index = src.length;
  result.instanceIndex = -1;
  result.entry = undefined;

  ins = _.arrayAs( ins );
  let src1 = src.substring( range[ 0 ], range[ 1 ] );

  for( let k = 0 ; k < ins.length ; k++ )
  {
    let entry = ins[ k ];
    if( _.strIs( entry ) )
    {
      let found = src1.indexOf( entry );
      if( found >= 0 && ( found < result.index || result.entry === undefined ) )
      {
        result.instanceIndex = k;
        result.index = found;
        result.entry = entry;
      }
    }
    else if( _.regexpIs( entry ) )
    {
      let found = src1.match( entry );
      if( found && ( found.index < result.index || result.entry === undefined ) )
      {
        result.instanceIndex = k;
        result.index = found.index;
        result.entry = found[ 0 ];
      }
    }
    else _.assert( 0, 'Expects string-like ( string or regexp )' );
  }

  if( range[ 0 ] !== 0 && result.index !== src.length )
  result.index += range[ 0 ];

  return result;
}

//

function strLeft( src, ins, range )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _._strLeftSingle( src[ s ], ins, range );
    return result;
  }
  else
  {
    return _._strLeftSingle( src, ins, range );
  }

}

//

/*

(bb)(?!(?=.).*(?:bb))
aa_bb_|bb|b_cc_cc

.*(bb)
aa_bb_b|bb|_cc_cc

(b+)(?!(?=.).*(?:b+))
aa_bb_|bb|_cc_cc

.*(b+)
aa_bb_bb|b|_cc_cc

*/

// function _strRightSingle( src, ins, first, last )
// {
// 
//   _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
//   _.assert( _.strIs( src ) );
//   _.assert( first === undefined || _.numberIs( first ) );
//   _.assert( last === undefined || _.numberIs( last ) );
// 
//   ins = _.arrayAs( ins );
// 
//   let olength = src.length;
//   let result = Object.create( null );
//   result.index = -1;
//   result.instanceIndex = -1;
//   result.entry = undefined;
// 
//   if( first !== undefined || last !== undefined )
//   {
//     if( first === undefined )
//     first = 0;
//     if( last === undefined )
//     last = src.length;
//     if( first < 0 )
//     first = src.length + first;
//     if( last < 0 )
//     last = src.length + last;
//     // if( first >= src.length )
//     // return result;
//     // if( last <= -1 )
//     // return result;
//     _.assert( 0 <= first && first <= src.length );
//     _.assert( 0 <= last && last <= src.length );
//     src = src.substring( first, last );
//   }
// 
//   for( let k = 0, len = ins.length ; k < len ; k++ )
//   {
//     let entry = ins[ k ];
//     if( _.strIs( entry ) )
//     {
//       let found = src.lastIndexOf( entry );
//       if( found >= 0 && found > result.index )
//       {
//         result.instanceIndex = k;
//         result.index = found;
//         result.entry = entry;
//       }
//     }
//     else if( _.regexpIs( entry ) )
//     {
// 
//       let regexp1 = _.regexpsJoin([ '.*', '(', entry, ')' ]);
//       let match1 = src.match( regexp1 );
//       if( !match1 )
//       continue;
// 
//       let regexp2 = _.regexpsJoin([ entry, '(?!(?=.).*', entry, ')' ]);
//       let match2 = src.match( regexp2 );
//       _.assert( !!match2 );
// 
//       let found;
//       let found1 = match1[ 1 ];
//       let found2 = match2[ 0 ];
//       let index;
//       let index1 = match1.index + match1[ 0 ].length;
//       let index2 = match2.index + match2[ 0 ].length;
// 
//       if( index1 === index2 )
//       {
//         if( found1.length < found2.length )
//         {
//           // debugger;
//           found = found2;
//           index = index2 - found.length;
//         }
//         else
//         {
//           found = found1;
//           index = index1 - found.length;
//         }
//       }
//       else if( index1 < index2 )
//       {
//         found = found2;
//         index = index2 - found.length;
//       }
//       else
//       {
//         found = found1;
//         index = index1 - found.length;
//       }
// 
//       if( index > result.index )
//       {
//         result.instanceIndex = k;
//         result.index = index;
//         result.entry = found;
//       }
// 
//     }
//     else _.assert( 0, 'Expects string-like ( string or regexp )' );
//   }
// 
//   if( first !== undefined && result.index !== -1 )
//   result.index += first;
// 
//   return result;
// }

function _strRightSingle( src, ins, range )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.strIs( src ) );

  if( _.numberIs( range ) )
  range = [ range, src.length ];
  else if( range === undefined )
  range = [ 0, src.length ];

  range[ 0 ] = range[ 0 ] === undefined ? 0 : range[ 0 ];
  range[ 1 ] = range[ 1 ] === undefined ? src.length : range[ 1 ];
  if( range[ 0 ] < 0 )
  range[ 0 ] = src.length + range[ 0 ];
  if( range[ 1 ] < 0 )
  range[ 1 ] = src.length + range[ 1 ];

  _.assert( _.rangeIs( range ) );
  _.assert( 0 <= range[ 0 ] && range[ 0 ] <= src.length );
  _.assert( 0 <= range[ 1 ] && range[ 1 ] <= src.length );

  let olength = src.length;
  let result = Object.create( null );
  result.index = -1;
  result.instanceIndex = -1;
  result.entry = undefined;
  ins = _.arrayAs( ins );
  let src1 = src.substring( range[ 0 ], range[ 1 ] );
  
  for( let k = 0, len = ins.length ; k < len ; k++ )
  {
    let entry = ins[ k ];
    if( _.strIs( entry ) )
    {
      let found = src1.lastIndexOf( entry );
      if( found >= 0 && found > result.index )
      {
        result.instanceIndex = k;
        result.index = found;
        result.entry = entry;
      }
    }
    else if( _.regexpIs( entry ) )
    {

      let regexp1 = _.regexpsJoin([ '.*', '(', entry, ')' ]);
      let match1 = src1.match( regexp1 );
      if( !match1 )
      continue;

      let regexp2 = _.regexpsJoin([ entry, '(?!(?=.).*', entry, ')' ]);
      let match2 = src1.match( regexp2 );
      _.assert( !!match2 );

      let found;
      let found1 = match1[ 1 ];
      let found2 = match2[ 0 ];
      let index;
      let index1 = match1.index + match1[ 0 ].length;
      let index2 = match2.index + match2[ 0 ].length;

      if( index1 === index2 )
      {
        if( found1.length < found2.length )
        {
          found = found2;
          index = index2 - found.length;
        }
        else
        {
          found = found1;
          index = index1 - found.length;
        }
      }
      else if( index1 < index2 )
      {
        found = found2;
        index = index2 - found.length;
      }
      else
      {
        found = found1;
        index = index1 - found.length;
      }

      if( index > result.index )
      {
        result.instanceIndex = k;
        result.index = index;
        result.entry = found;
      }

    }
    else _.assert( 0, 'Expects string-like ( string or regexp )' );
  }

  if( range[ 0 ] !== 0 && result.index !== -1 )
  result.index += range[ 0 ];

  return result;
}

//

function strRight( src, ins, range )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _._strRightSingle( src[ s ], ins, range );
    return result;
  }
  else
  {
    return _._strRightSingle( src, ins, range );
  }

}

// //
//
// function _strCutOff_pre( routine, args )
// {
//   let o;
//
//   if( args.length > 1 )
//   {
//     o = { src : args[ 0 ], delimeter : args[ 1 ], number : args[ 2 ] };
//   }
//   else
//   {
//     o = args[ 0 ];
//     _.assert( args.length === 1, 'Expects single argument' );
//   }
//
//   _.routineOptions( routine, o );
//   _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( o.src ) );
//   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
//
//   return o;
// }

//

/**
 * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
 * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
 * Otherwise returns undefined.
 *
 * @param { String } src - The source string.
 * @param { String } begin - String to find from begin of source.
 * @param { String } end - String to find from end source.
 *
 * @example
 * _.strInsideOf( 'abcd', 'a', 'd' );
 * // returns 'bc'
 *
 * @example
 * _.strInsideOf( 'aabcc', 'a', 'c' );
 * // returns 'aabcc'
 *
 * @example
 * _.strInsideOf( 'aabcc', 'a', 'a' );
 * // returns 'a'
 *
 * @example
 * _.strInsideOf( 'abc', 'a', 'a' );
 * // returns undefined
 *
 * @example
 * _.strInsideOf( 'abcd', 'x', 'y' )
 * // returns undefined
 *
 * @example
 * // index of begin is bigger then index of end
 * _.strInsideOf( 'abcd', 'c', 'a' )
 * // returns undefined
 *
 * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
 * @throws { Exception } If all arguments are not strings;
 * @throws { Exception } If ( arguments.length ) is not equal 3.
 * @function strInsideOf
 * @memberof wTools
 */

function strInsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let beginOf, endOf;

  beginOf = _.strBeginOf( src, begin );
  if( beginOf === false )
  return false;

  endOf = _.strEndOf( src, end );
  if( endOf === false )
  return false;

  let result = src.substring( beginOf.length, src.length - endOf.length );

  return result;
}

//

function strOutsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let beginOf, endOf;

  beginOf = _.strBeginOf( src, begin );
  if( beginOf === false )
  return false;

  endOf = _.strEndOf( src, end );
  if( endOf === false )
  return false;

  let result = beginOf + endOf;

  return result;
}

//--
// replacers 
//--

function _strRemovedBegin( src, begin )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );

  let result = src;
  let beginOf = _._strBeginOf( result, begin );
  if( beginOf !== false )
  result = result.substr( beginOf.length, result.length );

  return result;
}

//

/**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * _.strRemoveBegin( 'example', 'exa' );
 * // returns mple
 *
 * @example
 * _.strRemoveBegin( 'example', 'abc' );
 * // returns example
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveBegin( src, begin )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
  _.assert( _.longIs( begin ) || _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );

  let result = [];
  let srcIsArray = _.longIs( src );

  if( _.strIs( src ) && !_.longIs( begin ) )
  return _._strRemovedBegin( src, begin );

  src = _.arrayAs( src );
  begin = _.arrayAs( begin );
  for( let s = 0, slen = src.length ; s < slen ; s++ )
  {
    let beginOf = false;
    let src1 = src[ s ]
    for( let b = 0, blen = begin.length ; b < blen ; b++ )
    {
      beginOf = _._strBeginOf( src1, begin[ b ] );
      if( beginOf !== false )
      break;
    }
    if( beginOf !== false )
    src1 = src1.substr( beginOf.length, src1.length );
    result[ s ] = src1;
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}

//

function _strRemovedEnd( src, end )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );

  let result = src;
  let endOf = _._strEndOf( result, end );
  if( endOf !== false )
  result = result.substr( 0, result.length - endOf.length );

  return result;
}

//

/**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * _.strRemoveEnd( 'example', 'le' );
 * // returns examp
 *
 * @example
 * _.strRemoveEnd( 'example', 'abc' );
 * // returns example
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strRemoveEnd( src, end )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
  _.assert( _.longIs( end ) || _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );

  let result = [];
  let srcIsArray = _.longIs( src );

  if( _.strIs( src ) && !_.longIs( end ) )
  return _._strRemovedEnd( src, end );

  src = _.arrayAs( src );
  end = _.arrayAs( end );

  for( let s = 0, slen = src.length ; s < slen ; s++ )
  {
    let endOf = false;
    let src1 = src[ s ]
    for( let b = 0, blen = end.length ; b < blen ; b++ )
    {
      endOf = _._strEndOf( src1, end[ b ] );
      if( endOf !== false )
      break;
    }
    if( endOf !== false )
    src1 = src1.substr( 0, src1.length - endOf.length );
    result[ s ] = src1;
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}

//

function strReplaceBegin( src, begin, ins )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( ins ) || _.longIs( ins ), 'Expects {-ins-} as string/array of strings' );
  if( _.longIs( begin ) && _.longIs( ins ) )
  _.assert( begin.length === ins.length );

  begin = _.arrayAs( begin );
  let result = _.arrayAs( src ).slice();

  for( let k = 0, srcLength = result.length; k < srcLength; k++ )
  for( let j = 0, beginLength = begin.length; j < beginLength; j++ )
  if( _.strBegins( result[ k ], begin[ j ] ) )
  {
    let prefix = _.longIs( ins ) ? ins[ j ] : ins;
    _.assert( _.strIs( prefix ) );
    result[ k ] = prefix + _.strRemoveBegin( result[ k ] , begin[ j ] );
    break;
  }

  if( result.length === 1 && _.strIs( src ) )
  return result[ 0 ];

  return result;
}

//

function strReplaceEnd( src, end, ins )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( ins ) || _.longIs( ins ), 'Expects {-ins-} as string/array of strings' );
  if( _.longIs( end ) && _.longIs( ins ) )
  _.assert( end.length === ins.length );

  end = _.arrayAs( end );
  let result = _.arrayAs( src ).slice();

  for( let k = 0, srcLength = result.length; k < srcLength; k++ )
  for( let j = 0, endLength = end.length; j < endLength; j++ )
  if( _.strEnds( result[ k ], end[ j ] ) )
  {
    let postfix = _.longIs( ins ) ? ins[ j ] : ins;
    _.assert( _.strIs( postfix ) );
    result[ k ] = _.strRemoveEnd( result[ k ] , end[ j ] ) + postfix;
    break;
  }

  if( result.length === 1 && _.strIs( src ) )
  return result[ 0 ];

  return result;
}

//

function _strReplaced( srcStr, insStr, subStr )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( srcStr ), 'Expects string {-src-}' );

  let result = srcStr;

  if( !_.longIs( insStr ) )
  {
    _.assert( _.strIs( subStr ), 'Expects string {-sub-}' );

    result = result.replace( insStr, subStr );
  }
  else
  {
    _.assert( insStr.length === subStr.length, 'Search and replace strings must have same length' );
    for( let i = 0; i < insStr.length; i++ )
    {
      _.assert( _.strIs( subStr[ i ] ), 'Expects string {-sub-}' );

      result = result.replace( insStr[ i ], subStr[ i ] );
    }
  }

  return result;
}

//

/**
* Finds substring or regexp ( insStr ) occurrence from the source string ( srcStr ) and replaces them
* with the subStr values.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be replaced.
* @param { String } subStr - Replacement String/RegExp.
* @returns { String } Returns string with result of substring replacement.
*
* @example
* _.strReplace( 'source string', 's', 'S' );
* // returns Source string
*
* @example
* _.strReplace( 'example', 's' );
* // returns example
*
* @function strReplace
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( subStr ) is not a String.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
* @memberof wTools
*
*/

function strReplace( srcStr, insStr, subStr )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.longIs( srcStr ) || _.strIs( srcStr ), 'Expects string or array of strings {-src-}' );
  _.assert( _.longIs( insStr ) || _.strIs( insStr ) || _.regexpIs( insStr ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( _.longIs( subStr ) || _.strIs( subStr ), 'Expects string or array of strings {-src-}' );

  let result = [];
  let srcIsArray = _.longIs( srcStr );

  if( _.strIs( srcStr ) && !_.longIs( srcStr ) )
  return _._strReplaced( srcStr, insStr, subStr );

  srcStr = _.arrayAs( srcStr );

  for( let s = 0; s < srcStr.length; s++ )
  {
    let src = srcStr[ s ];
    result[ s ] = _._strReplaced( src, insStr, subStr );
  }

  if( !srcIsArray )
  return result[ 0 ];

  return result;
}

//

// function strReplaceBegin( src, begin, ins )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( ins ), 'Expects {-ins-} as string' );
//   _.assert( _.strIs( src ) );
// 
//   let result = src;
//   if( _.strBegins( result , begin ) )
//   {
//     let prefix = ins;
//     result = prefix + _.strRemoveBegin( result, begin );
//   }
// 
//   return result;
// }
// 
// //
// 
// function strReplaceEnd( src, end, ins )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( ins ), 'Expects {-ins-} as string' );
//   _.assert( _.strIs( src ) );
// 
//   let result = src;
//   if( _.strEnds( result, end ) )
//   {
//     let postfix = ins;
//     result = _.strRemoveEnd( result , end ) + postfix;
//   }
// 
//   return result;
// }
// 
// //
// 
// function strReplace( srcStr, insStr, subStr )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( srcStr ), 'Expects string {-src-}' );
//   _.assert( _.strIs( subStr ), 'Expects string {-sub-}' );
// 
//   let result = srcStr;
//   debugger;
// 
//   result = result.replace( insStr, subStr );
// 
//   return result;
// }


// --
// fields
// --

let Fields =
{
  // QuotePair,
}

// --
// routines
// --

let Routines =
{

  // decorator

  strQuote, /* xxx : move up */ /* Dmytro : covered */
  strUnquote, /* xxx : move up */ /* qqq : cover please | Dmytro : covered */
  strQuotePairsNormalize, /* qqq : cover please strQuotePairsNormalize | Dmytro : covered */
  strQuoteAnalyze, /* qqq : cover please | Dmytro : extended coverage */

  //

  _strLeftSingle,
  strLeft, /* qqq : improve coverage | Dmytro : covered */
  _strRightSingle,
  strRight, /* qqq : improve coverage | Dmytro : covered */

  strsEquivalentAll : _.vectorizeAll( _.strEquivalent, 2 ), /* Dmytro : coverage is extended */
  strsEquivalentAny : _.vectorizeAny( _.strEquivalent, 2 ), /* Dmytro : coverage is extended */
  strsEquivalentNone : _.vectorizeNone( _.strEquivalent, 2 ), /* Dmytro : coverage is extended */

  strInsideOf, /* Dmytro : covered */
  strOutsideOf, /* Dmytro : covered */

  // replacers 

  _strRemovedBegin,
  strRemoveBegin, /* Dmytro : covered */
  _strRemovedEnd,
  strRemoveEnd, /* Dmytro : covered */

  strReplaceBegin, /* Dmytro : covered */
  strReplaceEnd,
  _strReplaced,
  strReplace,

  /* qqq : check coverage of each routine of the file fString.s */

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
