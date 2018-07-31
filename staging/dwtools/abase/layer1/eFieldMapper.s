( function _FieldMapper_s_() {

'use strict'; 

var Self = _global_.wTools;
var _global = _global_;
var _ = _global_.wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
//
// --

function bypass()
{

  var routine = function bypass( dstContainer, srcContainer, key )
  {
    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

bypass.functionFamily = 'field-filter';

//

function assigning()
{

  var routine = function assigning( dstContainer, srcContainer, key )
  {
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

assigning.functionFamily = 'field-mapper';

//

function primitive()
{

  var routine = function primitive( dstContainer, srcContainer, key )
  {
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

primitive.functionFamily = 'field-filter';

//

function hiding()
{

  var routine = function hiding( dstContainer, srcContainer, key )
  {
    Object.defineProperty( dstContainer, key,
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    });
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

hiding.functionFamily = 'field-mapper';

//

function appending()
{

  var routine = function appending( dstContainer, srcContainer, key )
  {
    if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
    _.arrayAppendArray( dstContainer[ key ], srcContainer[ key ] );
    else
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

appending.functionFamily = 'field-mapper';

//

function appendingOnce()
{

  var routine = function appendingOnce( dstContainer, srcContainer, key )
  {
    if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
    _.arrayAppendArrayOnce( dstContainer[ key ], srcContainer[ key ] );
    else
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

appendingOnce.functionFamily = 'field-mapper';

//

function removing()
{

  var routine = function removing( dstContainer, srcContainer, key )
  {
    var dstElement = dstContainer[ key ];
    var srcElement = srcContainer[ key ];
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

  routine.functionFamily = 'field-mapper';
  return routine;
}

removing.functionFamily = 'field-mapper';

//

function notPrimitiveAssigning()
{

  var routine = function notPrimitiveAssigning( dstContainer, srcContainer, key )
  {
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

notPrimitiveAssigning.functionFamily = 'field-mapper';

//

function assigningRecursive()
{

  var routine = function assigningRecursive( dstContainer, srcContainer, key )
  {
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

assigningRecursive.functionFamily = 'field-mapper';

//

function drop( dropContainer )
{

  debugger;

  _.assert( _.objectIs( dropContainer ) );

  var routine = function drop( dstContainer, srcContainer, key )
  {
    if( dropContainer[ key ] !== undefined )
    return false

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

drop.functionFamily = 'field-filter';

//

function srcDefined()
{

  var routine = function srcDefined( dstContainer, srcContainer, key )
  {
    if( srcContainer[ key ] === undefined )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter'; ;
  return routine;
}

srcDefined.functionFamily = 'field-filter';

// --
// dstNotHas
// --

function dstNotHas()
{

  var routine = function dstNotHas( dstContainer, srcContainer, key )
  {

    // if( dstContainer[ key ] !== undefined )
    // return false;

    if( key in dstContainer )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHas.functionFamily = 'field-filter';

//

function dstNotHasOrHasNull()
{

  var routine = function dstNotHasOrHasNull( dstContainer, srcContainer, key )
  {

    if( key in dstContainer && dstContainer[ key ] !== null )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasOrHasNull.functionFamily = 'field-filter';

//

function dstNotHasOrHasNil()
{

  var routine = function dstNotHasOrHasNil( dstContainer, srcContainer, key )
  {

    if( key in dstContainer && dstContainer[ key ] !== _.nothing )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasOrHasNil.functionFamily = 'field-filter';

//

function dstNotHasAssigning()
{

  var routine = function dstNotHasAssigning( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasAssigning.functionFamily = 'field-mapper';

//

function dstNotHasAppending()
{

  var routine = function dstNotHasAppending( dstContainer, srcContainer, key )
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

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasAppending.functionFamily = 'field-mapper';

//

function dstNotHasSrcPrimitive()
{

  var routine = function dstNotHasSrcPrimitive( dstContainer, srcContainer, key )
  {
    debugger;
    if( key in dstContainer )
    return false;

    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';

  return routine;
}

dstNotHasSrcPrimitive.functionFamily = 'field-filter';

//

function dstNotHasSrcOwn()
{

  var routine = function dstNotHasSrcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( key in dstContainer )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasSrcOwn.functionFamily = 'field-filter';

//

function dstNotHasSrcOwnAssigning()
{

  var routine = function dstNotHasSrcOwnAssigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( key in dstContainer )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasSrcOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotHasSrcOwnRoutines()
{

  var routine = function dstNotHasSrcOwnRoutines( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;
    if( key in dstContainer )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotHasSrcOwnRoutines.functionFamily = 'field-filter';

//

function dstNotHasAssigningRecursive()
{

  var routine = function dstNotHasAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotHasAssigningRecursive.functionFamily = 'field-mapper';

// --
// dstNotOwn
// --

function dstNotOwn()
{

  var routine = function dstNotOwn( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotOwn.functionFamily = 'field-filter';

//

function dstNotOwnSrcOwn()
{

  var routine = function dstNotOwnSrcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstNotOwnSrcOwn.functionFamily = 'field-filter';

//

function dstNotOwnSrcOwnAssigning()
{

  var routine = function dstNotOwnSrcOwnAssigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnSrcOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnOrUndefinedAssigning()
{

  var routine = function dstNotOwnOrUndefinedAssigning( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    {

      if( dstContainer[ key ] !== undefined )
      return;

    }

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnOrUndefinedAssigning.functionFamily = 'field-mapper';

// //
//
// function dstNotOwnAssigning()
// {
//
//   var routine = function dstNotOwnAssigning( dstContainer, srcContainer, key )
//   {
//
//     if( _ObjectHasOwnProperty.call( dstContainer, key ) )
//     {
//
//       if( key in dstContainer )
//       return;
//
//     }
//
//     _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
//   }
//
//   routine.functionFamily = 'field-mapper';
//   return routine;
// }

//

function dstNotOwnAssigning()
{

  var routine = function dstNotOwnAssigning( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    var srcElement = srcContainer[ key ];
    if( _.mapIs( srcElement ) || _.arrayIs( srcElement ) )
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
    else
    dstContainer[ key ] = srcContainer[ key ];

  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnAssigning.functionFamily = 'field-mapper';

//

function dstNotOwnAppending()
{

  var routine = function dstNotOwnAppending( dstContainer, srcContainer, key )
  {
    debugger;
    if( dstContainer[ key ] !== undefined )
    {
      debugger;
      if( _.arrayIs( dstContainer[ key ] ) && _.arrayIs( srcContainer[ key ] ) )
      _.arrayAppendArray( dstContainer, srcContainer, key );
    }
    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;
    dstContainer[ key ] = srcContainer[ key ];
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

dstNotOwnAppending.functionFamily = 'field-mapper';

//

function dstNotOwnFromDefinition()
{

  var routine = function dstNotOwnFromDefinition( dstContainer, srcContainer, key )
  {

    if( _ObjectHasOwnProperty.call( dstContainer, key ) )
    return;

    var srcElement = srcContainer[ key ];
    // if( _.definitionIs( srcElement ) )
    // debugger;
    if( _.definitionIs( srcElement ) )
    dstContainer[ key ] = srcElement.valueGet();
    else
    dstContainer[ key ] = srcContainer[ key ];

  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

// --
// dstHas
// --

function dstHasMaybeUndefined()
{

  var routine = function dstHasMaybeUndefined( dstContainer, srcContainer, key )
  {
    if( key in dstContainer )
    return true;
    return false;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasMaybeUndefined.functionFamily = 'field-filter';

//

function dstHasButUndefined()
{

  var routine = function dstHasButUndefined( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] === undefined )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasButUndefined.functionFamily = 'field-filter';

//

function dstHasSrcOwn()
{

  var routine = function dstHasSrcOwn( dstContainer, srcContainer, key )
  {
    if( !( key in dstContainer ) )
    return false;
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasSrcOwn.functionFamily = 'field-filter';

//

function dstHasSrcNotOwn()
{

  var routine = function dstHasSrcNotOwn( dstContainer, srcContainer, key )
  {
    if( !( key in dstContainer ) )
    return false;
    if( _ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstHasSrcNotOwn.functionFamily = 'field-filter';

// --
//
// --

function dstAndSrcOwn()
{

  var routine = function dstAndSrcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_ObjectHasOwnProperty.call( dstContainer, key ) )
    return false;

    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstAndSrcOwn.functionFamily = 'field-filter';

//

function dstUndefinedSrcNotUndefined()
{

  var routine = function dstUndefinedSrcNotUndefined( dstContainer, srcContainer, key )
  {
    if( dstContainer[ key ] !== undefined )
    return false;
    if( srcContainer[ key ] === undefined )
    return false;
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

dstUndefinedSrcNotUndefined.functionFamily = 'field-filter';

// --
// srcOwn
// --

function srcOwn()
{

  var routine = function srcOwn( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

srcOwn.functionFamily = 'field-filter';

//

function srcOwnRoutines()
{

  var routine = function srcOwnRoutines( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter'; ;
  return routine;
}

srcOwnRoutines.functionFamily = 'field-filter';

//

function srcOwnAssigning()
{

  var routine = function assigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnAssigning.functionFamily = 'field-mapper';

//

function srcOwnPrimitive()
{

  var routine = function srcOwnPrimitive( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.primitiveIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionFamily = 'field-filter';
  return routine;
}

srcOwnPrimitive.functionFamily = 'field-filter';

//

function srcOwnNotPrimitiveAssigning()
{

  var routine = function srcOwnNotPrimitiveAssigning( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnNotPrimitiveAssigning.functionFamily = 'field-mapper';

//

function srcOwnNotPrimitiveAssigningRecursive()
{

  var routine = function srcOwnNotPrimitiveAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.primitiveIs( srcContainer[ key ] ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnNotPrimitiveAssigningRecursive.functionFamily = 'field-mapper';

//

function srcOwnAssigningRecursive()
{

  var routine = function srcOwnAssigningRecursive( dstContainer, srcContainer, key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key,_.entityAssignFieldFromContainer );
  }

  routine.functionFamily = 'field-mapper';
  return routine;
}

srcOwnAssigningRecursive.functionFamily = 'field-mapper';

// --
//
// --

function and()
{

  var filters = [];
  var mappers = [];
  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var routine = arguments[ a ];
    _.assert( _.routineIs( routine ) );
    _.assert( _.strIs( routine.functionFamily ) );
    if( routine.functionFamily === 'field-filter' )
    filters.push( routine );
    else if( routine.functionFamily === 'field-mapper' )
    mappers.push( routine );
    else throw _.err( 'expects routine.functionFamily' );
  }

  if( mappers.length > 1 )
  throw _.err( 'can combineMethodUniform only one mapper with any number of filters' );

  var routine = function and( dstContainer, srcContainer, key )
  {

    for( var f = 0 ; f < filters.length ; f++ )
    {
      var filter = filters[ f ];

      var result = filter( dstContainer, srcContainer, key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return mappers.length ? undefined : false;
    }

    for( var m = 0 ; m < mappers.length ; m++ )
    {
      var mapper = mappers[ m ];

      var result = mapper( dstContainer, srcContainer, key );
      _.assert( result === undefined );
      return;
    }

    return mappers.length ? undefined : true;
  }

  routine.functionFamily = mappers.length ? 'field-mapper' : 'field-filter';
  return routine;
}

//

function mapperFromFilter( routine )
{

  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( _.routineIs( routine ),'expects routine but got',_.strTypeOf( routine ) );
  _.assert( _.strIs( routine.functionFamily ) );

  if( routine.functionFamily === 'field-filter' )
  {
    function r( dstContainer, srcContainer, key )
    {
      var result = routine( dstContainer, srcContainer, key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return;
      dstContainer[ key ] = srcContainer[ key ];
    }
    r.functionFamily = 'field-mapper';
    return r;
  }
  else if( routine.functionFamily === 'field-mapper' )
  {
    return routine;
  }
  else _.assert( 0,'expects routine.functionFamily' );

}

//
//
// function mapperFromFilterRecursive( routine )
// {
//
//   _.assert( arguments.length === 1, 'expects single argument' );
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
//       var result = routine( dstContainer, srcContainer, key );
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
//   else throw _.err( 'expects routine.functionFamily' );
//
// }

// --
// setup
// --

function setup()
{

  for( var f in make )
  {
    var fi = make[ f ];

    if( fi.length )
    continue;

    fi = fi();

    if( fi.functionFamily === 'field-mapper' )
    {
      field.mapper[ f ] = fi;
    }
    else if( fi.functionFamily === 'field-filter' )
    {
      field.filter[ f ] = fi;
      field.mapper[ f ] = mapperFromFilter( fi );
    }
    else _.assert( 0,'unexpected' );

  }

}

// --
// make
// --

var make =
{

  //

  bypass : bypass,
  assigning : assigning,
  primitive : primitive,
  hiding : hiding,
  appending : appending,
  appendingOnce : appendingOnce,
  removing : removing,
  notPrimitiveAssigning : notPrimitiveAssigning,
  assigningRecursive : assigningRecursive,
  drop : drop,

  srcDefined : srcDefined,

  // dstNotHas

  dstNotHas : dstNotHas,
  dstNotHasOrHasNull : dstNotHasOrHasNull,
  dstNotHasOrHasNil : dstNotHasOrHasNil,

  dstNotHasAssigning : dstNotHasAssigning,
  dstNotHasAppending : dstNotHasAppending,
  dstNotHasSrcPrimitive : dstNotHasSrcPrimitive,

  dstNotHasSrcOwn : dstNotHasSrcOwn,
  dstNotHasSrcOwnAssigning : dstNotHasSrcOwnAssigning,
  dstNotHasSrcOwnRoutines : dstNotHasSrcOwnRoutines,
  dstNotHasAssigningRecursive : dstNotHasAssigningRecursive,

  // dstNotOwn

  dstNotOwn : dstNotOwn,
  dstNotOwnSrcOwn : dstNotOwnSrcOwn,
  dstNotOwnSrcOwnAssigning : dstNotOwnSrcOwnAssigning,
  dstNotOwnOrUndefinedAssigning : dstNotOwnOrUndefinedAssigning,
  dstNotOwnAssigning : dstNotOwnAssigning,
  dstNotOwnAppending : dstNotOwnAppending,
  dstNotOwnFromDefinition : dstNotOwnFromDefinition,

  // dstHas

  dstHasMaybeUndefined : dstHasMaybeUndefined,
  dstHasButUndefined : dstHasButUndefined,
  dstHasSrcOwn : dstHasSrcOwn,
  dstHasSrcNotOwn : dstHasSrcNotOwn,

  //

  dstAndSrcOwn : dstAndSrcOwn,
  dstUndefinedSrcNotUndefined : dstUndefinedSrcNotUndefined,

  // srcOwn

  srcOwn : srcOwn,
  srcOwnRoutines : srcOwnRoutines,
  srcOwnAssigning : srcOwnAssigning,
  srcOwnPrimitive : srcOwnPrimitive,
  srcOwnNotPrimitiveAssigning : srcOwnNotPrimitiveAssigning,
  srcOwnNotPrimitiveAssigningRecursive : srcOwnNotPrimitiveAssigningRecursive,
  srcOwnAssigningRecursive : srcOwnAssigningRecursive,

}

// --
// namespace
// --

var field =
{
  make : make,
  mapper : Object.create( null ),
  filter : Object.create( null ),
  and : and,
  mapperFromFilter : mapperFromFilter,
}

setup();

// --
// extend
// --

var Extend =
{

  field : field,

}

Object.assign( Self,Extend );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
