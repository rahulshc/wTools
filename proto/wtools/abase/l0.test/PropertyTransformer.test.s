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

  test.case = 'routine - сustom filter & mapper';
  mapperFilter.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
  var got = _.property.mapperIs( mapperFilter );
  test.identical( got, true );

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
    return 1 + 2;
  }

  function filter()
  {
    return 1 + 2;
  }

  function mapperFilter()
  {
    return 1 + 2;
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

  test.case = 'routine - сustom filter & mapper';
  mapperFilter.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
  var got = _.property.filterIs( mapperFilter );
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
    return 1 + 2;
  }

  function filter()
  {
    return 1 + 2;
  }

  function mapperFilter()
  {
    return 1 + 2;
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

  test.case = 'routine - сustom filter & mapper';
  var src = mapperFilter;
  src.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
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
    return 1 + 2;
  }

  function filter1()
  {
    return 1 + 2;
  }

  function mapper2()
  {
    return 1 + 2;
  }

  function filter2()
  {
    return 1 + 2;
  }

  function mapper3()
  {
    return 1 + 2;
  }

  function filter3()
  {
    return 1 + 2;
  }

  function mapperFilter()
  {
    return 1 + 2;
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

  test.case = 'routine - сustom filter & mapper';
  var src = mapperFilter;
  src.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

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
    return 1 + 2;
  }

  function filter1()
  {
    return 1 + 2;
  }

  function mapper2()
  {
    return 1 + 2;
  }

  function filter2()
  {
    return 1 + 2;
  }

  function mapper3()
  {
    return 1 + 2;
  }

  function filter3()
  {
    return 1 + 2;
  }

  function mapperFilter()
  {
    return 1 + 2;
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

  test.case = 'routine - сustom filter & mapper';
  var src = mapperFilter;
  src.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
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
    return 1 + 2;
  }

  function filter1()
  {
    return 1 + 2;
  }
  function filter2()
  {
    return 1 + 2;
  }

  function filter3()
  {
    return 1 + 2;
  }

  function mapperFilter()
  {
    return 1 + 2;
  }

}

//

function transformerRegister( test )
{
  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.filterIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter & mapper';
  var src = mapperFilter;
  src.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
  test.true( _.property.mapper[ src.name ] === undefined );
  test.true( _.property.filter[ src.name ] === undefined );
  _.property.transformerRegister( src );
  test.true( _.property.mapperIs( src ) );
  test.true( _.property.filterIs( src ) );
  test.true( _.routineIs( _.property.mapper[ src.name ] ) );
  test.true( _.property.filter[ src.name ] === undefined );

  test.case = 'existing mapper with custom name';
  var src = _.property.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routineIs( _.property.mapper[ 'assigning' ] ) );
  _.property.transformerRegister( src, srcName );
  test.true( _.property.mapperIs( src ) );
  test.true( _.routineIs( _.property.mapper[ srcName ] ) );

  test.case = 'existing filter with custom name';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routineIs( _.property.mapper[ 'dstAndSrcOwn' ] ) ) );
  _.property.transformerRegister( src, srcName );
  test.true( _.property.filterIs( src ) );
  test.true( _.routineIs( _.property.mapper[ srcName ] ) );

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
    return 1 + 2;
  }

  function filter1()
  {
    return 1 + 2;
  }

  function mapper2()
  {
    return 1 + 2;
  }

  function filter2()
  {
    return 1 + 2;
  }

  function mapper3()
  {
    return 1 + 2;
  }

  function filter3()
  {
    return 1 + 2;
  }

  function mapperFilter()
  {
    return 1 + 2;
  }

}

//

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
    // transformersRegister,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
