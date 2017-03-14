( function _Include_s_() {

'use strict';

if( typeof module !== 'undefined' && typeof wBase === 'undefined' )
{

  require( '../wTools.s' );

}

//

var Self = wTools;
var _ = wTools;
var usingSinglePath = 0;

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
  return _includeAct( arguments );

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
  var errors = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( a === arguments.length-1 || usingSinglePath )
    {
      try
      {
        return _includePureAct( src );
      }
      catch( err )
      {
        errors.push( err );
        debugger;
        throw _.err.apply( _,errors );
      }
    }
    else try
    {

      var result = _includePureAct( src );
      return result;

    }
    catch( err )
    {
      errors.push( err );
    }

  }

}

//

function includeAny()
{
  var errors = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var src = arguments[ a ];

    if( a === arguments.length-1 || usingSinglePath )
    {
      try
      {
        if( src !== '' )
        return _includeAct( src );
      }
      catch( err )
      {
        errors.push( err );
        throw _.err.apply( _,errors );
      }
    }
    else try
    {

      var result = _includeAct( src );
      return result;

    }
    catch( err )
    {
      errors.push( err );
    }

  }

  // throw _.err( "Cant find any of required packages :",_.arraySlice( arguments ).join( ',' ) );

}

//

// function includeTestsFrom( path )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.strIs( path ) );
//
//   var files = _.fileProvider.filesFind({ pathFile : path, ends : [ '.test.s','.test.ss' ] });
//
//   console.log( 'files',_.entitySelect( files,'*.absolute' ) );
//
//   for( var f = 0 ; f < files.length ; f++ )
//   if( files[ f ].stat.isFile() )
//   require( _.fileProvider.pathNativize( files[ f ].absolute ) );
//
// }

//

var _appArgsInSubjectAndMapFormatResult;
function appArgsInSubjectAndMapFormat( o )
{

  o = _.routineOptions( appArgsInSubjectAndMapFormat,o );

  if( _appArgsInSubjectAndMapFormatResult && o.delimeter === _appArgsInSubjectAndMapFormatResult.delimeter )
  return _appArgsInSubjectAndMapFormatResult;
  var result = Object.create( null );

  if( _global_.process )
  {

    result.interpreterPath = process.argv[ 0 ];
    result.mainPath = process.argv[ 1 ];
    result.interpreterArgs = process.execArgv;
    result.delimter = o.delimeter;
    result.map = null;
    result.subject = process.argv[ 2 ];

    var args = process.argv.slice( 2 ).join( ' ' );
    args = args.trim();

    if( !args )
    return result;

    args = _.strSplit({ src : args, delimeter : o.delimeter, stripping : 1 });

    if( args.length === 1 )
    return result;

    args[ 0 ] = _.strCutOffAllLeft( args[ 0 ],' ' )[ 1 ];

    result.map = Object.create( null );
    for( var a = 1 ; a < args.length ; a++ )
    {
      var left = args[ a-1 ];
      var right = args[ a+0 ];
      var val = right;

      if( a < args.length - 1 )
      {
        var cuts = _.strCutOffAllLeft( right,' ' );
        var val = cuts[ 0 ];
        args[ a+0 ] = cuts[ 1 ];
      }

      if( !isNaN( parseFloat( val ) ) )
      val = parseFloat( val );

      result.map[ left ] = val;
    }

    // console.log( 'appArgsInSubjectAndMapFormat',result );

  }

  return result;
}

appArgsInSubjectAndMapFormat.defaults =
{
  delimeter : ':'
}

//

function appReturnCode( status )
{
  var result;

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( status === undefined || _.numberIs( status ) );

  // debugger;

  if( typeof process !== 'undefined' )
  {
    result = process.exitCode;
    if( status !== undefined )
    process.exitCode = status;
  }

  return result;
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

_includeHandlerMap[ 'wInstancing' ] =
{
  includeAny : [ '../../abase/mixin/Instancing.s','winstancing' ],
  isIncluded : function(){ return typeof wInstancing !== 'undefined'; },
}

_includeHandlerMap[ 'wEventHandler' ] =
{
  includeAny : [ '../../abase/mixin/EventHandler.s','wEventHandler' ],
  isIncluded : function(){ return typeof wEventHandler !== 'undefined'; },
}

_includeHandlerMap[ 'wTesting' ] =
{
  includeAny : [ '../../abase/xTesting/Testing.debug.s','wTesting' ],
  isIncluded : function(){ return typeof wTesting !== 'undefined' && wTesting._full; },
}

_includeHandlerMap[ 'wLogger' ] =
{
  includeAny : [ '../../abase/printer/printer/Logger.s','wLogger' ],
  isIncluded : function(){ return typeof wLogger !== 'undefined'; },
}

_includeHandlerMap[ 'wLoggerToFile' ] =
{
  includeAny : [ '../../abase/printer/printer/LoggerToFile.s','wloggertofile' ],
  isIncluded : function(){ return typeof wLoggerToFile !== 'undefined'; },
}

_includeHandlerMap[ 'wLoggerToJstructure' ] =
{
  includeAny : [ '../../abase/printer/printer/LoggerToJstructure.s','wloggertojstructure' ],
  isIncluded : function(){ return typeof wLoggerToJstructure !== 'undefined'; },
}

_includeHandlerMap[ 'wColor' ] =
{
  includeAny : [ '../../amid/color/Color.s','wColor' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.ColorMap },
}

_includeHandlerMap[ 'wColor256' ] =
{
  includeAny : [ '../../amid/color/Color256.s','wColor256' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.ColorMap && Object.keys( wTools.ColorMap ).length > 100 },
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
  includeAny : [ '../../abase/component/Path.s','wPath' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.pathDir },
}

_includeHandlerMap[ 'wFiles' ] =
{
  includeAny : [ '../../amid/file/Files.ss','wFiles' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.FileRecord },
}

_includeHandlerMap[ 'wTemplateTree' ] =
{
  includeAny : [ '../../amid/mapping/TemplateTree.s','wtemplatetree' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.TemplateTree },
}

_includeHandlerMap[ 'wNameMapper' ] =
{
  includeAny : [ '../../amid/mapping/NameMapper.s','wnamemapper' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.NameMapper },
}

_includeHandlerMap[ 'wArraySorted' ] =
{
  includeAny : [ '../../abase/component/ArraySorted.s','warraysorted' ],
  isIncluded : function(){ return typeof wTools !== 'undefined' && wTools.arraySortedLookUp },
}

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

  // includeTestsFrom : includeTestsFrom,
  appArgsInSubjectAndMapFormat : appArgsInSubjectAndMapFormat,
  appArgs : appArgsInSubjectAndMapFormat,

  appReturnCode : appReturnCode,

}

_.mapExtend( Self, Proto );

})();
