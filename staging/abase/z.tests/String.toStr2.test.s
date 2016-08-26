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
        '\nsample7'

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
        { },
      ],
      expected :
      [
        '""',
        '"sample"',
        '',
        '',
        '"\\nsample4\\n"',
        '"sample5"',
        '"sample6"',
        '"\nsample7"'
      ]
    },

    {
      desc :  'boolean, null, undefined test',
      src :
      [
        Boolean(),
        true,
        false,
        1!=2,

        null,
        null,

        undefined,
        undefined
      ],
      options :
      [
        { },
        { },
        { levels : 0 },
        { onlyRoutines : 1 },

        { },
        { levels : 3 },

        { },
        { noAtomic : 1 }

      ],
      expected :
      [
        'false',
        'true',
        'false',
        '',

        'null',
        'null',

        'undefined',
        ''
      ]
    },

    {
      desc :  'Date test',
      src :
      [
        new Date(Date.UTC(1993, 12, 12)),
        new Date(1990, 0, 0),
        new Date(2016, 12, 8),
        new Date(2016, 1, 2),

      ],
      options :
      [
        { },
        { },
        { levels : 0 },
        { noDate : 1 }
      ],
      expected :
      [
        '1994-01-12T00:00:00.000Z',
        '1989-12-30T22:00:00.000Z',
        'Sun Jan 08 2017 00:00:00 GMT+0200 (FLE Standard Time)',
        '',
      ]
    },

    {
      desc :  'Error test',
      src :
      [
        new Error(),
        new Error('msg'),
        new Error('msg2'),
        new Error('message'),
      ],
      options :
      [
        { },
        { },
        { levels : 0 },
        { noError : 1 }

      ],
      expected :
      [
        'Error',
        'Error: msg',
        '[object Error]',
        ''
      ]
    },

    {
      desc : 'Array test',
      src :
      [
      /*01*/ [ 1, 2, 3 ],
      /*02*/ [ 1, 2, 3 ],
      /*03*/ [ 1000, 2000, 3000 ],
      /*04*/ [ 1.1111, 2.2222, 3.3333 ],
      /*05*/ [ 0, 1, 2 ],
      /*06*/ [ 'a','b','c', 1, 2, 3 ],
      /*07*/ [ { a : 1 }, { b : 2 } ],
      /*08*/ [ { x : 1 }, { y : 2 } ],
      /*09*/ [ 1, [ 2, 3, 4 ], 5 ],
      /*10*/ [ 0, 1, 2 ],
      /*11*/ [ 6, [ 7, 8, 9 ], 10 ],
      /*12*/ [ { k : 3 }, { l : 4 } ],
      /*13*/ [ 1, { a : 2 }, 5 ],
      /*14*/ [ 0, { b : 1 }, 3 ],
      /*15*/ [ 'a', 7, { u : 2 }, 8, 'b' ],
      /*16*/ [  7, { v : 0 }, 1, 'x' ],
      /*17*/ [ function( ){ }, function add( ){ } ],
      /*18*/ [ function f1( ){ }, function ( ){ } ],
      /*19*/ [ function f2( ){ }, function f3( ){ } ],
      /*20*/ [ 'e', 'e', 'e' ],
      /*21*/ [ { a : { a : '1' } } ],
      /*22*/ [ '\n\nUnescape test' ],
      /*23*/ [ { c : 1 }, { d : 2 } ],
        /*multilevel tests*/
      /*24*/ [ { one : { two : { three : { four : {five:'x'}  }  }  }  }],
      /*25*/ [ { a : [ { b : [ { c : [ { d : [ 1,'2','3',4 ] } ] } ] } ] } ],


      ],
      options :
      [
      /*01*/ { },
      /*02*/ { wrap : 0, comma : '|' },
      /*03*/ { precision : 2, multiline : 1 },
      /*04*/ { fixed : 2 },
      /*05*/ { levels : 0 },
      /*06*/ { levels : 2, noString : 1 },
      /*07*/ { },
      /*08*/ { levels : 2, dtab : '-' },
      /*09*/ { levels : 2, multiline : 1 },
      /*10*/ { noArray : 1 },
      /*11*/ { levels : 2, noNumber : 1 },
      /*12*/ { levels : 2, colon : '->' },
      /*13*/ { levels : 2, noObject : 1 },
      /*14*/ { levels : 2, noNumber : 1 },
      /*15*/ { levels : 2, noAtomic : 1 },
      /*16*/ { noAtomic : 1 },
      /*17*/ { },
      /*18*/ { levels : 2 },
      /*19*/ { levels : 2, noRoutine : 1},
      /*20*/ { noArray : 1 },
      /*21*/ { levels: 3, noSubObject : 1 },
      /*22*/ { unescape : 1, levels : 2 },
      /*23*/ { levels : 2, tab : '|', prependTab : 0 },
        /*multilevel tests*/
      /*24*/ { levels : 6 },
      /*25*/ { levels : 10, noString : 1 },


      ],
      expected :
      [
      /*01*/ '[ 1, 2, 3 ]',
      /*02*/ '  1|2|3',

      /*03*/
        [
          '[',
          '  1.0e+3, ',
          '  2.0e+3, ',
          '  3.0e+3',
          ']',
        ].join( '\n' ),

      /*04*/ '[ 1.11, 2.22, 3.33 ]',
      /*05*/ '[ Array with 3 elements ]',
      /*06*/ '[ 1, 2, 3 ]',

      /*07*/
        [
          '[',
          '  [ Object with 1 elements ], ',
          '  [ Object with 1 elements ]',
          ']'
        ].join( '\n' ),

      /*08*/
        [
          '[',
          '-{ x : 1 }, ',
          '-{ y : 2 }',
          ']'
        ].join( '\n' ),

      /*09*/
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

      /*10*/ '',

      /*11*/
        [
          '[',
          '  [ 7, 8, 9 ]',
          ']'
        ].join( '\n' ),

      /*12*/
        [
          '[',
          '  { k->3 }, ',
          '  { l->4 }',
          ']'
        ].join( '\n' ),

      /*13*/
        [
          '[',
          '  1, ',
          '  5',
          ']',
        ].join( '\n' ),

      /*14*/
        [
          '[',
          '  { b : 1 }',
          ']'
        ].join( '\n' ),

      /*15*/
        [
          '[',
          '  { u : 2 }',
          ']'
        ].join( '\n' ),

      /*16*/
        [
          '[',
          '  7, ',
          '  [ Object with 1 elements ], ',
          '  1, ',
          '  "x"',
          ']'
        ].join( '\n' ),

      /*17*/ '[ [object Function], [object Function] ]',
      /*18*/ '[ [ routine f1 ], [ routine without name ] ]',
      /*19*/ '[  ]',
      /*20*/ '',

      /*21*/
        [
          '[',
          '  {',
          '    ',
          '  }',
          ']'
        ].join( '\n' ),

      /*22*/ '[ "\\n\\nUnescape test" ]',

      /*23*/
        [
          '[',
          '|  { c : 1 }, ',
          '|  { d : 2 }',
          '|]',
        ].join( '\n' ),

      /*24*/
        [
          '[',
          '  {',
          '    one : ',
          '    {',
          '      two : ',
          '      {',
          '        three : ',
          '        {',
          '          four : { five : "x" }',
          '        }',
          '      }',
          '    }',
          '  }',
          ']'
        ].join( '\n' ),

      /*25*/
        [
          '[',
          '  {',
          '    a : ',
          '    [',
          '      {',
          '        b : ',
          '        [',
          '          {',
          '            c : ',
          '            [',
          '              {',
          '                d : [ 1, 4 ]',
          '              }',
          '            ]',
          '          }',
          '        ]',
          '      }',
          '    ]',
          '  }',
          ']',
        ].join( '\n' ),




      ]
    },

      {
        desc :  'Object test',
        src :
        [
        /*01*/  { a : 1, b : 2, c : 3 },
        /*02*/  { x : 3, y : 5, z : 5 },
        /*03*/  { q : 6, w : 7, e : 8 },
        /*04*/  { u : 12, i : { o : 13 }, p : 14 },
        /*05*/  { r : 9, t : { a : 10 }, y : 11 },
          /* redundant */
        /*06*/  { z : '01', x : { c : { g : 4 } }, v : '03' },
        /*07*/  { u : 12, i : { o : { x : { y : [ 1, 2, 3 ] } } }, p : 14 },
          /* redundant */
        /*08*/  { q : { a : 1 }, w : 'c', e : [1] },
        /*09*/  { z : '02', x : { c : { g : 6 } }, v : '01' },
        /*10*/  { h : { d : 1 }, g : 'c', c : [2] },
        /*11*/  { a : 6, b : 7, c : 1 },
        /*12*/  { a : true, b : '2', c : 3, d : undefined },






        ],
        options :
        [
        /*01*/  { },
        /*02*/  { levels : 0 },
        /*03*/  { levels : 1 },
        /*04*/  { levels : 1 },
        /*05*/  { levels : 2 },

          /* redundant */
        /*06*/  { levels : 3 },
        /*07*/  { levels : 5 },
          /* redundant */

        /*08*/  { levels : 2, noSubObject : 1, noArray : 1 },
        /*09*/  { levels : 3, noAtomic : 1 },
        /*10*/  { levels : 2, noObject : 1 },


        /*11*/  { wrap : 0, comma : ' | ' },
        /*12*/  { wrap : 0, noString : 1, noNumber: 1 },


        ],
        expected :
        [
        /*01*/  '{ a : 1, b : 2, c : 3 }',
        /*02*/  '[ Object with 3 elements ]',
        /*03*/  '{ q : 6, w : 7, e : 8 }',

        /*04*/
          [
            '{',
            '  u : 12, ',
            '  i : [ Object with 1 elements ], ',
            '  p : 14',
            '}'
          ].join( '\n' ),

        /*05*/
          [
            '{',
            '  r : 9, ',
            '  t : { a : 10 }, ',
            '  y : 11',
            '}'
          ].join( '\n' ),

          /* redundant */
        /*06*/
          [
            '{',
            '  z : "01", ',
            '  x : ',
            '  {',
            '    c : { g : 4 }',
            '  }, ',
            '  v : "03"',
            '}'
          ].join( '\n' ),

        /*07*/
          [
            '{',
            '  u : 12, ',
            '  i : ',
            '  {',
            '    o : ',
            '    {',
            '      x : ',
            '      {',
            '        y : [ 1, 2, 3 ]',
            '      }',
            '    }',
            '  }, ',
            '  p : 14',
            '}'
          ].join( '\n' ),
        /* redundant */

        /*08*/
          [
            '{',
            '  w : "c"',
            '}'
          ].join( '\n' ),

        /*09*/
          [
            '{',
            '  x : ',
            '  {',
            '    c : { g : 6 }',
            '  }',
            '}'
          ].join( '\n' ),

        /*10*/  '',
        /*11*/  '  a : 6 | b : 7 | c : 1',

        /*12*/
          [
            '  a : true ',
            '  b : "2" ',
            '  c : 3 ',
            '  d : undefined'

          ].join( '\n' ),


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
