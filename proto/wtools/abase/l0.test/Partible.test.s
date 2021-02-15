( function _Partible_test_s_()
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

function typing( test ) /* qqq for Yevhen : extend for like. first discuss ( file Partible.tests.s ) */
{

  /* */

  test.case = `primitive - str`;
  var src = 'abc';
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `primitive - bool`;
  var src = true;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `primitive - number`;
  var src = 1;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `routine`;
  var src = routine;
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `raw buffer`;
  var src = new BufferRaw( 13 );
  test.true( !_.partible.like( src ) );
  test.true( !_.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `partiable`;
  var src = new partiableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `partiable made`;
  var src = partiableMake( null, { elements : [ '1', '10' ], withIterator : 1 } );
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `vector`;
  var src = new partiableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `typed buffer`;
  var src = new F32x([ 0, 10 ]);
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( !_.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `arguments array`;
  var src = _.argumentsArrayMake();
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

  test.case = `array`;
  var src = [ 1, 3 ];
  test.true( _.partible.like( src ) );
  test.true( _.partible.is( src ) );
  test.true( _.vector.like( src ) );
  test.true( _.vector.is( src ) );
  test.true( _.longLike( src ) );
  test.true( _.longIs( src ) );
  test.true( _.arrayLike( src ) );
  test.true( _.arrayIs( src ) );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function partiableConstructor( o )
  {
    return partiableMake( this, o );
  }

  /* */

  function partiableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  /* */

  function routine () {}

}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Partible',
  silencing : 1,

  tests :
  {

    typing,
    /* xxx qqq : write test routine typingObject and use _.objectForTesting() */

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
