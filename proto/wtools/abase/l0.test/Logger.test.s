( function _Logger_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  const _ = require( '../../Tools.s' );
  _.include( 'wTesting' );

}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function bisector( test )
{

  test.true( !_.logger.is( console ) );
  test.true( _.logger.like( console ) );

  test.true( !_.logger.is( _globals_.testing.logger ) );
  test.true( _.logger.like( _globals_.testing.logger ) );

  test.true( __.logger.is( _globals_.testing.logger ) );
  test.true( __.logger.like( _globals_.testing.logger ) );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Logger',
  silencing : 1,

  tests :
  {

    bisector,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
