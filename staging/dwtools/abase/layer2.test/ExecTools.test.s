( function ExecTools_test_s( ) {

'use strict';

var isBrowser = true;

if( typeof module !== 'undefined' )
{

  isBrowser = false;

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );
  _.include( 'wFiles' );

}

var _ = _global_.wTools;
var Self = {};

// --
// context
// --

function testDirMake()
{
  var context = this;
  if( !isBrowser )
  context.testRootDirectory = _.dirTempMake( _.pathJoin( __dirname, '../..'  ) );
  else
  context.testRootDirectory = _.pathCurrent();
}

//

function cleanTestDir()
{
  var context = this;
  if( !isBrowser )
  _.fileProvider.filesDelete( context.testRootDirectory );
}

// --
// test
// --

function appArgs( test )
{
  var _argv =  process.argv.slice( 0, 2 );
  _argv = _.pathsNormalize( _argv );

  /* */

  var argv = [];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    subject : '',
    scriptArgs : [],
    scriptString : '',
  }
  test.contain( got, expected );
  got = null;


  /* */

  var argv = [ '' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    subject : '',
    scriptArgs : [''],
    scriptString : '',
  }
  test.contain( got, expected );


  /* */

  var argv = [ 'x', ':', 'aa', 'bbb :' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    map : { x : 'aa bbb' },
    subject : '',
    scriptArgs : [ 'x', ':', 'aa', 'bbb', ':' ]
  }
  test.contain( got, expected );

  // logger.log( _.toStr( got.scriptArgs ) )

  /* */

  var argv = [ 'x', ' : ', 'y' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    map : { x : 'y' },
    subject : '',
    scriptArgs :[ 'x', ':', 'y' ]
  }
  test.contain( got, expected );

  /* */

  var argv = [ 'x', ' :', 'y', 'x', ' :', '1' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    map : { x : 1 },
    subject : '',
    scriptArgs : [ 'x', ':', 'y', 'x', ':', '1' ]
  }
  test.contain( got, expected );

  /* */

  var argv = [ 'a b c d', 'x', ' :', 'y', 'xyz', 'y', ' :', 1 ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    map : { x : 'y xyz', y : 1 },
    subject : 'a b c d',
    scriptArgs : [ 'a b c d', 'x', ':', 'y', 'xyz', 'y', ':', 1 ]
  }
  test.contain( got, expected );

  /* */

  var argv =
  [
    'filePath',
    'a :', 1,
    'b', ' :2',
    'c :  ', 3,
    'd', ' :  4',
    'e', ' :  ', 5
  ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    map : { a : 1, b : 2, c : 3, d : 4, e : 5 },
    subject : 'filePath',
    scriptArgs :
    [
      'filePath',
      'a', ':', 1,
      'b', ':', '2',
      'c', ':', 3,
      'd', ':', '4',
      'e', ':', 5
    ]
  }
  test.contain( got, expected );

  /* */

  var argv = [ 'a :b :c :d', 'x', ' :', 0, 'y', ' :', 1 ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv, caching : 0 });
  var expected =
  {
    interpreterPath : _argv[ 0 ],
    mainPath : _argv[ 1 ],
    interpreterArgs : [],
    delimeter : ':',
    map : { a : '', b : '', c : 'd', x : 0, y : 1 },
    subject : '',
    scriptArgs : [ 'a', ':', 'b', ':', 'c', ':', 'd', 'x', ':', 0, 'y', ':', 1 ]
  }
  test.contain( got, expected );
}

//

function shell( test )
{
  var context = this;
  var testRoutineDir = _.pathJoin( context.testRootDirectory, test.name );
  var commonDefaults =
  {
    outputPiping : 1,
    outputCollecting : 1,
    applyingExitCode : 1,
    throwingExitCode : 1
  }

  /* */

  function testApp()
  {

    if( typeof module !== 'undefined' )
    {
      try
      {
        require( '../../../Base.s' );
      }
      catch( err )
      {
        require( 'wTools' );
      }

      var _ = _global_.wTools;

      _.include( 'wConsequence' );
      _.include( 'wStringsExtra' );
      _.include( 'wStringer' );
      _.include( 'wPath' );

    }

    var _ = _global_.wTools;

    var args = _.appArgs();
    var con = new _.Consequence().give();
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

  var testAppPath = _.fileProvider.pathNativize( _.pathJoin( testRoutineDir, 'testApp.js' ) );
  var testApp = testApp.toString() + '\ntestApp();';
  _.fileProvider.fileWrite( testAppPath, testApp );

  var o;
  var con = new _.Consequence().give();

  con.doThen( function()
  {
    test.description = 'mode : spawn';

    o =
    {
      path : 'node ' + testAppPath,
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
      test.identical( options.exitCode, 0 );
      test.identical( options.output, testAppPath );
    })
  })
  .ifNoErrorThen( function()
  {
    /* mode : spawn, stdio : ignore */

    debugger

    o.stdio = 'ignore';
    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.exitCode, 0 );
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
  //     test.identical( options.exitCode, 0 );
  //     test.identical( options.output.length, 0 );
  //   })
  // })
  .ifNoErrorThen( function()
  {
    test.description = 'mode : shell';

    o =
    {
      path : 'node ' + testAppPath,
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
      test.identical( options.exitCode, 0 );
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
      test.identical( options.exitCode, 0 );
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
  //     test.identical( options.exitCode, 0 );
  //     test.identical( options.output.length, 0 );
  //   })
  // })
  .ifNoErrorThen( function()
  {
    test.description = 'spawn, stop process using kill';

    o =
    {
      path : 'node ' + testAppPath + ' loop : 1',
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
      test.identical( !options.exitCode, true );
      shell.give();
    })

    return shell;
  })
  .ifNoErrorThen( function()
  {
    test.description = 'shell, stop process using kill';

    o =
    {
      path : 'node ' + testAppPath + ' loop : 1',
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
      test.identical( !options.exitCode, true );
      shell.give();
    })

    return shell;
  })
  .ifNoErrorThen( function()
  {
    test.description = 'spawn, return good code';

    o =
    {
      path : 'node ' + testAppPath + ' exitWithCode : 0',
      mode : 'spawn',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.mustNotThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.exitCode, 0 ) );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'spawn, return bad code';

    o =
    {
      path : 'node ' + testAppPath + ' exitWithCode : 1',
      mode : 'spawn',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.shouldThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.exitCode, 1 ) );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'shell, return good code';

    o =
    {
      path : 'node ' + testAppPath + ' exitWithCode : 0',
      mode : 'shell',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.mustNotThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.exitCode, 0 ) );
  })
  .ifNoErrorThen( function()
  {
    test.description = 'shell, return bad code';

    o =
    {
      path : 'node ' + testAppPath + ' exitWithCode : 1',
      mode : 'shell',
      stdio : 'pipe'
    }

    var options = _.mapSupplement( {}, o, commonDefaults );

    return test.shouldThrowError( _.shell( options ) )
    .doThen( () => test.identical( options.exitCode, 1 ) );
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
  //   var con = _.shell({ code : 'xxx', throwingExitCode : 1, mode : 'shell' });
  //   return test.shouldThrowErrorSync( con );
  // })
  // .ifNoErrorThen( function()
  // {
  //   test.description = 'bad command, spawn';
  //   var con = _.shell({ code : 'xxx', throwingExitCode : 1, mode : 'spawn' });
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

function shell2( test )
{
  var context = this;
  var testRoutineDir = _.pathJoin( context.testRootDirectory, test.name );
  var commonDefaults =
  {
    outputPiping : 1,
    outputCollecting : 1,
    applyingExitCode : 1,
    throwingExitCode : 1
  }

  /* */

  function testApp()
  {

    if( typeof module !== 'undefined' )
    {
      try
      {
        require( '../../../Base.s' );
      }
      catch( err )
      {
        require( 'wTools' );
      }

      var _ = _global_.wTools;

      _.include( 'wConsequence' );
      _.include( 'wStringsExtra' );
      _.include( 'wStringer' );
      _.include( 'wPath' );

    }

    var _ = _global_.wTools;

    var con = new _.Consequence().give();
    con.timeOutThen( _.numberRandomInt( [ 300, 2000 ] ), function()
    {
      console.log( process.argv.slice( 2 ).join( ' ' ) );
    });

  }

  /* */

  var testAppPath = _.fileProvider.pathNativize( _.pathJoin( testRoutineDir, 'testApp.js' ) );
  var testApp = testApp.toString() + '\ntestApp();';
  _.fileProvider.fileWrite( testAppPath, testApp );

  var o;
  var con = new _.Consequence().give();

  con.doThen( function()
  {
    test.description = 'mode : shell';

    o =
    {
      path : 'node ' + testAppPath,
      args : [ 'staging', 'debug' ],
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
      test.identical( options.exitCode, 0 );
      test.identical( options.output, o.args.join( ' ' ) );
    })
  })

  //

  con.doThen( function()
  {
    test.description = 'mode : shell, passingThrough : true, no args';

    o =
    {
      path : 'node ' + testAppPath,
      mode : 'shell',
      passingThrough : 1,
      stdio : 'pipe'
    }
  })
  .ifNoErrorThen( function()
  {
    /* mode : shell, stdio : pipe, passingThrough : true */

    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.exitCode, 0 );
      var expectedArgs= _.arrayAppendArray( [], process.argv.slice( 2 ) );
      test.identical( options.output, expectedArgs.join( ' ' ) );
    })
  })

  //

  con.doThen( function()
  {
    test.description = 'mode : spawn, passingThrough : true, only filePath in args';

    o =
    {
      path : 'node',
      args : [ testAppPath ],
      mode : 'spawn',
      passingThrough : 1,
      stdio : 'pipe'
    }
  })
  .ifNoErrorThen( function()
  {
    /* mode : spawn, stdio : pipe, passingThrough : true */

    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.exitCode, 0 );
      var expectedArgs = _.arrayAppendArray( [], process.argv.slice( 2 ) );
      test.identical( options.output, expectedArgs.join( ' ' ) );
    })
  })

  //

  con.doThen( function()
  {
    test.description = 'mode : spawn, passingThrough : true, incorrect usage of o.path in spawn mode';

    o =
    {
      path : 'node ' + testApp,
      args : [ 'staging' ],
      mode : 'spawn',
      passingThrough : 1,
      stdio : 'pipe'
    }
  })
  .ifNoErrorThen( function()
  {
    var options = _.mapSupplement( {}, o, commonDefaults );
    return test.shouldThrowError( _.shell( options ) );
  })

  //

  con.doThen( function()
  {
    test.description = 'mode : shell, passingThrough : true';

    o =
    {
      path : 'node ' + testAppPath,
      args : [ 'staging', 'debug' ],
      mode : 'shell',
      passingThrough : 1,
      stdio : 'pipe'
    }
  })
  .ifNoErrorThen( function()
  {
    /* mode : shell, stdio : pipe, passingThrough : true */

    var options = _.mapSupplement( {}, o, commonDefaults );

    return _.shell( options )
    .doThen( function()
    {
      test.identical( options.exitCode, 0 );
      var expectedArgs = _.arrayAppendArray( [ 'staging', 'debug' ], process.argv.slice( 2 ) );
      test.identical( options.output, expectedArgs.join( ' ' ) );
    })
  })

  return con;
}

shell2.timeOut = 30000;

//

var Proto =
{

  name : 'ExecTools',
  silencing : 1,

  onSuitBegin : testDirMake,
  onSuitEnd : cleanTestDir,

  context :
  {

    testRootDirectory : null,

  },

  tests :
  {

    appArgs : appArgs,

    shell : shell,
    shell2 : shell2,

  },

}

_.mapExtend( Self,Proto );

//

Self = wTestSuit( Self );

if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self )

})();
