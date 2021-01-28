( function _l3_Str_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// str
// --

/**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * _.strIsIs( 'song' );
 * // returns true
 *
 * @example
 * _.strIs( 5 );
 * // returns false
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function strIs.
 * @namespace Tools
 */

function strIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object String]';
  return result;
}

//

function strsAreAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strIs( src[ s ] ) )
    return false;
    return true;
  }

  return _.strIs( src );
}

//

function strLike( src )
{
  if( _.strIs( src ) )
  return true;
  if( _.regexpIs( src ) )
  return true;
  return false
}

//

function strsLikeAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strLike( src[ s ] ) )
    return false;
    return true;
  }

  return strLike( src );
}

//

function strDefined( src )
{
  if( !src )
  return false;
  let result = Object.prototype.toString.call( src ) === '[object String]';
  return result;
}

//

function strsDefined( src )
{
  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strDefined( src[ s ] ) )
    return false;
    return true;
  }
  return false;
}

//

function strHas( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), () => `Expects string, got ${_.strType( src )}` );
  _.assert( _.strLike( ins ), () => `Expects string-like, got ${_.strType( ins )}` );

  if( _.strIs( ins ) )
  return src.indexOf( ins ) !== -1;
  else
  return ins.test( src );

}

//

function strEquivalent( src1, src2 )
{
  let strIs1 = _.strIs( src1 );
  let strIs2 = _.strIs( src2 );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !strIs1 && strIs2 )
  return _.strEquivalent( src2, src1 );

  _.assert( _.strLike( src1 ), 'Expects string-like ( string or regexp )' );
  _.assert( _.strLike( src1 ), 'Expects string-like ( string or regexp )' );

  if( strIs1 && strIs2 )
  {
    return src1 === src2;
  }
  else if( strIs1 )
  {
    _.assert( !!src2.exec );
    let matched = src2.exec( src1 );
    if( !matched )
    return false;
    if( matched[ 0 ].length !== src1.length )
    return false;
    return true;
  }
  else
  {
    return _.regexpIdentical( src1, src2 );
  }

  return false;
}

//

function strsEquivalent( src1, src2 )
{

  _.assert( _.strIs( src1 ) || _.regexpIs( src1 ) || _.longIs( src1 ), 'Expects string/regexp or array of strings/regexps {-src1-}' );
  _.assert( _.strIs( src2 ) || _.regexpIs( src2 ) || _.longIs( src2 ), 'Expects string/regexp or array of strings/regexps {-src2-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let isLong1 = _.longIs( src1 );
  let isLong2 = _.longIs( src2 );

  if( isLong1 && isLong2 )
  {
    let result = [];
    _.assert( src1.length === src2.length );
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      result[ i ] = _.strEquivalent( src1[ i ], src2[ i ] );
    }
    return result;
  }
  else if( !isLong1 && isLong2 )
  {
    let result = [];
    for( let i = 0, len = src2.length ; i < len; i++ )
    {
      result[ i ] = _.strEquivalent( src1, src2[ i ] );
    }
    return result;
  }
  else if( isLong1 && !isLong2 )
  {
    let result = [];
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      result[ i ] = _.strEquivalent( src1[ i ], src2 );
    }
    return result;
  }
  else
  {
    return _.strEquivalent( src1, src2 );
  }

}

// --
// converter
// --

function toStrShort( src, opts )
{
  let result = '';
  _.assert( arguments.length === 1 || arguments.length === 2 );
  result = _.toStrSimple( src );
  return result;
}

toStrShort.fields = toStrShort;
toStrShort.routines = toStrShort;

//

/**
 * Return in one string value of all arguments.
 *
 * @example
 * let args = _.toStrSimple( 'test2' );
 *
 * @return {string}
 * If no arguments return empty string
 * @function toStrSimple
 * @namespace Tools
 */

function toStrSimple()
{
  let result = '';
  let line;

  if( !arguments.length )
  return result;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];

    if( src && src.toStr && !Object.hasOwnProperty.call( src, 'constructor' ) )
    {
      line = src.toStr();
    }
    else try
    {
      line = String( src );
    }
    catch( err )
    {
      line = _.strType( src );
    }

    result += line;
    if( a < arguments.length-1 )
    result += ' ';

  }

  return result;
}

//

/* qqq : implement test routine in module MathVector and MathMatrix */
function strEntityShort( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  try
  {
    if( _.symbolIs( src ) )
    {
      let text = src.toString().slice( 7, -1 );
      let result = `{- Symbol${text ? ' ' + text + ' ' : ' '}-}`;
      return result;
    }
    else if( _.primitiveIs( src ) )
    {
      return String( src );
    }
    else if( _.vectorAdapterIs( src ) )
    {
      result += '{- VectorAdapter with ' + src.length + ' elements' + ' -}';
    }
    else if( _.setLike( src ) || _.hashMapLike( src ) )
    {
      result += '{- ' + strType( src ) + ' with ' + _.entityLengthOf( src ) + ' elements -}';
    }
    else if( _.longLike( src ) )
    {
      result += '{- ' + _.strType( src ) + ' with ' + src.length + ' elements -}';
    }
    else if( _.objectLike( src ) )
    {
      /* xxx : call exportString() if exists */
      result += '{- ' + strType( src ) + ' with ' + _.entityLengthOf( src ) + ' elements' + ' -}';
      if( _.routineIs( src.exportString ) )
      {
        // _.assert( 0, 'not tesed' ); /* qqq : test please */
        result = src.exportString({ verbosity : 1 });
        result = _.strStrShort( result );
      }
    }
    else if( _.dateIs( src ) )
    {
      result += src.toISOString();
    }
    else
    {
      result += String( src );
      result = _.strStrShort( result );
    }

  }
  catch( err )
  {
    debugger;
    throw err;
  }

  return result;
}

//

/**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> 'stng'.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ({ src : 'string', limit : 5, prefix : '<', infix : '.', postfix : '>' }).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.prefix=null ] - The leftmost part to be added to the returned string.
 * @param {string} [ o.postfix=null ] - The rightmost part to be added to the returned string.
 * @param {string} [ o.infix=null ] - The middle part to fill the reduced characters, if boolLikeTrue - the default ( '...' ) is used.
 * @param {function} [ o.onLength=null ] - callback function that calculates a length based on .
 * @returns {string} Returns simplified source string.
 *
 * @example
 * _.strStrShort( 'string', 4 );
 * // returns 'stng'
 *
 * @example
 * _.strStrShort( 'a\nb', 3 );
 * // returns 'a\nb'
 *
 * @example
 * _.strStrShort( 'string', 0 );
 * // returns ''
 *
 * @example
 * _.strStrShort({ src : 'string', limit : 4 });g
 * // returns 'stng'
 *
 * @example
 *  _.strStrShort({ src : 'simple', limit : 4, prefix : '<' });
 * // returns '<ile'
 *
 * @example
 *  _.strStrShort({ src : 'string', limit : 5, infix : '.' });
 * // returns 'st.ng'
 *
 * @example
 *  _.strStrShort({ src : 'string', limit : 5, prefix : '<', postfix : '>', infix : '.' });
 * // returns '<s.g>'
 *
 * @example
 *  _.strStrShort({ src : 'string', limit : 3, cutting : 'right' });
 * // returns 'str'
 *
 * @method strStrShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.prefix ) is not a String or null.
 * @throws { Exception } If( o.infix ) is not a String or null or boolLikeTrue.
 * @throws { Exception } If( o.postfix ) is not a String or null.
 *
 * @namespace Tools
 *
 */

function strStrShort( o )
{

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], limit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.routineOptions( strStrShort, o );

  _.assert( _.strIs( o.src ) );
  _.assert( _.numberIs( o.limit ) );
  _.assert( o.limit >= 0, 'Option::o.limit must be greater or equal to zero' );
  _.assert( o.prefix === null || _.strIs( o.prefix ) );
  _.assert( o.postfix === null || _.strIs( o.postfix ) );
  _.assert( o.infix === null || _.strIs( o.infix ) || _.boolLikeTrue( o.infix ));
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( !o.infix )
  o.infix = '';
  if( !o.prefix )
  o.prefix = '';
  if( !o.postfix )
  o.postfix = '';
  if( o.src.length < 1 )
  {
    if( o.prefix.length + o.postfix.length <= o.limit )
    return o.prefix + o.postfix
    o.src = o.prefix + o.postfix;
    o.prefix = '';
    o.postfix = '';
  }
  if( _.boolLikeTrue( o.infix ) )
  o.infix = '...';

  if( !o.onLength )
  o.onLength = ( src ) => src.length;

  if( o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix ) === o.limit )
  return o.prefix + o.infix + o.postfix;

  if( o.prefix.length + o.postfix.length + o.infix.length > o.limit )
  {
    o.src = o.prefix + o.infix + o.postfix;
    o.prefix = '';
    o.postfix = '';
    o.infix = '';
  }

  let src = o.src;
  let fixLength = 0;
  fixLength += o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix );

  if( o.cutting === 'left' )
  {
    while( o.onLength( src ) + fixLength > o.limit )
    {
      src = src.slice( 1 );
    }
    return o.prefix + o.infix + src + o.postfix;
  }
  else if( o.cutting === 'right' )
  {
    while( o.onLength( src ) + fixLength > o.limit )
    {
      src = src.slice( 0, src.length - 1 );
    }
    return o.prefix + src + o.infix + o.postfix;
  }
  else
  {
    if( o.onLength( src ) + fixLength <= o.limit )
    return o.prefix + src + o.postfix;
    let begin = '';
    let end = '';
    while( o.onLength( src ) + fixLength > o.limit )
    {
      begin = src.slice( 0, Math.floor( src.length / 2 ) );
      end = src.slice( Math.floor( src.length / 2 ) + 1 );
      src = begin + end;
    }
    return o.prefix + begin + o.infix + end + o.postfix;
  }

}

strStrShort.defaults =
{
  src : null,
  limit : 40,
  prefix : null,
  postfix : null,
  infix : null,
  onLength : null, /* xxx : investigate */
  cutting : 'center',
}

//

function strPrimitive( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( src === null || src === undefined )
  return;

  if( _.primitiveIs( src ) )
  return String( src );

  return;
}

//

/**
 * Return primitive type of src.
 *
 * @example
 * let str = _.strPrimitiveType( 'testing' );
 *
 * @param {*} src
 *
 * @return {string}
 * string name of type src
 * @function strPrimitiveType
 * @namespace Tools
 */

function strPrimitiveType( src )
{

  let name = Object.prototype.toString.call( src );
  let result = /\[(\w+) (\w+)\]/.exec( name );
  _.assert( !!result, 'unknown type', name );
  return result[ 2 ];
}

//

/**
 * Return type of src.
 *
 * @example
 * let str = _.strType( 'testing' );
 *
 * @param {*} src
 *
 * @return {string}
 * string name of type src
 * @function strType
 * @namespace Tools
 */

function strType( src ) /* qqq : cover please | aaa : Done. Yevhen S. */
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.primitiveIs( src ) )
  if( src.constructor && src.constructor.name )
  return end( src.constructor.name );

  let result = _.strPrimitiveType( src );

  if( result === 'Object' )
  {
    if( Object.getPrototypeOf( src ) === null )
    result = 'Map.pure';
    else if( Object.getPrototypeOf( src ) !== Object.getPrototypeOf( Object ) )
    result = 'Map.prototyped';
  }

  return end( result );

  function end( result )
  {
    let translated = _.TranslatedType[ result ];
    if( translated )
    result = translated;
    return result;
  }

}

//

/**
 * The routine strConcat() provides the concatenation of array of elements ( or single element )
 * into a String. Returned string can be formatted by using options in options map {-o-}.
 *
 * @example
 * _.strConcat( 'str' );
 * // returns : 'str'
 *
 * @example
 * _.strConcat( 11 );
 * // returns : '11'
 *
 * @example
 * _.strConcat([ 1, 2, 'str', [ 3, 4 ] ]);
 * // returns : '1 2 str 3,4 '
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 1, 2, 'str', [ 3, 4 ] ], options );
 * // returns : '** 1 2 str 3,4 **'
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 'a\n', 'b\n', 'c' ], options );
 * // returns :
 * // `** a **
 * // ** b **
 * // ** c **
 *
 * @example
 * let onToStr = ( src ) => String( src ) + '*';
 * let options = { onToStr };
 * _.strConcat( [ 'a', 'b', 'c' ], options );
 * // returns : 'a* b* c*'
 *
 * @example
 * let onPairWithDelimeter = ( src1, src2 ) => src1 + ' ..' + src2;
 * let options = { onPairWithDelimeter };
 * _.strConcat( [ 'a\n', 'b\n', 'c' ], options );
 * // returns :
 * // `a ..
 * // b ..
 * // c`
 *
 * @param { ArrayLike|* } srcs - ArrayLike container with elements or single element to make string.
 * If {-srcs-} is not ArrayLike, routine converts to string provided instance.
 * @param { Map } o - Options map.
 * @param { String } o.lineDelimter - The line delimeter. Default value is new line symbol '\n'.
 * If an element of array has not delimeter at the end or next element has not delimeter at the begin,
 * then routine inserts one space between this elements.
 * @param { String } o.linePrefix - The prefix, which is added to each line. Default value is empty string.
 * @param { String } o.linePostfix - The postfix, which is added to each line. Default value is empty string.
 * @param { Map } o.optionsForToStr - The options for routine _.toStr that uses as default callback {-o.onToStr-}. Default value is null.
 * @param { Function } o.onToStr - The callback, which uses for conversion of each element of {-srcs-}. Accepts element {-src-} and options map {-o-}.
 * @param { Function } o.onPairWithDelimeter - The callback, which uses for concatenation of two strings.
 * The callback calls if first string {-src1-} end with line delimeter {-o.lineDelimter-} or second string {-src2-}
 * begins with line delimeter. Additionally accepts options map {-o-}.
 * @returns { String } - Returns concatenated string.
 * @function strConcat
 * @throws { Error } If arguments.length is less then one or greater than two.
 * @throws { Error } If options map {-o-} has unknown property.
 * @throws { Error } If property {-o.optionsForToStr-} is not a MapLike.
 * @throws { Error } If routine strConcat does not belong module Tools.
 * @namespace Tools
 */

/*
aaa : cover routine strConcat and extend it. ask how to
Dmytro : routine covered and documented, not extended
*/

/*
  aaa : does not work properly, remove indentation, but should not
  srcs :
[
  'b',
  `variant:: : #83
  path::local
  module::module-a
`
]


  Dmytro : fixed, all comments below
*/

/* qqq for Dmytro : bad */
function strConcat( srcs, o )
{

  o = _.routineOptions( strConcat, o || Object.create( null ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.strConcat === strConcat );

  if( o.onToStr === null )
  o.onToStr = onToStr;

  let defaultOptionsForToStr =
  {
    stringWrapper : '',
  };

  o.optionsForToStr = _.mapSupplement( o.optionsForToStr, defaultOptionsForToStr, strConcat.defaults.optionsForToStr );

  if( _.routineIs( srcs ) )
  srcs = srcs();

  if( !_.arrayLike( srcs ) )
  srcs = [ srcs ];

  let result = '';
  if( !srcs.length )
  return result;

  let concatenatePairWithLineDelimeter = o.onPairWithDelimeter ? o.onPairWithDelimeter : concatenateSimple;

  /* */

  let a = 0;

  while( !result && a < srcs.length )
  {
    result = o.onToStr( srcs[ a ], o );
    ++a;
  }

  for( ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];
    src = o.onToStr( src, o );

    result = result.replace( /[^\S\n]\s*$/, '' );

    if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
    result = concatenatePairWithLineDelimeter( result, src, o );
    else
    result = result + ' ' + src.replace( /^\s+/, '' );
  }

  // for( let a = 0 ; a < srcs.length ; a++ )
  // {
  //   let src = srcs[ a ];
  //
  //   src = o.onToStr( src, o );
  //
  //   result = result.replace( /[^\S\n]\s*$/, '' ); /* Dmytro : this regExp remove not \n symbol in the end of string, only spaces */
  //   // result = result.replace( /\s*$/m, '' );
  //
  //   if( !result )
  //   {
  //     result = src;
  //   }
  //   // else if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
  //   // {
  //   //   result = result + o.lineDelimter + src; /* Dmytro : if delimeter exists, it's not need  */
  //   // }
  //   else if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
  //   {
  //     result = result + src;
  //   }
  //   else
  //   {
  //     result = result + ' ' + src.replace( /^\s+/, '' );
  //     // result = result + ' ' + src.replace( /^\s+/m, '' ); /* Dmytro : flag 'm' - multiline, but no global, so routine replace first inclusion */
  //   }
  //
  // }

  // let nl = 1;
  // for( let a = 0 ; a < srcs.length ; a++ )
  // {
  //   let src = srcs[ a ];
  //   src = _.toStr( src, o.optionsForToStr );
  //   if( !nl )
  //   {
  //     let i = src.trim().lastIndexOf( o.lineDelimter );
  //     if( i === -1 )
  //     {
  //       if( result[ result.length-1 ] !== ' ' && src[ 0 ] !== ' ' )
  //       result += o.delimeter;
  //     }
  //     else
  //     {
  //       if( i !== 0 )
  //       result += o.lineDelimter;
  //     }
  //   }
  //   if( src.length )
  //   nl = src[ src.length-1 ] === o.lineDelimter;
  //   // if( _.errIs( src ) )
  //   // debugger;
  //   result += src;
  // }

  /* */

  if( o.linePrefix || o.linePostfix )
  {
    result = result.split( o.lineDelimter );
    result = o.linePrefix + result.join( o.linePostfix + o.lineDelimter + o.linePrefix ) + o.linePostfix;
  }

  /* */

  return result;

  /* */

  function onToStr( src, op )
  {
    return _.toStr( src, op.optionsForToStr );
  }

  /* */

  function concatenateSimple( src1, src2 )
  {
    return src1 + src2;
  }
}

strConcat.defaults =
{
  linePrefix : '',
  linePostfix : '',
  lineDelimter : '\n',
  // delimeter : ' ',
  optionsForToStr : null,
  onToStr : null, /* Dmytro : maybe it should have name onEach */
  onPairWithDelimeter : null,
}

//

function _strBeginOf( src, begin )
{

  // _.assert( _.strIs( src ), 'Expects string' );
  // _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( begin ) )
  {
    if( src.lastIndexOf( begin, 0 ) === 0 )
    return begin;
  }
  else if( _.regexpIs( begin ) )
  {
    let matched = begin.exec( src );
    if( matched && matched.index === 0 )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return undefined; /* qqq : should return undefined */
}

//

function _strEndOf( src, end )
{

  // _.assert( _.strIs( src ), 'Expects string' );
  // _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( end ) )
  {
    if( src.indexOf( end, src.length - end.length ) !== -1 )
    return end;
  }
  else if( _.regexpIs( end ) )
  {
    // let matched = end.exec( src );
    let newEnd = RegExp( end.toString().slice(1, -1) + '$' );
    let matched = newEnd.exec( src );

    //if( matched && matched.index === 0 )
    if( matched && matched.index + matched[ 0 ].length === src.length )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return undefined; /* qqq : should return undefined */
}

//

/**
 * Compares two strings.
 *
 * @param { String } src - Source string.
 * @param { String } begin - String to find at begin of source.
 *
 * @example
 * let scr = _.strBegins( "abc", "a" );
 * // returns true
 *
 * @example
 * let scr = _.strBegins( "abc", "b" );
 * // returns false
 *
 * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
 * @function strBegins
 * @throws { Exception } If one of arguments is not a String.
 * @throws { Exception } If( arguments.length ) is not equal 2.
 * @namespace Tools
 */

function strBegins( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    return !( result === undefined );
    // return result === undefined ? false : true;
  }

  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== undefined )
    return true;
  }

  return false;
}

//

/**
 * Compares two strings.
 *
 * @param { String } src - Source string.
 * @param { String } end - String to find at end of source.
 *
 * @example
 * let scr = _.strEnds( "abc", "c" );
 * // returns true
 *
 * @example
 * let scr = _.strEnds( "abc", "b" );
 * // returns false
 *
 * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
 * @function strEnds
 * @throws { Exception } If one of arguments is not a String.
 * @throws { Exception } If( arguments.length ) is not equal 2.
 * @namespace Tools
 */

function strEnds( src, end )
{

  _.assert( _.strIs( src ), () => `Expects argument::src of type::string, but got ${_.strType( src )}` );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return !( result === undefined );
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== undefined )
    return true;
  }

  return false;
}

//

/**
 * Finds occurrence of( end ) at the end of source( src ) and removes it if exists.
 * Returns begin part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
 *
 * @param { String } src - The source string.
 * @param { String } end - String to find.
 *
 * @example
 * _.strBeginOf( 'abc', 'c' );
 * // returns 'ab'
 *
 * @example
 * _.strBeginOf( 'abc', 'x' );
 * // returns undefined
 *
 * @returns { String } Returns part of source string without tail( end ) or undefined.
 * @throws { Exception } If all arguments are not strings;
 * @throws { Exception } If ( argumets.length ) is not equal 2.
 * @function strBeginOf
 * @namespace Tools
 */

function strBeginOf( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    return result;
  }

  for( let b = 0, blen = begin.length ; b < blen ; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== undefined )
    return result;
  }

  return undefined;
}

//

/**
 * Finds occurrence of( begin ) at the begining of source( src ) and removes it if exists.
 * Returns end part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
 * otherwise returns undefined.
 *
 * @param { String } src - The source string.
 * @param { String } begin - String to find.
 *
 * @example
 * _.strEndOf( 'abc', 'a' );
 * // returns 'bc'
 *
 * @example
 * _.strEndOf( 'abc', 'c' );
 * // returns undefined
 *
 * @returns { String } Returns part of source string without head( begin ) or undefined.
 * @throws { Exception } If all arguments are not strings;
 * @throws { Exception } If ( argumets.length ) is not equal 2.
 * @function strEndOf
 * @namespace Tools
 */

function strEndOf( src, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== undefined )
    return result;
  }

  return undefined;
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
  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp {-begin-}'  );

  let result = src;
  let beginOf = _._strBeginOf( result, begin );
  if( beginOf !== undefined )
  result = result.substr( beginOf.length, result.length );
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
  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp {-end-}' );

  let result = src;
  let endOf = _._strEndOf( result, end );
  if( endOf !== undefined )
  result = result.substr( 0, result.length - endOf.length );

  return result;
}

//

/**
 * Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( insStr ).
 *
 * @param { String } srcStr - Source string to parse.
 * @param { String } insStr - String/RegExp that is to be dropped.
 * @returns { String } Returns string with result of substring removement.
 *
 * @example
 * _.strRemove( 'source string', 's' );
 * // returns ource tring
 *
 * @example
 * _.strRemove( 'example', 's' );
 * // returns example
 *
 * @function strRemove
 * @throws { Exception } Throws a exception if( srcStr ) is not a String.
 * @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @namespace Tools
 *
 */

function strRemove( srcStr, insStr )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ), 'Expects string {-src-}' );
  _.assert( _.strIs( insStr ) || _.regexpIs( insStr ), 'Expects string/regexp {-begin-}' );

  let result = srcStr;
  debugger;

  result = result.replace( insStr, '' );

  return result;
}

// --
// routines
// --

let TranslatedType =
{

  'BigUint64Array' : 'U64x',
  'Uint32Array' : 'U32x',
  'Uint16Array' : 'U16x',
  'Uint8Array' : 'U8x',
  'Uint8ClampedArray' : 'U8ClampedX',

  'BigInt64Array' : 'I64x',
  'Int32Array' : 'I32x',
  'Int16Array' : 'I16x',
  'Int8Array' : 'I8x',

  'Float64Array' : 'F64x',
  'Float32Array' : 'F32x',

  'Buffer' : 'BufferNode',
  'ArrayBuffer' : 'BufferRaw',
  'SharedArrayBuffer' : 'BufferRawShared',
  'Map' : 'HashMap',
  'WeakMap' : 'HashMapWeak',

}

let Extension =
{

  // checker

  strIs,
  strsAreAll,
  strLike,
  strsLikeAll,
  strDefined,
  strsDefined,

  strHas,

  strEquivalent,
  strsEquivalent,

  // converter

  toStrShort,
  toStr : toStrShort,
  toStrSimple,
  strEntityShort,
  strStrShort,
  strPrimitive,
  strPrimitiveType,
  strType,
  strConcat,

  //

  _strBeginOf,
  _strEndOf,

  strBegins,
  strEnds,

  strBeginOf,
  strEndOf,

  strRemoveBegin,
  strRemoveEnd,
  strRemove,

  // fields

  TranslatedType,

}

//

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
