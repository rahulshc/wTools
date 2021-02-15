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
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.property.mapperFromFilter( mapper );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  filter.identity = { propertyFilter : true }
  var src = filter;
  var got = _.property.mapperFromFilter( filter );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.property.mapperFromFilter( mapper );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  filter.identity = { propertyFilter : true, propertyTransformer : true }
  var src = filter;
  var got = _.property.mapperFromFilter( filter );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperFromFilter( mapper );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  filter.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var src = filter;
  var got = _.property.mapperFromFilter( filter );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom filter & mapper';
  mapperFilter.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
  var src = mapperFilter;
  var got = _.property.mapperFromFilter( mapperFilter );
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

function mapperFrom( test )
{
  test.case = 'plain routine';
  var src = plain;
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  filter.identity = { propertyFilter : true }
  var src = filter;
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  filter.identity = { propertyFilter : true, propertyTransformer : true }
  var src = filter;
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  filter.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var src = filter;
  var got = _.property.mapperFrom( src );
  test.true( _.property.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom filter & mapper';
  mapperFilter.identity = { propertyMapper : true, propertyFilter : true, propertyTransformer : true }
  var src = mapperFilter;
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
    // filterFrom,
    // transformerRegister,
    // transformersRegister,
    // transformerIs,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
