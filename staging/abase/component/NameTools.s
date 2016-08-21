( function _NameTools_s_() {

'use strict';

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

var _assert = _.assert;
var _arraySlice = _.arraySlice;

// --
// name and symbol
// --

/**
 * Produce fielded name from string.
 * @param {string} nameString - object coded name or string.
 * @return {object} nameKeyValue - name in key/value format.
 * @method nameFielded
 * @memberof wTools
 */

var nameFielded = function nameFielded( nameString )
{

  if( _.objectIs( nameString ) )
  {
    return nameString;
  }
  else if( _.strIs( nameString ) )
  {
    var name = {};
    name[ nameString ] = nameString;
    return name;
  }
  else throw _.err( 'nameFielded :','unknown arguments' );

}

//

/**
 * Returns name splitted in coded/raw fields.
 * @param {object} nameObject - fielded name or name as string.
 * @return {object} name splitted in coded/raw fields.
 * @method nameUnfielded
 * @memberof wTools
 */

var nameUnfielded = function nameUnfielded( nameObject )
{
  var name = {};

  if( _.mapIs( nameObject ) )
  {
    var keys = Object.keys( nameObject );
    _.assert( keys.length === 1 );
    name.coded = keys[ 0 ];
    name.raw = nameObject[ name.coded ];
  }
  else if( _.strIs( nameObject ) )
  {
    name.raw = nameObject;
    name.coded = nameObject;
  }
  else if( _.symbolIs( nameObject ) )
  {
    name.raw = nameObject;
    name.coded = nameObject;
  }
  else throw _.err( 'nameUnfielded :','Unknown arguments' );

  _assert( arguments.length === 1 );
  _assert( _.strIs( name.raw ) || _.symbolIs( name.raw ),'nameUnfielded :','not a string, something wrong :',nameObject );
  _assert( _.strIs( name.coded ) || _.symbolIs( name.coded ),'nameUnfielded :','not a string, something wrong :',nameObject );

  return name;
}

//

/**
 * Returns name splitted in coded/coded fields. Drops raw part replacing it by coded.
 * @param {object} namesMap - fielded names.
 * @return {object} expected map.
 * @method namesCoded
 * @memberof wTools
 */

var namesCoded = function namesCoded( namesMap )
{
  var result = {}

  if( _assert )
  _assert( arguments.length === 1 );
  if( _assert )
  _assert( _.objectIs( namesMap ) );

  for( var n in namesMap )
  result[ n ] = n;

  return result;
}

// --
// id
// --

var idGenerateDate = function( prefix,postfix,fast )
{

  var date = new Date;

  prefix = prefix ? prefix : '';
  postfix = postfix ? postfix : '';

  if( fast ) return prefix + date.valueOf() + postfix;

  var d =
  [
    date.getFullYear(),
    date.getMonth()+1,
    date.getDate(),
    date.getHours(),
    date.getMinutes(),
    date.getSeconds(),
    date.getMilliseconds(),
    Math.floor( 1 + Math.random()*0x100000000 ).toString(16),
  ].join( '-' );

  return prefix + d + postfix
}

//

var idGenerateGuid = (function()
{

  function s4()
  {
    return Math.floor( ( 1 + Math.random() ) * 0x10000 ).toString( 16 ).substring( 1 );
  }

  return function()
  {

    var result =
    [
      s4() + s4(),
      s4(),
      s4(),
      s4(),
      s4() + s4() + s4(),
    ].join( '-' );

    return result;
  };

})();

//

var idNumber = (function()
{

  var counter = 0;

  return function()
  {
    _assert( arguments.length === 0 );
    counter += 1;
    return counter;
  }

})();

// --
// prototype
// --

var Proto =
{

  // name and symbol

  nameFielded : nameFielded, /* experimental */
  nameUnfielded : nameUnfielded, /* experimental */
  namesCoded : namesCoded, /* experimental */


  // id

  idGenerateDate : idGenerateDate,
  idGenerateGuid : idGenerateGuid,
  idNumber : idNumber,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
{
  module[ 'exports' ] = Self;
}

})();
