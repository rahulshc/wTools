( function _Err_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
  // _.include( 'wLooker' );
}

var _ = _global_.wTools;

// --
// tests
// --

function diagnosticStructureGenerate( test )
{

  test.case = 'implicity call';
  var got = _.diagnosticStructureGenerate();
  test.is( _.mapIs( got.structure ) );
  test.identical( got.structure[ 'number.big' ], 1 << 30 );
  test.is( _.numberIs( got.size ) );

  test.case = 'defaultComplexity : 5, depth : 3';
  var got = _.diagnosticStructureGenerate({ defaultComplexity : 5, depth : 3 });
  test.is( _.mapIs( got.structure ) );
  test.is( _.hashMapIs( got.structure.hashmap ) );
  test.is( _.setIs( got.structure.set ) );

}
diagnosticStructureGenerate.timeOut = 30000;

// --
// declare
// --

var Self =
{

  name : 'Tools.base.Err',
  silencing : 1,

  tests :
  {

    diagnosticStructureGenerate,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
