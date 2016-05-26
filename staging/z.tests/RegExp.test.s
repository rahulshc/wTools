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

// shared variables
  var ArrOfRegx1 = [ /0/, /1/, /2/ ],
    ArrOfRegx2 = [ /3/, /4/, /5/ ],
    ArrOfRegx3 = [ /6/, /7/, /8/ ],
    ArrOfRegx4 = [ /9/, /10/, /11/ ],
    ArrOfRegx5 = [ /12/, /13/, /14/ ],
    ArrOfRegx6 = [ /14/, /16/, /17/ ],
    ArrOfRegx7 = [ /18/, /19/, /20/ ],
    ArrOfRegx8 = [ /21/, /22/, /23/ ],

    src1 =
    {
      includeAny: ArrOfRegx1,
      includeAll: ArrOfRegx2,
      excludeAny: ArrOfRegx3,
      excludeAll: ArrOfRegx4
    },
    src2 =
    {
      includeAny: ArrOfRegx5,
      includeAll: ArrOfRegx6,
      excludeAny: ArrOfRegx7,
      excludeAll: ArrOfRegx8
    },
    src3 =
    {
      includeAny: [ /a0/, /a1/, /a2/ ],
      includeAll: [ /b0/, /c1/, /c2/ ],
      excludeAny: [ /c0/, /c1/, /c2/ ],
      excludeAll: [ /d0/, /d1/, /d2/ ]
    },
    wrongSrc =
    {
      includeAny: ArrOfRegx5,
      includeAll: ArrOfRegx6,
      excludeAny: ArrOfRegx7,
      excludeAll: ArrOfRegx8,
      excludeSome: [ /[^a]/ ]
    };

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
        _.regexpForGlob({});
      });
    }
  };

//
  var _regexpObjectExtend = function( test ) 
  {
    var src1 =
      [
        {
          includeAny: ArrOfRegx1,
          includeAll: ArrOfRegx2,
          excludeAny: ArrOfRegx3,
          excludeAll: ArrOfRegx4
        }
      ],
      src2 = 
      [
        {
          includeAny: ArrOfRegx1,
          includeAll: ArrOfRegx2,
          excludeAny: ArrOfRegx3,
          excludeAll: ArrOfRegx4
        },
        {
          includeAny: ArrOfRegx5,
          includeAll: ArrOfRegx6,
          excludeAny: ArrOfRegx7,
          excludeAll: ArrOfRegx8
        }
      ],

      wrongSrc1 = 
      {
        includeAny: ArrOfRegx5,
        includeAll: ArrOfRegx6,
        excludeAny: ArrOfRegx7,
        excludeAll: ArrOfRegx8
      },
      wrongSrc2 = [ 'includeAny' ],
      wrongSrc3 = 
      [
        {
          includeAny: ArrOfRegx5,
          includeAll: ArrOfRegx6,
          excludeAny: ArrOfRegx7,
          excludeAll: ArrOfRegx8,
          excludeSome: [ /[^a]/ ]
        }
      ],

      dst1 = {},
      dst2 = 
      {
        includeAny: [ /a0/, /a1/, /a2/ ],
        includeAll: [ /b0/, /c1/, /c2/ ],
        excludeAny: [ /c0/, /c1/, /c2/ ],
        excludeAll: [ /d0/, /d1/, /d2/ ]
      },
      dst3 = 
      {
        includeAny: [ /a0/, /a1/, /a2/ ],
        includeAll: [ /b0/, /c1/, /c2/ ],
        excludeAny: [ /c0/, /c1/, /c2/ ],
        excludeAll: [ /d0/, /d1/, /d2/ ]
      },

      expected1 = src1.slice().pop(),
      expected2 = 
      {
        includeAny: src2[ 1 ].includeAny,
        includeAll: dst2.includeAll.concat( src2[ 0 ].includeAll, src2[ 1 ].includeAll ),
        excludeAny: dst2.excludeAny.concat( src2[ 0 ].excludeAny, src2[ 1 ].excludeAny ),
        excludeAll: src2[ 1 ].excludeAll
      },
      expected3 = 
      {
        includeAny: dst3.includeAny.concat( src2[ 0 ].includeAny, src2[ 1 ].includeAny ),
        includeAll: dst3.includeAll.concat( src2[ 0 ].includeAll, src2[ 1 ].includeAll ),
        excludeAny: dst3.excludeAny.concat( src2[ 0 ].excludeAny, src2[ 1 ].excludeAny ),
        excludeAll: dst3.excludeAll.concat( src2[ 0 ].excludeAll, src2[ 1 ].excludeAll )
      },

      extendOpt1 = 
      {
        dst: dst1,
        srcs: src1,
        shrinking: true
      },
      extendOpt2 = 
      {
        dst: dst2,
        srcs: src2,
        shrinking: true
      },
      extendOpt3 = 
      {
        dst: dst3,
        srcs: src2,
        shrinking: false
      },

      wrongOpt1 = 
      {
        dst: dst1,
        srcs: src1,
      },
      wrongOpt2 = 
      {
        dst: null,
        srcs: src1,
        shrinking: false
      },
      wrongOpt3 = 
      {
        dst: dst3,
        srcs: wrongSrc1,
        shrinking: false
      },
      wrongOpt4 = 
      {
        dst: {},
        srcs: wrongSrc2,
        shrinking: false
      },
      wrongOpt5 = 
      {
        dst: {},
        srcs: wrongSrc3,
        shrinking: false
      };

    test.description = 'simple rejexps objects extend with shrinking';
    var got = _._regexpObjectExtend( extendOpt1 );
    test.identical( got, expected1 );

    test.description = 'rejexps objects extend with shrinking';
    var got = _._regexpObjectExtend( extendOpt2 );
    test.identical( got, expected2 );

    test.description = 'rejexps objects extend without shrinking';
    var got = _._regexpObjectExtend( extendOpt3 );
    test.identical( got, expected3 );

    /**/

    if( Config.debug )
    {

      test.description = 'missing parameters in options argument';
      test.shouldThrowError( function ()
      {
        _._regexpObjectExtend( wrongOpt1 );
      });

      test.description = 'options.dist is not object';
      test.shouldThrowError( function ()
      {
        _._regexpObjectExtend( wrongOpt2 );
      });

      test.description = 'options.srcs not wrapped into array';
      test.shouldThrowError( function ()
      {
        _._regexpObjectExtend( wrongOpt3 );
      });

      test.description = 'element of options.srcs is not object';
      test.shouldThrowError( function ()
      {
        _._regexpObjectExtend( wrongOpt4 );
      });

      test.description = 'element of options.srcs has wrong format: (extra property)';
      test.shouldThrowError( function ()
      {
        _._regexpObjectExtend( wrongOpt5 );
      });
    }

  }

//

  var regexpObjectBroaden = function( test )
  {
    var dst1 = {},
      dst2 =
      {
        includeAny: [ /a0/, /a1/, /a2/ ],
        includeAll: [ /b0/, /c1/, /c2/ ],
        excludeAny: [ /c0/, /c1/, /c2/ ],
        excludeAll: [ /d0/, /d1/, /d2/ ]
      },


      expected0 =
      {
        includeAny: [],
        includeAll: [],
        excludeAny: [],
        excludeAll: []
      },
      expected1 = src1,
      expected2 =
      {
        includeAny: dst2.includeAny.concat( src1.includeAny, src2.includeAny, src3.includeAny ),
        includeAll: dst2.includeAll.concat( src1.includeAll, src2.includeAll, src3.includeAll ),
        excludeAny: dst2.excludeAny.concat( src1.excludeAny, src2.excludeAny, src3.excludeAny ),
        excludeAll: dst2.excludeAll.concat( src1.excludeAll, src2.excludeAll, src3.excludeAll )
      };

    test.description = 'empty RegexpObject object broaden nothing (missed source for RegexpObject extend)';
    var got = _.regexpObjectBroaden( {} );
    test.identical( got, expected0 );

    test.description = 'empty RegexpObject object broaden by single object';
    var got = _.regexpObjectBroaden( dst1, src1  );
    test.identical( got, expected1 );

    test.description = 'RegexpObjec with existing data broaden by other RegexpObject objects';
    var got = _.regexpObjectBroaden( dst2, src1, src2, src3  );
    test.identical( got, expected2 );

    if( Config.debug )
    {
      test.description = 'result (first passed) parameter in not object';
      test.shouldThrowError( function ()
      {
        _.regexpObjectBroaden( 'hello', src1 );
      });

      test.description = 'source for RegexpObject extend has extra parameter';
      test.shouldThrowError( function ()
      {
        _.regexpObjectBroaden( {}, wrongSrc );
      });
    }
  };
  
  //

  var regexpObjectShrink = function( test )
  {
    var dst1 = {},
      dst2 =
      {
        includeAny: [ /a0/, /a1/, /a2/ ],
        includeAll: [ /b0/, /c1/, /c2/ ],
        excludeAny: [ /c0/, /c1/, /c2/ ],
        excludeAll: [ /d0/, /d1/, /d2/ ]
      },


      expected0 =
      {
        includeAny: [],
        includeAll: [],
        excludeAny: [],
        excludeAll: []
      },
      expected1 = src1,
      expected2 =
      {
        includeAny: src3.includeAny,
        includeAll: dst2.includeAll.concat( src1.includeAll, src2.includeAll, src3.includeAll ),
        excludeAny: dst2.excludeAny.concat( src1.excludeAny, src2.excludeAny, src3.excludeAny ),
        excludeAll: src3.excludeAll
      };

    test.description = 'empty RegexpObject object broaden nothing (missed source for RegexpObject extend)';
    var got = _.regexpObjectShrink( {} );
    test.identical( got, expected0 );

    test.description = 'empty RegexpObject object broaden by single object';
    var got = _.regexpObjectShrink( dst1, src1  );
    test.identical( got, expected1 );

    test.description = 'RegexpObjec with existing data broaden by other RegexpObject objects';
    var got = _.regexpObjectShrink( dst2, src1, src2, src3  );
    test.identical( got, expected2 );

    if( Config.debug )
    {
      test.description = 'result (first passed) parameter in not object';
      test.shouldThrowError( function ()
      {
        _.regexpObjectShrink( 'hello', src1 );
      });

      test.description = 'source for RegexpObject extend has extra parameter';
      test.shouldThrowError( function ()
      {
        _.regexpObjectShrink( {}, wrongSrc );
      });
    }
  };

  //

  var Proto =
  {

    name: 'regexp',

    tests: {

      regexpEscape       : regexpEscape,
      regexpForGlob      : regexpForGlob,
      _regexpObjectExtend: _regexpObjectExtend,
      regexpObjectBroaden: regexpObjectBroaden,
      regexpObjectShrink : regexpObjectShrink

    }

  }

  _.mapExtend( Self, Proto );

  if( typeof module !== 'undefined' && !module.parent )
  _.testing.test(Self);

} )( );
