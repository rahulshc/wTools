(function _StringTools_s_() {

'use strict';

/*
- remove old code
- off \u coding for big chars
- explain wrap mode in details
*/

//

// if( typeof module !== 'undefined' )
// {
//   wTools.includeAny( __dirname + '/Proto.s','wProto','' );
// }

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
 * @param {wTools~toStrOptions} o - conversion o {@link wTools~toStrOptions}.
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

function toStrMethods( src,o )
{
  var o = o || {};
  o.onlyRoutines = 1;
  var result = toStrFine( src,o );
  return result;
}

//

/**
 * Short-cut for toStr function that works with all entities, but ingnores Routine type.
 * Converts object passed by argument( src ) to string representation using
 * options provided by argument( o ).
 *
 * @param {object} src - Source object.
 * @param {wTools~toStrOptions} o - conversion o {@link wTools~toStrOptions}.
 * @param {boolean} [ options.noRoutine=false ] - Ignores all entities of type Routine.
 * @see {@link wTools.toStrFine} Check out main function for more usage options and details.
 * @returns {string} Returns string that represents object data.
 *
 * @example
 * //returns [ 0, "a" ]
 * _.toStrFields( [ function del(){}, 0, 'a' ], {} )
 *
 * @example
 * //returns { c : 1, d : "2" }
 * _.toStrFields( { a : function b(){},  c : 1 , d : '2' }, {} )
 *
 * @method toStrFields
 * @memberof wTools
 *
 */

function toStrFields( src,o )
{
  var o = o || {};
  o.noRoutine = 1;
  var result = toStrFine( src,o );
  return result;
}

//
/**
* Options object for toStr function.
* @typedef {Object} wTools~toStrOptions
* @property {boolean} [ o.wrap=true ] - Wrap array-like and object-like entities
* into "[ .. ]" / "{ .. }" respecitvely.
* @property {boolean} [ o.stringWrapper='"' ] - Wrap string into specified string.
* @property {boolean} [ o.multilinedString=false ] - Wrap string into backtick ( `` ).
* @property {number} [ o.level=0 ] - Sets the min depth of looking into source object. Function starts from zero level by default.
* @property {number} [ o.levels=1 ] - Restricts max depth of looking into source object. Looks only in one level by default.
* @property {number} [ o.limitElementsNumber=0 ] - Outputs limited number of elements from object or array.
* @property {number} [ o.limitStringLength=0 ] - Outputs limited number of characters from source string.
* @property {boolean} [ o.prependTab=true ] - Prepend tab before first line.
* @property {boolean} [ o.errorAsMap=false ] - Interprets Error as Map if true.
* @property {boolean} [ o.own=true ] - Use only own properties of ( src ), ignore properties of ( src ) prototype.
* @property {string} [ o.tab='' ] - Prepended before each line tab.
* @property {string} [ o.dtab='  ' ] - String attached to ( o.tab ) each time the function parses next level of object depth.
* @property {string} [ o.colon=' : ' ] - Colon between name and value, example : { a : 1 }.
* @property {boolean} [ o.noRoutine=false ] - Ignores all entities of type Routine.
* @property {boolean} [ o.noAtomic=false ] - Ignores all entities of type Atomic.
* @property {boolean} [ o.noArray=false ] - Ignores all entities of type Array.
* @property {boolean} [ o.noObject=false ] - Ignores all entities of type Object.
* @property {boolean} [ o.noRow=false ] - Ignores all entities of type Row.
* @property {boolean} [ o.noError=false ] - Ignores all entities of type Error.
* @property {boolean} [ o.noNumber=false ] - Ignores all entities of type Number.
* @property {boolean} [ o.noString=false ] - Ignores all entities of type String.
* @property {boolean} [ o.noUndefines=false ] - Ignores all entities of type Undefined.
* @property {boolean} [ o.noDate=false ] - Ignores all entities of type Date.
* @property {boolean} [ o.onlyRoutines=false ] - Ignores all entities, but Routine.
* @property {boolean} [ o.onlyEnumerable=true ] - Ignores all non-enumerable properties of object ( src ).
* @property {boolean} [ o.noSubObject=false ] - Ignores all child entities of type Object.
* @property {number} [ o.precision=null ] - An integer specifying the number of significant digits,example : [ '1500' ].
* Number must be between 1 and 21.
* @property {number} [ o.fixed=null ] - The number of digits to appear after the decimal point, example : [ '58912.001' ].
* Number must be between 0 and 20.
* @property {string} [ o.comma=', ' ] - Splitter between elements, example : [ 1, 2, 3 ].
* @property {boolean} [ o.multiline=false ] - Writes each object property in new line.
* @property {boolean} [ o.escaping=false ] - enable escaping of special characters.
* @property {boolean} [ o.json=false ] - enable conversion of object( src ) to JSON string.
*/

/**
 * Converts object passed by argument( src ) to string format using parameters passed
 * by argument( o ).If object ( src ) has own ( toStr ) method defined function uses it for conversion.
 *
 * @param {object} src - Source object for representing it as string.
 * @param {wTools~toStrOptions} o - conversion o {@link wTools~toStrOptions}.
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
 * _.toStr( { a : 1, b : 2, c : { subd : 'some test', sube : true, subf : { x : 1 } } },{ levels : 3, dtab : '-'} );
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
 * // "    a : 1
 * //      b : 2"
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
 * _.toStr( [ 1, 2, 3, 4 ], { wrap : 0, comma : ' , ' } );
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
 * //returns [ 1, 2, [ other 3 element(s) ] ]
 * _.toStr( [ 1, 2 ,3, 4, 5 ], { limitElementsNumber : 2 } );
 *
 * @example
 * //returns [ routine sample ]
 * _.toStr( function sample( ){ });
 *
 * @example
 * //returns [ rotuine without name ]
 * _.toStr( function add( ){ }, { levels : 0 } );
 *
 * @example
 * //If object ( src ) has own ( toStr ) method defined function uses it for conversion
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
 * _.toStr( { a : 'string', b : "str" , c : 2  }, { levels : 2 , stringWrapper : '' } );
 *
 * @example
 * //returns { "a" : "string", "b" : 1, "c" : 2 }
 * _.toStr( { a : 'string', b : 1 , c : 2  }, { levels : 2 , json : 1 } );
 *
 * @example
 * //returns
 * // '{',
 * // '  a : 1, ',
 * // ' b : 2, ',
 * // '{ other 2 element(s) }',
 * // '}',
 * _.toStr( { a : 1, b : 2, c : 3, d : 4 }, { limitElementsNumber : 2 } );
 *
 * @example
 * //returns { stack : "Error: my message2"..., message : "my message2" }
 * _.toStr( new Error('my message2'), { onlyEnumerable : 0, errorAsMap : 1 } );
 *
 * @example
 * //returns
 * // "{
 * //  a : `line1
 * // line2
 * // line3`
 * // }"
 * _.toStr( { a : "line1\nline2\nline3" }, { levels: 2, multilinedString : 1 } );
 *
 * @method toStr
 * @throws { Exception } Throw an exception if( o ) is not a Object.
 * @throws { Exception } Throw an exception if( o.stringWrapper ) is not equal true when ( o.json ) is true.
 * @throws { Exception } Throw an exception if( o.multilinedString ) is not equal false when ( o.json ) is true.
 * @throws { RangeError } Throw an exception if( o.precision ) is not between 1 and 21.
 * @throws { RangeError } Throw an exception if( o.fixed ) is not between 0 and 20.
 * @memberof wTools
 *
 */

function toStrFine_functor()
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
    noUndefines : 0,

  }

  var composes =
  {

    levels : 1,
    level : 0,

    wrap : 1,
    stringWrapper : '"',
    prependTab : 1,
    errorAsMap : 0,
    own : 1,
    tab : '',
    dtab : '  ',
    colon : ' : ',
    limitElementsNumber : 0,
    limitStringLength : 0,

  }

  /**/

  var optional =
  {

    /* secondary filter */

    noSubObject : 0,
    onlyRoutines : 0,
    onlyEnumerable : 1,

    /**/

    precision : null,
    fixed : null,
    comma : ', ',
    multiline : 0,
    multilinedString : 0,
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

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

    var o = o || {};
    var toStrDefaults = {};
    if( !_.atomicIs( src ) && _.routineIs( src.toStr ) && !src.toStr.notMethod && _.objectIs( src.toStr.defaults ) )
    toStrDefaults = src.toStr.defaults;

    if( o.levels === undefined && o.json )
    o.levels = 256;

    if( o.json === 1 )
    {
      if( o.escaping === undefined )
      o.escaping = 1;
    }

    if( o.stringWrapper === undefined && o.multilinedString )
    o.stringWrapper = '`';

    _.assertMapHasOnly( o,composes,primeFilter,optional );
    o = _.mapSupplement( {},o,toStrDefaults,composes,primeFilter );

    if( o.onlyRoutines )
    {
      _.assert( !o.noRoutine,'expects ( o.noRoutine ) false if( o.onlyRoutines ) is true' );
      for( var f in primeFilter )
      o[ f ] = 1;
      o.noRoutine = 0;
    }

    if( o.comma === undefined )
    o.comma = o.wrap ? optional.comma : ' ';

    if( o.comma && !_.strIs( o.comma ) )
    o.comma = optional.comma;

    if( o.stringWrapper === '`' && o.multilinedString === undefined )
    o.multilinedString = 1;

    _.assert( _.strIs( o.stringWrapper ),'expects string ( o.stringWrapper )' );

    if( o.json === 1 )
    {
      _.assert( o.stringWrapper === '"','expects double quote ( o.stringWrapper ) true if( o.json ) is true' );
      _.assert( !o.multilinedString,'expects ( o.multilinedString ) false if( o.json ) is true to make valid JSON' );
    }

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

function _toStr( src,o )
{
  var result = '';
  var simple = 1;
  var type = _.strPrimitiveTypeOf( src );

  if( o.level >= o.levels )
  {
    return { text : _toStrShort( src,o ), simple : 1 };
  }

  if( !_toStrIsVisibleElement( src,o ) )
  return;

  var isAtomic = _.atomicIs( src );
  var isArray = _.arrayLike( src );
  var isObject = !isArray && _.objectIs( src );
  var isObjectLike = !isArray && _.objectLike( src ) && !_.routineIs( src.toString );

  /* */

  // if( src && src.toStr && src.toStr.notMethod )
  // debugger;

  if( !isAtomic && _.routineIs( src.toStr ) && !src.toStr.notMethod && !_ObjectHasOwnProperty.call( src,'constructor' ) )
  {

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
    result += _.row.toStr( src,o );
  }
  else if( _.errIs( src ) )
  {

    if( !o.errorAsMap )
    {
      result += src.toString();
    }
    else
    {
      if( o.onlyEnumerable === undefined )
      o.onlyEnumerable = 0;
      var r = _toStrFromObject( src,o );
      result += r.text;
      simple = r.simple;
    }

  }
  else if( type === 'Function' )
  {
    result += _toStrFromRoutine( src,o );
  }
  else if( type === 'Number' )
  {
    result += _toStrFromNumber( src,o );
  }
  else if( type === 'String' )
  {
    result += _toStrFromStr( src,o );
  }
  else if( type === 'Date' )
  {
    result += src.toISOString();
  }
  else if( isArray )
  {
    var r = _toStrFromArray( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( isObject )
  {
    var r = _toStrFromObject( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( type === 'Map' )
  {
    var r = _toStrFromHashMap( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( !isAtomic && _.routineIs( src.toString ) )
  {
    result += src.toString();
  }
  else
  {
    if( o.json && src === undefined )
    result += 'null';
    else
    result += String( src );

  }

  return { text : result, simple : simple };
}

//

/**
 * Converts object passed by argument( src ) to string representation using
 * options provided by argument( o ) for string and number types.
 * Returns string with object type for routines and errors, iso format for date, string representation for atomic.
 * For object,array and row returns count of elemets, example: '[ Row with 3 elements ]'.
 *
 * @param {object} src - Source object.
 * @param {wTools~toStrOptions} o - Conversion options {@link wTools~toStrOptions}.
 * @returns {string} Returns string that represents object data.
 *
 * @example
 * //returns [ Array with 3 elements ]
 * _.toStrShort( [ function del(){}, 0, 'a' ], { levels : 0 } )
 *
 * @method _toStrShort
 * @memberof wTools
 *
 */

function _toStrShort( src,o )
{
  _.assert( arguments.length === 2 );
  _.assert( _.objectIs( o ),'expects map ( o )' );

  var result = '';

  if( _.rowIs( src ) )
  {
    result += '[ Row with ' + src.length + ' elements' + ' ]';
  }
  else if( _.errIs( src ) )
  {
    result += _ObjectToString.call( src );
  }
  else if( _.routineIs( src ) )
  {
    result += _toStrFromRoutine( src );
  }
  else if( _.numberIs( src ) )
  {
    result += _toStrFromNumber( src,o );
  }
  else if( _.strIs( src ) )
  {

    var optionsStr =
    {
      limitStringLength : o.limitStringLength ? Math.min( o.limitStringLength,40 ) : 40,
      stringWrapper : o.stringWrapper,
      escaping : 1,
    }

    result = _toStrFromStr( src,optionsStr );

    // var maxStringLength = 40;
    // var nl = src.substr( 0,Math.min( src.length,maxStringLength ) ).indexOf( '\n' );
    // if( nl === -1 ) nl = src.length;
    // if( src.length > maxStringLength || nl !== src.length )
    // {
    //   src = src.substr( 0,Math.min( maxStringLength,nl ) );
    //   src = _toStrFromStr( src,o );
    //   result += '[ ' + src + ' ...' + ' ]';
    // }
    // else
    // {
    //   src = _toStrFromStr( src,o );
    //   result += src;
    // }

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

/**
 * Checks if object provided by argument( src ) must be ignored by toStr() function.
 * Filters are provided by argument( o ).
 * Returns false if object must be ignored.
 *
 * @param {object} src - Source object.
 * @param {wTools~toStrOptions} o - Filters {@link wTools~toStrOptions}.
 * @returns {boolean} Returns result of filter check.
 *
 * @example
 * //returns false
 * _.toStrIsVisibleElement( function del(){}, { noRoutine : 1 } );
 *
 * @method _toStrIsVisibleElement
 * @memberof wTools
 *
 */

function _toStrIsVisibleElement( src,o )
{

  var isAtomic = _.atomicIs( src );
  var isArray = _.arrayLike( src );
  var isObject = !isArray && _.objectLike( src );
  var type = _.strPrimitiveTypeOf( src );

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
  else if( _.errIs( src ) )
  {
    if( o.noError )
    return false;
    return true;
  }
  else if( type === 'Function' )
  {
    if( o.noRoutine )
    return false;
    return true;
  }
  else if( type === 'Number' )
  {
    if( o.noNumber || o.noAtomic )
    return false;
    return true;
  }
  else if( type === 'String' )
  {
    if( o.noString || o.noAtomic  )
    return false;
    return true;
  }
  else if( type === 'Date' )
  {
    if( o.noDate )
    return false;
    return true;
  }
  else if( isArray )
  {
    if( o.noArray )
    return false;

    if( !o.wrap )
    {
      src = _toStrFromArrayFiltered( src,o );
      if( !src.length )
      return false;
    }

    return true;
  }
  else if( isObject )
  {
    if( o.noObject )
    return false;

    if( !o.wrap )
    {
      var keys = _toStrFromObjectKeysFiltered( src,o );
      if( !keys.length )
      return false;
    }

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
    if( o.noUndefines && src === undefined )
    return false;
    return true;
  }

}

//

/**
 * Checks if object length provided by argument( element ) is enough to represent it as single line string.
 * Options are provided by argument( o ).
 * Returns true if object can be represented as one line.
 *
 * @param {object} element - Source object.
 * @param {wTools~toStrOptions} o - Check options {@link wTools~toStrOptions}.
 * @param {boolean} [ o.escaping=false ] - enable escaping of special characters.
 * @returns {boolean} Returns result of length check.
 *
 * @example
 * //returns true
 * _.toStrIsSimpleElement( 'string', { } );
 *
 * @example
 * //returns false
 * _.toStrIsSimpleElement( { a : 1, b : 2, c : 3, d : 4, e : 5 }, { } );
 *
 * @method _toStrIsSimpleElement
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function _toStrIsSimpleElement( element,o )
{
  _.assert( arguments.length === 2 );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

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

/**
 * Returns string representation of routine provided by argument( src ) using options
 * from argument( o ).
 *
 * @param {object} src - Source object.
 * @param {wTools~toStrOptions} o - conversion options {@link wTools~toStrOptions}.
 * @returns {string} Returns routine as string.
 *
 * @example
 * //returns [ routine a ]
 * _.toStrFromRoutine( function a(){}, {} );
 *
 * @method _toStrFromRoutine
 * @memberof wTools
 *
 */

function _toStrFromRoutine( src,o )
{
  _.assert( _.routineIs( src ),'expects routine ( src )' );
  var result = '';
  result = '[ routine ' + ( src.name || src._name || 'without name' ) + ' ]';

  return result;
}

//

/**
 * Converts Number( src ) to String using one of two possible options: precision or fixed.
 * If no option specified returns source( src ) as simple string.
 *
 * @param {Number} src - Number to convert.
 * @param {wTools~toStrOptions} o - Contains conversion options {@link wTools~toStrOptions}.
 * @returns {String} Returns number converted to the string.
 *
 * @example
 * //returns 8.9
 * _._toStrFromNumber( 8.923964453, { precision : 2 } );
 *
 * @example
 * //returns 8.9240
 * _._toStrFromNumber( 8.923964453, { fixed : 4 } );
 *
 * @example
 * //returns 8.92
 * _._toStrFromNumber( 8.92, { } );
 *
 * @method _toStrFromNumber
 * @throws {Exception} If no arguments provided.
 * @throws {Exception} If( src ) is not a Number.
 * @throws {Exception} If( o ) is not a Object.
 * @throws {RangeError} If( o.precision ) is not between 1 and 21.
 * @throws {RangeError} If( o.fixed ) is not between 0 and 20.
 * @memberof wTools
 *
*/

function _toStrFromNumber( src,o )
{
  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( src ) && _.objectIs( o ) );
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

/**
 * Adjusts source string. Takes string from argument( src ) and options from argument( o ).
 * Limits string length using option( o.limitStringLength ), disables escaping characters using option( o.escaping ),
 * wraps source into specified string using( o.stringWrapper ).
 * Returns result as new string or source string if no changes maded.
 *
 * @param {object} src - String to parse.
 * @param {wTools~toStrOptions} o - Contains conversion  options {@link wTools~toStrOptions}.
 * @returns {String} Returns result of adjustments as new string.
 *
 * @example
 * //returns "hello"
 * _._toStrFromStr( 'hello', {} );
 *
 * @example
 * //returns "test\n"
 * _._toStrFromStr( 'test\n', { escaping : 1 } );
 *
 * @example
 * //returns [ "t" ... "t" ]
 * _._toStrFromStr( 'test', { limitStringLength: 2 } );
 *
 * @example
 * //returns `test`
 * _._toStrFromStr( 'test', { stringWrapper : '`' } );
 *
 * @method _toStrFromStr
 * @throws {Exception} If no arguments provided.
 * @throws {Exception} If( src ) is not a String.
 * @throws {Exception} If( o ) is not a Object.
 * @memberof wTools
 *
*/

function _toStrFromStr( src,o )
{
  var result = '';

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ), 'expects string ( src )'  );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

  //var q = o.multilinedString ? '`' : o.stringWrapper;
  var q = o.stringWrapper;

  if( o.limitStringLength )
  {
    result = strShort({ src : src, limit : o.limitStringLength, wrap : q, escaping : 1 });
    if( result.length > o.limitStringLength )
    {
      result = '[ ' + result + ' ]';
      q = '';
    }
  }
  else if( o.escaping )
  {
    result = strEscape( src );
  }
  else
  {
    result = src;
  }

  if( o.stringWrapper )
  {
    result = q + result + q;
  }

  return result;
}

//

function _toStrFromHashMap( src,o )
{
  var result = '';
  var simple = 0;

  // throw _.err( 'not implemented' );
  _assert( src instanceof Map ); debugger;

  src.forEach( function( e,k )
  {
    result += '\n' + k + ' : ' + e;
  });

  return { text : result, simple : 0 };

  /* item options */

  var optionsItem = _.mapExtend( {},o );
  optionsItem.noObject = o.noSubObject ? 1 : optionsItem.noObject;
  optionsItem.tab = o.tab + o.dtab;
  optionsItem.level = o.level + 1;
  optionsItem.prependTab = 0;

  /* get names */

  var keys = _toStrFromObjectKeysFiltered( src,o );

  /* empty case */

  var length = keys.length;
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
    names : keys,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : simple,
    prefix : '{',
    postfix : '}',
  });

  return { text : result, simple : simple };
  //
  // /* */
  //
  // debugger;
  // var names = [];
  // var values = {};
  // for( var s of src )
  // {
  //   names.push( s[ 0 ] );
  //   values[ s[ 0 ] ] = s[ 1 ];
  // }
  //
  // /* */
  //
  // var optionsItem = _.mapExtend( {},o );
  // optionsItem.noObject = o.noSubObject ? 1 : optionsItem.noObject;
  // optionsItem.tab = o.tab + o.dtab;
  // optionsItem.level = o.level + 1;
  // optionsItem.prependTab = 0;
  //
  // /* */
  //
  // result += _toStrFromContainer
  // ({
  //   values : values,
  //   names : names,
  //   optionsContainer : o,
  //   optionsItem : optionsItem,
  //   simple : simple,
  //   prefix : '{',
  //   postfix : '}',
  // });
  //
  // return { text : result, simple : simple };
}

//

function _toStrFromArrayFiltered( src,o )
{
  var result = '';

  _assert( arguments.length === 2 );

  /* item options */

  var optionsItem = _.mapExtend( {},o );
  optionsItem.level = o.level + 1;

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

  return src;
}

//

/**
 * Converts array provided by argument( src ) into string representation using options provided by argument( o ).
 *
 * @param {object} src - Array to convert.
 * @param {wTools~toStrOptions} o - Contains conversion options {@link wTools~toStrOptions}.
 * @returns {String} Returns string representation of array.
 *
 * @example
 * //returns
 * //[
 * //  [ Object with 1 elements ],
 * //  [ Object with 1 elements ]
 * //]
 * _.toStrFromArray( [ { a : 1 }, { b : 2 } ], {} );
 *
 * @example
 * //returns
 * // [
 * //   1,
 * //   [
 * //     2,
 * //     3,
 * //     4'
 * //   ],
 * //   5
 * // ]
 * _.toStrFromArray( [ 1, [ 2, 3, 4 ], 5 ], { levels : 2, multiline : 1 } );
 *
 * @method _toStrFromArray
 * @throws { Exception } If( src ) is undefined.
 * @throws { Exception } If no arguments provided.
 * @throws { Exception } If( o ) is not a Object.
 * @memberof wTools
 *
 */

function _toStrFromArray( src,o )
{
  var result = '';

  _assert( arguments.length === 2 );
  _assert( src && _.numberIs( src.length ) );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );


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

  src = _toStrFromArrayFiltered( src,o );

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

function _toStrFromObjectKeysFiltered( src,o )
{
  var result = '';

  _assert( arguments.length === 2 );

  /* item options */

  var optionsItem = _.mapExtend( {},o );
  optionsItem.noObject = o.noSubObject ? 1 : optionsItem.noObject;

  /* get keys */

  var keys = _.mapKeysCustom
  ({
    src : src,
    own : o.own,
    enumerable : o.onlyEnumerable || o.onlyEnumerable === undefined || false,
  });

  /* filter */

  for( var n = 0 ; n < keys.length ; n++ )
  {
    if( !_toStrIsVisibleElement( src[ keys[ n ] ],optionsItem ) )
    {
      keys.splice( n,1 );
      n -= 1;
    }
  }

  return keys;
}

//

/**
 * Converts object provided by argument( src ) into string representation using options provided by argument( o ).
 *
 * @param {object} src - Object to convert.
 * @param {wTools~toStrOptions} o - Contains conversion options {@link wTools~toStrOptions}.
 * @returns {String} Returns string representation of object.
 *
 * @example
 * //returns
 * // {
 * //  r : 9,
 * //  t : { a : 10 },
 * //  y : 11
 * // }
 * _.toStrFromObject( { r : 9, t : { a : 10 }, y : 11 }, { levels : 2 } );
 *
 * @example
 * //returns ''
 * _.toStrFromObject( { h : { d : 1 }, g : 'c', c : [2] }, { levels : 2, noObject : 1 } );
 *
 * @method _toStrFromObject
 * @throws { Exception } If( src ) is not a object-like.
 * @throws { Exception } If not all arguments provided.
 * @throws { Exception } If( o ) is not a Object.
 * @memberof wTools
 *
*/

function _toStrFromObject( src,o )
{
  var result = '';

  _assert( arguments.length === 2 );
  _assert( _.objectLike( src ) );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );


  if( o.level >= o.levels )
  {
    return { text : _toStrShort( src,o ), simple : 1 };
  }

  if( o.noObject )
  return;

  /* item options */

  var optionsItem = _.mapExtend( {},o );
  optionsItem.noObject = o.noSubObject ? 1 : optionsItem.noObject;
  optionsItem.tab = o.tab + o.dtab;
  optionsItem.level = o.level + 1;
  optionsItem.prependTab = 0;

  /* get names */

  var keys = _toStrFromObjectKeysFiltered( src,o );

  /* empty case */

  var length = keys.length;
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
    names : keys,
    optionsContainer : o,
    optionsItem : optionsItem,
    simple : simple,
    prefix : '{',
    postfix : '}',
  });

  return { text : result, simple : simple };
}

//

/**
 * Builds string representation of container structure using options from
 * argument( o ). Takes keys from option( o.names ) and values from option( o.values ).
 * Wraps array-like and object-like entities using ( o.prefix ) and ( o.postfix ).
 *
 * @param {object} o - Contains data and options.
 * @param {object} [ o.values ] - Source object that contains values.
 * @param {array} [ o.names ] - Source object keys.
 * @param {string} [ o.prefix ] - Denotes begin of container.
 * @param {string} [ o.postfix ] - Denotes end of container.
 * @param {wTools~toStrOptions} o.optionsContainer - Options for container {@link wTools~toStrOptions}.
 * @param {wTools~toStrOptions} o.optionsItem - Options for item {@link wTools~toStrOptions}.
 * @returns {String} Returns string representation of container.
 *
 * @method _toStrFromContainer
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( o ) is not a Object.
 * @memberof wTools
 *
 */

function _toStrFromContainer( o )
{
  var result = '';

  _.assert( arguments.length );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

  var values = o.values;
  var names = o.names;
  var optionsContainer = o.optionsContainer;
  var optionsItem = o.optionsItem;

  var simple = o.simple;
  var prefix = o.prefix;
  var postfix = o.postfix;
  var limit = optionsContainer.limitElementsNumber;
  var l = ( names ? names.length : values.length )

  if( limit > 0 && limit < l )
  {
    debugger;
    l = limit;
    optionsContainer.limitElementsNumber = 0;
  }

  /* line postfix */

  var linePostfix = '';
  if( optionsContainer.comma )
  linePostfix += optionsContainer.comma;

  if( !simple )
  {
    linePostfix += '\n' + optionsItem.tab;
  }

  /* prepend */

  if( optionsContainer.prependTab  )
  {
    result += optionsContainer.tab;
  }

  /* wrap */

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

  /* exec */

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

    _assert( _.objectIs( r ) && _.strIs( r.text ) );
    _assert( optionsItem.tab === optionsContainer.tab + optionsContainer.dtab );

    if( written > 0 )
    {
      result += linePostfix;
    }
    else if( !optionsContainer.wrap )
    if( !names || !simple )
    //if( !simple )
    {
      result += optionsItem.dtab;
    }

    if( names )
    {
      if( optionsContainer.json )
      result += '"' + String( names[ n ] ) + '"' + optionsContainer.colon;
      else
      result += String( names[ n ] ) + optionsContainer.colon;

      if( !r.simple )
      result += '\n' + optionsItem.tab;
    }

    if( r.text )
    {
      result += r.text;
      written += 1;
    }

  }

  /* other */

  function other( length )
  {
    return linePostfix + '[ ... other '+ ( length - l ) +' element(s) ]';
  }

  if( names && l < names.length )
  result +=  other( names.length );
  else if( l < values.length )
  result +=  other( values.length );

  /* wrap */

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

// --
//
// --

/**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> '"st"..."ng"'.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ( { src : 'string', limit : 4, wrap : 0, escaping : 0 } ).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.wrap='"' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 * @returns {string} Returns simplified source string.
 *
 * @example
 * //returns '"st" ... "ng"'
 * _.strShort( 'string', 4 );
 *
 * @example
 * //returns '"s" ... "ng"'
 * _.strShort( 's\ntring', 4 );
 *
 * @example
 * //returns 'string'
 * _.strShort( 'string', 0 );
 *
 * @example
 * //returns "'st' ... 'ng'"
 * _.strShort( { src : 'string', limit : 4, wrap : "'" } );
 *
 * @example
 * //returns "si ... le"
 *  _.strShort( { src : 'simple', limit : 4, wrap : 0 } );
 *
 * @example
 * //returns '"si" ... "le"'
 *  _.strShort( { src : 'si\x01mple', limit : 5, wrap : '"' } );
 *
 * @example
 * //returns '"s\u0001" ... " string"'
 *  _.strShort( 's\x01t\x01ing string string', 14 );
 *
 * @method strShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.wrap ) is not a String.
 *
 * @memberof wTools
 *
 */

function strShort( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], limit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.mapSupplement( o,strShort.defaults );
  _.assertMapHasOnly( o,strShort.defaults );
  _.assert( _.strIs( o.src ) );
  _.assert( _.numberIs( o.limit ) );

  var str = o.src;

  if( str.length > o.limit && o.limit > 0  )
  {
    var b = Math.ceil( o.limit / 2 );
    var e = o.limit - b;

    var begin = str.substr( 0, b );
    var end = str.slice( -e );

    if( o.escaping )
    {
      function check( s, l )
      {
        var temp = _.strEscape( s );

        if( temp.length > l )
        for( var i = s.length - 1; i >= 0 ; --i )
        {
          if( temp.length <= l )
          break;
          temp = temp.slice( 0, - ( _.strEscape( s[ i ] ).length ) );
        }

        return temp;
      }

      begin = check( begin, b );
      end = check( end, e );

    }

    if( o.wrap )
    {
      _.assert( _.strIs( o.wrap ) );

      begin = o.wrap + begin + o.wrap;
      end = o.wrap + end + o.wrap;
    }

    if( o.limit === 1 )
    str = begin;
    else
    str = begin + ' ... ' +  end ;

  }
  else
  {
    if( o.escaping )
    str = _.strEscape( str );
  }

  return str;
}

strShort.defaults =
{
  src : null,
  limit : 40,
  wrap : '"',
  escaping : 1
}

//

/**
 * Disables escaped characters in source string( src ).
 * Example: '\n' -> '\\n', '\u001b' -> '\\u001b' etc.
 * Returns string with disabled escaped characters, source string if nothing changed or  empty string if source is zero length.
 * @param {string} src - Source string.
 * @returns {string} Returns string with disabled escaped characters.
 *
 * @example
 * //returns "\nhello\u001bworld\n"
 * _.strEscape( '\nhello\u001bworld\n' );
 *
 * @example
 * //returns "string"
 * _.strEscape( 'string' );
 *
 * @example
 * //returns "str\""
 * _.strEscape( 'str"' );
 *
 * @example
 * //returns ""
 * _.strEscape( '' );
 *
 * @method strEscape
 * @throw { Exception } If( src ) is not a String.
 * @memberof wTools
 *
 */

function strEscape( src )
{
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

  _.assert( _.strIs( src ) );

  var result = '';
  for( var s = 0 ; s < src.length ; s++ )
  {
    var c = src[ s ];
    var code = c.charCodeAt( 0 );

    _.assert( c.length === 1 );

    //if( 127 <= code && code <= 159 || code === 173 )
    if( 0x007f <= code && code <= 0x009f || code === 0x00ad /*|| code >= 65533*/ )
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

      // case '\'' :
      //   result += "\\'";
      //   break;

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

      // case '\v' :
      //   xxx
      //   result += '\\v';
      //   break;

      default :

        _.assert( code !== 92 );
        if( code < 32 )
        {
          result += _.strUnicodeEscape( c );
        }
        else
        result += c;

    }
  }

  return result;
}

//

function toStrForRange( range )
{
  var result;

  _assert( arguments.length === 1 );
  _assert( _.arrayIs( range ) );

  result = '[ ' + range[ 0 ] + '..' + range[ 1 ] + ' ]';

  return result;
}

//

function toStrForCall( nameOfRoutine,args,ret,o )
{
  var result = nameOfRoutine + '( ';
  var first = true;

  _assert( _.arrayIs( args ) || _.objectIs( args ) );
  _assert( arguments.length <= 4 );

  _.each( args,function( e,k,iteration )
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
 * Returns string with first letter converted to upper case.
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

function strCapitalize( src )
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
 * Appends string to it itself n-times.
 * Expects two object: source string( s ) and number of concatenations( times ).
 *
 * @param {string} s - Source string.
 * @param {number} times - Number of concatenation cycles.
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
 * @throws { Exception } Throw an exception if( s ) is not a String.
 * @throws { Exception } Throw an exception if( times ) is not a Number.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strTimes( s,times )
{
  var result = '';

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( s ) );
  _.assert( _.numberIs( times ) );

  for( var t = 0 ; t < times ; t++ )
  result += s;

  return result;
}

//

/**
 * Returns a count of lines in a string.
 * Expects one object: the string( src ) to be processed.
 *
 * @param {string} src - Source string.
 * @returns {number} Returns a number of lines in string.
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
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
*/

function strLineCount( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );
  var result = src.indexOf( '\n' ) !== -1 ? src.split( '\n' ).length : 1;
  return result;
}

//

/**
 * Parses a source string( src ) and separates numbers and string values
 * in to object with two properties: 'str' and 'number', example of result: ( { str: 'bd', number: 1 } ).
 *
 * @param {string} src - Source string.
 * @returns {object} Returns the object with two properties:( str ) and ( number ),
 * with values parsed from source string. If a string( src ) doesn't contain number( s ),
 * function returns the object with value of string( src ).
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
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
 */

function strSplitStrNumber( src )
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

function strSplitChunks( o )
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
  _.assertMapHasOnly( o,strSplitChunks.defaults );
  _.assert( _.strIs( o.src ) );

  if( !_.regexpIs( o.prefix ) )
  o.prefix = RegExp( _.regexpEscape( o.prefix ),'m' );

  if( !_.regexpIs( o.postfix ) )
  o.postfix = RegExp( _.regexpEscape( o.postfix ),'m' );

  var src = o.src;

  //

  function columnEval( text )
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

/**
* @typedef {object} wTools~toStrInhalfOptions
* @property {string} [ o.src=null ] - Source string.
* @property {string | array} [ o.delimeter=' ' ] - Splitter of the string.
* @property {boolean} [ o.left=1 ] - Finds occurrence from begining of the string.
*/

/**
 * Finds occurrence of delimeter( o.delimeter ) in source( o.src ) and splits string in finded position by half.
 * If function finds  more then one occurrence, it separates string in the position of the last.
 *
 * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ "sample", "string" ]
 * _._strCutOff( { src : 'sample,string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ "sample", "string" ]
 *_._strCutOff( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ "sample string,name", "string" ]
 * _._strCutOff( { src : 'sample string,name string', delimeter : [ ',', ' ' ] } )
 *
 * @method _strCutOff
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a Array or String.
 * @throws { Exception } Throw an exception if( o ) is extended by uknown property.
 * @memberof wTools
 *
 */

function _strCutOff( o )
{
  var result = [];

  _.routineOptions( _strCutOff,o );
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( o.src ),'_strCutOff expects string ( o.src ), got',_.strTypeOf( o.src ) );
  _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
  _.assert( _.numberIs( o.number ) );

  var number = o.number;
  var delimeter
  var index = o.left ? -1 : o.src.length;

  /* */

  while( number > 0 )
  {

    index += o.left ? +1 : -1;

    if( _.arrayIs( o.delimeter ) )
    {

      if( !o.delimeter.length )
      return [ o.src,'' ];
      var s

      if( o.left )
      s = _.entityMin( o.delimeter,function( a )
      {

        var i = o.src.indexOf( a,index );
        if( i === -1 )
        return o.src.length;

        return i;
      });
      else
      s = _.entityMax( o.delimeter,function( a )
      {

        var i = o.src.lastIndexOf( a,index );
        if( i === -1 )
        return o.src.length;

        return i;
      });

      delimeter = s.element;
      index = s.value;

    }
    else
    {
      delimeter = o.delimeter;
      index = o.left ? o.src.indexOf( delimeter,index ) : o.src.lastIndexOf( delimeter,index );
    }

    /* */

    if( !( index >= 0 ) )
    return o.left ? [ '',o.src ] : [ o.src,'' ];

    number -= 1;

  }

  /* */

  result[ 0 ] = o.src.substring( 0,index );
  result[ 1 ] = o.src.substring( index + delimeter.length );

  return result;
}

_strCutOff.defaults =
{
  src : null,
  delimeter : ' ',
  left : 1,
  number : 1,
}

//

/**
 * Short-cut for _strCutOff function.
 * Finds occurrence of delimeter( o.delimeter ) from begining of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ "sample", "string" ]
 * _.strCutOffLeft( { src : 'sample,string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ "sample", "string" ]
 *_.strCutOffLeft( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ "sample string,name", "string" ]
 * _.strCutOffLeft( 'sample string,name string', ',' )
 *
 * @method strCutOffLeft
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */

function strCutOffLeft( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );

  if( arguments.length > 1 )
  {
    o = { src : arguments[ 0 ], delimeter : arguments[ 1 ], number : arguments[ 2 ] };
  }
  else
  {
    _.assert( arguments.length === 1 );
  }

  _.assertMapHasOnly( o,strCutOffLeft.defaults );

  o.left = 1;

  var result = _strCutOff( o );
  return result;
}

strCutOffLeft.defaults =
{
  src : null,
  delimeter : ' ',
  number : 1,
}

//

/**
 * Short-cut for _strCutOff function.
 * Finds occurrence of delimeter( o.delimeter ) from end of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ "sample", "string" ]
 * _.strCutOffRight( { src : 'sample,string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ "sample", "string" ]
 *_.strCutOffRight( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ "sample, ", "string" ]
 * _.strCutOffRight( { src : 'sample,  string', delimeter : [ ',', ' ' ] } )
 *
 * @method strCutOffRight
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */

function strCutOffRight( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );

  if( arguments.length > 1 )
  {
    o = { src : arguments[ 0 ], delimeter : arguments[ 1 ], number : arguments[ 2 ] };
  }
  else
  {
    _.assert( arguments.length === 1 );
  }

  _.assertMapHasOnly( o,strCutOffRight.defaults );

  o.left = 0;

  var result = _strCutOff( o );
  return result;
}

strCutOffRight.defaults =
{
  src : null,
  delimeter : ' ',
  number : 1,
}

//

function strCutOffAllLeft( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length > 1 )
  {
    o = { src : arguments[ 0 ], delimeter : arguments[ 1 ] };
  }
  else
  {
    _.assert( arguments.length === 1 );
  }

  _.assertMapHasOnly( o,strCutOffAllLeft.defaults );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strIs( o.delimeter ) );

  var i = o.src.lastIndexOf( o.delimeter );

  if( i === -1 )
  return [ '',o.src ];

  var result = [ o.src.substring( 0,i ),o.src.substring( i+o.delimeter.length,o.src.length ) ];

  return result;
}

strCutOffAllLeft.defaults =
{
  src : null,
  delimeter : ' ',
}

//

function strCutOffAllRight( o )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length > 1 )
  {
    o = { src : arguments[ 0 ], delimeter : arguments[ 1 ] };
  }
  else
  {
    _.assert( arguments.length === 1 );
  }

  _.assertMapHasOnly( o,strCutOffAllRight.defaults );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strIs( o.delimeter ) );

  var i = o.src.indexOf( o.delimeter );

  if( i === -1 )
  return [ o.src,'' ];

  var result = [ o.src.substring( 0,i ),o.src.substring( i+o.delimeter.length,o.src.length ) ];

  return result;
}

strCutOffAllRight.defaults =
{
  src : null,
  delimeter : ' ',
}

//

/**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a,b,c', delimeter : ',', stripping : 1 } ).
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
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a,b,c,d', delimeter : ','  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a.b,c.d', delimeter : [ '.', ',' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplit( { src : '    a,b,c,d   ', delimeter : [ ',' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ',', 'b', ',', 'c', ',', 'd' ]
 * _.strSplit( { src : 'a,b,c,d', delimeter : [ ',' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplit( { src : 'a ., b ., c ., d', delimeter : [ ',', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

function strSplit( o )
{

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], delimeter : arguments[ 1 ] };

  if( _.strIs( o ) )
  o = { src : o };

  _.mapSupplement( o,strSplit.defaults );
  _.assertMapHasOnly( o,strSplit.defaults );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( o.src ) );
  _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );

  var delimeter = _.arrayIs( o.delimeter ) ? o.delimeter : [ o.delimeter ];

  /* */

  function nextDelimeter( d,last )
  {
    if( last < 0 )
    return last;
    var result = o.src.lastIndexOf( delimeter[ d ],last );
    if( result >= 0 )
    result += delimeter[ d ].length;
    return result;
  }

  /* */

  if( o.preservingDelimeters )
  {

    var result = [];
    var right = [];
    var prevPosition = o.src.length;

    for( var s = 0 ; s < delimeter.length ; s++ )
    right[ s ] = nextDelimeter( s,o.src.length );

    while( true )
    {
      var splitterIndex = -1;
      var position = -1;
      for( var s = 0 ; s < delimeter.length ; s++ )
      {
        /* if one delimeter coontain another one, it's possible right is invalid at this point */
        if( right[ s ] >= prevPosition )
        {
          right[ s ] = nextDelimeter( s,prevPosition-delimeter[ s ].length );
        }
        if( right[ s ] > position )
        {
          splitterIndex = s;
          position = right[ s ];
        }
      }

      if( position === -1 )
      break;

      if( right[ splitterIndex ] > 0 )
      right[ splitterIndex ] = nextDelimeter( splitterIndex,right[ splitterIndex ]-delimeter[ splitterIndex ].length*2 );
      else
      right[ splitterIndex ] = -1;

      var r = [ position,prevPosition ];
      if( r[ 0 ] < r[ 1 ] )
      result.unshift( o.src.substring( r[ 0 ],r[ 1 ] ) );
      else if( o.preservingEmpty )
      result.unshift( '' );
      if( o.delimeter[ splitterIndex ].length || o.preservingEmpty )
      result.unshift( o.delimeter[ splitterIndex ] );

      prevPosition = position-o.delimeter[ splitterIndex ].length;

    }

    result.unshift( o.src.substring( 0,prevPosition ) );

  }
  else
  {

    var result = o.src.split( delimeter[ 0 ] );
    for( var s = 1 ; s < delimeter.length ; s++ )
    {

      for( var r = result.length-1 ; r >= 0 ; r-- )
      {

        var sub = result[ r ].split( delimeter[ s ] );
        if( sub.length > 1 )
        _.arrayCutin( result,[ r,r+1 ],sub );

      }

    }

  }

  /**/

  for( var r = result.length-1 ; r >= 0 ; r-- )
  {

    if( o.stripping )
    result[ r ] = strStrip( result[ r ] );
    if( !o.preservingEmpty )
    if( !result[ r ] )
    result.splice( r,1 );

  }

  return result;
}

strSplit.defaults =
{
  src : null,
  delimeter : ' ',
  stripping : 1,
  preservingEmpty : 0,
  preservingDelimeters : 0,
}

//

/**
 * Removes leading and trailing characters occurrences from source string( o.src ) finded by mask( o.stripper ).
 * If( o.stripper ) is not defined function removes leading and trailing whitespaces and escaped characters from( o.src ).
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : ' acb ', stripper : ' ' } ).
 *
 * @param {string|object} o - Source string to parse or map with source( o.src ) and options.
 * @param {string} [ o.src=null ]- Source string to strip.
 * @param {string|array} [ o.stripper=' ' ]- Contains characters to remove.
 * @returns {string} Returns result of removement in a string.
 *
 * @example
 * //returns "b"
 * _.strStrip( { src : 'aabaa', stripper : 'a' } );
 *
 * @example
 * //returns "b"
 * _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } )
 *
 * @example
 * //returns "b"
 * _.strStrip( { src : '   b  \n' } )
 *
 * @method strStrip
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o ) is not Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.stripper ) is not a String or Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

function strStrip( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStrip,o );
  _.assert( arguments.length === 1 );

  if( _.arrayIs( o.src ) )
  {
    var result = [];
    for( var s = 0 ; s < o.src.length ; s++ )
    {
      var optionsForStrip = _.mapExtend( {},o );
      optionsForStrip.src = optionsForStrip.src[ s ];
      result[ s ] = strStrip( optionsForStrip );
    }
    return result;
  }

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
 * Removes whitespaces from source( src ).
 * If argument( sub ) is defined, function replaces whitespaces with it.
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

function strRemoveAllSpaces( src,sub )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( src ) );

  if( sub === undefined )
  sub = '';

  return src.replace( /\s/g,sub );
}

//

/**
 * Removes empty lines from the string passed by argument( srcStr ).
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

function strStripEmptyLines( srcStr )
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

  result = result.substring( 0, result.length - 1 );
  return result;
}

//

function strIron()
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

/**
 * Replaces each occurrence of string( ins ) in source( dst ) with string( sub ).
 * Returns result of replacements as new string or original string if no matches finded in source( dst ).
 * Function can be called in three different ways:
 * - One argument: object that contains options: source( dst ) and dictionary.
 * - Two arguments: source string( dst ), map( dictionary ).
 * - Three arguments: source string( dst ), pattern string( ins ), replacement( sub ).
 * @param {string} dst - Source string to parse.
 * @param {string} ins - String to find in source( dst ).
 * @param {string} sub - String that replaces finded occurrence( ins ).
 * @param {object} dictionary - Map that contains pattern/replacement pairs like ( { 'ins' : 'sub' } ).
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //one argument
 * //returns xbc
 * _.strReplaceAll( { dst : 'abc', dictionary : { 'a' : 'x' } } );
 *
 * @example
 * //two arguments
 * //returns a12
 * _.strReplaceAll( 'abc',{ 'a' : '1', 'b' : '2' } );
 *
 * @example
 * //three arguments
 * //returns axc
 * _.strReplaceAll( 'abc','b','x' );
 *
 * @method strReplaceAll
 * @throws { Exception } Throws a exception if no arguments provided.
 * @throws { Exception } Throws a exception if( dst ) is not a String.
 * @throws { Exception } Throws a exception if( ins ) is not a String.
 * @throws { Exception } Throws a exception if( sub ) is not a String.
 * @throws { Exception } Throws a exception if( dictionary ) is not a Object.
 * @throws { Exception } Throws a exception if( dictionary ) key value is not a String.
 * @memberof wTools
 *
 */

function strReplaceAll( dst, ins, sub )
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
    if( !ins.length ) continue;
    _.assert( _.strIs( o.dictionary[ ins ] ), 'strReplaceAll : expects dictionary values only as strings' );

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

/**
 * Replaces occurrence of each word from array( ins ) in string( src ) with word
 * from array( sub ) considering it position.
 * @param {string} src - Source string to parse.
 * @param {array} ins - Array with strings to replace.
 * @param {string} sub - Array with new strings.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns " your cars are"
 * _.strReplaceNames( ' my name is',[ 'my','name','is' ],[ 'your','cars','are' ] )
 *
 * @method strReplaceNames
 * @throws { Exception } Throws a exception if( ins ) is not a Array.
 * @throws { Exception } Throws a exception if( sub ) is not a Array.
 * @throws { TypeError } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
 * @memberof wTools
 *
 */

function strReplaceNames( src,ins,sub )
{
  _.assert( arguments.length === 3 );
  _.assert( _.strIs( src ) );
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

/**
 * Joins objects from arguments list together by concatenating their values in orded that they are specified.
 * Function works with strings,numbers and arrays. If any arrays are provided they must have same length.
 * Joins arrays by concatenating all elements with same index into one string and puts it into new array at same position.
 * Joins array with other object by concatenating each array element with that object value. Examples: ( [ 1, 2 ], 3 ) -> ( [ "13", "23" ] ),
 * ( [ 1, 2 ], [ 1, 2] ) -> ( [ "11", "23" ] ).
 *
 * @param {array-like} arguments - Contains provided objects.
 * @returns {object} Returns concatenated objects as string or array. Return type depends from arguments type.
 *
 * @example
 * //returns "123"
 * _.strJoin( 1, 2, 3 );
 *
 * @example
 * //returns [ "12", "22", "32" ]
 * _.strJoin( [ 1, 2, 3 ], 2 );
 *
 * @example
 * //returns [ "11", "23" ]
 * _.strJoin( [ 1, 2 ], [ 1, 3 ] );
 *
 * @example
 * //returns [ "1236", "1247", "1258" ]
 * _.strJoin( 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] );
 *
 * @method strJoin
 * @throws { Exception } If some object from( arguments ) is not a Array, String or Number.
 * @throws { Exception } If length of arrays passed as arguments is different.
 * @memberof wTools
 *
 */

function strJoin()
{
  var result = [ '' ];
  var arrayEncountered = 0;
  var arrayLength;

  function join( s,src )
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
      arrayLength = src.length;

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

function strConcat()
{

  var o = _.routineOptionsFromThis( strConcat,this,Self );

  o.optionsForToStr = _.mapSupplement( {},o.optionsForToStr,strConcat.defaults.optionsForToStr );

  var result = '';
  if( !arguments.length )
  return result;

  /* */

  var nl = 1;
  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    src = _.toStr( src,o.optionsForToStr );
    if( !nl )
    {
      var i = src.lastIndexOf( o.lineDelimter );
      if( i === -1 )
      {
        result += o.delimeter;
      }
      else
      {
        if( i !== 0 )
        result += o.lineDelimter;
      }
    }
    if( src.length )
    nl = src[ src.length-1 ] === o.lineDelimter;
    result += src;
  }

  /* */

  if( o.linePrefix || o.linePostfix )
  {
    result = result.split( o.lineDelimter );
    result = o.linePrefix + result.join( o.linePostfix + o.lineDelimter + o.linePrefix ) + o.linePostfix;
  }

  /* */

  return result;
}

strConcat.defaults =
{
  linePrefix : '',
  linePostfix : '',
  lineDelimter : '\n',
  delimeter : ' ',
  optionsForToStr :
  {
    stringWrapper : '',
  },
}

//

/**
 * Splits string( srcStr ) into parts using array( maskArray ) as mask and returns them as array.
 * Mask( maskArray ) contains string(s) separated by marker( strUnjoin.any ). Mask must starts/ends with first/last letter from source
 * or can be replaced with marker( strUnjoin.any ). Position of( strUnjoin.any ) determines which part of source string will be splited:
 * - If( strUnjoin.any ) is before string it marks everything before that string. Example: ( [ _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is after string it marks everything after that string. Example: ( [ 'prefix', _.strUnjoin.any ] ).
 * - If( strUnjoin.any ) is between two strings it marks everything between them. Example: ( [ 'prefix', _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is before and after string it marks all except that string. Example: ( [ '_.strUnjoin.any', something, '_.strUnjoin.any' ] ).
 *
 * @param {string} srcStr - Source string.
 * @param {array} maskArray - Contains mask for source string.
 * @returns {array} Returns array with unjoined string part.
 *
 * @example
 * //returns [ "prefix", "_something_", "postfix" ]
 * _.strUnjoin( 'prefix_something_postfix',[ 'prefix', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ "prefix_", "something", "_", "postfix" ]
 * _.strUnjoin( 'prefix_something_postfix',[ _.strUnjoin.any, 'something', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ "prefix_something_", "postfix" ]
 * _.strUnjoin( 'prefix_something_postfix',[ _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ "prefix", "_something_postfix" ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any ] );
 *
 * @example
 * //returns [ "prefi", "x", "_something_", "p", "ostfix" ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'x', _.strUnjoin.any, 'p', _.strUnjoin.any ] );
 *
 * @method strUnjoin
 * @throws { Exception } If no arguments provided.
 * @throws { Exception } If( srcStr ) is not a String.
 * @throws { Exception } If( maskArray ) is not a Array.
 * @throws { Exception } If( maskArray ) value is not String or strUnjoin.any.
 * @memberof wTools
 *
 */

function strUnjoin( srcStr,maskArray )
{

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.arrayIs( maskArray ) );

  var result = [];
  var index = 0;
  var rindex = -1;

  // if( 1 )
  // {
  //
  //   function experiment()
  //   {
  //     console.log( 'experiment 1' );
  //   }
  //
  //   function experiment()
  //   {
  //     console.log( 'experiment 2' );
  //   }
  //
  // }
  //
  // experiment();

  /**/

  function checkToken()
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

  function checkMask( mask )
  {

    _.assert( _.strIs( mask ) || _.routineIs( mask ),'expects string or strUnjoin.any, got',_.strTypeOf( mask ) );

    if( _.strIs( mask ) )
    {
      index = srcStr.indexOf( mask,index );

      if( index === -1 )
      return false;

      if( rindex === -1 && index !== 0 )
      return false;

      checkToken();

      result.push( mask );
      index += mask.length;

    }
    else if( mask === strUnjoin.any )
    {
      rindex = index;
    }
    else throw _.err( 'strUnjoin : unexpected mask' );

    return true;
  }

  /**/

  for( var m = 0 ; m < maskArray.length ; m++ )
  {

    var mask = maskArray[ m ];

    if( !checkMask( mask ) )
    return;

  }

  if( rindex !== -1 )
  {
    index = srcStr.length;
    if( !checkToken() )
    return;
  }

  if( index !== srcStr.length )
  return;

  /**/

  return result;
}

strUnjoin.any = function any(){}

//

/**
 * Finds common symbols from the begining of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have same first symbol with pattern( ins ) function returns empty string.
 * Otherwise returns symbol sequence that appears from the start of each string.
 *
 * @param {string} ins - Sequence of possible symbols.
 * @returns {string} Returns found common symbols.
 *
 * @example "a"
 * _.strCommonLeft( 'abcd', 'ab', 'abc', 'a' );
 *
 * @example "abc"
 * _.strCommonLeft( 'abcd', 'abc', 'abcd' );
 *
 * @example ""
 * _.strCommonLeft( 'abcd', 'abc', 'd' )
 *
 * @method strCommonLeft
 * @throws {exception} If( ins ) is not a String.
 * @memberof wTools
 *
 */

function strCommonLeft( ins )
{

  if( arguments.length === 0 )
  return '';
  if( arguments.length === 1 )
  return ins;

  _.assert( _.strIs( ins ) );

  var length = +Infinity;

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    length = Math.min( length,src.length );
  }

  for( var i = 0 ; i < length ; i++ )
  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    if( src[ i ] !== ins[ i ] )
    return ins.substring( 0,i );
  }

  return ins.substring( 0,i );
}

//

/**
 * Finds common symbols from the end of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have same last symbol with pattern( ins ) function returns empty string.
 * Otherwise returns symbol sequence that appears from the end of each string.
 *
 * @param {string} ins - Sequence of possible symbols.
 * @returns {string} Returns found common symbols.
 *
 * @example "ame"
 * _.strCommonRight( 'ame', 'same', 'name' );
 *
 * @example "c"
 * _.strCommonRight( 'abc', 'dbc', 'ddc', 'aac' );
 *
 * @example ""
 * _.strCommonRight( 'abc', 'dba', 'abc' );
 *
 * @method strCommonRight
 * @throws {exception} If( ins ) is not a String.
 * @memberof wTools
 *
 */

function strCommonRight( ins )
{

  if( arguments.length === 0 )
  return '';
  if( arguments.length === 1 )
  return ins;

  _.assert( _.strIs( ins ) );

  var length = +Infinity;

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    length = Math.min( length,src.length );
  }

  for( var i = 0 ; i < length ; i++ )
  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];
    if( src[ src.length - i - 1 ] !== ins[ ins.length - i - 1 ] )
    return ins.substring( ins.length-i );
  }

  return ins.substring( ins.length-i );
}

//

// /**
//  * Finds substring( prefix ) occurrence from the begining of the source( src ) and removes it.
//  * Returns original string if source( src ) does not have occurrence of ( prefix ).
//  *
//  * @param {string} src - Source string to parse.
//  * @param {string} prefix - String that is to be dropped.
//  * @returns {string} Returns string with result of prefix removement.
//  *
//  * @example
//  * //returns mple
//  * _.strRemoveBegin( 'example','exa' );
//  *
//  * @example
//  * //returns example
//  * _.strRemoveBegin( 'example','abc' );
//  *
//  * @method strRemoveBegin
//  * @throws { Exception } Throws a exception if( src ) is not a String.
//  * @throws { Exception } Throws a exception if( prefix ) is not a String.
//  * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
//  * @memberof wTools
//  *
//  */
//
// function strRemoveBegin( src,prefix )
// {
//   _.assert( _.strIs( src ) );
//   _.assert( _.strIs( prefix ) );
//   _.assert( arguments.length === 2 );
//
//   if( src.indexOf( prefix ) !== -1 )
//   return src.substr( prefix.length,src.length-prefix.length );
//   else return src;
// }
//
// //
//
// /**
//  * Removes occurrence of( postfix ) from the end of string( src ).
//  * Returns original string if no occurrence finded.
//  * @param {string} src - Source string to parse.
//  * @param {string} postfix - String that is to be dropped.
//  * @returns {string} Returns string with result of postfix removement.
//  *
//  * @example
//  * //returns examp
//  * _.strRemoveEnd( 'example','le' );
//  *
//  * @example
//  * //returns example
//  * _.strRemoveEnd( 'example','abc' );
//  *
//  * @method strRemoveEnd
//  * @throws { Exception } Throws a exception if( src ) is not a String.
//  * @throws { Exception } Throws a exception if( postfix ) is not a String.
//  * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
//  * @memberof wTools
//  *
//  */
//
// function strRemoveEnd( src,postfix )
// {
//
//   _.assert( _.strIs( src ) );
//   _.assert( _.strIs( postfix ) );
//   _.assert( arguments.length === 2 );
//
//   var l = src.length - postfix.length;
//
//   if( src.length > postfix.length && src.lastIndexOf( postfix ) === l )
//   return src.substr( 0,l );
//   else return src;
// }

//

function strDifference( src1,src2,o )
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

function strSimilarity( src1,src2,o )
{
  _assert( _.strIs( src1 ) );
  _assert( _.strIs( src2 ) );

  var latter = [ _.strLattersSpectre( src1 ),_.strLattersSpectre( src2 ) ];
  var result = _.lattersSpectreComparison( latter[ 0 ],latter[ 1 ] );
  return result;
}

//

function strLattersSpectre( src )
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

function lattersSpectreComparison( src1,src2 )
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
 * Replaces all occurrences of html escape symbols from map( _strHtmlEscapeMap )
 * in source( str ) with their code equivalent like( '&' -> '&amp;' ).
 * Returns result of replacements as new string or original if nothing replaced.
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
 * @example
 * //returns &amp;,&lt;
 * _.strHtmlEscape( ['&','<'] );
 *
 * @example
 * //returns &lt;div class=&quot;cls&quot;&gt;&lt;&#x2F;div&gt;
 * _.strHtmlEscape('<div class="cls"></div>');
 *
 * @method strHtmlEscape
 * @throws { Exception } Throws a exception if no argument provided.
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

function strHtmlEscape( str )
{
  _.assert( arguments.length === 1 );

  return String( str ).replace( /[&<>"'\/]/g, function( s )
  {
    return _strHtmlEscapeMap[ s ];
  });
}

//

/**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( "world" );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */

function strUnicodeEscape( src )
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
 * Appends indentation character passed by the second argument( tab ) before first
 * and every next new line in a source string( src ).
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
 * @throws { Exception } Throw an exception if( arguments.length ) is not a equal 2.
 * @memberof wTools
 *
 */

function strIndentation( src,tab )
{

  _assert( _.strIs( src ) || _.arrayIs( src ),'strIndentation : expects string src' );
  _assert( _.strIs( tab ),'strIndentation : expects string tab' );
  _assert( arguments.length === 2,'strIndentation : expects two arguments' );

  if( _.strIs( src ) )
  {

    if( src.indexOf( '\n' ) === -1 )
    return tab + src;

    src = src.split( '\n' );

  }

  var result = tab + src.join( '\n' + tab );

  return result;
}

//

// !!! pelase update description

/**
 * Puts line counter before each line in the string provided by( o.src ).
 * Initial value of a counter can be changed by defining( o.first ) options( o ) property.
 * Can be called in two ways:
 * - First by passing all options in one object;
 * - Second by passing source string only.
 *
 * @param {object} o - options.
 * @param {string} [ o.src=null ] - source string.
 * @param {number} [ o.first=1 ] - sets initial value of a counter.
 * @returns {string} Returns string with line enumeration.
 *
 * @example
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 * _.strLinesNumber( 'line1\nline2\nline3' );
 *
 * @example
 * //returns
 * // 2: line1
 * // 3: line2
 * // 4: line3
 * _.strLinesNumber( { src:'line1\nline2\nline3', first : 2 } );
 *
 * @method strLinesNumber
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 */

function strLinesNumber( o )
{

  if( !_.objectIs( o ) )
  o = { src : arguments[ 0 ], first : arguments[ 1 ] };

  _.routineOptions( strLinesNumber,o );
  _assert( arguments.length === 1 || arguments.length === 2 );
  _assert( _.strIs( o.src ) || _.arrayIs( o.src ),'strLinesNumber : expects string o.src' );

  var lines = _.strIs( o.src ) ? o.src.split( '\n' ) : o.src;

  for( var l = 0; l < lines.length; l += 1 )
  {

    lines[ l ] = ( l + o.first ) + ' : ' + lines[ l ];

  }

  return lines.join( '\n' );
}

strLinesNumber.defaults =
{
  src : null,
  first : 1,
}

//

// function strLinesAt( code,line,radius )
// {
//   _.assert( arguments.length === 3 );
//   _.assert( _.strIs( code ) || _.arrayIs( code ) );
//   _.assert( _.numberIs( line ) );
//
//   if( radius === undefined )
//   radius = 2;
//
//   debugger;
//
//   var lines = code.split( '\n' );
//   var result = lines.slice( line-radius,line+radius-1 );
//   result = _.strLinesNumber( result,line-radius+1 );
//
//   return result;
// }

//

/**
 * Selects range( o.range ) of lines from source string( o.src ).
 * Custom new line character can be defined by option( o.nl ).
 * Returns selected lines range as string or undefined.
 * Can be called in three ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 * - Third by passing source string( o.src ), range start and end position.
 *
 * @param {object} o - options.
 * @param {string} [ o.src=null ] - source string.
 * @param {array|number} [ o.range=null ] - sets range of lines to select from( o.src ) or single line number.
 * @param {string} [ o.nl='\n' ] - sets new line character.
 * @returns {string} Returns selected lines as new string.
 *
 * @example
 * //returns
 * // line1
 * // line2
 * _.strLinesSelect( 'line1\nline2\nline3', 0, 2 );
 *
 * @example
 * //returns
 * // line2
 * _.strLinesSelect( 'line1\nline2\nline3', 1 );
 *
 * @example
 * //returns
 * // line1
 * _.strLinesSelect( { src : 'line1\nline2\nline3', range : [ 0,1 ] } )
 *
 * @method strLinesSelect
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.range ) is not a Array.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */

function strLinesSelect( o )
{

  if( arguments.length === 2 )
  {

    if( _.arrayIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : arguments[ 1 ] };
    else if( _.numberIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ],arguments[ 1 ]+1 ] };
    else throw _.err( 'unexpected argument',_.strTypeOf( range ) );

  }
  else if( arguments.length === 3 )
  {
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ],arguments[ 2 ] ] };
  }

  _.assert( arguments.length <= 3 );
  _.assert( _.strIs( o.src ) );
  _.routineOptions( strLinesSelect,o );

  /* range */

  if( !o.range )
  {
    if( o.line )
    {
      if( o.selectMode === 'center' )
      o.range = [ o.line - Math.ceil( ( o.numberOfLines + 1 ) / 2 ) + 1,o.line + Math.floor( ( o.numberOfLines - 1 ) / 2 ) + 1 ];
      else if( o.selectMode === 'begin' )
      o.range = [ o.line,o.line + o.numberOfLines ];
      else if( o.selectMode === 'end' )
      o.range = [ o.line - o.numberOfLines+1,o.line+1 ];
    }
    else
    {
      o.range = [ 0,_.strCount( o.src,o.nl )+1 ];
    }
  }

  _.assert( _.arrayLike( o.range ) );

  /* */

  var f = 0;
  var counter = o.zero;
  while( counter < o.range[ 0 ] )
  {
    f = o.src.indexOf( o.nl,f );
    if( f === -1 )
    return '';
    f += 1;
    counter += 1;
  }

  /* */

  var l = f-1;
  while( counter < o.range[ 1 ] )
  {
    l += 1;
    l = o.src.indexOf( o.nl,l );
    if( l === -1 )
    {
      l = o.src.length;
      break;
    }
    counter += 1;
  }

  /* */

  var result = o.src.substring( f,l );

  /* number */

  if( o.number )
  result = _.strLinesNumber( result,o.range[ 0 ] );

  return result;
}

strLinesSelect.defaults =
{
  src : null,
  range : null,

  line : null,
  numberOfLines : 3,
  selectMode : 'center',

  number : 0,
  zero : 1,
  nl : '\n',
}

// debugger;
// var a = '1\n\n3\n4';
// var l = strLinesSelect( a,[ 0,1 ] );
// var l = strLinesSelect( a,[ 1,2 ] );
// var l = strLinesSelect( a,[ 2,3 ] );
// var l = strLinesSelect( a,[ 3,4 ] );
// debugger;
//
// var l = strLinesSelect( a,[ 4,5 ] );
// var l = strLinesSelect( a,[ -1,0 ] );
// var l = strLinesSelect( a,[ -1,1 ] );
// var l = strLinesSelect( a,[ -1,2 ] );
//
// var l = strLinesSelect( a,[ 0,2 ] );
// var l = strLinesSelect( a,[ 1,3 ] );
// var l = strLinesSelect( a,[ 2,4 ] );
// var l = strLinesSelect( a,[ 2,5 ] );
// var l = strLinesSelect( a,[ 3,5 ] );
// debugger;

//

/**
 * Returns number of occurrences of a substring( ins ) in a string( src ),
 * Expects two objects in order: source string, substring.
 * Returns zero if one of arguments is empty string.
 *
 * @param {string} src - Source string.
 * @param {string} ins - Substring.
 * @returns {Number} Returns number of occurrences of a substring in a string.
 *
 * @example
 * //returns 2
 * _.strCount( "aaaabab","ab" );
 *
 * @example
 * //returns 0
 * _.strCount( "aaaabab","" );
 *
 * @method strCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( ins ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strCount( src,ins )
{
  var result = -1;

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );
  _.assert( _.strIs( ins ) );

  if( !ins.length )
  return 0;

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

function strCountLeft( src,ins )
{
  var result = 0;

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );
  _.assert( _.strIs( ins ) );

  if( !ins.length )
  return 0;

  var i = 0;
  do
  {
    if( src.substring( i,i+ins.length ) !== ins )
    break;
    result += 1;
    i += ins.length;
  }
  while( i < src.length );

  return result;
}

//

function strCountRight( src,ins )
{
  var result = 0;

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );
  _.assert( _.strIs( ins ) );

  throw _.err( 'not tested' );

  if( !ins.length )
  return 0;

  var i = src.length;
  do
  {
    if( src.substring( i-ins.length,i ) !== ins )
    break;
    result += 1;
    i -= ins.length;
  }
  while( i > 0 );

  return result;
}

//

/**
 * Returns source string( src ) repeated specified number( times ) of times.
 * If source( src ) has zero length or ( times <= 0 ) returns empty string.
 *
 * @param {string} src - Source string.
 * @param {number} times - Number of duplicates.
 * @returns {string} Returns string duplicated n-times.
 *
 * @example
 * //returns aaaaa
 * _.strDup( "a", 5 );
 *
 * @example
 * //returns abcabc
 * _.strDup( "abc", 2 );
 *
 * @example
 * //returns ''
 * _.strDup( "abc", 0 );
 *
 * @method strDup
 * @throws { Exception } If( src ) is not a String.
 * @throws { Exception } If( times ) is not a Number.
 * @throws { Exception } If( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

function strDup( src,times )
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
 * Converts string to camelcase using special pattern.
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
 * @throws { Exception } Throws a exception if( srcStr ) is not a String.
 * @throws { Exception } Throws a exception if no argument provided.
 * @memberof wTools
 *
 */

function strCamelize( srcStr )
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
 * Removes invalid characters from filename passed as first( srcStr ) argument by replacing characters finded by
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
 * @throws { Exception } Throws a exception if( srcStr ) is not a String.
 * @throws { Exception } Throws a exception if( o ) is not a Map.
 * @throws { Exception } Throws a exception if no arguments provided.
 * @memberof wTools
 *
 */

function strFilenameFor( srcStr,o )
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
 * Converts string( str ) to array of unsigned 8-bit integers.
 *
 * @param {string} str - Source string to convert.
 * @returns {typedArray} Returns typed array that represents string characters in 8-bit unsigned integers.
 *
 * @example
 * //returns [ 101, 120, 97, 109, 112, 108, 101 ]
 * _.strToBytes( 'example' );
 *
 * @method strToBytes
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if no argument provided.
 * @memberof wTools
 *
 */

function strToBytes( src )
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

/**
 * Returns string that represents number( src ) with metric unit prefix that depends on options( o ).
 * If no options provided function start calculating metric with default options.
 * Example: for number ( 50000 ) function returns ( "50.0 k" ), where "k"- thousand.
 *
 * @param {(number|string)} src - Source object.
 * @param {object} o - conversion options.
 * @global {object} _metrics - Contains metric prefixes.
 * @param {number} [ o.divisor=3 ] - Sets count of number divisors.
 * @param {number} [ o.thousand=1000 ] - Sets integer power of one thousand.
 * @param {boolean} [ o.fixed=1 ] - The number of digits to appear after the decimal point, example : [ '58912.001' ].
 * Number must be between 0 and 20.
 * @param {number} [ o.dimensions=1 ] - Sets exponent of a number.
 * @param {number} [ o.metric=0 ] - Sets the metric unit type from the map( _metrics ).
 * @returns {string} Returns number with metric prefix as a string.
 *
 * @example
 * //returns "1.0 M"
 * _.strMetricFormat( 1, { metric : 6 } );
 *
 * @example
 * //returns "100.0 "
 * _.strMetricFormat( "100m", { } );
 *
 * @example
 * //returns "100.0 T
 * _.strMetricFormat( "100m", { metric : 12 } );
 *
 * @example
 * //returns "2 k"
 * _.strMetricFormat( "1500", { fixed : 0 } );
 *
 * @example
 * //returns "1.0 M"
 * _.strMetricFormat( "1000000",{ divisor : 2, thousand : 100 } );
 *
 * @example
 * //returns "10.0 h"
 * _.strMetricFormat( "10000", { divisor : 2, thousand : 10, dimensions : 3 } );
 *
 * @method strMetricFormat
 * @memberof wTools
 *
 */

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

function strMetricFormat( number,o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

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

/**
 * Short-cut for strMetricFormat() function.
 * Converts number( number ) to specific count of bytes with metric prefix.
 * Example: ( 2048 -> 2.0 kb).
 *
 * @param {(string|number} str - Source number to  convert.
 * @param {object} o - conversion options.
 * @param {number} [ o.divisor=3 ] - Sets count of number divisors.
 * @param {number} [ o.thousand=1024 ] - Sets integer power of one thousand.
 * @see {@link wTools.strMetricFormat} Check out main function for more usage options and details.
 * @returns {string} Returns number of bytes with metric prefix as a string.
 *
 * @example
 * //returns "100.0 b"
 * _.strMetricFormatBytes( 100 );
 *
 * @example
 * //returns "4.0 kb"
 * _.strMetricFormatBytes( 4096 );
 *
 * @example
 * //returns "1024.0 Mb"
 * _.strMetricFormatBytes( Math.pow( 2, 30 ) );
 *
 * @method strMetricFormatBytes
 * @memberof wTools
 *
 */

function strMetricFormatBytes( number,o )
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

/**
 * Short-cut for strMetricFormat() function.
 * Converts number( number ) to specific count of seconds with metric prefix.
 * Example: ( 1000 (ms) -> 1.000 s).
 *
 * @param {number} str - Source number to  convert.
 * @param {number} [ o.fixed=3 ] - The number of digits to appear after the decimal point, example : [ '58912.001' ].
 * Can`t be changed.
 * @see {@link wTools.strMetricFormat} Check out main function for more usage options and details.
 * @returns {string} Returns number of seconds with metric prefix as a string.
 *
 * @example
 * //returns "1.000 s"
 * _.strTimeFormat( 1000 );
 *
 * @example
 * //returns "10.000 ks"
 * _.strTimeFormat( Math.pow( 10, 7 ) );
 *
 * @example
 * //returns "78.125 s"
 * _.strTimeFormat( Math.pow( 5, 7 ) );
 *
 * @method strTimeFormat
 * @memberof wTools
 *
 */

function strTimeFormat( time )
{
  var result = strMetricFormat( time*0.001,{ fixed : 3 } ) + 's';
  return result;
}

//

function strExtractStrips( src, o )
{
  _.assert( _.strIs( src ) );
  _.assert( _.objectIs( o ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.routineOptions( strExtractStrips, o );

  var result = [];
  var splitted = src.split( o.delimeter );
  var isNextStrip = 0;
  var isPrevStrip = 0;

  /* */

  for( var i = 0; i < splitted.length; i++ )
  {

    if( !isNextStrip )
    {
      isNextStrip = 1;
      if( splitted[ i ] )
      {
        isPrevStrip = 0;
        result.push( splitted[ i ] );
      }
      continue;
    }

    var strip = o.onStrip ? o.onStrip( splitted[ i ] ) : splitted[ i ];
    if( strip !== undefined )
    {
      isNextStrip = 0;
      isPrevStrip = 1;
      result.push( strip );
    }
    else
    {
      if( !isPrevStrip && result.length > 0 )
      result[ result.length-1 ] += o.delimeter + splitted[ i ];
      else
      result.push( o.delimeter + splitted[ i ] );
      isNextStrip = 1;
      isPrevStrip = 0;
    }

  }

  return result;
}

strExtractStrips.defaults =
{
  delimeter : '#',
  onStrip : null
}

//

/**
 * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) separators
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
 *
 * Returns result as array of strings.
 *
 * Function extracts words in two attempts:
 * First by splitting source string by ( o.prefix ).
 * Second by splitting each element of the result of first attempt by( o.postfix ).
 * If splitting by ( o.prefix ) gives only single element then second attempt is skipped,otherwise function
 * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onStrip ) function on first half.
 * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
 * with ( o.prefix ) prepended to the last element of result array.
 *
 * @param {string} src - Source string.
 * @param {object} o - Options map.
 * @param {string} [ o.prefix = '#' ] - delimeter that marks begining of enclosed string
 * @param {string} [ o.postfix = '#' ] - delimeter that marks ending of enclosed string
 * @param {string} [ o.onStrip = null ] - function called on each splitted part of a source string
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strExtractStereoStrips( '#abc#' );
 * //returns [ '', 'abc', '' ]
 *
 * @example
 * _.strExtractStereoStrips.call( { prefix : '#', postfix : '$' }, '#abc$' );
 * //returns [ 'abc' ]
 *
 * @example
 * function onStrip( strip )
 * {
 *   if( strip.length )
 *   return strip.toUpperCase();
 * }
 * _.strExtractStereoStrips.call( { postfix : '$', onStrip : onStrip }, '#abc$' );
 * //returns [ 'ABC' ]
 *
 * @method strExtractStereoStrips
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */

function strExtractStereoStrips( src )
{

  var o = this !== Self ? this : {};

  _.assert( _.strIs( src ) );
  _.assert( _.objectIs( o ) );
  _.assert( arguments.length === 1 );
  //_.assert( arguments.length === 1 || arguments.length === 2 );
  _.routineOptions( strExtractStereoStrips, o );

  var result = [];
  var splitted = src.split( o.prefix );

  /* */

  if( splitted[ 0 ] )
  result.push( splitted[ 0 ] );

  /* */

  for( var i = 1; i < splitted.length; i++ )
  {

    var halfs = strCutOffLeft( splitted[ i ],o.postfix );
    var strip = o.onStrip ? o.onStrip( halfs[ 0 ] ) : halfs[ 0 ];

    if( strip !== undefined )
    {
      result.push( strip );
      if( halfs[ 1 ] )
      result.push( halfs[ 1 ] );
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

strExtractStereoStrips.defaults =
{
  prefix : '#',
  postfix : '#',
  onStrip : null
}

//

function strCsvFrom( src,o )
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
      if( element.indexOf( o.rowSeparator ) !== -1 )
      element = _.strReplaceAll( element,o.rowSeparator,o.substitute );
      if( element.indexOf( o.cellSeparator ) !== -1 )
      element = _.strReplaceAll( element,o.cellSeparator,o.substitute );

      rowString += element + o.cellSeparator;

    });

    result += rowString.substr( 0,rowString.length-o.cellSeparator.length ) + o.rowSeparator;

  });

  return result;
}

//

function strToDom( xmlStr )
{

  var xmlDoc = null;
  var isIEParser = window.ActiveXObject || "ActiveXObject" in window;

  if( xmlStr === undefined ) return xmlDoc;

  if( window.DOMParser )
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

//

function strParseMap( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o }

  _.routineOptions( strParseMap,o );
  _.assert( _.strIs( o.entryDelimeter ) );

  var src = o.src;

  if( _.strIs( src ) )
  src = _.strSplit({ src : src, delimeter : o.valKeyDelimeter, stripping : 1 });

  var result = Object.create( null );
  for( var a = 1 ; a < src.length ; a++ )
  {
    var left = src[ a-1 ];
    var right = src[ a+0 ];
    var val = right;

    if( a < src.length - 1 )
    {
      var cuts = _.strCutOffAllLeft( right,o.entryDelimeter );
      var val = cuts[ 0 ];
      src[ a+0 ] = cuts[ 1 ];
    }

    if( !isNaN( parseFloat( val ) ) )
    val = parseFloat( val );

    result[ left ] = val;
  }

  return result;
}

strParseMap.defaults =
{
  src : null,
  valKeyDelimeter : ':',
  entryDelimeter : ' ',
}

// --
// str color
// --

function strColorBackground( str, color )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( arguments[ 1 ] === undefined )
  return _strColorBackgroundFor( arguments[ 0 ] );
  else
  return _strColorBackgroundFormat( arguments[ 0 ],arguments[ 1 ] );
}

//

function _strColorBackgroundFor( color )
{
  var result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( color ) );

  result.pre = `#background : ${color}#`;
  result.post = `#background : default#`;

  return result;
}

//

function _strColorBackgroundFormat( str, color )
{

  if( _.numberIs( color ) )
  color = _.color.colorNameNearest( color );

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( str ) );
  _.assert( _.strIs( color ) );

  return `#background : ${color}#${str}#background : default#`;
}

//

function strColorForeground( str, color )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( arguments[ 1 ] === undefined )
  return _strColorForegroundFor( arguments[ 0 ] );
  else
  return _strColorForegroundFormat( arguments[ 0 ],arguments[ 1 ] );
}

//

function _strColorForegroundFor( color )
{
  var result = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( color ) );

  result.pre = `#foreground : ${color}#`;
  result.post = `#foreground : default#`;

  return result;
}

//

function _strColorForegroundFormat( str, color )
{

  if( _.numberIs( color ) )
  color = _.color.colorNameNearest( color );

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( str ) );
  _.assert( _.strIs( color ) );

  return `#foreground : ${color}#${str}#foreground : default#`;
}

//

function strColorStyle( str, style )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( arguments[ 1 ] === undefined )
  return _strColorStyleFor( arguments[ 0 ] );
  else
  return _strColorStyleFormat( arguments[ 0 ],arguments[ 1 ] );
}

//

function _strColorStyleFormat( str, style )
{
  var result = str;

  if( _.arrayIs( result ) )
  result = _.strConcat.apply( _,result );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( result ),'expects string got',_.strTypeOf( result ) );

  var r = _strColorStyleFor( style );

  result = r.pre + result + r.post;

  return result;
}

//

function _strColorStyleFor( style )
{
  var result = Object.create( null );
  result.pre = '';
  result.post = '';

  var StyleObjectOptions =
  {
    fg : null,
    bg : null,
  }

  var style = _.arrayAs( style );

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( style ) ,'expects string or array of strings ( style )' );

  function join()
  {
    for( var a = 1 ; a < arguments.length ; a++ )
    {
      arguments[ 0 ].pre = arguments[ a ].pre + arguments[ 0 ].pre;
      arguments[ 0 ].post = arguments[ 0 ].post + arguments[ a ].post;
    }
    return arguments[ 0 ];
  }

  for( var s = 0 ; s < style.length ; s++ )
  {

    if( _.objectIs( style[ s ] ) )
    {
      var obj = style[ s ];
      _.assertMapHasOnly( obj,StyleObjectOptions );
      if( obj.fg )
      result = join( result,_.strColor.fg( obj.fg ) );
      if( obj.bg )
      result = join( result,_.strColor.bg( obj.bg ) );

      continue;
    }

    _.assert( _.strIs( style[ s ] ) ,'expects string or array of strings ( style )' );
    switch( style[ s ] )
    {

      case 'positive' :
        result = join( result,_.strColor.fg( 'green' ) );
        break;

      case 'negative' :
        result = join( result,_.strColor.fg( 'red' ) );
        break;

      case 'topic' :
        result = join( result,_.strColor.fg( 'dim' ) );
        break;

      case 'head' :
        result = join( result,_.strColor.fg( 'dim' ),_.strColor.bg( 'smoke' ) );
        break;

      case 'tail' :
        result = join( result,_.strColor.fg( 'smoke' ),_.strColor.bg( 'dim' ) );
        break;

      case 'selected' :
        result = join( result,_.strColor.fg( 'yellow' ),_.strColor.bg( 'blue' ) );
        break;

      case 'neutral' :
        result = join( result,_.strColor.fg( 'smoke' ),_.strColor.bg( 'dim' ) );
        break;

      default :
        throw _.err( '_strColorStyleFor : unknown style : ' + style );

    }

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

  toStrFine_functor : toStrFine_functor,

  _toStr : _toStr,
  _toStrShort : _toStrShort,

  _toStrIsVisibleElement : _toStrIsVisibleElement,
  _toStrIsSimpleElement : _toStrIsSimpleElement,

  _toStrFromRoutine : _toStrFromRoutine,
  _toStrFromNumber : _toStrFromNumber,
  _toStrFromStr : _toStrFromStr,

  _toStrFromHashMap : _toStrFromHashMap,

  _toStrFromArrayFiltered : _toStrFromArrayFiltered,
  _toStrFromArray : _toStrFromArray,

  _toStrFromObjectKeysFiltered : _toStrFromObjectKeysFiltered,
  _toStrFromObject : _toStrFromObject,

  _toStrFromContainer : _toStrFromContainer,

  //

  strShort : strShort,
  strEscape : strEscape,

  toStrForRange : toStrForRange, /* experimental */
  toStrForCall : toStrForCall, /* experimental */

  strCapitalize : strCapitalize,
  strTimes : strTimes,
  strLineCount : strLineCount,
  strSplitStrNumber : strSplitStrNumber, /* experimental */
  strSplitChunks : strSplitChunks, /* experimental */

  _strCutOff : _strCutOff,
  strCutOffLeft : strCutOffLeft,
  strCutOffRight : strCutOffRight,

  strCutOffAllLeft : strCutOffAllLeft,
  strCutOffAllRight : strCutOffAllRight,

  strSplit : strSplit,
  strStrip : strStrip,
  strRemoveAllSpaces : strRemoveAllSpaces,
  strStripEmptyLines : strStripEmptyLines,

  strIron : strIron, /* experimental */

  strReplaceAll : strReplaceAll, /* document me */
  strReplaceNames : strReplaceNames,

  strJoin : strJoin, /* document me */
  strUnjoin : strUnjoin, /* document me */
  strConcat : strConcat, /* me too */

  strCommonLeft : strCommonLeft, /* document me */
  strCommonRight : strCommonRight, /* document me */

  strDifference : strDifference, /* experimental */
  strSimilarity : strSimilarity, /* experimental */
  strLattersSpectre : strLattersSpectre, /* experimental */
  lattersSpectreComparison : lattersSpectreComparison, /* experimental */

  strHtmlEscape : strHtmlEscape, /* improve my document */
  strUnicodeEscape : strUnicodeEscape, /* document me */

  strIndentation : strIndentation,
  strLinesNumber : strLinesNumber,
  strLinesSelect : strLinesSelect,

  strCount : strCount,
  strCountLeft : strCountLeft,
  strCountRight : strCountRight,

  strDup : strDup, /* document me */

  strCamelize : strCamelize,
  strFilenameFor : strFilenameFor,


  // format

  strToBytes : strToBytes,
  strMetricFormat : strMetricFormat,
  strMetricFormatBytes : strMetricFormatBytes,

  strTimeFormat : strTimeFormat,

  strCsvFrom : strCsvFrom, /* experimental */
  strToDom : strToDom, /* experimental */
  strToConfig : strToConfig, /* experimental */

  strParseMap : strParseMap,


  //

  strExtractStrips : strExtractStrips,
  strExtractStereoStrips : strExtractStereoStrips,

  strColor :
  {
    bg : strColorBackground,
    background : strColorBackground,
    fg : strColorForeground,
    foreground : strColorForeground,
    style : strColorStyle,
  }

}

_.mapExtend( Self, Proto );

//

var toStrFine = Self.toStrFine = Self.toStrFine_functor();
var toStr = Self.toStr = Self.strFrom = toStrFine;

//

if( typeof module !== 'undefined' && module !== null )
{
  module[ 'exports' ] = Self;
}

})();
