//#! /usr/bin/env NODE
( function _FieldFilter_s_() {

'use strict';

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// map filter
// --

var bypass = function()
{

  var routine = function bypass( dstContainer,srcContainer,key )
  {
    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var srcAndDstOwn = function()
{

  var routine = function srcAndDstOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var srcOwn = function()
{

  var routine = function srcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var srcOwnRoutines = function()
{

  var routine = function srcOwnRoutines( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter'; ;
  return routine;
}

//

var dstNotHasSrcOwnRoutines = function()
{

  var routine = function dstNotHasSrcOwnRoutines( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;
    if( !dstContainer[ key ] !== undefined )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var dstNotHas = function()
{

  var routine = function dstNotHas( dstContainer,srcContainer,key )
  {

    if( key in dstContainer )
    return false;

    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var dstNotHasCloning = function()
{

  var routine = function dstNotHasCloning( dstContainer,srcContainer,key )
  {
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var dstNotHasSrcOwn = function()
{

  var routine = function dstNotHasSrcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( dstContainer[ key ] !== undefined )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var dstNotHasSrcOwnCloning = function()
{

  var routine = function dstNotHasSrcOwnCloning( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var dstNotOwn = function()
{

  var routine = function dstNotOwn( dstContainer,srcContainer,key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var dstNotOwnSrcOwnCloning = function()
{

  var routine = function dstNotOwnSrcOwnCloning( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var dstNotOwnCloning = function()
{

  var routine = function dstNotOwnCloning( dstContainer,srcContainer,key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var cloning = function()
{

  var routine = function cloning( dstContainer,srcContainer,key )
  {
    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var cloningSrcOwn = function()
{

  var routine = function cloning( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var atomic = function()
{

  var routine = function atomic( dstContainer,srcContainer,key )
  {
    if( !_.atomicIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var atomicSrcOwn = function()
{

  var routine = function atomicSrcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.atomicIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var notAtomicCloning = function()
{

  var routine = function notAtomicCloning( dstContainer,srcContainer,key )
  {
    if( _.atomicIs( srcContainer[ key ] ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var notAtomicCloningSrcOwn = function()
{

  var routine = function notAtomicCloningSrcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.atomicIs( srcContainer[ key ] ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var notAtomicCloningRecursiveSrcOwn = function()
{

  var routine = function notAtomicCloningRecursiveSrcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.atomicIs( srcContainer[ key ] ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var recursiveClonning = function()
{

  var routine = function recursiveClonning( dstContainer,srcContainer,key )
  {
    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var recursiveCloningSrcOwn = function()
{

  var routine = function recursiveCloningSrcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var dstNotHasRecursiveClonning = function()
{

  var routine = function dstNotHasRecursiveClonning( dstContainer,srcContainer,key )
  {
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var drop = function( dropContainer )
{

  _.assert( _.objectIs( dropContainer ) );

  var routine = function drop( dstContainer,srcContainer,key )
  {
    if( dropContainer[ key ] !== undefined )
    return false

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var and = function()
{

  var filters = [];
  var mappers = [];
  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var routine = arguments[ a ];
    _.assert( _.routineIs( routine ) );
    _.assert( _.strIs( routine.functionKind ) );
    if( routine.functionKind === 'field-filter' )
    filters.push( routine );
    else if( routine.functionKind === 'field-mapper' )
    mappers.push( routine );
    else throw _.err( 'expects routine.functionKind' );
  }

  if( mappers.length > 1 )
  throw _.err( 'can combine only one mapper with any number of filters' );

  var routine = function and( dstContainer,srcContainer,key )
  {

    for( var f = 0 ; f < filters.length ; f++ )
    {
      var filter = filters[ f ];

      var result = filter( dstContainer,srcContainer,key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return mappers.length ? undefined : false;
    }

    for( var m = 0 ; m < mappers.length ; m++ )
    {
      var mapper = mappers[ m ];

      var result = mapper( dstContainer,srcContainer,key );
      _.assert( result === undefined );
      return;
    }

    return mappers.length ? undefined : true;
  }

  routine.functionKind = mappers.length ? 'field-mapper' : 'field-filter';
  return routine;
}

//

// var makeMapper = function( routine )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.routineIs( routine ) );
//   _.assert( _.strIs( routine.functionKind ) );
//
//   if( routine.functionKind === 'field-filter' )
//   {
//     var r = function( dstContainer,srcContainer,key )
//     {
//       var result = routine( dstContainer,srcContainer,key );
//       _.assert( _.boolIs( result ) );
//       if( result === false )
//       return;
//       dstContainer[ key ] = srcContainer[ key ];
//     }
//     r.functionKind = 'field-mapper';
//     return r;
//   }
//   else if( routine.functionKind === 'field-mapper' )
//   {
//     return routine;
//   }
//   else throw _.err( 'expects routine.functionKind' );
//
// }
//
// //
//
// var makeMapperRecursive = function makeMapperRecursive( routine )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.routineIs( routine ) );
//   _.assert( _.strIs( routine.functionKind ) );
//
//   debugger;
//
//   if( routine.functionKind === 'field-filter' )
//   {
//     var r = function( dstContainer,srcContainer,key )
//     {
//       debugger;
//       var result = routine( dstContainer,srcContainer,key );
//       _.assert( _.boolIs( result ) );
//       if( result === false )
//       return;
//       dstContainer[ key ] = srcContainer[ key ];
//     }
//     r.functionKind = 'field-mapper';
//     return r;
//   }
//   else if( routine.functionKind === 'field-mapper' )
//   {
//     return routine;
//   }
//   else throw _.err( 'expects routine.functionKind' );
//
// }

//

var fieldFilter =
{

  bypass : bypass,

  srcAndDstOwn : srcAndDstOwn,

  srcOwn : srcOwn,
  srcOwnRoutines : srcOwnRoutines,
  dstNotHasSrcOwnRoutines : dstNotHasSrcOwnRoutines,

  dstNotHas : dstNotHas,
  dstNotHasCloning : dstNotHasCloning,
  dstNotHasSrcOwn : dstNotHasSrcOwn,
  dstNotHasSrcOwnCloning : dstNotHasSrcOwnCloning,

  dstNotOwn : dstNotOwn,
  dstNotOwnSrcOwnCloning : dstNotOwnSrcOwnCloning,
  dstNotOwnCloning : dstNotOwnCloning,

  cloning : cloning,
  cloningSrcOwn : cloningSrcOwn,

  atomic : atomic,
  atomicSrcOwn : atomicSrcOwn,

  notAtomicCloning : notAtomicCloning,
  notAtomicCloningSrcOwn : notAtomicCloningSrcOwn,
  notAtomicCloningRecursiveSrcOwn : notAtomicCloningRecursiveSrcOwn,

  recursiveClonning : recursiveClonning,
  recursiveCloningSrcOwn : recursiveCloningSrcOwn,
  dstNotHasRecursiveClonning : dstNotHasRecursiveClonning,

  drop : drop,

  and : and,

}

if( 0 )
for( var f in fieldFilter )
{
  _.assert( fieldFilter[ f ].functionKind === 'field-filter','field filter',f,'is not so' )
}

// --
// prototype
// --

var Proto =
{

  fieldFilter : fieldFilter,

}

_.mapExtend( Self, Proto );

})();
