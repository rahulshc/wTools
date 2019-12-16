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
  o.registeredCallbackMap = _.process._eventCallbackMap;
  _.event.on( o );

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
  o.registeredCallbackMap = _.process._eventCallbackMap;
  _.event.off( o );

  return o;
}

off.defaults =
{
  callbackMap : null,
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

let _eventCallbackMap =
{
  available : [],
}

let Extension =
{

  _eventCallbackMap,

  on,
  off,

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
