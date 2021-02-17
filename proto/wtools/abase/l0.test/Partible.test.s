( function _Partible_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --

function typing( test ) /* qqq for Yevhen : extend for like. first discuss ( file Partible.tests.s ) */
{

  /* */

  test.case = `primitive - str`;
  var src = 'abc';
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `primitive - bool`;
  var src = true;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `primitive - number`;
  var src = 1;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `routine`;
  var src = routine;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `raw buffer`;
  var src = new BufferRaw( 13 );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `partible`;
  var src = new partibleConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `partible made`;
  var src = partibleMake( null, { elements : [ '1', '10' ], withIterator : 1 } );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `vector`;
  var src = new partibleConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `typed buffer`;
  var src = new F32x([ 0, 10 ]);
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `arguments array`;
  var src = _.argumentsArray.make();
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `array`;
  var src = [ 1, 3 ];
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( _.arrayIs( src ) );

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

  function partibleConstructor( o )
  {
    return partibleMake( this, o );
  }

  /* */

  function partibleMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  /* */

  function routine () {}

}

//

function typingExtended( test )
{
  test.case = 'number';
  var src = 1;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 1;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'fuzzy';
  var src = _.maybe;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'bigint';
  var src = 10n;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'str & regexpLike';
  var src = 'str';
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'unroll';
  var src = _.unrollMake([ 2, 3, 4 ]);
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( _.arrayIs( src ) );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( _.arrayIs( src ) );

  test.case = 'long & longLike';
  var src = _.longMake([ 1, 2 ]);
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( _.arrayIs( src ) );

  test.case = 'vector & vectorLike';
  var src = new partibleConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'partible & partibleLike';
  var src = new partibleConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Global & GlobalReal';
  var src = global;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = { [ Symbol.iterator ] : 1 };
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'HashMap';
  var src = new HashMap();
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Set & SetLike';
  var src = new Set();
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'BufferNode';
  var src = new BufferNode( 'str' );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) )
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'err';
  var src = _.err( 'error' );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'interval & BufferTyped';
  var src = _.escape.make( new F32x( 2 ) );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'pair';
  var src = _.pair.make();
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( _.arrayIs( src ) );

  test.case = 'path & str';
  var src = '/a/b/';
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'propertyTransformer & filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'propertyTransformer & mapper';
  var src = _.property.mapper[ 'assigning' ];
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'routine & routineLike';
  var src = routine;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'timer';
  var src = _.time._begin( Infinity );;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );
  _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date();
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'null';
  var src = null;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'undefined';
  var src = undefined;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Symbol null';
  var src = _.null;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'primitive';
  var src = 5;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'console';
  var src = console;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'printerLike';
  var src = _global.logger;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  test.case = 'process';
  var src = process;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

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

  function partibleConstructor( o )
  {
    return partibleMake( this, o );
  }

  /* */

  function partibleMake( dst, o )
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
// declaration
// --

var Self =
{

  name : 'Tools.Partible',
  silencing : 1,

  tests :
  {

    typing,
    /* xxx qqq : write test routine typingObject and use _.objectForTesting() */
    typingExtended

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
