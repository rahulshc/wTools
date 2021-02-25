( function _Primitive_test_s_()
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


function primitiveIs( test )
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

function primitivesAreIdenticalShallow( test )
{
  test.open( 'identical' );

  test.case = 'null';
  var got = _.primitive.s.areIdenticalShallow( null, null );
  test.identical( got, true );

  test.case = 'undefined';
  var got = _.primitive.s.areIdenticalShallow( undefined, undefined );
  test.identical( got, true );

  test.case = 'symbol _.nothing';
  var got = _.primitive.s.areIdenticalShallow( _.nothing, _.nothing );
  test.identical( got, true );

  test.case = 'empty string';
  var got = _.primitive.s.areIdenticalShallow( '', '' );
  test.identical( got, true );

  test.case = 'non-empty string';
  var got = _.primitive.s.areIdenticalShallow( 'aa', 'aa' );
  test.identical( got, true );

  test.case = 'number';
  var got = _.primitive.s.areIdenticalShallow( 1, 1 );
  test.identical( got, true );

  test.case = 'zero';
  var got = _.primitive.s.areIdenticalShallow( 0, 0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.primitive.s.areIdenticalShallow( NaN, NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.primitive.s.areIdenticalShallow( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'BigInt';
  var got = _.primitive.s.areIdenticalShallow( 10n, 10n );
  test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.s.areIdenticalShallow( true, true );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'null - undefined';
  var got = _.primitive.s.areIdenticalShallow( null, undefined );
  test.identical( got, false );

  test.case = 'symbols _.nothing - _.null';
  var got = _.primitive.s.areIdenticalShallow( _.nothing, _.null );
  test.identical( got, false );

  test.case = 'empty string - non-empty';
  var got = _.primitive.s.areIdenticalShallow( '', 'a' );
  test.identical( got, false );

  test.case = 'non-empty strings';
  var got = _.primitive.s.areIdenticalShallow( 'aa', 'aab' );
  test.identical( got, false );

  test.case = 'numbers';
  var got = _.primitive.s.areIdenticalShallow( 1, 2 );
  test.identical( got, false );

  test.case = '-0 and +0';
  var got = _.primitive.s.areIdenticalShallow( -0, +0 );
  test.identical( got, false );

  test.case = 'NaN - number';
  var got = _.primitive.s.areIdenticalShallow( NaN, 1 );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.primitive.s.areIdenticalShallow( -Infinity, Infinity );
  test.identical( got, false );

  test.case = 'BigInt';
  var got = _.primitive.s.areIdenticalShallow( 10n, 9n );
  test.identical( got, false );

  test.case = 'same BigInt and number';
  var got = _.primitive.s.areIdenticalShallow( 10n, 10 );
  test.identical( got, false );

  test.case = 'Bool';
  var got = _.primitive.s.areIdenticalShallow( true, false );
  test.identical( got, false );

  test.close( 'not identical' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( () => _.primitive.s.areIdenticalShallow() )

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.primitive.s.areIdenticalShallow( 1, 1, 1 ) )

  test.case = 'non primitive arguments';
  test.shouldThrowErrorSync( () => _.primitive.s.areIdenticalShallow({}) )
}

//

// --
// declaration
// --

var Self =
{

  name : 'Tools.Primitive',
  silencing : 1,

  tests :
  {
    primitiveIs,
    primitivesAreIdenticalShallow,
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
