( function _l0_l1_Buffer_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// declaration
// --

function is( test )
{
  test.case = 'Int32Array';
  var got = _.bufferTyped.is( new I32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Float32Array';
  var got = _.bufferTyped.is( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Big int 64 array';
  var got = _.bufferTyped.is( new I64x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'Uint8ClampedArray';
  var got = _.bufferTyped.is( new U8xClamped( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'shared array buffer';
  var got = _.bufferTyped.is( new BufferRawShared( 1024 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.bufferTyped.is( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.bufferTyped.is( 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.bufferTyped.is( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Buffer Node';
  var got = _.bufferTyped.is( BufferNode.alloc( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.bufferTyped.is( [ 1, 2, 3 ] );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'arguments array';
  var got = _.bufferTyped.is( arguments );
  var expected = false;
  test.identical( got, expected );
}

const Proto =
{

  name : 'Tools.BufferTyped.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // bufferTyped, l0/l1
    is
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
