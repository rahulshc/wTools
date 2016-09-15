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

var toStrMethods = function( src,o )
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

var toStrFields = function( src,o )
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
* @property {boolean} [ o.wrapString=true ] - Wrap string into ( "" ).
* @property {boolean} [ o.usingMultilineStringWrapper=false ] - WrapString uses backtick ( `` ) to wrap string.
* @property {number} [ o.level=0 ] - Sets the min depth of looking into source object. Function starts from zero level by default.
* @property {number} [ o.levels=1 ] - Restricts max depth of looking into source object. Looks only in one level by default.
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
 * //returns [ routine sample ]
 * _.toStr( function sample( ){ });
 *
 * @example
 * //returns [object Function]
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
 * _.toStr( { a : 'string', b : "str" , c : 2  }, { levels : 2 , wrapString : 0 } );
 *
 * @example
 * //returns { "a" : "string", "b" : 1, "c" : 2 }
 * _.toStr( { a : 'string', b : 1 , c : 2  }, { levels : 2 , json : 1 } );
 *
 * @example
 * //returns { stack : "Error: my message2"..., message : "my message2" }
 * _.toStr( new Error('my message2'), { onlyEnumerable : 0,errorAsMap : 1 } );
 *
 * @example
 * //returns
 * // "{
 * //  a : `line1
 * // line2
 * // line3`
 * // }"
 * _.toStr( { a : "line1\nline2\nline3" }, { levels: 2, usingMultilineStringWrapper : 1 } );
 *
 * @method toStr
 * @throws { Exception } Throw an exception if( o ) is not a Object.
 * @throws { Exception } Throw an exception if( o.wrapString ) is not equal true when ( o.json ) is true.
 * @throws { Exception } Throw an exception if( o.usingMultilineStringWrapper ) is not equal false when ( o.json ) is true.
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
    noUndefines : 0,

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

    noSubObject : 0,
    onlyRoutines : 0,
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

    _.assertMapOnly( o,composes,primeFilter,optional );
    o = _.mapSupplement( {},o,toStrDefaults,composes,restricts );

    if( o.json === 1 )
    {
      _.assert( o.wrapString,'expects ( o.wrapString ) true if ( o.json ) is true' );
      _.assert( !o.usingMultilineStringWrapper,'expects ( o.usingMultilineStringWrapper ) false if ( o.json ) is true to make valid JSON' );
    }

    if( o.onlyRoutines )
    {
      _.assert( !o.noRoutine,'expects ( o.noRoutine ) false if ( o.onlyRoutines ) is true' );
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
    //if( o.noRoutine )
    //return;
    result += _toStrFromRoutine( src,o );
  }
  else if( _.numberIs( src ) )
  {
    //if( o.noNumber || o.noAtomic )
    //return;
    result += _toStrFromNumber( src,o );
  }
  else if( _.strIs( src ) )
  {
    //if( o.noString || o.noAtomic  )
    //return;
    result += _toStrFromStr( src,o );
  }
  else if( src instanceof Date )
  {
    //if( o.noDate )
    //return;
    result += src.toISOString();
  }
  else if( isArray )
  {
    //if( o.noArray )
    //return;
    var r = _toStrFromArray( src,o );
    result += r.text;
    simple = r.simple;
  }
  else if( isObject )
  {
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
    if( o.json && src === undefined )
    result += 'null';
    else
    result += String( src );

  }

  return { text : result, simple : simple };
}

//

/**
 * Converts object passed by argument( src ) to string representation.Using
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

var _toStrIsVisibleElement = function _toStrIsVisibleElement( src,o )
{

  var isAtomic = _.atomicIs( src );
  var isArray = _.arrayLike( src );
  var isObject = !isArray && _.objectLike( src );

  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

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

var _toStrIsSimpleElement = function( element,o )
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

var _toStrFromRoutine = function( src,o )
{
  _.assert( _.routineIs( src ),'expects routine ( src )' );
  var result = '';
  result = '[ routine ' + ( src.name || src._name || 'without name' ) + ' ]';

  return result;
}

//

/**
 * This function converts Number to String with options.
 *
 * @param {Number} src - Number for conversion.
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
 * @method _toStrFromNumber
 * @memberof wTools
 *
*/

var _toStrFromNumber = function( src,o )
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
 * Function wraps string( src ) in to( "" ) using options provided
 * by argument( o ).Disables escape characters if ( o.escaping ) is true.
 * Also string can be wrapped in to backtick( `` ) if ( o.usingMultilineStringWrapper ) and ( o.wrapString ) are true.
 *
 * @param {object} src - String to parse.
 * @param {wTools~toStrOptions} o - Contains conversion  options {@link wTools~toStrOptions}.
 * @returns {String} Returns wrapped string.
 *
 * @example
 * //returns "hello"
 * _.toStrFromStr( 'hello', {} );
 *
 * @example
 * //returns "test\n"
 * _.toStrFromStr( 'test\n', { escaping : 1 } );
 *
 * @example
 * //returns `test`
 * _.toStrFromStr( 'test', { usingMultilineStringWrapper : 1 } );
 *
 * @method _toStrFromStr
 * @memberof wTools
 *
*/

var _toStrFromStr = function( src,o )
{
  var result = '';

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ), 'expects string ( src )'  );
  _.assert( _.objectIs( o ) || o === undefined,'expects map ( o )' );

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

/**
 * Function converts array provided by argument( src ) to string representation
 * using options provided by argument( o ).
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
 * @throws { Exception } Throw an exception if( src ) is undefined.
 * @memberof wTools
 *
*/

var _toStrFromArray = function( src,o )
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

/**
 * Function converts object provided by argument( src ) to string representation
 * using options provided by argument( o ).
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
 * @throws { Exception } Throw an exception if( src ) is not a object-like.
 * @memberof wTools
 *
*/


var _toStrFromObject = function( src,o )
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

/**
 * Function builds string that represents  container structure like object or array using keys and values from
 * argument( o ).Wraps array-like and object-like entities using ( o.prefix ) and ( o.postfix ).
 *
 * @param {object} o - Contains data and options.
 * @param {object} [ o.values ] - Source object that contains values.
 * @param {array} [ o.names ] - Source object keys.
 * @param {string} [ o.prefix ] - Denotes begin of container.
 * @param {string} [ o.postfix ] - Denotes end of container.
 * @param {wTools~toStrOptions} o.optionsContainer - Options for container {@link wTools~toStrOptions}.
 * @param {object} [ o.optionsItem ] - Options for items that object contains.
 * @param {string} [ o.optionsItem.tab ] - Prepended before each line tab.
 * @param {number} [ o.optionsItem.level ] - Sets the min depth of looking into source object. Function starts from zero level by default.
 * @returns {String} Returns string representation of container.
 *
 * @method _toStrFromContainer
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
*/

var _toStrFromContainer = function( o )
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

/**
* @typedef {object} wTools~toStrInhalfOptions
* @property {string} [ o.src=null ] - Source string.
* @property {string | array} [ o.splitter=' ' ] - Splitter of the string.
* @property {boolean} [ o.left=1 ] - Finds occurrence from begining of the string.
*/

/**
 * Finds occurrence of splitter( o.splitter ) in source( o.src ) and splits string in finded position by half.
 * If function finds  more then one occurrence, it separates string in the position of the last.
 *
 * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ "sample", "string" ]
 * _._strInhalf( { src : 'sample,string', splitter : [ ',' ] } );
 *
 * @example
 * //returns [ "sample", "string" ]
 *_._strInhalf( { src : 'sample string', splitter : ' ' } )
 *
 * @example
 * //returns [ "sample string,name", "string" ]
 * _._strInhalf( { src : 'sample string,name string', splitter : [ ',', ' ' ] } )
 *
 * @method _strInhalf
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.splitter ) is not a Array or String.
 * @memberof wTools
 *
 */

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

/**
 * Short-cut for _strInhalf function.
 * Finds occurrence of splitter( o.splitter ) from begining of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ "sample", "string" ]
 * _.strInhalfLeft( { src : 'sample,string', splitter : [ ',' ] } );
 *
 * @example
 * //returns [ "sample", "string" ]
 *_.strInhalfLeft( { src : 'sample string', splitter : ' ' } )
 *
 * @example
 * //returns [ "sample string,name", "string" ]
 * _.strInhalfLeft( 'sample string,name string', ',' )
 *
 * @method strInhalfLeft
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */

var strInhalfLeft = function( o )
{

  if( _.strIs( o ) )
  {
    _.assert( arguments.length === 2 );
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

/**
 * Short-cut for _strInhalf function.
 * Finds occurrence of splitter( o.splitter ) from end of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools~toStrInhalfOptions} o - Contains data and options {@link wTools~toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ "sample", "string" ]
 * _.strInhalfRight( { src : 'sample,string', splitter : [ ',' ] } );
 *
 * @example
 * //returns [ "sample", "string" ]
 *_.strInhalfRight( { src : 'sample string', splitter : ' ' } )
 *
 * @example
 * //returns [ "sample, ", "string" ]
 * _.strInhalfRight( { src : 'sample,  string', splitter : [ ',', ' ' ] } )
 *
 * @method strInhalfRight
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */

var strInhalfRight = function( o )
{

  if( _.strIs( o ) )
  {
    _.assert( arguments.length === 2 );
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
 * Divides source string( o.src ) into parts using splitter provided by argument( o.splitter ).
 * If( o.strip ) is true - removes leading and trailing whitespace characters.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a,b,c', splitter : ',', strip : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.splitter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.strip=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.splitter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit( ' first second third ' );
 *
 * @example
 * //returns [ "a", "b", "c", "d" ]
 * _.strSplit( { src : 'a,b,c,d', splitter : ','  } );
 *
 * @example
 * //returns [ "    a", "b", "c", "d   " ]
 * _.strSplit( { src : '    a,b,c,d   ', splitter : [ ',' ], strip : 0  } );
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.splitter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
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

/**
 * Replaces each occurrence of ( ins ) in string ( dst ) with ( sub ).
 * If the function can not find any occurrence in source ( dst ) it returns the original string.
 * Function can be called in three different ways:
 *  One argument: object that contains properties: map ( o ) with options.
 *  Two arguments: string ( dst ), map ( dictionary ).
 *  Three arguments: string ( dst ), string ( ins ), string ( sub )
 * @param {string} dst - Source string to parse.
 * @param {string} ins - String that is to be replaced by( sub ).
 * @param {string} sub - String that replaces finded occurrence.
 * @param {object} dictionary - Object with properties like ( { 'ins' : 'sub' } ).
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
 * @memberof wTools
 *
 */

var strReplaceNames = function( src,ins,sub )
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
 * Concatenates objects provided to function in orded that they are specified.
 * If one of arguments is array-like, function concatenates other arguments with
 * each element in the array.
 * Example: ( [ 1,2 ], 3 ) -> ( [ "13", "23" ] ).
 *
 * @param {array-like} arguments - Contains provided objects.
 * @returns {object} Returns concatenated objects as string or array.Return type depends
 * from arguments type.
 *
 * @example
 * //returns "123"
 * _.strJoin( 1, 2, 3 );
 *
 * @example
 * //returns [ "12", "22", "32" ]
 * _.strJoin( [ 1, 2, 3 ], 2)
 *
 * @example
 * //returns [ "11", "23" ]
 * _.strJoin( [ 1, 2 ], [ 1, 3 ] )
 *
 * @method strJoin
 * @throws { Exception } Throws a exception if some object from( arguments ) is not a Array, String or Number.
 * @throws { Exception } Throws a exception if length of arrays passed as arguments is different.
 * @memberof wTools
 *
 */

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

/**
 * Separates parts of string( srcStr ) using array( maskArray ) as mask and returns them as array.
 * @param {string} srcStr - Source string.
 * @param {array} maskArray - Contains mask for source string.
 * @returns {array} Returns array with unjoined string part.
 *
 * @example
 * //returns [ "prefix", "_something_", "postfix" ]
 * _.strUnjoin( 'prefix_something_postfix',[ 'prefix', _.strUnjoin.any, 'postfix' ] )
 *
 * @example
 * //returns [ "prefix_", "something", "postfix" ]
 * _.strUnjoin( 'prefix_something_postfix',[_.strUnjoin.any,'something','postfix'] )
 *
 *
 * @method strUnjoin
 * @throws { Exception } Throws a exception if no arguments provided.
 * @throws { Exception } Throws a exception if( srcStr ) is not a String.
 * @throws { Exception } Throws a exception if( maskArray ) is not a Array.
 * @memberof wTools
 *
 */

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

/**
 * Removes occurrence of( postfix ) from the end of string( src ).
 * Returns original string if no occurrence finded.
 * @param {string} src - Source string to parse.
 * @param {string} postfix - String that is to be dropped.
 * @returns {string} Returns string with result of postfix removement.
 *
 * @example
 * //returns examp
 * _.strDropPostfix( 'example','le' );
 *
 * @example
 * //returns example
 * _.strDropPostfix( 'example','abc' );
 *
 * @method strDropPostfix
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
*/

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

var strHtmlEscape = function( str )
{
  _.assert( arguments.length === 1 );

  return String( str ).replace( /[&<>"'\/]/g, function( s )
  {
    return _strHtmlEscapeMap[ s ];
  });
}

//

/**
 * Returns string with escaped unicode sequence based on string( src ).
 *
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
 * @throws { Exception } Throws a exception if ( src ) is not a String.
 * @memberof wTools
 *
 */

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
 * Puts line counter before each line in the string provided by argument( srcStr ).
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
  _assert( arguments.length === 1 );
  _assert( _.strIs( srcStr ),'strNumberLines : expects string srcStr' );
  var lines = srcStr.split( '\n' );

  for( var l = 0; l < lines.length; l += 1 )
  {

    lines[ l ] = ( l + 1 ) + ' : ' + lines[ l ];

  }

  return lines.join( '\n' );
}

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
 * @memberof wTools
 *
 */

var strCount = function( src,ins )
{
  var result = -1;

  _.assert( arguments.length === 2 );
  _.assert( _.strIs( src ) );
  _.assert( _.strIs( ins ) );

  if( !ins.length ) { result = 0; return result; }

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

/**
 * Returns n( times ) duplicates of string( src ) .
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
 * @method strDup
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( times ) is not a Number.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */

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

var strMetricFormat = function( number,o )
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
