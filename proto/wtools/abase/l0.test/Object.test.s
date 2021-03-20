( function _Object_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

//--
// tests
//--

function is( test )
{
  test.case = 'number';
  var src = 1;
  test.true( !_.object.is( src ) );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  test.true( !_.object.is( src ) );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 1;
  test.true( !_.object.is( src ) );

  test.case = 'fuzzy';
  var src = _.maybe;
  test.true( !_.object.is( src ) );

  test.case = 'bigint';
  var src = 10n;
  test.true( !_.object.is( src ) );

  test.case = 'str & regexpLike';
  var src = 'str';
  test.true( !_.object.is( src ) );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  test.true( !_.object.is( src ) );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  test.true( !_.object.is( src ) );

  test.case = 'unroll';
  var src = _.unrollMake([ 2, 3, 4 ]);
  test.true( !_.object.is( src ) );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  test.true( !_.object.is( src ) );

  test.case = 'long & longLike';
  var src = _.longMake([ 1, 2 ]);
  test.true( !_.object.is( src ) );

  test.case = 'vector & vectorLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.true( _.object.is( src ) );

  test.case = 'countable & countableLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.true( _.object.is( src ) );

  test.case = 'Global & GlobalReal';
  var src = global;
  test.true( !_.object.is( src ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  test.true( !_.object.is( src ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = { [ Symbol.iterator ] : 1 };
  test.true( _.object.is( src ) );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  test.true( _.object.is( src ) );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  test.true( _.object.is( src ) );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  test.true( _.object.is( src ) );

  test.case = 'HashMap';
  var src = new HashMap();
  test.true( !_.object.is( src ) );

  test.case = 'Set & SetLike';
  var src = new Set();
  test.true( !_.object.is( src ) );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  test.true( !_.object.is( src ) );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  test.true( !_.object.is( src ) );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  test.true( !_.object.is( src ) );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  test.true( !_.object.is( src ) );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) )
  test.true( !_.object.is( src ) );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  test.true( !_.object.is( src ) );

  test.case = 'err';
  var src = _.err( 'error' );
  test.true( !_.object.is( src ) );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  test.true( !_.object.is( src ) );

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  test.true( !_.object.is( src ) );

  test.case = 'pair';
  var src = _.pair.make();
  test.true( !_.object.is( src ) );

  test.case = 'path & str';
  var src = '/a/b/';
  test.true( !_.object.is( src ) );

  test.case = 'propertyTransformer & filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  test.true( !_.object.is( src ) );

  test.case = 'propertyTransformer & mapper';
  var src = _.property.mapper[ 'assigning' ];
  test.true( !_.object.is( src ) );

  test.case = 'routine & routineLike';
  var src = routine;
  test.true( !_.object.is( src ) );

  test.case = 'time';
  var src = _.time.now();
  test.true( !_.object.is( src ) );

  test.case = 'timer';
  var src = _.time._begin( Infinity );;
  test.true( _.object.is( src ) );
  _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date();
  test.true( !_.object.is( src ) );

  test.case = 'null';
  var src = null;
  test.true( !_.object.is( src ) );

  test.case = 'undefined';
  var src = undefined;
  test.true( !_.object.is( src ) );

  test.case = 'Symbol null';
  var src = _.null;
  test.true( !_.object.is( src ) );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  test.true( !_.object.is( src ) );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  test.true( !_.object.is( src ) );

  test.case = 'primitive';
  var src = 5;
  test.true( !_.object.is( src ) );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  test.true( !_.object.is( src ) );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.true( !_.object.is( src ) );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  test.true( _.object.is( src ) );

  // test.case = 'console';
  // var src = console;
  // test.true( !_.object.is( src ) );

  test.case = 'printerLike';
  var src = _global_.logger;
  test.true( _.object.is( src ) );

  test.case = 'process';
  var src = process;
  test.true( !_.object.is( src ) );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  function routine () {}

}

//

function exportStringShortDiagnostic( test )
{
  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Object -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'vector & vectorLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = 'countable & countableLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = `object countable - empty, non-vector`;
  var src = countableMake( null, { elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  test.case = `object countable - non empty, non-vector`;
  var src = countableMake( null, { elements : [ '1', '2', '3' ], withIterator : 1 } );
  var expected = '{- Object.countable with 3 elements -}';
  var got = _.object.exportStringShortDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.object.exportStringShortDiagnostic() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.object.exportStringShortDiagnostic( [], [] ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.countable.exportStringShortDiagnostic( {} ) );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }
}

// --
//
// --

let Self =
{

  name : 'Tools.Object',
  silencing : 1,

  tests :
  {
    is,
    exportStringShortDiagnostic
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
