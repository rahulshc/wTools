( function ExecTools_test_s( ) {

'use strict';

var isBrowser = true;

if( typeof module !== 'undefined' )
{

  isBrowser = false;
  if( typeof wBase === 'undefined' )
  try
  {
    try
    {
      require.resolve( '../../../../dwtools/Base.s' )/*fff*/;
    }
    finally
    {
      require( '../../../../dwtools/Base.s' )/*fff*/;
    }
  }
  catch( err )
  {
    require( 'wTools' );
  }
var _ = wTools;

  _.include( 'wTesting' );

}

/*
!!! temp files cleanup needed
*/

var _ = wTools;
var Self = {};

// return;

var testRootDirectory;

function testDirMake()
{
  if( !isBrowser )
  testRootDirectory = _.dirTempMake( _.pathJoin( __dirname, '../..'  ) );
  else
  testRootDirectory = _.pathCurrent();
}

//

function cleanTestDir()
{
  if( !isBrowser )
  _.fileProvider.fileDelete( testRootDirectory );
}

//

function shell( test )
{
  var testRoutineDir = _.pathJoin( testRootDirectory, test.name );
  var commonDefaults =
  {
    outputPiping : 1,
    outputCollecting : 1,
    applyingExitCode : 1,
    throwingBadExitCode : 1
  }

  /* */

  function testApp()
  {

    if( typeof module !== 'undefined' )
    {
      try
      {
        require( '../dwtools/Base.s' );
      }
      catch( err )
      {
        require( 'wTools' );
      }

      var _ = wTools;

      _.include( 'wConsequence' );

    }

    var _ = wTools;

    var args = _.appArgs();
    var con = new wConsequence().give();
    con.timeOutThen( _.numberRandomInt( [ 300, 2000 ] ), function()
    {
      if( args.map.exitWithCode )
      process.exit( args.map.exitWithCode )

      if( args.map.loop )
      while( 1 )
      {
      }

      console.log( __filename );
    });

  }

  /* */

  var testAppPath = _.pathJoin( testRoutineDir, 'testApp.js' );
  var testApp = testApp.toString() + '\ntestApp();';
  _.fileProvider.fileWrite( testAppPath, testApp );

  var o;
  var con = new wConsequence().give();

  con.doThen( function()
  {
    test.description = 'mode : spawn';

    o =
    {
      code : 'node ' + testAppPath,
      mode : 'spawn',
      stdio : 'pipe'
    }
  })
  .ifNoErrorThen( function()
  {
    /* mode : spawn, stdio : pipe */

    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.returnCode, 0 );
      test.identical( options.output, testAppPath );
    })
  })
  .ifNoErrorThen( function()
  {
    /* mode : spawn, stdio : ignore */

    o.stdio = 'ignore';
    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.returnCode, 0 );
      test.identical( options.output.length, 0 );
    })
  })
  // .ifNoErrorThen( function()
  // {
  //   /* mode : spawn, stdio : inherit */

  //   o.stdio = 'inherit';

  //   var options = _.mapSupplement( {}, o, commonDefaults );

  //   return _.shell( options )
  //   .doThen( function()
  //   {
  //     test.identical( options.returnCode, 0 );
  //     test.identical( options.output.length, 0 );
  //   })
  // })
  .ifNoErrorThen( function()
  {
    test.description = 'mode : shell';

    o =
    {
      code : 'node ' + testAppPath,
      mode : 'shell',
      stdio : 'pipe'
    }
  })
  .ifNoErrorThen( function()
  {
    /* mode : shell, stdio : pipe */

    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.returnCode, 0 );
      test.identical( options.output, testAppPath );
    })
  })
  .ifNoErrorThen( function()
  {
    /* mode : shell, stdio : ignore */

    o.stdio = 'ignore'

    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.returnCode, 0 );
      test.identical( options.output.length, 0 );
    })
  })
  // .ifNoErrorThen( function()
  // {
  //   /* mode : shell, stdio : inherit */

  //   o.stdio = 'inherit'

  //   var options = _.mapSupplement( {}, o, commonDefaults );

  //   return _.shell( options )
  //   .doThen( function()
  //   {
  //     test.identical( options.returnCode, 0 );
  //     test.identical( options.output.length, 0 );
  //   })
  // })
  .ifNoErrorThen( function()
  {
    test.description = 'spawn, stop process using kill';

    o =
    {
      code : 'node ' + testAppPath + ' loop : 1',
      mode : 'spawn',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    var shell = _.shell( options );
    shell.give();
    shell.doThen(function()
    {
      test.identical( options.process.killed, false );
      options.process.kill( 'SIGINT' );

    })
    shell.got(function()
    {
      test.identical( options.process.killed, true );
      test.identical( !options.returnCode, true );
      shell.give();
    })

    return shell;
  })
  .ifNoErrorThen( function()
  {
    test.description = 'shell, stop process using kill';

    o =
    {
      code : 'node ' + testAppPath + ' loop : 1',
      mode : 'shell',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    var shell = _.shell( options );
    shell.give();
    shell.doThen(function()
    {
      test.identical( options.process.killed, false );
      options.process.kill( 'SIGINT' );
    })
    shell.got(function()
    {
      test.identical( options.process.killed, true );
      test.identical( !options.returnCode, true );
      shell.give();
    })

    return shell;
  })
  .ifNoErrorThen( function()
  {
    test.description = 'spawn, return good code';

    o =
    {
      code : 'node ' + testAppPath + ' exitWithCode : 0',
      mode : 'spawn',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.mustNotThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.returnCode, 0 ) );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'spawn, return bad code';

    o =
    {
      code : 'node ' + testAppPath + ' exitWithCode : 1',
      mode : 'spawn',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.shouldThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.returnCode, 1 ) );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'shell, return good code';

    o =
    {
      code : 'node ' + testAppPath + ' exitWithCode : 0',
      mode : 'shell',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.mustNotThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.returnCode, 0 ) );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'shell, return bad code';

    o =
    {
      code : 'node ' + testAppPath + ' exitWithCode : 1',
      mode : 'shell',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.shouldThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.returnCode, 1 ) );
  })
  //
  // test.description = 'test';
  // test.identical( 0, 0 );

  // con
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'simple command';
  //   var con = _.shell( 'exit' );
  //   return test.shouldMessageOnlyOnce( con );
  // })
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'bad command, shell';
  //   var con = _.shell({ code : 'xxx', throwingBadExitCode : 1, mode : 'shell' });
  //   return test.shouldThrowErrorSync( con );
  // })
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'bad command, spawn';
  //   var con = _.shell({ code : 'xxx', throwingBadExitCode : 1, mode : 'spawn' });
  //   return test.shouldThrowErrorSync( con );
  // })
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'several arguments';
  //   var con = _.shell( 'echo echo something' );
  //   return test.mustNotThrowError( con );
  // })
  // ;

  // con.doThen( () =>  _.fileProvider.fileDelete( testAppPath ) );
  return con;
}

shell.timeOut = 30000;

//

var Proto =
{

  name : 'ExecTools',
  silencing : 1,
  // verbosity : 9,
  // suiteFileLocation : suiteFileLocation,
  // logger : wPrinterToJstructure(),

  onSuitBegin : testDirMake,
  onSuitEnd : cleanTestDir,

  tests :
  {
    shell : shell,
  }

}

_.mapExtend( Self,Proto );

//

Self = wTestSuite( Self );

if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self )
// .got( function( err,suit )
// {
//   debugger;
//   console.log( 'done!' );
//   console.log( 'err',err );
//   console.log( 'suit',suit );
// });

} )( );
