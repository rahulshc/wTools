( function _PropertyTransformer_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

//--
// tests
//--

function mapperIs( test )
{
  test.case = 'primitive bool';
  var got = _.property.mapperIs( true );
  test.identical( got, false );

  test.case = 'primitive str';
  var got = _.property.mapperIs( 'hello' );
  test.identical( got, false );

  test.case = 'primitive number';
  var got = _.property.mapperIs( 1 );
  test.identical( got, false );

  test.case = 'empty object';
  var got = _.property.mapperIs({});
  test.identical( got, false );

  test.case = 'object with identity field';
  var src = { identity : { propertyMapper : true, propertyTransformer : true } }
  var got = _.property.mapperIs( src );
  test.identical( got, false );

  test.case = 'plain routine';
  var got = _.property.mapperIs( plain );
  test.identical( got, false );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.property.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom filter without propertyTransformer';
  filter.identity = { propertyFilter : true }
  var src = filter;
  var got = _.property.mapperIs( filter );
  test.identical( got, false );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.property.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom filter';
  filter.identity = { propertyFilter : true, propertyTransformer : true }
  var src = filter;
  var got = _.property.mapperIs( filter );
  test.identical( got, false );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom filter functor';
  filter.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var src = filter;
  var got = _.property.mapperIs( filter );
  test.identical( got, false );

  test.case = 'existing mapper';
  var got = _.property.mapperIs( _.property.mapper[ 'assigning' ] );
  test.identical( got, true );

  test.case = 'existing filter';
  var got = _.property.mapperIs( _.property.filter[ 'dstAndSrcOwn' ] );
  test.identical( got, false );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

//

function filterIs( test )
{
  test.case = 'primitive bool';
  var got = _.property.filterIs( true );
  test.identical( got, false );

  test.case = 'primitive str';
  var got = _.property.filterIs( 'hello' );
  test.identical( got, false );

  test.case = 'primitive number';
  var got = _.property.filterIs( 1 );
  test.identical( got, false );

  test.case = 'empty object';
  var got = _.property.filterIs({});
  test.identical( got, false );

  test.case = 'object with identity field';
  var src = { identity : { propertyMapper : true, propertyTransformer : true } }
  var got = _.property.filterIs( src );
  test.identical( got, false );

  test.case = 'plain routine';
  var got = _.property.filterIs( plain );
  test.identical( got, false );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.property.filterIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom filter without propertyTransformer';
  filter.identity = { propertyFilter : true }
  var src = filter;
  var got = _.property.filterIs( filter );
  test.identical( got, true );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.property.filterIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom filter';
  filter.identity = { propertyFilter : true, propertyTransformer : true }
  var src = filter;
  var got = _.property.filterIs( filter );
  test.identical( got, true );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.property.filterIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom filter functor';
  filter.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var src = filter;
  var got = _.property.filterIs( filter );
  test.identical( got, true );

  test.case = 'existing mapper';
  var got = _.property.filterIs( _.property.mapper[ 'assigning' ] );
  test.identical( got, false );

  test.case = 'existing filter';
  var got = _.property.filterIs( _.property.filter[ 'dstAndSrcOwn' ] );
  test.identical( got, true );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

//

function mapperFromFilter( test )
{
  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'existing mapper';
  var src = _.property.mapper[ 'assigning' ];
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'existing filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var got = _.property.mapperFromFilter( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  if( !Config.debug )
  return;

  test.case = 'primitive'
  test.shouldThrowErrorSync( () => _.property.mapperFromFilter( 'hello' ) )

  test.case = 'plain routine'
  test.shouldThrowErrorSync( () => _.property.mapperFromFilter( plain ) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function mapperFrom( test )
{
  test.case = 'plain routine';
  var src = plain;
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'existing mapper';
  var src = _.property.mapper[ 'assigning' ];
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'existing filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  if( !Config.debug )
  return;

  test.case = 'primitive'
  test.shouldThrowErrorSync( () => _.property.mapperFrom( 'hello' ) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function filterFrom( test )
{
  test.case = 'plain routine';
  var src = plain;
  var got = _.property.filterFrom( src );
  test.true( _.property.filterIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  var got = _.property.filterFrom( src );
  test.true( _.property.filterIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  var got = _.property.filterFrom( src );
  test.true( _.property.filterIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var got = _.property.filterFrom( src );
  test.true( _.property.filterIs( got ) );
  test.true( got === src );

  test.case = 'existing filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var got = _.property.filterFrom( src );
  test.true( _.property.filterIs( got ) );
  test.true( got === src );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.property.filterFrom( 'hello' ) );

  test.case = 'custom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  test.shouldThrowErrorSync( () => _.property.filterFrom( src ) );

  test.case = 'existing mapper';
  var src = _.property.mapper[ 'assigning' ]
  test.shouldThrowErrorSync( () => _.property.filterFrom( src ) );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }
}

//

function transformerRegister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.property.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.property.filter ) );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( src ) );
  test.true( _.property.filterIs( _.property.filter[ src.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( src ) );
  test.true( _.property.filterIs( _.property.filter[ src.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( src ) );
  test.true( _.property.filterIs( _.property.filter[ src.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );

  test.case = 'existing mapper with custom name';
  var src = _.property.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routineIs( _.property.mapper[ 'assigning' ] ) );
  _.property.transformerRegister( src, srcName );
  test.true( _.property.mapperIs( src ) );
  test.true( _.property.mapperIs( _.property.mapper[ srcName ] ) );

  test.case = 'existing filter with custom name';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routineIs( _.property.filter[ 'dstAndSrcOwn' ] ) ) );
  _.property.transformerRegister( src, srcName );
  test.true( _.property.filterIs( src ) );
  test.true( _.property.filterIs( _.property.filter[ srcName ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ srcName ] ) );

  _.property.transformersUnregister
  (
    [
      mapper1.name,
      filter1.name,
      mapper2.name,
      filter2.name,
      mapper3.name,
      filter3.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.property.transformersUnregister
  (
    [
      filter1.name,
      filter2.name,
      filter3.name,
      'existingFilter',
    ],
    'filter'
  );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.property.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.property.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.property.transformerRegister( plain ) )

  test.case = 'plain routine';
  test.shouldThrowErrorSync( () => _.property.transformerRegister( 'hello' ) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.property.transformerRegister( _.property.mapper[ 'assigning' ] ) )

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.property.transformerRegister( _.property.filter[ 'dstAndSrcOwn' ] ) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function transformersRegister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.property.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.property.filter ) );

  addIdentity();

  test.case = 'check not registered';
  test.true( _.property.mapper[ mapper1.name ] === undefined );
  test.true( _.property.filter[ filter1.name ] === undefined );

  test.true( _.property.mapper[ mapper2.name ] === undefined );
  test.true( _.property.filter[ filter2.name ] === undefined );
  test.true( _.property.mapper[ filter2.name ] === undefined );//

  test.true( _.property.mapper[ mapper3.name ] === undefined );
  test.true( _.property.filter[ filter3.name ] === undefined );
  test.true( _.property.mapper[ filter3.name ] === undefined );

  test.true( _.property.mapper[ mapper4.name ] === undefined );
  test.true( _.property.filter[ filter4.name ] === undefined );
  test.true( _.property.mapper[ filter4.name ] === undefined );

  test.true( _.property.mapper[ 'existingMapper' ] === undefined );
  test.true( _.property.filter[ 'existingFilter' ] === undefined );
  test.true( _.property.mapper[ 'existingFilter' ] === undefined );

  var transformers =
  {
    [ mapper3.name ] : mapper3,
    [ filter3.name ] : filter3,
    [ mapper4.name ] : mapper4,
    [ filter4.name ] : filter4,
    'existingMapper' : _.property.mapper[ 'assigning' ],
    'existingFilter' : _.property.filter[ 'dstAndSrcOwn' ],
  }

  _.property.transformersRegister( transformers );

  test.case = 'check registered';
  test.true( _.property.mapperIs( _.property.mapper[ mapper3.name ] ) );
  test.true( _.property.filterIs( _.property.filter[ filter3.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ filter3.name ] ) );

  test.true( _.property.mapperIs( _.property.mapper[ mapper4.name ] ) );
  test.true( _.property.filterIs( _.property.filter[ filter4.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ filter4.name ] ) );

  test.true( _.property.mapperIs( _.property.mapper[ 'existingMapper' ] ) );
  test.true( _.property.filterIs( _.property.filter[ 'existingFilter' ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ 'existingFilter' ] ) );

  _.property.transformersUnregister
  (
    [
      mapper3.name,
      filter3.name,
      mapper4.name,
      filter4.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.property.transformersUnregister
  (
    [
      filter3.name,
      filter4.name,
      'existingFilter',
    ],
    'filter'
  );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.property.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.property.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters( 'hello' ) )

  test.case = 'plain routine';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ [ plain.name ] : plain }) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ 'assigning' : _.property.mapper[ 'assigning' ] }) )

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ 'dstAndSrcOwn' : _.property.filter[ 'dstAndSrcOwn' ] }) )

  test.case = 'not functor mapper';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ [ mapper1.name ] : mapper1 }) )

  test.case = 'not functor filter';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ [ filter1.name ] : filter1 }) )

  test.case = 'not functor mapper transformer';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ [ mapper2.name ] : mapper2 }) )

  test.case = 'not functor filter transformer';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ [ filter2.name ] : filter2 }) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

  function mapper4()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter4()
  {
    let routine = notIdentical;
    routine.identity = { propertyFilter : true, propertyTransformer : true }; ;
    return routine;
    function notIdentical( dstContainer, srcContainer, key )
    {
      if( dstContainer[ key ] === srcContainer[ key ] )
      return false;
      return true;
    }
  }

  function addIdentity()
  {
    mapper1.identity = { propertyMapper : true };
    filter1.identity = { propertyFilter : true };

    mapper2.identity = { propertyMapper : true, propertyTransformer : true };
    filter2.identity = { propertyFilter : true, propertyTransformer : true };

    mapper3.identity = { propertyMapper : true, functor : true };
    filter3.identity = { propertyFilter : true, functor : true }

    mapper4.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
    filter4.identity = { propertyFilter : true, propertyTransformer : true, functor : true };
  }

}

//

function transformerUnregister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.property.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.property.filter ) );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );
  _.property.transformerUnregister( src.name );
  test.true( _.property.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  test.true( _.property.filter[ src.name ] === undefined );
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( _.property.filter[ src.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );
  _.property.transformerUnregister( src.name, 'mapper' );
  _.property.transformerUnregister( src.name, 'filter' );
  test.true( _.property.filter[ src.name ] === undefined );
  test.true( _.property.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );
  _.property.transformerUnregister( src.name, 'mapper' );
  test.true( _.property.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  test.true( _.property.filter[ src.name ] === undefined );
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( _.property.filter[ src.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );
  _.property.transformerUnregister( src.name, 'mapper' );
  _.property.transformerUnregister( src.name, 'filter' );
  test.true( _.property.filter[ src.name ] === undefined );
  test.true( _.property.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );
  _.property.transformerUnregister( src.name, 'mapper' );
  test.true( _.property.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  test.true( _.property.filter[ src.name ] === undefined );
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( _.property.filter[ src.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ src.name ] ) );
  _.property.transformerUnregister( src.name, 'mapper' );
  _.property.transformerUnregister( src.name, 'filter' );
  test.true( _.property.filter[ src.name ] === undefined );
  test.true( _.property.mapper[ src.name ] === undefined );

  test.case = 'existing mapper with custom name';
  var src = _.property.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routineIs( _.property.mapper[ 'assigning' ] ) );
  _.property.transformerRegister( src, srcName );
  test.true( _.property.mapperIs( _.property.mapper[ srcName ] ) );
  _.property.transformerUnregister( srcName, 'mapper' );
  test.true( _.property.mapper[ srcName ] === undefined );

  test.case = 'existing filter with custom name';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routineIs( _.property.filter[ 'dstAndSrcOwn' ] ) ) );
  _.property.transformerRegister( src, srcName );
  test.true( _.property.filterIs( _.property.filter[ srcName ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ srcName ] ) );
  _.property.transformerUnregister( srcName, 'mapper' );
  _.property.transformerUnregister( srcName, 'filter' );
  test.true( _.property.filter[ srcName ] === undefined );
  test.true( _.property.mapper[ srcName ] === undefined );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.property.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.property.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'routine';
  test.shouldThrowErrorSync( () => _.property.transformerUnregister( plain ) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.property.transformerUnregister( 'hello', 'mapper' ) )

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.property.transformerUnregister( 'hello', 'filter' ) )


  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function transformersUnregister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.property.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.property.filter ) );

  addIdentity();

  test.case = 'check not registered';
  test.true( _.property.mapper[ mapper1.name ] === undefined );
  test.true( _.property.filter[ filter1.name ] === undefined );

  test.true( _.property.mapper[ mapper2.name ] === undefined );
  test.true( _.property.filter[ filter2.name ] === undefined );
  test.true( _.property.mapper[ filter2.name ] === undefined );//

  test.true( _.property.mapper[ mapper3.name ] === undefined );
  test.true( _.property.filter[ filter3.name ] === undefined );
  test.true( _.property.mapper[ filter3.name ] === undefined );

  test.true( _.property.mapper[ mapper4.name ] === undefined );
  test.true( _.property.filter[ filter4.name ] === undefined );
  test.true( _.property.mapper[ filter4.name ] === undefined );

  test.true( _.property.mapper[ 'existingMapper' ] === undefined );
  test.true( _.property.filter[ 'existingFilter' ] === undefined );
  test.true( _.property.mapper[ 'existingFilter' ] === undefined );

  var transformers =
  {
    [ mapper3.name ] : mapper3,
    [ filter3.name ] : filter3,
    [ mapper4.name ] : mapper4,
    [ filter4.name ] : filter4,
    'existingMapper' : _.property.mapper[ 'assigning' ],
    'existingFilter' : _.property.filter[ 'dstAndSrcOwn' ],
  }

  _.property.transformersRegister( transformers );

  test.case = 'check registered';
  test.true( _.property.mapperIs( _.property.mapper[ mapper3.name ] ) );
  test.true( _.property.filterIs( _.property.filter[ filter3.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ filter3.name ] ) );

  test.true( _.property.mapperIs( _.property.mapper[ mapper4.name ] ) );
  test.true( _.property.filterIs( _.property.filter[ filter4.name ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ filter4.name ] ) );

  test.true( _.property.mapperIs( _.property.mapper[ 'existingMapper' ] ) );
  test.true( _.property.filterIs( _.property.filter[ 'existingFilter' ] ) );
  test.true( _.property.mapperIs( _.property.mapper[ 'existingFilter' ] ) );

  _.property.transformersUnregister
  (
    [
      mapper3.name,
      filter3.name,
      mapper4.name,
      filter4.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.property.transformersUnregister
  (
    [
      filter3.name,
      filter4.name,
      'existingFilter',
    ],
    'filter'
  );

  test.case = 'check unregistered';
  test.true( _.property.mapper[ mapper1.name ] === undefined );
  test.true( _.property.filter[ filter1.name ] === undefined );

  test.true( _.property.mapper[ mapper2.name ] === undefined );
  test.true( _.property.filter[ filter2.name ] === undefined );
  test.true( _.property.mapper[ filter2.name ] === undefined );//

  test.true( _.property.mapper[ mapper3.name ] === undefined );
  test.true( _.property.filter[ filter3.name ] === undefined );
  test.true( _.property.mapper[ filter3.name ] === undefined );

  test.true( _.property.mapper[ mapper4.name ] === undefined );
  test.true( _.property.filter[ filter4.name ] === undefined );
  test.true( _.property.mapper[ filter4.name ] === undefined );

  test.true( _.property.mapper[ 'existingMapper' ] === undefined );
  test.true( _.property.filter[ 'existingFilter' ] === undefined );
  test.true( _.property.mapper[ 'existingFilter' ] === undefined );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.property.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.property.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'routine';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters({ [ plain.name ] : plain }) );

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters( [ 'hello' ], 'mapper' ) );

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.property.transformerRegisters( [ 'hello' ], 'filter' ) );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

  function mapper4()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
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

  function filter4()
  {
    let routine = notIdentical;
    routine.identity = { propertyFilter : true, propertyTransformer : true }; ;
    return routine;
    function notIdentical( dstContainer, srcContainer, key )
    {
      if( dstContainer[ key ] === srcContainer[ key ] )
      return false;
      return true;
    }
  }

  function addIdentity()
  {
    mapper1.identity = { propertyMapper : true };
    filter1.identity = { propertyFilter : true };

    mapper2.identity = { propertyMapper : true, propertyTransformer : true };
    filter2.identity = { propertyFilter : true, propertyTransformer : true };

    mapper3.identity = { propertyMapper : true, functor : true };
    filter3.identity = { propertyFilter : true, functor : true }

    mapper4.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
    filter4.identity = { propertyFilter : true, propertyTransformer : true, functor : true };
  }

}

// --
// define test suite
// --

let Self =
{

  name : 'Tools.PropertyTransformer',
  silencing : 1,

  tests :
  {

    // l5

    mapperIs,
    filterIs,
    mapperFromFilter,
    mapperFrom,
    filterFrom,
    transformerRegister,
    transformersRegister,
    transformerUnregister,
    transformersUnregister,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
