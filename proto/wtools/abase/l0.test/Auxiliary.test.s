( function _Auxiliary_test_s_()
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

function is( test )
{
  test.case = 'undefined';
  var src = undefined;
  test.identical( _.aux.is( src ), false );

  test.case = 'null';
  var src = null;
  test.identical( _.aux.is( src ), false );

  test.case = 'string';
  var src = 'str';
  test.identical( _.aux.is( src ), false );

  test.case = 'number';
  var src = 13;
  test.identical( _.aux.is( src ), false );

  test.case = 'symbol';
  var src = Symbol.for( 'a' );
  test.identical( _.aux.is( src ), false );

  test.case = 'boolean false';
  var src = true;
  test.identical( _.aux.is( src ), false );

  test.case = 'boolean true';
  var src = true;
  test.identical( _.aux.is( src ), false );

  test.case = 'empty array';
  var src = [];
  test.identical( _.aux.is( src ), false );

  test.case = 'date';
  var src = new Date();
  test.identical( _.aux.is( src ), false );

  test.case = 'empty arguments array';
  var src = _.argumentsArray.make();
  test.identical( _.aux.is( false ), false );

  test.case = 'pure empty map';
  var src = Object.create( null );
  test.identical( _.aux.is( src ), true );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  test.identical( _.aux.is( src ), true );

  test.case = 'pure map with constructor';
  var src = Object.create( null );
  test.identical( _.aux.is( src ), true );

  test.case = 'from pure with iterator';
  var src = Object.create( null );
  src[ Symbol.iterator ] = function(){};
  test.identical( _.aux.is( src ), false );

  test.case = 'empty polluted map';
  var src = {};
  test.identical( _.aux.is( src ), true );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  test.identical( _.aux.is( src ), true );

  test.case = 'polluted map with constructor';
  var src = {};
  test.identical( _.aux.is( src ), true );

  test.case = 'from polluted with iterator';
  var src = {};
  src[ Symbol.iterator ] = function(){};
  test.identical( _.aux.is( src ), false );

  test.case = 'new object';
  var src = new Object();
  test.identical( _.aux.is( src ), true );

  test.case = 'routine';
  var src = routine;
  test.identical( _.aux.is( src ), false );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map with constructor';
  var prototype = {};
  prototype.constructor = function(){}
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), false );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.aux.is( src ), true );

  /* - */

  function routine () {}

}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Auxiliary',
  silencing : 1,

  tests :
  {
    is,
  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
