( function _Primitive_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../../Tools.s' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --


function is( test )
{
  test.case = 'without argument';
  var got = _.primitive.is();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.primitive.is( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.primitive.is( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.primitive.is( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.primitive.is( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.primitive.is( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.primitive.is( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.primitive.is( NaN );
  test.identical( got, true );

  test.case = 'check Symbol';
  var got = _.primitive.is( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.primitive.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.primitive.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.primitive.is( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.primitive.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.primitive.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.primitive.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.primitive.is( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.primitive.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.primitive.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.primitive.is( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.primitive.is( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.primitive.is( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.primitive.is( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.primitive.is( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.primitive.is( src );
  test.identical( got, false );
}

//

function areIdenticalShallow( test )
{
  test.open( 'identical' );

  test.case = 'null';
  var got = _.primitive.identicalShallow( null, null );
  test.identical( got, true );

  test.case = 'undefined';
  var got = _.primitive.identicalShallow( undefined, undefined );
  test.identical( got, true );

  test.case = 'symbol _.nothing';
  var got = _.primitive.identicalShallow( _.nothing, _.nothing );
  test.identical( got, true );

  test.case = 'empty string';
  var got = _.primitive.identicalShallow( '', '' );
  test.identical( got, true );

  test.case = 'non-empty string';
  var got = _.primitive.identicalShallow( 'aa', 'aa' );
  test.identical( got, true );

  test.case = 'number';
  var got = _.primitive.identicalShallow( 1, 1 );
  test.identical( got, true );

  test.case = 'zero';
  var got = _.primitive.identicalShallow( 0, 0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.primitive.identicalShallow( NaN, NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.primitive.identicalShallow( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'BigInt';
  var got = _.primitive.identicalShallow( 10n, 10n );
  test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.identicalShallow( true, true );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'null - undefined';
  var got = _.primitive.identicalShallow( null, undefined );
  test.identical( got, false );

  test.case = 'symbols _.nothing - _.null';
  var got = _.primitive.identicalShallow( _.nothing, _.null );
  test.identical( got, false );

  test.case = 'empty string - non-empty';
  var got = _.primitive.identicalShallow( '', 'a' );
  test.identical( got, false );

  test.case = 'non-empty strings';
  var got = _.primitive.identicalShallow( 'aa', 'aab' );
  test.identical( got, false );

  test.case = 'numbers';
  var got = _.primitive.identicalShallow( 1, 2 );
  test.identical( got, false );

  test.case = '-0 and +0';
  var got = _.primitive.identicalShallow( -0, +0 );
  test.identical( got, false );

  test.case = 'NaN - number';
  var got = _.primitive.identicalShallow( NaN, 1 );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.primitive.identicalShallow( -Infinity, Infinity );
  test.identical( got, false );

  test.case = 'BigInt';
  var got = _.primitive.identicalShallow( 10n, 9n );
  test.identical( got, false );

  test.case = 'same BigInt and number';
  var got = _.primitive.identicalShallow( 10n, 10 );
  test.identical( got, false );

  test.case = 'Bool';
  var got = _.primitive.identicalShallow( true, false );
  test.identical( got, false );

  test.case = 'non primitives 1 arg';
  var got = _.primitive.identicalShallow( 1, { a : 1 } );
  test.identical( got, false );
  var got = _.primitive.identicalShallow( { a : 1 }, 1 );
  test.identical( got, false );
  var got = _.primitive.identicalShallow( [ 1 ], 1 );
  test.identical( got, false );

  test.case = 'non primitives';
  var got = _.primitive.identicalShallow( {}, {} );
  test.identical( got, false );

  test.close( 'not identical' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( () => _.primitive.identicalShallow() )

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.primitive.identicalShallow( 1, 1, 1 ) )

}

//

function areEquivalentShallow( test )
{
  test.open( 'identical' );

  test.case = 'null';
  var got = _.primitive.equivalentShallow( null, null );
  test.identical( got, true );

  test.case = 'undefined';
  var got = _.primitive.equivalentShallow( undefined, undefined );
  test.identical( got, true );

  test.case = 'symbol _.nothing';
  var got = _.primitive.equivalentShallow( _.nothing, _.nothing );
  test.identical( got, true );

  test.case = 'empty string';
  var got = _.primitive.equivalentShallow( '', '' );
  test.identical( got, true );

  test.case = 'non-empty string';
  var got = _.primitive.equivalentShallow( 'aa', 'aa' );
  test.identical( got, true );

  /* ?? */
  // test.case = 'string with spaces and non-empty string';
  // var got = _.primitive.equivalentShallow( ' aa ', 'aa' );
  // test.identical( got, true );

  test.case = 'number & boolLike';
  var got = _.primitive.equivalentShallow( 1, 1 );
  test.identical( got, true );

  test.case = 'number & number with accuracy';
  var got = _.primitive.equivalentShallow( 1, 2, 1 );
  test.identical( got, true );

  test.case = 'zero';
  var got = _.primitive.equivalentShallow( 0, 0 );
  test.identical( got, true );

  test.case = '-0 and +0';
  var got = _.primitive.equivalentShallow( -0, +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.primitive.equivalentShallow( NaN, NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.primitive.equivalentShallow( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'BigInt';
  var got = _.primitive.equivalentShallow( 10n, 10n );
  test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.equivalentShallow( true, true );
  test.identical( got, true );

  test.case = 'Bool and bollLike';
  var got = _.primitive.equivalentShallow( true, 1 );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'null - undefined';
  var got = _.primitive.equivalentShallow( null, undefined );
  test.identical( got, false );

  test.case = 'symbols _.nothing - _.null';
  var got = _.primitive.equivalentShallow( _.nothing, _.null );
  test.identical( got, false );

  test.case = 'empty string - non-empty';
  var got = _.primitive.equivalentShallow( '', 'a' );
  test.identical( got, false );

  test.case = 'non-empty strings';
  var got = _.primitive.equivalentShallow( 'aa', 'aab' );
  test.identical( got, false );

  test.case = 'numbers';
  var got = _.primitive.equivalentShallow( 1, 2 );
  test.identical( got, false );

  test.case = 'NaN - number';
  var got = _.primitive.equivalentShallow( NaN, 1 );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.primitive.equivalentShallow( -Infinity, Infinity );
  test.identical( got, false );

  // test.case = 'BigInt';
  // var got = _.primitive.equivalentShallow( 10n, 9n );
  // test.identical( got, false );

  // test.case = 'same BigInt and number';
  // var got = _.primitive.equivalentShallow( 10n, 10 );
  // test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.equivalentShallow( true, false );
  test.identical( got, false );

  test.case = 'Bool and bollLike';
  var got = _.primitive.equivalentShallow( true, 0 );
  test.identical( got, false );

  test.close( 'not identical' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( () => _.primitive.equivalentShallow() )

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.primitive.equivalentShallow( 1, 1, 1, 1 ) )

  test.case = 'non primitive arguments';
  test.shouldThrowErrorSync( () => _.primitive.equivalentShallow( {}, {} ) )
}

//

function exportStringShallowCode( test )
{

  test.case = 'Number';
  var src = 10;
  var expected = '10';
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'string';
  var src = 'string';
  var expected = '\'string\'';
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'bool';
  var src = true;
  var expected = 'true';
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'bigInt';
  var src = 10n;
  var expected = '10n';
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol( a )';
  var src = Symbol( 'a' );
  var expected = `Symbol.for( 'a' )`;
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );

  test.case = 'Symbol.for( a )';
  var src = Symbol.for( 'a' );
  var expected = `Symbol.for( 'a' )`;
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  /* error eslint : Symbol(), passes */
  // test.case = 'Symbol()';
  // var src = Symbol();
  // var expected = `Symbol.for()`;
  // var got = _.primitive.exportStringShallowCode( src );
  // test.identical( got, expected );

  test.case = 'Symbol.for()';
  var src = Symbol.for();
  var expected = `Symbol.for( 'undefined' )`;
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = `Symbol.for( 'null' )`;
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = `Symbol.for( 'undefined' )`;
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = `Symbol.for( 'nothing' )`;
  var got = _.primitive.exportStringShallowCode( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.primitive.exportStringShallowCode() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.primitive.exportStringShallowCode( {} ) );

  /* - */

  function strToPrimitive( string )
  {
    return Function(`return ${string}`)();
  }
}

//

function exportStringShallowDiagnostic( test )
{

  test.case = 'Number';
  var src = 10;
  var expected = '10';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'string';
  var src = 'string';
  var expected = 'string';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'bool';
  var src = true;
  var expected = 'true';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'bigInt';
  var src = 10n;
  var expected = '10n';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Symbol( a )';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Symbol.for( a )';
  var src = Symbol.for( 'a' );
  var expected = '{- Symbol a -}';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  /* error eslint : Symbol(), passes */
  // test.case = 'Symbol()';
  // var src = Symbol();
  // var expected = '{- Symbol -}';
  // var got = _.primitive.exportStringShallowDiagnostic( src );
  // test.identical( got, expected );

  test.case = 'Symbol.for()';
  var src = Symbol.for();
  var expected = '{- Symbol undefined -}';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = '{- Symbol null -}';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  var got = _.primitive.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.primitive.exportStringShallowDiagnostic() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.primitive.exportStringShallowDiagnostic( {} ) );
}


// --
// declaration
// --

const Proto =
{

  name : 'Tools.Primitive',
  silencing : 1,

  tests :
  {
    is,
    areIdenticalShallow,
    areEquivalentShallow,

    exportStringShallowCode,
    exportStringShallowDiagnostic
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
