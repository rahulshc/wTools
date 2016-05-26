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

  var _regexpObjectExtend = function( test ) 
  {
    var ArrOfRegx1 = [ /0/, /1/, /2/ ],
      ArrOfRegx2 = [ /3/, /4/, /5/ ],
      ArrOfRegx3 = [ /6/, /7/, /8/ ],
      ArrOfRegx4 = [ /9/, /10/, /11/ ],
      ArrOfRegx5 = [ /12/, /13/, /14/ ],
      ArrOfRegx6 = [ /14/, /16/, /17/ ],
      ArrOfRegx7 = [ /18/, /19/, /20/ ],
      ArrOfRegx8 = [ /21/, /22/, /23/ ],

      src1 = 
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
      },

      dst1 = {},
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

  var Proto =
  {

    name: 'regexp',

    tests: {

      _regexpObjectExtend: _regexpObjectExtend,
      regexpObjectBroaden: regexpObjectBroaden

    }

  }

  _.mapExtend( Self, Proto );

  if( typeof module !== 'undefined' && !module.parent )
  _.testing.test(Self);

} )( );
