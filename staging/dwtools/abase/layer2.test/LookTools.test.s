( function _Look_tools_test_s_() {

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

  var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _global = _global_;
var _ = _global_.wTools;

// --
// tests
// --

function look( test )
{

  var structure1 =
  {
    a : 1,
    b : 's',
    c : [ 1,3 ],
    d : [ 1,{ date : new Date() } ],
    e : function(){},
    f : new ArrayBuffer( 13 ),
    g : new Float32Array([ 1,2,3 ]),
  }

  var expectedUpPaths = [ '/', '/a', '/b', '/c', '/c/0', '/c/1', '/d', '/d/0', '/d/1', '/d/1/date', '/e', '/f', '/g' ];
  var expectedDownPaths = [ '/a', '/b', '/c/0', '/c/1', '/c', '/d/0', '/d/1/date', '/d/1', '/d', '/e', '/f', '/g', '/' ];

  var gotUpPaths = [];
  var gotDownPaths = [];

  function handleUp1( it )
  {
    gotUpPaths.push( it.path );
  }

  function handleDown1( it )
  {
    gotDownPaths.push( it.path );
  }

  _.look( structure1, handleUp1, handleDown1 );

  test.identical( gotUpPaths, expectedUpPaths );
  test.identical( gotDownPaths, expectedDownPaths );

}

// --
// declare
// --

var Self =
{

  name : 'Tools.Base.Look',
  silencing : 1,

  context :
  {
  },

  tests :
  {
    look : look,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

})();
