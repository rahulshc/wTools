( function _RegExp_test_s( ) {

  'use strict';

  /*

   to run this test
   from the project directory run

   npm install
   node ./staging/z.test/RegExp.test.s

   */

  if( typeof module !== 'undefined' )
  {

    require( '../wTools.s' );

    if( require( 'fs' ).existsSync( __dirname + '/../object/Testing.debug.s' ) )
    require( '../object/Testing.debug.s' );
    else
    require( 'wTesting' );

  }

  var _ = wTools;
  var Self = {};

  // shared variables
  var ArrOfRegx1 = [ /0/, /1/, /2/ ],
    ArrOfRegx2 = [ /3/, /4/, /5/ ],
    ArrOfRegx3 = [ /6/, /7/, /8/ ];

//

  var regexpEscape = function( test )
  {
    var simpleStr = 'hello world',
      specialCharacters = '.*+?^=!:${}()|[]/\\',
      simpleSent = 'Hello. How are you?',
      empty = '';

    var expected1 = '\\.\\*\\+\\?\\^\\=\\!\\:\\$\\{\\}\\(\\)\\|\\[\\]\\/\\\\',
      expected2 = "Hello\\. How are you\\?"

    test.description = 'escape simple str without spec. characters';
    var got = _.regexpEscape( simpleStr );
    test.identical( got, simpleStr );

    test.description = 'escape special characters';
    var got = _.regexpEscape( specialCharacters );
    test.identical( got, expected1 );

    test.description = 'escape simple sentences';
    var got = _.regexpEscape( simpleSent );
    test.identical( got, expected2 );

    test.description = 'escape empty string';
    var got = _.regexpEscape( empty );
    test.identical( got, empty );
  };

//

  var regexpForGlob = function( test )
  {
    var globSample1 = '*.txt',
      globSample2 = '*.*',
      globSample3 = '??',
      globSample4 = '**',
      globSample5 = 'subdir/img*/th_?';

    var expected1 = /^.\/[^\/]*\.txt$/m,
      expected2 = /^.\/[^\/]*\.[^\/]*$/m,
      expected3 = /^.\/..$/m,
      expected4 = /^.\/.*$/m,
      expected5 = /^.\/subdir\/img[^\/]*\/th_.$/m;

    test.description = 'pattern for all .txt files in directory';
    var got = _.regexpForGlob( globSample1 );
    test.identical( got.source, expected1.source );

    test.description = 'pattern for all files in directory';
    var got = _.regexpForGlob( globSample2 );
    test.identical( got.source, expected2.source );

    test.description = 'pattern for exactly two characters in length file names';
    var got = _.regexpForGlob( globSample3 );
    test.identical( got.source, expected3.source );

    test.description = 'pattern for all files and directories';
    var got = _.regexpForGlob( globSample4 );
    test.identical( got.source, expected4.source );

    test.description = 'complex pattern';
    var got = _.regexpForGlob( globSample5 );
    test.identical( got.source, expected5.source );


    if( Config.debug )
    {

      test.description = 'missing arguments';
      test.shouldThrowError( function()
      {
        _.regexpForGlob();
      });

      test.description = 'argument is not string';
      test.shouldThrowError( function()
      {
        _.regexpForGlob( {} );
      });
    }
  };

//

  var regexpMakeArray = function( test )
  {
    var arrOfStr = [ 'hello', 'world' ],
      singleStr = 'hello',
      singleReg = /world/,
      wrongParam1 = null,
      wrongParam2 = [ 3, 4 ],
      expectedArr1 = [ /hello/, /world/ ],
      expectedArr2 = [ /hello/ ],
      expectedArr3 = [ singleReg ];

    var getSource = function( v )
    {
      return v.source;
    }

    test.description = 'argument is array of string';
    var got = _.regexpMakeArray( arrOfStr );
    test.identical( got.map( getSource ), expectedArr1.map( getSource ) );

    test.description = 'argument is array of regexp';
    var got = _.regexpMakeArray( ArrOfRegx1 );
    test.identical( got, ArrOfRegx1 );

    test.description = 'argument is single string';
    var got = _.regexpMakeArray( singleStr );
    test.identical( got.map( getSource ), expectedArr2.map( getSource ) );

    test.description = 'argument is single regexp';
    var got = _.regexpMakeArray( singleReg );
    test.identical( got, expectedArr3 );

    test.description = 'argument is empty arr';
    var got = _.regexpMakeArray( [] );
    test.identical( got, [] );

    if( Config.debug )
    {
      test.description = 'call without arguments';
      test.shouldThrowError( function()
      {
        _.regexpMakeArray();
      });

      test.description = 'call with wrong type argument';
      test.shouldThrowError( function()
      {
        _.regexpMakeArray( wrongParam1 );
      });

      test.description = 'call with wrong type argument';
      test.shouldThrowError( function()
      {
        _.regexpMakeArray( wrongParam2 );
      });
    }
  };

//

  var regexpMakeExpression = function( test )
  {
    var simpleStr = 'hello',
      simpleReg = /world/,
      strWithSpChar = 'Hello. How are you?',
      wrongParam1 = null,
      expected1 = /hello/,
      expected2 = /Hello\. How are you\?/;


    test.description = 'argument is simple string';
    var got = _.regexpMakeExpression( simpleStr );
    test.identical( got.source, expected1.source );

    test.description = 'argument is regexp';
    var got = _.regexpMakeExpression( simpleReg );
    test.identical( got, simpleReg );

    test.description = 'argument is string with special characters';
    var got = _.regexpMakeExpression( strWithSpChar );
    test.identical( got.source, expected2.source );

    if( Config.debug )
    {
      test.description = 'call without arguments';
      test.shouldThrowError( function()
      {
        _.regexpMakeExpression();
      });

      test.description = 'call with wrong type argument';
      test.shouldThrowError( function()
      {
        _.regexpMakeExpression( wrongParam1 );
      });
    }
  };

//

  var _regexpAny = function( test )
  {
    var strForTest1 = 'some text 5',
      wrongTypeArr = [ /a/, /b/, '5' ],
      expectedIndex = 2,
      defaultParam = true;

    test.description = 'regexp is found in str';
    var got = _._regexpArrayAny( ArrOfRegx2, strForTest1, false );
    test.identical( got, expectedIndex );

    test.description = 'regexp isn\'t found in str';
    var got = _._regexpArrayAny( ArrOfRegx3, strForTest1, false );
    test.identical( got, false );

    test.description = 'empty regexp array passed';
    var got = _._regexpArrayAny( [], strForTest1, defaultParam );
    test.identical( got, defaultParam );

    if( Config.debug )
    {
      test.description = 'missed all arguments';
      test.shouldThrowError( function()
      {
        _._regexpArrayAny()
      });

      test.description = 'missed one of arguments';
      test.shouldThrowError( function()
      {
        _._regexpArrayAny( ArrOfRegx2, strForTest1 )
      });

      test.description = 'first argument is not array';
      test.shouldThrowError( function()
      {
        _._regexpArrayAny( 'hello', strForTest1, false );
      });

      test.description = 'element of array is not regexp';
      test.shouldThrowError( function()
      {
        _._regexpArrayAny( wrongTypeArr, strForTest1, false );
      });
    }
  };

//

  var _regexpAll = function( test )
  {
    var strForTest1 = '012349',
      wrongTypeArr = [ /0/, /3/, '9' ],
      expectedIndex = 2,
      defaultParam = false;

    test.description = 'all regexp is found in str';
    var got = _._regexpArrayAll( ArrOfRegx1, strForTest1, false );
    test.identical( got, true );

    test.description = 'one of regexp isn\'t found in str';
    var got = _._regexpArrayAll( ArrOfRegx2, strForTest1, false );
    test.identical( got, expectedIndex );

    test.description = 'empty regexp array passed';
    var got = _._regexpArrayAll( [], strForTest1, defaultParam );
    test.identical( got, defaultParam );

    if( Config.debug )
    {
      test.description = 'missed all arguments';
      test.shouldThrowError( function()
      {
        _._regexpAll()
      });

      test.description = 'missed one of arguments';
      test.shouldThrowError( function()
      {
        _._regexpArrayAll( ArrOfRegx2, strForTest1 )
      });

      test.description = 'first argument is not array';
      test.shouldThrowError( function()
      {
        _._regexpArrayAll( 'hello', strForTest1, false );
      });

      test.description = 'element of array is not regexp';
      test.shouldThrowError( function()
      {
        _._regexpArrayAll( wrongTypeArr, strForTest1, false );
      });
    }
  };

//

  //

  var regexpArrayIndex = function( test )
  {
    var str1 = 'some text 012',
      str2 = '056',
      notArray = null,
      notStr = 12,
      notRegexp = [1, 2],
      expected1 = 0,
      expected2 = 0,
      expected3 = 2,
      expected4 = -1;


    test.description = 'all regexps match in string';
    var got = _.regexpArrayIndex( ArrOfRegx1, str1 );
    test.identical( got, expected1 );

    test.description = 'first regexps matches in string';
    var got = _.regexpArrayIndex( ArrOfRegx1, str2 );
    test.identical( got, expected2 );

    test.description = 'third regexps matches in string';
    var got = _.regexpArrayIndex( ArrOfRegx2, str2 );
    test.identical( got, expected3 );

    test.description = 'no one of the regexps do not match in string';
    var got = _.regexpArrayIndex( ArrOfRegx3, str1 );
    test.identical( got, expected4 );

    if( Config.debug )
    {
      test.description = 'missing arguments';
      test.shouldThrowError( function()
      {
        _.regexpArrayIndex();
      });

      test.description = 'first parameter is not array';
      test.shouldThrowError( function()
      {
        _.regexpArrayIndex(notArray, str1);
      });

      test.description = 'second parameter is not string';
      test.shouldThrowError( function()
      {
        _.regexpArrayIndex(ArrOfRegx1, notStr);
      });

      test.description = 'element of array is not RegExp';
      test.shouldThrowError( function()
      {
        _.regexpArrayIndex(notRegexp, str1);
      });
    }

  };

  //

  var Proto =
  {

    name: 'regexp',

    tests:
    {

      regexpEscape        : regexpEscape,
      regexpForGlob       : regexpForGlob,
      regexpMakeArray     : regexpMakeArray,
      regexpMakeExpression: regexpMakeExpression,
      _regexpAny          : _regexpAny,
      _regexpAll          : _regexpAll,
      regexpArrayIndex    : regexpArrayIndex,

    }

  }

  _.mapExtend( Self, Proto );

  if( typeof module !== 'undefined' && !module.parent )
  _.Testing.test(Self);

} )( );
