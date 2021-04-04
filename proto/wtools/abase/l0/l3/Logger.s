( function _l3_Logger_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.logger = _.logger || Object.create( null );

// --
// implementation
// --

function consoleIs( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( console.Console )
  if( src && src instanceof console.Console )
  return true;

  if( src !== console )
  return false;

  let result = Object.prototype.toString.call( src );
  if( result === '[object Console]' || result === '[object Object]' )
  return true;

  return false;
}

//

function is( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.Logger )
  return false;

  if( src instanceof _.Logger )
  return true;

  return false;
}

//

function like( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.printer.is( src ) )
  return true;

  if( _.consoleIs( src ) )
  return true;

  if( src === _global_.logger )
  return true;

  return false;
}

//

function from( src )
{
  return _.logger.relative( src, 0 );
}

//

function relative( src, delta )
{
  let result = src;

  _.assert( result === null || _.boolIs( result ) || _.numberIs( result ) || _.logger.is( result ) );
  _.assert( delta === undefined || _.numberDefined( delta ) );

  delta = delta || 0;

  if( result === null )
  {
    result = new _.Logger({ output : _global_.logger });
  }
  else if( _.boolIs( result ) )
  {
    if( result )
    result = new _.Logger({ output : _global_.logger, verbosity : 1 + delta });
    else if( delta > 0 )
    result = new _.Logger({ output : _global_.logger, verbosity : delta });
  }
  else if( _.numberIs( result ) )
  {
    result += delta;
    if( result > 0 )
    result = new _.Logger({ output : _global_.logger, verbosity : result });
    else
    result = false;
  }
  else if( _.logger.is( result ) )
  {
    if( delta !== 0 )
    result = new _.Logger({ output : result, verbosity : result.verbosity + delta });
  }
  else _.assert( 0 );

  return result;
}

// --
// tools extension
// --

let ToolsExtension =
{
  consoleIs,
  loggerIs : is,
  loggerLike : like,
}

//

Object.assign( _, ToolsExtension );

// --
// logger extension
// --

let LoggerExtension =
{
  is,
  like,
  from,
  relative,
}

//

Object.assign( _.logger, LoggerExtension );

})();