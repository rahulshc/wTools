( function _Typing_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _global = _global_; var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _global = _global_; var _ = _global_.wTools;

//

function objectLike( t )
{
  debugger;

  t.description = 'array-like entities should not overlap with array-like entities set';

  t.identical( _.objectLike( new ArrayBuffer( 10 ) ),false );
  t.identical( _.objectLike( new Float32Array( 10 ) ),false );
  t.identical( _.objectLike( new Int32Array( 10 ) ),false );
  t.identical( _.objectLike( new DataView( new ArrayBuffer( 10 ) ) ),false );
  t.identical( _.objectLike( new Array( 10 ) ),false );
  t.identical( _.objectLike( [ 1,2,3 ] ),false );
  t.identical( _.objectLike( new Map ),false );

  t.description = 'this entities are object-like';

  t.identical( _.objectLike( new Object() ),true );
  t.identical( _.objectLike( {} ),true );
  t.identical( _.objectLike( Object.create( null ) ),true );

  debugger;
}

//

function promiseIs( test )
{
  test.description = 'check if entity is a Promise';

  test.shouldBe( !_.promiseIs() );
  test.shouldBe( !_.promiseIs( {} ) );

  var _Promise = function Promise(){};
  test.shouldBe( !_.promiseIs( new _Promise() ) );

  test.shouldBe( _.promiseIs( Promise.resolve( 0 ) ) );

  var promise = new Promise( ( resolve, reject ) => { resolve( 0 ) } )
  test.shouldBe( _.promiseIs( promise ) );
}

//

function consequenceLike( test )
{
  test.description = 'check if entity is a consequenceLike';

  if( !_.consequenceLike )
  return test.identical( true,true );

  test.shouldBe( !_.consequenceLike() );
  test.shouldBe( !_.consequenceLike( {} ) );
  if( _.Consequence )
  {
    test.shouldBe( _.consequenceLike( new _.Consequence() ) );
    test.shouldBe( _.consequenceLike( _.Consequence() ) );
  }
  test.shouldBe( _.consequenceLike( Promise.resolve( 0 ) ) );

  var promise = new Promise( ( resolve, reject ) => { resolve( 0 ) } )
  test.shouldBe( _.consequenceLike( promise ) );
  test.shouldBe( _.consequenceLike( wConsequence.from( promise ) ) );

}

//

var Self =
{

  name : 'wTools/Typing',
  silencing : 1,
  // verbosity : 9,

  tests :
  {

    objectLike : objectLike,
    promiseIs : promiseIs,
    consequenceLike : consequenceLike

  }

}

//

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
