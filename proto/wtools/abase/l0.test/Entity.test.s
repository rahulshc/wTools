( function _Entity_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );

}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --

function entityIdenticalShallowBasic( test )
{
  /* */

  test.case = 'null - undefined';

  var expected = true;
  var got = _.entity.identicalShallow( null, null );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( undefined, undefined );
  test.identical( got, expected );

  var expected = false
  var got = _.entity.identicalShallow( null, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( undefined, null );
  test.identical( got, expected );

  /* */

  test.case = 'number - number';

  var expected = true;
  var got = _.entity.identicalShallow( 1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 1, 1 + 1e-15 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( 0, 0 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( NaN, NaN );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( Infinity, Infinity );
  test.identical( got, expected );

  /* */

  test.case = 'number - not number';

  var expected = false;
  var got = _.entity.identicalShallow( 1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 0, '0' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 0, '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 0, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 0, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( NaN, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( Infinity, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, [ 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, { a : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 3, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'String - String';

  var expected = true;
  var got = _.entity.identicalShallow( '', '' );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( 'abc', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'ab', 'c' );
  test.identical( got, expected );

  /* */

  test.case = 'String - not String';

  var expected = false;
  var got = _.entity.identicalShallow( '', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', [ '' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '', function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '0', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( '1', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', [ 'abc' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', { abc : 'abc' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( 'abc', function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - RegExp';

  var expected = true;
  var got = _.entity.identicalShallow( /(?:)/, /(?:)/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( /abc/iy, /abc/yi );
  test.identical( got, expected );

  // var expected = true;
  // var got = _.entity.identicalShallow( new RegExp( 'abc' ), /abc/ );
  // test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( /abc/i, /abc/i );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, [ /(?:)/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, { a : /(?:)/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /(?:)/, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, [ /abc/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, { a : /abc/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( /abc/, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - Routine';

  function func1(){};
  function func2(){};

  var expected = true;
  var got = _.entity.identicalShallow( func1, func1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, func2 );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - not Routine';

  var expected = false;
  var got = _.entity.identicalShallow( func1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, [ func1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, { a : func1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( func1, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Date - Date';

  var expected = true;
  var got = _.entity.identicalShallow( new Date(), new Date() );
  test.identical( got, expected );

  var expected = false;
  var src1 = new Date();
  var src2 = new Date();
  src2.setFullYear( 1987 );
  var got = _.entity.identicalShallow( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'Date - not Date';

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), [ new Date() ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), { a : new Date() } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( new Date(), function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Array - Array';

  var expected = true;
  var got = _.entity.identicalShallow( [], [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( [ 0 ], [ 0 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( [ 1 ], [ 1 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( [ undefined ], [ undefined ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( [ null ], [ null ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ [ 1, 2, 3 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ [ 1, 2, 3 ] ], [ [ 1, 2 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ [ 1, 2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ [ 1, 3 ] ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ null ], [ undefined ] );
  test.identical( got, expected );

  /* */

  test.case = 'Array - not Array';

  var expected = false;
  var got = _.entity.identicalShallow( [], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [], function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entity.identicalShallow( [ '1' ], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ undefined ], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ null ], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ NaN ], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ 0 ], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ 1 ], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ new F32x( 3 ) ], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ /(?:)/ ], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( [ function(){} ], function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Map - Map';

  var expected = true;
  var got = _.entity.identicalShallow( {}, {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( { a : 0 }, { a : 0 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( { a : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : 1, b : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : 1 }, { a : 1, b : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : undefined, b : 1 }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : undefined }, { a : undefined, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( { a : undefined }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.identicalShallow( { a : null }, { a : null } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : { b : 1 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : { b : 1 } }, { a : { b : 1, c : 2 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : { b : 1, c : 2 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : { b : 1, c : 3 } }, { b : 1, c : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : null }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : undefined }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, { a : undefined } );
  test.identical( got, expected );

  /* */

  test.case = 'Map - not Map';

  var expected = false;
  var got = _.entity.identicalShallow( {}, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, [ 0 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( {}, function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entity.identicalShallow( { a : '1' }, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : undefined }, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : null }, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : NaN }, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : 0 }, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : 1 }, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : {} }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : new Date() }, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : new F32x( 3 ) }, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : /(?:)/ }, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.identicalShallow( { a : function(){} }, function(){} );
  test.identical( got, expected );

}

//

function entityIdenticalShallowAllTypes( test )
{
  test.open( 'identical' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 1;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = true;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 0;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = _.maybe;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'bigint';
  var src1 = 10n;
  var src2 = 10n;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str';
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src1 = /hello/g;
  var src2 = /hello/g;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make();
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'unroll';
  var src1 = _.unrollMake([ 2, 3, 4 ]);
  var src2 = _.unrollMake([ 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'array';
  var src1 = [ 2, 3, 4 ];
  var src2 = [ 2, 3, 4 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'long & longLike';
  var src1 = _.longMake([ 1, 2 ]);
  var src2 = _.longMake([ 1, 2 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'vector & vectorLike with primitives';
  var src1 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1, length : 2 });
  var src2 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1, length : 2 });
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'countable & countableLike with primitives';
  var src1 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1 });
  var src2 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1 });
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = `object countable, non-vector with primitives`;
  var src1 = countableMake( null, { element1 : 1, element2 : 2, withIterator : 1 } );
  var src2 = countableMake( null, { element1 : 1, element2 : 2, withIterator : 1 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Global & GlobalReal';
  var src1 = global;
  var src2 = global;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Global & GlobalDerived';
  var src1 = Object.create( global );
  var src2 = Object.create( global );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { a : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  var src2 = Object.create( null );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = 1;
  src1.b = 2;
  var src2 = Object.create( null );
  src2.a = 1;
  src2.b = 2;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = {};
  var src2 = {};
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : 1, b : 2, c : 3 };
  var src2 = { a : 1, b : 2, c : 3 };
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap();
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set();
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'BufferNode';
  var src1 = new BufferNode( 'str' );
  var src2 = new BufferNode( 'str' );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 5 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 10 );
  var src2 = new BufferRawShared( 10 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 20 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 20 ) );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 20 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 1 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new F32x( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/';
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'propertyTransformer & filter';
  var src1 = _.property.filter[ 'dstAndSrcOwn' ];
  var src2 = _.property.filter[ 'dstAndSrcOwn' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.property.mapper[ 'assigning' ];
  var src2 = _.property.mapper[ 'assigning' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = routine;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2021-02-19T11:26:42.840Z' );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'null';
  var src1 = null;
  var src2 = null;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'undefined';
  var src1 = undefined;
  var src2 = undefined;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Symbol null';
  var src1 = _.null;
  var src2 = _.null;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Symbol undefined';
  var src1 = _.undefined;
  var src2 = _.undefined;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'Symbol Nothing';
  var src1 = _.nothing;
  var src2 = _.nothing;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 5;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = src1;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'console';
  var src1 = console;
  var src2 = console;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.case = 'process';
  var src1 = process;
  var src2 = process;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 2;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = false;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 1;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = 0;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  /* ? */
  test.case = 'bigint';
  var src1 = 10n;
  var src2 = 10;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str2';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src1 = /hello/g;
  var src2 = /hello/i;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make([ 1 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'unroll';
  var src1 = _.unrollMake([ 2, 3, 4, 5 ]);
  var src2 = _.unrollMake([ 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'array';
  var src1 = [ [ 2 ], 3, 4 ];
  var src2 = [ [ 2 ], 3, 4 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'long & longLike';
  var src1 = _.longMake([ 1, 2, [ 5 ] ]);
  var src2 = _.longMake([ 1, 2, [ 5 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'vector & vectorLike same elements';
  var src1 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'countable & countableLike same elements';
  var src1 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'vector & vectorLike not same elements';
  var src1 = new countableConstructor({ elements : [ '1', '2' ], withIterator : 1, length : 2 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'countable & countableLike not same elements';
  var src1 = new countableConstructor({ elements : [ '1', '2' ], withIterator : 1 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src1 = { [ Symbol.iterator ] : 1 };
  var src2 = { [ Symbol.iterator ] : 1 };
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { b : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  src1.a = [ 1 ];
  var src2 = Object.create( null );
  src2.a = [ 1 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = [ 1, 2, 3 ];
  src1.b = [ 1, 2, 3 ];
  var src2 = Object.create( null );
  src2.a = [ 1, 2, 3 ];
  src2.b = [ 1, 2, 3 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = { a : 1 };
  var src2 = {};
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : { f : 'hello' }, b : 2, c : 3 };
  var src2 = { a : { f : 'hello' }, b : 2, c : 3 };
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap([ [ 'a', 1 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set([ 0 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'BufferNode';
  var src1 = new BufferNode( 'str' );
  var src2 = new BufferNode( 'str2' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 6 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 5 );
  var src2 = new BufferRawShared( 6 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 21 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 21 ) );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 21 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'err same message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'err diff message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error2' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new U8x( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 3 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( Infinity );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/c/';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'propertyTransformer & filter';
  var src1 = _.property.filter[ 'dstAndSrcOwn' ];
  var src2 = _.property.filter[ 'dstNotHasOrSrcNotNull' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.property.mapper[ 'assigning' ];
  var src2 = _.property.mapper[ 'removing' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = () => { 'hello' };
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( 100 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2020-02-19T11:26:42.840Z' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 6;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'Symbol';
  var src1 = Symbol( 'a' );
  var src2 = Symbol( 'a' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src2 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = require( 'stream' ).Readable();
  test.identical( _.entity.identicalShallow( src1, src2 ), false );

  test.close( 'not identical' );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  function routine () {}

}

//


function entityEquivalentShallowBasic( test )
{
  /* */

  test.case = 'null - undefined';

  var expected = true;
  var got = _.entity.equivalentShallow( null, null );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( undefined, undefined );
  test.identical( got, expected );

  var expected = false
  var got = _.entity.equivalentShallow( null, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( undefined, null );
  test.identical( got, expected );

  /* */

  test.case = 'number - number';

  var expected = true;
  var got = _.entity.equivalentShallow( 1, 1 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( 1, 1 + 1e-15 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( 0, 0 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( NaN, NaN );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( Infinity, Infinity );
  test.identical( got, expected );

  /* */

  test.case = 'number - not number';

  var expected = false;
  var got = _.entity.equivalentShallow( 1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 0, '0' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 0, '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 0, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 0, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( NaN, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( Infinity, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, [ 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, { a : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 3, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'String - String';

  var expected = true;
  var got = _.entity.equivalentShallow( '', '' );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( 'abc', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'ab', 'c' );
  test.identical( got, expected );

  /* */

  test.case = 'String - not String';

  var expected = false;
  var got = _.entity.equivalentShallow( '', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', [ '' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '', function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '0', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( '1', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', [ 'abc' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', { abc : 'abc' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( 'abc', function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - RegExp';

  var expected = true;
  var got = _.entity.equivalentShallow( /(?:)/, /(?:)/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( /abc/iy, /abc/yi );
  test.identical( got, expected );

  // var expected = true;
  // var got = _.entity.equivalentShallow( new RegExp( 'abc' ), /abc/ );
  // test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( /abc/i, /abc/i );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, [ /(?:)/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, { a : /(?:)/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /(?:)/, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, [ /abc/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, { a : /abc/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( /abc/, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - Routine';

  function func1(){};
  function func2(){};

  var expected = true;
  var got = _.entity.equivalentShallow( func1, func1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, func2 );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - not Routine';

  var expected = false;
  var got = _.entity.equivalentShallow( func1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, [ func1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, { a : func1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( func1, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Date - Date';

  var expected = true;
  var got = _.entity.equivalentShallow( new Date(), new Date() );
  test.identical( got, expected );

  var expected = false;
  var src1 = new Date();
  var src2 = new Date();
  src2.setFullYear( 1987 );
  var got = _.entity.equivalentShallow( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'Date - not Date';

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), [ new Date() ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), { a : new Date() } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( new Date(), function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Array - Array';

  var expected = true;
  var got = _.entity.equivalentShallow( [], [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( [ 0 ], [ 0 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( [ 1 ], [ 1 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( [ undefined ], [ undefined ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( [ null ], [ null ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ [ 1, 2, 3 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ [ 1, 2, 3 ] ], [ [ 1, 2 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ [ 1, 2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ [ 1, 3 ] ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ null ], [ undefined ] );
  test.identical( got, expected );

  /* */

  test.case = 'Array - not Array';

  var expected = false;
  var got = _.entity.equivalentShallow( [], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [], function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entity.equivalentShallow( [ '1' ], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ undefined ], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ null ], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ NaN ], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ 0 ], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ 1 ], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ new F32x( 3 ) ], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ /(?:)/ ], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( [ function(){} ], function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Map - Map';

  var expected = true;
  var got = _.entity.equivalentShallow( {}, {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( { a : 0 }, { a : 0 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( { a : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : 1, b : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : 1 }, { a : 1, b : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : undefined, b : 1 }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : undefined }, { a : undefined, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( { a : undefined }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entity.equivalentShallow( { a : null }, { a : null } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : { b : 1 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : { b : 1 } }, { a : { b : 1, c : 2 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : { b : 1, c : 2 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : { b : 1, c : 3 } }, { b : 1, c : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : null }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : undefined }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, { a : undefined } );
  test.identical( got, expected );

  /* */

  test.case = 'Map - not Map';

  var expected = false;
  var got = _.entity.equivalentShallow( {}, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, [ 0 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( {}, function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entity.equivalentShallow( { a : '1' }, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : undefined }, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : null }, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : NaN }, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : 0 }, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : 1 }, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : {} }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : new Date() }, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : new F32x( 3 ) }, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : /(?:)/ }, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entity.equivalentShallow( { a : function(){} }, function(){} );
  test.identical( got, expected );

}

//

function entityEquivalentShallowAllTypes( test )
{
  test.open( 'identical' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 1;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = true;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 0;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = _.maybe;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'bigint';
  var src1 = 10n;
  var src2 = 10n;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'bigint and int';
  var src1 = 10n;
  var src2 = 10;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str';
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src1 = /hello/g;
  var src2 = /hello/g;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'regexp & objectLike & constructible & constructibleLike, same source, diff flags';
  var src1 = /hello/g;
  var src2 = /hello/i;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make();
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'unroll';
  var src1 = _.unrollMake([ 2, 3, 4 ]);
  var src2 = _.unrollMake([ 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'array';
  var src1 = [ 2, 3, 4 ];
  var src2 = [ 2, 3, 4 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'long & longLike';
  var src1 = _.longMake([ 1, 2 ]);
  var src2 = _.longMake([ 1, 2 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'vector & vectorLike with primitives';
  var src1 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1, length : 2 });
  var src2 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1, length : 2 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'countable & countableLike with primitives';
  var src1 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1 });
  var src2 = new countableConstructor({ element1 : 1, element2 : 2, withIterator : 1 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = `object countable, non-vector with primitives`;
  var src1 = countableMake( null, { element1 : 1, element2 : 2, withIterator : 1 } );
  var src2 = countableMake( null, { element1 : 1, element2 : 2, withIterator : 1 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Global & GlobalReal';
  var src1 = global;
  var src2 = global;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Global & GlobalDerived';
  var src1 = Object.create( global );
  var src2 = Object.create( global );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { a : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  var src2 = Object.create( null );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = 1;
  src1.b = 2;
  var src2 = Object.create( null );
  src2.a = 1;
  src2.b = 2;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = {};
  var src2 = {};
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : 1, b : 2, c : 3 };
  var src2 = { a : 1, b : 2, c : 3 };
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap();
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set();
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'BufferNode';
  var src1 = new BufferNode( 'str' );
  var src2 = new BufferNode( 'str' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 5 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 10 );
  var src2 = new BufferRawShared( 10 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 20 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 20 ) );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 20 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 1 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new F32x( 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/';
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'propertyTransformer & filter';
  var src1 = _.property.filter[ 'dstAndSrcOwn' ];
  var src2 = _.property.filter[ 'dstAndSrcOwn' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.property.mapper[ 'assigning' ];
  var src2 = _.property.mapper[ 'assigning' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = routine;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2021-02-19T11:26:42.840Z' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'null';
  var src1 = null;
  var src2 = null;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'undefined';
  var src1 = undefined;
  var src2 = undefined;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Symbol null';
  var src1 = _.null;
  var src2 = _.null;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Symbol undefined';
  var src1 = _.undefined;
  var src2 = _.undefined;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'Symbol Nothing';
  var src1 = _.nothing;
  var src2 = _.nothing;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 5;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = src1;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'console';
  var src1 = console;
  var src2 = console;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'process';
  var src1 = process;
  var src2 = process;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 2;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = false;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 1;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = 0;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str2';
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make([ 1 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'unroll';
  var src1 = _.unrollMake([ 2, 3, 4, 5 ]);
  var src2 = _.unrollMake([ 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'array';
  var src1 = [ [ 2 ], 3, 4 ];
  var src2 = [ [ 2 ], 3, 4 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'long & longLike';
  var src1 = _.longMake([ 1, 2, [ 5 ] ]);
  var src2 = _.longMake([ 1, 2, [ 5 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'vector & vectorLike same elements';
  var src1 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'countable & countableLike same elements';
  var src1 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'vector & vectorLike not same elements';
  var src1 = new countableConstructor({ elements : [ '1', '2' ], withIterator : 1, length : 2 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'countable & countableLike not same elements';
  var src1 = new countableConstructor({ elements : [ '1', '2' ], withIterator : 1 });
  var src2 = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src1 = { [ Symbol.iterator ] : 1 };
  var src2 = { [ Symbol.iterator ] : 1 };
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { b : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  src1.a = [ 1 ];
  var src2 = Object.create( null );
  src2.a = [ 1 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = [ 1, 2, 3 ];
  src1.b = [ 1, 2, 3 ];
  var src2 = Object.create( null );
  src2.a = [ 1, 2, 3 ];
  src2.b = [ 1, 2, 3 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = { a : 1 };
  var src2 = {};
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : { f : 'hello' }, b : 2, c : 3 };
  var src2 = { a : { f : 'hello' }, b : 2, c : 3 };
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap([ [ 'a', 1 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set([ 0 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'BufferNode';
  var src1 = new BufferNode( 'str' );
  var src2 = new BufferNode( 'str2' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 6 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 5 );
  var src2 = new BufferRawShared( 6 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 21 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 21 ) );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 21 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'err same message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'err diff message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error2' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new U8x( 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 3 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( Infinity );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/c/';
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'propertyTransformer & filter';
  var src1 = _.property.filter[ 'dstAndSrcOwn' ];
  var src2 = _.property.filter[ 'dstNotHasOrSrcNotNull' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.property.mapper[ 'assigning' ];
  var src2 = _.property.mapper[ 'removing' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = () => { 'hello' };
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( 100 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2020-02-19T11:26:42.840Z' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 6;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'Symbol';
  var src1 = Symbol( 'a' );
  var src2 = Symbol( 'a' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src2 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = require( 'stream' ).Readable();
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );

  test.close( 'not identical' );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  function routine () {}

}

//

function entityEquivalentNotIdentical( test )
{
  test.case = 'true and 1';
  var src1 = true;
  var src2 = 1;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'false and 0';
  var src1 = false;
  var src2 = 0;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = '1 and 2, acc : 1';
  var src1 = 1;
  var src2 = 2;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2, 1 ), true );

  // test.case = '1n and 2, acc : 1';
  // var src1 = 1n;
  // var src2 = 2;
  // test.identical( _.entity.identicalShallow( src1, src2 ), false );
  // test.identical( _.entity.equivalentShallow( src1, src2, 1 ), true );

  // test.case = '1n and 2n, acc : 1';
  // var src1 = 1n;
  // var src2 = 2n;
  // test.identical( _.entity.identicalShallow( src1, src2 ), false );
  // test.identical( _.entity.equivalentShallow( src1, src2, 1 ), true );

  test.case = 'regexps with diff flags';
  var src1 = /hello/g;
  var src2 = /hello/i;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );

  test.case = 'one string with whitespaces';
  var src1 = 'hello';
  var src2 = ' hello \n';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  // test.identical( _.entity.equivalentShallow( src1, src2 ), true ); /* ?? */
}

//
// function entityMakeConstructing( test )
// {
//   test.case = 'null';
//   var got = _.entity.cloneShallow( null );
//   test.identical( got, null );
//
//   test.case = 'undefined';
//   var got = _.entity.cloneShallow( undefined );
//   test.identical( got, undefined );
//
//   test.case = 'zero';
//   var got = _.entity.cloneShallow( 0 );
//   test.identical( got, 0 );
//
//   test.case = 'number';
//   var got = _.entity.cloneShallow( 3 );
//   test.identical( got, 3 );
//
//   test.case = 'bigInt';
//   var got = _.entity.cloneShallow( 1n );
//   test.identical( got, 1n );
//
//   test.case = 'empty string';
//   var got = _.entity.cloneShallow( '' );
//   test.identical( got, '' );
//
//   test.case = 'string';
//   var got = _.entity.cloneShallow( 'str' );
//   test.identical( got, 'str' );
//
//   test.case = 'false';
//   var got = _.entity.cloneShallow( false );
//   test.identical( got, false );
//
//   test.case = 'NaN';
//   var got = _.entity.cloneShallow( NaN );
//   test.identical( got, NaN );
//
//   test.case = 'Symbol';
//   var src = Symbol( 'a' );
//   var got = _.entity.cloneShallow( src );
//   test.identical( got, src );
//
//   test.case = '_.null';
//   var got = _.entity.cloneShallow( _.null );
//   test.identical( got, null );
//
//   test.case = '_.undefined';
//   var got = _.entity.cloneShallow( _.undefined );
//   test.identical( got, undefined );
//
//   test.case = '_.nothing';
//   var got = _.entity.cloneShallow( _.nothing );
//   test.identical( got, _.nothing );
//
//   test.case = 'empty array';
//   var got = _.entity.cloneShallow( [] );
//   test.identical( got, [] );
//
//   test.case = 'empty array, length';
//   var got = _.entity.cloneShallow( [], 4 );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//   test.case = 'not empty array';
//   var got = _.entity.cloneShallow( [ null, undefined, 1, 2 ] );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//   test.case = 'not empty array, length';
//   var got = _.entity.cloneShallow( [ null, undefined, 1, 2 ], 2 );
//   test.identical( got, [ undefined, undefined ] );
//
//   test.case = 'empty arguments array';
//   var got = _.entity.cloneShallow( _.argumentsArray.make( [] ) );
//   test.identical( got, [] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'empty arguments array, length';
//   var got = _.entity.cloneShallow( _.argumentsArray.make( [] ), 4 );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'not empty argumentsArray';
//   var got = _.entity.cloneShallow( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
//   test.identical( got, [ null, undefined, 1, 2 ] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'not empty argumentsArray, length';
//   var got = _.entity.cloneShallow( _.argumentsArray.make( [ null, undefined, 1, 2 ] ), 2 );
//   test.identical( got, [ null, undefined ] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'empty unroll';
//   var got = _.entity.cloneShallow( _.unrollMake( [] ) );
//   test.identical( got, [] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'empty unroll, length';
//   var got = _.entity.cloneShallow( _.unrollMake( [] ), 4 );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'not empty unroll';
//   var got = _.entity.cloneShallow( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
//   test.identical( got, [ null, undefined, 1, 2 ] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'not empty unroll, length';
//   var got = _.entity.cloneShallow( _.argumentsArray.make( [ null, undefined, 1, 2 ] ), 2 );
//   test.identical( got, [ null, undefined ] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'BufferTyped';
//   var got = _.entity.cloneShallow( new U8x( 10 ) );
//   test.identical( got, new U8x( 10 ) );
//
//   test.case = 'BufferTyped, length';
//   var got = _.entity.cloneShallow( new U8x( 10 ), 4 );
//   test.identical( got, new U8x( 4 ) );
//
//   test.case = 'empty map';
//   var got = _.entity.cloneShallow( {} );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'empty map, length';
//   var got = _.entity.cloneShallow( {}, 4 );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'not empty map';
//   var got = _.entity.cloneShallow( { '' : null } );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'not empty map, length';
//   var got = _.entity.cloneShallow( { '' : null }, 4 );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'empty pure map';
//   var got = _.entity.cloneShallow( Object.create( null ) );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'empty pure map, length';
//   var got = _.entity.cloneShallow( Object.create( null ) );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'instance of constructor';
//   function Constr( src )
//   {
//     this.x = src || 1;
//     return this;
//   };
//   var src = new Constr( 2 );
//   var got = _.entity.cloneShallow( src );
//   test.identical( got.x, 1 );
//   test.true( got !== src );
//
//   test.case = 'instance of constructor, length';
//   function Constr2( src )
//   {
//     this.x = src || 1;
//     return this;
//   };
//   var src = new Constr2( 2 );
//   var got = _.entity.cloneShallow( src, 2 );
//   test.identical( got.x, 1 );
//   test.true( got !== src );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( [], 1, 1 ) );
//
//   test.case = 'unknown type of entity';
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( new Set( [ 1, 'str', false ] ) ) );
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) ) );
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( new BufferRaw() ) );
// }
//
// //
//
// function entityMakeConstructingArgumentsArray( test )
// {
//   test.case = 'src = empty long, not ins';
//   var src = _.argumentsArray.make( [] );
//   var got = _.entity.cloneShallow( src );
//   var expected = _.longDescriptor.make( [] );
//   test.identical( got, expected );
//
//   test.case = 'src = long, not ins';
//   var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.entity.cloneShallow( src );
//   var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = empty long, ins = null';
//   var src = _.argumentsArray.make( [] );
//   var got = _.entity.cloneShallow( src, null );
//   var expected = _.longDescriptor.make( 0 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = empty long, ins = number';
//   var src = _.argumentsArray.make( [] );
//   var got = _.entity.cloneShallow( src, 2 );
//   var expected = _.longDescriptor.make( 2 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = number, ins < src.length';
//   var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.entity.cloneShallow( src, 2 );
//   var expected = _.longDescriptor.make( [ 1, 2 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long with an element, ins = empty array';
//   var src = new F64x( 10 );
//   var got = _.entity.cloneShallow( src, [] );
//   var expected = new F64x( 0 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = number, ins > src.length';
//   var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.entity.cloneShallow( src, 4 );
//   var expected = _.longDescriptor.make( [ 1, 2, 3, undefined ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = array, ins.length > src.length';
//   var src = _.argumentsArray.make( [ 0, 1 ] );
//   var ins = [ 1, 2, 3 ];
//   var got = _.entity.cloneShallow( src, ins );
//   var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
//   test.identical( got, expected );
//   test.true( got !== ins );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = array, ins.length === src.length'
//   var src = _.argumentsArray.make( 5 );
//   var ins = [ 1, 2, 3, 4, 5 ];
//   var got = _.entity.cloneShallow( src, ins );
//   var expected = _.longDescriptor.make( [ 1, 2, 3, 4, 5 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
// }
//
// //
//
// function entityMakeConstructingBufferTyped( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   for( let t = 0; t < list.length; t++ )
//   {
//     test.open( list[ t ].name );
//     testRun( list[ t ] );
//     test.close( list[ t ].name );
//   }
//
//   /* test subroutine */
//
//   function testRun( long )
//   {
//     test.case = 'src = empty long, not ins';
//     var src = new long( [] );
//     var got = _.entity.cloneShallow( src );
//     var expected = new long( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = _.entity.cloneShallow( src );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = null';
//     var src = new long( [] );
//     var got = _.entity.cloneShallow( src, null );
//     var expected = new long( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = number';
//     var src = new long( [] );
//     var got = _.entity.cloneShallow( src, 2 );
//     var expected = new long( 2 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = _.entity.cloneShallow( src, 2 );
//     var expected = new long( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = _.entity.cloneShallow( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = _.entity.cloneShallow( src, 4 );
//     var expected = new long( [ 1, 2, 3, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = new long( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = _.entity.cloneShallow( src, ins );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = new long( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = _.entity.cloneShallow( src, ins );
//     var expected = new long( [ 1, 2, 3, 4, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//   }
// }
//
// //
//
// function entityMakeConstructingLongDescriptor( test )
// {
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withDefaultLong[ name ];
//
//     test.open( `descriptor - ${ name }` );
//     testRun( descriptor );
//     test.close( `descriptor - ${ name }` );
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* - */
//
//   function testRun( descriptor )
//   {
//     test.case = 'null';
//     var got = descriptor.entityMakeConstructing( null );
//     test.identical( got, null );
//
//     test.case = 'undefined';
//     var got = descriptor.entityMakeConstructing( undefined );
//     test.identical( got, undefined );
//
//     test.case = 'zero';
//     var got = descriptor.entityMakeConstructing( 0 );
//     test.identical( got, 0 );
//
//     test.case = 'number';
//     var got = descriptor.entityMakeConstructing( 3 );
//     test.identical( got, 3 );
//
//     test.case = 'bigInt';
//     var got = descriptor.entityMakeConstructing( 1n );
//     test.identical( got, 1n );
//
//     test.case = 'empty string';
//     var got = descriptor.entityMakeConstructing( '' );
//     test.identical( got, '' );
//
//     test.case = 'string';
//     var got = descriptor.entityMakeConstructing( 'str' );
//     test.identical( got, 'str' );
//
//     test.case = 'false';
//     var got = descriptor.entityMakeConstructing( false );
//     test.identical( got, false );
//
//     test.case = 'NaN';
//     var got = descriptor.entityMakeConstructing( NaN );
//     test.identical( got, NaN );
//
//     test.case = 'Symbol';
//     var src = Symbol( 'a' );
//     var got = descriptor.entityMakeConstructing( src );
//     test.identical( got, src );
//
//     test.case = '_.null';
//     var got = descriptor.entityMakeConstructing( _.null );
//     test.identical( got, null );
//
//     test.case = '_.undefined';
//     var got = descriptor.entityMakeConstructing( _.undefined );
//     test.identical( got, undefined );
//
//     test.case = '_.nothing';
//     var got = descriptor.entityMakeConstructing( _.nothing );
//     test.identical( got, _.nothing );
//
//     test.case = 'empty array';
//     var got = descriptor.entityMakeConstructing( [] );
//     test.identical( got, [] );
//
//     test.case = 'empty array, length';
//     var got = descriptor.entityMakeConstructing( [], 4 );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//     test.case = 'not empty array';
//     var got = descriptor.entityMakeConstructing( [ null, undefined, 1, 2 ] );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//     test.case = 'not empty array, length';
//     var got = descriptor.entityMakeConstructing( [ null, undefined, 1, 2 ], 2 );
//     test.identical( got, [ undefined, undefined ] );
//
//     test.case = 'empty unroll';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [] ) );
//     test.identical( got, [] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'empty unroll, length';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [] ), 4 );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'not empty unroll';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [ null, undefined, 1, 2 ] ) );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'not empty unroll, length';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [ null, undefined, 1, 2 ] ), 2 );
//     test.identical( got, [ undefined, undefined ] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'empty map';
//     var got = descriptor.entityMakeConstructing( {} );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'empty map, length';
//     var got = descriptor.entityMakeConstructing( {}, 4 );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'not empty map';
//     var got = descriptor.entityMakeConstructing( { '' : null } );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'not empty map, length';
//     var got = descriptor.entityMakeConstructing( { '' : null }, 4 );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'empty pure map';
//     var got = descriptor.entityMakeConstructing( Object.create( null ) );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'empty pure map, length';
//     var got = descriptor.entityMakeConstructing( Object.create( null ) );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'instance of constructor';
//     function Constr( src )
//     {
//       this.x = src || 1;
//       return this;
//     };
//     var src = new Constr( 2 );
//     var got = descriptor.entityMakeConstructing( src );
//     test.identical( got.x, 1 );
//     test.true( got !== src );
//
//     test.case = 'instance of constructor, length';
//     function Constr2( src )
//     {
//       this.x = src || 1;
//       return this;
//     };
//     var src = new Constr2( 2 );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     test.identical( got.x, 1 );
//     test.true( got !== src );
//
//     /* - */
//
//     if( Config.debug )
//     {
//       test.case = 'without arguments';
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing() );
//
//       test.case = 'extra arguments';
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( [], 1, 1 ) );
//
//       test.case = 'unknown type of entity';
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( new Set( [ 1, 'str', false ] ) ) );
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) ) );
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( new BufferRaw() ) );
//     }
//   }
// }
//
// //
//
// function entityMakeConstructingArgumentsArrayLongDescriptor( test )
// {
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withDefaultLong[ name ];
//
//     test.open( `descriptor - ${ name }` );
//     testRun( descriptor );
//     test.close( `descriptor - ${ name }` );
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* - */
//
//   function testRun( descriptor )
//   {
//     test.case = 'src = empty long, not ins';
//     var src = _.argumentsArray.make( [] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = descriptor.longDescriptor.make( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, ins = null';
//     var src = _.argumentsArray.make( [] );
//     var got = descriptor.entityMakeConstructing( src, null );
//     var expected = descriptor.longDescriptor.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, ins = number';
//     var src = _.argumentsArray.make( [] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = descriptor.longDescriptor.make( 2 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = descriptor.longDescriptor.make( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = descriptor.entityMakeConstructing( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 4 );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3, undefined ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = _.argumentsArray.make( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = _.argumentsArray.make( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3, 4, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//   }
// }
//
// //
//
// function entityMakeConstructingBufferTypedLongDescriptor( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withDefaultLong[ name ];
//
//     for( let i = 0; i < list.length; i++ )
//     {
//       test.open( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//       testRun( descriptor, list[ i ] );
//       test.close( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//     }
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor, long )
//   {
//     test.case = 'src = empty long, not ins';
//     var src = new long( [] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = new long( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = null';
//     var src = new long( [] );
//     var got = descriptor.entityMakeConstructing( src, null );
//     var expected = new long( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = number';
//     var src = new long( [] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = new long( 2 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = new long( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new long( 10 );
//     var got = descriptor.entityMakeConstructing( src, [] );
//     var expected = new long( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 4 );
//     var expected = new long( [ 1, 2, 3, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = new long( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = new long( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = new long( [ 1, 2, 3, 4, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//   }
// }

//

function entityMakeEmpty( test )
{
  test.case = 'null';
  var got = _.entity.makeEmpty( null );
  test.identical( got, null );

  test.case = 'undefined';
  var got = _.entity.makeEmpty( undefined );
  test.identical( got, undefined );

  test.case = 'zero';
  var got = _.entity.makeEmpty( 0 );
  test.identical( got, 0 );

  test.case = 'number';
  var got = _.entity.makeEmpty( 3 );
  test.identical( got, 3 );

  test.case = 'bigInt';
  var got = _.entity.makeEmpty( 1n );
  test.identical( got, 1n );

  test.case = 'empty string';
  var got = _.entity.makeEmpty( '' );
  test.identical( got, '' );

  test.case = 'string';
  var got = _.entity.makeEmpty( 'str' );
  test.identical( got, 'str' );

  test.case = 'false';
  var got = _.entity.makeEmpty( false );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.entity.makeEmpty( NaN );
  test.identical( got, NaN );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var got = _.entity.makeEmpty( src );
  test.identical( got, src );

  test.case = '_.null';
  var got = _.entity.makeEmpty( _.null );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var got = _.entity.makeEmpty( _.undefined );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var got = _.entity.makeEmpty( _.nothing );
  test.identical( got, _.nothing );

  test.case = 'empty array';
  var got = _.entity.makeEmpty( [] );
  test.identical( got, [] );

  test.case = 'not empty array';
  var got = _.entity.makeEmpty( [ null, undefined, 1, 2 ] );
  test.identical( got, [] );

  test.case = 'empty argumentArray';
  var got = _.entity.makeEmpty( _.argumentsArray.make( [] ) );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'not empty argumentsArray';
  var got = _.entity.makeEmpty( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty unroll';
  var got = _.entity.makeEmpty( _.unrollMake( [] ) );
  test.identical( got, [] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'not empty unroll';
  var got = _.entity.makeEmpty( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'BufferTyped - U8x';
  var got = _.entity.makeEmpty( new U8x( 10 ) );
  test.identical( got, new U8x() );

  test.case = 'BufferTyped - I16x';
  var got = _.entity.makeEmpty( new I16x() );
  test.identical( got, new I16x() );

  test.case = 'BufferTyped - F64x';
  var got = _.entity.makeEmpty( new F64x( [ 1, 2 ] ) );
  test.identical( got, new F64x() );

  test.case = 'empty map';
  var got = _.entity.makeEmpty( {} );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'not empty map';
  var got = _.entity.makeEmpty( { '' : null } );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty pure map';
  var got = _.entity.makeEmpty( Object.create( null ) );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty Set';
  var got = _.entity.makeEmpty( new Set( [] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'Set';
  var got = _.entity.makeEmpty( new Set( [ 1, 'str', false ] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'empty HashMap';
  var got = _.entity.makeEmpty( new Map( [] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'HashMap';
  var got = _.entity.makeEmpty( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'BufferRaw, has constructor';
  var got = _.entity.makeEmpty( new BufferRaw() );
  test.identical( got, new BufferRaw( [] ) );

  test.case = 'constructor';
  function func(){ return 0 };
  var got = _.entity.makeEmpty( func );
  var exp = new func.constructor();
  test.equivalent( got(), exp() );

  test.case = 'constructor';
  function Constr(){ this.x = 1; return this };
  var got = _.entity.makeEmpty( new Constr() );
  var exp = new Constr();
  test.identical( got.x, exp.x );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.makeEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.makeEmpty( [], 1 ) );
}

//

function entityMakeEmptyLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withDefaultLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'null';
    var got = descriptor.entityMakeEmpty( null );
    test.identical( got, null );

    test.case = 'undefined';
    var got = descriptor.entityMakeEmpty( undefined );
    test.identical( got, undefined );

    test.case = 'zero';
    var got = descriptor.entityMakeEmpty( 0 );
    test.identical( got, 0 );

    test.case = 'number';
    var got = descriptor.entityMakeEmpty( 3 );
    test.identical( got, 3 );

    test.case = 'bigInt';
    var got = descriptor.entityMakeEmpty( 1n );
    test.identical( got, 1n );

    test.case = 'empty string';
    var got = descriptor.entityMakeEmpty( '' );
    test.identical( got, '' );

    test.case = 'string';
    var got = descriptor.entityMakeEmpty( 'str' );
    test.identical( got, 'str' );

    test.case = 'false';
    var got = descriptor.entityMakeEmpty( false );
    test.identical( got, false );

    test.case = 'NaN';
    var got = descriptor.entityMakeEmpty( NaN );
    test.identical( got, NaN );

    test.case = 'Symbol';
    var src = Symbol( 'a' );
    var got = descriptor.entityMakeEmpty( src );
    test.identical( got, src );

    test.case = '_.null';
    var got = descriptor.entityMakeEmpty( _.null );
    test.identical( got, _.null );

    test.case = '_.undefined';
    var got = descriptor.entityMakeEmpty( _.undefined );
    test.identical( got, _.undefined );

    test.case = '_.nothing';
    var got = descriptor.entityMakeEmpty( _.nothing );
    test.identical( got, _.nothing );

    test.case = 'empty array';
    var got = descriptor.entityMakeEmpty( [] );
    test.identical( got, [] );

    test.case = 'not empty array';
    var got = descriptor.entityMakeEmpty( [ null, undefined, 1, 2 ] );
    test.identical( got, [] );

    test.case = 'empty argumentArray';
    var got = descriptor.entityMakeEmpty( _.argumentsArray.make( [] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'not empty argumentsArray';
    var got = descriptor.entityMakeEmpty( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'empty unroll';
    var got = descriptor.entityMakeEmpty( _.unrollMake( [] ) );
    test.identical( got, [] );
    test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

    test.case = 'not empty unroll';
    var got = descriptor.entityMakeEmpty( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'BufferTyped - U8x';
    var got = descriptor.entityMakeEmpty( new U8x( 10 ) );
    test.identical( got, new U8x() );

    test.case = 'BufferTyped - I16x';
    var got = descriptor.entityMakeEmpty( new I16x() );
    test.identical( got, new I16x() );

    test.case = 'BufferTyped - F64x';
    var got = descriptor.entityMakeEmpty( new F64x( [ 1, 2 ] ) );
    test.identical( got, new F64x() );

    test.case = 'empty map';
    var got = descriptor.entityMakeEmpty( {} );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'not empty map';
    var got = descriptor.entityMakeEmpty( { '' : null } );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty pure map';
    var got = descriptor.entityMakeEmpty( Object.create( null ) );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty Set';
    var got = descriptor.entityMakeEmpty( new Set( [] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'Set';
    var got = descriptor.entityMakeEmpty( new Set( [ 1, 'str', false ] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'empty HashMap';
    var got = descriptor.entityMakeEmpty( new Map( [] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'HashMap';
    var got = descriptor.entityMakeEmpty( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'BufferRaw, has constructor';
    var got = descriptor.entityMakeEmpty( new BufferRaw() );
    test.identical( got, new BufferRaw( [] ) );

    test.case = 'constructor';
    function func(){ return 0 };
    var got = descriptor.entityMakeEmpty( func );
    var exp = new func.constructor();
    test.equivalent( got(), exp() );

    test.case = 'constructor';
    function Constr(){ this.x = 1; return this };
    var got = descriptor.entityMakeEmpty( new Constr() );
    var exp = new Constr();
    test.identical( got.x, exp.x );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeEmpty() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeEmpty( [], 1 ) );
    }
  }

  /* */

  function Constr()
  {
    this.x = 1;
    return this;
  };
}

//

function entityMakeUndefined( test )
{
  test.case = 'null';
  var got = _.entity.makeUndefined( null );
  test.identical( got, null );

  test.case = 'undefined';
  var got = _.entity.makeUndefined( undefined );
  test.identical( got, undefined );

  test.case = 'zero';
  var got = _.entity.makeUndefined( 0 );
  test.identical( got, 0 );

  test.case = 'number';
  var got = _.entity.makeUndefined( 3 );
  test.identical( got, 3 );

  test.case = 'bigInt';
  var got = _.entity.makeUndefined( 1n );
  test.identical( got, 1n );

  test.case = 'empty string';
  var got = _.entity.makeUndefined( '' );
  test.identical( got, '' );

  test.case = 'string';
  var got = _.entity.makeUndefined( 'str' );
  test.identical( got, 'str' );

  test.case = 'false';
  var got = _.entity.makeUndefined( false );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.entity.makeUndefined( NaN );
  test.identical( got, NaN );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var got = _.entity.makeUndefined( src );
  test.identical( got, src );

  test.case = '_.null';
  var got = _.entity.makeUndefined( _.null );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var got = _.entity.makeUndefined( _.undefined );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var got = _.entity.makeUndefined( _.nothing );
  test.identical( got, _.nothing );

  test.case = 'empty array';
  var got = _.entity.makeUndefined( [] );
  test.identical( got, [] );

  test.case = 'empty array, length';
  var got = _.entity.makeUndefined( [], 4 );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );

  test.case = 'not empty array';
  var got = _.entity.makeUndefined( [ null, undefined, 1, 2 ] );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );

  test.case = 'not empty array, length';
  var got = _.entity.makeUndefined( [ null, undefined, 1, 2 ], 2 );
  test.identical( got, [ undefined, undefined ] );

  test.case = 'empty arguments array';
  var got = _.entity.makeUndefined( _.argumentsArray.make( [] ) );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty arguments array, length';
  var got = _.entity.makeUndefined( _.argumentsArray.make( [] ), 4 );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'not empty argumentsArray';
  var got = _.entity.makeUndefined( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'not empty argumentsArray, length';
  var got = _.entity.makeUndefined( _.argumentsArray.make( [ null, undefined, 1, 2 ] ), 2 );
  test.identical( got, [ undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty unroll';
  var got = _.entity.makeUndefined( _.unrollMake( [] ) );
  test.identical( got, [] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'empty unroll, length';
  var got = _.entity.makeUndefined( _.unrollMake( [] ), 4 );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'not empty unroll';
  var got = _.entity.makeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'not empty unroll, length';
  var got = _.entity.makeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ), 2 );
  test.identical( got, [ undefined, undefined ] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'empty BufferTyped - U8x';
  var got = _.entity.makeUndefined( new U8x() );
  test.identical( got, new U8x( 0 ) );

  test.case = 'empty BufferTyped - I16x, length';
  var got = _.entity.makeUndefined( new I16x(), 5 );
  test.identical( got, new I16x( 5 ) );

  test.case = 'BufferTyped - F32x';
  var got = _.entity.makeUndefined( new F32x( 5 ) );
  test.identical( got, new F32x( 5 ) );

  test.case = 'BufferTyped - F32x, length';
  var got = _.entity.makeUndefined( new F32x( 10 ), 5 );
  test.identical( got, new F32x( 5 ) );

  test.case = 'empty map';
  var got = _.entity.makeUndefined( {} );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty map, length';
  var got = _.entity.makeUndefined( {}, 4 );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'not empty map';
  var got = _.entity.makeUndefined( { '' : null } );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'not empty map, length';
  var got = _.entity.makeUndefined( { '' : null }, 4 );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty pure map';
  var got = _.entity.makeUndefined( Object.create( null ) );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty pure map, length';
  var got = _.entity.makeUndefined( Object.create( null ) );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty Set';
  var got = _.entity.makeUndefined( new Set( [] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'empty Set, length';
  var got = _.entity.makeUndefined( new Set( [] ), 4 );
  test.identical( got, new Set( [] ) );

  test.case = 'Set';
  var got = _.entity.makeUndefined( new Set( [ 1, 'str', false ] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'Set, length';
  var got = _.entity.makeUndefined( new Set( [ 1, 'str', false ] ), 4 );
  test.identical( got, new Set( [] ) );

  test.case = 'empty HashMap';
  var got = _.entity.makeUndefined( new Map( [] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'empty HashMap, length';
  var got = _.entity.makeUndefined( new Map( [] ), 4 );
  test.identical( got, new Map( [] ) );

  test.case = 'HashMap';
  var got = _.entity.makeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'HashMap, length';
  var got = _.entity.makeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'BufferRaw, has constructor';
  var got = _.entity.makeUndefined( new BufferRaw() );
  test.identical( got, new BufferRaw( [] ) );

  test.case = 'constructor';
  function func(){ return 0 };
  var got = _.entity.makeUndefined( func );
  var exp = new func.constructor();
  test.equivalent( got(), exp() );

  test.case = 'constructor';
  function Constr(){ this.x = 1; return this };
  var got = _.entity.makeUndefined( new Constr() );
  var exp = new Constr();
  test.identical( got.x, exp.x );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.makeUndefined() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.makeUndefined( [], 1, 1 ) );
}

//

function entityMakeUndefinedLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withDefaultLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'null';
    var got = descriptor.entityMakeUndefined( null );
    test.identical( got, null );

    test.case = 'undefined';
    var got = descriptor.entityMakeUndefined( undefined );
    test.identical( got, undefined );

    test.case = 'zero';
    var got = descriptor.entityMakeUndefined( 0 );
    test.identical( got, 0 );

    test.case = 'number';
    var got = descriptor.entityMakeUndefined( 3 );
    test.identical( got, 3 );

    test.case = 'bigInt';
    var got = descriptor.entityMakeUndefined( 1n );
    test.identical( got, 1n );

    test.case = 'empty string';
    var got = descriptor.entityMakeUndefined( '' );
    test.identical( got, '' );

    test.case = 'string';
    var got = descriptor.entityMakeUndefined( 'str' );
    test.identical( got, 'str' );

    test.case = 'false';
    var got = descriptor.entityMakeUndefined( false );
    test.identical( got, false );

    test.case = 'NaN';
    var got = descriptor.entityMakeUndefined( NaN );
    test.identical( got, NaN );

    test.case = 'Symbol';
    var src = Symbol( 'a' );
    var got = descriptor.entityMakeUndefined( src );
    test.identical( got, src );

    test.case = '_.null';
    var got = descriptor.entityMakeUndefined( _.null );
    test.identical( got, _.null );

    test.case = '_.undefined';
    var got = descriptor.entityMakeUndefined( _.undefined );
    test.identical( got, _.undefined );

    test.case = '_.nothing';
    var got = descriptor.entityMakeUndefined( _.nothing );
    test.identical( got, _.nothing );

    test.case = 'empty array';
    var got = descriptor.entityMakeUndefined( [] );
    test.identical( got, [] );

    test.case = 'empty array, length';
    var got = descriptor.entityMakeUndefined( [], 4 );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty array';
    var got = descriptor.entityMakeUndefined( [ null, undefined, 1, 2 ] );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty array, length';
    var got = descriptor.entityMakeUndefined( [ null, undefined, 1, 2 ], 2 );
    test.identical( got, [ undefined, undefined ] );

    test.case = 'empty arguments array';
    var got = descriptor.entityMakeUndefined( _.argumentsArray.make( [] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'empty arguments array, length';
    var got = descriptor.entityMakeUndefined( _.argumentsArray.make( [] ), 4 );
    test.identical( got, descriptor.longDescriptor.make( 4 ) );

    test.case = 'not empty argumentsArray';
    var got = descriptor.entityMakeUndefined( _.argumentsArray.make( [ null, undefined, 1, 2 ] ) );
    test.identical( got, descriptor.longDescriptor.make( 4 ) );

    test.case = 'not empty argumentsArray, length';
    var got = descriptor.entityMakeUndefined( _.argumentsArray.make( [ null, undefined, 1, 2 ] ), 2 );
    test.identical( got, descriptor.longDescriptor.make( 2 ) );

    test.case = 'empty unroll';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [] ) );
    test.identical( got, [] );

    test.case = 'empty unroll, length';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [] ), 4 );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty unroll';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ) );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty unroll, length';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ), 2 );
    test.identical( got, [ undefined, undefined ] );

    test.case = 'empty BufferTyped - U8x';
    var got = descriptor.entityMakeUndefined( new U8x() );
    test.identical( got, new U8x( 0 ) );

    test.case = 'empty BufferTyped - I16x, length';
    var got = descriptor.entityMakeUndefined( new I16x(), 5 );
    test.identical( got, new I16x( 5 ) );

    test.case = 'BufferTyped - F32x';
    var got = descriptor.entityMakeUndefined( new F32x( 5 ) );
    test.identical( got, new F32x( 5 ) );

    test.case = 'BufferTyped - F32x, length';
    var got = descriptor.entityMakeUndefined( new F32x( 10 ), 5 );
    test.identical( got, new F32x( 5 ) );

    test.case = 'empty map';
    var got = descriptor.entityMakeUndefined( {} );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty map, length';
    var got = descriptor.entityMakeUndefined( {}, 4 );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'not empty map';
    var got = descriptor.entityMakeUndefined( { '' : null } );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'not empty map, length';
    var got = descriptor.entityMakeUndefined( { '' : null }, 4 );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty pure map';
    var got = descriptor.entityMakeUndefined( Object.create( null ) );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty pure map, length';
    var got = descriptor.entityMakeUndefined( Object.create( null ) );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty Set';
    var got = descriptor.entityMakeUndefined( new Set( [] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'empty Set, length';
    var got = descriptor.entityMakeUndefined( new Set( [] ), 4 );
    test.identical( got, new Set( [] ) );

    test.case = 'Set';
    var got = descriptor.entityMakeUndefined( new Set( [ 1, 'str', false ] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'Set, length';
    var got = descriptor.entityMakeUndefined( new Set( [ 1, 'str', false ] ), 4 );
    test.identical( got, new Set( [] ) );

    test.case = 'empty HashMap';
    var got = descriptor.entityMakeUndefined( new Map( [] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'empty HashMap, length';
    var got = descriptor.entityMakeUndefined( new Map( [] ), 4 );
    test.identical( got, new Map( [] ) );

    test.case = 'HashMap';
    var got = descriptor.entityMakeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'HashMap, length';
    var got = descriptor.entityMakeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'BufferRaw, has constructor';
    var got = descriptor.entityMakeUndefined( new BufferRaw() );
    test.identical( got, new BufferRaw( [] ) );

    test.case = 'constructor';
    function func(){ return 0 };
    var got = descriptor.entityMakeUndefined( func );
    var exp = new func.constructor();
    test.equivalent( got(), exp() );

    test.case = 'constructor';
    function Constr(){ this.x = 1; return this };
    var got = descriptor.entityMakeUndefined( new Constr() );
    var exp = new Constr();
    test.identical( got.x, exp.x );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeUndefined() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeUndefined( [], 1, 1 ) );
    }
  }

  /* */

  function Constr()
  {
    this.x = 1;
    return this;
  };
}

//

function entityMake( test )
{
  test.case = 'null';
  var got = _.entity.make( null );
  test.identical( got, null );

  test.case = 'undefined';
  var got = _.entity.make( undefined );
  test.identical( got, undefined );

  test.case = 'zero';
  var got = _.entity.make( 0 );
  test.identical( got, 0 );

  test.case = 'number';
  var got = _.entity.make( 3 );
  test.identical( got, 3 );

  test.case = 'bigInt';
  var got = _.entity.make( 1n );
  test.identical( got, 1n );

  test.case = 'empty string';
  var got = _.entity.make( '' );
  test.identical( got, '' );

  test.case = 'string';
  var got = _.entity.make( 'str' );
  test.identical( got, 'str' );

  test.case = 'false';
  var got = _.entity.make( false );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.entity.make( NaN );
  test.identical( got, NaN );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var got = _.entity.make( src );
  test.identical( got, src );

  test.case = '_.null';
  var got = _.entity.make( _.null );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var got = _.entity.make( _.undefined );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var got = _.entity.make( _.nothing );
  test.identical( got, _.nothing );

  test.case = 'empty array';
  var src = [];
  var got = _.entity.make( src );
  test.identical( got, [] );
  test.true( got !== src );

  test.case = 'not empty array';
  var src = [ null, undefined, 1, 2 ];
  var got = _.entity.make( src );
  test.identical( got, [ null, undefined, 1, 2 ] );
  test.true( got !== src );

  test.case = 'empty argumentArray';
  var src = _.argumentsArray.make( [] );
  var got = _.entity.make( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'not empty argumentsArray';
  var src = _.argumentsArray.make( [ null, undefined, 1, 2 ] );
  var got = _.entity.make( src );
  test.identical( got, [ null, undefined, 1, 2 ] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'empty unroll';
  var src = _.unrollMake( [] );
  var got = _.entity.make( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'not empty unroll';
  var src = _.unrollMake( [ null, undefined, 1, 2 ] );
  var got = _.entity.make( src );
  test.identical( got, [ null, undefined, 1, 2 ] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'empty BufferTyped - U8x';
  var src = new U8x();
  var got = _.entity.make( src );
  test.identical( got, new U8x( [] ) );
  test.true( got instanceof U8x )
  test.true( got !== src );

  test.case = 'not empty BufferTyped - I16x';
  var src = new I16x( 5 );
  var got = _.entity.make( src );
  test.identical( got, new I16x( [ 0, 0, 0, 0, 0 ] ) );
  test.true( got instanceof I16x )
  test.true( got !== src );

  test.case = 'not empty BufferTyped - F32x';
  var src = new F32x( 5 );
  var got = _.entity.make( src );
  test.identical( got, new F32x( [ 0, 0, 0, 0, 0 ] ) );
  test.true( got instanceof F32x )
  test.true( got !== src );

  test.case = 'not empty BufferTyped - F64x';
  var src = new F64x( 5 );
  var got = _.entity.make( src );
  test.identical( got, new F64x( [ 0, 0, 0, 0, 0 ] ) );
  test.true( got instanceof F64x )
  test.true( got !== src );

  test.case = 'empty map';
  var src = {};
  var got = _.entity.make( src );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'not empty map';
  var src = { '' : null };
  var got = _.entity.make( src );
  test.identical( got, { '' : null } );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entity.make( src );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.entity.make( src );
  test.identical( got, { a : 2 } );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'empty Set';
  var src = new Set( [] );
  var got = _.entity.make( src );
  test.identical( got, new Set( [] ) );
  test.true( got !== src );

  test.case = 'Set';
  var src = new Set( [ 1, 'str', false ] );
  var got = _.entity.make( src );
  test.identical( got, new Set( [ 1, 'str', false ] ) );
  test.true( got !== src );

  test.case = 'empty HashMap';
  var src = new Map( [] );
  var got = _.entity.make( src );
  test.identical( got, new Map( [] ) );
  test.true( got !== src );

  test.case = 'HashMap';
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] );
  var got = _.entity.make( src );
  test.identical( got, new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.true( got !== src );

  test.case = 'BufferRaw, has constructor';
  var got = _.entity.make( new BufferRaw() );
  test.identical( got, new BufferRaw( [] ) );

  test.case = 'constructor';
  function func(){ return 0 };
  var got = _.entity.make( func );
  var exp = new func.constructor();
  test.equivalent( got(), exp() );

  test.case = 'constructor';
  function Constr(){ this.x = 1; return this };
  var got = _.entity.make( new Constr() );
  var exp = new Constr();
  test.identical( got.x, exp.x );

  /* */

  test.case = 'routine for key shallowSymbol';
  function Constr1(){ this.x = 1; return this };
  var src = new Constr1();
  src[ _.entity.shallowCloneSymbol ] = () => new Constr1();
  var got = _.entity.make( src );
  var exp = new Constr1();
  test.identical( got.x, exp.x );

  test.case = 'routine for key shallowSymbol';
  function Constr2(){ this.x = 1; return this };
  var src = new Constr2();
  src.cloneShallow = () => new Constr2();
  var got = _.entity.make( src );
  var exp = new Constr1();
  test.identical( got.x, exp.x );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.make() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.make( [], 1 ) );
}

//

function entityMakeLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withDefaultLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'null';
    var got = descriptor.entityMake( null );
    test.identical( got, null );

    test.case = 'undefined';
    var got = descriptor.entityMake( undefined );
    test.identical( got, undefined );

    test.case = 'zero';
    var got = descriptor.entityMake( 0 );
    test.identical( got, 0 );

    test.case = 'number';
    var got = descriptor.entityMake( 3 );
    test.identical( got, 3 );

    test.case = 'bigInt';
    var got = descriptor.entityMake( 1n );
    test.identical( got, 1n );

    test.case = 'empty string';
    var got = descriptor.entityMake( '' );
    test.identical( got, '' );

    test.case = 'string';
    var got = descriptor.entityMake( 'str' );
    test.identical( got, 'str' );

    test.case = 'false';
    var got = descriptor.entityMake( false );
    test.identical( got, false );

    test.case = 'NaN';
    var got = descriptor.entityMake( NaN );
    test.identical( got, NaN );

    test.case = 'Symbol';
    var src = Symbol( 'a' );
    var got = descriptor.entityMake( src );
    test.identical( got, src );

    test.case = '_.null';
    var got = descriptor.entityMake( _.null );
    test.identical( got, _.null );

    test.case = '_.undefined';
    var got = descriptor.entityMake( _.undefined );
    test.identical( got, _.undefined );

    test.case = '_.nothing';
    var got = descriptor.entityMake( _.nothing );
    test.identical( got, _.nothing );

    test.case = 'empty array';
    var src = [];
    var got = descriptor.entityMake( src );
    test.identical( got, [] );
    test.true( got !== src );

    test.case = 'not empty array';
    var src = [ null, undefined, 1, 2 ];
    var got = descriptor.entityMake( src );
    test.identical( got, [ null, undefined, 1, 2 ] );
    test.true( got !== src );

    test.case = 'empty argumentArray';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'not empty argumentsArray';
    var src = _.argumentsArray.make( [ null, undefined, 1, 2 ] );
    var got = descriptor.entityMake( src );
    test.identical( got, descriptor.longDescriptor.make( [ null, undefined, 1, 2 ] ) );

    test.case = 'empty unroll';
    var src = _.unrollMake( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, [] );
    test.true( got !== src );

    test.case = 'not empty unroll';
    var src = _.unrollMake( [ null, undefined, 1, 2 ] );
    var got = descriptor.entityMake( src );
    test.identical( got, [ null, undefined, 1, 2 ] );
    test.true( got !== src );

    test.case = 'empty BufferTyped - U8x';
    var src = new U8x();
    var got = descriptor.entityMake( src );
    test.identical( got, new U8x( [] ) );
    test.true( got !== src );

    test.case = 'not empty BufferTyped - I16x';
    var src = new I16x( 5 );
    var got = descriptor.entityMake( src );
    test.identical( got, new I16x( [ 0, 0, 0, 0, 0 ] ) );
    test.true( got !== src );

    test.case = 'not empty BufferTyped - F64x';
    var src = new F64x( 5 );
    var got = descriptor.entityMake( src );
    test.identical( got, new F64x( [ 0, 0, 0, 0, 0 ] ) );
    test.true( got !== src );

    test.case = 'empty map';
    var src = {};
    var got = descriptor.entityMake( src );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'not empty map';
    var src = { '' : null };
    var got = descriptor.entityMake( src );
    test.identical( got, { '' : null } );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'empty pure map';
    var src = Object.create( null );
    var got = descriptor.entityMake( src );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'pure map';
    var src = Object.create( null );
    src.a = 2;
    var got = descriptor.entityMake( src );
    test.identical( got, { a : 2 } );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'empty Set';
    var src = new Set( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Set( [] ) );
    test.true( got !== src );

    test.case = 'Set';
    var src = new Set( [ 1, 'str', false ] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Set( [ 1, 'str', false ] ) );
    test.true( got !== src );

    test.case = 'empty HashMap';
    var src = new Map( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Map( [] ) );
    test.true( got !== src );

    test.case = 'HashMap';
    var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.true( got !== src );

    test.case = 'BufferRaw, has constructor';
    var got = descriptor.entityMake( new BufferRaw() );
    test.identical( got, new BufferRaw( [] ) );

    test.case = 'constructor';
    function func(){ return 0 };
    var got = descriptor.entityMake( func );
    var exp = new func.constructor();
    test.equivalent( got(), exp() );

    test.case = 'constructor';
    function Constr(){ this.x = 1; return this };
    var got = descriptor.entityMake( new Constr() );
    var exp = new Constr();
    test.identical( got.x, exp.x );

    /* */

    test.case = 'routine for key shallowSymbol';
    function Constr1(){ this.x = 1; return this };
    var src = new Constr1();
    src[ _.entity.shallowCloneSymbol ] = () => new Constr1();
    var got = descriptor.entityMake( src );
    var exp = new Constr1();
    test.identical( got.x, exp.x );

    test.case = 'routine for key shallowSymbol';
    function Constr2(){ this.x = 1; return this };
    var src = new Constr2();
    src.cloneShallow = () => new Constr2();
    var got = descriptor.entityMake( src );
    var exp = new Constr1();
    test.identical( got.x, exp.x );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMake() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMake( [], 1 ) );
    }
  }

  /* */

  function Constr()
  {
    this.x = 1;
    return this;
  };
}

//

function entityEntityEqualize( test )
{
  test.open( 'without callbacks' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null );
  test.identical( got, false );

  test.case = 'nan and nan';
  var got = _.entity.equalize( NaN, NaN );
  test.identical( got, true );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1 );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2 );
  test.identical( got, false );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str' );
  test.identical( got, true );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src' );
  test.identical( got, false );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [] );
  test.identical( got, false );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ] );
  test.identical( got, false );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 1 ], [ 2, 'str', null, undefined ] );
  test.identical( got, false );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {} );
  test.identical( got, false );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' } );
  test.identical( got, false );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' } );
  test.identical( got, false );

  test.close( 'without callbacks' );

  /* - */

  test.open( 'only onEvaluate1' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined, ( e ) => e );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null, ( e ) => e );
  test.identical( got, false );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1, ( e ) => e );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2, ( e ) => e === 1 ? e : e - 1 );
  test.identical( got, true );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str', ( e ) => e );
  test.identical( got, true );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src', ( e ) => typeof e );
  test.identical( got, true );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [], ( e ) => e.length );
  test.identical( got, true );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ], ( e ) => e[ 3 ] );
  test.identical( got, true );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 1 ], [ 2, 'str', null, undefined ], ( e ) => e[ 0 ] );
  test.identical( got, false );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {}, ( e ) => _.mapIs( e ) );
  test.identical( got, true );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' }, ( e ) => e.a );
  test.identical( got, true );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' }, ( e ) => typeof e.a );
  test.identical( got, false );

  test.close( 'only onEvaluate1' );

  /* - */

  test.open( 'onEvaluate1 is equalizer' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined, ( e, ins ) => e === ins );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null, ( e, ins ) => e === ins );
  test.identical( got, false );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1, ( e, ins ) => e === ins );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2, ( e, ins ) => e === ins - 1 );
  test.identical( got, true );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str', ( e, ins ) => e !== ins );
  test.identical( got, false );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src', ( e, ins ) => typeof e === typeof ins );
  test.identical( got, true );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [], ( e, ins ) => e.length === ins.length );
  test.identical( got, true );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ], ( e, ins ) => e[ 0 ] === ins[ 1 ] );
  test.identical( got, false );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 1 ], [ 2, 'str', null, undefined ], ( e, ins ) => e[ 0 ] === ins[ 0 ] - 1 );
  test.identical( got, true );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {}, ( e, ins ) => _.mapIs( e ) === _.mapIs( ins ) );
  test.identical( got, true );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' }, ( e, ins ) => e.a === ins.b );
  test.identical( got, false );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' }, ( e, ins ) => e.a === ins.b );
  test.identical( got, true );

  test.close( 'onEvaluate1 is equalizer' );

  /* - */

  test.open( 'onEvaluate1 and onEvaluate2' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined, ( e ) => e, ( ins ) => ins );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null, ( e ) => e, ( ins ) => ins );
  test.identical( got, false );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1, ( e ) => e, ( ins ) => ins );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2, ( e ) => e, ( ins ) => ins - 1 );
  test.identical( got, true );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str', ( e ) => e, ( ins ) => !ins );
  test.identical( got, false );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src', ( e ) => !!e, ( ins ) => !!ins );
  test.identical( got, true );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [], ( e ) => e.length, ( ins ) => ins.length );
  test.identical( got, true );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ], ( e ) => !!e[ 3 ], ( ins ) => !!ins[ 4 ] );
  test.identical( got, true );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 4 ], [ 2, 'str', null, undefined ], ( e ) => e[ 0 ], ( ins ) => ins.length );
  test.identical( got, true );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {}, ( e ) => !!e, ( ins ) => !!ins );
  test.identical( got, true );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' }, ( e ) => e.b, ( ins ) => ins.b );
  test.identical( got, true );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' }, ( e ) => e.a, ( ins ) => ins.b );
  test.identical( got, true );

  test.close( 'onEvaluate1 and onEvaluate2' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.equalize() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1 ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, ( ins ) => ins, 'extra' ) );

  test.case = 'wrong length of onEvaluate1';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, () => true ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( a, b, c ) => a === b - c ) );

  test.case = 'wrong type of onEvaluate1';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, 3 ) );

  test.case = 'wrong length of onEvaluate2';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, () => true ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, ( a, b, c ) => a + b + c ) );

  test.case = 'wrong type of onEvaluate2';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, [ 2 ] ) );

  test.case = 'using onEvaluate2 without onEvaluate1';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, undefined, ( e ) => e ) );
}

//

function entityAssign( test )
{
  test.case = 'src null';
  var dst = 'string';
  var src = null;
  var got = _.entity.assign2( dst, src );
  var expected = null;
  test.identical( got, expected );

  test.case = 'dst.copy';
  var dst =
  {
    copy : function( src )
    {
      for( var i in src )
      this[ i ] = src[ i ]
    }
  };
  var src = { src : 'string', num : 123 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected =
  {
    copy : dst.copy,
    src : 'string',
    num : 123

  };
  test.identical( got, expected );

  test.case = 'src.clone';
  var dst = 1;
  var src = { src : 'string', num : 123, clone : function() { return { src : 'string', num : 123 } } }
  var got = _.entity.assign2( dst, src  );
  var expected = { src : 'string', num : 123 };
  test.identical( got, expected );
  test.true( got !== expected );
  test.true( got !== src );

  test.case = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2, 3 ];
  var got = _.entity.assign2( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.case = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected = { set : dst.set, value : 100 };
  test.identical( got, expected );

  test.case = 'onRecursive ';
  var dst = { };
  var src = { value : 100, a : {  b : 101 } };
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  _.entity.assign2( dst, src, onRecursive  );
  var got = dst;
  var expected = src;
  test.identical( got, expected );

  test.case = 'atomic ';
  var src = 2;
  var got = _.entity.assign2( null, src );
  var expected = src;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entity.assign2( );
  });

  test.case = 'src.clone throws "unexpected"';
  test.shouldThrowErrorSync( function()
  {
    var dst = {};
    var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
    _.entity.assign2( dst, src  );
  });

}

//

function entityAssignFieldFromContainer( test )
{
  test.case = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.case = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  var got = _.entity.assign2FieldFromContainer( dst, src, name, onRecursive );
  var expected = dst[ name ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.assign2FieldFromContainer() );
}

//

function entityLengthOf( test )
{

  test.case = 'undefined';
  var got = _.entityLengthOf( undefined );
  test.identical( got, 0 );

  test.case = 'null';
  var got = _.entityLengthOf( null );
  test.identical( got, 1 );

  test.case = 'false';
  var got = _.entityLengthOf( false );
  test.identical( got, 1 );

  test.case = 'true';
  var got = _.entityLengthOf( true );
  test.identical( got, 1 );

  test.case = 'zero';
  var got = _.entityLengthOf( 0 );
  test.identical( got, 1 );

  test.case = 'number';
  var got = _.entityLengthOf( 34 );
  test.identical( got, 1 );

  test.case = 'NaN';
  var got = _.entityLengthOf( NaN );
  test.identical( got, 1 );

  test.case = 'Infinity';
  var got = _.entityLengthOf( Infinity );
  test.identical( got, 1 );

  test.case = 'empty string';
  var got = _.entityLengthOf( '' );
  test.identical( got, 1 );

  test.case = 'string';
  var got = _.entityLengthOf( 'str' );
  test.identical( got, 1 );

  test.case = 'symbol';
  var got = _.entityLengthOf( Symbol.for( 'x' ) );
  test.identical( got, 1 );

  test.case = 'empty array';
  var got = _.entityLengthOf( [] );
  test.identical( got, 0 );

  test.case = 'array';
  var got = _.entityLengthOf( [ [ 23, 17 ], undefined, 34 ] );
  test.identical( got, 3 );

  test.case = 'argumentsArray';
  var got = _.entityLengthOf( _.argumentsArray.make( [ 1, [ 2, 3 ], 4 ] ) );
  test.identical( got, 3 );

  test.case = 'unroll';
  var got = _.entityLengthOf( _.argumentsArray.make( [ 1, 2, [ 3, 4 ] ] ) );
  test.identical( got, 3 );

  test.case = 'BufferTyped';
  var got = _.entityLengthOf( new U8x([ 1, 2, 3 ]) );
  test.identical( got, 3 );

  test.case = 'F32x';
  var got = _.entityLengthOf( new F32x([ 1, 2, 3 ]) );
  test.identical( got, 3 );

  test.case = 'BufferRaw';
  var got = _.entityLengthOf( new BufferRaw( 10 ) );
  test.identical( got, 1 );

  test.case = 'BufferView';
  var got = _.entityLengthOf( new BufferView( new BufferRaw( 10 ) ) );
  test.identical( got, 1 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got1 = _.entityLengthOf( BufferNode.from([ 1, 2, 3, 4 ]) );
    test.identical( got1, 4 );
  }

  test.case = 'Set';
  var got = _.entityLengthOf( new Set( [ 1, 2, undefined, 4 ] ) );
  test.identical( got, 4 );

  test.case = 'map';
  var got = _.entityLengthOf( { a : 1, b : 2, c : { d : 3 } } );
  test.identical( got, 3 );

  test.case = 'HashMap';
  var got = _.entityLengthOf( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
  test.identical( got, 3 );

  test.case = 'function';
  var got = _.entityLengthOf( function(){} );
  test.identical( got, 1 );

  test.case = 'object';
  var obj1 = new Obj1({});
  var got = _.entityLengthOf( obj1 );
  test.identical( got, 1 );

  test.case = 'object with iterator, empty';
  var obj1 = new Obj1({ elements : [] });
  obj1[ Symbol.iterator ] = _iterate;
  var got = _.entityLengthOf( obj1 );
  test.identical( got, 0 );

  test.case = 'object with iterator, empty';
  var obj1 = new Obj1({ elements : [ 'a', 'b', 'c' ] });
  obj1[ Symbol.iterator ] = _iterate;
  var got = _.entityLengthOf( obj1 );
  test.identical( got, 3 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  Constr1.prototype.toString = function()
  {
    console.log('some message');
  }
  Constr1.prototype.c = 99;
  var got = _.entityLengthOf( new Constr1() );
  test.identical( got, 1 );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property1' :
    {
      value : true,
      enumerable : false,
      writable : true,
    },
    'property2' : {
      value : 'Hello',
      enumerable : false,
      writable : true,
    },
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true,
    }
  };
  Object.defineProperties( src, o );
  var got = _.entityLengthOf( src );
  test.identical( got, 1 );

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = 1;
  src.b = 1;
  var got = _.entityLengthOf( src );
  test.identical( got, 2 );

  test.case = 'polluted map';
  var src = {};
  src.a = 1;
  src.b = 1;
  var got = _.entityLengthOf( src );
  test.identical( got, 2 );

  test.case = 'pure auxilary';
  var prototype = Object.create( null );
  prototype.a = 0;
  prototype.b = 0;
  var src = Object.create( prototype );
  src.b = 1;
  src.c = 1;
  var got = _.entityLengthOf( src );
  test.identical( got, 3 );

  test.case = 'polluted auxilary';
  var prototype = {};
  prototype.a = 0;
  prototype.b = 0;
  var src = Object.create( prototype );
  src.b = 1;
  src.c = 1;
  var got = _.entityLengthOf( src );
  test.identical( got, 3 );

  /* */

  function Obj1( o )
  {
    _.mapExtend( this, o );
    return this;
  }

  /* */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }
}

//

function uncountableSize( test )
{
  test.case = 'undefined';
  var got = _.uncountableSize( undefined );
  test.identical( got, 8 );

  test.case = 'null';
  var got = _.uncountableSize( null );
  test.identical( got, 8 );

  test.case = 'false';
  var got = _.uncountableSize( false );
  test.identical( got,  8);

  test.case = 'true';
  var got = _.uncountableSize( true );
  test.identical( got, 8 );

  test.case = 'zero';
  var got = _.uncountableSize( 0 );
  test.identical( got, 8 );

  test.case = 'number';
  var got = _.uncountableSize( 34 );
  test.identical( got, 8 );

  test.case = 'NaN';
  var got = _.uncountableSize( NaN );
  test.identical( got, 8 );

  test.case = 'Infinity';
  var got = _.uncountableSize( Infinity );
  test.identical( got, 8 );

  test.case = 'empty string';
  var got = _.uncountableSize( '' );
  test.identical( got, 0 );

  test.case = 'string';
  var got = _.uncountableSize( 'str' );
  test.identical( got, 3 );

  test.case = 'symbol';
  var got = _.uncountableSize( Symbol.for( 'x' ) );
  test.identical( got, 8 );

  test.case = 'empty array';
  var got = _.uncountableSize( [] );
  test.identical( got, NaN );

  test.case = 'array';
  var got = _.uncountableSize( [ [ 23, 17 ], undefined, 34 ] );
  test.identical( got, NaN );

  test.case = 'argumentsArray';
  var got = _.uncountableSize( _.argumentsArray.make( [ 1, [ 2, 3 ], 4 ] ) );
  test.identical( got, NaN );

  test.case = 'unroll';
  var got = _.uncountableSize( _.argumentsArray.make( [ 1, 2, [ 3, 4 ] ] ) );
  test.identical( got, NaN );

  test.case = 'BufferTyped';
  var got = _.uncountableSize( new U8x( [ 1, 2, 3, 4 ] ) );
  test.identical( got, 4 );

  test.case = 'BufferRaw';
  var got = _.uncountableSize( new BufferRaw( 10 ) );
  test.identical( got, 10 );

  test.case = 'BufferView';
  var got = _.uncountableSize( new BufferView( new BufferRaw( 10 ) ) );
  test.identical( got, 10 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got1 = _.uncountableSize( BufferNode.from( [ 1, 2, 3, 4 ] ) );
    test.identical( got1, 4 );
  }

  test.case = 'Set';
  var got = _.uncountableSize( new Set( [ 1, 2, undefined, 4 ] ) );
  test.identical( got, NaN );

  test.case = 'map';
  var got = _.uncountableSize( { a : 1, b : 2, c : { d : 3 } } );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.uncountableSize( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.uncountableSize( function(){} );
  test.identical( got, 8 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  var got = _.uncountableSize( new Constr1() );
  test.identical( got, 8 );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  var got = _.uncountableSize( src );
  test.identical( got, NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.uncountableSize() );
}

//

/* zzz : find better solution instead of `_.look ?` */

function entitySize( test )
{
  test.case = 'undefined';
  var got = _.entitySize( undefined );
  test.identical( got, 8 );

  test.case = 'null';
  var got = _.entitySize( null );
  test.identical( got, 8 );

  test.case = 'false';
  var got = _.entitySize( false );
  test.identical( got,  8);

  test.case = 'true';
  var got = _.entitySize( true );
  test.identical( got, 8 );

  test.case = 'zero';
  var got = _.entitySize( 0 );
  test.identical( got, 8 );

  test.case = 'number';
  var got = _.entitySize( 34 );
  test.identical( got, 8 );

  test.case = 'NaN';
  var got = _.entitySize( NaN );
  test.identical( got, 8 );

  test.case = 'Infinity';
  var got = _.entitySize( Infinity );
  test.identical( got, 8 );

  test.case = 'empty string';
  var got = _.entitySize( '' );
  test.identical( got, 0 );

  test.case = 'string';
  var got = _.entitySize( 'str' );
  test.identical( got, 3 );

  test.case = 'symbol';
  var got = _.entitySize( Symbol.for( 'x' ) );
  test.identical( got, 8 );

  /* zzz : temp fix */ /* Dmytro : the second part of test routine in module Looker */

  if( !_.look ) /* prevents fails if Looker is included */
  {
    test.case = 'empty array';
    var got = _.entitySize( [] );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'array';
    var got = _.entitySize( [ 3, undefined, 34 ] );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'argumentsArray';
    var got = _.entitySize( _.argumentsArray.make( [ 1, null, 4 ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'unroll';
    var got = _.entitySize( _.argumentsArray.make( [ 1, 2, 'str' ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'BufferTyped';
    var got = _.entitySize( new U8x( [ 1, 2, 3, 4 ] ) );
    test.identical( got, 4 );

    test.case = 'BufferRaw';
    var got = _.entitySize( new BufferRaw( 10 ) );
    test.identical( got, 10 );

    test.case = 'BufferView';
    var got = _.entitySize( new BufferView( new BufferRaw( 10 ) ) );
    test.identical( got, 10 );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'BufferNode';
      var got1 = _.entitySize( BufferNode.from( [ 1, 2, 3, 4 ] ) );
      test.identical( got1, 4 );
    }

    test.case = 'Set';
    var got = _.entitySize( new Set( [ 1, 2, undefined, 4 ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'map';
    var got = _.entitySize( { a : 1, b : 2, c : 'str' } );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'HashMap';
    var got = _.entitySize( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'function';
    var got = _.entitySize( function(){} );
    test.identical( got, 8 );

    test.case = 'instance of class';
    function Constr1()
    {
      this.a = 34;
      this.b = 's';
      this[ 100 ] = 'sms';
    };
    var got = _.entitySize( new Constr1() );
    test.identical( got, 8 );

    test.case = 'object, some properties are non enumerable';
    var src = Object.create( null );
    var o =
    {
      'property3' :
      {
        enumerable : true,
        value : 'World',
        writable : true
      }
    };
    Object.defineProperties( src, o );
    var got = _.entitySize( src );
    var exp = NaN;
    test.identical( got, exp );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entitySize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entitySize( 1, 2 ) );
  test.shouldThrowErrorSync( () => _.entitySize( 1, 'extra' ) );
}

// //
//
// function iterableIs( test )
// {
//   test.case = 'without argument';
//   var got = _.iterableIs();
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'undefined';
//   var got = _.iterableIs( undefined );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'null';
//   var got = _.iterableIs( null );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'false';
//   var got = _.iterableIs( false );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'empty string';
//   var got = _.iterableIs( '' );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'zero';
//   var got = _.iterableIs( 0 );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'NaN';
//   var got = _.iterableIs( NaN );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a boolean';
//   var got = _.iterableIs( true );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a number';
//   var got = _.iterableIs( 13 );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a function';
//   var got = _.iterableIs( function() {} );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'constructor';
//   function Constr( x )
//   {
//     this.x = x;
//     return this;
//   }
//   var got = _.iterableIs( new Constr( 0 ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a string';
//   var got = _.iterableIs( 'str' );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an array';
//   var got = _.iterableIs( [] );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an unroll';
//   var got = _.iterableIs( _.unrollMake( [ 1 ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an argumentsArray';
//   var got = _.iterableIs( _.argumentsArray.make( [ 1 ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'BufferRaw';
//   var got = _.iterableIs( new BufferRaw( 5 ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'BufferView';
//   var got = _.iterableIs( new BufferView( new BufferRaw( 5 ) ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'BufferTyped';
//   var got = _.iterableIs( new U8x( 5 ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.case = 'BufferNode';
//     var got1 = _.iterableIs( BufferNode.alloc( 5 ) );
//     var expected1 = true;
//     test.identical( got1, expected1 );
//   }
//
//   test.case = 'Set';
//   var got = _.iterableIs( new Set( [ 5 ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'Map';
//   var got = _.iterableIs( new Map( [ [ 1, 2 ] ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'pure empty map';
//   var got = _.iterableIs( Object.create( null ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'pure map';
//   var src = Object.create( null );
//   src.x = 1;
//   var got = _.iterableIs( src );
//   var expected = true;
//   test.identical( got, expected );
//
//   // test.case = 'map from pure map'; /* qqq for Dmytro : resolve for complex object without constructors */
//   // var src = Object.create( Object.create( null ) );
//   // var got = _.iterableIs( src );
//   // var expected = true;
//   // test.identical( got, expected );
//
//   test.case = 'an empty object';
//   var got = _.iterableIs( {} );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an object';
//   var got = _.iterableIs( { a : 7, b : 13 } );
//   var expected = true;
//   test.identical( got, expected );
// }

//

function methodIteratorOf( test )
{
  test.case = 'without argument';
  var got = _.entity.methodIteratorOf();
  var expected = false;
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.entity.methodIteratorOf( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.entity.methodIteratorOf( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.entity.methodIteratorOf( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.entity.methodIteratorOf( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.entity.methodIteratorOf( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.entity.methodIteratorOf( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.entity.methodIteratorOf( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.entity.methodIteratorOf( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.entity.methodIteratorOf( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = constr;
  function constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.entity.methodIteratorOf( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var src = 'str';
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an array';
  var src = [];
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an unroll';
  var src = _.unrollMake( 1 );
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an argumentsArray';
  var src = _.argumentsArray.make( 1 );
  var got = _.entity.methodIteratorOf( _.argumentsArray.make( [ 1 ] ) );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.entity.methodIteratorOf( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.entity.methodIteratorOf( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped';
  var src = new U8x([ 5 ]);
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var src = BufferNode.alloc( 3 );
    let got = _.entity.methodIteratorOf( src );
    var expected = src[ _.entity.iteratorSymbol ];
    test.identical( got, expected );
  }

  test.case = 'Set';
  var src = new Set([ 5 ]);
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'Map';
  var src = new Map([ [ 1, 2 ] ]);
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.entity.methodIteratorOf( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.entity.methodIteratorOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.entity.methodIteratorOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.entity.methodIteratorOf( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.entity.methodIteratorOf( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );
}

//

function methodEqualOf( test )
{
  test.case = 'without argument';
  var got = _.entity.methodEqualOf();
  var expected = false;
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.entity.methodEqualOf( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.entity.methodEqualOf( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.entity.methodEqualOf( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.entity.methodEqualOf( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.entity.methodEqualOf( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.entity.methodEqualOf( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.entity.methodEqualOf( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.entity.methodEqualOf( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.entity.methodEqualOf( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = constr;
  function constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.entity.methodEqualOf( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.entity.methodEqualOf( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.entity.methodEqualOf( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an unroll';
  var got = _.entity.methodEqualOf( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an argumentsArray';
  var got = _.entity.methodEqualOf( _.argumentsArray.make( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.entity.methodEqualOf( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.entity.methodEqualOf( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped';
  var got = _.entity.methodEqualOf( new U8x( 5 ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    let got = _.entity.methodEqualOf( BufferNode.alloc( 5 ) );
    let expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.entity.methodEqualOf( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.entity.methodEqualOf( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.entity.methodEqualOf( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.entity.methodEqualOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.entity.methodEqualOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.entity.methodEqualOf( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.entity.methodEqualOf( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'map with routine under symbol equalAreSymbol';
  var equivalentAre = ( e1, e2 ) => e1 === e2;
  var src = {};
  src[ _.entity.equalAreSymbol ] = equivalentAre;
  var got = _.entity.methodEqualOf( src );
  test.identical( got, equivalentAre );

  test.case = 'object with routine under symbol equalAreSymbol';
  var equivalentAre = ( e1, e2 ) => e1 === e2;
  function Constr1()
  {
    this.x = 2;
    this[ _.entity.equalAreSymbol ] = equivalentAre;
    return this;
  };
  var src = new Constr1();
  var got = _.entity.methodEqualOf( src );
  test.identical( got, equivalentAre );
}

//

let Self =
{

  name : 'Tools.Entity',
  silencing : 1,

  tests :
  {
    entityIdenticalShallowBasic,
    entityIdenticalShallowAllTypes,
    entityEquivalentShallowBasic,
    entityEquivalentShallowAllTypes,
    entityEquivalentNotIdentical,

    // entityMakeConstructing,
    // entityMakeConstructingArgumentsArray,
    // entityMakeConstructingBufferTyped,
    // entityMakeConstructingLongDescriptor,
    // entityMakeConstructingArgumentsArrayLongDescriptor,
    // entityMakeConstructingBufferTypedLongDescriptor,

    entityMakeEmpty,
    entityMakeEmptyLongDescriptor,

    entityMakeUndefined,
    entityMakeUndefinedLongDescriptor,

    entityMake,
    entityMakeLongDescriptor,

    entityEntityEqualize,

    entityAssign,
    entityAssignFieldFromContainer,

    entityLengthOf,
    uncountableSize,
    entitySize,
    // iterableIs,
    methodIteratorOf,
    methodEqualOf,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
