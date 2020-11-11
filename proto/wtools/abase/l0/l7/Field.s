( function _Field_s_()
{

'use strict';

let Self = _global_.wTools.field = _global_.wTools.field || Object.create( null );
let _global = _global_;
let _ = _global_.wTools;

// --
//
// --

function bypass()
{
  let routine = bypass;

  routine.functionFamily = 'field-filter';
  return routine;

  function bypass( dstContainer, srcContainer, key )
  {
    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }
}

bypass.functionFamily = 'field-filter';

//

function assigning()
{
  let routine = assigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function assigning( dstContainer, srcContainer, key )
  {
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

assigning.functionFamily = 'field-mapper';

//

function primitive()
{
  let routine = primitive;
  routine.functionFamily = 'field-filter';
  return routine;

  function primitive( dstContainer, srcContainer, key )
  {
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    return true;
  }
}

primitive.functionFamily = 'field-filter';

//

function hiding()
{
  let routine = hiding;

  routine.functionFamily = 'field-mapper';
  return routine;

  function hiding( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

}

hiding.functionFamily = 'field-mapper';

//

function appendingAnything()
{
  let routine = appendingAnything;

  routine.functionFamily = 'field-mapper';
  return routine;

  function appendingAnything( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] === undefined )
    dstContainer[ key ] = srcContainer[ key ];
    else if( _.arrayIs( dstContainer[ key ] ) )
    dstContainer[ key ] = _.arrayAppendArrays( dstContainer[ key ], [ srcContainer[ key ] ] );
    else
    dstContainer[ key ] = _.arrayAppendArrays( [], [ dstContainer[ key ], srcContainer[ key ] ] );
  }

}

appendingAnything.functionFamily = 'field-mapper';

//

function prependingAnything()
{
  let routine = prependingAnything;

  routine.functionFamily = 'field-mapper';
  return routine;

  function prependingAnything( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] === undefined )
    dstContainer[ key ] = srcContainer[ key ];
    else if( _.arrayIs( dstContainer[ key ] ) )
    dstContainer[ key ] = _.arrayPrependArrays( dstContainer[ key ], [ srcContainer[ key ] ] );
    else
    dstContainer[ key ] = _.arrayPrependArrays( [], [ dstContainer[ key ], srcContainer[ key ] ] );
  }

}

prependingAnything.functionFamily = 'field-mapper';

//

function appendingOnlyArrays()
{
  let routine = appendingOnlyArrays;

  routine.functionFamily = 'field-mapper';
  return routine;

  function appendingOnlyArrays( dstContainer, srcContainer, key )
  {
    if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
    _.arrayAppendArray( dstContainer[ key ], srcContainer[ key ] );
    else
    dstContainer[ key ] = srcContainer[ key ];
  }

}

appendingOnlyArrays.functionFamily = 'field-mapper';

//

function appendingOnce()
{
  let routine = appendingOnce;
  routine.functionFamily = 'field-mapper';
  return routine;

  function appendingOnce( dstContainer, srcContainer, key )
  {
    if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
    _.arrayAppendArrayOnce( dstContainer[ key ], srcContainer[ key ] );
    else
    dstContainer[ key ] = srcContainer[ key ];
  }

}

appendingOnce.functionFamily = 'field-mapper';

//

function removing()
{
  let routine = removing;
  routine.functionFamily = 'field-mapper';
  return routine;

  function removing( dstContainer, srcContainer, key )
  {
    let dstElement = dstContainer[ key ];
    let srcElement = srcContainer[ key ];
    if( _.arrayIs( dstElement ) && _.arrayIs( srcElement ) )
    {
      if( dstElement === srcElement )
      dstContainer[ key ] = [];
      else
      _.arrayRemoveArrayOnce( dstElement, srcElement );
    }
    else if( dstElement === srcElement )
    {
      delete dstContainer[ key ];
    }
  }

}

removing.functionFamily = 'field-mapper';

//

function notPrimitiveAssigning()
{
  let routine = notPrimitiveAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function notPrimitiveAssigning( dstContainer, srcContainer, key )
  {
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

notPrimitiveAssigning.functionFamily = 'field-mapper';

//

function assigningRecursive()
{
  let routine = assigningRecursive;
  routine.functionFamily = 'field-mapper';
  return routine;

  function assigningRecursive( dstContainer, srcContainer, key )
  {
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key, _.entityAssignFieldFromContainer );
  }

}

assigningRecursive.functionFamily = 'field-mapper';

//

function drop( dropContainer )
{

  debugger;

  _.assert( _.objectIs( dropContainer ) );

  let routine = drop;

  routine.functionFamily = 'field-filter';
  return routine;

  function drop( dstContainer, srcContainer, key )
  {
    if( dropContainer[ key ] !== undefined )
    return false

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

}

drop.functionFamily = 'field-filter';

// --
// src
// --

function srcDefined()
{
  let routine = srcDefined;
  routine.functionFamily = 'field-filter'; ;
  return routine;

  function srcDefined( dstContainer, srcContainer, key )
  {
    if( srcContainer[ key ] === undefined )
    return false;
    return true;
  }
}

srcDefined.functionFamily = 'field-filter';

//

function dstNotHasOrSrcNotNull()
{
  let routine = dstNotHasOrSrcNotNull;
  routine.functionFamily = 'field-filter'; ;
  return routine;
  function dstNotHasOrSrcNotNull( dstContainer, srcContainer, key )
  {
    if( key in dstContainer && srcContainer[ key ] === null )
    return false;
    return true;
  }
}

dstNotHasOrSrcNotNull.functionFamily = 'field-filter';

// --
// dst
// --

function dstNotConstant()
{
  let routine = dstNotConstant;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotConstant( dstContainer, srcContainer, key )
  {
    let d = Object.getOwnPropertyDescriptor( dstContainer, key );
    if( !d )
    return true;
    if( !d.writable )
    return false;
    return true;
  }

}

dstAndSrcOwn.functionFamily = 'field-filter';

//

function dstAndSrcOwn()
{
  let routine = dstAndSrcOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstAndSrcOwn( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !Object.hasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

}

dstAndSrcOwn.functionFamily = 'field-filter';

//

function dstUndefinedSrcNotUndefined()
{
  let routine = dstUndefinedSrcNotUndefined;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstUndefinedSrcNotUndefined( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] !== undefined )
    return false;
    if( srcContainer[ key ] === undefined )
    return false;
    return true;
  }

}

dstUndefinedSrcNotUndefined.functionFamily = 'field-filter';

// --
// dstNotHas
// --

function dstNotHas()
{
  let routine = dstNotHas;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotHas( dstContainer, srcContainer, key )
  {

    if( key in dstContainer )
    return false;

    return true;
  }

}

dstNotHas.functionFamily = 'field-filter';

//

function dstNotHasOrHasNull()
{
  let routine = dstNotHasOrHasNull;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotHasOrHasNull( dstContainer, srcContainer, key )
  {
    if( key in dstContainer && dstContainer[ key ] !== null )
    return false;
    return true;
  }

}

dstNotHasOrHasNull.functionFamily = 'field-filter';

//

function dstNotHasOrHasNil()
{
  let routine = dstNotHasOrHasNil;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotHasOrHasNil( dstContainer, srcContainer, key )
  {

    if( key in dstContainer && dstContainer[ key ] !== _.nothing )
    return false;

    return true;
  }

}

dstNotHasOrHasNil.functionFamily = 'field-filter';

//

function dstNotHasAssigning()
{
  let routine = dstNotHasAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotHasAssigning( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

dstNotHasAssigning.functionFamily = 'field-mapper';

//

function dstNotHasAppending()
{
  let routine = dstNotHasAppending;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotHasAppending( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    {
      debugger;
      if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
      _.arrayAppendArray( dstContainer, srcContainer, key );
      return;
    }
    dstContainer[ key ] = srcContainer[ key ];
  }

}

dstNotHasAppending.functionFamily = 'field-mapper';

//

function dstNotHasSrcPrimitive()
{
  let routine = dstNotHasSrcPrimitive;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotHasSrcPrimitive( dstContainer, srcContainer, key )
  {
    debugger;
    if( key in dstContainer )
    return false;

    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

dstNotHasSrcPrimitive.functionFamily = 'field-filter';

//

function dstNotHasSrcOwn()
{
  let routine = dstNotHasSrcOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotHasSrcOwn( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    if( key in dstContainer )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

}

dstNotHasSrcOwn.functionFamily = 'field-filter';

//

function dstNotHasSrcOwnAssigning()
{
  let routine = dstNotHasSrcOwnAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotHasSrcOwnAssigning( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return;
    if( key in dstContainer )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

dstNotHasSrcOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotHasSrcOwnRoutines()
{
  let routine = dstNotHasSrcOwnRoutines;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotHasSrcOwnRoutines( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;
    if( key in dstContainer )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/

    return true;
  }

}

dstNotHasSrcOwnRoutines.functionFamily = 'field-filter';

//

function dstNotHasAssigningRecursive()
{
  let routine = dstNotHasAssigningRecursive;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotHasAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key, _.entityAssignFieldFromContainer );
  }

}

dstNotHasAssigningRecursive.functionFamily = 'field-mapper';

// --
// dstNotOwn
// --

function dstNotOwn()
{
  let routine = dstNotOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotOwn( dstContainer, srcContainer, key )
  {

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

}

dstNotOwn.functionFamily = 'field-filter';

//

function dstNotOwnSrcOwn()
{
  let routine = dstNotOwnSrcOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstNotOwnSrcOwn( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

}

dstNotOwnSrcOwn.functionFamily = 'field-filter';

//

function dstNotOwnSrcOwnAssigning()
{
  let routine = dstNotOwnSrcOwnAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotOwnSrcOwnAssigning( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return;

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

dstNotOwnSrcOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnOrUndefinedAssigning()
{
  let routine = dstNotOwnOrUndefinedAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotOwnOrUndefinedAssigning( dstContainer, srcContainer, key )
  {

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    {

      if( dstContainer[ key ] !== undefined )
      return;

    }

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

dstNotOwnOrUndefinedAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnAssigning()
{
  let routine = dstNotOwnAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotOwnAssigning( dstContainer, srcContainer, key )
  {

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return;

    let srcElement = srcContainer[ key ];
    if( _.mapIs( srcElement ) || _.arrayIs( srcElement ) )
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
    else
    dstContainer[ key ] = srcContainer[ key ];

  }

}

dstNotOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnAppending()
{
  let routine = dstNotOwnAppending;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotOwnAppending( dstContainer, srcContainer, key )
  {
    debugger;
    if( dstContainer[ key ] !== undefined )
    {
      debugger;
      if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
      _.arrayAppendArray( dstContainer, srcContainer, key );
    }
    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return;
    dstContainer[ key ] = srcContainer[ key ];
  }

}

dstNotOwnAppending.functionFamily = 'field-mapper';

//

function dstNotOwnFromDefinition()
{
  let routine = dstNotOwnFromDefinition;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotOwnFromDefinition( dstContainer, srcContainer, key )
  {

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return;

    if( Object.hasOwnProperty.call( dstContainer, Symbol.for( key ) ) )
    return;

    let srcElement = srcContainer[ key ];
    if( _.definitionIs( srcElement ) )
    dstContainer[ key ] = srcElement.valueGenerate();
    else
    dstContainer[ key ] = srcElement;

  }

}

//

function dstNotOwnFromDefinitionStrictlyPrimitive()
{
  let routine = dstNotOwnFromDefinitionStrictlyPrimitive;
  routine.functionFamily = 'field-mapper';
  return routine;

  function dstNotOwnFromDefinitionStrictlyPrimitive( dstContainer, srcContainer, key )
  {

    // if( key === 'downloadPath' )
    // debugger;

    if( Object.hasOwnProperty.call( dstContainer, key ) )
    return;

    if( Object.hasOwnProperty.call( dstContainer, Symbol.for( key ) ) )
    return;

    let srcElement = srcContainer[ key ];
    if( _.definitionIs( srcElement ) )
    {
      dstContainer[ key ] = srcElement.valueGenerate();
    }
    else
    {
      _.assert
      (
        !_.consequenceIs( srcElement ) && ( _.primitiveIs( srcElement ) || _.routineIs( srcElement ) ),
        () => `${ _.strEntityShort( dstContainer ) } has non-primitive element "${ key }" use _.define.own instead`
      );
      dstContainer[ key ] = srcElement;
    }

  }

}

// --
// dstHas
// --

function dstHasMaybeUndefined()
{
  let routine = dstHasMaybeUndefined;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstHasMaybeUndefined( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    return true;
    return false;
  }

}

dstHasMaybeUndefined.functionFamily = 'field-filter';

//

function dstHasButUndefined()
{
  let routine = dstHasButUndefined;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstHasButUndefined( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] === undefined )
    return false;
    return true;
  }

}

dstHasButUndefined.functionFamily = 'field-filter';

//

function dstHasSrcOwn()
{
  let routine = dstHasSrcOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstHasSrcOwn( dstContainer, srcContainer, key )
  {
    if( !( key in dstContainer ) )
    return false;
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    return true;
  }

}

dstHasSrcOwn.functionFamily = 'field-filter';

//

function dstHasSrcNotOwn()
{
  let routine = dstHasSrcNotOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function dstHasSrcNotOwn( dstContainer, srcContainer, key )
  {
    if( !( key in dstContainer ) )
    return false;
    if( Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    return true;
  }

}

dstHasSrcNotOwn.functionFamily = 'field-filter';

// --
// srcOwn
// --

function srcOwn()
{
  let routine = srcOwn;
  routine.functionFamily = 'field-filter';
  return routine;

  function srcOwn( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

}

srcOwn.functionFamily = 'field-filter';

//

function srcOwnRoutines()
{
  let routine = srcOwnRoutines;
  routine.functionFamily = 'field-filter'; ;
  return routine;

  function srcOwnRoutines( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

}

srcOwnRoutines.functionFamily = 'field-filter';

//

function srcOwnAssigning()
{
  let routine = assigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function assigning( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

srcOwnAssigning.functionFamily = 'field-mapper';

//

function srcOwnPrimitive()
{
  let routine = srcOwnPrimitive;
  routine.functionFamily = 'field-filter';
  return routine;

  function srcOwnPrimitive( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

}

srcOwnPrimitive.functionFamily = 'field-filter';

//

function srcOwnNotPrimitiveAssigning()
{
  let routine = srcOwnNotPrimitiveAssigning;
  routine.functionFamily = 'field-mapper';
  return routine;

  function srcOwnNotPrimitiveAssigning( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

}

srcOwnNotPrimitiveAssigning.functionFamily = 'field-mapper';

//

function srcOwnNotPrimitiveAssigningRecursive()
{
  let routine = srcOwnNotPrimitiveAssigningRecursive;
  routine.functionFamily = 'field-mapper';
  return routine;

  function srcOwnNotPrimitiveAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key, _.entityAssignFieldFromContainer );
  }

}

srcOwnNotPrimitiveAssigningRecursive.functionFamily = 'field-mapper';

//

function srcOwnAssigningRecursive()
{
  let routine = srcOwnAssigningRecursive;
  routine.functionFamily = 'field-mapper';
  return routine;

  function srcOwnAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( !Object.hasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key, _.entityAssignFieldFromContainer );
  }

}

srcOwnAssigningRecursive.functionFamily = 'field-mapper';

// --
//
// --

function and()
{

  let filters = [];
  let mappers = [];
  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let routine = arguments[ a ];
    _.assert( _.routineIs( routine ) );
    _.assert( _.strIs( routine.functionFamily ) );
    if( routine.functionFamily === 'field-filter' )
    filters.push( routine );
    else if( routine.functionFamily === 'field-mapper' )
    mappers.push( routine );
    else throw _.err( 'Expects routine.functionFamily' );
  }

  if( mappers.length > 1 )
  throw _.err( 'can combineMethodUniform only one mapper with any number of filters' );

  let routine = and;

  routine.functionFamily = mappers.length ? 'field-mapper' : 'field-filter';
  return routine;

  function and( dstContainer, srcContainer, key )
  {

    for( let f = 0 ; f < filters.length ; f++ )
    {
      let filter = filters[ f ];

      let result = filter( dstContainer, srcContainer, key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return mappers.length ? undefined : false;
    }

    for( let m = 0 ; m < mappers.length ; m++ )
    {
      let mapper = mappers[ m ];

      let result = mapper( dstContainer, srcContainer, key );
      _.assert( result === undefined );
      return;
    }

    return mappers.length ? undefined : true;
  }

}

//

function mapperFromFilter( routine )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.routineIs( routine ), 'Expects routine but got', _.strType( routine ) );
  _.assert( _.strIs( routine.functionFamily ) );

  if( routine.functionFamily === 'field-filter' )
  {
    r.functionFamily = 'field-mapper';
    return r;
  }
  else if( routine.functionFamily === 'field-mapper' )
  {
    return routine;
  }
  else _.assert( 0, 'Expects routine.functionFamily' );

  function r( dstContainer, srcContainer, key )
  {
    let result = routine( dstContainer, srcContainer, key );
    _.assert( _.boolIs( result ) );
    if( result === false )
    return;
    dstContainer[ key ] = srcContainer[ key ];
  }

}

//
//
// function mapperFromFilterRecursive( routine )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.routineIs( routine ) );
//   _.assert( _.strIs( routine.functionFamily ) );
//
//   debugger;
//
//   if( routine.functionFamily === 'field-filter' )
//   {
//     function r( dstContainer, srcContainer, key )
//     {
//       debugger;
//       let result = routine( dstContainer, srcContainer, key );
//       _.assert( _.boolIs( result ) );
//       if( result === false )
//       return;
//       dstContainer[ key ] = srcContainer[ key ];
//     }
//     r.functionFamily = 'field-mapper';
//     return r;
//   }
//   else if( routine.functionFamily === 'field-mapper' )
//   {
//     return routine;
//   }
//   else throw _.err( 'Expects routine.functionFamily' );
//
// }

// --
// setup
// --

function setup()
{

  for( let f in make )
  {
    let fi = make[ f ];

    if( fi.length )
    continue;

    fi = fi();

    if( fi.functionFamily === 'field-mapper' )
    {
      Extension.mapper[ f ] = fi;
    }
    else if( fi.functionFamily === 'field-filter' )
    {
      Extension.filter[ f ] = fi;
      Extension.mapper[ f ] = mapperFromFilter( fi );
    }
    else _.assert( 0, 'unexpected' );

  }

}

// --
// make
// --

let make =
{

  //

  bypass,
  assigning,
  primitive,
  hiding,
  appendingAnything,
  prependingAnything,
  appendingOnlyArrays,
  appendingOnce,
  removing,
  notPrimitiveAssigning,
  assigningRecursive,
  drop,

  // src

  srcDefined,
  dstNotHasOrSrcNotNull,

  // dst

  dstNotConstant,
  dstAndSrcOwn,
  dstUndefinedSrcNotUndefined,

  // dstNotHas

  dstNotHas,
  dstNotHasOrHasNull,
  dstNotHasOrHasNil,

  dstNotHasAssigning,
  dstNotHasAppending,
  dstNotHasSrcPrimitive,

  dstNotHasSrcOwn,
  dstNotHasSrcOwnAssigning,
  dstNotHasSrcOwnRoutines,
  dstNotHasAssigningRecursive,

  // dstNotOwn

  dstNotOwn,
  dstNotOwnSrcOwn,
  dstNotOwnSrcOwnAssigning,
  dstNotOwnOrUndefinedAssigning,
  dstNotOwnAssigning,
  dstNotOwnAppending,
  dstNotOwnFromDefinition,
  dstNotOwnFromDefinitionStrictlyPrimitive,

  // dstHas

  dstHasMaybeUndefined,
  dstHasButUndefined,
  dstHasSrcOwn,
  dstHasSrcNotOwn,

  // srcOwn

  srcOwn,
  srcOwnRoutines,
  srcOwnAssigning,
  srcOwnPrimitive,
  srcOwnNotPrimitiveAssigning,
  srcOwnNotPrimitiveAssigningRecursive,
  srcOwnAssigningRecursive,

}

// --
// extend
// --

let Extension =
{

  make,
  mapper : Object.create( null ),
  filter : Object.create( null ),
  and,
  mapperFromFilter,

}

setup();

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
