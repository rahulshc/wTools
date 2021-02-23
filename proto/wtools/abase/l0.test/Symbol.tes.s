( function _Symbol_test_s_()
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


function symbolIs( test )
{
  test.case = 'without argument';
  var got = _.symbol.is();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.symbol.is( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.symbol.is( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.symbol.is( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.symbol.is( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.symbol.is( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.symbol.is( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.symbol.is( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.symbol.is( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.symbol.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.symbol.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.symbol.is( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.symbol.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.symbol.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.symbol.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.symbol.is( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.symbol.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.symbol.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.symbol.is( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.symbol.is( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.symbol.is( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.symbol.is( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.symbol.is( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.symbol.is( src );
  test.identical( got, false );
}


// --
// declaration
// --

var Self =
{

  name : 'Tools.Symbol',
  silencing : 1,

  tests :
  {
    symbolIs,
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
