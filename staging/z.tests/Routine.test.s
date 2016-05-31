( function Routine_test_s( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/z.tests/Routine.test.s

   */

  if( typeof module !== 'undefined' )
  {

    if( require( 'fs' ).existsSync( __dirname + '/../object/Testing.debug.s' ) )
    require( '../object/Testing.debug.s' );
    else
    require( 'wTesting' );

  }

  var _ = wTools;
  var Self = {};

  //

  var _routineBind = function( test )
  {
    
    var testFunction1 = function( x, y )
      {
        return x + y
      },

      testFunction2 = function( x, y )
      {
        return this;
      },
      testFunction3 = function( x, y )
      {
        return x + y + this.k;
      },
      testFunction4 = function( x, y )
      {
        return this;
      };

    var contextConstructor3 = function() {
        this.k = 15
      },
      context3 = new contextConstructor3(),
      context5 = new contextConstructor3();

    var testParam1 = 2,
      testParam2 = 4,
      options1 =
      {
        seal: false,
        routine: testFunction1,
        args: [ testParam2 ] // x
      },
      options2 =
      {
        seal: true,
        routine: testFunction2,
        args: [ testParam2 ] // x
      },

      options3 =
      {
        seal: false,
        routine: testFunction3,
        args: [ testParam2 ], // x
        context: context3
      },
      options4 =
      {
        seal: false,
        routine: testFunction4,
        args: [ testParam2 ], // x
        context: context3
      },

      options5 =
      {
        seal: true,
        routine: testFunction3,
        args: [ testParam1, testParam2 ], // x
        context: context5
      },

      wrongOpt1 = {
        seal: true,
        routine: {},
        args: [ testParam1, testParam2 ], // x
        context: context5
      },

      wrongOpt2 = {
        seal: true,
        routine: testFunction3,
        args: 'wrong', // x
        context: context5
      },

      expected1 = 6,
      expected2 = undefined,
      expected3 = 21,
      expected5 = 21;

    test.description = 'simple function without context with arguments bind without seal: result check';
    var gotfn = _._routineBind( options1 );
    var got = gotfn( testParam1 );
    test.identical( got,expected1 );

    test.description = 'simple function without context and seal: context test';
    var gotfn = _._routineBind(options2);
    var got = gotfn( testParam1 );
    test.identical( got, expected2 );

    test.description = 'simple function with context and arguments: result check';
    var gotfn = _._routineBind(options3);
    var got = gotfn( testParam1 );
    test.identical( got, expected3 );

    test.description = 'simple function with context and arguments: context check';
    var gotfn = _._routineBind(options4);
    var got = gotfn( testParam1 );
    test.identical( got instanceof contextConstructor3, true );

    test.description = 'simple function with context and arguments: result check, seal == true ';
    var gotfn = _._routineBind(options5);
    var got = gotfn( testParam1 );
    test.identical( got, expected5 );
    
    /**/

    if( Config.debug )
    {

      test.description = 'missed argument';
      test.shouldThrowError( function()
      {
        _._routineBind();
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _._routineBind( options1, options2 );
      });

      test.description = 'passed non callable object';
      test.shouldThrowError( function()
      {
        _._routineBind( wrongOpt1 );
      });

      test.description = 'passed arguments as primitive value';
      test.shouldThrowError( function()
      {
        _._routineBind( wrongOpt2 );
      });

    }

  };

  //

  var Proto =
  {
    name : 'routine',

    tests:
    {

      _routineBind : _routineBind

    }
  };

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
  _.testing.test( Self );

} )( );
