( function _fString_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// decorator
// --

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
  let isolated = _.strIsolateInside( result, o.quote );
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

/**
 * The routine `strQuotePairsNormalize` analyzes source String or Array and creates an Array of arrays of pairs of quotes.
 * Returns an array with arrays of pairs of quotes.
 *
 * @param { String|Array|_.boolLikeTrue } quote -
 * String : String to add matching pairs to.
 * _.boolLikeTrue : Returnes an array of arrays of 2 elements ( 3 types of quotes: ', ", ` ).
 * Array of strings : Creates matching quotes for strings.
 * Array of arrays of strings : Checks to be exactly 2 elements in array & adds them to the result array.
 *
 * @example
 * _.strQuotePairsNormalize( true );
 * // returns
 * [
 *   [ '"', '"' ],
 *   [ '`', '`' ],
 *   [ '\'', '\'' ]
 * ]
 *
 * @example
 * _.strQuotePairsNormalize( '' );
 * // returns [ [ '', '' ] ]
 *
 * @example
 * _.strQuotePairsNormalize( 'str' );
 * // returns [ [ 'str', 'str' ] ]
 *
 * @example
 * _.strQuotePairsNormalize( [ '', ' ', '\n', 'str' ] );
 * // returns
 * [
 *   [ '', '' ],
 *   [ ' ', ' ' ],
 *   [ '\n', '\n' ],
 *   [ 'str', 'str' ]
 * ]
 *
 * @example
 * _.strQuotePairsNormalize( [ [ '', '' ], [ ' ',  ' ' ], [ '\n', '\n' ], [ 'str', 'str' ] ] )
 * // returns
 * [
 *   [ '', '' ],
 *   [ ' ', ' ' ],
 *   [ '\n', '\n' ],
 *   [ 'str', 'str' ]
 * ]
 *
 * @example
 * _.strQuotePairsNormalize( [ [ '', '' ], '', [ ' ',  ' ' ], '""', [ '\n', '\n' ], '\t', [ 'str', 'str' ], 'src' ] )
 * // returns
 * [
 *   [ '', '' ], [ '', '' ],
 *   [ ' ', ' ' ], [ '""', '""' ],
 *   [ '\n', '\n' ], [ '\t', '\t' ],
 *   [ 'str', 'str' ], [ 'src', 'src' ]
 * ]
 *
 * @returns { Array } Returns an array of arrays with pair of quotes.
 * @throws { Exception } If { -quote- } is not of String or Array type.
 * @throws { Exception } If { -quote- } is of Array type and includes an array with not exactly 2 elements.
 * @throws { Exception } If ( arguments.length ) is not exactly equals 1.
 * @function strQuotePairsNormalize
 * @namespace Tools
 */

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

/**
 * The routine `strQuoteAnalyze` analyzes source string and quotes within it.
 * Returns a map with 2 arrays:
 * ranges - indexes of quotes in a source string,
 * quotes - types of quotes used in a source string.
 *
 * @param { Object } o - Options map.
 * @param { String } src - Source string to analyze.
 * @param { String } quote - Quotes to be found in a source string.
 *
 * @example
 * _.strQuoteAnalyze( 'a b c' );
 * // returns { ranges : [], quotes : [] }
 *
 * @example
 * _.strQuoteAnalyze( '"a b" c' );
 * // returns { ranges : [ 0, 4 ], quotes : [ '"' ] }
 *
 * @example
 * _.strQuoteAnalyze( '`a `"b c"`' );
 * // returns { ranges : [ 0, 3, 4, 8 ], quotes : [ '`', '"' ] }
 *
 * @example
 * _.strQuoteAnalyze('""`a `"""b c"``""' );
 * // returns { ranges : [ 0, 1, 2, 5, 6, 7, 8, 12, 13, 14, 15, 16 ], quotes : [ '"', '`', '"', '"', '`', '"' ] }
 *
 * @example
 * _.strQuoteAnalyze( "a', b'`,c` \"", [ [ '\'', '\'' ], '`' ] )
 * // returns { ranges : [ 1, 5, 6, 9 ], quotes : [ "'", "`" ] }
 *
 * @example
 * _.strQuoteAnalyze( "--aa-- --bb--``''\"\",,cc,,", '--' )
 * // returns { ranges : [ 0, 4, 7, 11 ], quotes : [ '--', '--' ] }
 *
 * @returns { Object } Returns a map with 2 arrays: ranges, quotes.
 * @throws { Exception } If redundant arguments are provided.
 * @throws { Exception } If ( arguments.length ) is not equal 1 or 2.
 * @function strQuoteAnalyze
 * @namespace Tools
 */

function strQuoteAnalyze( o )
{
  let i = -1;
  let result = Object.create( null );
  result.ranges = [];
  result.quotes = [];

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
// splitter
// --

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
// function _strCutOff_head( routine, args )
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
 * Routine strInsideOf() returns part of a source string {-src-} between first occurrence of {-begin-} and last occurrence of {-end-}.
 * Returns result if {-begin-} and {-end-} exists in the {-src-} and index of {-end-} is bigger the index of {-begin-}.
 * Otherwise returns undefined.
 *
 * @example
 * _.strInsideOf({ src : 'abcd', begin : 'a', end : 'd', pairing : 0 });
 * // returns : 'bc'
 *
 * @example
 * _.strInsideOf({ src : 'abcd', begin : 'a', end : 'd', pairing : 1 });
 * // returns : undefined
 *
 * @example
 * // index of begin is bigger then index of end
 * _.strInsideOf( 'abcd', 'c', 'a' )
 * // returns : undefined
 *
 * @example
 * _.strInsideOf( 'abc', 'a', 'a' );
 * // returns : undefined
 *
 * @example
 * _.strInsideOf( 'abcd', 'x', 'y' )
 * // returns : undefined
 *
 * @example
 * _.strInsideOf( 'a', 'a', 'a' );
 * // returns : 'a'
 *
 * Basic parameter set :
 * @param { String } src - The source string.
 * @param { String|Array } begin - String or array of strings to find from begin of source.
 * @param { String|Array } end - String or array of strings to find from end source.
 * Alternative parameter set :
 * @param { String } o - Options map.
 * @param { String } o.src - The source string.
 * @param { String|Array } o.begin - String or array of strings to find from begin of source.
 * @param { String|Array } o.end - String or array of strings to find from end source.
 * @param { BoolLike } o.pairing - If option is enabled and {-begin-} ( or {-end-} ) is an Array of strings, then
 * both containerized {-begin-} and {-end-} should have equivalent lengths.
 * @returns { String|Undefined } - Returns part of source string between {-begin-} and {-end-} or undefined.
 * @throws { Exception } If arguments.length is 1 and argument is not an options map {-o-}.
 * @throws { Exception } If arguments.length is 3 and any of arguments is not a String.
 * @throws { Exception } If arguments.length neither is 1 nor 3.
 * @throws { Exception } If {-o.pairing-} is true like and containerized version of {-o.begin-} and {-o.end-}
 * have different length.
 * @throws { Exception } If options map {-o-} has unknown properties.
 * @function strInsideOf
 * @namespace Tools
 */

function strInsideOf_head( routine, args )
{

  let o = args[ 0 ]
  if( _.mapIs( o ) )
  {
    _.assert( args.length === 1, 'Expects exactly one argument' );
  }
  else
  {
    o = Object.create( null );
    o.src = args[ 0 ];
    o.begin = args[ 1 ];
    o.end = args[ 2 ];
    _.assert( args.length === 3, 'Expects exactly three arguments' );
  }

  _.routineOptions( routine, o );
  _.assert( _.strIs( o.src ), 'Expects string {-o.src-}' );

  if( _.longIs( o.begin ) && o.begin.length === 1 )
  o.begin = o.begin[ 0 ];
  if( _.longIs( o.end ) && o.end.length === 1 )
  o.end = o.end[ 0 ];
  if( _.longIs( o.begin || _.longIs( o.end )) )
  {
    o.begin = _.arrayAs( o.begin );
    o.end = _.arrayAs( o.end );
  }

  _.assert
  (
    !o.pairing || !_.longIs( o.begin ) || o.begin.length === o.end.length,
    `If option::o.paring is true then length of o.begin should be equal to length of o.end`
  );

  return o;
}

function strInsideOf_body( o )
{
  let beginOf, endOf;

  beginOf = _.strBeginOf( o.src, o.begin );
  if( beginOf === undefined )
  return undefined;

  endOf = _.strEndOf( o.src, o.end );
  if( endOf === undefined )
  return undefined;

  if( o.pairing )
  if( beginOf !== endOf )
  return undefined;

  let result = o.src.substring( beginOf.length, o.src.length - endOf.length );

  return result;
}

strInsideOf_body.defaults =
{
  src : null,
  begin : null,
  end : null,
  pairing : 0, /* xxx : set to 1 */
}

//

let strInsideOf = _.routineUnite( strInsideOf_head, strInsideOf_body ); /* aaa2 for Dmytro : cover please */ /* Dmytro : covered */

//

/**
 * Routine strInsideOf_() founds parts of a source string {-src-} between first occurrence of {-begin-} at the begin of {-src-}
 * and first occurrence of {-end-} at the end of {-src-}.
 * Returns result if {-begin-} and {-end-} exists in the {-src-} and index of {-end-} is bigger the index of {-begin-}.
 * The format of returned value : [ begin, mid, end ].
 * If {-src-} has not {-begin-} or {-end-} routine returns : [ undefined, undefined, undefined ].
 * If option {-o.pairing-} is true and founded {-begin-} is not equivalent to founded {-end-},
 * then routine returns : [ undefined, undefined, undefined ].
 *
 * @example
 * _.strInsideOf_( 'abc', 'a', 'a' );
 * // returns :[ undefined, undefined, undefined ]
 *
 * @example
 * _.strInsideOf_( 'abcd', 'x', 'y' )
 * // returns : [ undefined, undefined, undefined ]
 *
 * @example
 * _.strInsideOf_( 'abc', 'abc', 'abc' );
 * // returns : 'abc'
 *
 * @example
 * _.strInsideOf_({ src : 'abcd', begin : 'a', end : 'd', pairing : 0 });
 * // returns : [ 'a', 'bc', 'd' ]
 *
 * @example
 * _.strInsideOf_({ src : 'abcd', begin : 'a', end : 'd', pairing : 1 });
 * // returns : [ undefined, undefined, undefined ]
 *
 * Basic parameter set :
 * @param { String } src - The source string.
 * @param { String|Array } begin - String or array of strings to find from begin of source.
 * @param { String|Array } end - String or array of strings to find from end source.
 * Alternative parameter set :
 * @param { String } o - Options map.
 * @param { String } o.src - The source string.
 * @param { String|Array } o.begin - String or array of strings to find from begin of source.
 * @param { String|Array } o.end - String or array of strings to find from end source.
 * @param { BoolLike } o.pairing - If option is enabled, then founded begin of {-src-} and
 * founded end of {-src-} should be identical.
 * @returns { Array } - Returns array with parts of source string {-src-} in format : [ begin, mid, end ].
 * If any of part has no entry, routine returns array : [ undefined, undefined, undefined ].
 * If pairing is enabled, and founded begin and end is not equivalent, then routine returns : [ undefined, undefined, undefined ].
 * @throws { Exception } If arguments.length is 1 and argument is not an options map {-o-}.
 * @throws { Exception } If arguments.length is 3 and any of arguments is not a String.
 * @throws { Exception } If arguments.length neither is 1 nor 3.
 * @throws { Exception } If {-src-} ( {-o.src-} ) is not a String.
 * @throws { Exception } If any of {-begin-} ( {-o.begin-} ) or {-end-} ( {-o.end-} ) is not a String or array of Strings.
 * @throws { Exception } If options map {-o-} has unknown properties.
 * @function strInsideOf_
 * @namespace Tools
 */

function strInsideOf__head( routine, args )
{

  let o = args[ 0 ];
  if( _.mapIs( o ) )
  {
    _.assert( args.length === 1, 'Expects exactly one argument' );
  }
  else
  {
    o = Object.create( null );
    o.src = args[ 0 ];
    o.begin = args[ 1 ];
    o.end = args[ 2 ];
    _.assert( args.length === 3, 'Expects exactly three arguments' );
  }

  _.assert( _.strIs( o.src ), 'Expects string {-o.src-}' );
  _.routineOptions( routine, o );

  if( _.longIs( o.begin ) && o.begin.length === 1 )
  o.begin = o.begin[ 0 ];
  if( _.longIs( o.end ) && o.end.length === 1 )
  o.end = o.end[ 0 ];

  return o;
}

function strInsideOf__body( o )
{

  let begin = _.strBeginOf( o.src, o.begin );
  if( begin === undefined )
  return [ undefined, undefined, undefined ];

  let end = _.strEndOf( o.src, o.end );
  if( end === undefined )
  return [ undefined, undefined, undefined ];

  if( o.pairing )
  if( begin !== end )
  return [ undefined, undefined, undefined ];

  let mid = o.src.substring( begin.length, o.src.length - end.length );

  return [ begin, mid, end ];
}

strInsideOf__body.defaults =
{
  src : null,
  begin : null,
  end : null,
  pairing : 0, /* xxx : set to 1 */
}

let strInsideOf_ = _.routineUnite( strInsideOf__head, strInsideOf__body );

//

function strOutsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  let beginOf, endOf;

  beginOf = _.strBeginOf( src, begin );
  if( beginOf === undefined )
  return undefined;

  endOf = _.strEndOf( src, end );
  if( endOf === undefined )
  return undefined;

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
  if( beginOf !== undefined )
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
 * @namespace Tools
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
    let beginOf = undefined;
    let src1 = src[ s ]
    for( let b = 0, blen = begin.length ; b < blen ; b++ )
    {
      beginOf = _._strBeginOf( src1, begin[ b ] );
      if( beginOf !== undefined )
      break;
    }
    if( beginOf !== undefined )
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
  if( endOf !== undefined )
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
 * @namespace Tools
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
    let endOf = undefined;
    let src1 = src[ s ]
    for( let b = 0, blen = end.length ; b < blen ; b++ )
    {
      endOf = _._strEndOf( src1, end[ b ] );
      if( endOf !== undefined )
      break;
    }
    if( endOf !== undefined )
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
    result[ k ] = prefix + _.strRemoveBegin( result[ k ], begin[ j ] );
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
    result[ k ] = _.strRemoveEnd( result[ k ], end[ j ] ) + postfix;
    break;
  }

  if( result.length === 1 && _.strIs( src ) )
  return result[ 0 ];

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
* @namespace Tools
*
*/

// function strReplace( src, ins, sub )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( sub ) || _.longIs( sub ), 'Expects {-sub-} as string/array of strings' );
//
//   if( _.longIs( ins ) && _.longIs( sub ) )
//   _.assert( ins.length === sub.length );
//
//   ins = _.arrayAs( ins );
//   let result = _.arrayAs( src ).slice();
//
//   for( let k = 0 ; k < result.length ; k++ )
//   for( let j = 0 ; j < ins.length ; j++ )
//   if( _.strHas( result[ k ], ins[ j ] ) )
//   {
//     let postfix = _.longIs( sub ) ? sub[ j ] : sub;
//     _.assert( _.strIs( postfix ) );
//     result[ k ] = result[ k ].replace( ins[ j ], postfix );
//     break;
//   }
//
//   if( result.length === 1 && _.strIs( src ) )
//   return result[ 0 ];
//
//   return result;
// }
//
// function strReplace( src, ins, sub ) /* aaa2 : ask */ /* Dmytro : implemented. See below, please */
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strsAreAll( sub ), 'Expects {-sub-} as string/array of strings' );
//
//   if( _.longIs( ins ) && _.longIs( sub ) )
//   _.assert( ins.length === sub.length );
//
//   ins = _.arrayAs( ins );
//   for( let i = 0 ; i < ins.length ; i++ )
//   _.assert( ins[ i ] !== '', '{-ins-} should be a string with length' );
//
//   /* */
//
//   let result = _.arrayAs( src ).slice();
//
//   for( let k = 0 ; k < result.length ; k++ )
//   result[ k ] = replaceRecurcive( result[ k ], 0 );
//
//   if( result.length === 1 && _.strIs( src ) )
//   return result[ 0 ];
//
//   return result;
//
//   /* */
//
//   function replaceRecurcive( src, index )
//   {
//     for( let i = index ; i < ins.length ; i++ )
//     {
//       if( _.strHas( src, ins[ i ] ) )
//       {
//         let postfix = _.longIs( sub ) ? sub[ i ] : sub;
//
//         let parts = src.split( ins[ i ] )
//         if( index + 1 < ins.length )
//         for( let i = 0 ; i < parts.length ; i++ )
//         parts[ i ] = replaceRecurcive( parts[ i ], index + 1 )
//
//         return parts.join( postfix );
//       }
//     }
//
//     return src;
//   }
//
// }

/* aaa2 : poor implementation */ /* Dmytro : used routine `strSplit` instead of cycles */

function strReplace( src, ins, sub )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strsAreAll( sub ), 'Expects {-sub-} as string/array of strings' );

  if( _.longIs( ins ) && _.longIs( sub ) )
  _.assert( ins.length === sub.length );

  ins = _.arrayAs( ins );
  for( let i = 0 ; i < ins.length ; i++ )
  _.assert( ins[ i ] !== '', '{-ins-} should be a string with length' );

  /* */

  let result = _.arrayAs( src ).slice();

  for( let i = 0 ; i < result.length ; i++ )
  {
    result[ i ] = _.strSplit
    ({
      src : result[ i ],
      delimeter : ins,
      quoting : 0,
      stripping : 0,
      preservingEmpty : 1,
      preservingDelimeters : 1,
      onDelimeter : ( e, k ) => _.strIs( sub ) ? sub : sub[ k ],
    });
    result[ i ] = result[ i ].join( '' );
  }

  // for( let k = 0 ; k < result.length ; k++ )
  // {
  //   let container = [ result[ k ] ];
  //
  //   for( let i = 0 ; i < ins.length ; i++ )
  //   {
  //     for( let l = 0 ; l < container.length ; l++ )
  //     {
  //       let insSrc = ins[ i ];
  //       let src  = container[ l ];
  //
  //       if( _.strIs( container[ l ] ) && _.strHas( container[ l ], insSrc ) )
  //       {
  //         let index, ins;
  //         if( _.regexpIs( insSrc ) )
  //         {
  //           let entry = insSrc.exec( src ); // Dmytro : single searching of substring
  //           index = entry.index;
  //           ins = entry[ 0 ];
  //         }
  //         else
  //         {
  //           index = src.indexOf( insSrc );
  //           ins = insSrc;
  //         }
  //
  //         _.assert( ins !== '', '{-ins-} should find string with length' );
  //
  //         while( index !== -1 )
  //         {
  //           container.splice( l, 1, src.substring( 0, index ), i );
  //           src = src.substring( index + ins.length );
  //           l += 2;
  //
  //           if( _.regexpIs( insSrc ) )
  //           {
  //             let entry = insSrc.exec( src );
  //             index = entry === null ? -1 : entry.index;
  //             ins = entry ? entry[ 0 ] : ins;
  //             _.assert( ins !== '', '{-ins-} should find string with length' );
  //           }
  //           else
  //           {
  //             index = src.indexOf( insSrc );
  //           }
  //         }
  //
  //         container.splice( l, 0, src );
  //       }
  //     }
  //   }
  //
  //   for( let j = 0 ; j < container.length ; j++ )
  //   if( _.numberIs( container[ j ] ) )
  //   container[ j ] = _.longIs( sub ) ? sub[ container[ j ] ] : sub;
  //
  //   result[ k ] = container.join( '' );
  // }

  if( result.length === 1 && _.strIs( src ) )
  return result[ 0 ];

  return result;
}

// --
// stripper
// --

/**
 * Removes leading and trailing characters occurrences from source string( o.src ) finded by mask( o.stripper ).
 * If( o.stripper ) is not defined function removes leading and trailing whitespaces and escaped characters from( o.src ).
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ({ src : ' acb ', stripper : ' ' }).
 *
 * @param {string|object} o - Source string to parse or map with source( o.src ) and options.
 * @param {string} [ o.src=null ]- Source string to strip.
 * @param {string|array} [ o.stripper=' ' ]- Contains characters to remove.
 * @returns {string} Returns result of removement in a string.
 *
 * @example
 * _.strStrip( { src : 'aabaa', stripper : 'a' } );
 * // returns 'b'
 *
 * @example
 * _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } )
 * // returns 'b'
 *
 * @example
 * _.strStrip( { src : '   b  \n' } )
 * // returns 'b'
 *
 * @method strStrip
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o ) is not Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.stripper ) is not a String or Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @namespace Tools
 *
 */

function strStrip( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStrip, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( o.src ) )
  {
    let result = [];
    for( let s = 0 ; s < o.src.length ; s++ )
    {
      let optionsForStrip = _.mapExtend( null, o );
      optionsForStrip.src = optionsForStrip.src[ s ];
      result[ s ] = strStrip( optionsForStrip );
    }
    return result;
  }

  if( _.boolLikeTrue( o.stripper ) )
  {
    o.stripper = strStrip.defaults.stripper;
  }

  _.assert( _.strIs( o.src ), 'Expects string or array o.src, got', _.strType( o.src ) );
  _.assert( _.strIs( o.stripper ) || _.arrayIs( o.stripper ) || _.regexpIs( o.stripper ), 'Expects string or array or regexp ( o.stripper )' );

  if( _.strIs( o.stripper ) || _.regexpIs( o.stripper ) )
  {
    let exp = o.stripper;
    if( _.strIs( exp ) )
    {
      exp = _.regexpEscape( exp );
      exp = new RegExp( exp, 'g' );
    }
    return o.src.replace( exp, '' );
  }
  else
  {

    _.assert( _.arrayIs( o.stripper ) );

    if( Config.debug )
    for( let s of o.stripper )
    {
      _.assert( _.strIs( s, 'Expects string {-stripper[ * ]-}' ) );
    }

    let b = 0;
    for( ; b < o.src.length ; b++ )
    if( o.stripper.indexOf( o.src[ b ] ) === -1 )
    break;

    let e = o.src.length-1;
    for( ; e >= 0 ; e-- )
    if( o.stripper.indexOf( o.src[ e ] ) === -1 )
    break;

    if( b >= e )
    return '';

    return o.src.substring( b, e+1 );
  }

}

strStrip.defaults =
{
  src : null,
  stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/gm,
}

//

/**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only leading whitespaces and escaped characters from( o.src ).
 *
 * @example
 * _.strStripLeft( ' a ' )
 * // returns 'a '
 *
 * @method strStripLeft
 * @namespace Tools
 *
 */

function strStripLeft( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStripLeft, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.strStrip( o );
}

strStripLeft.defaults =
{
  ... strStrip.defaults,
  stripper : /^(\s|\n|\0)+/gm,
}

//

/**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only trailing whitespaces and escaped characters from( o.src ).
 *
 * @example
 * _.strStripRight( ' a ' )
 * // returns ' a'
 *
 * @method strStripRight
 * @namespace Tools
 *
 */

function strStripRight( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStripRight, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.strStrip( o );
}

strStripRight.defaults =
{
  ... strStrip.defaults,
  stripper : /(\s|\n|\0)+$/gm,
}

//

/**
 * Removes whitespaces from source( src ).
 * If argument( sub ) is defined, function replaces whitespaces with it.
 *
 * @param {string} src - Source string to parse.
 * @param {string} sub - Substring that replaces whitespaces.
 * @returns {string} Returns a string with removed whitespaces.
 *
 * @example
 * _.strRemoveAllSpaces( 'a b c d e' );
 * // returns abcde
 *
 * @example
 * _.strRemoveAllSpaces( 'a b c d e', '*' );
 * // returns a*b*c*d*e
 *
 * @method strRemoveAllSpaces
 * @namespace Tools
 *
*/

function _strRemoveAllSpaces( src, sub )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( src ) );

  if( sub === undefined )
  sub = '';

  return src.replace( /\s/g, sub );
}

//

/**
 * Removes empty lines from the string passed by argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns a string with empty lines removed.
 *
 * @example
 * _.strStripEmptyLines( 'first\n\nsecond' );
 * // returns
 * // first
 * // second
 *
 * @example
 * _.strStripEmptyLines( 'zero\n\nfirst\n\nsecond' );
 * // returns
 * // zero
 * // first
 * // second
 *
 * @method strStripEmptyLines
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @namespace Tools
 *
 */

function _strStripEmptyLines( srcStr )
{
  let result = '';
  let lines = srcStr.split( '\n' );

  _.assert( _.strIs( srcStr ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  for( let l = 0; l < lines.length; l += 1 )
  {
    let line = lines[ l ];

    if( !_.strStrip( line ) )
    continue;

    result += line + '\n';
  }

  result = result.substring( 0, result.length - 1 );
  return result;
}

// --
// split
// --

function strSplitsCoupledGroup( o )
{

  if( _.arrayIs( o ) )
  o = { splits : o }

  o = _.routineOptions( strSplitsCoupledGroup, o );

  o.prefix = _.arrayAs( o.prefix );
  o.postfix = _.arrayAs( o.postfix );

  _.assert( arguments.length === 1 );
  _.assert( _.regexpsLike( o.prefix ) );
  _.assert( _.regexpsLike( o.postfix ) );

  let level = 0;
  let begins = [];
  for( let i = 0 ; i < o.splits.length ; i++ )
  {
    let element = o.splits[ i ];

    if( _.regexpsTestAny( o.prefix, element ) )
    {
      begins.push( i );
    }
    else if( _.regexpsTestAny( o.postfix, element ) )
    {
      if( begins.length === 0 && !o.allowingUncoupledPostfix )
      throw _.err( `"${ element }" does not have complementing openning\n` );

      if( begins.length === 0 )
      continue;

      let begin = begins.pop();
      let end = i;
      let l = end-begin;

      _.assert( l >= 0 )
      let newElement = o.splits.splice( begin, l+1, null );
      o.splits[ begin ] = newElement;

      i -= l;
    }

  }

  if( begins.length && !o.allowingUncoupledPrefix )
  {
    debugger;
    throw _.err( `"${ begins[ begins.length-1 ] }" does not have complementing closing\n` );
  }

  return o.splits;
}

strSplitsCoupledGroup.defaults =
{
  splits : null,
  prefix : '"',
  postfix : '"',
  allowingUncoupledPrefix : 0,
  allowingUncoupledPostfix : 0,
}

//

function strSplitsUngroupedJoin( o )
{

  if( _.arrayIs( o ) )
  o = { splits : o }
  o = _.routineOptions( strSplitsUngroupedJoin, o );

  let s = o.splits.length-1;
  let l = null;

  while( s >= 0 )
  {
    let split = o.splits[ s ];

    if( _.strIs( split ) )
    {
      if( l === null )
      l = s;
    }
    else if( l !== null )
    {
      join();
    }

    s -= 1;
  }

  if( l !== null )
  join();

  return o.splits;

  /* */

  function join()
  {
    if( s+1 < l )
    {
      let element = o.splits.slice( s+1, l+1 ).join( '' );
      o.splits.splice( s+1, l+1, element );
    }
    l = null;
  }

}

strSplitsUngroupedJoin.defaults =
{
  splits : null,
}

//

function strSplitsQuotedRejoin_head( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1, 'Expects one or two arguments' );
  _.assert( _.objectIs( o ) );

  if( o.quoting )
  {

    if( _.boolLike( o.quoting ) )
    {
      if( !o.quotingPrefixes )
      o.quotingPrefixes = [ '"' ];
      if( !o.quotingPostfixes )
      o.quotingPostfixes = [ '"' ];
    }
    else if( _.strIs( o.quoting ) || _.regexpIs( o.quoting ) || _.arrayIs( o.quoting ) )
    {
      _.assert( !o.quotingPrefixes );
      _.assert( !o.quotingPostfixes );
      o.quoting = _.arrayAs( o.quoting );
      o.quotingPrefixes = o.quoting.map( ( q ) => _.arrayIs( q ) ? q[ 0 ] : q );
      o.quotingPostfixes = o.quoting.map( ( q ) => _.arrayIs( q ) ? q[ 0 ] : q );
      o.quoting = true;
    }
    else _.assert( 0, 'unexpected type of {-o.quoting-}' );

    if( Config.debug )
    {
      _.assert( o.quotingPrefixes.length === o.quotingPostfixes.length );
      _.assert( _.boolLike( o.quoting ) );
      o.quotingPrefixes.forEach( ( q ) => _.assert( _.strIs( q ) ) );
      o.quotingPostfixes.forEach( ( q ) => _.assert( _.strIs( q ) ) );
    }

  }

  return o;
}

//

function strSplitsQuotedRejoin_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* quoting */

  // let s = 1; // why was it 1??
  let s = 0;
  if( o.quoting )
  {
    for( s ; s < o.splits.length ; s += 1 )
    splitsQuote( o.splits[ s ], s );
  }

  return o.splits;

  function splitsQuote( split, i )
  {
    let s2;
    let q = o.quotingPrefixes.indexOf( split );

    if( q >= 0 )
    {
      let postfix = o.quotingPostfixes[ q ];
      for( s2 = i+2 ; s2 < o.splits.length ; s2 += 1 )
      {
        let split2 = o.splits[ s2 ];
        if( split2 === postfix )
        {
          let bextra = 0;
          let eextra = 0;
          if( o.inliningQuoting )
          {
            s -= 1;
            bextra += 1;
            s2 += 1;
            eextra += 1;
          }
          let splitNew = o.splits.splice( s, s2-s+1, null );
          if( !o.preservingQuoting )
          {
            splitNew.splice( bextra, 1 );
            splitNew.splice( splitNew.length-1-eextra, 1 );
          }
          splitNew = splitNew.join( '' );
          if( o.onQuoting )
          o.splits[ s ] = o.onQuoting( splitNew, o );
          else
          o.splits[ s ] = splitNew;
          s2 = s;
          break;
        }
      }
    }

    /* if complementing postfix not found */

    if( s2 >= o.splits.length )
    {
      if( !_.longHas( o.delimeter, split ) )
      {
        let splitNew = o.splits.splice( s, 2 ).join( '' );
        o.splits[ s-1 ] = o.splits[ s-1 ] + splitNew;
        // let splitNew = o.splits.splice( s, 2 ).join( '' );
        // if( o.onQuoting )
        // o.splits[ s-1 ] = o.onQuoting( splitNew, o );
        // else
        // o.splits[ s-1 ] = o.splits[ s-1 ] + splitNew;
      }
      else
      {
      }
    }
  }
}

strSplitsQuotedRejoin_body.defaults =
{
  quoting : 1,
  quotingPrefixes : null,
  quotingPostfixes : null,
  preservingQuoting : 1,
  inliningQuoting : 1,
  splits : null,
  delimeter : null,
  onQuoting : null, /* qqq : cover */
}

//

let strSplitsQuotedRejoin = _.routineUnite( strSplitsQuotedRejoin_head, strSplitsQuotedRejoin_body );

// --
//
// --

function strSplitsDropDelimeters_head( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );

  if( _.strIs( o.delimeter ) )
  o.delimeter = [ o.delimeter ];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 );
  _.assert( _.objectIs( o ) );

  return o;
}

//

function strSplitsDropDelimeters_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* stripping */

  // if( o.delimeter.some( ( d ) => _.regexpIs( d ) ) )
  // debugger;

  for( let s = o.splits.length-1 ; s >= 0 ; s-- )
  {
    let split = o.splits[ s ];

    if( _.regexpsTestAny( o.delimeter, split ) ) /* xxx qqq : ? */
    o.splits.splice( s, 1 );

    // if( _.longHas( o.delimeter, split ) )
    // o.splits.splice( s, 1 );
    //
    // if( s % 2 === 1 )
    // o.splits.splice( s, 1 );

  }

  return o.splits;
}

strSplitsDropDelimeters_body.defaults =
{
  splits : null,
  delimeter : null,
}

//

let strSplitsDropDelimeters = _.routineUnite( strSplitsDropDelimeters_head, strSplitsDropDelimeters_body );

// --
//
// --

function strSplitsStrip_head( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );

  if( o.stripping && _.boolLike( o.stripping ) )
  o.stripping = _.strStrip.defaults.stripper;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 );
  _.assert( _.objectIs( o ) );
  _.assert( !o.stripping || _.strIs( o.stripping ) || _.regexpIs( o.stripping ) );

  return o;
}

//

function strSplitsStrip_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  if( !o.stripping )
  return o.splits;

  /* stripping */

  for( let s = 0 ; s < o.splits.length ; s++ )
  {
    let split = o.splits[ s ];

    if( _.strIs( split ) )
    split = _.strStrip({ src : split, stripper : o.stripping });

    o.splits[ s ] = split;
  }

  return o.splits;
}

strSplitsStrip_body.defaults =
{
  stripping : 1,
  splits : null,
}

//

let strSplitsStrip = _.routineUnite( strSplitsStrip_head, strSplitsStrip_body );

// --
//
// --

function strSplitsDropEmpty_head( routine, args )
{
  let o = args[ 0 ];

  _.routineOptions( routine, o );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 );
  _.assert( _.objectIs( o ) );

  return o;
}

//

function strSplitsDropEmpty_body( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.splits ) );

  /* stripping */

  for( let s = 0 ; s < o.splits.length ; s++ )
  {
    let split = o.splits[ s ];

    if( !split )
    {
      o.splits.splice( s, 1 );
      s -= 1;
    }

  }

  return o.splits;
}

strSplitsDropEmpty_body.defaults =
{
  splits : null,
}

//

let strSplitsDropEmpty = _.routineUnite( strSplitsDropEmpty_head, strSplitsDropEmpty_body );

// --
//
// --

function strSplitFast_head( routine, args )
{
  let o = args[ 0 ];

  if( args.length === 2 )
  o = { src : args[ 0 ], delimeter : args[ 1 ] }
  else if( _.strIs( args[ 0 ] ) )
  o = { src : args[ 0 ] }

  _.routineOptions( routine, o );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 || args.length === 2, 'Expects one or two arguments' );
  _.assert( _.strIs( o.src ) );
  _.assert( _.objectIs( o ) );

  return o;
}

//

function strSplitFast_body( o )
{
  let result, closests, position, closestPosition, closestIndex, hasEmptyDelimeter, delimeter

  o.delimeter = _.arrayAs( o.delimeter );

  let foundDelimeters = o.delimeter.slice();

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( o.delimeter ) );
  _.assert( _.boolLike( o.preservingDelimeters ) );

  /* */

  if( !o.preservingDelimeters && o.delimeter.length === 1 )
  {

    result = o.src.split( o.delimeter[ 0 ] );

    if( !o.preservingEmpty )
    result = result.filter( ( e ) => e ? e : false );

  }
  else
  {

    if( !o.delimeter.length )
    {
      result = [ o.src ];
      return result;
    }

    result = [];
    closests = [];
    position = 0;
    closestPosition = 0;
    closestIndex = -1;
    hasEmptyDelimeter = false;

    for( let d = 0 ; d < o.delimeter.length ; d++ )
    {
      let delimeter = o.delimeter[ d ];
      if( _.regexpIs( delimeter ) )
      {
        _.assert( !delimeter.sticky );
        if( delimeter.source === '' || delimeter.source === '()' || delimeter.source === '(?:)' )
        hasEmptyDelimeter = true;
        // debugger;
      }
      else
      {
        if( delimeter.length === 0 )
        hasEmptyDelimeter = true;
      }
      closests[ d ] = delimeterNext( d, position );
    }

    // let delimeter;

    do
    {
      closestWhich();

      if( closestPosition === o.src.length )
      break;

      if( !delimeter.length )
      position += 1;

      ordinaryAdd( o.src.substring( position, closestPosition ) );

      if( delimeter.length > 0 || position < o.src.length )
      delimeterAdd( delimeter );

      position = closests[ closestIndex ] + ( delimeter.length ? delimeter.length : 1 );

      // debugger;
      for( let d = 0 ; d < o.delimeter.length ; d++ )
      if( closests[ d ] < position )
      closests[ d ] = delimeterNext( d, position );
      // debugger;

    }
    while( position < o.src.length );

    if( delimeter || !hasEmptyDelimeter )
    ordinaryAdd( o.src.substring( position, o.src.length ) );

  }

  return result;

  /* */

  function delimeterAdd( delimeter )
  {

    if( o.preservingDelimeters )
    if( o.preservingEmpty || delimeter )
    {
      result.push( delimeter );
      // if( _.regexpIs( delimeter ) )
      // result.push( delimeter );
      // o.src.substring( position, closestPosition )
      // else
      // result.push( delimeter );
    }

  }

  /*  */

  function ordinaryAdd( ordinary )
  {
    if( o.preservingEmpty || ordinary )
    result.push( ordinary );
  }

  /* */

  function closestWhich()
  {

    closestPosition = o.src.length;
    closestIndex = -1;
    for( let d = 0 ; d < o.delimeter.length ; d++ )
    {
      if( closests[ d ] < o.src.length && closests[ d ] < closestPosition )
      {
        closestPosition = closests[ d ];
        closestIndex = d;
      }
    }

    delimeter = foundDelimeters[ closestIndex ];

  }

  /* */

  function delimeterNext( d, position )
  {
    _.assert( position <= o.src.length );
    let delimeter = o.delimeter[ d ];
    let result;

    if( _.strIs( delimeter ) )
    {
      result = o.src.indexOf( delimeter, position );
    }
    else
    {
      let execed = delimeter.exec( o.src.substring( position ) );
      if( execed )
      {
        result = execed.index + position;
        foundDelimeters[ d ] = execed[ 0 ];
      }
    }

    if( result === -1 )
    return o.src.length;
    return result;
  }

}

strSplitFast_body.defaults =
{
  src : null,
  delimeter : ' ',
  preservingEmpty : 1,
  preservingDelimeters : 1,
}

//

/**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strSplitFast( ' first second third ' );
 * // returns [ 'first', 'second', 'third' ]
 *
 * @example
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : ', '  } );
 * // returns [ 'a', 'b', 'c', 'd' ]
 *
 * @example
 * _.strSplitFast( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 * // returns [ 'a', 'b', 'c', 'd' ]
 *
 * @example
   * _.strSplitFast( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
   * // returns [ '    a', 'b', 'c', 'd   ' ]
 *
 * @example
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 * // returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 *
 * @example
 * _.strSplitFast( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 * // returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 *
 * @method strSplitFast
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @namespace Tools
 *
 */

let strSplitFast = _.routineUnite( strSplitFast_head, strSplitFast_body );

_.assert( strSplitFast.head === strSplitFast_head );
_.assert( strSplitFast.body === strSplitFast_body );
_.assert( _.objectIs( strSplitFast.defaults ) );

//

function strSplit_body( o )
{

  o.delimeter = _.arrayAs( o.delimeter );

  if( !o.stripping && !o.quoting && !o.onDelimeter )
  {
    return _.strSplitFast.body( _.mapOnly( o, _.strSplitFast.defaults ) );
  }

  /* */

  _.assert( arguments.length === 1 );

  /* */

  let result = [];
  let fastOptions = _.mapOnly( o, _.strSplitFast.defaults );
  fastOptions.preservingEmpty = 1;
  fastOptions.preservingDelimeters = 1;

  if( o.quoting )
  fastOptions.delimeter = _.arrayAppendArraysOnce( [], [ o.quotingPrefixes, o.quotingPostfixes, fastOptions.delimeter ] );

  o.splits = _.strSplitFast.body( fastOptions );

  if( o.quoting && o.onQuote )
  {
    let quotes = _.arrayAppendArraysOnce( null, [ o.quotingPrefixes, o.quotingPostfixes ] );
    for( let i = 0 ; i < o.splits.length ; i++ )
    {
      let index = _.longLeftIndex( quotes, o.splits[ i ], equalizeStrings );
      if( index !== -1 )
      o.splits[ i ] = o.onQuote( o.splits[ i ], index, quotes );
    }
  }
  if( o.onDelimeter )
  {
    let delimeter = _.filter( o.delimeter, function( pattern )
    {
      if( _.regexpIs( pattern ) )
      return pattern.test( o.src ) ? pattern : null;
      return pattern;
    });
    for( let i = 0 ; i < o.splits.length ; i++ )
    {
      let index = _.longLeftIndex( delimeter, o.splits[ i ], equalizeStrings );
      if( index !== -1 )
      o.splits[ i ] = o.onDelimeter( o.splits[ i ], index, o.delimeter );
    }
  }

  if( o.quoting )
  _.strSplitsQuotedRejoin.body( o );

  if( !o.preservingDelimeters )
  _.strSplitsDropDelimeters.body( o );

  if( o.stripping )
  _.strSplitsStrip.body( o );

  if( !o.preservingEmpty )
  _.strSplitsDropEmpty.body( o );

  /* */

  return o.splits;

  /* */

  function equalizeStrings( pattern, el )
  {
    if( _.strIs( pattern ) )
    return pattern === el;
    if( pattern !== null )
    return pattern.test( el );
    return false;
  }

}

var defaults = strSplit_body.defaults = Object.create( strSplitFast_body.defaults );

defaults.preservingEmpty = 1;
defaults.preservingDelimeters = 1;
defaults.preservingQuoting = 1;
defaults.inliningQuoting = 1;

defaults.stripping = 1;
defaults.quoting = 1;
defaults.quotingPrefixes = null;
defaults.quotingPostfixes = null;

defaults.onDelimeter = null; /* aaa : cover. seems does not work. ask how it should work */ /* Dmytro : implemented and covered */
defaults.onQuote = null; /* aaa : cover. seems does not work. ask how it should work */ /* Dmytro : implemented and covered */

//

/**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strSplit( ' first second third ' );
 * // returns [ 'first', 'second', 'third' ]
 *
 * @example
 * _.strSplit( { src : 'a, b, c, d', delimeter : ', '  } );
 * // returns [ 'a', 'b', 'c', 'd' ]
 *
 * @example
 * _.strSplit( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 * // returns [ 'a', 'b', 'c', 'd' ]
 *
 * @example
 * _.strSplit( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 * // returns [ '    a', 'b', 'c', 'd   ' ]
 *
 * @example
 * _.strSplit( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 * // returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 *
 * @example
 * _.strSplit( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 * // returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @namespace Tools
 *
 */

let head =
[
  strSplitFast.head,
  strSplitsQuotedRejoin.head,
  strSplitsDropDelimeters.head,
  strSplitsStrip.head,
  strSplitsDropEmpty.head
];
let strSplit = _.routineUnite( head, strSplit_body );

_.assert( strSplit.head !== strSplitFast.head );
_.assert( _.routineIs( strSplit.head ) );
_.assert( strSplit.body === strSplit_body );
_.assert( _.objectIs( strSplit.defaults ) );

//

let strSplitNonPreserving = _.routineUnite( strSplit.head, strSplit.body );

var defaults = strSplitNonPreserving.defaults;

defaults.preservingEmpty = 0
defaults.preservingDelimeters = 0;

//

function _strSplitInlined_body( o )
{

  _.assert( arguments.length === 1, 'Expects single options map' );

  if( o.delimeter === null )
  o.delimeter = '#';

  let splitArray = _.strSplit
  ({
    src : o.src,
    delimeter : o.delimeter,
    stripping : o.stripping,
    quoting : o.quoting,
    preservingEmpty : 1,
    preservingDelimeters : 1,
  });

  if( splitArray.length <= 1 )
  {
    if( !o.preservingEmpty )
    if( splitArray[ 0 ] === '' )
    splitArray.splice( 0, 1 );
    return splitArray;
  }

  /*
  first - for tracking index to insert ordinary text
  onInlined should be called first and
  if undefined returned escaped text shoud be treated as ordinary
  so tracking index to insert ordinary text ( in case non undefined returned ) required
  */

  let first = 0;
  let result = [];
  let i = 0;
  for( ; i < splitArray.length; i += 4 )
  {

    if( splitArray.length-i >= 4 )
    {
      if( handleTriplet() )
      handleOrdinary();
    }
    else
    {
      if( splitArray.length > i+1 )
      {
        splitArray[ i ] = splitArray.slice( i, splitArray.length ).join( '' );
        splitArray.splice( i+1, splitArray.length-i-1 );
      }
      handleOrdinary();
      _.assert( i+1 === splitArray.length, 'Openning delimeter', o.delimeter, 'does not have closing' );
    }

  }

  return result;

  /* */

  function handleTriplet()
  {

    let delimeter1 = splitArray[ i+1 ];
    let escaped = splitArray[ i+2 ];
    let delimeter2 = splitArray[ i+3 ];

    if( o.onInlined )
    escaped = o.onInlined( escaped, o, [ delimeter1, delimeter2 ] );

    if( escaped === undefined )
    {
      _.assert( _.strIs( splitArray[ i+4 ] ) );
      splitArray[ i+2 ] = splitArray[ i+0 ] + splitArray[ i+1 ] + splitArray[ i+2 ];
      splitArray.splice( i, 2 );
      i -= 4;
      return false;
    }

    first = result.length;

    if( o.preservingDelimeters && delimeter1 !== undefined )
    if( o.preservingEmpty || delimeter1 )
    result.push( delimeter1 );

    if( o.preservingInlined && escaped !== undefined )
    if( o.preservingEmpty || escaped )
    result.push( escaped );

    if( o.preservingDelimeters && delimeter2 !== undefined )
    if( o.preservingEmpty || delimeter2 )
    result.push( delimeter2 );

    return true;
  }

  /* */

  function handleOrdinary()
  {
    let ordinary = splitArray[ i+0 ];

    if( o.onOrdinary )
    ordinary = o.onOrdinary( ordinary, o );

    if( o.preservingOrdinary && ordinary !== undefined )
    if( o.preservingEmpty || ordinary )
    result.splice( first, 0, ordinary );

    first = result.length;
  }

}

_strSplitInlined_body.defaults =
{

  src : null,
  delimeter : null,
  stripping : 0,
  quoting : 0,

  onOrdinary : null,
  onInlined : ( e ) => [ e ],

  preservingEmpty : 1,
  preservingDelimeters : 0,
  preservingOrdinary : 1,
  preservingInlined : 1,

}

//

let strSplitInlined = _.routineUnite( strSplitFast_head, _strSplitInlined_body );

//

/**
 * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) delimeters
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
 *
 * Returns result as array of strings.
 *
 * Function extracts words in two attempts:
 * First by splitting source string by ( o.prefix ).
 * Second by splitting each element of the result of first attempt by( o.postfix ).
 * If splitting by ( o.prefix ) gives only single element then second attempt is skipped, otherwise function
 * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onInlined ) function on first half.
 * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
 * with ( o.prefix ) prepended to the last element of result array.
 *
 * @param {string} src - Source string.
 * @param {object} o - Options map.
 * @param {string} [ o.prefix = '#' ] - delimeter that marks begining of enclosed string
 * @param {string} [ o.postfix = '#' ] - delimeter that marks ending of enclosed string
 * @param {string} [ o.onInlined = null ] - function called on each splitted part of a source string
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strSplitInlinedStereo( '#abc#' );
 * // returns [ '', 'abc', '' ]
 *
 * @example
 * _.strSplitInlinedStereo.call( { prefix : '#', postfix : '$' }, '#abc$' );
 * // returns [ 'abc' ]
 *
 * @example
 * function onInlined( strip )
 * {
 *   if( strip.length )
 *   return strip.toUpperCase();
 * }
 * _.strSplitInlinedStereo.call( { postfix : '$', onInlined }, '#abc$' );
 * // returns [ 'ABC' ]
 *
 * @method strSplitInlinedStereo
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @namespace Tools
 *
 */

function strSplitInlinedStereo( o )
{

  if( _.strIs( o ) )
  o = { src : o };

  _.assert( this === _ );
  _.assert( _.strIs( o.src ) );
  _.assert( _.objectIs( o ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( strSplitInlinedStereo, o );

  let result = [];
  let splitted = o.src.split( o.prefix );

  if( splitted.length === 1 )
  return splitted;

  /* */

  if( splitted[ 0 ] )
  result.push( splitted[ 0 ] );

  /* */

  for( let i = 1; i < splitted.length; i++ )
  {
    let halfs = _.strIsolateLeftOrNone( splitted[ i ], o.postfix );
    let strip = o.onInlined ? o.onInlined( halfs[ 0 ] ) : halfs[ 0 ];

    _.assert( halfs.length === 3 );

    if( strip !== undefined )
    {
      result.push( strip );
      if( halfs[ 2 ] )
      result.push( halfs[ 2 ] );
    }
    else
    {
      if( result.length )
      result[ result.length-1 ] += o.prefix + splitted[ i ];
      else
      result.push( o.prefix + splitted[ i ] );
    }

  }

  return result;
}

strSplitInlinedStereo.defaults =
{
  src : null,
  prefix : '#',
  postfix : '#',
  // prefix : '❮',
  // postfix : '❯',
  onInlined : null,
}

//

/**
 * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) delimeters
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
 *
 * Returns result as array of strings.
 *
 * Function extracts words in two attempts:
 * First by splitting source string by ( o.prefix ).
 * Second by splitting each element of the result of first attempt by( o.postfix ).
 * If splitting by ( o.prefix ) gives only single element then second attempt is skipped, otherwise function
 * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onInlined ) function on first half.
 * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
 * with ( o.prefix ) prepended to the last element of result array.
 *
 * @param {string} src - Source string.
 * @param {object} o - Options map.
 * @param {string} [ o.prefix = '❮' ] - A delimeter that marks begining of enclosed string.
 * @param {string} [ o.postfix = '❯' ] - A ddelimeter that marks ending of enclosed string.
 * @param {string} [ o.onInlined = ( el ) => [ el ] ] - Function called on each splitted part of a source string.
 * @param {string} [ o.onOrdinary = null ] - Function called on each ordinary part of a source string.
 * @param {string} [ o.stripping = 0 ] - If true removes leading and trailing whitespace characters.
 * @param {string} [ o.quoting = 0 ] - If true prefixes and postfixes surounded by quotes are treated as ordinary text.
 * @param {string} [ o.preservingEmpty = 1 ] - If true empty lines are saved in the result array.
 * @param {string} [ o.preservingDelimeters = 0 ] - If true leaves word delimeters in result array, otherwise removes them.
 * @param {string} [ o.preservingOrdinary = 1 ] - If true ordinary text is saved in the result array.
 * @param {string} [ o.preservingInlined = 1 ] - If true splitted text are saved in the result array.
 * @returns {object} Returns an array of strings separated by {- o.prefix -} and {- o.postfix -}.
 *
 * @example
 * _.strSplitInlinedStereo_( '❮abc❯' );
 * // returns [ '', [ 'abc' ], '' ]
 *
 * @example
 * _.strSplitInlinedStereo_({ src : '#abc$', prefix : '#', postfix : '$' });
 * // returns [ '', [ 'abc' ], '' ]
 *
 * @example
 * function onInlined( strip )
 * {
 *   if( strip.length )
 *   return strip.toUpperCase();
 * }
 * _.strSplitInlinedStereo_({ src : '<abc>', prefix : '<', postfix : '>', onInlined });
 * // returns [ '', [ 'ABC' ], '' ]
 *
 * @method strSplitInlinedStereo
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @namespace Tools
 *
 */

function strSplitInlinedStereo_( o )
{
  /*
    New delimiter.
    was : 'this #background:red#is#background:default# text and is not'.
    is  : 'this ❮background:red❯is❮background:default❯ text and is not'.
  */

  if( _.strIs( o ) )
  o = { src : o };

  _.assert( this === _ );
  _.assert( _.strIs( o.src ) );
  _.assert( _.objectIs( o ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.routineOptions( strSplitInlinedStereo_, o );

  if( o.prefix === o.postfix )
  {
    o.delimeter = o.prefix;
    delete o.prefix;
    delete o.postfix;
    return _.strSplitInlined( o );
  }

  let result = [];
  let splitted = [];
  let src = o.src.slice();
  let replacementForQuotes = '\u{20331}';
  let positionsInlined = [];

  let delimLeftPosition = getNextPos( src, o.prefix );
  let delimRightPosition = getNextPos( src, o.postfix );

  if( delimLeftPosition === -1 || delimRightPosition === -1 )
  {
    if( !o.preservingOrdinary )
    return [];
    else
    return [ o.src ];
  }

  if( !o.preservingOrdinary && !o.preservingInlined )
  return [];

  if( o.quoting )
  {
    src = src.replace( /"❮"/g, replacementForQuotes );
    splitted = src.split( o.prefix );
  }
  else
  {
    splitted = src.split( o.prefix );
  }

  if( splitted.length === 1 )
  {
    if( !o.preservingOrdinary )
    return [];
    else
    return [ o.src ];
  }

  if( splitted[ 0 ] )
  result.push( ( o.stripping ? splitted[ 0 ].trim() : splitted[ 0 ] ) );

  for( let i = 1; i < splitted.length; i++ )
  {
    let halfs = _.strIsolateLeftOrNone( splitted[ i ], o.postfix );

    if( halfs[ 1 ] === undefined )
    {
      if( result[ result.length - 1 ] !== undefined )
      {
        let tempStr = o.stripping ? halfs[ 2 ].trimEnd() : halfs[ 2 ];

        if( !_.arrayLike( result[ result.length - 1 ] ) )
        {
          result[ result.length - 1 ] = result[ result.length - 1 ] + o.prefix + tempStr;
        }
        else
        {
          result.push( o.prefix + tempStr );
        }
      }
      else
      {
        result[ 0 ] = o.prefix + ( o.stripping ? halfs[ 2 ].trim() : halfs[ 2 ] );
      }
      continue;
    }

    let strip = o.onInlined ? o.onInlined( halfs[ 0 ] ) : halfs[ 0 ];
    let ordinary = halfs[ 2 ];

    _.assert( halfs.length === 3 );

    if( strip !== undefined )
    {
      if( o.preservingDelimeters )
      {
        if( o.stripping )
        result.push( _.arrayLike( strip ) ? strip.map( ( el ) =>
        {
          return o.prefix + el.trim() + o.postfix;
        } ) : o.prefix + strip + o.postfix );
        else
        result.push( _.arrayLike( strip ) ? strip.map( ( el ) =>
        {
          return o.prefix + el + o.postfix;
        } ) : o.prefix + strip + o.postfix );
      }
      else
      {
        if( o.stripping )
        result.push( _.arrayLike( strip ) ? strip.map( ( el ) => el.trim() ) : strip.trim() );
        else
        result.push( strip );
      }

      positionsInlined.push( result.length - 1 );

      if( ordinary )
      {
        if( o.stripping )
        {
          if( splitted[ i + 1 ] && _.strIsolateLeftOrNone( splitted[ i + 1 ], o.postfix )[ 1 ] !== undefined )
          {
            result.push( ordinary.trim() );
          }
          else
          {
            splitted[ i + 1 ] !== undefined ? result.push( ordinary.trimStart() ) : result.push( ordinary.trim() )
          }
        }
        else
        {
          result.push( ordinary );
        }
      }
    }
    else
    {
      if( result.length )
      result[ result.length-1 ] += o.prefix + splitted[ i ];
      else
      result.push( o.prefix + splitted[ i ] );
    }
  }

  if( o.quoting )
  handleQuoting();

  if( o.preservingOrdinary && o.onOrdinary )
  handleOnOrdinary();

  if( !o.preservingInlined )
  removeInlined();

  if( !o.preservingOrdinary )
  removeOrdinary();

  if( o.preservingEmpty )
  handleEmptyLines();

  return result;

  /* - */

  function getNextPos( str, delim )
  {
    return str.indexOf( delim );
  }

  /* - */

  function handleQuoting()
  {
    let reg = new RegExp( replacementForQuotes, 'g' );

    result = result.map( ( el ) =>
    {
      if( !_.arrayLike( el ) )
      {
        if( el.indexOf( replacementForQuotes ) !== -1 )
        return el.replace( reg, '"❮"' )
      }
      return el;
    } )
  }

  /* - */

  function handleOnOrdinary()
  {
    result = result.map( ( el ) =>
    {
      if( !_.arrayLike( el ) )
      {
        let res = o.onOrdinary( el );
        if( res !== undefined )
        return res;
        else
        return el;
      }
      else
      {
        return el;
      }
    } )
  }

  /* - */

  function handleEmptyLines()
  {
    if( _.arrayLike( result[ 0 ] ) )
    result.unshift( '' );
    if( _.arrayLike( result[ result.length-1 ] ) )
    result.push( '' );
    let len = result.length;
    for( let i = 0; i < len; i++ )
    {
      if( _.arrayLike( result[ i ] ) )
      if( _.arrayLike( result[ i + 1 ] ) )
      {
        result.splice( i + 1, 0, '' );
        len++;
      }
    }
  }

  /* - */

  function removeInlined()
  {
    result = result.filter( ( el, i ) => positionsInlined.indexOf( i ) === -1 && el !== '' );
  }

  /* - */

  function removeOrdinary()
  {
    result = result.filter( ( el, i ) => positionsInlined.indexOf( i ) !== -1 );
  }

}

strSplitInlinedStereo_.defaults =
{
  src : null,
  prefix : '❮',
  postfix : '❯',
  onInlined : ( e ) => [ e ],
  onOrdinary : null,

  stripping : 0,
  quoting : 0,

  preservingEmpty : 1,
  preservingDelimeters : 0,
  preservingOrdinary : 1,
  preservingInlined : 1,

  /* qqq for Yevhen : ? */

}

// function strSplitWithDefaultDelimeter( o )
// {
//   // ❮❯
//   // <  >>>
//   // << >>
//   // <aa<bb>>
//   // <a>ff<b<a<c><
//   let result = [];
//   let next = 0;
//   let src = o.src.slice();

//   let delimLeftPosition = getNextPos( src, o.delimeter[ 0 ] );
//   let delimRightPosition = getNextPos( src, o.delimeter[ 1 ] );
//   debugger;
//   console.log(`l: ${delimLeftPosition}, r:${delimRightPosition}`)

//   let delimLeftCount = _.strCount( o.src, o.delimeter[ 0 ] );
//   let delimRightCount = _.strCount( o.src, o.delimeter[ 1 ] );
//   let delimCount = delimLeftCount + delimRightCount;

//   if( delimLeftPosition === -1 || delimRightPosition === -1 )
//   return [ o.src ];

//   debugger
//   for( ; src.length > 0 ; )
//   {
//     if( delimLeftPosition === -1 && delimRightPosition === -1 )
//     break;

//     if( delimLeftPosition < delimRightPosition )
//     {
//       result.push( src.slice( 0, delimLeftPosition ) )
//       // src = src.slice( delimLeftPosition + 1 );

//       // delimRightPosition = getNextPos( src, o.delimeter[ 1 ] );

//       result.push([ src.slice( delimLeftPosition + 1, delimRightPosition ) ]);
//       src = src.slice( delimRightPosition + 1 );

//     }
//     else
//     {
//       result.push( src );
//       src = '';
//     }

//     delimLeftPosition = getNextPos( src, o.delimeter[ 0 ] );
//     delimRightPosition = getNextPos( src, o.delimeter[ 1 ] );
//   }

//   return result;

//   /* - */

//   function getNextPos( str, delim )
//   {
//     return str.indexOf( delim );
//   }
// }

// strSplitWithDefaultDelimeter.defaults =
// {
//   src : null,
//   delimeter : [ '❮', '❯' ],
//   // preservingEmpty : 1,
//   // preservingDelimeters : 0,
// }

//

// --
// converter
// --

function strFrom( src )
{

  if( src === null )
  return src;
  if( src === undefined )
  return src;

  if( _.primitiveIs( src ) )
  return String( src );

  if( _.bufferAnyIs( src ) )
  return _.bufferToStr( src );

  _.assert( _.strIs( src ) );
  return src;
}

// --
// extension
// --

let Extension =
{

  // decorator

  strQuote,
  strUnquote,
  strQuotePairsNormalize, /* qqq : analyze and write good jsdoc | aaa : Done. Yevhen S.*/
  strQuoteAnalyze, /* qqq : analyze and write good jsdoc | aaa : Done. Yevhen S. */

  // splitter

  _strLeftSingle,
  strLeft, /* qqq for Dmytro : implement and cover strLeft_ with proper ranges */
  _strRightSingle,
  strRight, /* qqq for Dmytro : implement and cover strRight_ with proper ranges */

  strsEquivalentAll : _.vectorizeAll( _.strEquivalent, 2 ),
  strsEquivalentAny : _.vectorizeAny( _.strEquivalent, 2 ),
  strsEquivalentNone : _.vectorizeNone( _.strEquivalent, 2 ),

  strInsideOf, /* aaa for Dmytro : implement perfect coverage */ /* Dmytro : covered */
  strInsideOf_, /* !!! use instead of strInsideOf */ /* Dmytro : covered, routine returns result in format : [ begin, mid, end ] */
  strOutsideOf,

  // replacers

  _strRemovedBegin,
  strRemoveBegin,
  _strRemovedEnd,
  strRemoveEnd,

  strReplaceBegin,
  strReplaceEnd,
  strReplace,

  // stripper

  strStrip, /* qqq for Dmytro : does not look working. fix, please */
  strStripLeft,
  strStripRight,
  _strRemoveAllSpaces,
  strRemoveAllSpaces : _.vectorize( _strRemoveAllSpaces ),
  _strStripEmptyLines,
  strStripEmptyLines : _.vectorize( _strStripEmptyLines ),

  // split

  strSplitsCoupledGroup,
  strSplitsUngroupedJoin, /* qqq : light coverage required | aaa : Done. Yevhen S. */
  strSplitsQuotedRejoin, /* qqq : light coverage required */
  strSplitsDropDelimeters, /* qqq : light coverage required */
  strSplitsStrip,
  strSplitsDropEmpty,

  strSplitFast,
  strSplit,
  strSplitNonPreserving,
  // strSplitWithDefaultDelimeter,

  strSplitInlined,
  strSplitInlinedStereo,
  strSplitInlinedStereo_,

  // converter

  strFrom,

}

//

_.mapExtend( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
