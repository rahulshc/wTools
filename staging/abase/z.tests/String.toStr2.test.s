( function _String_toStr2_test_s_( ) {

'use strict';

/*

 to run this test
 from the project directory run

 npm install
 node ./staging/abase/z.tests/String.toStr2.test.s

 */

if( typeof module !== 'undefined' )
{

  require( '../wTools.s' );
  require( '../component/StringTools.s' );

  if( require( 'fs' ).existsSync( __dirname + '/../object/Testing.debug.s' ) )
    require( '../object/Testing.debug.s' );
  else
    require( 'wTesting' );

}

var _ = wTools;
var Self = {};

//

var toStr = function( test )
{
  var cases =
  [
    {
      desc :  'empty arguments',
      src : [ {}, '', [] ],
      options : [ {} ],
      expected :[ '{}', '""', '[]' ]
    },

    {
      desc :  'Symbol test',
      src :
      [
        Symbol(),
        Symbol('sm'),
        Symbol('sx'),
        Symbol('sy')


      ],
      options :
      [
        {},
        {},
        { levels : 0 },
        { noAtomic : 1 },

      ],
      expected :
      [
        'Symbol()',
        'Symbol(sm)',
        'Symbol(sx)',
        ''
      ]
    },

    {
      desc :  'Number test',
      src :
      [
        Number(),
        5,
        15000,
        1222.222,
        1234.4321,
        15,
        99,
        22


      ],
      options :
      [
        {},
        {},
        { precision : 3 },
        { fixed : 1 },
        { noNumber : 1 },
        { noAtomic : 1 },
        { levels : 0 },
        { noRoutine : 1 }
      ],
      expected :
      [
        '0',
        '5',
        '1.50e+4',
        '1222.2',
        '',
        '',
        '99',
        '22'

      ]
    },

    {
      desc :  'String test',
      src :
      [
        String(),
        'sample',
        'sample2',
        'sample3',
        '\nsample4\n',
        'sample5',
        'sample6',

      ],
      options :
      [
        { },
        { },
        { noAtomic : 1 },
        { noString : 1 },
        { unescape : 1 },
        { tab : '---' },
        { levels : 0 },
      ],
      expected :
      [
        '""',
        '"sample"',
        '',
        '',
        '"\\nsample4\\n"',
        '"sample5"',
        '"sample6"'
      ]
    },

    {
      desc : 'Array test',
      src :
      [
        [ 1, 2, 3 ],
        [ 1, 2, 3 ],
        [ 1000, 2000, 3000 ],
        [ 1.1111, 2.2222, 3.3333 ],
        [ 0, 1, 2 ],
        [ 'a','b','c', 1, 2, 3 ],
        [ { a : 1 }, { b : 2 } ],
        [ { x : 1 }, { y : 2 } ],
        [ 1, [ 2, 3, 4 ], 5 ],
        [ 0, 1, 2 ],
        [ 6, [ 7, 8, 9 ], 10 ],
        [ { k : 3 }, { l : 4 } ],
        [ 1, { a : 2 }, 5 ],
        [ 0, { b : 1 }, 3 ],
        [ 'a', 7, { u : 2 }, 8, 'b' ]


      ],
      options :
      [
        { },
        { wrap : 0, comma : '|' },
        { precision : 2, multiline : 1 },
        { fixed : 2 },
        { levels : 0 },
        { levels : 2, noString : 1 },
        { },
        { levels : 2, dtab : '-' },
        { levels : 2, multiline : 1 },
        { noArray : 1 },
        { levels : 2, noNumber : 1 },
        { levels : 2, colon : '->' },
        { levels : 2, noObject : 1 },
        { levels : 2, noNumber : 1 },
        { levels : 2, noAtomic : 1 }


      ],
      expected :
      [
        '[ 1, 2, 3 ]',
        '  1|2|3',

        [
          '[',
          '  1.0e+3, ',
          '  2.0e+3, ',
          '  3.0e+3',
          ']',
        ].join( '\n' ),

        '[ 1.11, 2.22, 3.33 ]',
        '[ Array with 3 elements ]',
        '[ 1, 2, 3 ]',

        [
          '[',
          '  [ Object with 1 elements ], ',
          '  [ Object with 1 elements ]',
          ']'
        ].join( '\n' ),

        [
          '[',
          '-{ x : 1 }, ',
          '-{ y : 2 }',
          ']'
        ].join( '\n' ),

        [
          '[',
          '  1, ',
          '  [',
          '    2, ',
          '    3, ',
          '    4',
          '  ], ',
          '  5',
          ']',

        ].join( '\n' ),

        '',

        [
          '[',
          '  [ 7, 8, 9 ]',
          ']'
        ].join( '\n' ),

        [
          '[',
          '  { k->3 }, ',
          '  { l->4 }',
          ']'
        ].join( '\n' ),

        [
          '[',
          '  1, ',
          '  5',
          ']',
        ].join( '\n' ),

        [
          '[',
          '  { b : 1 }',
          ']'
        ].join( '\n' ),

        [
          '[',
          '  { u : 2 }',
          ']'
        ].join( '\n' )




      ]
    },




  ];

  debugger;
  for( var i = 0; i < cases.length; ++i )
  {
    var _case = cases[ i ];
    var src = _case['src'];
    var exp = _case['expected'];
    var o = _case['options'];

    for( var k = 0; k < src.length; ++k  )
    {
      test.description = _case.desc;
      var got = _.toStr( src[ k ], o[ k ] || o[ 0 ] );
      var expected = exp[ k ];
      test.identical( got,expected )
    }


  }
  debugger;

}

// node ./staging/abase/z.tests/String.toStr2.test.s

//

var Proto =
{

  name : 'toStr',

  tests:
  {
      toStr : toStr


  }

};

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
  _.testing.test( Self );

} )( );
