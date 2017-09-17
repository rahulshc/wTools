( function _FieldMapper_s_() {

'use strict';

// if( typeof module !== 'undefined' && typeof wBase === 'undefined' )
// {
//   require( './aFundamental.s' );
// }

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
    if( dstContainer[ key ] !== undefined )
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

    // if( dstContainer[ key ] !== undefined )
    // return false;

    if( key in dstContainer )
    return false;

    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

function dstNotHasOrHasNull()
{

  var routine = function dstNotHasOrHasNull( dstContainer,srcContainer,key )
  {

    if( key in dstContainer && dstContainer[ key ] !== null )
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

function dstNotOwnSrcOwn()
{

  var routine = function dstNotOwnSrcOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionKind = 'field-mapper';
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

function dstNotOwnOrUndefinedCloning()
{

  var routine = function dstNotOwnOrUndefinedCloning( dstContainer,srcContainer,key )
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

function dstNotOwnCloning()
{

  var routine = function dstNotOwnCloning( dstContainer,srcContainer,key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    {

      if( key in dstContainer )
      return;

    }

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

function dstNotOwnClonningPureContainers()
{

  var routine = function dstNotOwnClonningPureContainers( dstContainer,srcContainer,key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    var srcElement = srcContainer[ key ];
    if( _.mapIs( srcElement ) || _.arrayIs( srcElement ) )
    _.entityCopyField( dstContainer,srcContainer,key );
    else
    dstContainer[ key ] = srcContainer[ key ];

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

    /*dstContainer[ key ] = srcContainer[ key ];*/
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
  throw _.err( 'can combineMethodUniform only one mapper with any number of filters' );

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

function makeMapper( routine )
{

  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ),'expects routine but got',_.strTypeOf( routine ) );
  _.assert( _.strIs( routine.functionKind ) );

  if( routine.functionKind === 'field-filter' )
  {
    function r( dstContainer,srcContainer,key )
    {
      var result = routine( dstContainer,srcContainer,key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return;
      dstContainer[ key ] = srcContainer[ key ];
    }
    r.functionKind = 'field-mapper';
    return r;
  }
  else if( routine.functionKind === 'field-mapper' )
  {
    return routine;
  }
  else throw _.err( 'expects routine.functionKind' );

}

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

var field =
{

  bypass : bypass,

  srcAndDstOwn : srcAndDstOwn,

  srcOwn : srcOwn,
  srcOwnRoutines : srcOwnRoutines,
  dstNotHasSrcOwnRoutines : dstNotHasSrcOwnRoutines,

  dstNotHas : dstNotHas,
  dstNotHasOrHasNull : dstNotHasOrHasNull,

  dstNotHasCloning : dstNotHasCloning,
  dstNotHasSrcOwn : dstNotHasSrcOwn,
  dstNotHasSrcOwnCloning : dstNotHasSrcOwnCloning,

  dstNotOwn : dstNotOwn,
  dstNotOwnSrcOwn : dstNotOwnSrcOwn,
  dstNotOwnSrcOwnCloning : dstNotOwnSrcOwnCloning,
  dstNotOwnOrUndefinedCloning : dstNotOwnOrUndefinedCloning,
  dstNotOwnCloning : dstNotOwnCloning,
  dstNotOwnClonningPureContainers : dstNotOwnClonningPureContainers,

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
  makeMapper : makeMapper,

}

// --
// prototype
// --

var Proto =
{

  field : field,

}

Object.assign( Self,Proto );

})();
