( function _iEntity_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// container
// --

function containerIs( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.mapLike( src ) )
  return true;
  if( _.hashMapLike( src ) )
  return true;
  if( _.setLike( src ) )
  return true;
  return false;
}

//

function containerLike( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.objectLike( src ) )
  return true;
  if( _.hashMapLike( src ) )
  return true;
  if( _.setLike( src ) )
  return true;
  return false;
}

//

function hashMapIs( src )
{
  if( !src )
  return false;
  return src instanceof HashMap || src instanceof HashMapWeak;
}

//

function hashMapLike( src )
{
  return _.hashMapIs( src );
}

//

function hashMapIsEmpty()
{
  return !src.size;
}

//

function hashMapIsPopulated()
{
  return !!src.size;
}

//

function setIs( src )
{
  if( !src )
  return false;
  return src instanceof Set || src instanceof WeakSet;
}

//

function setLike( src )
{
  return _.setIs( src );
}

//

function setIsEmpty()
{
  return !src.size;
}

//

function setIsPopulated()
{
  return !!src.size;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  // container

  containerIs,
  containerLike,

  hashMapIs,
  hashMapLike,
  hashMapIsEmpty,
  hashMapIsPopulated,

  setIs,
  setLike,
  setIsEmpty,
  setIsPopulated,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
