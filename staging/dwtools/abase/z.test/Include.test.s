( function Include_test_s( ) {

'use strict';

/*

to run this test from the project directory, pelase run

npm install
node ./staging/z.test/Include.test.s

*/

if( typeof module !== 'undefined' )
{

  require( '../../../../dwtools/Base.s' )/*fff*/;

  var _ = wTools

  // _.include( 'wPrinterToJstructure' );
  _.include( 'wTesting' );

}

var _ = wTools;
var Self = {};

//

function appArgs( test )
{
  var _argv =  process.argv.slice( 0, 2 );

  //

  var argv = [];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: {},
    subject: '',
    scriptArgs: [ ]
  }
  test.identical( got, expected );

  //

  var argv = [ '' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: {},
    subject: '',
    scriptArgs: [ '' ]
  }
  test.identical( got, expected );

  //

  var argv = [ 'x', ':', 'aaa', 'bbb:' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: { x : 'aaa bbb' },
    subject: '',
    scriptArgs: [ 'x', ':', 'aaa', 'bbb', ':' ]
  }
  test.identical( got, expected );

  //

  var argv = [ 'x', ':', 'y' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: { x : 'y' },
    subject: '',
    scriptArgs: argv.slice( 2 )
  }
  test.identical( got, expected );

  //

  var argv = [ 'x', ':', 'y', 'x', ':', '1' ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: { x : 1 },
    subject: '',
    scriptArgs: argv.slice( 2 )
  }
  test.identical( got, expected );

  //

  var argv = [ 'a b c d', 'x', ':', 'y', 'xyz', 'y', ':', 1 ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: { x : 'y xyz', y : 1 },
    subject: 'a b c d',
    scriptArgs: argv.slice( 2 )
  }
  test.identical( got, expected );

  //

  var argv =
  [
    'filePath',
    'a:', 1,
    'b', ':2',
    'c:  ', 3,
    'd', '  :  4',
    'e', '  :  ', 5
  ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: { a : 1, b : 2, c : 3, d : 4, e : 5 },
    subject: 'filePath',
    scriptArgs:
    [
      'filePath',
      'a', ':', 1,
      'b', ':', '2',
      'c', ':', 3,
      'd', ':', '4',
      'e', ':', 5
    ]
  }
  test.identical( got, expected );

  //

  var argv = [ 'a:b:c:d', 'x', ':', 0, 'y', ':', 1 ];
  argv.unshift.apply( argv, _argv );
  var got = _.appArgs({ argv : argv });
  var expected =
  {
    interpreterPath: _argv[ 0 ],
    mainPath: _argv[ 1 ],
    interpreterArgs: [],
    delimter: ':',
    map: { a : '', b : '', c : 'd', x : 0, y : 1 },
    subject: '',
    scriptArgs: [ 'a', ':', 'b', ':', 'c', ':', 'd', 'x', ':', 0, 'y', ':', 1 ]
  }
  test.identical( got, expected );

}

//

var Proto =
{

  name : 'Include',
  silencing : 1,
  verbosity : 10,

  tests :
  {
    appArgs : appArgs,
  }

}

_.mapExtend( Self,Proto );

//

Self = wTestSuite( Self );

if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self )

} )( );
