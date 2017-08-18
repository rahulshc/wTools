( function _Typing_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  try
  {
    require( '../../abase/wTools.s' );
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;

  _.include( 'wTesting' );

}

var _ = wTools;

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

var Self =
{

  name : 'wTools.Typing',
  silencing : 1,
  // verbosity : 9,

  tests :
  {

    objectLike : objectLike,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
