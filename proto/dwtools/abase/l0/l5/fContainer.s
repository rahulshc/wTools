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

// function extend( dst, src )
// {
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( _.mapLike( src ) || _.longLike( src ) )
//   {
//
//     _.each( src, function( e, k )
//     {
//       dst[ k ] = e;
//     });
//
//   }
//   else
//   {
//
//     dst = src;
//
//   }
//
//   return dst;
// }

//

/* qqq : cover */
function extendReplacing( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( dst === null )
  {

    if( _.mapLike( src ) )
    {
      dst = _.mapExtend( dst, src );
    }
    else if( _.longLike( src ) )
    {
      dst = _.arrayExtendAppending( dst, src );
    }
    else if( _.hasMapLike( src ) )
    {
      _.assert( 0, 'not tested' );
      dst = _.hashMapExtend( dst, src );
    }
    else if( _.setLike( src ) )
    {
      _.assert( 0, 'not tested' );
      dst = _.arraySetUnion_( dst, src );
    }
    else
    {
      dst = src;
    }

  }
  else if( _.mapLike( dst ) )
  {

    if( _.mapLike( src ) )
    dst = _.mapExtend( dst, src );
    else if( _.hashMapLike( src ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = src;

  }
  else if( _.longLike( dst ) )
  {

    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.hasMapLike( dst ) )
  {

    _.assert( 0, 'not tested' );
    if( _.hashMapLike( src ) || _.mapLike( src ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = src;

  }
  else if( _.setLike( dst ) )
  {

    _.assert( 0, 'not tested' );
    if( _.setLike( src ) || _.longLike( src ) )
    dst = _.arraySetUnion_( dst, src );
    else
    dst = src;

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

/* qqq : cover */
function extendAppending( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( dst === null )
  {

    if( _.mapLike( src ) )
    {
      dst = _.mapExtend( dst, src );
    }
    else if( _.longLike( src ) )
    {
      dst = _.arrayExtendAppending( dst, src );
    }
    else if( _.hasMapLike( src ) )
    {
      _.assert( 0, 'not tested' );
      dst = _.hashMapExtend( dst, src );
    }
    else if( _.setLike( src ) )
    {
      _.assert( 0, 'not tested' );
      dst = _.arraySetUnion_( dst, src );
    }
    else
    {
      dst = src;
    }

  }
  else if( _.mapLike( dst ) )
  {

    if( _.mapLike( src ) )
    dst = _.mapExtend( dst, src );
    else if( _.hashMapLike( src ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.longLike( dst ) )
  {

    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.hasMapLike( dst ) )
  {

    _.assert( 0, 'not tested' );
    if( _.hashMapLike( src ) || _.mapLike( src ) )
    dst = _.hashMapExtend( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else if( _.setLike( dst ) )
  {

    _.assert( 0, 'not tested' );
    if( _.setLike( src ) || _.longLike( src ) )
    dst = _.arraySetUnion_( dst, src );
    else
    dst = _.arrayExtendAppending( dst, src );

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

function extendAppendingRecursive( dst, src )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.mapLike( src ) )
  {

    if( dst === null || _.mapLike( dst ) )
    _.mapExtend( dst, src );
    else if( _.hashMapLike( dst ) )
    _.hashMapExtend( dst, src );
    else _.assert( 0 );

  }
  else if( _.longLike( src ) )
  {

    _.arrayExtendAppending( dst, src );

  }
  else if( _.hasMapLike( src ) )
  {

    _.assert( 0, 'not tested' );
    _.hashMapExtend( dst, src );

  }
  else if( _.setLike( src ) )
  {

    _.assert( 0, 'not tested' );
    _.arraySetUnion_( dst, src );


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
  if( _.longLike( dstContainer ) )
  _.longEmpty( dstContainer );
  else if( _.setLike( dstContainer ) )
  dstContainer.clear();
  else if( _.hashMapLike( dstContainer ) )
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

  extendAppending,
  extend : extendAppending,

  // extendAppendingRecursive,
  // extendRecursive : extendAppendingRecursive,

  empty, /* qqq2 : implement, document, covere */

}

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();