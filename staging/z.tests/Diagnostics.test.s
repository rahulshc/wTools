( function( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/z.tests/Sample.test.s

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

  var _err = function( test )
  {

    var errMsg1 = 'some error message',
      fileName = 'Diagnostics.test.s',
      errObj1 = new Error('err obj for tesst'),
      errMsg2 = errObj1.message,
      errObj2 = new Error('Error #3'),
      errMsg3 = errObj2.message,
      optionsObj1 =
      {
        level: 2,
        args: null
      },
      optionsObj2 =
      {
        level: 2,
        args: [ errMsg1 ]
      },
      optionsObj3 =
      {
        level: 3,
        args: [ errObj1 ]
      },

      optionsObj4 =
      {
        level: 3,
        args: [ errMsg1, errObj2 ]
      };

    test.description = 'single string passed as args property: result should be Error obj';
    var got = _._err(optionsObj2);
    test.identical( got instanceof Error, true );

    test.description = 'single string passed as args property: result message should contains passed string';
    var expectMsg = new RegExp(errMsg1);
    test.identical(expectMsg.test(got.message), true);

    test.description = 'single string passed as args property: result message should contains file name';
    var expectFileName = new RegExp(fileName);
    test.identical(expectFileName.test(got.message), true);

    test.description = 'single error instance passed as args property: result should be Error obj';
    var got = _._err(optionsObj3);
    test.identical( got instanceof Error, true );

    test.description = 'single error instance passed as args property: result message should contains passed string';
    var expectMsg = new RegExp(errMsg2);
    test.identical(expectMsg.test(got.message), true);

    test.description = 'single error instance passed as args property: result message should contains file name';
    var expectFileName = new RegExp(errObj1.fileName);
    test.identical(expectFileName.test(got.message), true);

    test.description = 'several error instances/messages passed as args property: result should be Error obj';
    var got = _._err(optionsObj4);
    test.identical( got instanceof Error, true );

    test.description = 'several error instances/messages passed as args: result message should contains all ' +
      'passed string';
    var expectMsg1 = new RegExp(errMsg3),
      expectMsg2 = new RegExp(errMsg1);
    test.identical( [ expectMsg1.test( got.message ), expectMsg2.test( got.message ) ], [ true, true ]);

    test.description = 'several error instances/messages passed as args property: result message should contains ' +
      'file name';
    var expectFileName = new RegExp(fileName);
    test.identical(expectFileName.test(got.message), true);

    /**/

    if( Config.debug )
    {

      test.description = 'missed argument';
      test.shouldThrowError( function()
      {
        _._err();
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _._err( optionsObj1, optionsObj2 );
      });

      test.description = 'options.args not array';
      test.shouldThrowError( function()
      {
        _._err( optionsObj1 );
      });

    }

  }

  //

  var err = function( test )
  {
    var errMsg1 = 'some error message',
      fileName = 'Diagnostics.test.s',
      errObj1 = new Error('err obj for tesst'),
      errMsg2 = errObj1.message,
      errObj2 = new Error('Error #3'),
      errMsg3 = errObj2.message;


    test.description = 'single string passed as args property: result should be Error obj';
    var got = _.err(errMsg1);
    test.identical( got instanceof Error, true );

    test.description = 'single string passed as args property: result message should contains passed string';
    var expectMsg = new RegExp(errMsg1);
    test.identical(expectMsg.test(got.message), true);

    test.description = 'single string passed as args property: result message should contains file name';
    var expectFileName = new RegExp(fileName);
    test.identical(expectFileName.test(got.message), true);

    test.description = 'single error instance passed as args property: result should be Error obj';
    var got = _.err(errObj1);
    test.identical( got instanceof Error, true );

    test.description = 'single error instance passed as args property: result message should contains passed string';
    var expectMsg = new RegExp(errMsg2);
    test.identical(expectMsg.test(got.message), true);

    test.description = 'single error instance passed as args property: result message should contains file name';
    var expectFileName = new RegExp(errObj1.fileName);
    test.identical(expectFileName.test(got.message), true);

    test.description = 'several error instances/messages passed as args property: result should be Error obj';
    var got = _.err(errObj2, errMsg1);
    test.identical( got instanceof Error, true );

    test.description = 'several error instances/messages passed as args: result message should contains all ' +
      'passed string';
    var expectMsg1 = new RegExp(errMsg3),
      expectMsg2 = new RegExp(errMsg1);
    test.identical( [ expectMsg1.test( got.message ), expectMsg2.test( got.message ) ], [ true, true ]);

    test.description = 'several error instances/messages passed as args property: result message should contains ' +
      'file name';
    var expectFileName = new RegExp(fileName);
    test.identical(expectFileName.test(got.message), true);
    
  };

  //

  var Proto =
  {

    name : 'diagnostics',

    tests:
    {

      _err : _err,
      err  : err

    }

  }

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
