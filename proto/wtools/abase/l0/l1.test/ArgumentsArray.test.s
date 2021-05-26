( function _l0_l1_ArgumentsArray_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//--
// tests
//--

function dichotomy( test )
{

  test.case = 'argumentsArray from empty array';
  var src = _.argumentsArray.make( [] );
  test.true( _.argumentsArray.is( src ) );
  test.true( _.argumentsArray.isUsingFunctor( src ) );
  test.true( _.argumentsArray.like( src ) );
  test.true( !_.array.is( src ) );
  test.true( !_.array.like( src ) );

  test.case = 'array';
  var src = [ 1, 2, 3 ];
  test.true( !_.argumentsArray.is( src ) );
  test.true( !_.argumentsArray.isUsingFunctor( src ) );
  test.true( _.argumentsArray.like( src ) );
  test.true( _.array.is( src ) );
  test.true( _.array.like( src ) );

  test.case = 'argument object';
  var src = arguments;
  test.true( _.argumentsArray.is( src ) );
  test.true( _.argumentsArray.isUsingFunctor( src ) );
  test.true( _.argumentsArray.like( src ) );
  test.true( !_.array.is( src ) );
  test.true( !_.array.like( src ) );

  test.case = 'array prototype';
  var src = Array.prototype;
  test.true( !_.argumentsArray.is( src ) );
  test.true( !_.argumentsArray.isUsingFunctor( src ) );
  test.true( _.argumentsArray.like( src ) );
  test.true( _.array.is( src ) );
  test.true( _.array.like( src ) );

  test.case = 'string';
  var src = 'string';
  test.false( _.argumentsArray.is( src ) );
  test.false( _.argumentsArray.isUsingFunctor( src ) );
  test.false( _.argumentsArray.like( src ) );
  test.false( _.array.is( src ) );
  test.false( _.array.like( src ) );

  test.case = 'typed array';
  var src = new U64x( 10 );
  test.false( _.argumentsArray.is( src ) );
  test.false( _.argumentsArray.isUsingFunctor( src ) );
  test.false( _.argumentsArray.like( src ) );
  test.false( _.array.is( src ) );
  test.false( _.array.like( src ) );

  test.case = 'false array';
  var src = { __proto__ : Array.prototype };
  test.false( _.argumentsArray.is( src ) );
  test.false( _.argumentsArray.isUsingFunctor( src ) );
  test.false( _.argumentsArray.like( src ) );
  test.false( _.array.is( src ) );
  test.false( _.array.like( src ) );
}

//

function make( test )
{
  test.case = 'without arguments';
  var got = _.argumentsArray.make();
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );

  test.case = 'src - null';
  var got = _.argumentsArray.make( null );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );

  test.case = 'src - number, zero';
  var got = _.argumentsArray.make( 0 );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - number, src > 0';
  var got = _.argumentsArray.make( 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty array';
  var src = [];
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with single element';
  var src = [ 0 ];
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with several elements';
  var src = [ 1, 2, 3 ];
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty unroll';
  var src = _.unroll.make( [] );
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with single element';
  var src = _.unroll.make( [ 0 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with several elements';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - argumentsArray with single element';
  var src = _.argumentsArray.make( [ 0 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - argumentsArray with several elements';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty BufferTyped';
  var src = new U8x( [] );
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with single element';
  var src = new I16x( [ 0 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with several elements';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.argumentsArray.make( 1, 3 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.argumentsArray.make( {} ) );
  test.shouldThrowErrorSync( () => _.argumentsArray.make( 'wrong' ) );
}

//

function from( test )
{
  test.case = 'src - null';
  var got = _.argumentsArray.from( null );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );

  test.case = 'src - number, zero';
  var got = _.argumentsArray.from( 0 );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - number, src > 0';
  var got = _.argumentsArray.from( 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty array';
  var src = [];
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with single element';
  var src = [ 0 ];
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with several elements';
  var src = [ 1, 2, 3 ];
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty unroll';
  var src = _.unroll.make( [] );
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with single element';
  var src = _.unroll.make( [ 0 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with several elements';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src === got );

  test.case = 'src - argumentsArray with single element';
  var src = _.argumentsArray.make( [ 0 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src === got );

  test.case = 'src - argumentsArray with several elements';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src === got );

  /* */

  test.case = 'src - empty BufferTyped';
  var src = new U8x( [] );
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with single element';
  var src = new I16x( [ 0 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with several elements';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.argumentsArray.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.argumentsArray.from( 1, 3 ) );
  test.shouldThrowErrorSync( () => _.argumentsArray.from( [], 3 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.argumentsArray.from( {} ) );
  test.shouldThrowErrorSync( () => _.argumentsArray.from( 'wrong' ) );
}
//

function isPerformance( test )
{
  /* Average of 10 runs of 5 million ierations of 8 input variants
  ╔═══════════════════╤═════╤══════════════╗
  ║                   │  is │isUsingFunctor║
  ╟───────────────────┼─────┼──────────────╢
  ║ **Njs : v10.24.1**│0.583│     1.594    ║
  ╟───────────────────┼─────┼──────────────╢
  ║ **Njs : v14.17.0**│     │              ║
  ╟───────────────────┼─────┼──────────────╢
  ║ **Njs : v15.14.0**│     │              ║
  ╟───────────────────┼─────┼──────────────╢
  ║Kos : Njs : v12.9.1│     │              ║
  ╚═══════════════════╧═════╧══════════════╝
  */
  debugger;
  var debugFlag = Config.debug;
  Config.debug = false;

  /* */

  test.case = 'is';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'is';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  test.case = 'isUsingFunctor';
  var took, time;
  var env = initializeVariables();

  time = _.time.now();
  for( let i = env.times; i > 0; i-- )
  {
    env.name = 'isUsingFunctor';
    run( env );
  }
  took = __.time.spent( time );

  console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
  test.identical( true, true );

  /* */

  Config.debug = debugFlag;
  debugger;

  /* */

  function initializeVariables()
  {
    var env = {};
    env.times = 5000000;
    env.argumentArray = arguments;
    env.madeArgumentArray = _.argumentsArray.make( [] );
    env.anArray = [ 1, 2, 3 ];
    env.arrayProtoType = Array.prototype;
    env.aString = 'string';
    env.aTypedArray = new U64x( 10 );
    env.falseArray = { __proto__ : Array.prototype }

    return env;
  }

  /* */

  function run( env )
  {
    _.argumentsArray[ env.name ]( env.argumentArray );
    _.argumentsArray[ env.name ]( env.madeArgumentArray );
    _.argumentsArray[ env.name ]( env.anArray );
    _.argumentsArray[ env.name ]( env.arrayProtoType );
    _.argumentsArray[ env.name ]( env.aString );
    _.argumentsArray[ env.name ]( env.aTypedArray );
    _.argumentsArray[ env.name ]( env.falseArray );
    _.argumentsArray[ env.name ]();
  }

}

isPerformance.timeOut = 1e7;
isPerformance.experimental = true;

// --
//
// --

const Proto =
{

  name : 'Tools.ArgumentsArray.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {
    dichotomy,
    make,
    from,
    isPerformance
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
