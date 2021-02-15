( function _Constructible_test_s_()
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

function typingBasic( test ) /* qqq for Yevhen : extend */
{

  test.case = 'str';
  var src = 'str';
  test.true( !_.constructibleIs( src ) );
  test.true( !_.objectIs( src ) );
  test.true( !_.objectLike( src ) );
  test.true( !_.mapIs( src ) );
  test.true( !_.mapLike( src ) );
  test.true( !_.mapLikePrototyped( src ) );
  test.true( !_.mapIsPure( src ) );
  test.true( !_.mapIsPolluted( src ) );
  test.true( !_.mapLikePolluted( src ) );

  test.case = 'number';
  var src = 13;
  test.true( !_.constructibleIs( src ) );
  test.true( !_.objectIs( src ) );
  test.true( !_.objectLike( src ) );
  test.true( !_.mapIs( src ) );
  test.true( !_.mapLike( src ) );
  test.true( !_.mapLikePrototyped( src ) );
  test.true( !_.mapIsPure( src ) );
  test.true( !_.mapIsPolluted( src ) );
  test.true( !_.mapLikePolluted( src ) );

  test.case = 'pure map';
  var src = Object.create( null );
  test.true( !_.constructibleIs( src ) );
  test.true( _.objectIs( src ) );
  test.true( _.objectLike( src ) );
  test.true( _.mapIs( src ) );
  test.true( _.mapLike( src ) );
  test.true( !_.mapLikePrototyped( src ) );
  test.true( _.mapIsPure( src ) );
  test.true( !_.mapIsPolluted( src ) );
  test.true( !_.mapLikePolluted( src ) );

  test.case = 'polluted map';
  var src = {};
  test.true( !_.constructibleIs( src ) );
  test.true( _.objectIs( src ) );
  test.true( _.objectLike( src ) );
  test.true( _.mapIs( src ) );
  test.true( _.mapLike( src ) );
  test.true( !_.mapLikePrototyped( src ) );
  test.true( !_.mapIsPure( src ) );
  test.true( _.mapIsPolluted( src ) );
  test.true( _.mapLikePolluted( src ) );

  test.case = 'regexp';
  var src = /abc/;
  test.true( _.constructibleIs( src ) );
  test.true( !_.objectIs( src ) );
  test.true( _.objectLike( src ) );
  test.true( !_.mapIs( src ) );
  test.true( !_.mapLike( src ) );
  test.true( !_.mapLikePrototyped( src ) );
  test.true( !_.mapIsPure( src ) );
  test.true( !_.mapIsPolluted( src ) );
  test.true( !_.mapLikePolluted( src ) );

  test.case = 'date';
  var src = new Date();
  test.true( _.constructibleIs( src ) );
  test.true( !_.objectIs( src ) );
  test.true( _.objectLike( src ) );
  test.true( !_.mapIs( src ) );
  test.true( !_.mapLike( src ) );
  test.true( !_.mapLikePrototyped( src ) );
  test.true( !_.mapIsPure( src ) );
  test.true( !_.mapIsPolluted( src ) );
  test.true( !_.mapLikePolluted( src ) );

}

//

function typingObject( test ) /* qqq for Yevhen : extend */
{

  let sets =
  {
    withIterator : [ 0, 1 ],
    pure : [ 0, 1 ],
    withOwnConstructor : [ 0, 1 ],
    withConstructor : [ 0, 1 ],
    new : [ 0, 1 ],
  };
  let samples = _.eachSample({ sets });

  for( let env of samples )
  eachCase( env );

  function eachCase( env )
  {

    /* - */

    if( !env.new )
    {
      test.case = `${toStr( env )}`;
      var src = _.objectForTesting( { elements : [ '1', '10' ], ... env } );
      test.true( !_.constructibleIs( src ) );

      test.identical( _.objectIs( src ), true );
      test.identical( _.objectLike( src ), true );
      test.identical( _.mapIs( src ), !env.withIterator );
      test.identical( _.mapLike( src ), !env.withIterator );
      test.identical( _.mapLikePrototyped( src ), false );
      test.identical( _.mapIsPure( src ), !!env.pure && !env.withIterator );
      test.identical( _.mapIsPolluted( src ), !env.pure && !env.withIterator );
      test.identical( _.mapLikePolluted( src ), !env.pure && !env.withIterator );

    }

    /* - */

    if( env.new )
    {
      test.case = `${toStr( env )}`;
      // if( env.withIterator === 0 && env.pure === 0 && env.withOwnConstructor === 0 && env.withConstructor === 0 )
      // debugger;
      var src = _.objectForTesting( { elements : [ '1', '10' ], ... env } );

      test.true( !_.constructibleIs( src ) ^ !!env.withConstructor );

      test.identical( _.objectIs( src ), true );
      test.identical( _.objectLike( src ), true );
      test.identical( _.mapIs( src ), false );
      test.identical( _.mapLike( src ), !env.withIterator && !env.withConstructor );
      test.identical( _.mapLikePrototyped( src ), !env.withIterator && !env.withConstructor );
      test.identical( _.mapIsPure( src ), false );
      test.identical( _.mapIsPolluted( src ), false );
      test.identical( _.mapLikePolluted( src ), !env.pure && !env.withIterator && !env.withConstructor );

    }

    /* - */

  }

  function toStr( src )
  {
    return _globals_.testing.wTools.toStrSolo( src );
  }

}

//

/* qqq : wrote very good test for objectIs */
/* qqq  : use test.true() instead of test.identical() */
function objectLike( test ) /* qqq : rewrote the test */
{
  test.description = 'array-like entities should not overlap with array-like entities set';

  test.identical( _.objectLike( new ArrayBuffer( 10 ) ), true );
  test.identical( _.objectLike( new Float32Array( 10 ) ), false );
  test.identical( _.objectLike( new DataView( new ArrayBuffer( 10 ) ) ), true );
  test.identical( _.objectLike( new Array( 10 ) ), false );
  test.identical( _.objectLike( [ 1, 2, 3 ] ), false );
  test.identical( _.objectLike( new Map ), false );

  test.description = 'this entities are object-like';

  test.identical( _.objectLike( _global_ ), true );
  test.identical( _.objectLike( {} ), true );
  test.identical( _.objectLike( Object.create( null ) ), true );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Constructible',
  silencing : 1,

  tests :
  {

    typingBasic,
    typingObject,
    objectLike,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
