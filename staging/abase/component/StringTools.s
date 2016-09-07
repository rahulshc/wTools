(function _StringTools_s_() {

'use strict';

//

if( typeof module !== 'undefined' )
{

  wTools.includeAny( __dirname + '/Proto.s','wProto','' );

}

//

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

var _assert = _.assert;
var _arraySlice = _.arraySlice;
var strTypeOf = _.strTypeOf;

//

/**
 * Short-cut for toStr function that works only with Routine type entities.
 * Converts object passed by argument( src ) to string representation using
 * options provided by argument( o ).
 *
 * @param {object} src - Source object.
 * @param {object} o - Convertion options.
 * @param {boolean} [ options.onlyRoutines=true ] - makes object behavior Routine only.
 * @see {@link wTools.toStrFine} Check out main function for more usage options and details.
 * @returns {string} Returns string that represents object data.
 *
 * @example
 * //returns { routine add }
 * _.toStrMethods( ( function add(){} ), { } )
 *
 * @example
 * //returns { routine noname }
 * _.toStrMethods( ( function (){} ), { } )
 *
 * @method toStrMethods
 * @memberof wTools
 *
 */

var toStrMethods = function( src,o )
{
  var o = o || {};
  o.onlyRoutines = 1;
  var result = toStrFine( src,o );
  return result;
}

//

var toStrFields = function( src,o )
{
  var o = o || {};
  o.noRoutine = 1;
  var result = toStrFine( src,o );
  return result;
}

//

/**
 * Converts object passed by argument( src ) to string format using parameters passed
 * by argument( o ).If object ( src ) has own ( toStr ) method defined function uses it for convertion.
 *
 * @param {object} src - Source object for representing it as string.
 * @param {object} o - Convertion o.
 * @param {boolean} [ o.wrap=true ] - Wrap array-like and object-like entities
 * into "[ .. ]" / "{ .. }" respecitvely.
 * @param {boolean} [ o.wrapString=true ] - Wrap string into "".
 * @param {boolean} [ o.usingMultilineStringWrapper=false ] - WrapString uses backtick ( `` ) to wrap string.
 * @param {number} [ o.level=0 ] - Sets the min depth of looking into source object. Function starts from zero level by default.
 * @param {number} [ o.levels=1 ] - Restricts max depth of looking into source object. Looks only in one level by default.
 * @param {boolean} [ o.prependTab=true ] - Prepend tab before each line.
 * @param {boolean} [ o.errorAsMap=false ] - Interprets Error as Map if true.
 * @param {boolean} [ o.own=true ] - Use only own properties of ( src ), ignore properties of ( src ) prototype.
 * @param {string} [ o.tab='' ] - Prepended before each line tab.
 * @param {string} [ o.dtab='  ' ] - String attached to ( o.tab ) each time the function parses next level of object depth.
 * @param {string} [ o.colon=' : ' ] - Colon between name and value, example : { a : 1 }.
 * @param {boolean} [ o.noRoutine=false ] - Ignores all entities of type Routine.
 * @param {boolean} [ o.noAtomic=false ] - Ignores all entities of type Atomic.
 * @param {boolean} [ o.noArray=false ] - Ignores all entities of type Array.
 * @param {boolean} [ o.noObject=false ] - Ignores all entities of type Object.
 * @param {boolean} [ o.noRow=false ] - Ignores all entities of type Row.
 * @param {boolean} [ o.noError=false ] - Ignores all entities of type Error.
 * @param {boolean} [ o.noNumber=false ] - Ignores all entities of type Number.
 * @param {boolean} [ o.noString=false ] - Ignores all entities of type String.
 * @param {boolean} [ o.noDate=false ] - Ignores all entities of type Date.
 * @param {boolean} [ o.onlyRoutines=false ] - Ignores all entities, but Routine.
 * @param {boolean} [ o.onlyEnumerable=true ] - Ignores all non-enumerable properties of object ( src ).
 * @param {boolean} [ o.noSubObject=false ] - Ignores all child entities of type Object.
 * @param {number} [ o.precision=null ] - An integer specifying the number of significant digits,example : [ '1500' ].
 * Number must be between 1 and 21.
 * @param {number} [ o.fixed=null ] - The number of digits to appear after the decimal point, example : [ '58912.001' ].
 * Number must be between 0 and 20.
 * @param {string} [ o.comma=', ' ] - Splitter between elements, example : [ 1, 2, 3 ].
 * @param {boolean} [ o.multiline=false ] - Writes each object property in new line.
 * @param {boolean} [ o.escaping=true ] - enable escaping of special characters.
 * @param {boolean} [ o.json=false ] - enable convertion of object( src ) to JSON string.
 * @returns {string} Returns string that represents object data.
 *
 * @example
 * //Each time function parses next level of object depth
 * //the ( o.dtab ) string ( '-' ) is attached to ( o.tab ).
 * //returns
 * // { // level 1
 * // -a : 1,
 * // -b : 2,
 * // -c :
 * // -{ // level 2
 * // --subd : "some test",
 * // --sube : true,
 * // --subf : {  x : 1  // level 3}
 * // -}
 * // }
 * _.toStr( { a : 1, b : 2, c : { subd : 'some test', sube : true, subf : { x : 1 } } },{ levels : 3, dtab : '-'} ));
 *
 * @example
 * //returns " \n1500 "
 * _.toStr( ' \n1500 ', { escaping : 1 } );
 *
 * @example
 * //returns
 * // "
 * // 1500 "
 * _.toStr( ' \n1500 ' );
 *
 * @example
 * //returns 14.5333
 * _.toStr( 14.5333 );
 *
 * @example
 * //returns 1.50e+3
 * _.toStr( 1500, { precision : 3 } );
 *
 * @example
 * //returns 14.53
 * _.toStr( 14.5333, { fixed : 2 } );
 *
 * @example
 * //returns true
 * _.toStr( 1 !== 2 );
 *
 * @example
 * //returns ''
 * _.toStr( 1 !== 2, { noAtomic :  1 } );
 *
 * @example
 * //returns [ 1, 2, 3, 4 ]
 * _.toStr( [ 1, 2, 3, 4 ] );
 *
 * @example
 * //returns [Array with 3 elements]
 * _.toStr( [ 'a','b','c' ], { levels : 0 } );
 *
 * @example
 * //returns [ 1, 2, 3 ]
 * _.toStr( _.toStr( [ 'a','b','c', 1, 2, 3 ], { levels : 2, noString : 1} ) );
 *
 * @example
 * //returns
 * // [
 * //  { Object with 1 elements },
 * //  { Object with 1 elements }
 * // ]
 * _.toStr( [ { a : 1 }, { b : 2 } ] );
 *
 * @example
 * //returns
 * // a : 1
 * // b : 2
 * _.toStr( [ { a : 1 }, { b : 2 } ], { levels : 2, wrap : 0 } );
 *
 * @example
 * //returns
 * // [
 * //  { a : 1 },
 * //  { b : 2 }
 * // ]
 * _.toStr( [ { a : 1 }, { b : 2 } ], { levels : 2 } );
 *
 * @example
 * //returns 1 , 2 , 3 , 4
 * _.toStr( [ 1,2,3,4 ], { wrap : 0, comma : ' , ' } );
 *
 * @example
 * //returns [ 0.11, 40 ]
 * _.toStr( [ 0.11112, 40.4 ], { precision : 2 } );
 *
 * @example
 * //returns [ 2.00, 1.56 ]
 * _.toStr( [ 1.9999, 1.5555 ], { fixed : 2 } );
 *
 * @example
 * //returns
 * // [
 * //  0,
 * //  [
 * //   1,
 * //   2,
 * //   3
 * //  ],
 * //  4
 * // ]
 * _.toStr( [ 0, [ 1,2,3 ], 4 ], { levels : 2, multiline : 1 } );
 *
 * @example
 * //returns { routine sample }
 * _.toStr( function sample( ){ });
 *
 * @example
 * //returns [object Function]
 * _.toStr( function add( ){ }, { levels : 0 } );
 *
 * @example
 * //If object ( src ) has own ( toStr ) method defined function uses it for convertion
 * //returns
 * //function func(  ) {
 * //console.log('sample');
 * //}
 * var x = function func (  )
 * {
 *   console.log( 'sample' );
 * }
 * x.toStr = x.toString;
 * _.toStr( x );
 *
 * @example
 * //returns { o : 1, y : 3 }
 * _.toStr( { o : 1, y : 3 } );
 *
 * @example
 * //returns { Object with 1 elements }
 * _.toStr( { o : 1 }, { levels : 0 } );
 *
 * @example
 * //returns
 * {
 *    o : { p : "value" }
 * }
 * _.toStr( { o : { p : 'value' } }, { levels : 2 } );
 *
 * @example
 * //returns
 * // {
 * //   y : "value1"
 * // }
 * _.toStr( { y : 'value1', o : { p : 'value2' } }, { levels : 2, noSubObject : 1} );
 *
 * @example
 * //returns a : 1 | b : 2
 * _.toStr( { a : 1, b : 2 }, { wrap : 0, comma : ' | ' } );
 *
 * @example
 * //returns { b : 1, c : 2 }
 * _.toStr( { a : 'string', b : 1 , c : 2  }, { levels : 2 , noString : 1 } );
 *
 * @example
 * //returns { a : string, b : str, c : 2 }
 * _.toStr( { a : 'string', b : "str" , c : 2  }, { levels : 2 , wrapString : 0 } );
 *
 * @example
 * //returns { "a" : "string", "b" : 1, "c" : 2 }
 * _.toStr( { a : 'string', b : 1 , c : 2  }, { levels : 2 , json : 1 } );
 *
 * @method toStr
 * @throws { Exception } Throw an exception if( o ) is not a Object.
 * @throws { Exception } Throw an exception if( o.wrapString ) is not equal true when ( o.json ) is true.
 * @throws { RangeError } Throw an exception if( o.precision ) is not between 1 and 21.
 * @throws { RangeError } Throw an exception if( o.fixed ) is not between 0 and 20.
 * @memberof wTools
 *
 */

var toStrFine_gen = function()
{

  var primeFilter =
  {

    noRoutine : 0,
    noAtomic : 0,
    noArray : 0,
    noObject : 0,
    noRow : 0,
    noError : 0,
    noNumber : 0,
    noString : 0,
    noDate : 0,

  }

  var composes =
  {

    levels : 1,
    level : 0,

    wrap : 1,
    wrapString : 1,
    prependTab : 1,
    errorAsMap : 0,
    own : 1,
    tab : '',
    dtab : '  ',
    colon : ' : ',
    usingMultilineStringWrapper : 0,

  }

  /**/

  var optional =
  {

    /* secondary filter */

    onlyRoutines : 0,
    noSubObject : 0,
    onlyEnumerable : 1,

    /**/

    precision : null,
    fixed : null,
    comma : ', ',
    multiline : 0,
    escaping : 0,
    json : 0,

  }

  var restricts =
  {
    /*level : 0,*/
  }

  Object.preventExtensions( primeFilter );
  Object.preventExtensions( composes );
  Object.preventExtensions( optional );
  Object.preventExtensions( restricts );

  var def;
  if( _.protoUnitedInterface )
  def = _.protoUnitedInterface([ primeFilter,composes,optional ]);
  else
  def = _.mapExtend( {},primeFilter,composes,optional );

  var routine = function toStrFine( src,o )
  {

    _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

    var o = o || {};
    var toStrDefaults = {};

    if( !_.atomicIs( src ) && _.routineIs( src.toStr ) && !src.toStr.notMethod && _.objectIs( src.toStr.defaults ) )
    toStrDefaults = src.toStr.defaults;

    if( o.levels === undefined && o.json )
    o.levels = 256;

    _.assertMapOnly( o,composes,primeFilter,optional );
    o = _.mapSupplement( {},o,toStrDefaults,composes,restricts );

    if( o.onlyRoutines )
    {
      for( var f in primeFilter )
      o[ f ] = 1;
      o.noRoutine = 0;
    }

    if( o.comma === undefined )
    o.comma = o.wrap ? optional.comma : ' ';
    //o.comma = optional.comma;

    if( o.comma && !_.strIs( o.comma ) )
    o.comma = optional.comma;

    var r = _toStr( src,o );

    return r ? r.text : '';
  }

  routine.defaults = def;
  routine.methods = toStrMethods;
  routine.fields = toStrFields;

  routine.notMethod = 1;

  return routine;
}

//

var _toStr = function _toStr( src,o )
{
  var result = '';
  var simple = 1;

  if( o.level >= o.levels )
  {
    return { text : _toStrShort( src,o ), simple : 1 };
  }

  if( !_toStrIsVisibleElement( src,o ) )
  return;

  var isAtomic = _.atomicIs( src );
  var isArray = _.arrayLike( src );
  var isObject = !isArray && _.objectLike( src );

  /* */

  if( !isAtomic && _.routineIs( src.toStr ) && !src.toStr.notMethod )
  {

    // if( isObject && o.noObject )
    // return;
    // if( isArray && o.noArray )
    // return;

    var r = src.toStr( o );
    if( _.objectIs( r ) )
    {
      _assert( r.simple !== undefined && r.text !== undefined );
      simple = r.simple;
      result += r.text;
    }
    else if( _.strIs( r ) )
    {
      simple = r.indexOf( '\n' ) === -1;
      result += r;
    }
    else throw _.err( 'unexpected' );

  }
  else if( _.rowIs( src ) )
  {
    // if( o.noRow )
    // return;
    result += _.row.toStr( src,o );
  }
  else if( _.errorIs( src ) && !o.errorAsMap )
  {
    // if( o.noError )
    // return;
    result += src.toString();
    /*result += src.message;*/
  }
  else if( _.errorIs( src ) && o.errorAsMap )
  {
    // if( o.noError )
    // return;
    if( o.onlyEnumerable === undefined )
    o.onlyEnumerable = 0;
    var r = _toStrFromObject( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( _.routineIs( src ) )
  {
    if( o.noRoutine )
    return;
    result += _toStrFromRoutine( src,o );
  }
  else if( _.numberIs( src ) )
  {
    if( o.noNumber || o.noAtomic )
    return;
    result += _toStrFromNumber( src,o );
  }
  else if( _.strIs( src ) )
  {
    if( o.noString || o.noAtomic  )
    return;
    result += _toStrFromStr( src,o );
  }
  else if( src instanceof Date )
  {
    if( o.noDate )
    return;
    result += src.toISOString();
  }
  else if( isArray )
  {
    if( o.noArray )
    return;
    var r = _toStrFromArray( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( isObject )
  {
    // xxx
    if( o.json === 1 )
    {
      _.assert( o.wrapString,'expects ( o.wrapString ) true if ( o.json ) is true' );
      _.assert( !o.usingMultilineStringWrapper,'expects ( o.usingMultilineStringWrapper ) false if ( o.json ) is true to make valid JSON' );
      if( o.escaping === undefined )
      o.escaping = 1;
    }
    // if( o.noObject )
    // return;
    var r = _toStrFromObject( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( !isAtomic && _.routineIs( src.toString ) )
  {
    result += src.toString();
  }
  else
  {
    // if( o.noAtomic )
    // return;
    result += String( src );
  }

  return { text : result, simple : simple };
}

//

var _toStrShort = function( src,o )
{
  var result = '';

  if( _.rowIs( src ) )
  {
    result += '[ Row with ' + src.length + ' elements' + ' ]';
  }
  else if( _.errorIs( src ) )
  {
    result += _ObjectToString.call( src );
  }
  else if( _.routineIs( src ) )
  {
    result += _ObjectToString.call( src );
  }
  else if( _.numberIs( src ) )
  {
    result += _toStrFromNumber( src,o );
  }
  else if( _.strIs( src ) )
  {

    var maxStringLength = 40;
    var nl = src.substr( 0,Math.min( src.length,maxStringLength ) ).indexOf( '\n' );
    if( nl === -1 ) nl = src.length;
    if( src.length > maxStringLength || nl !== src.length )
    {
      src = src.substr( 0,Math.min( maxStringLength,nl ) );
      src = _toStrFromStr( src,o );
      //if( o.wrapString )
      //result = '"' + src + '"';
      result += src + '...';
    }
    else
    {
      src = _toStrFromStr( src,o );
      //if( o.wrapString )
      //src = '"' + src + '"';
      result += src;
    }

  }
  else if( src && !_.objectIs( src ) && _.numberIs( src.length ) )
  {

    result += '[ ' + strTypeOf( src ) + ' with ' + src.length + ' elements ]';

  }
  else if( _.objectIs( src ) || _.objectLike( src ) )
  {

    result += '[ ' + strTypeOf( src ) + ' with ' + _.entityLength( src ) + ' elements' + ' ]';

  }
  else if( src instanceof Date )
  {
    result += src.toISOString();
  }
  else
  {
    result += String( src );
  }

  return result;
}

//

var _toStrIsVisibleElement = function _toStrIsVisibleElement( src,o )
{

  var isAtomic = _.atomicIs( src );
  var isArray = _.arrayLike( src );
  var isObject = !isArray && _.objectLike( src );

  /* */

  if( !isAtomic && _.routineIs( src.toStr ) && !src.toStr.notMethod )
  {
    if( isObject && o.noObject )
    return false;
    if( isArray && o.noArray )
    return false;

    return true;
  }
  else if( _.rowIs( src ) )
  {
    if( o.noRow )
    return false;
    return true;
  }
  else if( _.errorIs( src ) && !o.errorAsMap )
  {
    if( o.noError )
    return false;
    return true;
  }
  else if( _.errorIs( src ) && o.errorAsMap )
  {
    if( o.noError )
    return false;
    return true;
  }
  else if( _.routineIs( src ) )
  {
    if( o.noRoutine )
    return false;
    return true;
  }
  else if( _.numberIs( src ) )
  {
    if( o.noNumber || o.noAtomic )
    return false;
    return true;
  }
  else if( _.strIs( src ) )
  {
    if( o.noString || o.noAtomic  )
    return false;
    return true;
  }
  else if( src instanceof Date )
  {
    if( o.noDate )
    return false;
    return true;
  }
  else if( isArray )
  {
    if( o.noArray )
    return false;
    return true;
  }
  else if( isObject )
  {
    if( o.noObject )
    return false;
    return true;
  }
  else if( !isAtomic && _.routineIs( src.toString ) )
  {
    if( isObject && o.noObject )
    return false;
    if( isArray && o.noArray )
    return false;
    return true;
  }
  else
  {
    if( o.noAtomic )
    return false;
    return true;
  }

}

//

var _toStrIsSimpleElement = function( element,o )
{
  _.assert( arguments.length === 2 );

  if( _.strIs( element ) )
  {
    if( element.length > 40 )
    return false;
    if( !o.escaping )
    return element.indexOf( '\n' ) === -1;
    return true;
  }
  else if( element && !_.objectIs( element ) && _.numberIs( element.length ) )
  return !element.length;
  else if( _.objectIs( element ) || _.objectLike( element ) )
  return !_.entityLength( element );
  else
  return _.atomicIs( element );

}

//

var _toStrFromRoutine = function( src,o )
{
  var result = '';

  result = '[ routine ' + ( src.name || src._name || 'without name' ) + ' ]';

  return result;
}

//

/**
 * This function converts Number to String with o.
 *
 * @param {Number} src - Number for conversion.
 * @param {Object} o - Contains conversion o.
 * @param {Number} o.precision - Integer value that specifying  length of a number.
 * @param {Number} o.fixed - Number of digits after the decimal point.
 *
 * @returns {String} Returns number converted to the string.
 *
 * @example
 * //returns 8.9
 * _._toStrFromNumber( 8.923964453, { precision : 2 } )
 *
 * @example
 * //returns 8.9240
 * _._toStrFromNumber( 8.923964453, { fixed : 4 } )
 *
 * @method _toStrFromNumber
 * @memberof wTools
 *
*/

var _toStrFromNumber = function( src,o )
{
  var result = '';

  if( _.numberIs( o.precision ) )
  result += src.toPrecision( o.precision );
  else if( _.numberIs( o.fixed ) )
  result += src.toFixed( o.fixed );
  else
  result += String( src );

  return result;
}

//

var _toStrFromStr = function( src,o )
{
  var result = '';

  // 007f : ""
  // . . .
  // 009f : ""

  // 00ad : "­"

  // \' 	single quote 	byte 0x27 in ASCII encoding
  // \" 	double quote 	byte 0x22 in ASCII encoding
  // \\ 	backslash 	byte 0x5c in ASCII encoding
  // \b 	backspace 	byte 0x08 in ASCII encoding
  // \f 	form feed - new page 	byte 0x0c in ASCII encoding
  // \n 	line feed - new line 	byte 0x0a in ASCII encoding
  // \r 	carriage return 	byte 0x0d in ASCII encoding
  // \t 	horizontal tab 	byte 0x09 in ASCII encoding
  // \v 	vertical tab 	byte 0x0b in ASCII encoding
  // source : http://en.cppreference.com/w/cpp/language/escape

  if( o.escaping )
  {
    debugger;

    for( var s = 0 ; s < src.length ; s++ )
    {
      var c = src[ s ];
      var code = c.charCodeAt( 0 );

      if( 0x007f <= code && code <= 0x009f || code === 0x00ad )
      {
        debugger;
        result += _.strUnicodeEscape( c );
      }
      else switch( c )
      {

        case '\\' :
          debugger;
          result += '\\\\';
          break;

        case '\"' :
          result += '\\"';
          break;

        case '\'' :
          result += "\\'";
          break;

        // case '\`' :
        //   result += "\\`";
        //   break;

        case '\b' :
          result += '\\b';
          break;

        case '\f' :
          result += '\\f';
          break;

        case '\n' :
          result += '\\n';
          break;

        case '\r' :
          result += '\\r';
          break;

        case '\t' :
          result += '\\t';
          break;

        case '\v' :
          result += '\\v';
          break;

        default :

          if( code < 32 )
          {
            debugger;
            result += _.strUnicodeEscape( c );
          }
          else
          result += c;

      }
    }
  }
  else
  {
    result = src;
  }

  if( o.wrapString )
  {
    if( o.usingMultilineStringWrapper )
    result = '`' + result + '`';
    else
    result = '"' + result + '"';
  }

  return result;
}

//

var _toStrFromArray = function( src,o )
{
  var result = '';

  _assert( src && _.numberIs( src.length ) );

  if( o.level >= o.levels )
  {
    return { text : _toStrShort( src,o ), simple : 1 };
  }

  /* item options */

  var optionsItem = _.mapExtend( {},o );
  optionsItem.tab = o.tab + o.dtab;
  optionsItem.level = o.level + 1;
  optionsItem.prependTab = 0;

  /* empty case */

  if( src.length === 0 )
  {
    if( !o.wrap )
    return { text : '', simple : 1 };
    return { text : '[]', simple : 1 };
  }

  /* filter */

  var v = 0;
  var length = src.length;
  for( var i = 0 ; i < length ; i++ )
  {
    v += !!_toStrIsVisibleElement( src[ i ],optionsItem );
  }

  if( v !== length )
  {
    var i2 = 0;
    var i = 0;
    var src2 = _.arrayNew( src,v );
    while( i < length )
    {
      if( _toStrIsVisibleElement( src[ i ],optionsItem ) )
      {
        src2[ i2 ] = src[ i ];
        i2 += 1;
      }
      i += 1;
    }
    src = src2;
    length = src.length;
  }

  /* is simple */

  var length = src.length;
  var simple = !optionsItem.multiline;
  if( simple )
  for( var i = 0 ; i < length ; i++ )
  {
    simple = _toStrIsSimpleElement( src[ i ],optionsItem );;
    if( !simple )
    break;
  }

  /* */

  result += _toStrFromContainer
  ({
    values : src,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : simple,
    prefix : '[',
    postfix : ']',
  });

  return { text : result, simple : simple };
}

//

var _toStrFromObject = function( src,o )
{
  var result = '';

  _assert( _.objectLike( src ) );

  if( o.level >= o.levels )
  {
    return { text : _toStrShort( src,o ), simple : 1 };
  }

  if( o.noObject )
  return;

  /* item options */

  var optionsItem = _.mapExtend( {},o );
  optionsItem.noObject = o.noSubObject ? 1 : 0;
  optionsItem.tab = o.tab + o.dtab;
  optionsItem.level = o.level + 1;
  optionsItem.prependTab = 0;

  /* get names */

  var names;
  if( o.onlyEnumerable === 0  )
  {
    if( o.own  )
    {
      names = Object.getOwnPropertyNames( src );
    }
    else
    {
      var proto = src;
      names = [];
      do
      {
        names = _.arrayPrependOnceMerging( names,Object.getOwnPropertyNames( proto ) );
        proto = Object.getPrototypeOf( proto );
      }
      while( proto )
    }

  }
  else
  {
    names = o.own ? _.mapOwnKeys( src ) : _.mapKeys( src );
  }

  /* filter */

  for( var n = 0 ; n < names.length ; n++ )
  {
    if( !_toStrIsVisibleElement( src[ names[ n ] ],optionsItem ) )
    {
      names.splice( n,1 );
      n -= 1;
    }
  }

  /* empty case */

  var length = names.length;
  if( length === 0 )
  {
    if( !o.wrap )
    return { text : '', simple : 1 };
    return { text : '{}', simple : 1 };
  }

  /* is simple */

  var simple = !optionsItem.multiline;
  if( simple )
  simple = length < 4;
  if( simple )
  for( var k in src )
  {
    simple = _toStrIsSimpleElement( src[ k ],optionsItem );
    if( !simple )
    break;
  }

  /* */

  result += _toStrFromContainer
  ({
    values : src,
    names : names,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : simple,
    prefix : '{',
    postfix : '}',
  });

  return { text : result, simple : simple };
}

//

var _toStrFromContainer = function( o )
{
  var result = '';

  _.assert( arguments.length );

  var values = o.values;
  var names = o.names;
  var optionsContainer = o.optionsContainer;
  var optionsItem = o.optionsItem;

  var simple = o.simple;
  var prefix = o.prefix;
  var postfix = o.postfix;
  var l = ( names ? names.length : values.length )

  // line postfix

  var linePostfix = '';
  if( optionsContainer.comma )
  linePostfix += optionsContainer.comma;
  if( !simple )
  linePostfix += '\n' + optionsItem.tab;

  // prepend

  if( optionsContainer.prependTab  )
  {
    if( optionsContainer.wrap )
    {
      //if( !simple )
      //result += '\n';
      result += optionsContainer.tab;
    }
  }

  // wrap

  if( optionsContainer.wrap )
  {
    result += prefix;
    if( simple )
    {
      if( l )
      result += ' ';
    }
    else
    {
      result += '\n' + optionsItem.tab;
    }
  }
  else if( !simple )
  {
    /*result += '\n' + optionsItem.tab;*/
  }

  // prepend

  if( optionsContainer.prependTab  )
  {
    if( !optionsContainer.wrap )
    {
      //if( !simple )
      //result += '\n';
      result += optionsItem.tab;
    }
  }

  //

  var r;
  var written = 0;
  for( var n = 0 ; n < l ; n++ )
  {

    _assert( optionsItem.tab === optionsContainer.tab + optionsContainer.dtab );
    _assert( optionsItem.level === optionsContainer.level + 1 );

    if( names )
    r = _toStr( values[ names[ n ] ],optionsItem );
    else
    r = _toStr( values[ n ],optionsItem );

    _.assert( _.objectIs( r ) && _.strIs( r.text ) );

    // if( r === undefined )
    // continue;
    //
    // if( r.text === undefined )
    // continue;

    _assert( optionsItem.tab === optionsContainer.tab + optionsContainer.dtab );

    if( written > 0 )
    result += linePostfix;

    if( names )
    {
      if( optionsContainer.json )
      result += '"' + String( names[ n ] ) + '"' + optionsContainer.colon;
      else
      result += String( names[ n ] ) + optionsContainer.colon;

      if( !r.simple )
      result += '\n' + optionsItem.tab;
    }

    result += r.text;
    written += 1;

  }

  // wrap

  if( optionsContainer.wrap )
  {
    if( simple )
    {
      if( l )
      result += ' ';
    }
    else
    {
      result += '\n' + optionsContainer.tab;
    }
    result += postfix;
  }

  return result;
}

//

var toStrForRange = function( range )
{
  var result;

  _assert( arguments.length === 1 );
  _assert( _.arrayIs( range ) );

  result = '[ ' + range[ 0 ] + '..' + range[ 1 ] + ' ]';

  return result;
}

//

var toStrForCall = function( nameOfRoutine,args,ret,o )
{
  var result = nameOfRoutine + '( ';
  var first = true;

  _assert( _.arrayIs( args ) || _.objectIs( args ) );
  _assert( arguments.length <= 4 );

  _.each( args,function( e,k )
  {

    if( first === false )
    result += ', ';

    if( _.objectIs( e ) )
    result += k + ' :' + _.toStr( e,o );
    else
    result += _.toStr( e,o );

    first = false;

  });

  result += ' )';

  if( arguments.length >= 3 )
  result += ' -> ' + _.toStr( ret,o );

  return result;
}

//

/**
 * This function returns  string that starts from capital letter.
 * Expects one object: the string to be formatted.
 *
 * @param {string} src - Source string.
 * @returns {String} Returns a string with the first letter capitalized.
 *
 * @example
 * //returns Test string
 * _.strCapitalize( 'test string' );
 *
 * @example
 * //returns Another_test_string
 * _.strCapitalize( 'another_test_string' );
 *
 * @method strCapitalize
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */

var strCapitalize = function( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1 );

  /*_.assert( src.length > 0 );*/
  /*_.assert( src.match(/(^\W)/) === null );*/

  if( src.length === 0 )
  return src;

  return src[ 0 ].toUpperCase() + src.substring( 1 );
}

//

/**
 * This function returns a string concatenated with itself n-times.
 * Expects two object: the string to be concatenated and count of concatenations.
 *
 * @param {string} s - Source string.
 * @param {number} times - An count of concatenation cycles.
 * @returns {String} Returns a string concatenated n-times.
 *
 * @example
 * //returns WordWordWordWordWord
 * _.strTimes( 'Word',5 );
 *
 * @example
 * //returns 1 21 2
 * _.strTimes( '1 '+'2',2 );
 *
 * @method strTimes
 * @throws { Exception } Throw an exception if( times ) is not a Number.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

var strTimes = function( s,times )
{
  var result = '';

  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( times ) );

  for( var t = 0 ; t < times ; t++ )
  result += s;

  return result;
}

//

/**
 * This function calculates a count of lines in a string.
 * Expects one object: the string to be processed.
 *
 * @param {string} src - Source string.
 * @returns {number} Returns a number of lines in string
 *
 * @example
 * //returns 2
 * _.strLineCount( 'first\nsecond' );
 *
 * @example
 * //returns 4
 * _.strLineCount( 'first\nsecond\nthird\n' );
 *
 * @method strLineCount
 * @memberof wTools
 *
*/

var strLineCount = function( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );
  var result = src.indexOf( '\n' ) !== -1 ? src.split( '\n' ).length : 1;
  return result;
}

//

/**
 * This function parses a string and separates numbers and string values
 * in to object that contains two properties,representing the values of string
 * and number parsed from the given string.
 * Expects one object: the string to be processed.
 *
 * @param {string} src - Source string.
 * @returns {object} Returns the object with two properties:( str ) and ( number ),
 * with values parsed from source string. If a string( src ) doesn't contain number( s ),
 * it returns the object with value of string( src ).
 *
 * @example
 * //returns { str: 'bd', number: 1 }
 * _.strSplitStrNumber( 'bd1' );
 *
 * @example
 * //returns { str: 'bdxf' }
 * _.strSplitStrNumber( 'bdxf' );
 *
 * @method strSplitStrNumber
 * @memberof wTools
 *
 */

var strSplitStrNumber = function( src )
{
  var result = {};

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );

  var mnumber = src.match(/\d+/);
  if( mnumber && mnumber.length )
  {
    var mstr = src.match(/[^\d]*/);
    result.str = mstr[ 0 ];
    result.number = _.numberFrom( mnumber[0] );
  }
  else
  {
    result.str = src;
  }
  return result;
}

//

var strSplitChunks = function( o )
{

  var result = { chunks : [] };


  if( arguments.length === 2 )
  {
    var o = arguments[ 1 ] || {};
    o.src = arguments[ 0 ];
  }
  else
  {
    _.assert( arguments.length === 1 );
    if( _.strIs( arguments[ 0 ] ) )
    o = { src : arguments[ 0 ] };
  }

  _.mapSupplement( o,strSplitChunks.defaults );
  _.assertMapOnly( o,strSplitChunks.defaults );
  _.assert( _.strIs( o.src ) );

  if( !_.regexpIs( o.prefix ) )
  o.prefix = RegExp( _.regexpEscape( o.prefix ),'m' );

  if( !_.regexpIs( o.postfix ) )
  o.postfix = RegExp( _.regexpEscape( o.postfix ),'m' );

  var src = o.src;

  //

  var columnEval = function( text )
  {
    var i = text.lastIndexOf( '\n' );

    if( i === -1 )
    {
      column += text.length;
    }
    else
    {
      column = text.length - i;
    }

    _.assert( column >= 0 );
  }

  //

  var line = 0;
  var column = 0;
  var chunkIndex = 0;
  while( src )
  {

    /* begin */

    var begin = src.search( o.prefix );
    if( begin === -1 ) begin = src.length;

    /* text chunk */

    if( begin > 0 )
    {
      var chunk = {};
      chunk.line = line;
      chunk.text = src.substring( 0,begin );
      chunk.index = chunkIndex;
      result.chunks.push( chunk );

      src = src.substring( begin );
      line += _.strLineCount( chunk.text ) - 1;
      chunkIndex += 1;

      columnEval( chunk.text );

    }

    /* break */

    if( !src )
    break;

    /* end */

    var end = src.search( o.postfix );
    if( end === -1 )
    {
      result.lines = src.split( '\n' ).length;
      result.error = _.err( 'Openning prefix',o.prefix,'of chunk #' + result.chunks.length,'at'+line,'line does not have closing tag :',o.postfix );
      return result;
    }

    /* code chunk */

    var chunk = {};
    chunk.line = line;
    chunk.column = column;
    chunk.index = chunkIndex;
    chunk.prefix = src.match( o.prefix )[ 0 ];
    chunk.code = src.substring( chunk.prefix.length,end );
    if( o.investigate )
    {
      chunk.lines = chunk.code.split( '\n' );
      chunk.tab = /^\s*/.exec( chunk.lines[ chunk.lines.length-1 ] )[ 0 ];
    }

    columnEval( chunk.code );

    result.chunks.push( chunk );

    /* postfix */

    src = src.substring( chunk.prefix.length + chunk.code.length );
    chunk.postfix = src.match( o.postfix )[ 0 ];
    src = src.substring( chunk.postfix.length );

    /* wind */

    chunkIndex += 1;
    line += _.strLineCount( chunk.prefix + chunk.code + chunk.postfix ) - 1;

  }

  return result;
}

strSplitChunks.defaults =
{
  src : null,
  investigate : 1,
  prefix : '//>-' + '->//',
  postfix : '//<-' + '-<//',
}

//

var _strInhalf = function( o )
{
  var result = [];

  _.assertMapOnly( o,_strInhalf.defaults );
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strIs( o.splitter ) || _.arrayIs( o.splitter ) );

  /**/

  var splitter,index;
  if( _.arrayIs( o.splitter ) )
  {

    if( !o.splitter.length )
    return [ o.src,'' ];
    var s

    if( o.left )
    s = _.entityMin( o.splitter,function( a )
    {

      var index = o.src.indexOf( a );
      if( index === -1 )
      return o.src.length;

      return index;
    });
    else
    s = _.entityMax( o.splitter,function( a )
    {

      var index = o.src.lastIndexOf( a );
      if( index === -1 )
      return o.src.length;

      return index;
    });

    splitter = s.element;
    index = s.value;

  }
  else
  {
    splitter = o.splitter;
    index = o.left ? o.src.indexOf( splitter ) : o.src.lastIndexOf( splitter );
  }

  /**/

  if( !( index >= 0 ) )
  return o.left ? [ '',o.src ] : [ o.src,'' ];

  /**/

  result[ 0 ] = o.src.substring( 0,index );
  result[ 1 ] = o.src.substring( index + splitter.length );

  return result;
}

_strInhalf.defaults =
{
  src : null,
  splitter : ' ',
  left : 1,
}

//

var strInhalfLeft = function( o )
{

  if( _.strIs( o ) )
  {
    _.assert( arguments.length === 1 || arguments.length === 2 );
    o = { src : arguments[ 0 ], splitter : arguments[ 1 ] };
  }
  else
  {
    _.assert( arguments.length === 1 );
  }

  _.assertMapOnly( o,strInhalfLeft.defaults );

  o.left = 1;

  var result = _strInhalf( o );
  return result;
}

strInhalfLeft.defaults =
{
  src : null,
  splitter : ' ',
}

//

var strInhalfRight = function( o )
{

  if( _.strIs( o ) )
  {
    _.assert( arguments.length === 1 || arguments.length === 2 );
    o = { src : arguments[ 0 ], splitter : arguments[ 1 ] };
  }
  else
  {
    _.assert( arguments.length === 1 );
  }

  _.assertMapOnly( o,strInhalfRight.defaults );

  o.left = 0;

  var result = _strInhalf( o );
  return result;
}

strInhalfRight.defaults =
{
  src : null,
  splitter : ' ',
}

//
/**
 * This function splits a string at each position where the separator (o.splitter)
 * occurs in the string (o.src) into substrings and appends them to the array of strings.
 * Splitter can be set by using( strSplit.defaults.splitter ) property.
 * Expects one object: the string to be processed.
 *
 * @param {string} o - Source string to split.
 * @returns {object} Returns an array of strings split by separator( o.splitter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit( ' first second third ' );
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit.defaults.splitter= '..';
 * _.strSplit( ' first..second..third ' );
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.splitter ) is not a String or an Array.
 * @memberof wTools
 *
*/
var strSplit = function( o )
{

  if( _.strIs( o ) )
  o = { src : o };

  _.mapSupplement( o,strSplit.defaults );
  _.assertMapOnly( o,strSplit.defaults );
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strIs( o.splitter ) || _.arrayIs( o.splitter ) );

  var splitter = _.arrayIs( o.splitter ) ? o.splitter.slice() : [ o.splitter ];
  var result = o.src.split( splitter[ 0 ] );
  splitter.splice( 0,1 );

  /**/

  while( splitter.length )
  {

    for( var r = result.length-1 ; r >= 0 ; r-- )
    {

      var sub = result[ r ].split( splitter[ 0 ] );
      if( sub.length > 1 )
      _.arraySplice( result,r,r+1,sub );

    }

    splitter.splice( 0,1 );

  }

  /**/

  for( var r = result.length-1 ; r >= 0 ; r-- )
  {

    if( o.strip )
    result[ r ] = strStrip( result[ r ] );
    if( !result[ r ] )
    result.splice( r,1 );

  }

  return result;
}

strSplit.defaults =
{
  src : null,
  splitter : ' ',
  strip : 1,
}

//

var strStrip = function( o )
{

  if( _.strIs( o ) )
  o = { src : o };

  _.mapSupplement( o,strStrip.defaults );
  _.assertMapOnly( o,strStrip.defaults );
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( o.src ),'expects string or array o.src, got',_.strTypeOf( o.src ) );
  _.assert( _.strIs( o.stripper ) || _.arrayIs( o.stripper ),'expects string or array o.stripper' );

  //logger.log( 'strStrip.src :',o.src ); debugger;

  if( o.stripper === ' ' )
  {
    return o.src.replace( /^(\s|\n|\0)+|(\s|\n|\0)+$/gm,'' );
  }
  else
  {

    o.stripper = _.arrayAs( o.stripper );

    for( var b = 0 ; b < o.src.length ; b++ )
    if( o.stripper.indexOf( o.src[ b ] ) === -1 )
    break;

    for( var e = o.src.length-1 ; e >= 0 ; e-- )
    if( o.stripper.indexOf( o.src[ e ] ) === -1 )
    break;

    //logger.log( 'strStrip.result :',o.src.substring( b,e+1 ) );

    return o.src.substring( b,e+1 );
  }

}

strStrip.defaults =
{
  src : null,
  stripper : ' ',
}

//
/**
 * This function removes all whitespaces from the string passed by first argument( src ).
 * If second argument is not equal 'undefined', function replaces whitespaces with( sub )
 * argument value. Else function removes only whitespaces.
 *
 * @param {string} src - Source string to parse.
 * @param {string} sub - Substring that replaces whitespaces.
 * @returns {string} Returns a string with removed whitespaces.
 *
 * @example
 * //returns abcde
 * _.strRemoveAllSpaces( 'a b c d e' );
 *
 * @example
 * //returns a*b*c*d*e
 * _.strRemoveAllSpaces( 'a b c d e','*' );
 *
 * @method strRemoveAllSpaces

 * @memberof wTools
 *
*/

var strRemoveAllSpaces = function( src,sub )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( src ) );

  if( sub === undefined )
  sub = '';

  return src.replace( /\s/g,sub );
}

//

/**
 * This function removes all empty lines from the string passed by first argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns a string with empty lines removed.
 *
 * @example
 * //returns
 * //first
 * //second
 * _.strStripEmptyLines( 'first\n\nsecond' );
 *
 * @example
 * //returns
 * //zero
 * //first
 * //second
 * _.strStripEmptyLines( 'zero\n\nfirst\n\nsecond' );
 *
 * @method strStripEmptyLines
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */

var strStripEmptyLines = function( srcStr )
{
  var result = '';
  var lines = srcStr.split( '\n' );

  _.assert( _.strIs( srcStr ) );
  _.assert( arguments.length === 1 );

  for( var l = 0; l < lines.length; l += 1 )
  {
    var line = lines[ l ];

    if( !_.strStrip( line ) )
    continue;

    result += line + '\n';
  }

  return result;
}

//

var strIron = function()
{

  throw _.err( 'not tested' );

  var result = '';

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];

    if( !_.strIs( argument ) && !_.objectIs( argument ) && !_.arrayIs( argument ) )
    throw _.err( '_.strIron :','argument could be string, array or object' );

    if( _.strIs( argument ) )
    {
      result += argument;
    }
    else _.each( argument,function( e,k,i ){

      result += _.strIron( e );

    });

  }

  return result;
}

//

/* !!! update me, please */

/**
 * This function finds substring passed by second argument( ins ) in the source string( src )
 * and replaces each occurrence with the third argument( sub ).
 * If the function can not find any occurrence in source( src ) it returns the original string.
 *
 * @param {string} srcStr - Source string to parse.
 * @param {string} ins - String that is to be replaced by( ins ).
 * @param {string} sub - String that replaces substring.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns aacaa
 * _.strReplaceAll( 'aabaa','b','c' );
 *
 * @example
 * //returns xxbxx
 * _.strReplaceAll( 'aabaa','a','x' );
 *
 * @example
 * //returns aabaa
 * _.strReplaceAll( 'aabaa','y','x' );
 *
 * @method strReplaceAll
 * @memberof wTools
 *
 */

var strReplaceAll = function( dst, ins, sub )
{

  var o;
  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 3 )
  {
    _.assert( _.strIs( ins ) );
    _.assert( _.strIs( sub ) );
    o = { dst : dst };
    o.dictionary = {};
    o.dictionary[ ins ] = sub;
  }
  else if( arguments.length === 2 )
  {
    o = { dst : dst , dictionary : arguments[ 1 ] };
  }
  else if( arguments.length === 1 )
  {
    o = arguments[ 0 ];
  }

  /**/

  _.assert( _.strIs( o.dst ) );
  _.assert( _.objectIs( o.dictionary ) );

  /**/

  var dst = o.dst;
  var l = Object.keys( o.dictionary );
  for( var ins in o.dictionary )
  {

    var index = -1;
    var sub = o.dictionary[ ins ];

    do
    {

      var index = dst.indexOf( ins,index+1 );
      if( index >= 0 )
      dst = dst.substring( 0,index ) + sub + dst.substring( index+ins.length );
      else
      break;

    }
    while( 1 );

  }

  return dst;
  //return dst.replace( new RegExp( _.regexpEscape( ins ),'gm' ), sub );
}

strReplaceAll.defaults =
{
  dst : null,
  dictionary : null,
}

  //

var strReplaceNames = function( src,ins,sub )
{
  _.assert( _.arrayIs( ins ) );
  _.assert( _.arrayIs( sub ) );
  _.assert( ins.length === sub.length );

  var result = src;
  for( var i = 0 ; i < ins.length ; i++ )
  {
    var r = new RegExp( '(\\W|^)' + ins[ i ] + '(?=\\W|$)','gm' );
    result = result.replace( r,function( original )
    {

      if( original[ 0 ] !== sub[ i ][ 0 ] )
      return original[ 0 ] + sub[ i ];
      else
      return sub[ i ];

    });
  }

  return result;
}

//

var strJoin = function()
{
  var result = [ '' ];
  var arrayEncountered = 0;
  var arrayLength;

  var join = function( s,src )
  {
    result[ s ] += src;
  }

  /**/

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );

    if( _.arrayIs( src ) )
    {

      if( arrayEncountered === 0 )
      for( var s = 1 ; s < src.length ; s++ )
      result[ s ] = result[ 0 ];

      _.assert( arrayLength === undefined || arrayLength === src.length, 'strJoin : all arrays should has same length' );

      arrayEncountered = 1;
      for( var s = 0 ; s < src.length ; s++ )
      join( s,src[ s ] );

    }
    else
    {

      for( var s = 0 ; s < result.length ; s++ )
      join( s,src );

    }

  }

  if( arrayEncountered )
  return result;
  else
  return result[ 0 ];

}

//

var strUnjoin = function( srcStr,maskArray )
{

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.arrayIs( maskArray ) );

  var result = [];
  var index = 0;
  var rindex = -1;

  /**/

  var checkRoutine = function()
  {

    if( rindex !== -1 )
    {
      _.assert( rindex <= index );
      result.push( srcStr.substring( rindex,index ) );
      rindex = -1;
      return true;
    }

    return false;
  }

  /**/

  var checkMask = function( mask )
  {

    _.assert( _.strIs( mask ) || _.routineIs( mask ) )

    if( _.strIs( mask ) )
    {
      index = srcStr.indexOf( mask,index );

      if( index === -1 )
      return false;

      checkRoutine();

      result.push( mask );
      index += mask.length;

    }
    else if( _.routineIs( mask ) )
    {
      rindex = index;
    }

    return true;
  }

  /**/

  for( var m = 0 ; m < maskArray.length ; m++ )
  {

    var mask = maskArray[ m ];

    if( !checkMask( mask ) )
    return;

  }

  if( checkRoutine() )
  debugger;

  /**/

  return result;
}

strUnjoin.any = function( src )
{
  return src;
}

//
/**
 * Finds substring( prefix ) occurrence from the begining of the source( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param {string} src - Source string to parse.
 * @param {string} prefix - String that is to be dropped.
 * @returns {string} Returns string with result of prefix removement.
 *
 * @example
 * //returns mple
 * _.strDropPrefix( 'example','exa' );
 *
 * @example
 * //returns example
 * _.strDropPrefix( 'example','abc' );
 *
 * @method strDropPrefix
  * @memberof wTools
 *
*/
var strDropPrefix = function( src,prefix )
{
  _.assert( _.strIs( src ) );
  _.assert( _.strIs( prefix ) );
  _.assert( arguments.length === 2 );

  if( src.indexOf( prefix ) !== -1 )
  return src.substr( prefix.length,src.length-prefix.length );
  else return src;
}

//

var strDropPostfix = function( src,postfix )
{

  _.assert( _.strIs( src ) );
  _.assert( _.strIs( postfix ) );
  _.assert( arguments.length === 2 );

  var l = src.length - postfix.length;

  if( src.length > postfix.length && src.lastIndexOf( postfix ) === l )
  return src.substr( 0,l );
  else return src;
}

//

var strDifference = function( src1,src2,o )
{
  _assert( _.strIs( src1 ) );
  _assert( _.strIs( src2 ) );

  if( src1 === src2 )
  return false;

  for( var i = 0, l = Math.min( src1.length, src2.length ) ; i < l ; i++ )
  if( src1[ i ] !== src2[ i ] )
  return src1.substr( 0,i ) + '*';

  return src1.substr( 0,i ) + '*';
}

//

var strSimilarity = function( src1,src2,o )
{
  _assert( _.strIs( src1 ) );
  _assert( _.strIs( src2 ) );

  var latter = [ _.strLattersSpectre( src1 ),_.strLattersSpectre( src2 ) ];
  var result = _.lattersSpectreComparison( latter[ 0 ],latter[ 1 ] );
  return result;
}

//

var strLattersSpectre = function( src )
{

  var result = {};

  for( var s = 0 ; s < src.length ; s++ )
  {
    if( !result[ src[ s ] ] ) result[ src[ s ] ] = 1;
    else result[ src[ s ] ] += 1;
  }

  result.length = src.length;
  return result;
}

//

var lattersSpectreComparison = function( src1,src2 )
{

  var same = 0;

  if( src1.length === 0 && src2.length === 0 ) return 1;

  for( var l in src1 )
  {
    if( l === 'length' ) continue;
    if( src2[ l ] ) same += Math.min( src1[ l ],src2[ l ] );
  }

  return same / Math.max( src1.length,src2.length );
}

//
/**
 * This function finds all occurrences of html escape symbols from( _strHtmlEscapeMap )
 * in source( str ) and replaces them with code equivalent like( '&' -> '&amp;' ).
 *
 * @param {string} str - Source string to parse.
 * @global {object} _strHtmlEscapeMap - Html escape symbols map.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns &lt;&amp;test &amp;text &amp;here&gt;
 * _.strHtmlEscape( '<&test &text &here>' );
 *
 * @example
 * //returns 1 &lt; 2
 * _.strHtmlEscape( '1 < 2' );
 *
 * @example
 * //returns &#x2F;&#x2F;test&#x2F;&#x2F;
 * _.strHtmlEscape( '//test//' );
 *
 * @method strHtmlEscape
 * @memberof wTools
 *
 */

var _strHtmlEscapeMap =
{
  '&' : '&amp;',
  '<' : '&lt;',
  '>' : '&gt;',
  '"' : '&quot;',
  '\'' : '&#39;',
  '/' : '&#x2F;'
}

var strHtmlEscape = function( str )
{
  _.assert( arguments.length === 1 );

  return String( str ).replace( /[&<>"'\/]/g, function( s )
  {
    return _strHtmlEscapeMap[ s ];
  });
}

//

var strUnicodeEscape = function( src )
{
  var result = '';

  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1 );

  for( var i = 0 ; i < src.length ; i++ )
  {
    var c = src[ i ];
    var code = c.charCodeAt( 0 );
    var h = code.toString( 16 );
    var d = _.strDup( '0',4-h.length ) + h;
    result += '\\u' + d;
  }

  return result;
}

//

/**
 * This function appends indentation character passed by the second argument( tab )
 * before first and every next new line in a source string( src ).
 * If( src ) represents single line, function puts indentation at the begining of the string.
 *
 * @param {string} src - Source string to parse.
 * @param {string} tab - Indentation character.
 * @returns {string} Returns indented string.
 *
 * @example
 * //returns
 *  a
 *  b
 *  c
 * _.strIndentation( 'a\nb\nc','  ' );
 *
 * @example
 * //returns '  single line'
 * _.strIndentation( 'single line','  ' );
 *
 * @method strIndentation
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( tab ) is not a String.
 * @memberof wTools
 *
*/
var strIndentation = function( src,tab )
{

  _assert( _.strIs( src ),'strIndentation : expects string src' );
  _assert( _.strIs( tab ),'strIndentation : expects string tab' );
  _assert( arguments.length === 2,'strIndentation : expects two arguments' );


  if( src.indexOf( '\n' ) === -1 )
  return tab + src;

  var result = src.split( '\n' );
  result = tab + result.join( '\n' + tab );

  return result;
}

//
/**
 * This function puts line counter before each new line in the string provided by argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns string with line enumeration.
 *
 * @example
 * //returns
 * 1: line1
 * 2: line2
 * 3: line3
 * _.strNumberLines( 'line1\nline2\nline3' );
 *
 * @example
 * //returns 1: sigle line example
 * _.strNumberLines( 'sigle line example' );
 *
 * @method strNumberLines
 * @memberof wTools
 *
*/
var strNumberLines = function( srcStr )
{

  var lines = srcStr.split( '\n' );

  for( var l = 0; l < lines.length; l += 1 )
  {

    lines[ l ] = ( l + 1 ) + ' : ' + lines[ l ];

  }

  return lines.join( '\n' );
}

//

/**
 * This function returns  count of occurrences of a substring in a string,
 * Expects two objects in order: source string, substring.
 *
 * @param {string} src - Source string.
 * @param {string} ins - Substring.
 * @returns {Number} Returns number of occurrences of a substring in a string.
 *
 * @example
 * //returns 2
 * _.strCount( "aaaabab","ab" );
 *
 * @method strCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( ins ) is not a String.
 * @memberof wTools
 *
 */

var strCount = function( src,ins )
{
  var result = -1;

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );
  _.assert( _.strIs( ins ) );

  var i = -1;
  do
  {
    result += 1;
    i = src.indexOf( ins,i+1 );
  }
  while( i !== -1 );

  return result;
}

//

var strDup = function strDup( src,times )
{
  var result = '';

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );
  _.assert( _.numberIs( times ) );

  for( var t = 0 ; t < times ; t++ )
  result += src;

  return result;
}

//

/**
 * This function converts string to camelcase using special pattern.
 * If function finds character from this( '.','-','_','/' ) list before letter,
 * it replaces letter with uppercase version.
 * For example: '.an _example' or '/an -example', method converts string to( 'An Example' ). *
 *
 * @param {string} srcStr - Source string.
 * @returns {string} Returns camelcase version of string.
 *
 * @example
 * //returns aBCD
 * _.strCamelize( 'a-b_c/d' );
 *
 * @example
 * //returns testString
 * _.strCamelize( 'test-string' );
 *
 * @method strCamelize
 * @memberof wTools
 *
 */

var strCamelize = function( srcStr )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( srcStr ) );

  var result = srcStr;
  var regexp = /\.\w|-\w|_\w|\/\w/g;

  var result = result.replace( regexp,function( match )
  {
    return match[ 1 ].toUpperCase();
  });

  return result;
}

//

/**
 * This function removes invalid characters from filename passed as first( srcStr ) argument by replacing characters finded by
 * pattern with second argument( o ) property( o.separator ).If( o.separator ) is not defined,
 * function sets value to( '_' ).
 *
 * @param {string} srcStr - Source string.
 * @param {object} o - Object that contains o.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns _example_file_name.txt
 * _.strFilenameFor( "'example\\file?name.txt" );
 *
 * @example
 * //returns #example#file#name.js
 * var o = { 'separator':'#' };
 * _.strFilenameFor( "'example\\file?name.js",o );
 *
 * @method strFilenameFor
 * @memberof wTools
 *
 */

var strFilenameFor = function( srcStr,o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( srcStr ) );

  if( arguments.length === 2 )
  _.assert( _.mapIs( arguments[ 1 ] ) );

  var result = srcStr;
  var o = o || {};
  if( o.separator === undefined )
  o.separator = '_';

  var regexp = /<|>| :|"|'|\/|\\|\||\&|\?|\*|\n|\s/g;

  var result = result.replace( regexp,function( match )
  {
    return o.separator;
  });

  return result;
}

// --
// format
// --

/**
 * This function converts each character of string passed by argument( str )
 * to array of 8-bit unsigned integers.
 *
 * @param {string} str - Source string to convert.
 * @returns {typedArray} Returns typed array that represents string characters in 8-bit unsigned integers.
 *
 * @example
 * //returns Uint8Array [ 101, 120, 97, 109, 112, 108, 101 ]
 * _.strToBytes( 'example' );
 *
 * @method strToBytes
 * @memberof wTools
 *
 */

var strToBytes = function( src )
{

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );

  var result = new Uint8Array( src.length );

  for( var s = 0, sl = src.length ; s < sl ; s++ )
  {
    result[ s ] = src.charCodeAt( s );
  }

  return result;
}

//

var _metrics =
{

  '24'  : { name : 'yotta', symbol : 'Y' , word : 'septillion' },
  '21'  : { name : 'zetta', symbol : 'Z' , word : 'sextillion' },
  '18'  : { name : 'exa'  , symbol : 'E' , word : 'quintillion' },
  '15'  : { name : 'peta' , symbol : 'P' , word : 'quadrillion' },
  '12'  : { name : 'tera' , symbol : 'T' , word : 'trillion' },
  '9'   : { name : 'giga' , symbol : 'G' , word : 'billion' },
  '6'   : { name : 'mega' , symbol : 'M' , word : 'million' },
  '3'   : { name : 'kilo' , symbol : 'k' , word : 'thousand' },
  '2'   : { name : 'hecto', symbol : 'h' , word : 'hundred' },
  '1'   : { name : 'deca' , symbol : 'da', word : 'ten' },

  '0'   : { name : ''     , symbol : ''  , word : '' },

  '-1'  : { name : 'deci' , symbol : 'd' , word : 'tenth' },
  '-2'  : { name : 'centi', symbol : 'c' , word : 'hundredth' },
  '-3'  : { name : 'milli', symbol : 'm' , word : 'thousandth' },
  '-6'  : { name : 'micro', symbol : 'μ' , word : 'millionth' },
  '-9'  : { name : 'nano' , symbol : 'n' , word : 'billionth' },
  '-12' : { name : 'pico' , symbol : 'p' , word : 'trillionth' },
  '-15' : { name : 'femto', symbol : 'f' , word : 'quadrillionth' },
  '-18' : { name : 'atto' , symbol : 'a' , word : 'quintillionth' },
  '-21' : { name : 'zepto', symbol : 'z' , word : 'sextillionth' },
  '-24' : { name : 'yocto', symbol : 'y' , word : 'septillionth' },

  range : [ -24,+24 ],

}

var strMetricFormat = function( number,o )
{

  var o = o || {};

  if( _.strIs( number ) ) number = parseFloat( number );
  if( !_.numberIs( number ) ) throw _.err( 'strMetricFormat :','"number" should be Number' );

  if( o.divisor === undefined ) o.divisor = 3;
  if( o.thousand === undefined ) o.thousand = 1000;
  if( o.fixed === undefined ) o.fixed = 1;
  if( o.dimensions === undefined ) o.dimensions = 1;
  if( o.metric === undefined ) o.metric = 0;

  if( o.dimensions !== 1 ) o.thousand = Math.pow( o.thousand,o.dimensions );

  var metric = o.metric;
  var original = number;

  if( Math.abs( number ) > o.thousand )
  {

    while( Math.abs( number ) > o.thousand || !_metrics[ String( metric ) ] )
    {

      if( metric + o.divisor > _metrics.range[ 1 ] ) break;

      number /= o.thousand;
      metric += o.divisor;

    }

  }
  else if( Math.abs( number ) < 1 )
  {

    while( Math.abs( number ) < 1 || !_metrics[ String( metric ) ] )
    {

      if( metric - o.divisor < _metrics.range[ 0 ] ) break;

      number *= o.thousand;
      metric -= o.divisor;

    }

  }

  var result = '';

  if( _metrics[ String( metric ) ] )
  {
    result = number.toFixed( o.fixed ) + ' ' + _metrics[ String( metric ) ].symbol;
  }
  else
  {
    result = original.toFixed( o.fixed ) + ' ';
  }

  return result;
}

//

var strMetricFormatBytes = function( number,o )
{

  var o = o || {};
  var defaultOptions =
  {
    divisor : 3,
    thousand : 1024,
  };

  _.mapSupplement( o,defaultOptions );

  return _.strMetricFormat( number,o ) + 'b';
}

//

var strTimeFormat = function( time )
{
  var result = strMetricFormat( time*0.001,{ fixed : 3 } ) + 's';
  return result;
}

//

var strCsvFrom = function( src,o )
{

  var result = '';
  var o = o || {};

  debugger;

  if( !o.header )
  {

    o.header = [];

    _.eachRecursive( _.entityValueWithIndex( src,0 ),function( e,k,i )
    {
      o.header.push( k );
    });

  }

  if( o.cellSeparator === undefined ) o.cellSeparator = ',';
  if( o.rowSeparator === undefined ) o.rowSeparator = '\n';
  if( o.substitute === undefined ) o.substitute = '';
  if( o.withHeader === undefined ) o.withHeader = 1;

  //console.log( 'o',o );

  if( o.withHeader )
  {
    _.eachRecursive( o.header,function( e,k,i ){
      result += e + o.cellSeparator;
    });
    result = result.substr( 0,result.length-o.cellSeparator.length ) + o.rowSeparator;
  }

  _.each( src,function( row )
  {

    var rowString = '';

    _.each( o.header,function( key )
    {

      debugger;
      var element = _.entityWithKeyRecursive( row,key );
      if( element === undefined ) element = '';
      element = String( element );
      if( element.indexOf( o.rowSeparator ) !== -1 ) element = _.strReplaceAll( element,o.rowSeparator,o.substitute );
      if( element.indexOf( o.cellSeparator ) !== -1 ) element = _.strReplaceAll( element,o.cellSeparator,o.substitute );

      rowString += element + o.cellSeparator;

    });

    result += rowString.substr( 0,rowString.length-o.cellSeparator.length ) + o.rowSeparator;

  });

  return result;
}

//

var strToDom = function( xmlStr )
{

  var xmlDoc = null;
  var isIEParser = window.ActiveXObject || "ActiveXObject" in window;

  if( xmlStr === undefined ) return xmlDoc;

  if ( window.DOMParser )
  {

    var parser = new window.DOMParser();
    var parsererrorNS = null;

    if( !isIEParser ) {

      try {
        parsererrorNS = parser.parseFromString( "INVALID", "text/xml" ).childNodes[0].namespaceURI;
      }
      catch( err ) {
        parsererrorNS = null;
      }
    }

    try
    {
      xmlDoc = parser.parseFromString( xmlStr, "text/xml" );
      if( parsererrorNS!= null && xmlDoc.getElementsByTagNameNS( parsererrorNS, "parsererror" ).length > 0 )
      {
        throw 'Error parsing XML';
        xmlDoc = null;
      }
    }
    catch( err )
    {
      throw 'Error parsing XML';
      xmlDoc = null;
    }
  }
  else
  {
    if( xmlStr.indexOf( "<?" )==0 )
    {
      xmlStr = xmlStr.substr( xmlStr.indexOf( "?>" ) + 2 );
    }
    xmlDoc = new ActiveXObject( "Microsoft.XMLDOM" );
    xmlDoc.async = "false";
    xmlDoc.loadXML( xmlStr );
  }

  return xmlDoc;
}

//

function strToConfig( src,o )
{

  var result = {};
  if( !_.strIs( src ) )
  throw _.err( '_.strToConfig :','require string' );

  var o = o || {};
  if( o.delimeter === undefined ) o.delimeter = ' :';

  var src = src.split( '\n' );

  for( var s = 0 ; s < src.length ; s++ )
  {

    var row = src[ s ];
    var i = row.indexOf( o.delimeter );
    if( i === -1 ) continue;

    var key = row.substr( 0,i ).trim();
    var val = row.substr( i+1 ).trim();

    result[ key ] = val;

  }

  return result;
}

// --
// prototype
// --

var Proto =
{

  toStrMethods : toStrMethods,
  toStrFields : toStrFields,

  toStrFine_gen : toStrFine_gen,

  _toStr : _toStr,
  _toStrShort : _toStrShort,

  _toStrIsVisibleElement : _toStrIsVisibleElement,
  _toStrIsSimpleElement : _toStrIsSimpleElement,

  _toStrFromRoutine : _toStrFromRoutine,
  _toStrFromNumber : _toStrFromNumber,
  _toStrFromStr : _toStrFromStr,
  _toStrFromArray : _toStrFromArray,
  _toStrFromObject : _toStrFromObject,
  _toStrFromContainer : _toStrFromContainer,

  //

  toStrForRange : toStrForRange, /* exmperimental */
  toStrForCall : toStrForCall, /* exmperimental */

  strCapitalize : strCapitalize,
  strTimes : strTimes,
  strLineCount : strLineCount,
  strSplitStrNumber : strSplitStrNumber, /* exmperimental */
  strSplitChunks : strSplitChunks, /* exmperimental */

  _strInhalf : _strInhalf,
  strInhalf : strInhalfLeft,
  strInhalfLeft : strInhalfLeft,
  strInhalfRight : strInhalfRight,

  strSplit : strSplit,
  strStrip : strStrip,
  strRemoveAllSpaces : strRemoveAllSpaces,
  strStripEmptyLines : strStripEmptyLines,

  strIron : strIron, /* exmperimental */

  strReplaceAll : strReplaceAll, /* document me */
  strReplaceNames : strReplaceNames,

  strJoin : strJoin, /* document me */
  strUnjoin : strUnjoin, /* document me */

  strDropPrefix : strDropPrefix,
  strDropPostfix : strDropPostfix,

  strDifference : strDifference, /* exmperimental */
  strSimilarity : strSimilarity, /* exmperimental */
  strLattersSpectre : strLattersSpectre, /* exmperimental */
  lattersSpectreComparison : lattersSpectreComparison, /* exmperimental */

  strHtmlEscape : strHtmlEscape, /* improve my document */
  strUnicodeEscape : strUnicodeEscape, /* document me */

  strIndentation : strIndentation,
  strNumberLines : strNumberLines,

  strCount : strCount,
  strDup : strDup, /* document me */

  strCamelize : strCamelize,
  strFilenameFor : strFilenameFor,

  // format

  strToBytes : strToBytes,
  strMetricFormat : strMetricFormat,
  strMetricFormatBytes : strMetricFormatBytes,

  strTimeFormat : strTimeFormat,

  strCsvFrom : strCsvFrom, /* exmperimental */
  strToDom : strToDom, /* exmperimental */
  strToConfig : strToConfig, /* exmperimental */

}

_.mapExtend( Self, Proto );

//

var toStrFine = Self.toStrFine = Self.toStrFine_gen();
var toStr = Self.toStr = Self.strFrom = toStrFine;

//

if( typeof module !== 'undefined' && module !== null )
{
  module[ 'exports' ] = Self;
}

}).call( this );
