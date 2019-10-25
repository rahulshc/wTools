( function _Range_test_s( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

//--
// range l0/l3/iRange.s
//--

function rangeIs( test )
{
  test.case = 'undefined';
  var got = _.rangeIs( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.rangeIs( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.rangeIs( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.rangeIs( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.rangeIs( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.rangeIs( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.rangeIs( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.rangeIs( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.rangeIs( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = function( x )
  {
    this.x = x;
    return this;
  }
  var got = _.rangeIs( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.rangeIs( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.rangeIs( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.rangeIs( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got = _.rangeIs( BufferNode.alloc( 5 ) );
    var expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.rangeIs( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.rangeIs( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.rangeIs( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.rangeIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.rangeIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.rangeIs( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.rangeIs( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.rangeIs( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.rangeIs( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, numbers';
  var got = _.rangeIs( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.rangeIs( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.rangeIs( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.rangeIs( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.rangeIs( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, numbers';
  var got = _.rangeIs( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.rangeIs( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.rangeIs( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.rangeIs( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, numbers';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.rangeIs( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.rangeIs( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.rangeIs( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2';
  var got = _.rangeIs( new F32x( 2 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.rangeIs( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.rangeIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.rangeIs( [ 1, 2 ], 'extra' ) );
}

// --
//
// --

var Self =
{

  name : 'Tools.base.Range',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // range l0/l3/iRange.s

    rangeIs,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
