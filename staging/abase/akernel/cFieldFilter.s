( function _FieldFilter_s_() {

'use strict';

if( typeof module !== 'undefined' && typeof wBase === 'undefined' )
{

  require( './aKernel.s' );

}

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// map filter
// --

function bypass()
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

function srcAndDstOwn()
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

function srcOwn()
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

function srcOwnRoutines()
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

function dstNotHasSrcOwnRoutines()
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

function dstNotHas()
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

function dstNotHasCloning()
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

function dstNotHasSrcOwn()
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

function dstNotHasSrcOwnCloning()
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

function dstNotOwn()
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

function dstNotOwnSrcOwnCloning()
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

function dstNotOwnNotUndefinedCloning()
{

  var routine = function dstNotOwnNotUndefinedCloning( dstContainer,srcContainer,key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    {

      if( dstContainer[ key ] !== undefined )
      return;

    }

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

function cloning()
{

  var routine = function cloning( dstContainer,srcContainer,key )
  {
    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

function cloningSrcOwn()
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

function atomic()
{

  var routine = function atomic( dstContainer,srcContainer,key )
  {
    if( !_.atomicIs( srcContainer[ key ] ) )
    return false;
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

function atomicSrcOwn()
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

function notAtomicCloning()
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

function notAtomicCloningSrcOwn()
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

function notAtomicCloningRecursiveSrcOwn()
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

function recursiveClonning()
{

  var routine = function recursiveClonning( dstContainer,srcContainer,key )
  {
    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

function recursiveCloningSrcOwn()
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

function dstNotHasRecursiveClonning()
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

function drop( dropContainer )
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

function and()
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

// function makeMapper( routine )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.routineIs( routine ) );
//   _.assert( _.strIs( routine.functionKind ) );
//
//   if( routine.functionKind === 'field-filter' )
//   {
//     function r( dstContainer,srcContainer,key )
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
// function makeMapperRecursive( routine )
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
//     function r( dstContainer,srcContainer,key )
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
  dstNotOwnNotUndefinedCloning : dstNotOwnNotUndefinedCloning,

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
