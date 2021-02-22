( function _l5_PropertyTransformer_s_()
{

'use strict';

let Self = _global_.wTools.property = _global_.wTools.property || Object.create( null );
let _global = _global_;
let _ = _global_.wTools;

// --
// routines
// --

function mapperFromFilter( routine )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.routineIs( routine ), 'Expects routine but got', _.entity.strType( routine ) );
  _.assert( !!routine.identity );

  if( routine.identity.propertyFilter )
  {
    if( routine.identity.functor )
    {
      functor.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
      return functor;
    }
    else
    {
      mapper.identity = { propertyMapper : true, propertyTransformer : true };
      return mapper;
    }
  }
  else if( routine.identity.propertyMapper )
  {
    return routine;
  }
  else _.assert( 0, 'Expects PropertyTransformer' );

  function mapper( dstContainer, srcContainer, key )
  {
    let result = routine( dstContainer, srcContainer, key );
    _.assert( _.bool.is( result ) );
    if( result === false )
    return;
    dstContainer[ key ] = srcContainer[ key ];
  }

  function functor()
  {
    let routine2 = routine( ... arguments );
    _.assert( _.property.filterIs( routine2 ) && !routine2.identity.functor );
    mapper.identity = { propertyMapper : true, propertyTransformer : true };
    return mapper;
    function mapper( dstContainer, srcContainer, key )
    {
      let result = routine2( dstContainer, srcContainer, key );
      _.assert( _.bool.is( result ) );
      if( result === false )
      return;
      dstContainer[ key ] = srcContainer[ key ];
    }
  }

}

//

function mapperFrom( routine )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.routineIs( routine ), 'Expects routine but got', _.entity.strType( routine ) );

  if( routine.identity )
  {
    if( routine.identity.propertyMapper )
    {
      routine.identity.propertyTransformer = true;
      return routine;
    }
    else
    {
      return _.property.mapperFromFilter( routine );
    }
  }

  routine.identity = { propertyMapper : true, propertyTransformer : true };
  return routine;
}

//

function filterFrom( routine )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.routineIs( routine ), 'Expects routine but got', _.entity.strType( routine ) );

  if( routine.identity )
  {
    if( !routine.identity.propertyFilter )
    {
      _.assert( !routine.identity.propertyMapper, 'It is not possible to convert FieldMapper to FieldFilter' );
      _.assert( routine.identity.propertyFilter === undefined );
      routine.identity.propertyFilter = true;
    }
    routine.identity.propertyTransformer = true;
    return routine;
  }

  routine.identity = { propertyFilter : true, propertyTransformer : true };
  return routine;
}

//

function transformerRegister( fi, name )
{

  if( !name )
  name = fi.name;

  _.assert( _.strDefined( name ) );
  _.assert( _.object.is( fi.identity ), 'Not property transformer' );

  if( fi.identity.propertyMapper )
  {
    _.assert( _.property.mapper[ name ] === undefined );
    _.property.mapper[ name ] = mapperFrom( fi );
    return;
  }
  else if( fi.identity.propertyFilter )
  {
    _.assert( _.property.filter[ name ] === undefined );
    _.assert( _.property.mapper[ name ] === undefined );
    _.property.mapper[ name ] = _.property.mapperFromFilter( fi );
    _.property.filter[ name ] = fi;
    return;
  }
  else _.assert( 0, 'unexpected' );

}

//

function transformersRegister( transformers )
{

  _.assert( _.mapIs( transformers ) );

  for( let f in transformers )
  {
    let fi = transformers[ f ];

    // if( fi.length )
    // debugger;
    // if( fi.length ) /* xxx*/
    // continue;
    // fi = fi();

    _.assert( !!fi.identity && !!fi.identity.functor, `Routine::${f} is not functor` );
    _.property.transformerRegister( fi, f );
  }

}

//

function transformerUnregister( transformerName, transformerType )
{
  transformerType = transformerType || 'mapper';

  _.assert( _.strIs( transformerName ) );
  _.assert( _.strIs( transformerType ) );
  _.assert( _.property[ transformerType ][ transformerName ] !== undefined, 'Transformer must be registered' );

  delete _.property[ transformerType ][ transformerName ];
  return;
}

//

function transformersUnregister( transformerNames, transformerType )
{
  _.assert( _.arrayIs( transformerNames ) );
  _.assert( _.strIs( transformerType ) );

  transformerNames.forEach( ( transformerName ) => _.property.transformerUnregister( transformerName, transformerType ) )
  return;
}

//

function transformerIs( transformer )
{
  if( !_.routineIs( transformer ) )
  return false;
  if( !_.object.is( transformer.identity ) )
  return false;

  let result =
  (
    !!( transformer.identity.propertyTransformer
    || transformer.identity.propertyFilter
    || transformer.identity.propertyMapper )
  );

  return result;
}

//

function mapperIs( transformer )
{
  if( !_.routineIs( transformer ) )
  return false;
  if( !_.object.is( transformer.identity ) )
  return false;
  return !!transformer.identity.propertyMapper;
}

//

function filterIs( transformer )
{
  if( !_.routineIs( transformer ) )
  return false;
  if( !_.object.is( transformer.identity ) )
  return false;
  return !!transformer.identity.propertyFilter;
}

// --
// extend
// --

let Extension =
{

  mapper : Object.create( null ),
  filter : Object.create( null ),

  mapperFromFilter, /* qqq : light coverage required | aaa : Done. Yevhen S. */
  mapperFrom, /* qqq : light coverage required | aaa : Done. Yevhen S. */
  filterFrom, /* qqq : light coverage required | aaa : Done. Yevhen S. */
  transformerRegister, /* qqq : light coverage required | aaa : Done. Yevhen S.*/
  transformersRegister, /* qqq : light coverage required | aaa : Done. Yevhen S.*/
  transformerUnregister,
  transformersUnregister,
  transformerIs,
  mapperIs, /* qqq : light coverage required | aaa : Done. Yevhen S. */
  filterIs, /* qqq : light coverage required | aaa : Done. Yevhen S. */

}

Object.assign( _.property, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
