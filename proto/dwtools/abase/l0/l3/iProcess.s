( function _iProcess_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.process = _.process || Object.create( null );

// --
//
// --

function on( o )
{

  o = _.event.on.pre( _.event.on, arguments );
  // o.ehandler = _.process._ehandler;
  _.event.on( _.process._ehandler, o );

  return o;
}

on.defaults =
{
  callbackMap : null,
}

//

function off( o )
{

  o = _.event.off.pre( _.event.off, arguments );
  // o.ehandler = _.process._ehandler;
  _.event.off( _.process._ehandler, o );

  return o;
}

off.defaults =
{
  callbackMap : null,
}

//

function hasEventHandler( o )
{
  o = _.event.hasEventHandler.pre( _.event.hasEventHandler, arguments );
  // o.ehandler = _.process._ehandler;
  return _.event.hasEventHandler( _.process._ehandler, o );
  // return o;
}

hasEventHandler.defaults =
{
  eventName : null,
  eventHandler : null,
}

//

function entryPointStructure()
{
  let result = Object.create( null );
  if( _global.process !== undefined )
  {
    if( _global.process.argv )
    result.execPath = _global.process.argv.join( ' ' );
    if( _.routineIs( _global.process.cwd ) )
    result.currentPath = _global.process.cwd();
  }
  return result;
}

//

function entryPointInfo()
{
  let data = _.process.entryPointStructure();
  let result = '';

  if( data.currentPath )
  result = join( 'Current path', data.currentPath );
  if( data.execPath )
  result = join( 'Exec path', data.execPath );

  return result;

  /* */

  function join( left, right )
  {
    if( result )
    result += '\n';
    result += left + ' : ' + right;
    return result;
  }
}

// --
// routines
// --

let Events =
{
  available : [],
}

let _ehandler =
{
  events : Events,
}

let Extension =
{

  _ehandler,

  on,
  off,
  hasEventHandler,

  entryPointStructure,
  entryPointInfo,

}

//

Object.assign( _.process, Extension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
