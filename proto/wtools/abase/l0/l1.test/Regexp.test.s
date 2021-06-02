( function _l0_l1_Regexp_test_s_()
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

/* qqq xxx : implement test routine _.regexp.isEmpty()

- among other values should check /(?:)/

*/

// --
// implementation
// --

/* qqq : for junior : extend. ask how to */
function dichotomy( test )
{
  dichotomyTemplate( { method : 'is' } );
  dichotomyTemplate( { method : 'isOld' } );
  dichotomyTemplate( { method : 'isUsingInstanceOf' } );
  dichotomyTemplate( { method : 'like' } );
  dichotomyTemplate( { method : 'likeOld' } );
  dichotomyTemplate( { method : 'likeUnfolded' } );
  dichotomyTemplate( { method : 'likeUsingisUsingInstanceOf' } );

  function dichotomyTemplate( env )
  {
    test.case = `${__.entity.exportStringSolo( env )}, undefined`;
    var got = _.regexp[ env.method ]( undefined );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, null`;
    var got = _.regexp[ env.method ]( null );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, false`;
    var got = _.regexp[ env.method ]( false );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, NaN`;
    var got = _.regexp[ env.method ]( NaN );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, a boolean`;
    var got = _.regexp[ env.method ]( true );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, a number`;
    var got = _.regexp[ env.method ]( 13 );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, a function`;
    var got = _.regexp[ env.method ]( function() {} );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, constructor`;
    function Constr( x )
    {
      this.x = x;
      return this;
    }
    var got = _.regexp[ env.method ]( new Constr( 0 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, BufferRaw`;
    var got = _.regexp[ env.method ]( new BufferRaw( 5 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, BufferView`;
    var got = _.regexp[ env.method ]( new BufferView( new BufferRaw( 5 ) ) );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, Set`;
    var got = _.regexp[ env.method ]( new Set( [ 5 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, Map`;
    var got = _.regexp[ env.method ]( new HashMap( [ [ 1, 2 ] ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, pure empty map`;
    var got = _.regexp[ env.method ]( Object.create( null ) );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, pure map`;
    var src = Object.create( null );
    src.x = 1;
    var got = _.regexp[ env.method ]( src );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, map from pure map`;
    var src = Object.create( Object.create( null ) );
    var got = _.regexp[ env.method ]( src );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, an empty object`;
    var got = _.regexp[ env.method ]( {} );
    var expected = false;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, an object`;
    var got = _.regexp[ env.method ]( { a : 7, b : 13 } );
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, regexp`;
    var got = _.regexp[ env.method ]( /a/ );
    var expected = true;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, regexp empty`;
    var got = _.regexp[ env.method ]( /(?:)/ );
    var expected = true;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, regexp with flags`;
    var got = _.regexp[ env.method ]( /a/g );
    var expected = true;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, regexp complex`;
    var got = _.regexp[ env.method ]( /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}\1\d{4}/ );
    var expected = true;
    test.identical( got, expected );

    test.case = `${__.entity.exportStringSolo( env )}, empty string`;
    var got = _.regexp[ env.method ]( '' );
    if( env.method.startsWith( 'is' ) )
    test.identical( got, false );
    if( env.method.startsWith( 'like' ) )
    test.identical( got, true );

    test.case = `${__.entity.exportStringSolo( env )}, a string`;
    var got = _.regexp[ env.method ]( 'str' );
    if( env.method.startsWith( 'is' ) )
    test.identical( got, false );
    if( env.method.startsWith( 'like' ) )
    test.identical( got, true );

    test.case = `${__.entity.exportStringSolo( env )}, a string object`;
    var got = _.regexp[ env.method ]( new String( 'str' ) );
    if( env.method.startsWith( 'is' ) )
    test.identical( got, false );
    if( env.method.startsWith( 'like' ) )
    test.identical( got, true );
  }
}

//

function isPerformance( test )
{
  /* Average of 10 runs of 5 million iterations of 14 input varaints
  ╔════════════════════════╤═════╤═════╤═════════════════╤═════╤═══════╤══════════════════════════╤════════════╗
  ║                        │  is │isOld│isUsingInstanceOf│ like│likeOld│likeUsingisUsingInstanceOf│likeUnfolded║
  ╟────────────────────────┼─────┼─────┼─────────────────┼─────┼───────┼──────────────────────────┼────────────╢
  ║Windows-10-20H2, 10.24.1│1.267│1.267│      0.805      │2.410│ 2.410 │           1.913          │    1.285   ║
  ╟────────────────────────┼─────┼─────┼─────────────────┼─────┼───────┼──────────────────────────┼────────────╢
  ║Windows-10-20H2, 14.17.0│1.282│1.282│      0.869      │2.020│ 2.020 │           2.004          │    1.250   ║
  ╟────────────────────────┼─────┼─────┼─────────────────┼─────┼───────┼──────────────────────────┼────────────╢
  ║    Linux-Kos, 12.9.1   │     │     │                 │     │       │                          │            ║
  ╚════════════════════════╧═════╧═════╧═════════════════╧═════╧═══════╧══════════════════════════╧════════════╝
  */
  debugger; /* eslint-disable-line no-debugger */
  var debugFlag = Config.debug;
  Config.debug = false;

  /* */

  isPerformanceTemplate( { method : 'like' } );
  isPerformanceTemplate( { method : 'likeOld' } );
  isPerformanceTemplate( { method : 'likeUsingisUsingInstanceOf' } );
  isPerformanceTemplate( { method : 'likeUnfolded' } );
  isPerformanceTemplate( { method : 'is' } );
  isPerformanceTemplate( { method : 'isOld' } );
  isPerformanceTemplate( { method : 'isUsingInstanceOf' } );

  /* */

  Config.debug = debugFlag;
  debugger; /* eslint-disable-line no-debugger */

  /* */

  function isPerformanceTemplate( data )
  {
    test.case = `${data.method}`;
    var took, time;
    var env = initializeVariables();

    time = _.time.now();
    for( let i = env.times; i > 0; i-- )
    {
      env.name = data.method;
      run( env );
    }
    took = __.time.spent( time );

    console.log( `${env.times} iterations of ${test.case} took : ${took} on ${process.version}` );
    test.identical( true, true );
  }

  /* */

  function initializeVariables()
  {
    var env = {};
    env.times = 5000000;
    env.aRegex = /a/;
    env.anEmptyRegex = /(?:)/;
    env.aRegexWithFlag = /a/g;
    env.aComplexRegex = /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}\1\d{4}/ ;
    env.anEmptyString = '';
    env.aString = 'str';
    env.stringObject = new String( 'str' );
    env.aNumber = 2;
    env.aBoolean = false;
    env.anArray = [ 1, 2, 3 ];
    env.aMap = { data : 5 };

    return env;
  }

  /* */

  function run( env )
  {
    _.regexp[ env.name ]( env.aRegex );
    _.regexp[ env.name ]( env.anEmptyRegex );
    _.regexp[ env.name ]( env.aRegexWithFlag );
    _.regexp[ env.name ]( env.aComplexRegex );
    _.regexp[ env.name ]( env.anEmptyString );
    _.regexp[ env.name ]( env.aString );
    _.regexp[ env.name ]( env.stringObject );

    _.regexp[ env.name ]( env.aNumber );
    _.regexp[ env.name ]( env.aBoolean );
    _.regexp[ env.name ]( env.anArray );
    _.regexp[ env.name ]( env.aMap );
    _.regexp[ env.name ]( null );
    _.regexp[ env.name ]( undefined );
    _.regexp[ env.name ]();
  }
}

isPerformance.timeOut = 1e7;
isPerformance.experimental = true;

// --
// suite definition
// --

const Proto =
{

  name : 'Tools.l1.Regexp.l0.l1',
  silencing : 1,

  tests :
  {

    dichotomy,
    isPerformance

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
