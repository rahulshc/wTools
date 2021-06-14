( function _l0_l3_Set_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  } );
  var exp = [ 11, 1, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  } );
  var exp = [ 12, 2, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  } );
  var exp = [ 13, 3, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      3,
      3,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  } );
  var exp = [ 3, 3, 2, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      3,
      3,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = new Set( [] );
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  } );
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  []
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = new Set( [ 1, 2, 3 ] );
  var exp = [ 1, 1, 0, true ];
  var got = _.set.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 1, 0, true ];
  var got = _.set.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = new Set( [] );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  } );
  var exp = [ 11, 1, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      1,
      1,
      0,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  } );
  var exp = [ 12, 2, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  } );
  var exp = [ 13, 3, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = new Set( [ 1, 2, 3 ] );
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  } );
  var exp = [ 1, 1, 0, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      1,
      1,
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = new Set( [] );
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  } );
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  []
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = new Set( [ 1, 2, 3 ] );
  var exp = [ 3, 3, 2, true ];
  var got = _.set.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 3, 2, true ];
  var got = _.set.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = new Set( [] );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.last( src );
  test.identical( got, exp );

  /* */

}

//

function lengthOf( test )
{
  test.case = 'empty array';
  var src = new Set( [] );
  var got = _.set.lengthOf( src );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'array of numbers';
  var src = new Set( [ 1, 2, 3 ] );
  var got = _.set.lengthOf( src );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'array with undefined and boolean';
  var src = new Set( [ 1, undefined, false ] );
  var got = _.set.lengthOf( src );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.set.lengthOf( new Set( [ 1, 3 ] ), [] ) );
  test.shouldThrowErrorSync( () => _.set.lengthOf( new Set( [ 1, 3 ] ), 2 ) );
  test.shouldThrowErrorSync( () => _.set.lengthOf( new Set( [ 1, 3 ] ), 'str' ) );

  test.case = 'wrong src';
  test.shouldThrowErrorSync( () => _.set.lengthOf( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.set.lengthOf( 2 ) );
  test.shouldThrowErrorSync( () => _.set.lengthOf( [] ) );
  test.shouldThrowErrorSync( () => _.set.lengthOf( new Set( {} ) ) );
}

//

function hasKey( test )
{
  test.case = 'empty array, no key';
  var src = new Set( [] );
  var got = _.set.hasKey( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty array, with key';
  var src = new Set( [] );
  var got = _.set.hasKey( src, 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number array, with key';
  var src = new Set( [ 1, 2, 3 ] );
  var got = _.set.hasKey( src, 1 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number array, with wrong key';
  var src = new Set( [ 1, 2, 3 ] );
  var got = _.set.hasKey( src, 4 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array of strings, with key';
  var src = new Set( [ 'a', 'b', 'c' ] );
  var got = _.set.hasKey( src, 'a' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'string, with key';
  var src = new Set( 'a' );
  var got = _.set.hasKey( src, 'b' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'wrong src';
  test.shouldThrowErrorSync( () => _.set.hasKey( 2, 2 ) );
  test.shouldThrowErrorSync( () => _.set.hasKey( new Set( {} ) ) );
}

//

function hasCardinal( test )
{
  test.case = 'empty array, no cardinal';
  var src = new Set( [] );
  var got = _.set.hasCardinal( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty array, with cardinal';
  var src = new Set( [] );
  var got = _.set.hasCardinal( src, 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'numbers array, cardinal < 0';
  var src = new Set( [] );
  var got = _.set.hasCardinal( src, -1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'numbers array, cardinal < array size';
  var src = new Set( [ 1, 2, 3 ] );
  var got = _.set.hasCardinal( src, 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'string array, cardinal > array size';
  var src = new Set( [ 'a', 'b', 'c', [] ] );
  var got = _.set.hasCardinal( src, 5 );
  var expected = false;
  test.identical( got, expected );
}

function keyWithCardinal( test )
{
  test.case = 'empty array';
  var src = new Set( [] );
  var got = _.set.keyWithCardinal( src, 1 );
  var expected = [ undefined, false ];
  test.identical( got, expected );

  test.case = 'cardinal < 0';
  var src = new Set( [ 1, 3, 4 ] );
  var got = _.set.keyWithCardinal( src, -1 );
  var expected = [ undefined, false ];
  test.identical( got, expected );

  test.case = 'array size = cardinal';
  var src = new Set( 'a' );
  var got = _.set.keyWithCardinal( src, 0 );
  var expected = [ 'a', true ];
  test.identical( got, expected );

  test.case = 'array size > cardinal';
  var src = new Set( [ [ 1, 3 ], [ 2, 4 ], [ 5, 7 ] ] );
  var got = _.set.keyWithCardinal( src, 2 );
  var expected = [ [ 5, 7 ], true ];
  test.identical( got, expected );

  test.case = 'array size < cardinal';
  var src = new Set( [ { id : 1, text : 'x' }, { id : 2, text : 'y' }, [ 23 ] ] );
  var got = _.set.keyWithCardinal( src, 3 );
  var expected = [ undefined, false ];
  test.identical( got, expected );

  test.case = 'number array, cardinal of string';
  var src = new Set( [ 1, 2 ] );
  var got = _.set.keyWithCardinal( src, 'a' );
  var expected = [ undefined, true ];
  test.identical( got, expected );

  test.case = 'duplicates, cardinal of array';
  var src = new Set( [ 22, 1, 22, 2, 22, 3 ] );
  var got = _.set.keyWithCardinal( src, [ 2 ] );
  var expected = [ 2, true ];
  test.identical( got, expected );

  test.case = 'empty array, no cardinal';
  var src = new Set( [] );
  var got = _.set.keyWithCardinal( src );
  var expected = [ undefined, true ];
  test.identical( got, expected );

  test.case = 'wrong src';
  test.shouldThrowErrorSync( () => _.set.hasKey( 2, 2 ) );
  test.shouldThrowErrorSync( () => _.set.hasKey( new Set( {} ) ) );
}

//

function cardinalWithKey( test )
{
  test.case = 'array of strings, with key';
  var src = new Set( [ 'a', 'b', 'c' ] );
  var got = _.set.cardinalWithKey( src, 'b' );
  var expected = 1;
  test.identical( got, expected );

  test.case = 'array of numbers, with wrong key';
  var src = new Set( [ 1, 2, 3 ] );
  var got = _.set.cardinalWithKey( src, 5 );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'string';
  var src = new Set( 'a' );
  var got = _.set.cardinalWithKey( src, 'a' );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'two dimensional array';
  var src = new Set( [ [ 2 ], [ 1, 2, 3 ] ] );
  var got = _.set.cardinalWithKey( src, 1 );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'wrong src';
  test.shouldThrowErrorSync( () => _.set.hasKey( 2, 2 ) );
  test.shouldThrowErrorSync( () => _.set.hasKey( new Set( {} ) ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Set.l0.l3',
  silencing : 1,

  tests :
  {

    aptLeft,
    aptRight,
    lengthOf,
    hasKey,
    hasCardinal,
    keyWithCardinal,
    cardinalWithKey,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )();
