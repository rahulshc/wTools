(function _StringExtra_s_() {

'use strict';

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
 * @name _metrics
 * @type {object}
 * @description Contains metric prefixes.
 * @global
 */

/**
 * Returns string that represents number( src ) with metric unit prefix that depends on options( o ).
 * If no options provided function start calculating metric with default options.
 * Example: for number ( 50000 ) function returns ( "50.0 k" ), where "k"- thousand.
 *
 * @param {(number|string)} src - Source object.
 * @param {object} o - conversion options.
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

  var o = o || Object.create( null );

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
 * @param {string|number} str - Source number to  convert.
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

  var o = o || Object.create( null );
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

function strCsvFrom( src,o )
{

  var result = '';
  var o = o || Object.create( null );

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
  var result = Object.create( null );
  if( !_.strIs( src ) )
  throw _.err( '_.strToConfig :','require string' );

  var o = o || Object.create( null );
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
      src[ a+0 ] = cuts[ 2 ];
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
// strTable
// --

function strTable( o )
{
  _.assert( arguments.length === 1 );

  if( !_.objectIs( o ) )
  {
    o = { data : o }
  }
  _.routineOptions( strTable,o );

  _.assert( _.arrayLike( o.data ) );

  if( typeof module !== 'undefined' && module !== null )
  {
    if( !_.cliTable  )
    _.cliTable = require( 'cli-table2' );
  }

  if( _.cliTable == undefined )
  {
    throw( 'browser version of strTable is not implemented' );
  }

  //

  function makeWidth( propertyName, def, len )
  {
    var property = o[ propertyName ];
    var _property = _.arrayFillTimes( [], len, def );
    if( property )
    {
      _.assert( _.mapIs( property ) || _.arrayLike( property ) , 'routine expects colWidths/rowWidths property as Object or Array-Like' );
      for( var k in property )
      {
        k = _.numberFrom( k );
        if( k < len )
        {
          _.assert( _.numberIs( property[ k ] ) );
          _property[ k ] = property[ k ];
        }
      }
    }
    o[ propertyName ] = _property;
  }

  //

  var isArrayOfArrays = true;
  var maxLen = 0;
  for( var i = 0; i < o.data.length; i++ )
  {
    if( !_.arrayLike( o.data[ i ] ) )
    {
      isArrayOfArrays = false;
      break;
    }

    maxLen = Math.max( maxLen, o.data[ i ].length );
  }

  var onCellGet = strTable.onCellGet;
  o.onCellGet = o.onCellGet || isArrayOfArrays ? onCellGet.ofArrayOfArray :  onCellGet.ofFlatArray ;
  o.onCellAfter = o.onCellAfter || strTable.onCellAfter;

  if( isArrayOfArrays )
  {
    o.rowsNumber = o.data.length;
    o.colsNumber = maxLen;
  }
  else
  {
    _.assert( _.numberIs( o.rowsNumber ) && _.numberIs( o.colsNumber ) );
  }

  //

  makeWidth( 'colWidths', o.colWidth, o.colsNumber );
  makeWidth( 'colAligns', o.colAlign, o.colsNumber );
  makeWidth( 'rowWidths', o.rowWidth, o.rowsNumber );
  makeWidth( 'rowAligns', o.rowAlign, o.rowsNumber );

  var tableOptions =
  {
    head : o.head,
    colWidths : o.colWidths,
    rowWidths : o.rowWidths,
    colAligns : o.colAligns,
    rowAligns : o.rowAligns,
    style :
    {
      compact : o.compact,
      'padding-left' : o.paddingLeft,
      'padding-right' : o.paddingRight,
    }
  }

  var table = new _.cliTable( tableOptions );

  //

  for( var y = 0; y < o.rowsNumber; y++ )
  {
    var row = [];
    table.push( row );

    for( var x = 0; x < o.colsNumber; x++ )
    {
      var index2d = [ y, x ];
      var cellData = o.onCellGet( o.data, index2d, o );
      var cellStr;

      if( cellData === undefined )
      var cellData = cellStr = '';
      else
      var cellStr = _.toStr( cellData, { wrap : 0, stringWrapper : '' } );

      cellStr = o.onCellAfter( cellStr, index2d, o );
      row.push( cellStr );
    }
  }

  return table.toString();
}

strTable.defaults =
{
  data : null,
  rowsNumber : null,
  colsNumber : null,

  head : null,

  rowWidth : 5,
  rowWidths : null,
  rowAlign : 'center',
  rowAligns : null,

  colWidth : 5,
  colWidths : null,
  colAlign : 'center',
  colAligns : null,

  compact : true,

  paddingLeft : 0,
  paddingRight : 0,

  onCellGet : null,
  onCellAfter : null,
}

strTable.onCellGet =
{
  ofFlatArray : ( data, index2d, o  ) => data[ index2d[ 0 ] * o.colsNumber + index2d[ 1 ] ],
  ofArrayOfArray : ( data, index2d, o  ) => data[ index2d[ 0 ] ][ index2d[ 1 ] ]
}

strTable.onCellAfter = ( cellStr, index2d, o ) => cellStr

// --
// prototype
// --

var Proto =
{

  strToBytes : strToBytes,
  strMetricFormat : strMetricFormat,
  strMetricFormatBytes : strMetricFormatBytes,

  strTimeFormat : strTimeFormat,

  strCsvFrom : strCsvFrom, /* experimental */
  strToDom : strToDom, /* experimental */
  strToConfig : strToConfig, /* experimental */

  strParseMap : strParseMap,

  strTable : strTable,

}

_.mapExtend( Self, Proto );

//

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
