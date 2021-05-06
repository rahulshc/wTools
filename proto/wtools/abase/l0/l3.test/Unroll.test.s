( function _l0_l3_Unroll_test_s_( )
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// unroll
// --

function bulky( test )
{

  test.case = 'unroll from empty array';
  var src = [];
  var got = _.unroll.make( src );
  test.true( _.unroll.is( got ) );
  test.true( _.array.is( got ) );
  test.true( src !== got );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Unroll.l0.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    bulky,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
