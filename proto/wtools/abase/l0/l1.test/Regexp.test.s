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
  dichotomyTemplate( { method : 'isUsingInstanceOf' } );
  dichotomyTemplate( { method : 'like' } );
  dichotomyTemplate( { method : 'likeUsingisUsingInstanceOf' } );

  function dichotomyTemplate( env )
  {
    test.case = 'undefined';
    var got = _.regexp[ env.method ]( undefined );
    var expected = false;
    test.identical( got, expected );

    test.case = 'null';
    var got = _.regexp[ env.method ]( null );
    var expected = false;
    test.identical( got, expected );

    test.case = 'false';
    var got = _.regexp[ env.method ]( false );
    var expected = false;
    test.identical( got, expected );

    test.case = 'NaN';
    var got = _.regexp[ env.method ]( NaN );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a boolean';
    var got = _.regexp[ env.method ]( true );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a number';
    var got = _.regexp[ env.method ]( 13 );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a function';
    var got = _.regexp[ env.method ]( function() {} );
    var expected = false;
    test.identical( got, expected );

    test.case = 'constructor';
    function Constr( x )
    {
      this.x = x;
      return this;
    }
    var got = _.regexp[ env.method ]( new Constr( 0 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferRaw';
    var got = _.regexp[ env.method ]( new BufferRaw( 5 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferView';
    var got = _.regexp[ env.method ]( new BufferView( new BufferRaw( 5 ) ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'Set';
    var got = _.regexp[ env.method ]( new Set( [ 5 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'Map';
    var got = _.regexp[ env.method ]( new HashMap( [ [ 1, 2 ] ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'pure empty map';
    var got = _.regexp[ env.method ]( Object.create( null ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'pure map';
    var src = Object.create( null );
    src.x = 1;
    var got = _.regexp[ env.method ]( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'map from pure map';
    var src = Object.create( Object.create( null ) );
    var got = _.regexp[ env.method ]( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'an empty object';
    var got = _.regexp[ env.method ]( {} );
    var expected = false;
    test.identical( got, expected );

    test.case = 'an object';
    var got = _.regexp[ env.method ]( { a : 7, b : 13 } );
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = 'regexp';
    var got = _.regexp[ env.method ]( /a/ );
    var expected = true;
    test.identical( got, expected );

    test.case = 'regexp empty';
    var got = _.regexp[ env.method ]( /(?:)/ );
    var expected = true;
    test.identical( got, expected );

    test.case = 'regexp with flags';
    var got = _.regexp[ env.method ]( /a/g );
    var expected = true;
    test.identical( got, expected );

    test.case = 'regexp complex';
    var got = _.regexp[ env.method ]( /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}\1\d{4}/ );
    var expected = true;
    test.identical( got, expected );

    test.case = 'empty string';
    var got = _.regexp[ env.method ]( '' );
    if( env.method.startsWith( 'is' ) )
    test.identical( got, false );
    if( env.method.startsWith( 'like' ) )
    test.identical( got, true );

    test.case = 'a string';
    var got = _.regexp[ env.method ]( 'str' );
    if( env.method.startsWith( 'is' ) )
    test.identical( got, false );
    if( env.method.startsWith( 'like' ) )
    test.identical( got, true );

    test.case = 'a string object';
    var got = _.regexp[ env.method ]( new String( 'str' ) );
    if( env.method.startsWith( 'is' ) )
    test.identical( got, false );
    if( env.method.startsWith( 'like' ) )
    test.identical( got, true );
  }
}

//

function likePerformance( test )
{
  /* Average of 10 runs of 5 million iterations of 14 input varaints
  ╔═══════════════════╤═════╤═══════╤═══════════════════════════╤═════╤═════╤═════════════════╗
  ║                   │ like│likeOld│ likeUsingisUsingInstanceOf│  is │isOld│isUsingInstanceOf║
  ╟───────────────────┼─────┼───────│───────────────────────────┼─────┼─────│─────────────────╢
  ║ **Njs : v10.24.1**│2.410│ 2.410 │    1.913                  │1.267│1.267│ 0.805           ║
  ╟───────────────────┼─────┼───────│───────────────────────────┼─────┼─────│─────────────────╢
  ║ **Njs : v14.17.0**│2.020│ 2.020 │    2.004                  │1.282│1.282│ 0.869           ║
  ╟───────────────────┼─────┼───────│───────────────────────────┼─────┼─────│─────────────────╢
  ║Kos : Njs : v12.9.1│     │       │                           │     │     │                 ║
  ╚═══════════════════╧═════╧═══════╧───────────────────────────╧═════╧═════╧═════════════════╝

  */
  debugger;
  var debugFlag = Config.debug;
  Config.debug = false;

  /* */

  likePerformanceTemplate( { method : 'like' } );
  likePerformanceTemplate( { method : 'likeUsingisUsingInstanceOf' } );
  likePerformanceTemplate( { method : 'is' } );
  likePerformanceTemplate( { method : 'isUsingInstanceOf' } );

  /* */

  Config.debug = debugFlag;
  debugger;

  /* */

  function likePerformanceTemplate( data )
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

likePerformance.timeOut = 1e7;
likePerformance.experimental = true;

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
    likePerformance

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
