( function _fString_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// str
// --

/**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * //returns true
 * strIsIs( 'song' );
 * @example
 * // returns false
 * strIs( 5 );
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function strIs.
 * @memberof wTools
 */

function strIs( src )
{
  let result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

function strsAre( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strIs( src[ s ] ) )
    return false;
    return true;
  }

  return false;
}

//

function strDefined( src )
{
  if( !src )
  return false;
  let result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

function strsAreNotEmpty( src )
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

/**
  * Return type of src.
  * @example
      let str = _.strTypeOf( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strTypeOf
  * @memberof wTools
  */

function strTypeOf( src )
{

  _.assert( arguments.length === 1, 'expects single argument' );

  if( !_.primitiveIs( src ) )
  if( src.constructor && src.constructor.name )
  return src.constructor.name;

  let result = _.strPrimitiveTypeOf( src );

  if( result === 'Object' )
  {
    if( Object.getPrototypeOf( src ) === null )
    result = 'Map:Pure';
    else if( src.__proto__ !== Object.__proto__ )
    result = 'Object:Special';
  }

  return result;
}

//

/**
  * Return primitive type of src.
  * @example
      let str = _.strPrimitiveTypeOf( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strPrimitiveTypeOf
  * @memberof wTools
  */

function strPrimitiveTypeOf( src )
{

  let name = _ObjectToString.call( src );
  let result = /\[(\w+) (\w+)\]/.exec( name );

  if( !result )
  throw _.err( 'strTypeOf :','unknown type',name );
  return result[ 2 ];
}

//

/**
  * Return in one string value of all arguments.
  * @example
   let args = _.str( 'test2' );
  * @return {string}
  * If no arguments return empty string
  * @function str
  * @memberof wTools
  */

function str()
{
  let result = '';
  let line;

  if( !arguments.length )
  return result;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];

    if( src && src.toStr && !_ObjectHasOwnProperty.call( src, 'constructor' ) )
    line = src.toStr();
    else try
    {
      line = String( src );
    }
    catch( err )
    {
      line = _.strTypeOf( src );
    }

    result += line + ' ';
  }

  return result;
}

str.fields = str;
str.routines = str;

//

function _strFirst( src, ent )
{

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );

  ent = _.arrayAs( ent );

  let result = Object.create( null );
  result.index = src.length;
  result.entry = undefined;

  for( let k = 0, len = ent.length ; k < len ; k++ )
  {
    let entry = ent[ k ];
    if( _.strIs( entry ) )
    {
      let found = src.indexOf( entry );
      if( found >= 0 && ( found < result.index || result.entry === undefined ) )
      {
        result.index = found;
        result.entry = entry;
      }
    }
    else if( _.regexpIs( entry ) )
    {
      let found = src.match( entry );
      if( found && ( found.index < result.index || result.entry === undefined ) )
      {
        result.index = found.index;
        result.entry = found[ 0 ];
      }
    }
    else _.assert( 0, 'expects string or regexp' );
  }

  return result;
}

//

function strFirst( src, ent )
{

  _.assert( arguments.length === 2 );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _._strFirst( src[ s ], ent );
    return result;
  }
  else
  {
    return _._strFirst( src, ent );
  }

}

//

/*

(bb)(?!(?=.).*(?:bb))
aaa_bbb_|bb|b_ccc_ccc

.*(bb)
aaa_bbb_b|bb|_ccc_ccc

(b+)(?!(?=.).*(?:b+))
aaa_bbb_|bbb|_ccc_ccc

.*(b+)
aaa_bbb_bb|b|_ccc_ccc

*/

function _strLast( src, ent )
{

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );

  ent = _.arrayAs( ent );

  let result = Object.create( null );
  result.index = -1;
  result.entry = undefined;

  for( let k = 0, len = ent.length ; k < len ; k++ )
  {
    let entry = ent[ k ];
    if( _.strIs( entry ) )
    {
      let found = src.lastIndexOf( entry );
      if( found >= 0 && found > result.index )
      {
        result.index = found;
        result.entry = entry;
      }
    }
    else if( _.regexpIs( entry ) )
    {

      // entry = _.regexpsJoin([ entry, '(?!(?=.).*(?:))' ]);
      // debugger;

      let regexp1 = _.regexpsJoin([ '.*', '(', entry, ')' ]);
      let match1 = src.match( regexp1 );
      if( !match1 )
      continue;

      let regexp2 = _.regexpsJoin([ entry, '(?!(?=.).*', entry, ')' ]);
      let match2 = src.match( regexp2 );
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
          debugger;
          found = found2;
          index = index2 - found.length;
        }
        else
        {
          debugger;
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
        debugger;
        found = found1;
        index = index1 - found.length;
      }

      if( index > result.index )
      {
        result.index = index;
        result.entry = found;
      }

    }
    else _.assert( 0, 'expects string or regexp' );
  }

  return result;
}

//

function strLast( src, ent )
{

  _.assert( arguments.length === 2 );

  if( _.arrayLike( src ) )
  {
    let result = [];
    for( let s = 0 ; s < src.length ; s++ )
    result[ s ] = _._strLast( src[ s ], ent );
    return result;
  }
  else
  {
    return _._strLast( src, ent );
  }

}

//

function _strCutOff_pre( routine, args )
{
  let o;

  if( args.length > 1 )
  {
    o = { src : args[ 0 ], delimeter : args[ 1 ], number : args[ 2 ] };
  }
  else
  {
    o = args[ 0 ];
    _.assert( args.length === 1, 'expects single argument' );
  }

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );

  return o;
}

// //
//
// /**
// * @typedef {object} wTools~toStrInhalfOptions
// * @property {string} [ o.src=null ] - Source string.
// * @property {string | array} [ o.delimeter=' ' ] - Splitter of the string.
// * @property {boolean} [ o.left=1 ] - Finds occurrence from begining of the string.
// */
//
// /**
//  * Finds occurrence of delimeter( o.delimeter ) in source( o.src ) and splits string in finded position by half.
//  * If function finds  more then one occurrence, it separates string in the position of the last.
//  *
//  * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
//  * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
//  *
//  * @example
//  * //returns [ 'sample', 'string' ]
//  * _._strIsolate( { src : 'sample,string', delimeter : [ ',' ] } );
//  *
//  * @example
//  * //returns [ 'sample', 'string' ]
//  *_._strIsolate( { src : 'sample string', delimeter : ' ' } )
//  *
//  * @example
//  * //returns [ 'sample string,name', 'string' ]
//  * _._strIsolate( { src : 'sample string,name string', delimeter : [ ',', ' ' ] } )
//  *
//  * @method _strIsolate
//  * @throws { Exception } Throw an exception if no argument provided.
//  * @throws { Exception } Throw an exception if( o ) is not a Map.
//  * @throws { Exception } Throw an exception if( o.src ) is not a String.
//  * @throws { Exception } Throw an exception if( o.delimeter ) is not a Array or String.
//  * @throws { Exception } Throw an exception if( o ) is extended by uknown property.
//  * @memberof wTools
//  *
//  */
//
// function _strIsolate( o )
// {
//   let result = [];
//   let number = o.number;
//   let delimeter
//   let index = o.left ? -1 : o.src.length;
//
//   // let result = [ o.src.substring( 0,i ), o.delimeter, o.src.substring( i+o.delimeter.length,o.src.length ) ];
//
//   _.assertRoutineOptions( _strIsolate, o );
//   _.assert( arguments.length === 1, 'expects single argument' );
//   _.assert( _.strIs( o.src ), 'expects string {-o.src-}, got',_.strTypeOf( o.src ) );
//   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
//   _.assert( _.numberIs( o.number ) );
//
//   /* */
//
//   if( !( number >= 1 ) )
//   {
//     // debugger;
//     return whatLeft( o.left ^ o.none );
//   }
//
//   if( _.arrayIs( o.delimeter ) && o.delimeter.length === 1 )
//   o.delimeter = o.delimeter[ 0 ];
//
//   let closest = o.left ? entityMin : entityMax;
//
//   /* */
//
//   while( number > 0 )
//   {
//
//     index += o.left ? +1 : -1;
//
//     if( _.arrayIs( o.delimeter ) )
//     {
//
//       if( !o.delimeter.length )
//       {
//         // debugger;
//         return whatLeft( o.left ^ o.none );
//       }
//
//       let c = closest( index )
//
//       delimeter = c.element;
//       index = c.value;
//
//       if( o.number === 1 && index === o.src.length && o.left )
//       index = -1;
//
//     }
//     else
//     {
//
//       delimeter = o.delimeter;
//       index = o.left ? o.src.indexOf( delimeter,index ) : o.src.lastIndexOf( delimeter,index );
//
//       if( o.left && !( index >= 0 ) && o.number > 1 )
//       {
//         index = o.src.length;
//         break;
//       }
//
//     }
//
//     /* */
//
//     if( !o.left && number > 1 && index === 0  )
//     {
//       // debugger;
//       return whatLeft( !o.none )
//     }
//
//     if( !( index >= 0 ) && o.number === 1 )
//     {
//       // debugger;
//       return whatLeft( o.left ^ o.none )
//     }
//
//     number -= 1;
//
//   }
//
//   /* */
//
//   result.push( o.src.substring( 0,index ) );
//   result.push( delimeter );
//   result.push( o.src.substring( index + delimeter.length ) );
//
//   return result;
//
//   /* */
//
//   function whatLeft( side )
//   {
//     return ( side ) ? [ o.src, '', '' ] : [ '', '', o.src ];
//   }
//
//   /* */
//
//   function entityMin( index )
//   {
//     return _.entityMin( o.delimeter,function( a )
//     {
//       let i = o.src.indexOf( a,index );
//       if( i === -1 )
//       return o.src.length;
//       return i;
//     });
//   }
//
//   /* */
//
//   function entityMax( index )
//   {
//     return _.entityMax( o.delimeter,function( a )
//     {
//       let i = o.src.lastIndexOf( a,index );
//       return i;
//     });
//   }
//
// }
//
// _strIsolate.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   left : 1,
//   number : 1,
//   none : 1,
// }
//
// //
//
// /**
//  * Short-cut for _strIsolate function.
//  * Finds occurrence of delimeter( o.delimeter ) from begining of ( o.src ) and splits string in finded position by half.
//  *
//  * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
//  * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
//  *
//  * @example
//  * //returns [ 'sample', 'string' ]
//  * _.strIsolateBeginOrNone( { src : 'sample,string', delimeter : [ ',' ] } );
//  *
//  * @example
//  * //returns [ 'sample', 'string' ]
//  *_.strIsolateBeginOrNone( { src : 'sample string', delimeter : ' ' } )
//  *
//  * @example
//  * //returns [ 'sample string,name', 'string' ]
//  * _.strIsolateBeginOrNone( 'sample string,name string', ',' )
//  *
//  * @method strIsolateBeginOrNone
//  * @throws { Exception } Throw an exception if no argument provided.
//  * @throws { Exception } Throw an exception if( o ) is not a Map.
//  * @throws { Exception } Throw an exception if( o.src ) is not a String.
//  * @memberof wTools
//  *
//  */
//
// function _strIsolateBeginOrNone_body( o )
// {
//   o.left = 1;
//   o.none = 1;
//   let result = _strIsolate( o );
//   return result;
// }
//
// _strIsolateBeginOrNone_body.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   number : 1,
// }
//
// // let strIsolateBeginOrNone = _.routineForPreAndBody( _strCutOff_pre, _strIsolateBeginOrNone_body );
//
// //
//
// /**
//  * Short-cut for _strIsolate function.
//  * Finds occurrence of delimeter( o.delimeter ) from end of ( o.src ) and splits string in finded position by half.
//  *
//  * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
//  * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
//  *
//  * @example
//  * //returns [ 'sample', 'string' ]
//  * _.strIsolateEndOrNone( { src : 'sample,string', delimeter : [ ',' ] } );
//  *
//  * @example
//  * //returns [ 'sample', 'string' ]
//  *_.strIsolateEndOrNone( { src : 'sample string', delimeter : ' ' } )
//  *
//  * @example
//  * //returns [ 'sample, ', 'string' ]
//  * _.strIsolateEndOrNone( { src : 'sample,  string', delimeter : [ ',', ' ' ] } )
//  *
//  * @method strIsolateEndOrNone
//  * @throws { Exception } Throw an exception if no argument provided.
//  * @throws { Exception } Throw an exception if( o ) is not a Map.
//  * @throws { Exception } Throw an exception if( o.src ) is not a String.
//  * @memberof wTools
//  *
//  */
//
// function _strIsolateEndOrNone_body( o )
// {
//   o.left = 0;
//   o.none = 1;
//   let result = _strIsolate( o );
//   return result;
// }
//
// _strIsolateEndOrNone_body.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   number : 1,
// }
//
// // let strIsolateEndOrNone = _.routineForPreAndBody( _strCutOff_pre, _strIsolateEndOrNone_body );
//
// //
//
// function _strIsolateEndOrAll_body( o )
// {
//   o.left = 0;
//   o.none = 0;
//   let result = _strIsolate( o );
//   return result;
//
//   // let i = o.src.lastIndexOf( o.delimeter );
//   //
//   // if( i === -1 )
//   // return [ '', '', o.src ];
//   //
//   // let result = [ o.src.substring( 0,i ), o.delimeter, o.src.substring( i+o.delimeter.length,o.src.length ) ];
//   //
//   // return result;
// }
//
// _strIsolateEndOrAll_body.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   number : 1,
// }
//
// // let strIsolateEndOrAll = _.routineForPreAndBody( _strCutOff_pre, _strIsolateEndOrAll_body );
//
// //
//
// function _strIsolateBeginOrAll_body( o )
// {
//   o.left = 1;
//   o.none = 0;
//   let result = _strIsolate( o );
//   return result;
//
//   // let i = o.src.indexOf( o.delimeter );
//   //
//   // if( i === -1 )
//   // return [ o.src, '', '' ];
//   //
//   // let result = [ o.src.substring( 0,i ), o.delimeter, o.src.substring( i+o.delimeter.length,o.src.length ) ];
//   //
//   // return result;
// }
//
// _strIsolateBeginOrAll_body.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   number : 1,
// }
//
// // let strIsolateBeginOrAll = _.routineForPreAndBody( _strCutOff_pre, _strIsolateBeginOrAll_body );
//
// //
//
// /**
//   * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
//   * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
//   * Otherwise returns undefined.
//   *
//   * @param { String } src - The source string.
//   * @param { String } begin - String to find from begin of source.
//   * @param { String } end - String to find from end source.
//   *
//   * @example
//   * _.strIsolateInsideOrNone( 'abcd', 'a', 'd' );
//   * //returns 'bc'
//   *
//   * @example
//   * _.strIsolateInsideOrNone( 'aabcc', 'a', 'c' );
//   * //returns 'aabcc'
//   *
//   * @example
//   * _.strIsolateInsideOrNone( 'aabcc', 'a', 'a' );
//   * //returns 'a'
//   *
//   * @example
//   * _.strIsolateInsideOrNone( 'abc', 'a', 'a' );
//   * //returns undefined
//   *
//   * @example
//   * _.strIsolateInsideOrNone( 'abcd', 'x', 'y' )
//   * //returns undefined
//   *
//   * @example
//   * //index of begin is bigger then index of end
//   * _.strIsolateInsideOrNone( 'abcd', 'c', 'a' )
//   * //returns undefined
//   *
//   * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
//   * @throws { Exception } If all arguments are not strings;
//   * @throws { Exception } If ( argumets.length ) is not equal 3.
//   * @function strIsolateInsideOrNone
//   * @memberof wTools
//   */
//
// function _strIsolateInsideOrNone( src, begin, end )
// {
//
//   _.assert( _.strIs( src ), 'expects string {-src-}' );
//   _.assert( arguments.length === 3, 'Expects exactly three argument' );
//
//   let b = _.strFirst( src, begin );
//
//   if( b.entry === undefined )
//   return;
//
//   let e = _.strLast( src, end );
//
//   if( e.entry === undefined )
//   return;
//
//   if( e.index < b.index + b.entry.length )
//   return;
//
//   let result = [ src.substring( 0, b.index ), b.entry, src.substring( b.index + b.entry.length, e.index ), e.entry, src.substring( e.index+e.entry.length, src.length ) ];
//
//   return result;
// }
//
// //
//
// function strIsolateInsideOrNone( src, begin, end )
// {
//
//   _.assert( arguments.length === 3, 'Expects exactly three argument' );
//
//   if( _.arrayLike( src ) )
//   {
//     let result = [];
//     for( let s = 0 ; s < src.length ; s++ )
//     result[ s ] = _._strIsolateInsideOrNone( src[ s ], begin, end );
//     return result;
//   }
//   else
//   {
//     return _._strIsolateInsideOrNone( src, begin, end );
//   }
//
// }
//
// //
//
// function _strIsolateInsideOrAll( src, begin, end )
// {
//
//   _.assert( _.strIs( src ), 'expects string {-src-}' );
//   _.assert( arguments.length === 3, 'Expects exactly three argument' );
//
//   let b = _.strFirst( src, begin );
//
//   if( b.entry === undefined )
//   b = { entry : '', index : 0 }
//
//   let e = _.strLast( src, end );
//
//   if( e.entry === undefined )
//   e = { entry : '', index : src.length }
//
//   if( e.index < b.index + b.entry.length )
//   {
//     e.index = src.length;
//     e.entry = '';
//   }
//
//   let result = [ src.substring( 0, b.index ), b.entry, src.substring( b.index + b.entry.length, e.index ), e.entry, src.substring( e.index+e.entry.length, src.length ) ];
//
//   return result;
// }
//
// //
//
// function strIsolateInsideOrAll( src, begin, end )
// {
//
//   _.assert( arguments.length === 3, 'Expects exactly three argument' );
//
//   if( _.arrayLike( src ) )
//   {
//     let result = [];
//     for( let s = 0 ; s < src.length ; s++ )
//     result[ s ] = _._strIsolateInsideOrAll( src[ s ], begin, end );
//     return result;
//   }
//   else
//   {
//     return _._strIsolateInsideOrAll( src, begin, end );
//   }
//
// }

//

function _strBeginOf( src,begin )
{

  _.assert( _.strIs( src ), 'expects string' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( begin ) )
  {
    if( src.lastIndexOf( begin,0 ) === 0 )
    return begin;
  }
  else if( _.regexpIs( begin ) )
  {
    let matched = begin.exec( src );
    if( matched && matched.index === 0 )
    return matched[ 0 ];
  }
  else _.assert( 0,'expects string or regexp' );

  return false;
}

//

function _strEndOf( src, end )
{

  _.assert( _.strIs( src ), 'expects string' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( end ) )
  {
    if( src.indexOf( end, src.length - end.length ) !== -1 )
    return end;
  }
  else if( _.regexpIs( end ) )
  {
    // let matched = end.exec( src );
    let newEnd = RegExp( end.toString().slice(1,-1) + '$' );
    let matched = newEnd.exec( src );
    debugger;
    //if( matched && matched.index === 0 )
    if( matched && matched.index + matched[ 0 ].length === src.length )
    return matched[ 0 ];
  }
  else _.assert( 0, 'expects string or regexp' );

  return false;
}

//

/**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } begin - String to find at begin of source.
  *
  * @example
  * let scr = _.strBegins( "abc","a" );
  * // returns true
  *
  * @example
  * let scr = _.strBegins( "abc","b" );
  * // returns false
  *
  * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
  * @function strBegins
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */

function strBegins( src, begin )
{

  _.assert( _.strIs( src ),'expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ),'expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    return result === false ? result : true;
  }

  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== false )
    return true;
  }

  return false;
}

//

/**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } end - String to find at end of source.
  *
  * @example
  * let scr = _.strEnds( "abc","c" );
  * // returns true
  *
  * @example
  * let scr = _.strEnds( "abc","b" );
  * // returns false
  *
  * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
  * @function strEnds
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */

function strEnds( src, end )
{

  _.assert( _.strIs( src ),'expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ),'expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result === false ? result : true;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== false )
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
  * //returns 'ab'
  *
  * @example
  * _.strBeginOf( 'abc', 'x' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without tail( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strBeginOf
  * @memberof wTools
  */

function strBeginOf( src, begin )
{

  _.assert( _.strIs( src ),'expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ),'expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );


  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    if( result )
    debugger;
    return result;
  }

  debugger;
  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== false )
    return result;
  }

  return false;
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
  * //returns 'bc'
  *
  * @example
  * _.strEndOf( 'abc', 'c' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without head( begin ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strEndOf
  * @memberof wTools
  */

function strEndOf( src, end )
{

  _.assert( _.strIs( src ),'expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ),'expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  debugger;

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== false )
    return result;
  }

  return false;
}

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
  * //returns 'bc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strInsideOf( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strInsideOf( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strInsideOf( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strInsideOf
  * @memberof wTools
  */

function strInsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three argument' );

  let beginOf, endOf;

  beginOf = _.strBeginOf( src, begin );
  if( beginOf === false )
  return false;

  debugger;

  endOf = _.strEndOf( src, end );
  if( endOf === false )
  return false;

  debugger;

  let result = src.substring( beginOf.length, src.length - endOf.length );

  return result;
}

//

function strOutsideOf( src, begin, end )
{

  _.assert( _.strIs( src ), 'expects string {-src-}' );
  _.assert( arguments.length === 3, 'Expects exactly three argument' );

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

  strIs : strIs,
  strsAre : strsAre,
  strDefined : strDefined,
  strsAreNotEmpty : strsAreNotEmpty,

  strTypeOf : strTypeOf,
  strPrimitiveTypeOf : strPrimitiveTypeOf,

  str : str,
  toStr : str,
  toStrShort : str,
  strFrom : str,

  _strFirst : _strFirst,
  strFirst : strFirst,
  _strLast : _strLast,
  strLast : strLast,

  // _strIsolate : _strIsolate,
  //
  // strIsolateBeginOrNone : _.Later( _, routineForPreAndBody, [ _strCutOff_pre, _strIsolateBeginOrNone_body ] ),
  // strIsolateEndOrNone : _.Later( _, routineForPreAndBody, [ _strCutOff_pre, _strIsolateEndOrNone_body ] ),
  // strIsolateEndOrAll : _.Later( _, routineForPreAndBody, [ _strCutOff_pre, _strIsolateEndOrAll_body ] ),
  // strIsolateBeginOrAll : _.Later( _, routineForPreAndBody, [ _strCutOff_pre, _strIsolateBeginOrAll_body ] ),
  //
  // _strIsolateInsideOrNone : _strIsolateInsideOrNone,
  // strIsolateInsideOrNone : strIsolateInsideOrNone,
  // _strIsolateInsideOrAll : _strIsolateInsideOrAll,
  // strIsolateInsideOrAll : strIsolateInsideOrAll,

  _strBeginOf : _strBeginOf,
  _strEndOf : _strEndOf,

  strBegins : strBegins,
  strEnds : strEnds,

  strBeginOf : strBeginOf,
  strEndOf : strEndOf,

  strInsideOf : strInsideOf,
  strOutsideOf : strOutsideOf,

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
