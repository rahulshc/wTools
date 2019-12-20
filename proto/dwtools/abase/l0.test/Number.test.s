( function _Number_test_s() {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

//--
// l0/l8/gNumber.s
//--

function numbersFrom( test ) 
{
  test.case = 'null';
  var got = _.numbersFrom( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.numbersFrom( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.numbersFrom( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.numbersFrom( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.numbersFrom( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.numbersFrom( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.numbersFrom( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.numbersFrom( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.numbersFrom( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.numbersFrom( '12' );
  test.identical( got, 12 );

  test.case = 'Set';
  var got = _.numbersFrom( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.numbersFrom( new Map() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.numbersFrom( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.numbersFrom( src );
  test.identical( got, [] );
  test.is( got !== src );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 2, 3 ] );
  test.is( got !== src );

  test.case = 'array with strings without digits';
  var src = [ '', 'a', 'str' ];
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.is( got !== src );

  test.case = 'array with strings with digits';
  var src = [ '1', '1.2', '12.3' ];
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );
  test.is( got !== src );

  test.case = 'array with elements, which does not convert to number';
  var src = [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ];
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.is( got !== src );

  /* */

  test.case = 'empty argumentsArray';
  var src = _.argumentsArrayMake( [] );
  var got = _.numbersFrom( src );
  test.identical( got, [] );

  test.case = 'argumentsArray with numbers';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'argumentsArray with strings without digits';
  var src = _.argumentsArrayMake( [ '', 'a', 'str' ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'argumentsArray with strings with digits';
  var src = _.argumentsArrayMake( [ '1', '1.2', '12.3' ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );

  test.case = 'argumentsArray with elements, which does not convert to number';
  var src = _.argumentsArrayMake( [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.numbersFrom( src );
  test.identical( got, [] );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.numbersFrom( src );
  test.identical( got, [ 1, 2, 3 ] );
  
  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.numbersFrom( src );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map, values is numbers';
  var src = { a : 1, b : 2, c : 3 };
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.is( got !== src );

  test.case = 'map, values is not digit literals';
  var src = { a : '', b : 'a', c : 'str' };
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  test.case = 'map, values is digit literals';
  var src = { a : '1', b : '1.2', c : '12.3' };
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.is( got !== src );

  test.case = 'map, values does not convert to number';
  var src = { a : new Set(), b : [ 1, 2 ], c : { a : 2 } };
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  /* */

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.numbersFrom( src );
  test.identical( got, {} );
  test.is( got !== src );

  test.case = 'map, values is numbers';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  src.c = 3;
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.is( got !== src );

  test.case = 'map, values is not digit literals';
  var src = Object.create( null );
  src.a = '';
  src.b = 'a';
  src.c = 'str';
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  test.case = 'map, values is digit literals';
  var src = Object.create( null );
  src.a = '1';
  src.b = '1.2';
  src.c = '12.3';
  var got = _.numbersFrom( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.is( got !== src );

  test.case = 'map, values does not convert to number';
  var src = Object.create( null );
  src.a = new Set();
  src.b = [ 1, 2 ];
  src.c = { a : 2 };
  var got = _.numbersFrom( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.is( got !== src );

  /* - */

  test.open( 'instance of constructor' );

  var Constr = function()
  {
    this.x = arguments[ 0 ];
    this.y = arguments[ 1 ];
    return this;
  };

  test.case = 'empty instance';
  var src = new Constr();
  var got = _.numbersFrom( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.is( got !== src );

  test.case = 'numbers as properties';
  var src = new Constr( 1, 2 );
  var got = _.numbersFrom( src );
  test.identical( got, { x : 1, y : 2 } );
  test.is( got !== src );

  test.case = 'not digit literals as properties';
  var src = new Constr( '', 'a' );
  var got = _.numbersFrom( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.is( got !== src );

  test.case = 'digit literals as properties';
  var src = new Constr( '1', '1.2' );
  var got = _.numbersFrom( src );
  test.identical( got, { x : 1, y : 1.2 } );
  test.is( got !== src );

  test.case = 'value of properties is not convertable to number';
  var src = new Constr( [ 1, 2 ], { a : 2 } );
  var got = _.numbersFrom( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.is( got !== src );

  test.close( 'instance of constructor' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.numbersFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.numbersFrom( [ 1, 2 ], 'extra' ) );

  test.case = 'src has not converted type';
  test.shouldThrowErrorSync( () => _.numbersFrom( Symbol.for( 'a' ) ) );
  test.shouldThrowErrorSync( () => _.numbersFrom( [ 1, Symbol.for( 'a' ) ] ) );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.Number',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l8/gNumber.s

    numbersFrom,
     
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
