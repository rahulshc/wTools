( function _Include_s_() {

'use strict';

if( typeof module !== 'undefined' && typeof wBase === 'undefined' )
{

  require( '../wTools.s' );

}

//

var Self = wTools;
var _ = wTools;

// --
// routines
// --

function _includePureAct( src )
{

  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ),'include expects string' );

  if( typeof module !== 'undefined' )
  return require( src );
  else
  throw _.err( 'Can make include only on Nodejs.' );

}

//

function _includeAct( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) );

  var handler;
  if( _includeHandlerMap[ src ] )
  handler = _includeHandlerMap[ src ];

  if( !handler )
  {
    return _includePureAny( src );
  }

  /* */

  if( handler.isIncluded )
  if( handler.isIncluded() )
  return handler.returned;

  var result;
  if( handler.include )
  result = _includePure( handler.include );
  else if( handler.includeAny )
  {
    _.assert( _.arrayIs( handler.includeAny ),'include handler expect an array ( includeAny ) if present' );
    result = _includePureAny.apply( _,handler.includeAny );
  }
  else throw _.err( 'Handler does not has ( include ) neither ( includeAny ).\nCant include',src );

  handler.returned = result;

  return result;
}

//

function _includePure( src )
{
  if( arguments.length !== 1 )
  return _includePure( arguments );

  if( _.arrayLike( src ) )
  {
    var result = [];
    src = _.arrayFlatten( src );
    for( var a = 0 ; a < src.length ; a++ )
    result[ a ] = _includePureAct( src[ a ] );
    return result;
  }

  return _includePureAct( src );
}

//

function include( src )
{
  if( arguments.length !== 1 )
  return _includePure( arguments );

  if( _.arrayLike( src ) )
  {
    var result = [];
    src = _.arrayFlatten( src );
    for( var a = 0 ; a < src.length ; a++ )
    result[ a ] = _includeAct( src[ a ] );
    return result;
  }

  return _includeAct( src );
}

//

function _includePureAny( src )
{

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( a === arguments.length-1 )
    {
      if( src !== '' )
      return _includePureAct( src );
    }
    else try
    {

      var result = _includePureAct( src );
      return result;

    }
    catch( err )
    {
      //_.errLog( err );
    }

  }
}

//

function includeAny()
{

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( a === arguments.length-1 )
    {
      if( src !== '' )
      return _includeAct( src );
    }
    else try
    {

      var result = _includeAct( src );
      return result;

    }
    catch( err )
    {
      //_.errLog( err );
    }

  }

  // throw _.err( "Cant find any of required packages :",_.arraySlice( arguments ).join( ',' ) );

}

// --
// var
// --

var _includeHandlerMap = {};

_includeHandlerMap[ 'wCopyable' ] =
{
  includeAny : [ '../../abase/mixin/Copyable.s','wCopyable' ],
  isIncluded : function(){ return typeof wCopyable !== 'undefined'; },
}

_includeHandlerMap[ 'wEventHandler' ] =
{
  includeAny : [ '../../abase/mixin/EventHandler.s','wEventHandler' ],
  isIncluded : function(){ return typeof wEventHandler !== 'undefined'; },
}

_includeHandlerMap[ 'wLogger' ] =
{
  includeAny : [ '../../abase/object/printer/printer/Logger.s','wLogger' ],
  isIncluded : function(){ return typeof wLogger !== 'undefined'; },
}

_includeHandlerMap[ 'wConsequence' ] =
{
  includeAny : [ '../../abase/syn/Consequence.s','wConsequence' ],
  isIncluded : function(){ return typeof wConsequence !== 'undefined'; },
}

_includeHandlerMap[ 'wNameTools' ] =
{
  includeAny : [ '../../abase/component//NameTools.s','wNameTools' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.idNumber; },
}

_includeHandlerMap[ 'wRegexpObject' ] =
{
  includeAny : [ '../../abase/object/RegexpObject.s','wRegexpObject' ],
  isIncluded : function(){ return typeof wRegexpObject !== 'undefined' },
}

_includeHandlerMap[ 'wProto' ] =
{
  includeAny : [ '../../abase/component/Proto.s','wProto' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.mixin },
}

_includeHandlerMap[ 'wPath' ] =
{
  includeAny : [ '../../abase/component/Proto.s','wPath' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.pathDir },
}

//   require( '../../abase/object/RegexpObject.s' );

// --
// prototype
// --

var Proto =
{

  _includePureAct : _includePureAct,
  _includeAct : _includeAct,

  _includePure : _includePure,
  include : include,

  _includePureAny : _includePureAny,
  includeAny : includeAny,

  // _include : _include,
  // include : include,
  // includeAny : includeAny,  /* experimental */


}

_.mapExtend( Self, Proto );

})();
