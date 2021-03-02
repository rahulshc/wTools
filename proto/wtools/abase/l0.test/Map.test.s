( function _Map_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

//--
// map checker
//--

/* qqq : use test.true() instead of test.identical() */
function typingBasic( test ) /* qqq : extend with construbile* checks */
{

  test.case = 'pure empty map';
  var src = Object.create( null );
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), true );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), true );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), true );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'pure map with constructor';
  var src = Object.create( null );
  src.constructor = function(){};
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), true );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'from pure with iterator';
  var src = Object.create( null );
  src[ Symbol.iterator ] = function(){};
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'empty polluted map';
  var src = {};
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), true );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'polluted map with constructor';
  var src = {};
  src.constructor = function(){};
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'from polluted with iterator';
  var src = {};
  src[ Symbol.iterator ] = function(){};
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'new object';
  var src = new Object();
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), true );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'empty array';
  var src = [];
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'empty arguments array';
  var src = _.argumentsArray.make();
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'undefined';
  var src = undefined;
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'null';
  var src = null;
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'string';
  var src = 'str';
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'number';
  var src = 13;
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'symbol';
  var src = Symbol.for( 'a' );
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'boolean false';
  var src = true;
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'boolean true';
  var src = true;
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'routine';
  var src = function() {};
  test.identical( _.object.is( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from polluted map with constructor';
  var prototype = {};
  prototype.constructor = function(){}
  var src = Object.create( prototype );
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.object.is( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.mapIsEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.mapIsPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), true );

}

// --
//
// --

function mapCloneAssigning( test )
{

  test.case = 'an Example';
  function Example()
  {
    this.name = 'Peter';
    this.age = 27;
  };
  var srcMap = new Example();
  var dstMap = { sex : 'Male' };
  var got = _.mapCloneAssigning({ srcMap, dstMap });
  var expected = { sex : 'Male', name : 'Peter', age : 27 };
  test.true( dstMap === got );
  test.identical( _.mapExtend( null, got ), expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapCloneAssigning();
  });

  test.case = 'redundant argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapCloneAssigning( {}, {}, 'wrong arguments' );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.mapCloneAssigning( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapCloneAssigning( 'wrong arguments' );
  });

}

//

function mapExtend( test )
{
  test.open( 'first argument is null' );

  test.case = 'trivial';
  var src1 = { a : 1, b : 2 };
  var src1Copy = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var src2Copy = { c : 3, d : 4 };
  var got = _.mapExtend( null, src1, src2 );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.will = 'return';
  test.identical( got, expected );
  test.will = 'preserve src1';
  test.identical( src1, src1Copy );
  test.will = 'preserve src2';
  test.identical( src2, src2Copy );
  test.will = 'return not src1';
  test.true( got !== src1 );
  test.will = 'return not src2';
  test.true( got !== src2 );

  /* */

  test.case = 'rewriting';
  var src1 = { a : 1, b : 2 };
  var src1Copy = { a : 1, b : 2 };
  var src2 = { b : 22, c : 3, d : 4 };
  var src2Copy = { b : 22, c : 3, d : 4 };
  var got = _.mapExtend( null, src1, src2 );
  var expected = { a : 1, b : 22, c : 3, d : 4 };
  test.will = 'return';
  test.identical( got, expected );
  test.will = 'preserve src1';
  test.identical( src1, src1Copy );
  test.will = 'preserve src2';
  test.identical( src2, src2Copy );
  test.will = 'return not src1';
  test.true( got !== src1 );
  test.will = 'return not src2';
  test.true( got !== src2 );

  test.close( 'first argument is null' );

  /* - */

  test.open( 'first argument is dst' );

  test.case = 'trivial';
  var dst = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var src2Copy = { c : 3, d : 4 };
  var got = _.mapExtend( dst, src2 );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.will = 'return';
  test.identical( got, expected );
  test.will = 'preserve src2';
  test.identical( src2, src2Copy );
  test.will = 'return dst';
  test.true( got === dst );
  test.will = 'return not src2';
  test.true( got !== src2 );

  /* */

  test.case = 'rewriting';
  var dst = { a : 1, b : 2 };
  var src2 = { b : 22, c : 3, d : 4 };
  var src2Copy = { b : 22, c : 3, d : 4 };
  var got = _.mapExtend( dst, src2 );
  var expected = { a : 1, b : 22, c : 3, d : 4 };
  test.will = 'return';
  test.identical( got, expected );
  test.will = 'preserve src2';
  test.identical( src2, src2Copy );
  test.will = 'return not dst';
  test.true( got === dst );
  test.will = 'return not src2';
  test.true( got !== src2 );

  test.close( 'first argument is dst' );

  /* - */

  test.case = 'trivial, first argument';
  var src1 = { a : 7, b : 13 };
  var src1Copy = { a : 7, b : 13 };
  var src2 = { c : 3, d : 33 };
  var src2Copy = { c : 3, d : 33 };
  var got = _.mapExtend( src1, src2 );
  var expected = { a : 7, b : 13, c : 3, d : 33 };
  test.identical( got, expected );
  test.identical( src2, src2Copy );
  test.true( got === src1 );
  test.true( got !== src2 );

  test.case = 'complex, first argument is null';
  var src1 = { a : 1, b : 1, c : 1, z : 1 };
  var src1Copy = { a : 1, b : 1, c : 1, z : 1 };
  var src2 = { a : 2, c : 2, d : 2 };
  var src2Copy = { a : 2, c : 2, d : 2 };
  var src3 = { a : 3, b : 3, e : 3 };
  var src3Copy = { a : 3, b : 3, e : 3 };
  var got = _.mapExtend( null, src1, src2, src3 );
  var expected = { a : 3, b : 3, c : 2, d : 2, e : 3, z : 1 };
  test.identical( got, expected );
  test.identical( src1, src1Copy );
  test.identical( src2, src2Copy );
  test.identical( src3, src3Copy );
  test.true( got !== src1 );
  test.true( got !== src2 );
  test.true( got !== src3 );

  test.case = 'complex, first argument is not null';
  var src1 = { a : 1, b : 1, c : 1, z : 1 };
  var src1Copy = { a : 1, b : 1, c : 1, z : 1 };
  var src2 = { a : 2, c : 2, d : 2 };
  var src2Copy = { a : 2, c : 2, d : 2 };
  var src3 = { a : 3, b : 3, e : 3 };
  var src3Copy = { a : 3, b : 3, e : 3 };
  var got = _.mapExtend( src1, src2, src3 );
  var expected = { a : 3, b : 3, c : 2, d : 2, e : 3, z : 1 };
  test.identical( got, expected );
  test.identical( src2, src2Copy );
  test.identical( src3, src3Copy );
  test.true( got === src1 );
  test.true( got !== src2 );
  test.true( got !== src3 );

  test.case = 'extend pure map by empty strings, first argument is null';
  var src1 = Object.create( null );
  src1.a = '1';
  src1.b = '1';
  src1.c = '1';
  src1.z = '1';
  var src1Copy = Object.create( null );
  src1Copy.a = '1';
  src1Copy.b = '1';
  src1Copy.c = '1';
  src1Copy.z = '1';
  var src2 = Object.create( null );
  src2.a = '';
  src2.c = '';
  src2.d = '';
  src2.e = '2';
  var src2Copy = Object.create( null );
  src2Copy.a = '';
  src2Copy.c = '';
  src2Copy.d = '';
  src2Copy.e = '2';
  var got = _.mapExtend( null, src1, src2 );
  var expected = { a : '', b : '1', c : '', d : '', e : '2', z : '1' };
  test.identical( got, expected );
  test.identical( src1, src1Copy );
  test.identical( src2, src2Copy );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.case = 'extend pure map by empty strings, first argument is not null';
  var src1 = Object.create( null );
  src1.a = '1';
  src1.b = '1';
  src1.c = '1';
  src1.z = '1';
  var src1Copy = Object.create( null );
  src1Copy.a = '1';
  src1Copy.b = '1';
  src1Copy.c = '1';
  src1Copy.z = '1';
  var src2 = Object.create( null );
  src2.a = '';
  src2.c = '';
  src2.d = '';
  src2.e = '2';
  var src2Copy = Object.create( null );
  src2Copy.a = '';
  src2Copy.c = '';
  src2Copy.d = '';
  src2Copy.e = '2';
  var got = _.mapExtend( src1, src2 );
  var expected = { a : '', b : '1', c : '', d : '', e : '2', z : '1' };
  test.identical( got, expected );
  test.identical( src2, src2Copy );
  test.true( got === src1 );
  test.true( got !== src2 );

  test.case = 'object like array';
  var got = _.mapExtend( null, [ 3, 7, 13, 73 ] );
  var expected = { 0 : 3, 1 : 7, 2 : 13, 3 : 73 };
  test.identical( got, expected );

  /* */

  test.case = 'extend complex map by complex map';

  var dst = Object.create( null );
  dst.x1 = '1';
  dst.x2 = 2;
  dst = Object.create( dst );
  dst.x3 = 3;
  dst.x4 = 4;

  var src = Object.create( null );
  src.x1 = '11';
  src.y2 = 12;
  src = Object.create( src );
  src.x3 = 13;
  src.y4 = 14;

  var expected = Object.create( null );
  expected.x1 = '1';
  expected.x2 = 2;
  expected = Object.create( expected );
  expected.x4 = 4;
  expected.x1 = '11';
  expected.y2 = 12;
  expected.x3 = 13;
  expected.y4 = 14;

  var got = _.mapExtend( dst, src );
  test.identical( got.x1, '11' );
  test.identical( got.x2, 2 );
  test.identical( got.x3, 13 );
  test.identical( got.x4, 4 );
  test.identical( got.y2, 12 );
  test.identical( got.y4, 14 );
  test.identical( Object.getPrototypeOf( got ), { x1 : '1', x2 : 2 } );
  test.true( got === dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( () => _.mapExtend() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapExtend( {} ) );

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( () => _.mapExtend( [], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapExtend( undefined, {} ) );
}

//

function mapExtendConditional( test )
{

  test.case = 'an unique object';
  var got = _.mapExtendConditional( _.property.mapper.dstNotHas(), { a : 1, b : 2 }, { a : 1, c : 3 } );
  var expected = { a : 1, b : 2, c : 3 };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapExtendConditional();
  });

  test.case = 'few argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapExtendConditional( _.property.mapper.dstNotHas() );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.mapExtendConditional( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapExtendConditional( 'wrong arguments' );
  });

}

//

function mapExtendNotIdentical( test )
{
  test.case = 'basic';
  var prototype = Object.create( null );
  prototype.a = 1;
  prototype.b = 1;
  var dst = Object.create( prototype );
  dst.c = 1;
  dst.d = 1;
  var src = { a : 1, b : 2, c : 1, d : 2, e : 2 }
  var got = _.mapExtendNotIdentical( dst, src );

  var exp = { a : 1, b : 1 };
  test.identical( _.property.onlyOwn( prototype ), exp );

  var exp = { b : 2, c : 1, d : 2, e : 2 };
  test.identical( _.property.onlyOwn( dst ), exp );

  var exp = { a : 1, b : 2, c : 1, d : 2, e : 2 }
  test.identical( src, exp );

  /* */

  test.case = 'undefined';
  var prototype = Object.create( null );
  prototype.a = undefined;
  prototype.b = undefined;
  var dst = Object.create( prototype );
  dst.c = undefined;
  dst.d = undefined;
  var src = { a : undefined, b : 2, c : undefined, d : 2, e : undefined }
  var got = _.mapExtendNotIdentical( dst, src );

  var exp = { a : undefined, b : undefined };
  test.identical( _.property.onlyOwn( prototype ), exp );

  var exp = { b : 2, c : undefined, d : 2 };
  test.identical( _.property.onlyOwn( dst ), exp );

  var exp = { a : undefined, b : 2, c : undefined, d : 2, e : undefined }
  test.identical( src, exp );
}

//

function mapsExtend( test )
{
  test.open( 'first argument is null' );

  test.case = 'single src map is provided';
  var src1 = { a : 1, b : 2 };
  var got = _.mapsExtend( null, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.true( got !== src1 );

  /* */

  test.case = 'unical fields in maps';
  var src1 = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var got = _.mapsExtend( null, [ src1, src2 ] );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { c : 3, d : 4 } );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.case = 'srcMaps have same option, rewriting';
  var src1 = { a : 1, b : 2 };
  var src2 = { b : 22, c : 3, d : 4 };
  var got = _.mapsExtend( null, [ src1, src2 ] );
  var expected = { a : 1, b : 22, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { b : 22, c : 3, d : 4 } );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.close( 'first argument is null' );

  /* - */

  test.open( 'first argument is dst' );

  test.case = 'dst - empty map, single src map';
  var dst = {};
  var src1 = { a : 1, b : 2 };
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.true( got === dst );
  test.true( got !== src1 );

  /* */

  test.case = 'dst - empty map, unical values';
  var dst = {};
  var src1 = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.case = 'dst - empty map, srcMaps have same option, rewriting';
  var dst = {};
  var src1 = { a : 1, b : 2 };
  var src2 = { b : 22, c : 3, d : 4 };
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 1, b : 22, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { b : 22, c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  /* */

  test.case = 'dst - filled map, single src map, unical values';
  var dst = { a : 1 };
  var src1 = { b : 2, c : 3 };
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2, c : 3 };
  test.identical( got, expected );
  test.identical( src1, { b : 2, c : 3 } );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'dst - filled map, single src map has same option, rewriting';
  var dst = { a : 1 };
  var src1 = { a : 2, b : 3 };
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 2, b : 3 };
  test.identical( got, expected );
  test.identical( src1, { a : 2, b : 3 } );
  test.true( got === dst );
  test.true( got !== src1 );

  /* */

  test.case = 'dst - filled map, unical values';
  var dst = { a : 1 };
  var src1 = { b : 2, c : 3 };
  var src2 = { d : 4, e : 5 };
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 1, b : 2, c : 3, d : 4, e : 5 };
  test.identical( got, expected );
  test.identical( src1, { b : 2, c : 3 } );
  test.identical( src2, { d : 4, e : 5 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.case = 'dst - filled map, srcMaps have same option, rewriting by the last child';
  var dst = { a : 1 };
  var src1 = { a : 2, b : 3 };
  var src2 = { b : 4, c : 5 };
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 2, b : 4, c : 5 };
  test.identical( got, expected );
  test.identical( src1, { a : 2, b : 3 } );
  test.identical( src2, { b : 4, c : 5 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.close( 'first argument is dst' );

  /* - */

  test.open( 'extend by empty map' );

  test.case = 'dst - null, srcMaps - single empty map';
  var src1 = {};
  var got = _.mapsExtend( null, src1 );
  var expected = {};
  test.identical( got, expected );
  test.identical( src1, {} );
  test.true( got !== src1 );

  test.case = 'dst - null, srcMaps - several empty maps';
  var src1 = {};
  var src2 = {};
  var got = _.mapsExtend( null, [ src1, src2 ] );
  var expected = {};
  test.identical( got, expected );
  test.identical( src1, {} );
  test.identical( src2, {} );
  test.true( got !== src1 );
  test.true( got !== src2 );

  /* */

  test.case = 'dst - empty map, srcMaps - single empty map';
  var dst = {};
  var src1 = {};
  var got = _.mapsExtend( dst, src1 );
  var expected = {};
  test.identical( got, expected );
  test.identical( src1, {} );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'dst - empty map, srcMaps - several empty maps';
  var dst = {};
  var src1 = {};
  var src2 = {};
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = {};
  test.identical( got, expected );
  test.identical( src1, {} );
  test.identical( src2, {} );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  /* */

  test.case = 'dst - empty map, srcMaps - single empty map';
  var dst = { a : 1 };
  var src1 = {};
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.identical( src1, {} );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'dst - filled map, srcMaps - several empty maps';
  var dst = { a : 1 };
  var src1 = {};
  var src2 = {};
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.identical( src1, {} );
  test.identical( src2, {} );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.close( 'extend by empty map' );

  /* - */

  test.open( 'extend by prototyped map' );

  test.case = 'dst - null, srcMaps - single empty map';
  var prototype1 = { a : 1, b : 2 };
  var src1 = Object.create( prototype1 );
  var got = _.mapsExtend( null, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( Object.getPrototypeOf( src1 ), { a : 1, b : 2 } );
  test.true( got !== src1 );

  test.case = 'dst - null, srcMaps - several empty maps';
  var prototype1 = { a : 1, b : 2 };
  var src1 = Object.create( prototype1 );
  var prototype2 = { c : 3, d : 4 };
  var src2 = Object.create( prototype2 );
  var got = _.mapsExtend( null, [ src1, src2 ] );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( Object.getPrototypeOf( src1 ), { a : 1, b : 2 } );
  test.identical( Object.getPrototypeOf( src2 ), { c : 3, d : 4 } );
  test.true( got !== src1 );
  test.true( got !== src2 );

  /* */

  test.case = 'dst - empty map, srcMaps - single empty map';
  var dst = {};
  var prototype1 = { a : 1, b : 2 };
  var src1 = Object.create( prototype1 );
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( Object.getPrototypeOf( src1 ), { a : 1, b : 2 } );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'dst - empty map, srcMaps - several empty maps';
  var dst = {};
  var prototype1 = { a : 1, b : 2 };
  var src1 = Object.create( prototype1 );
  var prototype2 = { c : 3, d : 4 };
  var src2 = Object.create( prototype2 );
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( Object.getPrototypeOf( src1 ), { a : 1, b : 2 } );
  test.identical( Object.getPrototypeOf( src2 ), { c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  /* */

  test.case = 'dst - empty map, srcMaps - single empty map';
  var dst = { a : 1 };
  var prototype1 = { a : 1, b : 2 };
  var src1 = Object.create( prototype1 );
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( Object.getPrototypeOf( src1 ), { a : 1, b : 2 } );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'dst - filled map, srcMaps - several empty maps';
  var dst = { a : 1 };
  var prototype1 = { a : 2, b : 2 };
  var src1 = Object.create( prototype1 );
  var prototype2 = { c : 3, d : 4 };
  var src2 = Object.create( prototype2 );
  var got = _.mapsExtend( dst, [ src1, src2 ] );
  var expected = { a : 2, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( Object.getPrototypeOf( src1 ), { a : 2, b : 2 } );
  test.identical( Object.getPrototypeOf( src2 ), { c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.close( 'extend by prototyped map' );

  /* - */

  test.open( 'null prototyped map extesion' );

  test.case = 'srcMaps - simple map';
  var dst = Object.create( null );
  dst.a = 0;
  var src1 = { a : 1, b : 2 };
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'srcMaps - map with prototype';
  var dst = Object.create( null );
  dst.a = 0;
  var prototype1 = { a : 1, b : 2 };
  var src1 = Object.create( prototype1 );
  src1.c = 3;
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2, c : 3 };
  test.identical( got, expected );
  test.identical( src1.c, 3 );
  test.identical( Object.getPrototypeOf( src1 ), { a : 1, b : 2 } );
  test.true( got === dst );
  test.true( got !== src1 );

  test.case = 'srcMaps - null prototyped map';
  var dst = Object.create( null );
  dst.a = 0;
  var src1 = Object.create( null );
  src1.a = 1;
  src1.b = 2;
  var got = _.mapsExtend( dst, src1 );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.true( got === dst );
  test.true( got !== src1 );

  test.close( 'null prototyped map extesion' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.mapsExtend() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapsExtend( {} ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapsExtend( {}, {}, {} ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.mapsExtend( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapsExtend( undefined, {} ) );

  test.case = 'wrong type of srcMaps';
  test.shouldThrowErrorSync( () => _.mapsExtend( {}, 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapsExtend( {}, [ 'wrong' ] ) );
}

//

function mapsExtendWithVectorsInSrcMaps( test )
{
  test.case = 'srcMaps - argumentsArray';
  var dst = {};
  var src1 = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var srcMaps = _.argumentsArray.make([ src1, src2 ]);
  var got = _.mapsExtend( dst, srcMaps );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.case = 'srcMaps - unroll';
  var dst = {};
  var src1 = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var srcMaps = _.unrollMake([ src1, src2 ]);
  var got = _.mapsExtend( dst, srcMaps );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );

  test.case = 'srcMaps - ContainerAdapter';
  var dst = {};
  var src1 = { a : 1, b : 2 };
  var src2 = { c : 3, d : 4 };
  var srcMaps = _.containerAdapter.make([ src1, src2 ]);
  var got = _.mapsExtend( dst, srcMaps );
  var expected = { a : 1, b : 2, c : 3, d : 4 };
  test.identical( got, expected );
  test.identical( src1, { a : 1, b : 2 } );
  test.identical( src2, { c : 3, d : 4 } );
  test.true( got === dst );
  test.true( got !== src1 );
  test.true( got !== src2 );
}

//

function mapSupplement( test )
{

  test.case = 'an object';
  var got = _.mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
  var expected = { a : 1, b : 2, c : 3 };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapSupplement();
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapSupplement( 'wrong arguments' );
  });

}

//

function mapComplement( test )
{

  test.case = 'an object';
  var got = _.mapComplement( { a : 1, b : 'ab' }, { a : 12, c : 3 } );
  var expected = { a : 1, b : 'ab', c : 3 };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapComplement();
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.mapComplement( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapComplement( 'wrong arguments' );
  });

}

//

function mapMake( test )
{
  test.case = 'without arguments';
  var got = _.mapMake();
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );

  test.case = 'src - null';
  var got = _.mapMake( null );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );

  test.case = 'src - undefined';
  var got = _.mapMake( undefined );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );

  /* */

  test.case = 'src - empty map';
  var src = {};
  var got = _.mapMake( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - not pure map';
  var src = { a : 7, b : 13 };
  var got = _.mapMake( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var src = Object.create( null );
  var got = _.mapMake( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - pure map';
  var src = Object.create( { a : 7, b : 13 } );
  var got = _.mapMake( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - empty Map';
  var src = new Map([]);
  var got = _.mapMake( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - pure map';
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.mapMake( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  /* */

  test.case = 'src - empty array';
  var src = [];
  var got = _.mapMake( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - array with primitives';
  var src = [ 0, 'str', null, undefined ];
  var got = _.mapMake( src );
  var expected = { 0 : 0, 1 : 'str', 2 : null, 3 : undefined };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - array with maps';
  var src = [ { a : 7 }, { b : 13 } ];
  var got = _.mapMake( src );
  var expected = { 0 : { a : 7 }, 1 : { b : 13 } };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapMake( { a : 1 }, { a : 'extra' } ) );

  test.case = 'wrong argument';
  test.shouldThrowErrorSync( () => _.mapMake( '' ) );
  test.shouldThrowErrorSync( () => _.mapMake( 1 ) );
  test.shouldThrowErrorSync( () => _.mapMake( false ) );

}

//

function mapMakeBugWithArray( test )
{
  test.case = 'failed';
  var src = [ { a : 1 }, { b : 2 } ];
  var got = _.mapMake.apply( undefined, src );
  var exp = { 0 : { a : 1 }, 1 : { b : 2 } };
  test.identical( got, exp );
  test.true( got !== src );

  test.case = 'all ok';
  var src = [ { a : 1 }, { b : 2 } ];
  var got = _.mapMake( src );
  var exp = { 0 : { a : 1 }, 1 : { b : 2 } };
  test.identical( got, exp );
  test.true( got !== src );
}
mapMakeBugWithArray.experimental = 1;
mapMakeBugWithArray.description =
`
 routines mapBut and _mapOnly uncorrect use method apply()
 Previus call was :
   _.mapMake.apply( this, src ); // src = [ {...}, {...} ]
   its equivalent to
   _.mapMake( {...}, {...} );

   After changing behavior of mapMake call should be
   _.mapMake.apply( this, [ src ] );
`

//
// map manipulator
//

function objectSetWithKeys( test )
{
  test.open( 'dst is null or empty map' );

  test.case = 'dstMap - null, src - empty array, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, [], 2 );
  test.identical( got, {} );
  test.true( got !== dst );

  test.case = 'dstMap - empty map, src - empty array, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, [], 2 );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - null, src - string, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, 'a', 2 );
  test.identical( got, { 'a' : 2 } );
  test.true( got !== dst );

  test.case = 'dstMap - empty map, src - string, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, 'a', 2 );
  test.identical( got, { 'a' : 2 } );
  test.true( got === dst );

  test.case = 'dstMap - null, src - array of strings, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, [ 'a', 'b' ], 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got !== dst );

  test.case = 'dstMap - empty map, src - array of strings, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, [ 'a', 'b' ], 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'dstMap - empty map, src - array of numbers, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, [ 1, 2 ], 2 );
  test.identical( got, { 1 : 2, 2 : 2 } );
  test.true( got === dst );

  test.close( 'dst is null or empty map' );

  /* - */

  test.open( 'dst is filled  map' );

  test.case = 'src - empty array, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, [], 2 );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'src - string, new key, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, 'd', 2 );
  test.identical( got, { a : 1, b : 2, d : 2 } );
  test.true( got === dst );

  test.case = 'src - string, replace value, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, 'a', 2 );
  test.identical( got, { a : 2, b : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, [ 'c', 'd' ], 2 );
  test.identical( got, { 'a' : 1, 'b' : 2, 'c' : 2, 'd' : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, [ 'a', 'b' ], 3 );
  test.identical( got, { 'a' : 3, 'b' : 3 } );
  test.true( got === dst );

  /* */

  test.case = 'src - empty array, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, [], undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'src - string, new key, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, 'd', undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'src - string, replace value, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, 'a', undefined );
  test.identical( got, { b : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, [ 'c', 'd' ], undefined );
  test.identical( got, { 'a' : 1, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, [ 'a', 'b' ], undefined );
  test.identical( got, {} );
  test.true( got === dst );

  test.close( 'dst is filled  map' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments'
  test.shouldThrowErrorSync( () => _.objectSetWithKeys() );

  test.case = 'not enough arguments'
  test.shouldThrowErrorSync( () => _.objectSetWithKeys( {} ) );
  test.shouldThrowErrorSync( () => _.objectSetWithKeys( {}, 'a' ) );

  test.case = 'extra arguments'
  test.shouldThrowErrorSync( () => _.objectSetWithKeys( {}, 'a', 'a', 1 ) );

  test.case = 'dstMap is not object or null'
  test.shouldThrowErrorSync( () => _.objectSetWithKeys( [], 'a', 'a' ) );

  test.case = 'src is not array of strings or string'
  test.shouldThrowErrorSync( () => _.objectSetWithKeys( { 'a' : 1 }, 1, 'a' ) );
  test.shouldThrowErrorSync( () => _.objectSetWithKeys( { 'a' : 1 }, { 'k' : 2 }, 'a' ) );
}

//

function objectSetWithKeysKeyIsVector( test )
{
  test.open( 'unroll' );

  test.case = 'dst - null, key - empty array, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, _.unrollMake( [] ), 2 );
  test.identical( got, {} );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - empty array, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, _.unrollMake( [] ), 2 );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dst - null, key - array of strings, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, _.unrollMake([ 'a', 'b' ]), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - array of strings, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, _.unrollMake([ 'a', 'b' ]), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.unrollMake( [] ), 2 );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.unrollMake([ 'c', 'd' ]), 2 );
  test.identical( got, { 'a' : 1, 'b' : 2, 'c' : 2, 'd' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.unrollMake([ 'a', 'b' ]), 3 );
  test.identical( got, { 'a' : 3, 'b' : 3 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.unrollMake( [] ), undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.unrollMake([ 'c', 'd' ]), undefined );
  test.identical( got, { 'a' : 1, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.unrollMake([ 'a', 'b' ]), undefined );
  test.identical( got, {} );
  test.true( got === dst );

  test.close( 'unroll' );

  /* - */

  test.open( 'containerAdapter' );

  test.case = 'dst - null, key - empty array, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set( [] ) ), 2 );
  test.identical( got, {} );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - empty array, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set( [] ) ), 2 );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dst - null, key - array of strings, val - 2';
  var dst = null;
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - array of strings, val - 2';
  var dst = {};
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set( [] ) ), 2 );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set([ 'c', 'd' ]) ), 2 );
  test.identical( got, { 'a' : 1, 'b' : 2, 'c' : 2, 'd' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), 3 );
  test.identical( got, { 'a' : 3, 'b' : 3 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set( [] ) ), undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set([ 'c', 'd' ]) ), undefined );
  test.identical( got, { 'a' : 1, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeys( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), undefined );
  test.identical( got, {} );
  test.true( got === dst );

  test.close( 'containerAdapter' );
}

//

function objectSetWithKeyStrictly( test )
{
  test.open( 'dst is null or empty map' );

  test.case = 'dstMap - null, src - empty array, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, [], 2 );
  test.identical( got, {} );
  test.true( got !== dst );

  test.case = 'dstMap - empty map, src - empty array, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, [], 2 );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - null, src - string, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, 'a', 2 );
  test.identical( got, { 'a' : 2 } );
  test.true( got !== dst );

  test.case = 'dstMap - empty map, src - string, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, 'a', 2 );
  test.identical( got, { 'a' : 2 } );
  test.true( got === dst );

  test.case = 'dstMap - null, src - array of strings, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, [ 'a', 'b' ], 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got !== dst );

  test.case = 'dstMap - empty map, src - array of strings, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, [ 'a', 'b' ], 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'dstMap - empty map, src - array of numbers, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, [ 1, 2 ], 2 );
  test.identical( got, { 1 : 2, 2 : 2 } );
  test.true( got === dst );

  test.close( 'dst is null or empty map' );

  /* - */

  test.open( 'dst is filled  map' );

  test.case = 'src - empty array, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, [], 2 );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'src - string, new key, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, 'd', 2 );
  test.identical( got, { a : 1, b : 2, d : 2 } );
  test.true( got === dst );

  test.case = 'src - string, replace value, val - 2';
  var dst = { a : 2, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, 'a', 2 );
  test.identical( got, { a : 2, b : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, [ 'c', 'd' ], 2 );
  test.identical( got, { 'a' : 1, 'b' : 2, 'c' : 2, 'd' : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, replace values, val - 3';
  var dst = { a : 3, b : 3 };
  var got = _.objectSetWithKeyStrictly( dst, [ 'a', 'b' ], 3 );
  test.identical( got, { 'a' : 3, 'b' : 3 } );
  test.true( got === dst );

  /* */

  test.case = 'src - empty array, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, [], undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'src - string, new key, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, 'd', undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'src - string, replace value, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, 'a', undefined );
  test.identical( got, { b : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, [ 'c', 'd' ], undefined );
  test.identical( got, { 'a' : 1, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'src - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, [ 'a', 'b' ], undefined );
  test.identical( got, {} );
  test.true( got === dst );

  test.close( 'dst is filled  map' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments'
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly() );

  test.case = 'not enough arguments'
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( {} ) );
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( {}, 'a' ) );

  test.case = 'extra arguments'
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( {}, 'a', 'a', 1 ) );

  test.case = 'dstMap is not object or null'
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( [], 'a', 'a' ) );

  test.case = 'src is not array of strings or string'
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( { 'a' : 1 }, 1, 'a' ) );
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( { 'a' : 1 }, { 'k' : 2 }, 'a' ) );

  test.case = 'dstMap has value not identical to val'
  test.shouldThrowErrorSync( () => _.objectSetWithKeyStrictly( { 'a' : 1 }, 1, 'a' ) );
}

//

function objectSetWithKeyStrictlyKeyIsVector( test )
{
  test.open( 'unroll' );

  test.case = 'dst - null, key - empty array, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake( [] ), 2 );
  test.identical( got, {} );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - empty array, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake( [] ), 2 );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dst - null, key - array of strings, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake([ 'a', 'b' ]), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - array of strings, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake([ 'a', 'b' ]), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake( [] ), 2 );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake([ 'c', 'd' ]), 2 );
  test.identical( got, { 'a' : 1, 'b' : 2, 'c' : 2, 'd' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 3, b : 3 };
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake([ 'a', 'b' ]), 3 );
  test.identical( got, { 'a' : 3, 'b' : 3 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake( [] ), undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake([ 'c', 'd' ]), undefined );
  test.identical( got, { 'a' : 1, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.unrollMake([ 'a', 'b' ]), undefined );
  test.identical( got, {} );
  test.true( got === dst );

  test.close( 'unroll' );

  /* - */

  test.open( 'containerAdapter' );

  test.case = 'dst - null, key - empty array, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set( [] ) ), 2 );
  test.identical( got, {} );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - empty array, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set( [] ) ), 2 );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dst - null, key - array of strings, val - 2';
  var dst = null;
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got !== dst );

  test.case = 'dst - empty map, key - array of strings, val - 2';
  var dst = {};
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), 2 );
  test.identical( got, { 'a' : 2, 'b' : 2 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set( [] ) ), 2 );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set([ 'c', 'd' ]) ), 2 );
  test.identical( got, { 'a' : 1, 'b' : 2, 'c' : 2, 'd' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 3, b : 3 };
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), 3 );
  test.identical( got, { 'a' : 3, 'b' : 3 } );
  test.true( got === dst );

  /* */

  test.case = 'dst - filled, key - empty array, val - undefined';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set( [] ) ), undefined );
  test.identical( got, { a : 1, b : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, new keys, val - 2';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set([ 'c', 'd' ]) ), undefined );
  test.identical( got, { 'a' : 1, 'b' : 2 } );
  test.true( got === dst );

  test.case = 'dst - filled, key - array of strings, replace values, val - 3';
  var dst = { a : 1, b : 2 };
  var got = _.objectSetWithKeyStrictly( dst, _.containerAdapter.make( new Set([ 'a', 'b' ]) ), undefined );
  test.identical( got, {} );
  test.true( got === dst );

  test.close( 'containerAdapter' );
}

//

function mapDelete( test )
{
  test.case = 'dstMap - empty map';
  var dst = {};
  var got = _.mapDelete( dst );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - filled map';
  var dst = { a : 1, 1 : 2, c : 3 };
  var got = _.mapDelete( dst );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - empty map, ins - empty map';
  var dst = {};
  var ins = {};
  var got = _.mapDelete( dst, ins );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - empty map, ins - filled map';
  var dst = {};
  var ins = { a : 1, b : 2 };
  var got = _.mapDelete( dst, ins );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - filled map, ins - empty map';
  var dst = { a : 1, 1 : 2, c : 3 };
  var ins = {};
  var got = _.mapDelete( dst, ins );
  test.identical( got, { a : 1, 1 : 2, c : 3 } );
  test.true( got === dst );

  test.case = 'dstMap - filled map, ins - filled map, not equal keys';
  var dst = { a : 1, 1 : 2, c : 3 };
  var ins = { 2 : 6, d : 'e' };
  var got = _.mapDelete( dst, ins );
  test.identical( got, { a : 1, 1 : 2, c : 3 } );
  test.true( got === dst );

  test.case = 'dstMap - filled map, ins - filled map, equal keys exists';
  var dst = { a : 1, 1 : 2, c : 3 };
  var ins = { a : 6, c : 'e', f : [] };
  var got = _.mapDelete( dst, ins );
  test.identical( got, { 1 : 2 } );
  test.true( got === dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapDelete() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapDelete( { a : 1 }, { b : 2 }, { c : 'extra' } ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapDelete( 'wrong', { b : 2 } ) );
  test.shouldThrowErrorSync( () => _.mapDelete( undefined, { b : 2 } ) );
}

//

function mapEmpty( test )
{
  test.case = 'dstMap - empty map';
  var dst = {};
  var got = _.mapEmpty( dst );
  test.identical( got, {} );
  test.true( got === dst );

  test.case = 'dstMap - filled map';
  var dst = { a : 1, 1 : 2, c : 3 };
  var got = _.mapEmpty( dst );
  test.identical( got, {} );
  test.true( got === dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapEmpty( { a : 1 }, { c : 'extra' } ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapEmpty( 'wrong', { b : 2 } ) );
  test.shouldThrowErrorSync( () => _.mapEmpty( undefined, { b : 2 } ) );
}

//

function mapInvert( test )
{
  test.open( 'no dst' );

  test.case = 'src - empty map';
  var src = {};
  var got = _.mapInvert( src );
  test.identical( got, {} );

  test.case = 'src - map with number';
  var src = { a : 1 };
  var expected =  { '1' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with null';
  var src = { a : null };
  var expected =  { 'null' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with undefined';
  var src = { a : undefined };
  var expected =  { 'undefined' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with string';
  var src = { a : 'str' };
  var expected =  { 'str' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with bool';
  var src = { a : true };
  var expected =  { 'true' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with object';
  var src = { a : { b : 2 } };
  var expected =  { '[object Object]' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with set';
  var src = { a : new Set([ 1, 2 ]) };
  var expected =  { '[object Set]' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with array';
  var src = { a : [ 1, 2 ] };
  var expected =  { '1,2' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with function';
  var src = { a : function b() {} };
  var expected =  { 'function b() {}' : 'a' };
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.case = 'src - map with differen types';
  var src =
  {
    a : 1,
    b : 'str',
    c : false,
    d : { b : 2 },
    e : new Set([ 1, 2 ]),
    f : [ 1, 2 ],
    g : function b() {},
    h : null,
    i : undefined
  };
  var expected =
  {
    '1' : 'a',
    'str' : 'b',
    'false' : 'c',
    '[object Object]' : 'd',
    '[object Set]' : 'e',
    '1,2' : 'f',
    'function b() {}' : 'g',
    'null' : 'h',
    'undefined' : 'i'
  }
  var got = _.mapInvert( src );
  test.identical( got, expected );

  test.close( 'no dst' );

  /* - */

  test.open( 'with dst' );

  test.case = 'src and dst - empty map';
  var src = {};
  var dst = {};
  var expected = {};
  var got = _.mapInvert( src, dst );
  test.identical( got, expected );

  test.case = 'src, dst different with 1 el';
  var src = { a : 1 };
  var dst = { b : 2 };
  var expected =  { '1' : 'a', 'b' : 2 };
  var got = _.mapInvert( src, dst );
  test.identical( got, expected );

  test.case = 'src, dst different with 2 el';
  var dst = { b : 2, d : 4 };
  var src = { a : 1, c : 3 };
  var expected =
  {
    '1' : 'a',
    '3' : 'c',
    'b' : 2,
    'd' : 4
  };
  var got = _.mapInvert( src, dst );
  test.identical( got, expected );

  test.case = 'src, dst are the same';
  var src = { a : 1 };
  var dst = { a : 1 };
  var expected =  { '1' : 'a', 'a' : 1 };
  var got = _.mapInvert( src, dst );
  test.identical( got, expected );

  test.case = 'src - map with differen types, some same as dst';
  var src =
  {
    a : 1,
    b : 'str',
    c : false,
    d : { b : 2 },
    e : new Set([ 1, 2 ]),
    f : [ 1, 2 ],
    h : null,
    i : undefined
  };
  var dst =
  {
    a : 1,
    d : { b : 3 },
    e : new Set([ 1, 2, 3 ]),
    f : [ 1, 2 ],
    h : null,
  };
  var expected =
  {
    '1' : 'a',
    'd' : { 'b' : 3 },
    'str' : 'b',
    'false' : 'c',
    '[object Object]' : 'd',
    '[object Set]' : 'e',
    '1,2' : 'f',
    'null' : 'h',
    'undefined' : 'i',
    'a' : 1,
    'e' : new Set([ 1, 2, 3 ]),
    'f' : [ 1, 2 ],
    'h' : null
  }
  var got = _.mapInvert( src, dst );
  test.identical( got, expected );

  test.close( 'with dst' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapInvert() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapInvert( { a : 1 }, { b : 2 }, { c : 'extra' } ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.mapInvert( 'wrong' ) );

  test.case = 'dst is inverse of src';
  var src = { a : 1 };
  var dst = { '1' : 'a' };
  test.shouldThrowErrorSync( () => _.mapInvert( src, dst ) );
}

// --
// map convert
// --

function mapsFlatten( test )
{

  test.case = 'empty map';
  var src = {};
  var expected = {}
  var got = _.mapsFlatten({ src });
  test.identical( got, expected );

  test.case = 'empty array';
  var src = [];
  var expected = {}
  var got = _.mapsFlatten( src );
  test.identical( got, expected );

  test.case = 'array of empty maps';
  var src = [ {}, {} ];
  var expected = {}
  var got = _.mapsFlatten( src );
  test.identical( got, expected );

  test.case = 'trivial';
  var src = [ { a : 1, b : { c : 1, d : 1 } }, { e : 2, f : { g : { h : 2 } } } ];
  var expected = { 'a' : 1, 'b/c' : 1, 'b/d' : 1, 'e' : 2, 'f/g/h' : 2 }
  var got = _.mapsFlatten( src );
  test.identical( got, expected );

  test.case = 'delimeter : .';
  var src = [ { a : 1, dir : { b : 2 } }, { c : 3 } ];
  var expected = { 'a' : 1, 'dir.b' : 2, 'c' : 3 }
  var got = _.mapsFlatten({ src, delimeter : '.' });
  test.identical( got, expected );

  test.case = 'delimeter : ';
  var src = [ { a : 1, dir : { b : 2 } }, { c : 3 } ];
  var expected = { 'a' : 1, 'dirb' : 2, 'c' : 3 }
  var got = _.mapsFlatten({ src, delimeter : '' });
  test.identical( got, expected );

  test.case = 'delimeter : 0';
  var src = [ { a : 1, dir : { b : 2 } }, { c : 3 } ];
  var expected = { 'a' : 1, 'b' : 2, 'c' : 3 }
  var got = _.mapsFlatten({ src, delimeter : 0 });
  test.identical( got, expected );

  test.case = 'delimeter : false';
  var src = [ { a : 1, dir : { b : 2 } }, { c : 3 } ];
  var expected = { 'a' : 1, 'b' : 2, 'c' : 3 }
  var got = _.mapsFlatten({ src, delimeter : false });
  test.identical( got, expected );

  test.case = 'allowingCollision : 1';
  var src = [ { a : 1, dir : { b : 2 } }, { a : 3, dir : { b : 4, c : 5 } } ];
  var expected = { 'a' : 3, 'dir/b' : 4, 'dir/c' : 5 }
  var got = _.mapsFlatten({ src, allowingCollision : 1 });
  test.identical( got, expected );

  test.case = 'delimeter : 0, allowingCollision : 1';
  var src = [ { a : 1, dir : { b : 2 } }, { a : 3, dir : { b : 4, c : 5 } } ];
  var expected = { 'a' : 3, 'b' : 4, 'c' : 5 }
  var got = _.mapsFlatten({ src, delimeter : 0, allowingCollision : 1 });
  test.identical( got, expected );

  test.case = 'delimeter : 0, allowingCollision : 1';
  var dst = { a : 0, d : 6 }
  var src = [ { a : 1, dir : { b : 2 } }, { a : 3, dir : { b : 4, c : 5 } } ];
  var expected = { 'a' : 3, 'b' : 4, 'c' : 5, 'd' : 6 }
  var got = _.mapsFlatten({ src, dst, delimeter : 0, allowingCollision : 1 });
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'collision';

  test.shouldThrowErrorSync( () =>
  {
    var dst = { 'dir/a' : 1 }
    var src = { dir : { a : 2 } };
    var got = _.mapsFlatten({ src, dst });
  });

  test.shouldThrowErrorSync( () =>
  {
    var src = [ { dir : { a : 2 } }, { dir : { a : 2 } } ];
    var got = _.mapsFlatten({ src });
  });

  test.shouldThrowErrorSync( () =>
  {
    var src = [ { dir : { a : 2 } }, { dir : { a : 2 } } ];
    var got = _.mapsFlatten({ src, allowingCollision : 0 });
  });

  test.shouldThrowErrorSync( () =>
  {
    var src = [ { dir : { a : 2 } }, { dir : { a : 2 } } ];
    var got = _.mapsFlatten({ src, delimeter : 0 });
  });

  test.shouldThrowErrorSync( () =>
  {
    var src = [ { dir : { a : 2 } }, { dir : { a : 2 } } ];
    var got = _.mapsFlatten({ src, delimeter : 0, allowingCollision : 0 });
  });

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.mapsFlatten() );
  test.shouldThrowErrorSync( () => _.mapsFlatten( {} ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( 'a' ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( 1 ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( null ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( [ 'a' ] ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.mapsFlatten( [ null ] ) );

  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : undefined }) );
  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : 'a' }) );
  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : 1 }) );
  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : null }) );
  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : [ 'a' ] }) );
  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : [ 1 ] }) );
  test.shouldThrowErrorSync( () => _.mapsFlatten({ src : [ null ] }) );

}

//

function mapFirstPair( test )
{

  test.case = 'first pair [ key, value ]';
  var got = _.mapFirstPair( { a : 3, b : 13 } );
  var expected = [ 'a', 3 ];
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.mapFirstPair( {} );
  var expected = [];
  test.identical( got, expected );

  test.case = 'pure map';
  var obj = Object.create( null );
  obj.a = 7;
  var got = _.mapFirstPair( obj );
  var expected = [ 'a', 7 ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapFirstPair();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapFirstPair( 'wrong argument' );
  });

}

//

function mapValWithIndex( test )
{

  test.case = 'second index';
  var got = _.mapValWithIndex( { 0 : 3, 1 : 13, 2 : 'c', 3 : 7 }, 2 );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'an element';
  var got = _.mapValWithIndex( { 0 : [ 'a', 3 ] }, 0 );
  var expected = [ 'a', 3 ];
  test.identical( got, expected );

  test.case = 'list of arrays';
  var got = _.mapValWithIndex( { 0 : [ 'a', 3 ], 1 : [ 'b', 13 ], 2 : [ 'c', 7 ] }, 2 );
  var expected = [ 'c', 7 ];
  test.identical( got, expected );

  test.case = 'list of objects';
  var got = _.mapValWithIndex( { 0 : { a : 3 }, 1 : { b : 13 }, 2 : { c : 7 } }, 2 );
  var expected = { c : 7 };
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapValWithIndex();
  });

  test.case = 'few argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapValWithIndex( [ [] ] );
  });

  test.case = 'first the four argument not wrapped into array';
  test.shouldThrowErrorSync( function()
  {
    _.mapValWithIndex( 3, 13, 'c', 7, 2 );
  });

  test.case = 'redundant argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapValWithIndex( [ [] ], 2, 'wrong arguments' );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapValWithIndex( 'wrong argumetns' );
  });

}

//

function mapKeyWithIndex( test )
{
  test.case = 'negative index';
  var got = _.mapKeyWithIndex( { 'a' : 3, 'b' : 13, 'c' : 7 }, -1 );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'first key';
  var got = _.mapKeyWithIndex( { 'a' : 3, 'b' : 13, 'c' : 7 }, 0 );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'last key';
  var got = _.mapKeyWithIndex( { 'a' : 3, 'b' : 13, 'c' : 7 }, 2 );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'index outside of entries number';
  var got = _.mapKeyWithIndex( { 'a' : 3, 'b' : 13, 'c' : 7 }, 3 );
  var expected = undefined;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.mapKeyWithIndex() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapKeyWithIndex( {} ) );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.mapKeyWithIndex( {}, 2, 'wrong arguments' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.mapKeyWithIndex( 'wrong argumetns', 2 ) );

  test.case = 'wrong type of index';
  test.shouldThrowErrorSync( () => _.mapKeyWithIndex( {}, 2.1 ) );
}

//

function mapToArray( test )
{
  test.case = 'src - empty map';
  var got = _.mapToArray( {} );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src - empty array';
  var got = _.mapToArray( [] );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src - filled map';
  var got = _.mapToArray( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'src - filled map'
  var got = _.mapToArray( { a : 3, b : 13, 1 : 7 } );
  var expected = [ [ '1', 7 ], [ 'a', 3 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'src - array with literal key';
  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.mapToArray( arrObj );
  var expected = [ [ 'k', 1 ] ];
  test.identical( got, expected );

  test.case = 'src - Date object';
  var got = _.mapToArray( new Date );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.mapToArray( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.mapToArray( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs, not enumerable property';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.mapToArray( a, { onlyEnumerable : 0, onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs disable, not enumerable property';
  var a = Object.create( null );
  a.a = 1;
  var b = Object.create( null );
  b.b = 2;
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.mapToArray( a, { onlyEnumerable : 0, onlyOwn : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.mapToArray() );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.mapToArray( 1 ) );
  test.shouldThrowErrorSync( () => _.mapToArray( 'wrong' ) );
}

//

function mapToStr( test )
{

  test.case = 'returns an empty string';
  var got = _.mapToStr({ src : [], keyValDelimeter : ' : ',  entryDelimeter : '; ' });
  var expected = '';
  test.identical( got, expected );

  test.case = 'returns a string representing an object';
  var got = _.mapToStr({ src : { a : 1, b : 2, c : 3, d : 4 }, keyValDelimeter : ' : ',  entryDelimeter : '; ' });
  var expected = 'a : 1; b : 2; c : 3; d : 4';
  test.identical( got, expected );

  test.case = 'returns a string representing an array';
  var got = _.mapToStr({ src : [ 1, 2, 3 ], keyValDelimeter : ' : ',  entryDelimeter : '; ' });
  var expected = '0 : 1; 1 : 2; 2 : 3';
  test.identical( got, expected );

  test.case = 'returns a string representing an array-like object';
  function args() { return arguments };
  var got = _.mapToStr({ src : args(  1, 2, 3, 4, 5 ), keyValDelimeter : ' : ',  entryDelimeter : '; ' });
  var expected = '0 : 1; 1 : 2; 2 : 3; 3 : 4; 4 : 5';
  test.identical( got, expected );

  test.case = 'returns a string representing a string';
  var got = _.mapToStr({ src : 'abc', keyValDelimeter : ' : ',  entryDelimeter : '; ' });
  var expected = '0 : a; 1 : b; 2 : c';
  test.identical( got, expected );


  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapToStr();
  });

  test.case = 'wrong type of number';
  test.shouldThrowErrorSync( function()
  {
    _.mapToStr( 13 );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapToStr( true );
  });

}

// --
// map properties
// --

function mapKeys( test )
{

  test.case = 'trivial';

  var got = _.mapKeys( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.mapKeys( { a : 1, b : undefined } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.mapKeys( { a : 7, b : 13 } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.mapKeys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ '3', '7', '13' ];
  test.identical( got, expected );

  var f = () => {};
  Object.setPrototypeOf( f, String );
  f.a = 1;
  var got = _.mapKeys( f );
  var expected = [ 'a' ];
  test.identical( got, expected );

  var got = _.mapKeys( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = 'options';
  var a = { a : 1 }
  var b = { b : 2 }
  Object.setPrototypeOf( a, b );

  /* onlyOwn off */

  var got = _.mapKeys( a );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  /* onlyOwn on */

  var o = { onlyOwn : 1 };
  var got = _.mapKeys( a, o );
  var expected = [ 'a' ];
  test.identical( got, expected );

  /* enumerable/onlyOwn off */

  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  Object.defineProperty( b, 'k', { enumerable : 0 } );
  var got = _.mapKeys( a, o );
  var expected = _.mapAllKeys( a );
  test.identical( got, expected );

  /* enumerable off, onlyOwn on */

  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  var got = _.mapKeys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  test.case = 'onlyEnumerable : 0, onlyOwn : 0'
  var a = Object.create( null );
  a.a = 1;
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var b = Object.create( a );
  b.b = 2;
  var exp = [ 'b', 'a', 'k' ];
  var got = _.mapKeys( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapKeys();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapKeys( 'wrong arguments' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.mapKeys( { x : 1 }, { 'wrong' : null } );
  });

}

//

function mapOnlyOwnKeys( test )
{
  test.case = 'empty'
  var got = _.mapOnlyOwnKeys( {} );
  var expected = [];
  test.identical( got, expected )

  /* */

  test.case = 'simplest'

  var got = _.mapOnlyOwnKeys( { a : '1', b : '2' } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected )

  var got = _.mapOnlyOwnKeys( new Date );
  var expected = [ ];
  test.identical( got, expected )

  /* */

  test.case = ''

  var a = { a : 1 };
  var b = { b : 2 };
  var c = { c : 3 };
  Object.setPrototypeOf( a, b );
  Object.setPrototypeOf( b, c );

  var got = _.mapOnlyOwnKeys( a );
  var expected = [ 'a' ];
  test.identical( got, expected )

  var got = _.mapOnlyOwnKeys( b );
  var expected = [ 'b' ];
  test.identical( got, expected )

  var got = _.mapOnlyOwnKeys( c );
  var expected = [ 'c' ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable on/off';
  var a = { a : '1' };

  var got = _.mapOnlyOwnKeys( a );
  var expected = [ 'a' ]
  test.identical( got, expected );

  Object.defineProperty( a, 'k', { enumerable : false } );
  var o = { onlyEnumerable : 0 };
  var got = _.mapOnlyOwnKeys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKeys();
  })

  test.case = 'invalid type';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKeys( 1 );
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function mapAllKeys( test )
{
  var _expected =
  [
    '__defineGetter__',
    '__defineSetter__',
    'hasOwnProperty',
    '__lookupGetter__',
    '__lookupSetter__',
    'propertyIsEnumerable',
    '__proto__',
    'constructor',
    'toString',
    'toLocaleString',
    'valueOf',
    'isPrototypeOf'
  ]

  /* */

  test.case = 'empty'
  var got = _.mapAllKeys( {} );
  test.identical( got.sort(), _expected.sort() )

  /* */

  test.case = 'one onlyOwn property'
  var got = _.mapAllKeys( { a : 1 } );
  var expected = _expected.slice();
  expected.push( 'a' );
  test.identical( got.sort(), expected.sort() )

  /* */

  test.case = 'date'
  var got = _.mapAllKeys( new Date );
  test.identical( got.length, 55 );

  /* */

  test.case = 'not enumerable'
  var a = { };
  Object.defineProperty( a, 'k', { enumerable : 0 })
  var got = _.mapAllKeys( a );
  var expected = _expected.slice();
  expected.push( 'k' );
  test.identical( got.sort(), expected.sort() );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 1 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  Object.defineProperty( b, 'y', { enumerable : 0 } );
  var got = _.mapAllKeys( a );
  var expected = _expected.slice();
  expected = expected.concat( [ 'a', 'b', 'k', 'y' ] );
  test.identical( got.sort(), expected.sort() );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllKeys();
  })

  test.case = 'invalid argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllKeys();
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function mapVals( test )
{

  test.case = 'trivial';

  var got = _.mapVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.mapVals( { a : 1, b : undefined } );
  var expected = [ 1, undefined ];
  test.identical( got, expected );

  var got = _.mapVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.mapVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.mapVals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = 'onlyOwn'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var o = { onlyOwn : 0, onlyEnumerable : 1 };
  var got = _.mapVals( a, o );
  var expected = [ 1, 2 ]
  test.identical( got, expected );

  /* */

  var o = { onlyOwn : 1, onlyEnumerable : 1 };
  var got = _.mapVals( a, o );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable'
  var a = { a : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0, value : 2 } );

  /* */

  var got = _.mapVals( a, { onlyEnumerable : 1, onlyOwn : 0 } );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'onlyEnumerable : 0, onlyOwn : 0'
  var a = Object.create( null );
  a.a = 1;
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var b = Object.create( a );
  b.b = 2;
  var exp = [ 2, 1, 3 ];
  var got = _.mapVals( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.mapVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function mapOnlyOwnVals( test )
{

  test.case = 'trivial';

  var got = _.mapOnlyOwnVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.mapOnlyOwnVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.mapOnlyOwnVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.mapOnlyOwnVals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = ' only onlyOwn values'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.mapOnlyOwnVals( a );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* enumerable off */

  test.case = 'enumerable - 0';
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : 4 } );
  var got = _.mapOnlyOwnVals( a, { onlyEnumerable : 0 } );
  var expected = [ 1, 3 ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function mapAllVals( test )
{
  test.case = 'trivial';

  var got = _.mapAllVals( {} );
  test.true( got.length !== 0 );

  /* */

  var got = _.mapAllVals( { a : 7, b : 13 } );
  test.true( got.length !== 0 );
  test.true( got.indexOf( 7 ) !== -1 );
  test.true( got.indexOf( 13 ) !== -1 );

  /* */

  var got = _.mapAllVals( new Date );
  test.true( got.length > _.mapAllVals( {} ).length );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.mapAllVals( a );
  var expected = [ 1 ];
  test.true( got.length > _.mapAllVals( {} ).length );
  test.true( got.indexOf( 1 ) !== -1 );
  test.true( got.indexOf( 2 ) !== -1 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function mapPairs( test )
{

  test.case = 'empty';

  var got = _.mapPairs( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.mapPairs( [] );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.mapPairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'list of [ key, value ] pairs'
  var got = _.mapPairs( { a : 3, b : 13, c : 7 } );
  var expected = [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ];
  test.identical( got, expected );

  /* */

  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.mapPairs( arrObj );
  var expected = [ [ 'k', 1 ] ];
  test.identical( got, expected );

  /* */

  var got = _.mapPairs( new Date );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.mapPairs( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* using onlyOwn */

  var got = _.mapPairs( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn on */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  var got = _.mapPairs( a, o );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  var got = _.mapPairs( a, o );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'k', 3 ] );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.mapPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapPairs( 'wrong argument' );
  });

  test.case = 'redundant argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapPairs( {}, 'wrong arguments' );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.mapPairs( null );
  });

}

//

function mapOnlyOwnPairs( test )
{
  test.case = 'empty';
  var got = _.mapOnlyOwnPairs( {} );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.mapOnlyOwnPairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  /* */

  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.mapOnlyOwnPairs( arrObj );
  var expected = [ [ 'k', 1 ] ];
  test.identical( got, expected );

  /* */

  var got = _.mapOnlyOwnPairs( new Date );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.mapOnlyOwnPairs( a );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.mapOnlyOwnPairs( a, { onlyEnumerable : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnPairs( 'wrong argument' );
  });

}

//

function mapAllPairs( test )
{
  test.case = 'empty';
  var got = _.mapAllPairs( {} );
  test.true( got.length !== 0 );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.mapAllPairs( { a : 7, b : 13 } );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 7 ] );
  test.identical( got[ 1 ], [ 'b', 13 ] );

  /* */

  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.mapAllPairs( arrObj );
  test.true( got.length > 1 );
  got = _.arrayFlatten( [], got );
  test.true( got.indexOf( 'k' ) !== -1 );
  test.identical( got[ got.indexOf( 'k' ) + 1 ], 1 );

  /* */

  var got = _.mapAllPairs( new Date );
  test.true( got.length > 1 );
  got = _.arrayFlatten( [], got );
  test.true( got.indexOf( 'constructor' ) !== -1 );
  test.identical( got[ got.indexOf( 'constructor' ) + 1 ].name, 'Date' );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.mapAllPairs( a );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'b', 2 ] );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapAllPairs( 'wrong argument' );
  });

}

//

function hashMapExtend( test )
{
  test.case = 'dst - null, src - empty hash map';
  var dst = null;
  var src = new Map();
  var got = _.hashMap.extend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - null, src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.hashMap.extend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - null, src - filled hash map';
  var dst = null;
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - null, src - filled simple map';
  var dst = null;
  var src = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ '1', 1 ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got !== dst );
  test.true( got !== src );

  /* - */

  test.open( 'dst - hash map, src - hash map' );

  test.case = 'dst - empty, src - empty';
  var dst = new Map();
  var src = new Map();
  var got = _.hashMap.extend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = new Map();
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = new Map( [ [ { a : 1 }, { a : 1 } ] ] );
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ { a : 1 }, { a : 1 } ], [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = new Map( [ [ 1, 2 ], [ null, undefined ], [ 'str', '' ], [ undefined, null ], [ '', 'str' ], [ false, true ], [ [ 1 ], [  2 ] ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, 2 ], [ null, undefined ], [ 'str', '' ], [ undefined, null ], [ '', 'str' ], [ false, true ], [ [ 1 ], [ 1 ] ], [ [ 1 ], [  2 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst === src';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = dst;
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got === src );

  test.close( 'dst - hash map, src - hash map' );

  /* - */

  test.open( 'dst - hash map, src - simple map' );

  test.case = 'dst - empty, src - empty';
  var dst = new Map();
  var src = {};
  var got = _.hashMap.extend( dst, src );
  var exp = new Map();
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = new Map();
  var src = { 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false, '1' : [ 1 ] };
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = new Map( [ [ { a : 1 }, { a : 1 } ] ] );
  var src = { 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false, '1' : [ 1 ] };
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ { a : 1 }, { a : 1 } ], [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = new Map( [ [ 1, [ 1 ] ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ] ] );
  var src = { 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false, '1' : [ 1 ] };
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, [ 1 ] ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ '1', [ 1 ] ], [ 'null', null ], [ 'undefined', undefined ], [ 'false', false ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', 'str' ], [ undefined, undefined ], [ '', '' ], [ false, false ], [ [ 1 ], [ 1 ] ] ] );
  var src = { 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true, '1' : 2 };
  var got = _.hashMap.extend( dst, src );
  var exp = new Map( [ [ 1, 1 ], [ null, null ], [ 'str', '' ], [ undefined, undefined ], [ '', 'str' ], [ false, false ], [ [ 1 ], [ 1 ] ], [ '1', 2 ], [ 'null', undefined ], [ 'undefined', null ], [ 'false', true ] ] );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );
  test.true( got === dst );
  test.true( got !== src );

  test.close( 'dst - hash map, src - simple map' );

  /* - */

  test.open( 'dst - simple map, src - hash map' );

  test.case = 'dst - empty, src - empty';
  var dst = {};
  var src = new Map();
  var got = _.hashMap.extend( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = {};
  var src = new Map( [ [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = { a : 1 };
  var src = new Map( [ [ '1', [ 1 ] ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = { 'a' : 1, '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = new Map( [ [ '1', 1 ], [ 'null', null ], [ 'str', 'str' ], [ 'undefined', undefined ], [ '', '' ], [ 'false', false ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = new Map( [ [ '1', [ 1 ] ], [ 'null', undefined ], [ 'str', '' ], [ 'undefined', null ], [ '', 'str' ], [ 'false', true ] ] );
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.close( 'dst - simple map, src - hash map' );

  /* - */

  test.open( 'dst - simple map, src - simple map' );

  test.case = 'dst - empty, src - empty';
  var dst = {};
  var src = {};
  var got = _.hashMap.extend( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty, src - filled';
  var dst = {};
  var src = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - filled, src - filled';
  var dst = { a : 1 };
  var src = { '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMap.extend( dst, src );
  var exp = { 'a' : 1, '1' : [ 1 ], 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src - almost identical';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst and src have identical keys';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = { '1' : [ 1 ], 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true };
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : [ 1 ], 'null' : undefined, 'str' : '', 'undefined' : null, '' : 'str', 'false' : true };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst === src';
  var dst = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  var src = dst;
  var got = _.hashMap.extend( dst, src );
  var exp = { '1' : 1, 'null' : null, 'str' : 'str', 'undefined' : undefined, '' : '', 'false' : false };
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got === src );

  test.close( 'dst - simple map, src - simple map' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.hashMap.extend() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.hashMap.extend( new Map( [ [ 1, 1 ] ] ) ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.hashMap.extend( new Map( [ [ 1, 1 ] ] ), {}, {} ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.hashMap.extend( 'wrong', {} ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.hashMap.extend( new Map( [ [ 1, 2 ] ] ), 'wrong' ) );
  test.shouldThrowErrorSync( () => _.hashMap.extend( null, null ) );

  test.case = 'dst - simple map, src - hash map with unliteral keys';
  test.shouldThrowErrorSync( () => _.hashMap.extend( { a : 1 }, new Map( [ [ 1, 2 ], [ null, null ] ] ) ) );
}

//

function mapOnlyPrimitives( test )
{
  test.case = 'emtpy';

  var got = _.mapOnlyPrimitives( {} )
  test.identical( got, {} );

  test.case = 'primitives';

  var src =
  {
    a : null,
    b : undefined,
    c : 5,
    e : false,
    f : 'a',
    g : function(){},
    h : [ 1 ],
    i : new Date(),
    j : new BufferRaw( 5 )
  }
  var got = _.mapOnlyPrimitives( src );
  var expected =
  {
    a : null,
    b : undefined,
    c : 5,
    e : false,
    f : 'a',
  }
  test.identical( got, expected );

  /* */

  test.case = 'only enumerable';
  var a = {};
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } )
  var got = _.mapOnlyPrimitives( a );
  test.identical( got, {} );

  /* */

  test.case = 'from prototype';
  var a = {};
  var b = { a : 1, c : function(){} };
  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  Object.setPrototypeOf( a, b );
  var got = _.mapOnlyPrimitives( a );
  test.identical( got, { a : 1 } );

  /* */

  if( !Config.debug )
  return;

  test.case = 'invalid arg type';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyPrimitives( null )
  });

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyPrimitives()
  })

}

//

function mapButConditional( test )
{
  test.case = 'an object';
  var filter = _.property.filter.dstNotHasSrcPrimitive();
  var src = { a : 1, b : 'ab', c : [ 1, 2, 3 ] };
  var but = { a : 1, b : 'ab', d : [ 1, 2, 3 ] };
  var got = _.mapButConditional( filter, src, but );
  var expected = {};
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional();
  });

  test.case = 'few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional( _.property.mapper.primitive() );
  });

  test.case = 'second argument is wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional( _.property.mapper.primitive(), [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapButConditional( 'wrong arguments' );
  });

}

//

function mapButConditionalThreeArguments_( test )
{
  var filter = ( dstContainer, srcContainer, key ) =>
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;
    if( dstContainer === key )
    return false;
    if( _.mapIs( dstContainer ) && key in dstContainer )
    return false;

    return true;
  }
  filter.identity = { propertyFilter : true, propertyTransformer : true };

  /* - */

  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - array' );
  //
  // test.case = 'srcMap - empty map, butMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty map, butMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty map, butMap - filled map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty map, butMap - filled array';
  // var srcMap = [];
  // var screenMap = [ 'a', 0, 'b', 1 ];
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', 0, 'b', 1 ] );
  //
  // test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  // var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = { 1 : 0, 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  // var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  // var screenMap = [ 'a', 'b', 'c', 'd' ];
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = { 1 : 0, 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  // test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );
  //
  // test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  // var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  // var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  // test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  // var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  // var screenMap = [ 'a', '3', 'b', '1' ];
  // var got = _.mapButConditional_( filter, srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  // test.identical( screenMap, [ 'a', '3', 'b', '1' ] );
  //
  // test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapButConditional_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapButConditional_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, {}, {}, {}, [] ) );

  test.case = 'wrong type of propertyFilter';
  test.shouldThrowErrorSync( () => _.mapButConditional_( 'wrong', {}, [] ) );
  test.shouldThrowErrorSync( () => _.mapButConditional_( [], null, {}, {} ) );

  test.case = 'propertyFilter has no PropertyFilter';
  var filter = ( a, b, c ) => a > ( b + c );
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, null, {}, {} ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, [], {} ) );
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, [], {}, {} ) );

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, [], '' ) );
  test.shouldThrowErrorSync( () => _.mapButConditional_( filter, null, [], '' ) );
}

//

function mapButConditionalDstMapNull_( test )
{
  var filter = ( dstContainer, srcContainer, key ) =>
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;
    if( dstContainer === key )
    return false;
    if( _.mapIs( dstContainer ) && key in dstContainer )
    return false;

    return true;
  }
  filter.identity = { propertyFilter : true, propertyTransformer : true };

  /* - */

  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapButConditional_( filter, null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapButConditionalDstMapMap_( test )
{
  var filter = ( dstContainer, srcContainer, key ) =>
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;
    if( dstContainer === key )
    return false;
    if( _.mapIs( dstContainer ) && key in dstContainer )
    return false;

    return true;
  }
  filter.identity = { propertyFilter : true, propertyTransformer : true };

  /* - */

  test.open( 'srcMap - map' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { aa : 1, bb : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var dstMap = { a : 1, b : 4 };
  var srcMap = { a : 1, b : 2, cc : [ 1, 2 ] };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 4 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : [ 1, 2 ] } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled map, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has not primitive, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled map, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has not primitive, butMap - filled array, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap =[ { a : 'a' }, 0, [ 'b' ], 1 ];
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapButConditional_( filter, dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ { a : 'a' }, 0, [ 'b' ], 1 ]);
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapBut( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut( srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapBut() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapBut( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapBut( [], [], {} ) );

  test.case = 'first argument is not an object-like';
  test.shouldThrowErrorSync( () => _.mapBut( 3, [] ) );

  test.case = 'second argument is not an object-like';
  test.shouldThrowErrorSync( () => _.mapBut( [], '' ) );
}

//

function mapButTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - array' );
  //
  // test.case = 'srcMap - empty map, butMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty map, butMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty map, butMap - filled map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty map, butMap - filled array';
  // var srcMap = [];
  // var screenMap = [ 'a', 0, 'b', 1 ];
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', 0, 'b', 1 ] );
  //
  // test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = [ 'a', 'b', 'c', 'd' ];
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );
  //
  // test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = { 0 : 'a', 2 : 'b' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ]
  // var screenMap = [ 'a', '3', 'b', '1' ];
  // var got = _.mapBut_( srcMap, screenMap );
  // var expected = { 0 : 'a', 2 : 'b' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, [ 'a', '3', 'b', '1' ] );
  //
  // test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapBut_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapBut_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapBut_( {}, {}, {}, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapBut_( 3, [] ) );
  // test.shouldThrowErrorSync( () => _.mapBut_( [], {}, {} ) ); /* qqq : for Dmytro : investigate */

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapBut_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapBut_( null, [], '' ) );
}

//

function mapButDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { cc : 3 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapButDstMapIsMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled map, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled array, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, cc : 3, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { aa : 1, bb : 2, cc : 3 };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : 3 } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled map, has identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled array, has identical keys';
  var dstMap = { a : 1, b : 4 };
  var srcMap = { a : 1, b : 2, cc : 3 };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 4, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : 3 } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled map, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has not identical keys, srcMap - filled map, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 0 : 'a', 1 : 0, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled map, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map, butMap - filled array, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ 'a', 0, 'b', 1 ]
  var screenMap = [ 'a', '3', 'b', '1' ];
  var got = _.mapBut_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ 'a', '3', 'b', '1' ] );

  test.close( 'srcMap - array' );
}

//

function mapButIgnoringUndefinesThreeArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { 0 : 1, 1 : 2, cc : undefined };
  var screenMap = [ 'aa', 0, 'bb', '1' ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', '1' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : undefined };
  var screenMap = { a : undefined, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : undefined, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = { 0 : 1, b : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  var expected = { b : 2 };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - array' );
  //
  // test.case = 'srcMap - empty map, butMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty map, butMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty map, butMap - filled map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty map, butMap - filled array';
  // var srcMap = [];
  // var screenMap = [ 'a', 0, 'b', 1 ];
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', 0, 'b', 1 ] );
  //
  // test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  // var srcMap = [ undefined, 0, undefined, 1 ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = { 1 : 0, 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  // var srcMap = [ undefined, 0, undefined, 1 ];
  // var screenMap = [ 'a', 'b', 'c', 'd' ];
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = { 1 : 0, 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  // test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );
  //
  // test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  // var srcMap = [ undefined, 0, undefined, 1 ];
  // var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  // test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  // var srcMap = [ undefined, 0, undefined, 1 ];
  // var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  // var got = _.mapButIgnoringUndefines_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  // test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );
  //
  // test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( {}, {}, {}, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( 3, [] ) );
  // test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( [], {}, {} ) ); /* qqq : for Dmytro : investigate */

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapButIgnoringUndefines_( null, [], '' ) );
}

//

function mapButIgnoringUndefinesDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = { 0 : 1, 1 : 2, cc : undefined };
  var screenMap = [ 'aa', 0, 'bb', '1' ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'aa', 0, 'bb', '1' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = { a : 1, b : 2, cc : undefined };
  var screenMap = { a : undefined, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : undefined, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = { 0 : 1, b : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapButIgnoringUndefines_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapButIgnoringUndefinesDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : undefined };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : undefined };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : undefined };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : undefined };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : undefined, bb : 2, cc : 3 };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { aa : 'some', c : 'key', bb : 2, cc : 3 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : undefined, bb : 2, cc : 3 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var dstMap = { aa : 'some', c : 'key' };
  var srcMap = { aa : 1, bb : 2, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, c : 'key' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { aa : 1, bb : 2, cc : undefined } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { 0 : 1, bb : 2, cc : undefined };
  var screenMap = [ 'aa', 0, 'bb', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, bb : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { 0 : 1, bb : 2, cc : undefined } );
  test.identical( screenMap, [ 'aa', 0, 'bb', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { a : 1, b : 2, cc : undefined };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : 2, cc : undefined } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var dstMap = { a : 1, b : 4 };
  var srcMap = { a : 1, b : undefined, cc : undefined };
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 4 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, { a : 1, b : undefined, cc : undefined } );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty map';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'dstMap - filled map, srcMap - empty map, butMap - empty array';
  var dstMap = { a : 1 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled map';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - empty pure map, srcMap - empty map, butMap - filled array';
  var dstMap = Object.create( null );
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled map, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has not identical keys, srcMap - filled map has undefined, butMap - filled array, not identical keys';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ undefined, 0, undefined, 1 ];;
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 1 : 0, 3 : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled map, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'dstMap - has identical keys, srcMap - filled map has undefined, butMap - filled array, has identical keys';
  var dstMap = { 0 : 'some', 2 : 'key', a : 1 };
  var srcMap = [ undefined, 0, undefined, 1 ];
  var screenMap = [ { 0 : 1 }, [ '3', 'b', '1', '3' ] ];
  var got = _.mapButIgnoringUndefines_( dstMap, srcMap, screenMap );
  var expected = { 0 : 'some', 2 : 'key', a : 1 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [ undefined, 0, undefined, 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, [ '3', 'b', '1', '3' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapOnlyOwnBut( test )
{

  test.case = 'an empty object';
  var got = _.mapOnlyOwnBut( {}, {} );
  var expected = {  };
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.mapOnlyOwnBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
  var expected = { c : 3 };
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.mapOnlyOwnBut( { a : 7, toString : 5 }, { b : 33, c : 77 } );
  var expected = { a : 7 };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnBut();
  });

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnBut( {} );
  });

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnBut( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnBut( 'wrong arguments' );
  });
}

//

function mapOnlyOwnButThreeArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, butMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, butMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, butMap - filled map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, butMap - filled array';
  var srcMap = null;
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'aa', 'bb', 'cc' ] );
  test.identical( got.aa, 1 );
  test.identical( Object.getPrototypeOf( got ), { bb : 2, cc : 3 } );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'a' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'aa', 'bb', 'cc' ] );
  test.identical( got.aa, 1 );
  test.identical( Object.getPrototypeOf( got ), { bb : 2, cc : 3 } );
  test.true( got === srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'aa' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'bb', 'cc' ] );
  test.identical( Object.getPrototypeOf( got ), { bb : 2, cc : 3 } );
  test.true( got === srcMap );
  test.identical( screenMap, [ { 'aa' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = { a : 1, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'bb', 'cc' ] );
  test.identical( Object.getPrototypeOf( got ), { bb : 2, cc : 3 } );
  test.true( got === srcMap );
  test.identical( screenMap, { a : 1, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'bb', 'cc' ] );
  test.identical( Object.getPrototypeOf( got ), { bb : 2, cc : 3 } );
  test.true( got === srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - array' );
  //
  // test.case = 'srcMap - empty map, butMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty map, butMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty map, butMap - filled map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty map, butMap - filled array';
  // var srcMap = [];
  // var screenMap = [ 'a', 0, 'b', 1 ];
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', 0, 'b', 1 ] );
  //
  // test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = { 1 : 0, 3 : 1, 0 : 'a', 2 : 'b' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = [ { 0 : 1 }, { 1 : 2 } ];
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = { 2 : 'b', 3 : 1 };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, [ { 0 : 1 }, { 1 : 2 } ] );
  //
  // test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = { 0 : 'a', 2 : 'b' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  // var srcMap = [ 'a', 0, 'b', 1 ];
  // var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  // var got = _.mapOnlyOwnBut_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  // test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );
  //
  // test.close( 'srcMap - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_( { a : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_( {}, {}, {}, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_( 3, [] ) );
  // test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_( [], {}, {} ) ); /* qqq : for Dmytro : investigate */

  test.case = 'wrong type of butMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwnBut_( null, [], '' ) );
}

//

function mapOnlyOwnButDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = { aa : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = { aa : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'aa' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'aa' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = { a : 1, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 1, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = { 1 : 0, 3 : 1, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 0 : 1 }, { 1 : 2 } ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = { 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, { 1 : 2 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = { 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapOnlyOwnBut_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapOnlyOwnButDstMapIsMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = {};
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 2;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 2, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 2;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 2, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.aa = 1;
  var screenMap = [ { 'aa' : 0 }, { 'bb' : 1 } ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'aa' : 0 }, { 'bb' : 1 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = { a : 1, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 1, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = Object.create( { bb : 2, cc : 3 } );
  srcMap.a = 1;
  var screenMap = [ { 'a' : 0 }, { 'b' : 1 } ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ { 'a' : 0 }, { 'b' : 1 } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - array' );

  test.case = 'srcMap - empty map, butMap - empty map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, butMap - empty array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, butMap - filled map';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, butMap - filled array';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [];
  var screenMap = [ 'a', 0, 'b', 1 ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', 0, 'b', 1 ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, not identical keys';
  var dstMap = { 0 : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { bb : 2, 1 : 0, 3 : 1, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, not identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 0 : 1 }, { 1 : 2 } ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, 2 : 'b', 3 : 1 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 0 : 1 }, { 1 : 2 } ] );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled map, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = { 1 : 13, 3 : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2, 0 : 'a', 2 : 'b' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, { 1 : 13, 3 : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - filled map has not onlyOwn property, butMap - filled array, has identical keys';
  var dstMap = { aa : 1, bb : 2 };
  var srcMap = [ 'a', 0, 'b', 1 ];
  var screenMap = [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ];
  var got = _.mapOnlyOwnBut_( dstMap, srcMap, screenMap );
  var expected = { aa : 1, bb : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ 'a', 0, 'b', 1 ] );
  test.identical( screenMap, [ { 1 : 'a' }, [ '3', 'b', '1', 'c' ] ] );

  test.close( 'srcMap - array' );
}

//

function mapOnly( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var got = _.mapOnly( srcMap );
  var expected = { d : 'name', c : 33, a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var got = _.mapOnly( srcMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { a : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnly( {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnly( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnly( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnly( 3, [] ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnly( [], '' ) );
}

//

function mapOnlyTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, screenMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, screenMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, screenMap - map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, screenMap - array';
  var srcMap = null;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var got = _.mapOnly_( srcMap );
  var expected = { d : 'name', c : 33, a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - long' );
  //
  // test.case = 'srcMap - empty array, screenMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty array, screenMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty array, screenMap - map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty array, screenMap - array';
  // var srcMap = [];
  // var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );
  //
  // test.case = 'screenMap - empty map';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var screenMap = {};
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'screenMap - empty array';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var screenMap = [];
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'only srcMap';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var got = _.mapOnly_( srcMap );
  // var expected = { a : 'abc', c : 33, d : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  //
  // test.case = 'all keys in srcMap exists in screenMap - map';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = { a : 'abc', c : 33, d : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'all keys in srcMap exists in screenMap - array';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = { a : 'abc', c : 33, d : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  // test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );
  //
  // test.case = 'none keys in srcMap exists in screenMap - map';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  // test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );
  //
  // test.case = 'none keys in srcMap exists in screenMap - array';
  // var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  // var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  // test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );
  //
  // test.case = 'srcMap has numerical keys, screenMap has not primitives';
  // var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  // var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  // var got = _.mapOnly_( srcMap, screenMap );
  // var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  // test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );
  //
  // test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnly_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnly_( {}, {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnly_( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( {}, 2, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnly_( 'wrong', {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( 2, {}, {} ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnly_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnly_( {}, [], '' ) );
}

//

function mapOnlyDstMapIsNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( null, srcMap, screenMap );
  var expected = { 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyDstMapIsMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { d : 'name', c : 33, a : 'abc' };
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { d : 'name', c : 33, a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = { 0 : 'name', 1 : 33, 2 : 'abc' };
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, { 0 : 'name', 1 : 33, 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = {};
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, { c : 33 }, { d : 'name' } ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { a : 'abc' }, { c : 33 }, { d : 'name' } ] );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnly_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2, 2 : 'abc', 1 : 33, 0 : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [ { 0 : 'name' }, { 1 : 33 }, { 2 : 'abc' } ] );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyOwnTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, screenMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, screenMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, screenMap - map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, screenMap - array';
  var srcMap = null;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = {};
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [] );

  test.case = 'only srcMap';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var got = _.mapOnlyOwn_( srcMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap.a, 'abc' );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( got.a, 'abc' );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( srcMap.a, 'abc' );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( got.a, 'abc' );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( srcMap.a, 'abc' );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ '2', 'd', 'c' ] );
  test.identical( got[ '2' ], 'abc' );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( srcMap[ '2' ], 'abc' );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - long' );
  //
  // test.case = 'srcMap - empty array, screenMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty array, screenMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty array, screenMap - map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty array, screenMap - array';
  // var srcMap = [];
  // var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );
  //
  // test.case = 'screenMap - empty map';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = {};
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, {} );
  //
  // test.case = 'screenMap - empty array';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [];
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [] );
  //
  // test.case = 'only srcMap';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var got = _.mapOnlyOwn_( srcMap );
  // var expected = { a : 'abc' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  //
  // test.case = 'all keys in srcMap exists in screenMap - map';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = { a : 'abc' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'all keys in srcMap exists in screenMap - array';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = { a : 'abc' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );
  //
  // test.case = 'none keys in srcMap exists in screenMap - map';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );
  //
  // test.case = 'none keys in srcMap exists in screenMap - array';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );
  //
  // test.case = 'srcMap has numerical keys, screenMap has not primitives';
  // var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  // var got = _.mapOnlyOwn_( srcMap, screenMap );
  // var expected = { a : 'abc' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc' } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );
  //
  // test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( {}, {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( {}, 2, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 'wrong', {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( 2, {}, {} ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyOwn_( {}, [], '' ) );
}

//

function mapOnlyOwnDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { 2 : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( null, srcMap, screenMap );
  var expected = { a : 'abc' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyOwnDstMapMap_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { 2 : 'abc', a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { 2 : 'abc' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : 1, b : 2 };
  var srcMap = [ { a : 'abc' }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyOwn_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc' } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyComplementingTwoArguments_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - null, screenMap - empty map';
  var srcMap = null;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - null, screenMap - empty array';
  var srcMap = null;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - null, screenMap - map';
  var srcMap = null;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - null, screenMap - array';
  var srcMap = null;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got === srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'a', 'b', 'd', 'c'  ] );
  test.identical( got.a, 'abc' );
  test.identical( got.b, undefined );
  test.true( got === srcMap );
  test.identical( srcMap.a, 'abc' );
  test.identical( srcMap.b, undefined );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'a', 'b', 'd', 'c'  ] );
  test.identical( got.a, 'abc' );
  test.identical( got.b, undefined );
  test.true( got === srcMap );
  test.identical( srcMap.a, 'abc' );
  test.identical( srcMap.b, undefined );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ 'd', 'c' ] );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap[ 2 ] = 'abc';
  srcMap.b = undefined;
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( srcMap, screenMap );
  test.identical( _.mapKeys( got ), [ '2', 'b', 'd', 'c' ] );
  test.identical( got[ '2' ], 'abc' );
  test.identical( got.b, undefined );
  test.identical( Object.getPrototypeOf( got ), { d : 'name', c : 33 } );
  test.true( got === srcMap );
  test.identical( srcMap[ '2' ], 'abc' );
  test.identical( srcMap.b, undefined );
  test.identical( Object.getPrototypeOf( srcMap ), { d : 'name', c : 33 } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  // test.open( 'srcMap - long' );
  //
  // test.case = 'srcMap - empty array, screenMap - empty map';
  // var srcMap = [];
  // var screenMap = {};
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, {} );
  //
  // test.case = 'srcMap - empty array, screenMap - empty array';
  // var srcMap = [];
  // var screenMap = [];
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [] );
  //
  // test.case = 'srcMap - empty array, screenMap - map';
  // var srcMap = [];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'srcMap - empty array, screenMap - array';
  // var srcMap = [];
  // var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap, [] );
  // test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );
  //
  // test.case = 'screenMap - empty map';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = {};
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, {} );
  //
  // test.case = 'screenMap - empty array';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [];
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [] );
  //
  // test.case = 'all keys in srcMap exists in screenMap - map';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = { a : 'abc', c : 33, d : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );
  //
  // test.case = 'all keys in srcMap exists in screenMap - array';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = { a : 'abc', c : 33, d : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );
  //
  // test.case = 'none keys in srcMap exists in screenMap - map';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );
  //
  // test.case = 'none keys in srcMap exists in screenMap - array';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );
  //
  // test.case = 'srcMap has numerical keys, screenMap has not primitives';
  // var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  // var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = { a : 'abc', c : 33, d : 'name' };
  // test.identical( got, expected );
  // test.true( got !== srcMap );
  // test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  // test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  // test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  // test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );
  //
  // test.close( 'srcMap - long' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( {}, {}, {}, {} ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( {}, 2, [] ) );

  test.case = 'wrong type of dstMap';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 'wrong', {}, {} ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( 2, {}, {} ) );

  test.case = 'wrong type of screenMap';
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( [], '' ) );
  test.shouldThrowErrorSync( () => _.mapOnlyComplementing_( {}, [], '' ) );
}

//

function mapOnlyComplementingDstMapNull_( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = Object.create( { d : undefined, c : 33 } );
  srcMap[ 2 ] = 'abc';
  srcMap.b = undefined;
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { 2 : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.contains( srcMap, { 2 : 'abc', b : undefined } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = {};
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : undefined } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( null, srcMap, screenMap );
  var expected = { a : 'abc', c : 33 };
  test.identical( got, expected );
  test.true( got !== srcMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : undefined } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function mapOnlyComplementing_DstMapMap( test )
{
  test.open( 'srcMap - map' );

  test.case = 'srcMap - empty map, screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty map, screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty map, screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty map, screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = {};
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, {} );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = Object.create( { d : 'name', c : 33 } );
  srcMap.a = 'abc';
  srcMap.b = undefined;
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { a : 'abc', b : undefined } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { 2 : undefined, b : 2 };
  var srcMap = Object.create( { d : undefined, c : 33 } );
  srcMap[ 2 ] = 'abc';
  srcMap.b = undefined;
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { 2 : 'abc', b : 2, c : 33 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.contains( srcMap, { 2 : 'abc', b : undefined } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - map' );

  /* - */

  test.open( 'srcMap - long' );

  test.case = 'srcMap - empty array, screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, {} );

  test.case = 'srcMap - empty array, screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [] );

  test.case = 'srcMap - empty array, screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'srcMap - empty array, screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap, [] );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'screenMap - empty map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = {};
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, {} );

  test.case = 'screenMap - empty array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [] );

  test.case = 'all keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  test.case = 'all keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33, d : 'name' };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'a', '13', { b : 77 }, 'c', '3', { d : 'name' } ] );

  test.case = 'none keys in srcMap exists in screenMap - map';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = { aa : 13, bb : 77, cc : 3, dd : 'name' };
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, { aa : 13, bb : 77, cc : 3, dd : 'name' } );

  test.case = 'none keys in srcMap exists in screenMap - array';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : 'name' } ) ];
  var screenMap = [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : undefined, b : 2 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : 'name' } );
  test.identical( screenMap, [ 'aa', '13', { bb : 77 }, 'cc', '3', { dd : 'name' } ] );

  test.case = 'srcMap has numerical keys, screenMap has not primitives';
  var dstMap = { a : undefined, b : 2 };
  var srcMap = [ { a : 'abc', b : undefined }, Object.create( { c : 33 } ), Object.create( { d : undefined } ) ];
  var screenMap = [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ];
  var got = _.mapOnlyComplementing_( dstMap, srcMap, screenMap );
  var expected = { a : 'abc', b : 2, c : 33 };
  test.identical( got, expected );
  test.true( got === dstMap );
  test.identical( srcMap[ 0 ], { a : 'abc', b : undefined } );
  test.identical( Object.getPrototypeOf( srcMap[ 1 ] ), { c : 33 } );
  test.identical( Object.getPrototypeOf( srcMap[ 2 ] ), { d : undefined } );
  test.identical( screenMap, [ { a : 13 }, { b : 77 }, { c : 3 }, { d : 'name' } ] );

  test.close( 'srcMap - long' );
}

//

function _mapOnly( test )
{

  test.case = 'an object';
  var options = {};
  options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
  options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
  var got = _._mapOnly( options );
  var expected = { a : 33, c : 33, name : 'Mikle' };
  test.identical( got, expected );

  test.case = 'an object2'
  var options = {};
  options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
  options.srcMaps = { d : 'name', c : 33, a : 'abc' };
  var got = _._mapOnly( options );
  var expected = { a : 'abc', c : 33, d : 'name' };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly();
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly( {}, 'wrong arguments' );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly( [] );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _._mapOnly( 'wrong arguments' );
  });

}

//

function mapsAreIdentical( test )
{

  test.case = 'same values';
  var got = _.mapsAreIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'not the same values in'
  var got = _.mapsAreIdentical( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 14 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the first argument'
  var got = _.mapsAreIdentical( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the second argument'
  var got = _.mapsAreIdentical( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var expected = false;
  test.identical( got, expected );

  /* special cases */

  test.case = 'empty maps, standrard'
  var got = _.mapsAreIdentical( {}, {} );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, pure'
  var got = _.mapsAreIdentical( Object.create( null ), Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, one standard another pure'
  var got = _.mapsAreIdentical( {}, Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  /* bad arguments */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical();
  });

  test.case = 'not object-like arguments';
  // test.shouldThrowErrorSync( function() /* qqq : for Dmytro : need to investigate, two different namespaces */
  // {
  //   _.mapsAreIdentical( [ 'a', 7, 'b', 13 ], [ 'a', 7, 'b', 14 ] );
  // });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( 'a', 'b' );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( 1, 3 );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( null, null );
  });
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( undefined, undefined );
  });

  test.case = 'too few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( {} );
  });

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapsAreIdentical( {}, {}, 'redundant argument' );
  });

}

//

function mapContain( test )
{

  test.case = 'first has same keys like second';
  var got = _.mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'in the array';
  var got = _.mapContain( [ 'a', 7, 'b', 13, 'c', 15 ], [ 'a', 7, 'b', 13 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number of keys in first not equal';
  var got = _.mapContain( { a : 1 }, { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapContain();
  });

  test.case = 'few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapContain( {} );
  });

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapContain( {}, {}, 'redundant argument' );
  });

}

//

function objectSatisfy( test )
{
  test.open( 'default option' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( template, src );
  test.identical( got, false );

  test.case = 'template is object, src identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( template, src );
  test.identical( got, true );

  /* */

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src } );
  test.identical( got, true );

  test.close( 'default option' );

  /* - */

  test.open( 'levels - 0' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0 } );
  test.identical( got, false );

  test.close( 'levels - 0' );

  /* - */

  test.open( 'levels - -1' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1 } );
  test.identical( got, false );

  test.close( 'levels - -1' );

  /* - */

  test.open( 'levels - 2' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var src = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2 } );
  test.identical( got, true );

  test.close( 'levels - 2' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.objectSatisfy() );

  test.case = 'o.template is not an object or a routine';
  test.shouldThrowErrorSync( () => _.objectSatisfy( 'wrong', { a : 2 } ) );
  test.shouldThrowErrorSync( () => _.objectSatisfy( { template : 'wrong', src : { a : 2 } } ) );

  test.case = 'o.src is undefined';
  test.shouldThrowErrorSync( () => _.objectSatisfy( { a : 2 }, undefined ) );
  test.shouldThrowErrorSync( () => _.objectSatisfy( { template : { a : 2 }, src : undefined } ) );

  test.case = 'map o has wrong fields';
  test.shouldThrowErrorSync( () => _.objectSatisfy( { template : { a : 2 }, wrong : { a : 2 } } ) );
}

//

function objectSatisfyOptionStrict( test )
{
  test.open( 'default option levels' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, strict : 0 } );
  test.identical( got, true );

  test.close( 'default option levels' );

  /* - */

  test.open( 'levels - 0' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 0, strict : 0 } );
  test.identical( got, false );

  test.close( 'levels - 0' );

  /* - */

  test.open( 'levels - -1' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var src = { a : { val : 1, identicalWith }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : -1, strict : 0 } );
  test.identical( got, false );

  test.close( 'levels - -1' );

  /* - */

  test.open( 'levels - 2' );

  test.case = 'template === src, values - undefined';
  var template = { a : undefined, b : undefined, c : undefined };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template === src';
  var template = { a : 1, b : 2, c : 3 };
  var src = template;
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'src is not an object';
  var template = { a : 1, b : 2, c : 3 };
  var src = 'wrong';
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, false );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template';
  var template = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : undefined, d : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src identical to template, without identicalWith';
  var template = { a : 1, b : 2, c : 3, identicalWith };
  var src = { a : 1, b : 2, c : 3, identicalWith };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, without identicalWith';
  var template = { a : { val : 1 }, b : 2, c : 3 };
  var src = { a : { val : 1 }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.case = 'template is object, src not identical to template, values is objects, with identicalWith';
  var identicalWith = () => true;
  var template = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var src = { a : { val : { identicalWith } }, b : 2, c : 3 };
  var got = _.objectSatisfy( { template, src, levels : 2, strict : 0 } );
  test.identical( got, true );

  test.close( 'levels - 2' );
}

//

function mapOnlyOwnKey( test )
{

  test.case = 'second argument is string';
  var got = _.mapOnlyOwnKey( { a : 7, b : 13 }, 'a' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'second argument is object';
  var got = _.mapOnlyOwnKey( { a : 7, b : 13 }, Object.create( null ).a = 'a' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'second argument is symbol';
  var symbol = Symbol( 'b' );
  var obj = { a : 7, [ symbol ] : 13 };
  var got = _.mapOnlyOwnKey( obj, symbol );
  var expected = true;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.mapOnlyOwnKey( Object.create( { a : 7, b : 13 } ), 'a' );
  var expected = false;
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKey();
  });

  test.case = 'few arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKey( {}, 'a', 'b' );
  });

  test.case = 'wrong type of key';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKey( [], 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKey( 1 );
  });

  test.case = 'wrong type of second argument';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKey( {}, 13 );
  });

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( function()
  {
    _.mapOnlyOwnKey( '', 7 );
  });

}

//

function mapHasAll( test )
{
  test.case = 'empty';
  var got = _.mapHasAll( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapHasAll( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapHasAll( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapHasAll( { a : 1, b : 2, c :  3 }, { b : 2 } );
  test.true( got );

  test.case = 'has all';
  var got = _.mapHasAll( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapHasAll( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAll( a, { a : 1 } );
  test.true( got );

  var got = _.mapHasAll( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapHasAll( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAll( a, { a : undefined } );
  test.true( got );

  var got = _.mapHasAll( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapHasAll( {}, { toString : 1 } );
  test.true( got );

  test.case = 'map has on proto';
  var a = {};
  var b = { a : 1 };
  Object.setPrototypeOf( a, b );
  var got = _.mapHasAll( a, { a : 1 } );
  test.true( got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAll( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAll( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAll( {}, {}, {} );
    });
  }

}

//

function mapHasAny( test )
{
  test.case = 'empty';
  var got = _.mapHasAny( {}, {} );
  test.true( !got );

  test.case = 'screen empty';
  var got = _.mapHasAny( { a : 1 }, {} );
  test.true( !got );

  test.case = 'same keys';
  var got = _.mapHasAny( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapHasAny( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( got );

  test.case = 'has all';
  var got = _.mapHasAny( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapHasAny( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( got );

  test.case = 'has no one';
  var got = _.mapHasAny( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAny( a, { a : 1 } );
  test.true( got );

  var got = _.mapHasAny( a, a );
  test.true( !got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapHasAny( src, screen );
  test.true( !got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasAny( a, { a : undefined } );
  test.true( got );

  var got = _.mapHasAny( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapHasAny( {}, { x : 1, toString : 1 } );
  test.true( got );

  test.case = 'map has on proto';
  var a = {};
  var b = { a : 1 };
  Object.setPrototypeOf( a, b );
  var got = _.mapHasAny( a, { a : 1, x : 1 } );
  test.true( got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAny( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAny( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasAny( {}, {}, {} );
    });
  }

}

//

function mapHasNone( test )
{
  test.case = 'empty';
  var got = _.mapHasNone( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapHasNone( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapHasNone( { a : 1 }, { a : 2 } );
  test.true( !got );

  test.case = 'has only one';
  var got = _.mapHasNone( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( !got );

  test.case = 'has all';
  var got = _.mapHasNone( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( !got );

  test.case = 'one is mising';
  var got = _.mapHasNone( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'has no one';
  var got = _.mapHasNone( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( got );

  test.case = 'src has non enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasNone( a, { a : 1 } );
  test.true( !got );

  var got = _.mapHasNone( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapHasNone( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapHasNone( a, { a : undefined } );
  test.true( !got );

  var got = _.mapHasNone( { a : undefined }, { a : undefined } );
  test.true( !got );

  test.case = 'src has toString on proto';
  var got = _.mapHasNone( {}, { x : 1, toString : 1 } );
  test.true( !got );

  test.case = 'map has on proto';
  var a = {};
  var b = { a : 1 };
  Object.setPrototypeOf( a, b );

  var got = _.mapHasNone( a, { x : 1 } );
  test.true( got );

  var got = _.mapHasNone( a, { a : 1 } );
  test.true( !got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasNone( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasNone( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapHasNone( {}, {}, {} );
    });
  }

}

//

function mapOnlyOwnAll( test )
{
  test.case = 'empty';
  var got = _.mapOnlyOwnAll( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapOnlyOwnAll( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapOnlyOwnAll( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapOnlyOwnAll( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( !got );

  test.case = 'has all';
  var got = _.mapOnlyOwnAll( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapOnlyOwnAll( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'has no one';
  var got = _.mapOnlyOwnAll( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOnlyOwnAll( a, { a : 1 } );
  test.true( got );

  var got = _.mapOnlyOwnAll( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapOnlyOwnAll( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOnlyOwnAll( a, { a : undefined } );
  test.true( got );

  var got = _.mapOnlyOwnAll( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapOnlyOwnAll( {}, { x : 1, toString : 1 } );
  test.true( !got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnAll( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnAll( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnAll( {}, {}, {} );
    });

    test.case = 'src is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOnlyOwnAll( a, { a : 1 } );
    });

    test.case = 'screen is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOnlyOwnAll( { a : 1 }, a );
    });
  }

}

//

function mapOnlyOwnAny( test )
{
  test.case = 'empty';
  var got = _.mapOnlyOwnAny( {}, {} );
  test.true( !got );

  test.case = 'screen empty';
  var got = _.mapOnlyOwnAny( { a : 1 }, {} );
  test.true( !got );

  test.case = 'same keys';
  var got = _.mapOnlyOwnAny( { a : 1 }, { a : 2 } );
  test.true( got );

  test.case = 'has only one';
  var got = _.mapOnlyOwnAny( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( got );

  test.case = 'has all';
  var got = _.mapOnlyOwnAny( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( got );

  test.case = 'one is mising';
  var got = _.mapOnlyOwnAny( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( got );

  test.case = 'has no one';
  var got = _.mapOnlyOwnAny( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( !got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOnlyOwnAny( a, { a : 1 } );
  test.true( got );

  var got = _.mapOnlyOwnAny( a, a );
  test.true( !got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapOnlyOwnAny( src, screen );
  test.true( !got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOnlyOwnAny( a, { a : undefined } );
  test.true( got );

  var got = _.mapOnlyOwnAny( { a : undefined }, { a : undefined } );
  test.true( got );

  test.case = 'src has toString on proto';
  var got = _.mapOnlyOwnAny( {}, { x : 1, toString : 1 } );
  test.true( !got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnAny( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnAny( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnAny( {}, {}, {} );
    });

    test.case = 'src is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOnlyOwnAny( a, { a : 1 } );
    });

    test.case = 'screen is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOnlyOwnAny( { a : 1 }, a );
    });
  }

}

//

function mapOnlyOwnNone( test )
{
  test.case = 'empty';
  var got = _.mapOnlyOwnNone( {}, {} );
  test.true( got );

  test.case = 'screen empty';
  var got = _.mapOnlyOwnNone( { a : 1 }, {} );
  test.true( got );

  test.case = 'same keys';
  var got = _.mapOnlyOwnNone( { a : 1 }, { a : 2 } );
  test.true( !got );

  test.case = 'has only one';
  var got = _.mapOnlyOwnNone( { a : 1, b : 2, c :  3 }, { b : 2, x : 1 } );
  test.true( !got );

  test.case = 'has all';
  var got = _.mapOnlyOwnNone( { a : 1, b : 2, c :  3 }, { b : 2, a : 3, c : 4 } );
  test.true( !got );

  test.case = 'one is mising';
  var got = _.mapOnlyOwnNone( { a : 1, b : 2 }, { b : 2, a : 3, c : 1 } );
  test.true( !got );

  test.case = 'has no one';
  var got = _.mapOnlyOwnNone( { a : 1, b : 2 }, { x : 1, y : 1 } );
  test.true( got );

  test.case = 'src has enumerable';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOnlyOwnNone( a, { a : 1 } );
  test.true( !got );

  var got = _.mapOnlyOwnNone( a, a );
  test.true( got );

  test.case = 'screen has enumerable';

  /* for..in skips enumerable */
  var src = { a : 1 };
  var screen = {};
  Object.defineProperty( screen, 'a', { enumerable : 0, value : 3 } );
  var got = _.mapOnlyOwnNone( src, screen );
  test.true( got );

  test.case = 'screen has undefined';
  var a = {};
  Object.defineProperty( a, 'a', { enumerable : 0 } );

  var got = _.mapOnlyOwnNone( a, { a : undefined } );
  test.true( !got );

  var got = _.mapOnlyOwnNone( { a : undefined }, { a : undefined } );
  test.true( !got );

  test.case = 'src has toString on proto';
  var got = _.mapOnlyOwnNone( {}, { x : 1, toString : 1 } );
  test.true( got );

  /* */

  if( Config.degub )
  {
    test.case = 'src is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnNone( 1, {} );
    });

    test.case = 'screen is no object like';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnNone( {}, 1 );
    });

    test.case = 'too much args';
    test.shouldThrowErrorSync( function()
    {
      _.mapOnlyOwnNone( {}, {}, {} );
    });

    test.case = 'src is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOnlyOwnNone( a, { a : 1 } );
    });

    test.case = 'screen is not a map';
    test.shouldThrowErrorSync( function()
    {
      var a = {};
      var b = { a : 1 };
      Object.setPrototypeOf( a, b )
      _.mapOnlyOwnNone( { a : 1 }, a );
    });
  }

}

// --
// sure
// --

function sureMapHasExactly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureHasExactly( srcMap, screenMap ), true );
  test.identical( _.map.sureHasExactly( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureHasExactly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureHasExactly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureHasExactly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasExactly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasExactly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasExactly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasExactly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasExactly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapOwnExactly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureOwnExactly( srcMap, screenMap ), true );
  test.identical( _.map.sureOwnExactly( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureOwnExactly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureOwnExactly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try /* qqq : use test.shouldThrowErrorSync() instead of try */
  {
    _.map.sureOwnExactly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnExactly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnExactly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnExactly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnExactly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnExactly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapHasOnly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureHasOnly( srcMap, screenMap ), true );
  test.identical( _.map.sureHasOnly( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureHasOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureHasOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureHasOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapOwnOnly( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureOwnOnly( srcMap, screenMap ), true );
  test.identical( _.map.sureOwnOnly( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureOwnOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureOwnOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureOwnOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapHasAll( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureHasAll( srcMap, screenMap ), true );
  test.identical( _.map.sureHasAll( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureHasAll( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureHasAll( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureHasAll( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have fields : "name"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasAll( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "name"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasAll( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "name"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasAll( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "name"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasAll( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "name"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasAll( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapOwnAll( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureOwnAll( srcMap, screenMap ), true );
  test.identical( _.map.sureOwnAll( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureOwnAll( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureOwnAll( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureOwnAll( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own fields : "name"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnAll( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "name"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnAll( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "name"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnAll( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "name"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnAll( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "name"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnAll( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapHasNone( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureHasNone( srcMap, screenMap ), true );
  test.identical( _.map.sureHasNone( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureHasNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureHasNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureHasNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have no fields : "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "a", "b", "c"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "a", "b", "c"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "a", "b", "c"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureHasNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

//

function sureMapOwnNone( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.sureOwnNone( srcMap, screenMap ), true );
  test.identical( _.map.sureOwnNone( srcMap, screenMap, msg ), true );
  test.identical( _.map.sureOwnNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.sureOwnNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.sureOwnNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own no fields : "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "a", "b", "c"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "a", "b", "c"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "a", "b", "c"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.sureOwnNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );
}

// --
// assert
// --

function assertMapHasFields( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasFields( srcMap, screenMap ), true );
  test.identical( _.map.assertHasFields( srcMap, screenMap, msg ), true );
  test.identical( _.map.assertHasFields( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.assertHasFields( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.assertHasFields( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasFields( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasFields( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasFields( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasFields( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasFields( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.map.assertHasFields( srcMap, screenMaps ) );
}

//

function assertMapOwnFields( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertOwnFields( srcMap, screenMap ), true );
  test.identical( _.map.assertOwnFields( srcMap, screenMap, msg ), true );
  test.identical( _.map.assertOwnFields( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.assertOwnFields( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.assertOwnFields( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnFields( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnFields( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnFields( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnFields( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnFields( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'different values';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.map.assertOwnFields( srcMap, screenMaps ) );
}

//

function assertMapHasOnly( test )
{
  test.open( 'correct input maps' );

  test.case = 'correct input, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  test.identical( _.map.assertHasOnly( srcMap, screenMap ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  test.case = 'correct input, msg - string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  test.case = 'correct input, msg - routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  test.case = 'correct input, msg - two strings';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, 'msg', 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  test.case = 'correct input, msg - routine and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  test.case = 'correct input, msg - string and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, 'msg', msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  test.case = 'correct input, msg - two routines';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, msg, msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'd' } );

  /* */

  test.case = 'correct input, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  test.identical( _.map.assertHasOnly( srcMap, screenMap ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'correct input, msg - string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  test.identical( _.map.assertHasOnly( srcMap, screenMap, 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'correct input, msg - routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'correct input, msg - two strings';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, 'msg', 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'correct input, msg - routine and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'correct input, msg - string and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, 'msg', msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.case = 'correct input, msg - two routines';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var screenMap = [ 'a', 'b', 'c', 'd' ];
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasOnly( srcMap, screenMap, msg, msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );
  test.identical( screenMap, [ 'a', 'b', 'c', 'd' ] );

  test.close( 'correct input maps' );

  /* - */

  test.open( 'wrong options' );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'Map.polluted should have no fields : "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  test.case = 'check error message, msg - string and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'msg', '90' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  test.case = 'check error message, msg - string and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'msg', msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  test.case = 'check error message, msg - routine and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, msg, 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  test.case = 'check error message, msg - routine and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' };
  var msg = () => { return srcMap.a + screenMaps.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, msg, msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, { 'a' : 13, 'b' : 77, 'c' : 3, 'e' : 'e' } );

  /* */

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'Map.polluted should have no fields : "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var msg = () => { return srcMap.a + screenMaps.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var msg = () => { return srcMap.a + srcMap.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.case = 'check error message, msg - string and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'msg', '90' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.case = 'check error message, msg - string and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var msg = () => { return srcMap.a + srcMap.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'msg', msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.case = 'check error message, msg - routine and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var msg = () => { return srcMap.a + srcMap.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, msg, 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.case = 'check error message, msg - routine and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [ 'a', 'b', 'c', 'e', 'f' ];
  var msg = () => { return srcMap.a + srcMap.b };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, msg, msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [ 'a', 'b', 'c', 'e', 'f' ] );

  test.close( 'wrong options' );

  /* - */

  test.case = 'screenMaps - empty, shold show all fields, msg - routine and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = {};
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'Fields :: "a", "b", "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'Fields ::' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, {} );

  test.case = 'screenMaps - empty, shold show all fields, msg - routine and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : 'd' };
  var screenMaps = [];
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'Fields :: "a", "b", "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps, 'Fields ::' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : 'd' } );
  test.identical( screenMaps, [] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( srcMap, screenMaps ) );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( { 'a' : 1 } ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( { 'a' : 1 }, { 'a' : 2 }, 'msg', 'msg', 'extra' ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( 'wrong', { 'a' : 2 } ) );

  test.case = 'wrong type of screenMaps';
  test.shouldThrowErrorSync( () => _.map.assertHasOnly( { 'a' : 1 }, 'wrong' ) );
}

//

function assertMapOwnOnly( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertOwnOnly( srcMap, screenMap ), true );
  test.identical( _.map.assertOwnOnly( srcMap, screenMap, msg ), true );
  test.identical( _.map.assertOwnOnly( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.assertOwnOnly( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.assertOwnOnly( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own no fields : "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnOnly( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnOnly( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnOnly( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnOnly( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnOnly( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.map.assertOwnOnly( srcMap, screenMaps ) );
}

//

function assertMapHasNone( test )
{
  var err;

  /* - */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertHasNone( srcMap, screenMap ), true );
  test.identical( _.map.assertHasNone( srcMap, screenMap, msg ), true );
  test.identical( _.map.assertHasNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.assertHasNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.assertHasNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have no fields : "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "a", "b", "c"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "a", "b", "c"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "a", "b", "c"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertHasNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.map.assertHasNone( srcMap, screenMaps ) );
}

//

function assertMapOwnNone( test )
{
  var err;

  /* */

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMap = { 'e' : 13, 'f' : 77, 'g' : 3, 'h' : 'Mikle' };
  var msg = () => { return srcMap.a + screenMaps.b };
  test.identical( _.map.assertOwnNone( srcMap, screenMap ), true );
  test.identical( _.map.assertOwnNone( srcMap, screenMap, msg ), true );
  test.identical( _.map.assertOwnNone( srcMap, screenMap, msg, 'msg' ), true );
  test.identical( _.map.assertOwnNone( srcMap, screenMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  try
  {
    _.map.assertOwnNone( srcMap, screenMaps )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should own no fields : "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnNone( srcMap, screenMaps, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "a", "b", "c"' );

  test.case = 'check error message, msg string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnNone( srcMap, screenMaps, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "a", "b", "c"' );

  test.case = 'check error message, msg string & msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnNone( srcMap, screenMaps, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "a", "b", "c"' );

  test.case = 'check error message, msg routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnNone( srcMap, screenMaps, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "a", "b", "c"' );

  test.case = 'check error message, five or more arguments';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  var msg = () => { return srcMap.a + screenMaps.b };
  try
  {
    _.map.assertOwnNone( srcMap, screenMaps, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects two, three or four arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'Config.debug === false';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Hello' };
  test.shouldThrowErrorSync( () => _.map.assertOwnNone( srcMap, screenMaps ) );
}

//

function sureMapHasNoUndefine( test )
{
  var err;

  test.case = 'correct input';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3, 'd' : 'Mikle' };
  var msg = () => { return srcMap.a + srcMap.b };
  test.identical( _.map.sureHasNoUndefine( srcMap), true );
  test.identical( _.map.sureHasNoUndefine( srcMap, msg ), true );
  test.identical( _.map.sureHasNoUndefine( srcMap, msg, 'msg' ), true );
  test.identical( _.map.sureHasNoUndefine( srcMap, () => 'This is ' + 'explanation' ), true );

  test.case = 'check error message, no msg';
  var otherMap = { 'd' : undefined };
  try
  {
    _.map.sureHasNoUndefine( otherMap )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Map.polluted should have no undefines, but has : "d"' );

  test.case = 'check error message, msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.map.sureHasNoUndefine( otherMap, msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, '90 "d"' );

  test.case = 'check error message, msg string';
  var otherMap = { 'd' : undefined };
  try
  {
    _.map.sureHasNoUndefine( otherMap, 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg "d"' );

  test.case = 'check error message, msg string & msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.map.sureHasNoUndefine( otherMap, 'msg', msg )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'msg 90 "d"' );

  test.case = 'check error message, msg routine';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.map.sureHasNoUndefine( otherMap, () => 'This is ' + 'explanation' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'This is explanation "d"' );

  test.case = 'check error message, four or more arguments';
  var otherMap = { 'd' : undefined };
  var msg = () => { return srcMap.a + srcMap.b };
  try
  {
    _.map.sureHasNoUndefine( srcMap, msg, 'msg', 'msg' )
  }
  catch( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );
  test.identical( err.originalMessage, 'Expects one, two or three arguments' );
}

//

function assertMapHasNoUndefine( test )
{
  test.open( 'correct map' );

  test.case = 'without message';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  test.identical( _.map.assertHasNoUndefine( srcMap ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  test.case = 'message - string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  test.identical( _.map.assertHasNoUndefine( srcMap, 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  test.case = 'message - routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  test.case = 'message - two strings';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  test.identical( _.map.assertHasNoUndefine( srcMap, 'msg', 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  test.case = 'message - string and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, 'msg', msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  test.case = 'message - routine and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, msg, 'msg' ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  test.case = 'message - two routines';
  var srcMap = { 'a' : 13, 'b' : 77, 'c' : 3 };
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, msg, msg ), true );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'c' : 3 } );

  /* */

  test.case = 'array, without message';
  var srcMap = [ 0, 'a', null ];
  test.identical( _.map.assertHasNoUndefine( srcMap ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.case = 'array, message - string';
  var srcMap = [ 0, 'a', null ];
  test.identical( _.map.assertHasNoUndefine( srcMap, 'msg' ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.case = 'array, message - routine';
  var srcMap = [ 0, 'a', null ];
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, msg ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.case = 'array, message - two strings';
  var srcMap = [ 0, 'a', null ];
  test.identical( _.map.assertHasNoUndefine( srcMap, 'msg', 'msg' ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.case = 'array, message - string and routine';
  var srcMap = [ 0, 'a', null ];
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, 'msg', msg ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.case = 'array, message - routine and string';
  var srcMap = [ 0, 'a', null ];
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, msg, 'msg' ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.case = 'array, message - two routines';
  var srcMap = [ 0, 'a', null ];
  var msg = () => srcMap.a + srcMap.b;
  test.identical( _.map.assertHasNoUndefine( srcMap, msg, msg ), true );
  test.identical( srcMap, [ 0, 'a', null ] );

  test.close( 'correct map' );

  /* - */

  test.open( 'map with undefined' );

  test.case = 'without message';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'Map.polluted should have no undefines, but has : "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  test.case = 'message - string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  test.case = 'message - routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var msg = () => srcMap.a + srcMap.b;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  test.case = 'message - two strings';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, 'msg', 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  test.case = 'message - string and routine';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var msg = () => srcMap.a + srcMap.b;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, 'msg', msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  test.case = 'message - routine and string';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var msg = () => srcMap.a + srcMap.b;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 msg "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, msg, 'msg' ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  test.case = 'message - two routines';
  var srcMap = { 'a' : 13, 'b' : 77, 'd' : undefined };
  var msg = () => srcMap.a + srcMap.b;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 90 "d"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, msg, msg ), errCallback );
  test.identical( srcMap, { 'a' : 13, 'b' : 77, 'd' : undefined } );

  /* */

  test.case = 'array, without message';
  var srcMap = [ 0, 'a', undefined ];
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'Array should have no undefines, but has : "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.case = 'array, message - string';
  var srcMap = [ 0, 'a', undefined ];
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, 'msg' ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.case = 'array, message - routine';
  var srcMap = [ 0, 'a', undefined ];
  var msg = () => 90;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, msg ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.case = 'array, message - two strings';
  var srcMap = [ 0, 'a', undefined ];
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg msg "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, 'msg', 'msg' ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.case = 'array, message - string and routine';
  var srcMap = [ 0, 'a', undefined ];
  var msg = () => 90;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, 'msg 90 "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, 'msg', msg ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.case = 'array, message - routine and string';
  var srcMap = [ 0, 'a', undefined ];
  var msg = () => 90;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 msg "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, msg, 'msg' ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.case = 'array, message - two routines';
  var srcMap = [ 0, 'a', undefined ];
  var msg = () => 90;
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( err.originalMessage, '90 90 "2"' );
  };
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( srcMap, msg, msg ), errCallback );
  test.identical( srcMap, [ 0, 'a', undefined ] );

  test.close( 'map with undefined' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( { a : 1 }, 'msg', 'msg', 'extra' ) );

  test.case = 'wrong type of srcMap';
  test.shouldThrowErrorSync( () => _.map.assertHasNoUndefine( 'wrong' ) );
}

// --
// define test suite
// --

let Self =
{

  name : 'Tools.Map',
  silencing : 1,

  tests :
  {

    // map checker l0/l3/Map.s

    typingBasic, /* qqq : extend */
    // typingObject,
    /* qqq : write an article with the list of all types of the module */

    // map move

    mapCloneAssigning,

    mapExtend,
    mapExtendConditional,
    mapExtendNotIdentical,
    mapsExtend,
    mapsExtendWithVectorsInSrcMaps,
    mapSupplement,
    mapComplement,

    //

    mapMake,
    mapMakeBugWithArray,

    // map manipulator

    objectSetWithKeys,
    objectSetWithKeysKeyIsVector,
    objectSetWithKeyStrictly,
    objectSetWithKeyStrictlyKeyIsVector,
    mapDelete,
    mapEmpty,
    mapInvert,

    // map convert

    mapsFlatten,

    mapFirstPair,
    mapValWithIndex,
    mapKeyWithIndex,
    mapToArray,
    mapToStr,

    // map properties

    mapKeys,
    mapOnlyOwnKeys,
    mapAllKeys,

    mapVals,
    mapOnlyOwnVals,
    mapAllVals,

    mapPairs,
    mapOnlyOwnPairs,
    mapAllPairs,

    // hash map

    hashMapExtend,

    // map selector

    mapOnlyPrimitives,

    // map logic

    mapButConditional,

    mapButConditionalThreeArguments_,
    mapButConditionalDstMapNull_,
    mapButConditionalDstMapMap_,

    mapBut,

    mapButTwoArguments_,
    mapButDstMapNull_,
    mapButDstMapIsMap_,

    mapButIgnoringUndefinesThreeArguments_,
    mapButIgnoringUndefinesDstMapNull_,
    mapButIgnoringUndefinesDstMapMap_,

    mapOnlyOwnBut,

    mapOnlyOwnButThreeArguments_,
    mapOnlyOwnButDstMapNull_,
    mapOnlyOwnButDstMapIsMap_,

    mapOnly,

    mapOnlyTwoArguments_,
    mapOnlyDstMapIsNull_,
    mapOnlyDstMapIsMap_,

    mapOnlyOwnTwoArguments_,
    mapOnlyOwnDstMapNull_,
    mapOnlyOwnDstMapMap_,

    mapOnlyComplementingTwoArguments_,
    mapOnlyComplementingDstMapNull_,
    mapOnlyComplementing_DstMapMap,

    _mapOnly,

    mapsAreIdentical,
    mapContain,

    objectSatisfy,
    objectSatisfyOptionStrict,

    mapOnlyOwnKey,

    mapHasAll,
    mapHasAny,
    mapHasNone,

    mapOnlyOwnAll,
    mapOnlyOwnAny,
    mapOnlyOwnNone,

    // test sureMap*

    sureMapHasExactly,
    sureMapOwnExactly,

    sureMapHasOnly,
    sureMapOwnOnly,

    sureMapHasAll,
    sureMapOwnAll,

    sureMapHasNone,
    sureMapOwnNone,

    // test assertMap*

    assertMapHasFields,
    assertMapOwnFields,

    assertMapHasOnly,
    assertMapOwnOnly,

    assertMapHasNone,
    assertMapOwnNone,

    sureMapHasNoUndefine,
    assertMapHasNoUndefine,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
