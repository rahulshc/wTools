( function _MinimalExportStringLayer3_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../l0/l1/Predefined.s' );
  require( '../l0/l2/Setup.s' );

  require( '../l0/l3/ArgumentsArray.s' );
  require( '../l0/l3/Array.s' );
  require( '../l0/l3/Auxiliary.s' );
  require( '../l0/l3/BigInt.s' );
  require( '../l0/l3/Bool.s' );
  require( '../l0/l3/Buffer.s' );
  require( '../l0/l3/Constructible.s' );
  require( '../l0/l3/Date.s' );
  require( '../l0/l3/Entity.s' );
  require( '../l0/l3/Err.s' );
  require( '../l0/l3/Escape.s' );
  require( '../l0/l3/HashMap.s' );
  require( '../l0/l3/Interval.s' );
  require( '../l0/l3/Introspector.s' );
  require( '../l0/l3/Long.s' );
  require( '../l0/l3/Map.s' );
  require( '../l0/l3/Number.s' );
  require( '../l0/l3/Object.s' );
  require( '../l0/l3/Pair.s' );
  require( '../l0/l3/Countable.s' );
  require( '../l0/l3/Primitive.s' );
  require( '../l0/l3/Regexp.s' );
  require( '../l0/l3/Routine.s' );
  require( '../l0/l3/Set.s' );
  require( '../l0/l3/Str.s' );
  require( '../l0/l3/Symbol.s' );
  require( '../l0/l3/Unroll.s' );
  require( '../l0/l3/Vector.s' );

  let toolsPath = '../../atop/testing/include/Top.s';
  let toolsExternal = 0;
  try
  {
    toolsPath = require.resolve( toolsPath );
  }
  catch( err )
  {
    toolsExternal = 1;
    require( 'wTesting' );
  }
  if( !toolsExternal )
  require( toolsPath );

}

const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function exportStringShortDiagnostic( test )
{

  test.case = 'number';
  var src = 1;
  var expected = '1';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  var expected = 'true';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 0;
  var expected = '0';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'fuzzy';
  var src = _.maybe;
  var expected = '{- Symbol maybe -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'bigint';
  var src = 10n;
  var expected = '10n';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = 'str';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  var expected = '/hello/g';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  var expected = '{- ArgumentsArray with 0 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = '{- ArgumentsArray with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  /* l5 */
  // test.case = 'unroll';
  // var src = _.unrollMake([ 2, 3, 4 ]);
  // var expected = '{- Array.unroll with 3 elements -}';
  // test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  /* l5 */
  // test.case = 'long & longLike';
  // var src = _.longMake([ 1, 2 ]);
  // var expected = '{- Array with 2 elements -}';
  // test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'vector & vectorLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'countable & countableLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = countableMake( null, { elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = countableMake( null, { elements : [ '1', '2', '3' ], withIterator : 1 } );
  var expected = '{- Object.countable with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = _global_;
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringShortDiagnostic( src ), expected ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( _global_ );
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringShortDiagnostic( src ), expected ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike'; /* qqq for Yevhen : bad : this is aux! lack of Object & Countable cases | aaa : Added. */
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Object -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike with `exportString` method';
  var src =
  {
    [ Symbol.iterator ] : 1,
    exportString : () => 'Custom string transformation'
  };
  var expected = 'Custom string transformation';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted with `exportString` method';
  var src = { a : 1 };
  var proto =
  {
    b : 2,
    exportString : () => 'Custom string transformation'
  }
  Object.setPrototypeOf( src, proto )
  var expected = '{- Aux.polluted.prototyped with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with `exportString` method';
  var src = Object.create( null );
  src.exportString = () => 'Custom string transformation'
  var expected = '{- Map.pure with 1 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var expected = '{- Map.pure with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src = { a : 1, b : 2, c : 3 };
  var expected = '{- Map.polluted with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'HashMap';
  var src = new HashMap();
  var expected = '{- HashMap with 0 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'HashMap with 2 elems';
  var src = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Set & SetLike';
  var src = new Set();
  var expected = '{- Set with 0 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Set with 3 elems';
  var src = new Set([ 1, 2, 3 ]);
  var expected = '{- Set with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  var expected = '{- BufferNode with 3 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  var expected = '{- BufferRaw -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  var expected = '{- BufferRawShared -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  var expected = '{- I8x with 20 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) );
  var expected = '{- DataView.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  var expected = '{- U8x with 20 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'err';
  var src = _.error.err( 'error' );
  var expected = '{- Error.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  var expected = 'Escape( 1 )';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  var expected = '{- F32x with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'pair';
  var src = _.pair.make();
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = '/a/b/';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  /* l7 */
  // test.case = 'propertyTransformer & filter';
  // var src = _.property.filter[ 'dstAndSrcOwn' ];
  // var expected = '{- routine dstAndSrcOwn -}';
  // test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  /* l7 */
  // test.case = 'propertyTransformer & mapper';
  // var src = _.property.mapper[ 'assigning' ];
  // var expected = '{- routine assigning -}';
  // test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  /* l5 */
  // test.case = 'timer';
  // var src = _.time._begin( Infinity );
  // var expected = '{- Map.pure with 9 elements -}';
  // test.identical( _.entity.exportStringShortDiagnostic( src ), expected );
  // _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date( '2021-02-19T11:26:42.840Z' );
  var expected = '2021-02-19T11:26:42.840Z';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'null';
  var src = null;
  var expected = 'null';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'undefined';
  var src = undefined;
  var expected = 'undefined';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = '{- Symbol null -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'primitive';
  var src = 5;
  var expected = '5';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var expected = '{- Promise.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  var expected = '{- Readable.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  // test.case = 'console';
  // var src = console;
  // var expected = '{- Console.constructible with 1 elements -}';
  // test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'printerLike';
  var src = new __.Logger();
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'printerLike with output to console';
  var src = new __.Logger({ output : console });
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

  test.case = 'process';
  var src = process;
  var expected = '{- process.constructible -}';
  test.identical( _.entity.exportStringShortDiagnostic( src ), expected );

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

// --
//
// --

let Self =
{

  name : 'Tools.MinimalExportStringLayer3',
  silencing : 1,

  tests :
  {

    exportStringShortDiagnostic

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
