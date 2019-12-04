( function _fContainer_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.container;

// --
//
// --

function make()
{
  return _.entityMakeConstructing( ... arguments );
}

//

function extend( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.objectIs( src ) || _.longIs( src ) )
  {

    _.each( src, function( e, k )
    {
      dst[ k ] = e;
    });

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

function extendAppending( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.objectIs( src ) )
  {

    _.each( src, function( e, k )
    {
      dst[ k ] = e;
    });

  }
  else if( _.longIs( src ) )
  {

    if( dst === null || dst === undefined )
    dst = _.longSlice( src );
    else
    _.arrayAppendArray( dst, src );

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

function empty( dstContainer )
{
  if( _.longIs( dstContainer ) )
  _.longEmpty( dstContainer );
  else if( _.setIs( dstContainer ) )
  dstContainer.clear();
  else if( _.hashMapIs( dstContainer ) )
  dstContainer.clear();
  else if( _.mapLike( dstContainer ) )
  _.mapEmpty( dstContainer );
  else
  _.assert( 0, `Not clear how to empty non-container ${_.strType( dstContainer )}` );
  return dstContainer;
}

// --
// define
// --

let Fields =
{
}

//

let Routines =
{

  extend,
  extendAppending,

  empty, /* qqq : implement coverage */

}

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
